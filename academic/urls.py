from django.urls import path
from . import views

urlpatterns = [
    # Home
    path('', views.home, name='home'),

    # Mahasiswa URLs
    path('mahasiswa/', views.mahasiswa_dashboard, name='mahasiswa_dashboard'),
    path('mahasiswa/krs/', views.mahasiswa_krs, name='mahasiswa_krs'),
    path('mahasiswa/krs/tambah/<int:kelas_id>/', views.tambah_krs, name='tambah_krs'),
    path('mahasiswa/krs/hapus/<int:krs_id>/', views.hapus_krs, name='hapus_krs'),
    path('mahasiswa/khs/', views.mahasiswa_khs, name='mahasiswa_khs'),
    path('mahasiswa/jadwal/', views.mahasiswa_jadwal, name='mahasiswa_jadwal'),
    path('mahasiswa/presensi/', views.mahasiswa_presensi, name='mahasiswa_presensi'),
    path('mahasiswa/biodata/', views.mahasiswa_biodata, name='mahasiswa_biodata'),
    path('mahasiswa/biodata/edit/', views.mahasiswa_edit_biodata, name='mahasiswa_edit_biodata'),

    # Dosen URLs
    path('dosen/', views.dosen_dashboard, name='dosen_dashboard'),
    path('dosen/kelas/', views.dosen_kelas, name='dosen_kelas'),
    path('dosen/kelas/<int:kelas_id>/', views.dosen_kelas_detail, name='dosen_kelas_detail'),
    path('dosen/kelas/<int:kelas_id>/nilai/', views.dosen_input_nilai, name='dosen_input_nilai'),
    path('dosen/kelas/<int:kelas_id>/presensi/', views.dosen_input_presensi, name='dosen_input_presensi'),
    path('dosen/biodata/', views.dosen_biodata, name='dosen_biodata'),
    path('dosen/biodata/edit/', views.dosen_edit_biodata, name='dosen_edit_biodata'),
    path('dosen/notifications/', views.dosen_notifications, name='dosen_notifications'),
    path('dosen/krs/<int:krs_id>/approve/', views.dosen_approve_krs, name='dosen_approve_krs'),
    path('dosen/krs/<int:krs_id>/reject/', views.dosen_reject_krs, name='dosen_reject_krs'),
]
