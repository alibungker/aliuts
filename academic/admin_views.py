from django.contrib import admin
from django.shortcuts import render
from .models import Fakultas, ProgramStudi, Mahasiswa, Dosen, MataKuliah, Ruang
from django.db.models import Count

@admin.register(Fakultas)
class FakultasAdmin(admin.ModelAdmin):
    list_display = ('kode_fakultas', 'nama_fakultas', 'dekan', 'get_program_count', 'get_student_count', 'created_display')
    list_filter = ('created_at',)
    search_fields = ('kode_fakultas', 'nama_fakultas', 'dekan')
    ordering = ('kode_fakultas',)
    change_form_template = 'admin/change_form.html'
    add_form_template = 'admin/change_form.html'

    def get_program_count(self, obj):
        count = obj.programstudi_set.count()
        color = 'success' if count > 0 else 'secondary'
        return f'<span class="badge bg-{color}">{count} Program</span>'
    get_program_count.short_description = 'Program Studi'
    get_program_count.allow_tags = True

    def get_student_count(self, obj):
        # Count students through program studi
        count = Mahasiswa.objects.filter(program_studi__fakultas=obj).count()
        color = 'primary' if count > 0 else 'secondary'
        return f'<span class="badge bg-{color}">{count} Mahasiswa</span>'
    get_student_count.short_description = 'Mahasiswa'
    get_student_count.allow_tags = True

    def created_display(self, obj):
        return obj.created_at.strftime('%d/%m/%Y') if obj.created_at else '-'
    created_display.short_description = 'Dibuat'

    def get_readonly_fields(self, request, obj=None):
        if obj is not None and not request.user.is_superuser:
            return ['kode_fakultas', 'nama_fakultas']
        return None

    def changelist_view(self, request, extra_context=None):
        # Calculate aggregate statistics
        fakultas_qs = Fakultas.objects.annotate(
            program_count=Count('programstudi'),
            student_count=Count('programstudi__mahasiswa')
        ).order_by('kode_fakultas')

        total_programs = sum(f.program_count for f in fakultas_qs)
        total_students = sum(f.student_count for f in fakultas_qs)
        avg_programs = total_programs / fakultas_qs.count() if fakultas_qs.count() > 0 else 0

        # Add custom context
        extra_context = extra_context or {}
        extra_context['show_custom_table'] = True
        extra_context['fakultas_data'] = fakultas_qs
        extra_context['total_programs'] = total_programs
        extra_context['total_students'] = total_students
        extra_context['avg_programs'] = round(avg_programs, 1)
        # Override the template to use our custom fakultas list template
        self.change_list_template = 'admin/fakultas_list.html'
        return super().changelist_view(request, extra_context)

# Register other models with enhanced display
@admin.register(ProgramStudi)
class ProgramStudiAdmin(admin.ModelAdmin):
    list_display = ('kode_prodi', 'nama_prodi', 'fakultas', 'jenjang', 'kaprodi', 'get_student_count')
    list_filter = ('fakultas', 'jenjang')
    search_fields = ('kode_prodi', 'nama_prodi', 'kaprodi')
    change_form_template = 'admin/change_form.html'
    add_form_template = 'admin/change_form.html'

    def get_student_count(self, obj):
        count = obj.mahasiswa_set.count()
        color = 'primary' if count > 0 else 'secondary'
        return f'<span class="badge bg-{color}">{count}</span>'
    get_student_count.short_description = 'Mahasiswa'
    get_student_count.allow_tags = True

    def changelist_view(self, request, extra_context=None):
        # Calculate aggregate statistics
        prodi_qs = ProgramStudi.objects.annotate(
            student_count=Count('mahasiswa'),
            dosen_count=Count('dosen'),
            mk_count=Count('matakuliah')
        ).order_by('kode_prodi')

        total_prodi = prodi_qs.count()
        total_students = sum(f.student_count for f in prodi_qs)
        total_dosen = sum(f.dosen_count for f in prodi_qs)
        total_mk = sum(f.mk_count for f in prodi_qs)

        # Group by fakultas
        fakultas_stats = {}
        for prodi in prodi_qs:
            fakultas_name = prodi.fakultas.nama_fakultas if prodi.fakultas else 'Tanpa Fakultas'
            if fakultas_name not in fakultas_stats:
                fakultas_stats[fakultas_name] = {'count': 0, 'students': 0, 'dosen': 0, 'mk': 0}
            fakultas_stats[fakultas_name]['count'] += 1
            fakultas_stats[fakultas_name]['students'] += prodi.student_count
            fakultas_stats[fakultas_name]['dosen'] += prodi.dosen_count
            fakultas_stats[fakultas_name]['mk'] += prodi.mk_count

        # Add custom context
        extra_context = extra_context or {}
        extra_context['show_custom_table'] = True
        extra_context['prodi_data'] = prodi_qs
        extra_context['total_prodi'] = total_prodi
        extra_context['total_students'] = total_students
        extra_context['total_dosen'] = total_dosen
        extra_context['total_mk'] = total_mk
        extra_context['fakultas_stats'] = fakultas_stats
        # Override the template
        self.change_list_template = 'admin/programstudi_list.html'
        return super().changelist_view(request, extra_context)

