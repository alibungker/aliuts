from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.decorators import login_required
from django.contrib.auth import authenticate, login as auth_login, logout as auth_logout
from django.contrib import messages
from django.db.models import Sum, Avg, Q
from django.views.decorators.csrf import csrf_exempt
from django.views.decorators.http import require_http_methods
from .models import (
    Mahasiswa, Dosen, Kelas, KRS, Nilai, Jadwal,
    Presensi, MataKuliah, ProgramStudi, Notification
)
from datetime import datetime

# ===== VIEWS UNTUK MAHASISWA =====

@login_required
def mahasiswa_dashboard(request):
    """Dashboard utama untuk mahasiswa"""
    try:
        mahasiswa = Mahasiswa.objects.get(user=request.user)
    except Mahasiswa.DoesNotExist:
        messages.error(request, 'Anda belum terdaftar sebagai mahasiswa.')
        return redirect('home')

    # Ambil KRS aktif semester ini
    krs_semester_ini = KRS.objects.filter(
        mahasiswa=mahasiswa,
        status='disetujui'
    ).select_related('kelas__mata_kuliah')

    # Hitung total SKS semester ini
    total_sks = sum([krs.kelas.mata_kuliah.sks for krs in krs_semester_ini])

    # Hitung IPK
    ipk = hitung_ipk(mahasiswa)

    context = {
        'mahasiswa': mahasiswa,
        'krs_semester_ini': krs_semester_ini,
        'total_sks': total_sks,
        'ipk': ipk,
    }
    return render(request, 'academic/mahasiswa/dashboard.html', context)

@login_required
def mahasiswa_krs(request):
    """Halaman KRS - Kartu Rencana Studi"""
    try:
        mahasiswa = Mahasiswa.objects.get(user=request.user)
    except Mahasiswa.DoesNotExist:
        messages.error(request, 'Anda belum terdaftar sebagai mahasiswa.')
        return redirect('home')

    # Ambil daftar kelas yang tersedia untuk program studi mahasiswa
    kelas_tersedia = Kelas.objects.filter(
        mata_kuliah__program_studi=mahasiswa.program_studi
    ).select_related('mata_kuliah', 'dosen')

    # Ambil KRS yang sudah diambil
    krs_diambil = KRS.objects.filter(mahasiswa=mahasiswa).select_related('kelas__mata_kuliah', 'kelas__dosen')
    kelas_diambil_ids = [krs.kelas.id for krs in krs_diambil]

    # Hitung total SKS
    total_sks = sum([krs.kelas.mata_kuliah.sks for krs in krs_diambil])
    total_disetujui = krs_diambil.filter(status='disetujui').count()

    context = {
        'mahasiswa': mahasiswa,
        'kelas_tersedia': kelas_tersedia,
        'krs_diambil': krs_diambil,
        'kelas_diambil_ids': kelas_diambil_ids,
        'total_sks': total_sks,
        'total_disetujui': total_disetujui,
    }
    return render(request, 'academic/mahasiswa/krs.html', context)

@login_required
def tambah_krs(request, kelas_id):
    """Menambah mata kuliah ke KRS"""
    try:
        mahasiswa = Mahasiswa.objects.get(user=request.user)
    except Mahasiswa.DoesNotExist:
        messages.error(request, 'Anda belum terdaftar sebagai mahasiswa.')
        return redirect('home')

    kelas = get_object_or_404(Kelas, id=kelas_id)

    # Cek apakah sudah mengambil kelas ini
    if KRS.objects.filter(mahasiswa=mahasiswa, kelas=kelas).exists():
        messages.warning(request, 'Anda sudah mengambil mata kuliah ini.')
        return redirect('mahasiswa_krs')

    # Cek kuota kelas
    jumlah_peserta = KRS.objects.filter(kelas=kelas, status='disetujui').count()
    if jumlah_peserta >= kelas.kuota:
        messages.error(request, 'Kuota kelas sudah penuh.')
        return redirect('mahasiswa_krs')

    # Tambahkan ke KRS
    krs = KRS.objects.create(
        mahasiswa=mahasiswa,
        kelas=kelas,
        status='pending'
    )

    # Buat notifikasi untuk dosen
    Notification.objects.create(
        user=kelas.dosen.user,
        krs=krs,
        title=f'Pengajuan KRS Baru',
        message=f'{mahasiswa.nama} ({mahasiswa.nim}) mengajukan KRS untuk mata kuliah {kelas.mata_kuliah.nama_mk} kelas {kelas.kode_kelas}',
        notification_type='krs_pending'
    )

    messages.success(request, f'Berhasil menambahkan {kelas.mata_kuliah.nama_mk} ke KRS. Menunggu persetujuan dosen.')
    return redirect('mahasiswa_krs')

