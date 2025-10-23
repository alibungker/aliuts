from django.contrib.admin import AdminSite
from django.db.models import Count
from .models import Mahasiswa, Dosen, Kelas, ProgramStudi, MataKuliah

class CustomAdminSite(AdminSite):
    site_header = "Sistem Informasi Akademik"
    site_title = "SIAKAD Admin"
    index_title = "Dashboard Administrasi Akademik"

    def each_context(self, request):
        context = super().each_context(request)

        # Get real statistics from database
        try:
            # Count mahasiswa
            total_mahasiswa = Mahasiswa.objects.count()

            # Count dosen
            total_dosen = Dosen.objects.count()

            # Count kelas
            total_kelas = Kelas.objects.count()

            # Count program studi
            total_prodi = ProgramStudi.objects.count()

            # Count mata kuliah
            total_matakuliah = MataKuliah.objects.count()

            # Get recent activity counts
            recent_mahasiswa = 0
            recent_dosen = 0
            if request.user.is_authenticated and request.user.last_login:
                recent_mahasiswa = Mahasiswa.objects.filter(
                    created_at__gte=request.user.last_login
                ).count()
                recent_dosen = Dosen.objects.filter(
                    created_at__gte=request.user.last_login
                ).count()

            # Get active students
            active_students = Mahasiswa.objects.filter(
                status_mahasiswa='Aktif'
            ).count()

            # Get students by program studi
            students_by_prodi = list(
                ProgramStudi.objects.annotate(
                    student_count=Count('mahasiswa')
                ).values('nama_prodi', 'student_count').order_by('-student_count')[:5]
            )

            # Get class distribution
            class_distribution = list(
                Kelas.objects.annotate(
                    student_count=Count('krs')
                ).values('kode_kelas', 'mata_kuliah__nama_mk', 'student_count', 'kuota').order_by('-student_count')[:5]
            )

            # Calculate trends (mock data for now)
            mahasiswa_trend = 12.5  # This would be calculated based on historical data
            dosen_trend = 3.1

            context.update({
                'total_mahasiswa': total_mahasiswa,
                'total_dosen': total_dosen,
                'total_kelas': total_kelas,
                'total_prodi': total_prodi,
                'total_matakuliah': total_matakuliah,
                'active_students': active_students,
                'recent_mahasiswa': recent_mahasiswa,
                'recent_dosen': recent_dosen,
                'students_by_prodi': students_by_prodi,
                'class_distribution': class_distribution,
                'mahasiswa_trend': mahasiswa_trend,
                'dosen_trend': dosen_trend,
            })

        except Exception as e:
            # Fallback to 0 if there's an error
            context.update({
                'total_mahasiswa': 0,
                'total_dosen': 0,
                'total_kelas': 0,
                'total_prodi': 0,
                'total_matakuliah': 0,
                'active_students': 0,
                'recent_mahasiswa': 0,
                'recent_dosen': 0,
                'students_by_prodi': [],
                'class_distribution': [],
                'mahasiswa_trend': 0,
                'dosen_trend': 0,
            })

        return context

# Create custom admin site instance
custom_admin_site = CustomAdminSite()