@admin.register(Dosen)
class DosenAdmin(admin.ModelAdmin):
    list_display = ('nama', 'nidn', 'program_studi', 'jabatan', 'get_class_count')
    list_filter = ('program_studi', 'jabatan')
    search_fields = ('nama', 'nidn')
    change_form_template = 'admin/change_form.html'
    add_form_template = 'admin/change_form.html'

    def get_class_count(self, obj):
        count = obj.kelas_set.count()
        color = 'success' if count > 0 else 'secondary'
        return f'<span class="badge bg-{color}">{count}</span>'
    get_class_count.short_description = 'Kelas'
    get_class_count.allow_tags = True

    def changelist_view(self, request, extra_context=None):
        # Calculate aggregate statistics
        dosen_qs = Dosen.objects.annotate(
            class_count=Count('kelas')
        ).select_related('program_studi').order_by('nama')

        total_dosen = dosen_qs.count()
        total_classes = sum(f.class_count for f in dosen_qs)
        avg_classes = total_classes / total_dosen if total_dosen > 0 else 0

        # Group by jabatan
        jabatan_stats = {}
        for dosen in dosen_qs:
            jabatan = dosen.jabatan or 'Tanpa Jabatan'
            if jabatan not in jabatan_stats:
                jabatan_stats[jabatan] = {'count': 0, 'classes': 0}
            jabatan_stats[jabatan]['count'] += 1
            jabatan_stats[jabatan]['classes'] += dosen.class_count

        # Group by program studi
        prodi_stats = {}
        for dosen in dosen_qs:
            prodi_name = dosen.program_studi.nama_prodi if dosen.program_studi else 'Tanpa Prodi'
            if prodi_name not in prodi_stats:
                prodi_stats[prodi_name] = {'count': 0, 'classes': 0}
            prodi_stats[prodi_name]['count'] += 1
            prodi_stats[prodi_name]['classes'] += dosen.class_count

        # Add custom context
        extra_context = extra_context or {}
        extra_context['show_custom_table'] = True
        extra_context['dosen_data'] = dosen_qs
        extra_context['total_dosen'] = total_dosen
        extra_context['total_classes'] = total_classes
        extra_context['avg_classes'] = round(avg_classes, 1)
        extra_context['jabatan_stats'] = jabatan_stats
        extra_context['prodi_stats'] = prodi_stats
        # Override the template
        self.change_list_template = 'admin/dosen_list.html'
        return super().changelist_view(request, extra_context)