@login_required
def hapus_krs(request, krs_id):
    """Menghapus mata kuliah dari KRS"""
    try:
        mahasiswa = Mahasiswa.objects.get(user=request.user)
    except Mahasiswa.DoesNotExist:
        messages.error(request, 'Anda belum terdaftar sebagai mahasiswa.')
        return redirect('home')

    krs = get_object_or_404(KRS, id=krs_id, mahasiswa=mahasiswa)

    if krs.status == 'disetujui':
        messages.error(request, 'Tidak dapat menghapus KRS yang sudah disetujui.')
        return redirect('mahasiswa_krs')

    mata_kuliah = krs.kelas.mata_kuliah.nama_mk
    krs.delete()
    messages.success(request, f'Berhasil menghapus {mata_kuliah} dari KRS.')
    return redirect('mahasiswa_krs')

@login_required
def mahasiswa_khs(request):
    """Halaman KHS - Kartu Hasil Studi"""
    try:
        mahasiswa = Mahasiswa.objects.get(user=request.user)
    except Mahasiswa.DoesNotExist:
        messages.error(request, 'Anda belum terdaftar sebagai mahasiswa.')
        return redirect('home')

    # Dapatkan daftar tahun ajaran dan semester yang tersedia
    available_tahun_ajaran = Kelas.objects.values_list('tahun_ajaran', flat=True).distinct().order_by('-tahun_ajaran')
    available_semesters = ['Ganjil', 'Genap']

    # Ambil tahun ajaran dan semester dari GET parameter atau gunakan yang terbaru
    tahun_ajaran = request.GET.get('tahun_ajaran')
    if not tahun_ajaran and available_tahun_ajaran.exists():
        tahun_ajaran = available_tahun_ajaran.first()

    semester = request.GET.get('semester', 'Ganjil')

    # Ambil semua KRS yang sudah ada nilainya untuk semester yang dipilih
    krs_list = KRS.objects.filter(
        mahasiswa=mahasiswa,
        status='disetujui',
        kelas__tahun_ajaran=tahun_ajaran,
        kelas__semester=semester,
    ).select_related('kelas__mata_kuliah', 'kelas__dosen', 'nilai')

    # Hitung IPS (Indeks Prestasi Semester)
    total_sks_semester = 0
    total_nilai_x_sks_semester = 0
    for krs in krs_list:
        try:
            nilai = krs.nilai
            sks = krs.kelas.mata_kuliah.sks
            bobot = nilai.get_bobot()
            total_sks_semester += sks
            total_nilai_x_sks_semester += (bobot * sks)
        except Nilai.DoesNotExist:
            pass

    ips = round(total_nilai_x_sks_semester / total_sks_semester, 2) if total_sks_semester > 0 else 0.00

    # Hitung IPK (Indeks Prestasi Kumulatif) - semua semester
    all_krs = KRS.objects.filter(
        mahasiswa=mahasiswa,
        status='disetujui'
    ).select_related('kelas__mata_kuliah', 'nilai')

    total_sks_kumulatif = 0
    total_nilai_x_sks_kumulatif = 0
    for krs in all_krs:
        try:
            nilai = krs.nilai
            sks = krs.kelas.mata_kuliah.sks
            bobot = nilai.get_bobot()
            total_sks_kumulatif += sks
            total_nilai_x_sks_kumulatif += (bobot * sks)
        except Nilai.DoesNotExist:
            pass

    ipk = round(total_nilai_x_sks_kumulatif / total_sks_kumulatif, 2) if total_sks_kumulatif > 0 else 0.00

    context = {
        'mahasiswa': mahasiswa,
        'krs_list': krs_list,
        'ips': ips,
        'ipk': ipk,
        'tahun_ajaran_terpilih': tahun_ajaran,
        'semester_terpilih': semester,
        'available_tahun_ajaran': available_tahun_ajaran,
        'available_semesters': available_semesters,
    }
    return render(request, 'academic/mahasiswa/khs.html', context)

