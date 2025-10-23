from django.db import models
from django.contrib.auth.models import User

class Fakultas(models.Model):
    kode_fakultas = models.CharField(max_length=10, unique=True)
    nama_fakultas = models.CharField(max_length=100)
    dekan = models.CharField(max_length=100, blank=True)
    no_telp = models.CharField(max_length=15, blank=True)
    email = models.EmailField(blank=True)
    alamat = models.TextField(blank=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        verbose_name = "Fakultas"
        verbose_name_plural = "Fakultas"

    def __str__(self):
        return f"{self.kode_fakultas} - {self.nama_fakultas}"

class ProgramStudi(models.Model):
    kode_prodi = models.CharField(max_length=10, unique=True)
    nama_prodi = models.CharField(max_length=100)
    fakultas = models.ForeignKey(Fakultas, on_delete=models.CASCADE, null=True, blank=True)
    jenjang = models.CharField(max_length=20, choices=[
        ('D3', 'Diploma 3'),
        ('S1', 'Sarjana'),
        ('S2', 'Magister'),
        ('S3', 'Doktor')
    ])
    kaprodi = models.CharField(max_length=100, blank=True)

    class Meta:
        verbose_name = "Program Studi"
        verbose_name_plural = "Program Studi"

    def __str__(self):
        return f"{self.kode_prodi} - {self.nama_prodi}"

class Ruang(models.Model):
    kode_ruang = models.CharField(max_length=10, unique=True)
    nama_ruang = models.CharField(max_length=50)
    gedung = models.CharField(max_length=20, blank=True)
    lantai = models.CharField(max_length=10, blank=True)
    kapasitas = models.IntegerField(default=0)
    jenis_ruang = models.CharField(max_length=20, choices=[
        ('Kelas', 'Kelas'),
        ('Lab', 'Laboratorium'),
        ('Seminar', 'Ruang Seminar'),
        ('Auditorium', 'Auditorium'),
        ('Kantor', 'Ruang Kantor'),
    ], default='Kelas')
    fasilitas = models.TextField(blank=True)
    status = models.CharField(max_length=20, choices=[
        ('Aktif', 'Aktif'),
        ('Maintenance', 'Maintenance'),
        ('Tidak Aktif', 'Tidak Aktif'),
    ], default='Aktif')

    class Meta:
        verbose_name = "Ruang"
        verbose_name_plural = "Ruang"

    def __str__(self):
        return f"{self.kode_ruang} - {self.nama_ruang}"

class Dosen(models.Model):
    nidn = models.CharField(max_length=20, unique=True)
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    nama = models.CharField(max_length=100)
    program_studi = models.ForeignKey(ProgramStudi, on_delete=models.CASCADE)
    jabatan = models.CharField(max_length=50)
    no_telp = models.CharField(max_length=15, blank=True)
    email = models.EmailField(blank=True)
    alamat = models.TextField(blank=True)
    tempat_lahir = models.CharField(max_length=100, blank=True)
    tanggal_lahir = models.DateField(null=True, blank=True)
    jenis_kelamin = models.CharField(max_length=10, choices=[
        ('L', 'Laki-laki'),
        ('P', 'Perempuan')
    ], blank=True)
    pendidikan_terakhir = models.CharField(max_length=50, blank=True)
    gelar_depan = models.CharField(max_length=20, blank=True)
    gelar_belakang = models.CharField(max_length=50, blank=True)
    status_kepegawaian = models.CharField(max_length=50, choices=[
        ('PNS', 'Pegawai Negeri Sipil'),
        ('Kontrak', 'Dosen Kontrak'),
        ('Tetap', 'Dosen Tetap Yayasan'),
        ('Honorer', 'Dosen Honorer')
    ], blank=True)
    nip = models.CharField(max_length=30, blank=True, verbose_name='NIP')
    foto = models.ImageField(upload_to='dosen/', blank=True, null=True)

    class Meta:
        verbose_name = "Dosen"
        verbose_name_plural = "Dosen"

    def __str__(self):
        return self.nama

class Mahasiswa(models.Model):
    nim = models.CharField(max_length=15, unique=True)
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    nama = models.CharField(max_length=100)
    program_studi = models.ForeignKey(ProgramStudi, on_delete=models.CASCADE)
    angkatan = models.IntegerField()
    no_telp = models.CharField(max_length=15, blank=True)
    email = models.EmailField(blank=True)
    alamat = models.TextField(blank=True)
    tempat_lahir = models.CharField(max_length=100, blank=True)
    tanggal_lahir = models.DateField(null=True, blank=True)
    jenis_kelamin = models.CharField(max_length=10, choices=[
        ('L', 'Laki-laki'),
        ('P', 'Perempuan')
    ], blank=True)
    agama = models.CharField(max_length=20, choices=[
        ('Islam', 'Islam'),
        ('Kristen', 'Kristen'),
        ('Katolik', 'Katolik'),
        ('Hindu', 'Hindu'),
        ('Buddha', 'Buddha'),
        ('Konghucu', 'Konghucu')
    ], blank=True)
    status_mahasiswa = models.CharField(max_length=20, choices=[
        ('Aktif', 'Aktif'),
        ('Cuti', 'Cuti'),
        ('Lulus', 'Lulus'),
        ('DO', 'Drop Out'),
        ('Mengundurkan Diri', 'Mengundurkan Diri')
    ], default='Aktif')
    semester_berjalan = models.IntegerField(default=1)
    nama_ayah = models.CharField(max_length=100, blank=True)
    nama_ibu = models.CharField(max_length=100, blank=True)
    pekerjaan_ayah = models.CharField(max_length=100, blank=True)
    pekerjaan_ibu = models.CharField(max_length=100, blank=True)
    no_telp_ortu = models.CharField(max_length=15, blank=True)
    alamat_ortu = models.TextField(blank=True)
    foto = models.ImageField(upload_to='mahasiswa/', blank=True, null=True)

    class Meta:
        verbose_name = "Mahasiswa"
        verbose_name_plural = "Mahasiswa"

    def __str__(self):
        return f"{self.nim} - {self.nama}"

class MataKuliah(models.Model):
    kode_mk = models.CharField(max_length=10, unique=True)
    nama_mk = models.CharField(max_length=100)
    sks = models.IntegerField()
    program_studi = models.ForeignKey(ProgramStudi, on_delete=models.CASCADE)
    semester = models.IntegerField()
    deskripsi = models.TextField(blank=True)

    class Meta:
        verbose_name = "Mata Kuliah"
        verbose_name_plural = "Mata Kuliah"

    def __str__(self):
        return f"{self.kode_mk} - {self.nama_mk}"

class Kelas(models.Model):
    kode_kelas = models.CharField(max_length=20, unique=True)
    mata_kuliah = models.ForeignKey(MataKuliah, on_delete=models.CASCADE)
    dosen = models.ForeignKey(Dosen, on_delete=models.CASCADE)
    tahun_ajaran = models.CharField(max_length=9)  # Format: 2024/2025
    semester = models.CharField(max_length=10, choices=[
        ('Ganjil', 'Ganjil'),
        ('Genap', 'Genap')
    ])
    kuota = models.IntegerField()

    class Meta:
        verbose_name = "Kelas"
        verbose_name_plural = "Kelas"

    def __str__(self):
        return f"{self.kode_kelas} - {self.mata_kuliah.nama_mk}"

class KRS(models.Model):
    mahasiswa = models.ForeignKey(Mahasiswa, on_delete=models.CASCADE)
    kelas = models.ForeignKey(Kelas, on_delete=models.CASCADE)
    tanggal_daftar = models.DateTimeField(auto_now_add=True)
    STATUS_CHOICES = [
        ('pending', 'Pending'),
        ('disetujui', 'Disetujui'),
        ('ditolak', 'Ditolak'),
    ]
    status = models.CharField(max_length=10, choices=STATUS_CHOICES, default='pending')
    
    class Meta:
        unique_together = ['mahasiswa', 'kelas']

class Jadwal(models.Model):
    kelas = models.ForeignKey(Kelas, on_delete=models.CASCADE, related_name='jadwal')
    hari = models.CharField(max_length=10, choices=[
        ('Senin', 'Senin'),
        ('Selasa', 'Selasa'),
        ('Rabu', 'Rabu'),
        ('Kamis', 'Kamis'),
        ('Jumat', 'Jumat'),
        ('Sabtu', 'Sabtu'),
    ])
    jam_mulai = models.TimeField()
    jam_selesai = models.TimeField()
    ruangan = models.CharField(max_length=20)

    class Meta:
        ordering = ['hari', 'jam_mulai']

    def __str__(self):
        return f"{self.kelas.kode_kelas} - {self.hari} {self.jam_mulai}-{self.jam_selesai}"

class Presensi(models.Model):
    krs = models.ForeignKey(KRS, on_delete=models.CASCADE, related_name='presensi')
    tanggal = models.DateField()
    pertemuan_ke = models.IntegerField()
    STATUS_CHOICES = [
        ('hadir', 'Hadir'),
        ('izin', 'Izin'),
        ('sakit', 'Sakit'),
        ('alpha', 'Alpha'),
    ]
    status = models.CharField(max_length=10, choices=STATUS_CHOICES)
    keterangan = models.TextField(blank=True)
    created_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        unique_together = ['krs', 'pertemuan_ke']
        ordering = ['tanggal']

    def __str__(self):
        return f"{self.krs.mahasiswa.nim} - Pertemuan {self.pertemuan_ke} - {self.status}"

class Nilai(models.Model):
    krs = models.OneToOneField(KRS, on_delete=models.CASCADE)
    nilai_huruf = models.CharField(max_length=2, choices=[
        ('A', 'A'),
        ('A-', 'A-'),
        ('B+', 'B+'),
        ('B', 'B'),
        ('B-', 'B-'),
        ('C+', 'C+'),
        ('C', 'C'),
        ('D', 'D'),
        ('E', 'E')
    ], blank=True, null=True)
    nilai_angka = models.FloatField(blank=True, null=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"{self.krs.mahasiswa.nim} - {self.nilai_huruf}"

    def get_bobot(self):
        """Mengembalikan bobot nilai untuk perhitungan IPK"""
        bobot_map = {
            'A': 4.0, 'A-': 3.7,
            'B+': 3.3, 'B': 3.0, 'B-': 2.7,
            'C+': 2.3, 'C': 2.0,
            'D': 1.0, 'E': 0.0
        }
        return bobot_map.get(self.nilai_huruf, 0.0)

class Semester(models.Model):
    nama_semester = models.CharField(max_length=50)
    kode_semester = models.CharField(max_length=10, unique=True)
    tahun_ajaran = models.CharField(max_length=9)  # Format: 2024/2025
    jenis_semester = models.CharField(max_length=10, choices=[
        ('Ganjil', 'Ganjil'),
        ('Genap', 'Genap'),
        ('Pendek', 'Pendek')
    ])
    tanggal_mulai = models.DateField()
    tanggal_selesai = models.DateField()
    aktif = models.BooleanField(default=False)

    class Meta:
        ordering = ['-tahun_ajaran', '-jenis_semester']

    def __str__(self):
        return f"{self.nama_semester} ({self.tahun_ajaran})"

class Notification(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='notifications')
    krs = models.ForeignKey(KRS, on_delete=models.CASCADE, null=True, blank=True)
    title = models.CharField(max_length=200)
    message = models.TextField()
    notification_type = models.CharField(max_length=20, choices=[
        ('krs_pending', 'KRS Pending'),
        ('krs_approved', 'KRS Disetujui'),
        ('krs_rejected', 'KRS Ditolak'),
        ('info', 'Informasi'),
    ])
    is_read = models.BooleanField(default=False)
    created_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        ordering = ['-created_at']

    def __str__(self):
        return f"{self.user.username} - {self.title}"