@admin.register(Mahasiswa)
class MahasiswaAdmin(admin.ModelAdmin):
    list_display = ('nim', 'nama', 'program_studi', 'angkatan', 'status_mahasiswa_display')
    list_filter = ('program_studi', 'angkatan', 'status_mahasiswa', 'jenis_kelamin')
    search_fields = ('nim', 'nama')
    change_form_template = 'admin/change_form.html'
    add_form_template = 'admin/change_form.html'

    def status_mahasiswa_display(self, obj):
        colors = {
            'Aktif': 'success',
            'Cuti': 'warning',
            'Lulus': 'info',
            'DO': 'danger',
            'Mengundurkan Diri': 'secondary'
        }
        color = colors.get(obj.status_mahasiswa, 'secondary')
        return f'<span class="badge bg-{color}">{obj.status_mahasiswa}</span>'
    status_mahasiswa_display.short_description = 'Status'
    status_mahasiswa_display.allow_tags = True

    def changelist_view(self, request, extra_context=None):
        # Calculate aggregate statistics
        mahasiswa_qs = Mahasiswa.objects.select_related('program_studi').order_by('nim')

        total_mahasiswa = mahasiswa_qs.count()

        # Group by status
        status_stats = {}
        for mhs in mahasiswa_qs:
            status = mhs.status_mahasiswa or 'Tidak Diketahui'
            if status not in status_stats:
                status_stats[status] = 0
            status_stats[status] += 1

        # Group by angkatan
        angkatan_stats = {}
        for mhs in mahasiswa_qs:
            angkatan = str(mhs.angkatan) if mhs.angkatan else 'Tidak Diketahui'
            if angkatan not in angkatan_stats:
                angkatan_stats[angkatan] = 0
            angkatan_stats[angkatan] += 1

        # Group by program studi
        prodi_stats = {}
        for mhs in mahasiswa_qs:
            prodi_name = mhs.program_studi.nama_prodi if mhs.program_studi else 'Tanpa Prodi'
            if prodi_name not in prodi_stats:
                prodi_stats[prodi_name] = 0
            prodi_stats[prodi_name] += 1

        # Group by jenis kelamin
        gender_stats = {}
        for mhs in mahasiswa_qs:
            gender = mhs.jenis_kelamin or 'Tidak Diketahui'
            if gender not in gender_stats:
                gender_stats[gender] = 0
            gender_stats[gender] += 1

        # Add custom context
        extra_context = extra_context or {}
        extra_context['show_custom_table'] = True
        extra_context['mahasiswa_data'] = mahasiswa_qs
        extra_context['total_mahasiswa'] = total_mahasiswa
        extra_context['status_stats'] = status_stats
        extra_context['angkatan_stats'] = angkatan_stats
        extra_context['prodi_stats'] = prodi_stats
        extra_context['gender_stats'] = gender_stats
        # Override the template
        self.change_list_template = 'admin/mahasiswa_list.html'
        return super().changelist_view(request, extra_context)

@admin.register(MataKuliah)
class MataKuliahAdmin(admin.ModelAdmin):
    list_display = ('kode_mk', 'nama_mk', 'program_studi', 'sks', 'semester', 'get_class_count')
    list_filter = ('program_studi', 'semester')
    search_fields = ('kode_mk', 'nama_mk')
    change_form_template = 'admin/change_form.html'
    add_form_template = 'admin/change_form.html'

    def get_class_count(self, obj):
        count = obj.kelas_set.count()
        color = 'info' if count > 0 else 'secondary'
        return f'<span class="badge bg-{color}">{count}</span>'
    get_class_count.short_description = 'Kelas'
    get_class_count.allow_tags = True

    def changelist_view(self, request, extra_context=None):
        # Calculate aggregate statistics
        mk_qs = MataKuliah.objects.annotate(
            class_count=Count('kelas')
        ).select_related('program_studi').order_by('kode_mk')

        total_mk = mk_qs.count()
        total_classes = sum(f.class_count for f in mk_qs)
        total_sks = sum(f.sks for f in mk_qs)
        avg_sks = total_sks / total_mk if total_mk > 0 else 0

        # Group by semester
        semester_stats = {}
        for mk in mk_qs:
            semester = str(mk.semester) if mk.semester else 'Tidak Diketahui'
            if semester not in semester_stats:
                semester_stats[semester] = {'count': 0, 'sks': 0}
            semester_stats[semester]['count'] += 1
            semester_stats[semester]['sks'] += mk.sks

        # Group by program studi
        prodi_stats = {}
        for mk in mk_qs:
            prodi_name = mk.program_studi.nama_prodi if mk.program_studi else 'Tanpa Prodi'
            if prodi_name not in prodi_stats:
                prodi_stats[prodi_name] = {'count': 0, 'sks': 0, 'classes': 0}
            prodi_stats[prodi_name]['count'] += 1
            prodi_stats[prodi_name]['sks'] += mk.sks
            prodi_stats[prodi_name]['classes'] += mk.class_count

        # Group by SKS categories
        sks_categories = {'1': 0, '2': 0, '3': 0, '4': 0, '>4': 0}
        for mk in mk_qs:
            if mk.sks <= 1:
                sks_categories['1'] += 1
            elif mk.sks == 2:
                sks_categories['2'] += 1
            elif mk.sks == 3:
                sks_categories['3'] += 1
            elif mk.sks == 4:
                sks_categories['4'] += 1
            else:
                sks_categories['>4'] += 1

        # Add custom context
        extra_context = extra_context or {}
        extra_context['show_custom_table'] = True
        extra_context['mk_data'] = mk_qs
        extra_context['total_mk'] = total_mk
        extra_context['total_classes'] = total_classes
        extra_context['total_sks'] = total_sks
        extra_context['avg_sks'] = round(avg_sks, 1)
        extra_context['semester_stats'] = semester_stats
        extra_context['prodi_stats'] = prodi_stats
        extra_context['sks_categories'] = sks_categories
        # Override the template
        self.change_list_template = 'admin/matakuliah_list.html'
        return super().changelist_view(request, extra_context)