@login_required
def mahasiswa_jadwal(request):
    """Halaman Jadwal Kuliah"""
    try:
        mahasiswa = Mahasiswa.objects.get(user=request.user)
    except Mahasiswa.DoesNotExist:
        messages.error(request, 'Anda belum terdaftar sebagai mahasiswa.')
        return redirect('home')

    # Ambil jadwal dari kelas yang sudah diambil (KRS disetujui)
    krs_disetujui = KRS.objects.filter(
        mahasiswa=mahasiswa,
        status='disetujui'
    ).select_related('kelas')

    jadwal_kuliah = []
    for krs in krs_disetujui:
        jadwal = Jadwal.objects.filter(kelas=krs.kelas)
        for j in jadwal:
            jadwal_kuliah.append({
                'mata_kuliah': krs.kelas.mata_kuliah,
                'dosen': krs.kelas.dosen,
                'hari': j.hari,
                'jam_mulai': j.jam_mulai,
                'jam_selesai': j.jam_selesai,
                'ruangan': j.ruangan,
            })

    # Urutkan berdasarkan hari
    hari_urutan = ['Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat', 'Sabtu']
    jadwal_kuliah.sort(key=lambda x: (hari_urutan.index(x['hari']), x['jam_mulai']))

    context = {
        'mahasiswa': mahasiswa,
        'jadwal_kuliah': jadwal_kuliah,
    }
    return render(request, 'academic/mahasiswa/jadwal.html', context)

@login_required
def mahasiswa_presensi(request):
    """Halaman Presensi"""
    try:
        mahasiswa = Mahasiswa.objects.get(user=request.user)
    except Mahasiswa.DoesNotExist:
        messages.error(request, 'Anda belum terdaftar sebagai mahasiswa.')
        return redirect('home')

    # Ambil presensi dari semua KRS
    presensi_list = Presensi.objects.filter(
        krs__mahasiswa=mahasiswa
    ).select_related('krs__kelas__mata_kuliah').order_by('-tanggal')

    context = {
        'mahasiswa': mahasiswa,
        'presensi_list': presensi_list,
    }
    return render(request, 'academic/mahasiswa/presensi.html', context)

@login_required
def mahasiswa_biodata(request):
    """Halaman Biodata Mahasiswa"""
    try:
        mahasiswa = Mahasiswa.objects.get(user=request.user)
    except Mahasiswa.DoesNotExist:
        messages.error(request, 'Anda belum terdaftar sebagai mahasiswa.')
        return redirect('home')

    context = {
        'mahasiswa': mahasiswa,
    }
    return render(request, 'academic/mahasiswa/biodata.html', context)

# ===== VIEWS UNTUK DOSEN =====

@login_required
def dosen_dashboard(request):
    """Dashboard utama untuk dosen"""
    try:
        dosen = Dosen.objects.get(user=request.user)
    except Dosen.DoesNotExist:
        messages.error(request, 'Anda belum terdaftar sebagai dosen.')
        return redirect('home')

    # Ambil kelas yang diampu semester ini
    kelas_diampu = Kelas.objects.filter(dosen=dosen).select_related('mata_kuliah')

    context = {
        'dosen': dosen,
        'kelas_diampu': kelas_diampu,
    }
    return render(request, 'academic/dosen/dashboard.html', context)

