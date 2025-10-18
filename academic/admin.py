from django.contrib import admin
from .models import ProgramStudi, Dosen, Mahasiswa, MataKuliah, Kelas, KRS, Jadwal, Presensi, Nilai, Notification

@admin.register(ProgramStudi)
class ProgramStudiAdmin(admin.ModelAdmin):
    list_display = ['kode_prodi', 'nama_prodi', 'jenjang']
    list_filter = ['jenjang']
    search_fields = ['kode_prodi', 'nama_prodi']

@admin.register(Dosen)
class DosenAdmin(admin.ModelAdmin):
    list_display = ['nidn', 'nama', 'program_studi', 'jabatan', 'no_telp']
    list_filter = ['program_studi', 'jabatan']
    search_fields = ['nidn', 'nama', 'user__username']
    raw_id_fields = ['user']

@admin.register(Mahasiswa)
class MahasiswaAdmin(admin.ModelAdmin):
    list_display = ['nim', 'nama', 'program_studi', 'angkatan', 'no_telp']
    list_filter = ['program_studi', 'angkatan']
    search_fields = ['nim', 'nama', 'user__username']
    raw_id_fields = ['user']

@admin.register(MataKuliah)
class MataKuliahAdmin(admin.ModelAdmin):
    list_display = ['kode_mk', 'nama_mk', 'sks', 'program_studi', 'semester']
    list_filter = ['program_studi', 'semester', 'sks']
    search_fields = ['kode_mk', 'nama_mk']

@admin.register(Kelas)
class KelasAdmin(admin.ModelAdmin):
    list_display = ['kode_kelas', 'mata_kuliah', 'dosen', 'tahun_ajaran', 'semester', 'kuota']
    list_filter = ['tahun_ajaran', 'semester', 'mata_kuliah__program_studi']
    search_fields = ['kode_kelas', 'mata_kuliah__nama_mk', 'dosen__nama']
    raw_id_fields = ['dosen']

class JadwalInline(admin.TabularInline):
    model = Jadwal
    extra = 1

@admin.register(Jadwal)
class JadwalAdmin(admin.ModelAdmin):
    list_display = ['kelas', 'hari', 'jam_mulai', 'jam_selesai', 'ruangan']
    list_filter = ['hari', 'kelas__tahun_ajaran', 'kelas__semester']
    search_fields = ['kelas__kode_kelas', 'ruangan']

@admin.register(KRS)
class KRSAdmin(admin.ModelAdmin):
    list_display = ['mahasiswa', 'kelas', 'tanggal_daftar', 'status']
    list_filter = ['status', 'kelas__tahun_ajaran', 'kelas__semester']
    search_fields = ['mahasiswa__nim', 'mahasiswa__nama', 'kelas__kode_kelas']
    raw_id_fields = ['mahasiswa', 'kelas']
    date_hierarchy = 'tanggal_daftar'

@admin.register(Presensi)
class PresensiAdmin(admin.ModelAdmin):
    list_display = ['krs', 'tanggal', 'pertemuan_ke', 'status', 'keterangan']
    list_filter = ['status', 'tanggal']
    search_fields = ['krs__mahasiswa__nim', 'krs__mahasiswa__nama', 'krs__kelas__kode_kelas']
    raw_id_fields = ['krs']
    date_hierarchy = 'tanggal'

@admin.register(Nilai)
class NilaiAdmin(admin.ModelAdmin):
    list_display = ['krs', 'nilai_huruf', 'nilai_angka', 'created_at']
    list_filter = ['nilai_huruf', 'krs__kelas__tahun_ajaran']
    search_fields = ['krs__mahasiswa__nim', 'krs__mahasiswa__nama', 'krs__kelas__mata_kuliah__nama_mk']
    raw_id_fields = ['krs']
    readonly_fields = ['created_at', 'updated_at']

@admin.register(Notification)
class NotificationAdmin(admin.ModelAdmin):
    list_display = ['user', 'title', 'notification_type', 'is_read', 'created_at']
    list_filter = ['notification_type', 'is_read', 'created_at']
    search_fields = ['user__username', 'title', 'message']
    raw_id_fields = ['user', 'krs']
    readonly_fields = ['created_at']
    date_hierarchy = 'created_at'

# Customize admin site header
admin.site.site_header = "Sistem Informasi Akademik"
admin.site.site_title = "SIAKAD Admin"
admin.site.index_title = "Dashboard Administrasi Akademik"

# Custom admin site with statistics
from django.contrib.admin import AdminSite

class CustomAdminSite(AdminSite):
    def each_context(self, request):
        context = super().each_context(request)
        # Add statistics to context
        context['total_mahasiswa'] = Mahasiswa.objects.count()
        context['total_dosen'] = Dosen.objects.count()
        context['total_kelas'] = Kelas.objects.count()
        context['total_matakuliah'] = MataKuliah.objects.count()
        return context

# Override default admin site
admin.site.__class__ = CustomAdminSite