@admin.register(Ruang)
class RuangAdmin(admin.ModelAdmin):
    list_display = ('kode_ruang', 'nama_ruang', 'gedung', 'lantai', 'kapasitas', 'jenis_ruang', 'status_display')
    list_filter = ('gedung', 'jenis_ruang', 'status')
    search_fields = ('kode_ruang', 'nama_ruang', 'gedung')
    change_form_template = 'admin/change_form.html'
    add_form_template = 'admin/change_form.html'

    def status_display(self, obj):
        colors = {
            'Aktif': 'success',
            'Maintenance': 'warning',
            'Tidak Aktif': 'danger'
        }
        color = colors.get(obj.status, 'secondary')
        return f'<span class="badge bg-{color}">{obj.status}</span>'
    status_display.short_description = 'Status'
    status_display.allow_tags = True

    def changelist_view(self, request, extra_context=None):
        # Calculate aggregate statistics
        ruang_qs = Ruang.objects.all().order_by('gedung', 'kode_ruang')

        total_ruang = ruang_qs.count()
        total_kapasitas = sum(f.kapasitas for f in ruang_qs)
        avg_kapasitas = total_kapasitas / total_ruang if total_ruang > 0 else 0

        # Group by status
        status_stats = {}
        for ruang in ruang_qs:
            status = ruang.status or 'Tidak Diketahui'
            if status not in status_stats:
                status_stats[status] = {'count': 0, 'kapasitas': 0}
            status_stats[status]['count'] += 1
            status_stats[status]['kapasitas'] += ruang.kapasitas

        # Group by jenis ruang
        jenis_stats = {}
        for ruang in ruang_qs:
            jenis = ruang.jenis_ruang or 'Tidak Diketahui'
            if jenis not in jenis_stats:
                jenis_stats[jenis] = {'count': 0, 'kapasitas': 0}
            jenis_stats[jenis]['count'] += 1
            jenis_stats[jenis]['kapasitas'] += ruang.kapasitas

        # Group by gedung
        gedung_stats = {}
        for ruang in ruang_qs:
            gedung = ruang.gedung or 'Tidak Diketahui'
            if gedung not in gedung_stats:
                gedung_stats[gedung] = {'count': 0, 'kapasitas': 0}
            gedung_stats[gedung]['count'] += 1
            gedung_stats[gedung]['kapasitas'] += ruang.kapasitas

        # Group by lantai
        lantai_stats = {}
        for ruang in ruang_qs:
            lantai = ruang.lantai or 'Tidak Diketahui'
            if lantai not in lantai_stats:
                lantai_stats[lantai] = {'count': 0, 'kapasitas': 0}
            lantai_stats[lantai]['count'] += 1
            lantai_stats[lantai]['kapasitas'] += ruang.kapasitas

        # Add custom context
        extra_context = extra_context or {}
        extra_context['show_custom_table'] = True
        extra_context['ruang_data'] = ruang_qs
        extra_context['total_ruang'] = total_ruang
        extra_context['total_kapasitas'] = total_kapasitas
        extra_context['avg_kapasitas'] = round(avg_kapasitas, 1)
        extra_context['status_stats'] = status_stats
        extra_context['jenis_stats'] = jenis_stats
        extra_context['gedung_stats'] = gedung_stats
        extra_context['lantai_stats'] = lantai_stats
        # Override the template
        self.change_list_template = 'admin/ruang_list.html'
        return super().changelist_view(request, extra_context)