@login_required
def dosen_kelas(request):
    """Halaman daftar kelas yang diampu"""
    try:
        dosen = Dosen.objects.get(user=request.user)
    except Dosen.DoesNotExist:
        messages.error(request, 'Anda belum terdaftar sebagai dosen.')
        return redirect('home')

    kelas_diampu = Kelas.objects.filter(dosen=dosen).select_related('mata_kuliah')

    context = {
        'dosen': dosen,
        'kelas_diampu': kelas_diampu,
    }
    return render(request, 'academic/dosen/kelas.html', context)

@login_required
def dosen_kelas_detail(request, kelas_id):
    """Detail kelas dan daftar mahasiswa"""
    try:
        dosen = Dosen.objects.get(user=request.user)
    except Dosen.DoesNotExist:
        messages.error(request, 'Anda belum terdaftar sebagai dosen.')
        return redirect('home')

    kelas = get_object_or_404(Kelas, id=kelas_id, dosen=dosen)
    mahasiswa_list = KRS.objects.filter(
        kelas=kelas,
        status='disetujui'
    ).select_related('mahasiswa')

    context = {
        'dosen': dosen,
        'kelas': kelas,
        'mahasiswa_list': mahasiswa_list,
    }
    return render(request, 'academic/dosen/kelas_detail.html', context)

@login_required
def dosen_input_nilai(request, kelas_id):
    """Input nilai mahasiswa"""
    try:
        dosen = Dosen.objects.get(user=request.user)
    except Dosen.DoesNotExist:
        messages.error(request, 'Anda belum terdaftar sebagai dosen.')
        return redirect('home')

    kelas = get_object_or_404(Kelas, id=kelas_id, dosen=dosen)

    if request.method == 'POST':
        for key, value in request.POST.items():
            if key.startswith('nilai_'):
                krs_id = key.split('_')[1]
                krs = get_object_or_404(KRS, id=krs_id, kelas=kelas)

                # Konversi nilai angka ke huruf
                nilai_angka = float(value) if value else None
                nilai_huruf = konversi_nilai_ke_huruf(nilai_angka) if nilai_angka is not None else None

                # Update atau create nilai
                Nilai.objects.update_or_create(
                    krs=krs,
                    defaults={
                        'nilai_angka': nilai_angka,
                        'nilai_huruf': nilai_huruf
                    }
                )

        messages.success(request, 'Nilai berhasil disimpan.')
        return redirect('dosen_kelas_detail', kelas_id=kelas_id)

    mahasiswa_list = KRS.objects.filter(
        kelas=kelas,
        status='disetujui'
    ).select_related('mahasiswa')

    context = {
        'dosen': dosen,
        'kelas': kelas,
        'mahasiswa_list': mahasiswa_list,
    }
    return render(request, 'academic/dosen/input_nilai.html', context)

@login_required
def dosen_input_presensi(request, kelas_id):
    """Input presensi mahasiswa"""
    try:
        dosen = Dosen.objects.get(user=request.user)
    except Dosen.DoesNotExist:
        messages.error(request, 'Anda belum terdaftar sebagai dosen.')
        return redirect('home')

    kelas = get_object_or_404(Kelas, id=kelas_id, dosen=dosen)

    if request.method == 'POST':
        tanggal = request.POST.get('tanggal')
        pertemuan_ke = request.POST.get('pertemuan_ke')

        for key, value in request.POST.items():
            if key.startswith('presensi_'):
                krs_id = key.split('_')[1]
                krs = get_object_or_404(KRS, id=krs_id, kelas=kelas)

                # Update atau create presensi
                Presensi.objects.update_or_create(
                    krs=krs,
                    pertemuan_ke=pertemuan_ke,
                    defaults={
                        'tanggal': tanggal,
                        'status': value
                    }
                )

        messages.success(request, 'Presensi berhasil disimpan.')
        return redirect('dosen_kelas_detail', kelas_id=kelas_id)

    mahasiswa_list = KRS.objects.filter(
        kelas=kelas,
        status='disetujui'
    ).select_related('mahasiswa')

    context = {
        'dosen': dosen,
        'kelas': kelas,
        'mahasiswa_list': mahasiswa_list,
    }
    return render(request, 'academic/dosen/input_presensi.html', context)

