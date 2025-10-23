from django.db.models import Count
from .models import Mahasiswa, Dosen, Kelas, ProgramStudi, MataKuliah

def dashboard_stats(request):
    """
    Context processor to provide real statistics for admin dashboard
    """
    context = {}

    # Only add context for admin pages
    if request.path.startswith('/admin/'):
        try:
            # Get real statistics from database
            total_mahasiswa = Mahasiswa.objects.count()
            total_dosen = Dosen.objects.count()
            total_kelas = Kelas.objects.count()
            total_prodi = ProgramStudi.objects.count()
            total_matakuliah = MataKuliah.objects.count()

            # Get active students
            active_students = Mahasiswa.objects.filter(
                status_mahasiswa='Aktif'
            ).count()

            # Calculate trends (mock data for now, could be calculated from historical data)
            mahasiswa_trend = 12.5
            dosen_trend = 3.1

            context.update({
                'total_mahasiswa': total_mahasiswa,
                'total_dosen': total_dosen,
                'total_kelas': total_kelas,
                'total_prodi': total_prodi,
                'total_matakuliah': total_matakuliah,
                'active_students': active_students,
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
                'mahasiswa_trend': 0,
                'dosen_trend': 0,
            })

    return context