@login_required
def dosen_biodata(request):
    """Halaman Biodata Dosen"""
    try:
        dosen = Dosen.objects.get(user=request.user)
    except Dosen.DoesNotExist:
        messages.error(request, 'Anda belum terdaftar sebagai dosen.')
        return redirect('home')

    context = {
        'dosen': dosen,
    }
    return render(request, 'academic/dosen/biodata.html', context)

@login_required
def dosen_notifications(request):
    """Halaman notifikasi dosen"""
    try:
        dosen = Dosen.objects.get(user=request.user)
    except Dosen.DoesNotExist:
        messages.error(request, 'Anda belum terdaftar sebagai dosen.')
        return redirect('home')

    # Ambil semua notifikasi dosen
    notifications = Notification.objects.filter(user=request.user).order_by('-created_at')

    # Tandai notifikasi yang dibuka sebagai sudah dibaca
    Notification.objects.filter(user=request.user, is_read=False).update(is_read=True)

    context = {
        'dosen': dosen,
        'notifications': notifications,
    }
    return render(request, 'academic/dosen/notifications.html', context)

@login_required
def dosen_approve_krs(request, krs_id):
    """Approve KRS mahasiswa"""
    try:
        dosen = Dosen.objects.get(user=request.user)
    except Dosen.DoesNotExist:
        messages.error(request, 'Anda belum terdaftar sebagai dosen.')
        return redirect('home')

    krs = get_object_or_404(KRS, id=krs_id, kelas__dosen=dosen)

    if krs.status == 'pending':
        krs.status = 'disetujui'
        krs.save()

        # Buat notifikasi untuk mahasiswa
        Notification.objects.create(
            user=krs.mahasiswa.user,
            krs=krs,
            title='KRS Disetujui',
            message=f'KRS Anda untuk mata kuliah {krs.kelas.mata_kuliah.nama_mk} ({krs.kelas.kode_kelas}) telah disetujui oleh dosen.',
            notification_type='krs_approved'
        )

        messages.success(request, f'KRS {krs.mahasiswa.nama} untuk {krs.kelas.mata_kuliah.nama_mk} berhasil disetujui.')
    else:
        messages.warning(request, 'KRS sudah diproses sebelumnya.')

    return redirect('dosen_notifications')

@login_required
def dosen_reject_krs(request, krs_id):
    """Reject KRS mahasiswa"""
    try:
        dosen = Dosen.objects.get(user=request.user)
    except Dosen.DoesNotExist:
        messages.error(request, 'Anda belum terdaftar sebagai dosen.')
        return redirect('home')

    krs = get_object_or_404(KRS, id=krs_id, kelas__dosen=dosen)

    if krs.status == 'pending':
        krs.status = 'ditolak'
        krs.save()

        # Buat notifikasi untuk mahasiswa
        Notification.objects.create(
            user=krs.mahasiswa.user,
            krs=krs,
            title='KRS Ditolak',
            message=f'KRS Anda untuk mata kuliah {krs.kelas.mata_kuliah.nama_mk} ({krs.kelas.kode_kelas}) ditolak oleh dosen.',
            notification_type='krs_rejected'
        )

        messages.success(request, f'KRS {krs.mahasiswa.nama} untuk {krs.kelas.mata_kuliah.nama_mk} berhasil ditolak.')
    else:
        messages.warning(request, 'KRS sudah diproses sebelumnya.')

    return redirect('dosen_notifications')

# ===== VIEWS UNTUK EDIT BIODATA =====

@login_required
def mahasiswa_edit_biodata(request):
    """Edit biodata mahasiswa"""
    try:
        mahasiswa = Mahasiswa.objects.get(user=request.user)
    except Mahasiswa.DoesNotExist:
        messages.error(request, 'Anda belum terdaftar sebagai mahasiswa.')
        return redirect('home')

    if request.method == 'POST':
        # Update data mahasiswa
        mahasiswa.tempat_lahir = request.POST.get('tempat_lahir', '')
        mahasiswa.tanggal_lahir = request.POST.get('tanggal_lahir') or None
        mahasiswa.jenis_kelamin = request.POST.get('jenis_kelamin', '')
        mahasiswa.agama = request.POST.get('agama', '')
        mahasiswa.email = request.POST.get('email', '')
        mahasiswa.no_telp = request.POST.get('no_telp', '')
        mahasiswa.alamat = request.POST.get('alamat', '')
        mahasiswa.nama_ayah = request.POST.get('nama_ayah', '')
        mahasiswa.nama_ibu = request.POST.get('nama_ibu', '')
        mahasiswa.pekerjaan_ayah = request.POST.get('pekerjaan_ayah', '')
        mahasiswa.pekerjaan_ibu = request.POST.get('pekerjaan_ibu', '')
        mahasiswa.no_telp_ortu = request.POST.get('no_telp_ortu', '')
        mahasiswa.alamat_ortu = request.POST.get('alamat_ortu', '')

        # Handle foto upload
        if request.FILES.get('foto'):
            mahasiswa.foto = request.FILES['foto']

        mahasiswa.save()
        messages.success(request, 'Biodata berhasil diupdate!')
        return redirect('mahasiswa_biodata')

    context = {
        'mahasiswa': mahasiswa,
    }
    return render(request, 'academic/mahasiswa/edit_biodata.html', context)

@login_required
def dosen_edit_biodata(request):
    """Edit biodata dosen"""
    try:
        dosen = Dosen.objects.get(user=request.user)
    except Dosen.DoesNotExist:
        messages.error(request, 'Anda belum terdaftar sebagai dosen.')
        return redirect('home')

    if request.method == 'POST':
        # Update data dosen
        dosen.tempat_lahir = request.POST.get('tempat_lahir', '')
        dosen.tanggal_lahir = request.POST.get('tanggal_lahir') or None
        dosen.jenis_kelamin = request.POST.get('jenis_kelamin', '')
        dosen.email = request.POST.get('email', '')
        dosen.no_telp = request.POST.get('no_telp', '')
        dosen.alamat = request.POST.get('alamat', '')
        dosen.gelar_depan = request.POST.get('gelar_depan', '')
        dosen.gelar_belakang = request.POST.get('gelar_belakang', '')
        dosen.pendidikan_terakhir = request.POST.get('pendidikan_terakhir', '')
        dosen.nip = request.POST.get('nip', '')

        # Handle foto upload
        if request.FILES.get('foto'):
            dosen.foto = request.FILES['foto']

        dosen.save()
        messages.success(request, 'Biodata berhasil diupdate!')
        return redirect('dosen_biodata')

    context = {
        'dosen': dosen,
    }
    return render(request, 'academic/dosen/edit_biodata.html', context)

# ===== VIEWS UNTUK CETAK KARTU =====

@login_required
def mahasiswa_cetak_kartu(request):
    """Cetak kartu mahasiswa"""
    try:
        mahasiswa = Mahasiswa.objects.get(user=request.user)
    except Mahasiswa.DoesNotExist:
        messages.error(request, 'Anda belum terdaftar sebagai mahasiswa.')
        return redirect('home')

    context = {
        'mahasiswa': mahasiswa,
    }
    return render(request, 'academic/mahasiswa/cetak_kartu.html', context)

@login_required
def dosen_cetak_kartu(request):
    """Cetak kartu dosen"""
    try:
        dosen = Dosen.objects.get(user=request.user)
    except Dosen.DoesNotExist:
        messages.error(request, 'Anda belum terdaftar sebagai dosen.')
        return redirect('home')

    context = {
        'dosen': dosen,
    }
    return render(request, 'academic/dosen/cetak_kartu.html', context)

# ===== HELPER FUNCTIONS =====

def hitung_ipk(mahasiswa):
    """Menghitung IPK mahasiswa"""
    krs_list = KRS.objects.filter(
        mahasiswa=mahasiswa,
        status='disetujui'
    ).select_related('kelas__mata_kuliah')

    total_bobot = 0
    total_sks = 0

    for krs in krs_list:
        try:
            nilai = Nilai.objects.get(krs=krs)
            if nilai.nilai_huruf:
                bobot = nilai.get_bobot()
                sks = krs.kelas.mata_kuliah.sks
                total_bobot += bobot * sks
                total_sks += sks
        except Nilai.DoesNotExist:
            continue

    if total_sks > 0:
        return round(total_bobot / total_sks, 2)
    return 0.0

def hitung_ips(mahasiswa, tahun_ajaran, semester):
    """Menghitung IPS mahasiswa untuk semester tertentu"""
    krs_list = KRS.objects.filter(
        mahasiswa=mahasiswa,
        kelas__tahun_ajaran=tahun_ajaran,
        kelas__semester=semester,
        status='disetujui'
    ).select_related('kelas__mata_kuliah')

    total_bobot = 0
    total_sks = 0

    for krs in krs_list:
        try:
            nilai = Nilai.objects.get(krs=krs)
            if nilai.nilai_huruf:
                bobot = nilai.get_bobot()
                sks = krs.kelas.mata_kuliah.sks
                total_bobot += bobot * sks
                total_sks += sks
        except Nilai.DoesNotExist:
            continue

    if total_sks > 0:
        return round(total_bobot / total_sks, 2)
    return 0.0

def konversi_nilai_ke_huruf(nilai_angka):
    """Konversi nilai angka ke huruf"""
    if nilai_angka >= 85:
        return 'A'
    elif nilai_angka >= 80:
        return 'A-'
    elif nilai_angka >= 75:
        return 'B+'
    elif nilai_angka >= 70:
        return 'B'
    elif nilai_angka >= 65:
        return 'B-'
    elif nilai_angka >= 60:
        return 'C+'
    elif nilai_angka >= 55:
        return 'C'
    elif nilai_angka >= 50:
        return 'D'
    else:
        return 'E'

# ===== LOGIN PAGE =====

def custom_login(request):
    """Custom login view"""
    if request.user.is_authenticated:
        # Redirect authenticated users
        try:
            mahasiswa = Mahasiswa.objects.get(user=request.user)
            return redirect('mahasiswa_dashboard')
        except Mahasiswa.DoesNotExist:
            pass
        try:
            dosen = Dosen.objects.get(user=request.user)
            return redirect('dosen_dashboard')
        except Dosen.DoesNotExist:
            pass
        return redirect('home')

    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')
        user = authenticate(request, username=username, password=password)

        if user is not None:
            auth_login(request, user)
            next_url = request.POST.get('next') or request.GET.get('next')
            if next_url:
                return redirect(next_url)
            # Redirect based on user type
            try:
                mahasiswa = Mahasiswa.objects.get(user=user)
                return redirect('mahasiswa_dashboard')
            except Mahasiswa.DoesNotExist:
                pass
            try:
                dosen = Dosen.objects.get(user=user)
                return redirect('dosen_dashboard')
            except Dosen.DoesNotExist:
                messages.info(request, 'Profil Anda belum lengkap. Silakan hubungi administrator.')
                pass
            return redirect('home')
        else:
            # Authentication failed
            context = {
                'form': {'errors': True},
                'next': request.POST.get('next') or request.GET.get('next', '')
            }
            return render(request, 'registration/login.html', context)

    # GET request
    context = {
        'form': {'errors': False},
        'next': request.GET.get('next', '')
    }
    return render(request, 'registration/login.html', context)

# ===== LOGOUT =====

@require_http_methods(["GET", "POST"])
def custom_logout(request):
    """Custom logout view yang support GET dan POST"""
    auth_logout(request)
    messages.success(request, 'Anda telah berhasil logout.')
    return redirect('home')

# ===== AKADEMIK VIEWS =====

@login_required
def semester_list(request):
    """Daftar semua semester"""
    semesters = Semester.objects.all()
    context = {
        'semesters': semesters,
        'title': 'Daftar Semester'
    }
    return render(request, 'academic/admin/semester_list.html', context)

@login_required
def semester_create(request):
    """Tambah semester baru"""
    if request.method == 'POST':
        nama_semester = request.POST.get('nama_semester')
        kode_semester = request.POST.get('kode_semester')
        tahun_ajaran = request.POST.get('tahun_ajaran')
        jenis_semester = request.POST.get('jenis_semester')
        tanggal_mulai = request.POST.get('tanggal_mulai')
        tanggal_selesai = request.POST.get('tanggal_selesai')

        # Nonaktifkan semua semester yang lain
        Semester.objects.all().update(aktif=False)

        # Buat semester baru
        semester = Semester.objects.create(
            nama_semester=nama_semester,
            kode_semester=kode_semester,
            tahun_ajaran=tahun_ajaran,
            jenis_semester=jenis_semester,
            tanggal_mulai=tanggal_mulai,
            tanggal_selesai=tanggal_selesai,
            aktif=True
        )

        messages.success(request, f'Semester {semester.nama_semester} berhasil ditambahkan.')
        return redirect('semester_list')

    return render(request, 'academic/admin/semester_form.html', {'title': 'Tambah Semester'})

@login_required
def penawaran_kelas_list(request):
    """Daftar penawaran kelas"""
    kelas_list = Kelas.objects.all().select_related('mata_kuliah', 'dosen', 'mata_kuliah__program_studi')
    context = {
        'kelas_list': kelas_list,
        'title': 'Penawaran Kelas'
    }
    return render(request, 'academic/admin/penawaran_kelas_list.html', context)

@login_required
def jadwal_list(request):
    """Daftar jadwal kuliah"""
    jadwal_list = Jadwal.objects.all().select_related('kelas', 'kelas__mata_kuliah', 'kelas__dosen')

    # Filter berdasarkan semester aktif jika ada
    try:
        semester_aktif = Semester.objects.get(aktif=True)
        # Filter kelas yang ditawarkan pada semester ini
        jadwal_list = jadwal_list.filter(
            kelas__tahun_ajaran=semester_aktif.tahun_ajaran,
            kelas__semester=semester_aktif.jenis_semester
        )
    except Semester.DoesNotExist:
        pass

    # Group by hari untuk tampilan yang lebih baik
    jadwal_by_hari = {}
    for jadwal in jadwal_list:
        if jadwal.hari not in jadwal_by_hari:
            jadwal_by_hari[jadwal.hari] = []
        jadwal_by_hari[jadwal.hari].append(jadwal)

    context = {
        'jadwal_by_hari': jadwal_by_hari,
        'title': 'Jadwal Kuliah'
    }
    return render(request, 'academic/admin/jadwal_list.html', context)

@login_required
def jadwal_create(request):
    """Tambah jadwal baru"""
    if request.method == 'POST':
        kelas_id = request.POST.get('kelas')
        hari = request.POST.get('hari')
        jam_mulai = request.POST.get('jam_mulai')
        jam_selesai = request.POST.get('jam_selesai')
        ruangan = request.POST.get('ruangan')

        kelas = get_object_or_404(Kelas, id=kelas_id)

        jadwal = Jadwal.objects.create(
            kelas=kelas,
            hari=hari,
            jam_mulai=jam_mulai,
            jam_selesai=jam_selesai,
            ruangan=ruangan
        )

        messages.success(request, f'Jadwal untuk {kelas.mata_kuliah.nama_mk} berhasil ditambahkan.')
        return redirect('jadwal_list')

    kelas_list = Kelas.objects.all().select_related('mata_kuliah', 'dosen')
    context = {
        'kelas_list': kelas_list,
        'title': 'Tambah Jadwal',
        'hari_choices': Jadwal._meta.get_field('hari').choices
    }
    return render(request, 'academic/admin/jadwal_form.html', context)

# ===== HOME PAGE =====

def home(request):
    """Halaman home"""
    if request.user.is_authenticated:
        # Cek apakah user adalah mahasiswa atau dosen
        try:
            mahasiswa = Mahasiswa.objects.get(user=request.user)
            return redirect('mahasiswa_dashboard')
        except Mahasiswa.DoesNotExist:
            pass

        try:
            dosen = Dosen.objects.get(user=request.user)
            return redirect('dosen_dashboard')
        except Dosen.DoesNotExist:
            messages.info(request, 'Profil Anda belum lengkap. Silakan hubungi administrator.')
            pass

    return render(request, 'academic/home.html')
