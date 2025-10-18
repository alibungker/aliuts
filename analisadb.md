# LAPORAN ANALISIS DATABASE  
## Sistem Informasi Kuliah

### 1. Informasi Umum
- Nama database: `aliuts` (dari settings.py)
- Engine: MySQL (asumsi berdasarkan konfigurasi)
- Versi Django: 5.2.7 (dari migrations)
- Versi Python: 3.8+ (diperlukan oleh Django 5.2.7)
- Jumlah aplikasi Django yang memiliki model: 1 (academic)

### 2. Daftar Tabel (Berdasarkan Model Django)

#### ProgramStudi
| Tabel (Model) | Field | Tipe Django | Tipe Database (Asumsi MySQL) | Primary/Foreign Key | Nullable |
|---------------|-------|-------------|-------------------------------|---------------------|----------|
| ProgramStudi | id | AutoField | INT AUTO_INCREMENT | Primary Key | No |
| ProgramStudi | kode_prodi | CharField | VARCHAR(10) | - | No |
| ProgramStudi | nama_prodi | CharField | VARCHAR(100) | - | No |
| ProgramStudi | jenjang | CharField | VARCHAR(20) | - | No |

#### Dosen
| Tabel (Model) | Field | Tipe Django | Tipe Database (Asumsi MySQL) | Primary/Foreign Key | Nullable |
|---------------|-------|-------------|-------------------------------|---------------------|----------|
| Dosen | id | AutoField | INT AUTO_INCREMENT | Primary Key | No |
| Dosen | nidn | CharField | VARCHAR(20) | - | No |
| Dosen | user | OneToOneField | INT | Foreign Key (User) | No |
| Dosen | nama | CharField | VARCHAR(100) | - | No |
| Dosen | program_studi | ForeignKey | INT | Foreign Key (ProgramStudi) | No |
| Dosen | jabatan | CharField | VARCHAR(50) | - | No |
| Dosen | no_telp | CharField | VARCHAR(15) | - | Yes |
| Dosen | email | EmailField | VARCHAR(254) | - | Yes |
| Dosen | alamat | TextField | LONGTEXT | - | Yes |
| Dosen | tempat_lahir | CharField | VARCHAR(100) | - | Yes |
| Dosen | tanggal_lahir | DateField | DATE | - | Yes |
| Dosen | jenis_kelamin | CharField | VARCHAR(10) | - | Yes |
| Dosen | pendidikan_terakhir | CharField | VARCHAR(50) | - | Yes |
| Dosen | gelar_depan | CharField | VARCHAR(20) | - | Yes |
| Dosen | gelar_belakang | CharField | VARCHAR(50) | - | Yes |
| Dosen | status_kepegawaian | CharField | VARCHAR(50) | - | Yes |
| Dosen | nip | CharField | VARCHAR(30) | - | Yes |
| Dosen | foto | CharField | VARCHAR(255) | - | Yes |

#### Mahasiswa
| Tabel (Model) | Field | Tipe Django | Tipe Database (Asumsi MySQL) | Primary/Foreign Key | Nullable |
|---------------|-------|-------------|-------------------------------|---------------------|----------|
| Mahasiswa | id | AutoField | INT AUTO_INCREMENT | Primary Key | No |
| Mahasiswa | nim | CharField | VARCHAR(15) | - | No |
| Mahasiswa | user | OneToOneField | INT | Foreign Key (User) | No |
| Mahasiswa | nama | CharField | VARCHAR(100) | - | No |
| Mahasiswa | program_studi | ForeignKey | INT | Foreign Key (ProgramStudi) | No |
| Mahasiswa | angkatan | IntegerField | INT | - | No |
| Mahasiswa | no_telp | CharField | VARCHAR(15) | - | Yes |
| Mahasiswa | email | EmailField | VARCHAR(254) | - | Yes |
| Mahasiswa | alamat | TextField | LONGTEXT | - | Yes |
| Mahasiswa | tempat_lahir | CharField | VARCHAR(100) | - | Yes |
| Mahasiswa | tanggal_lahir | DateField | DATE | - | Yes |
| Mahasiswa | jenis_kelamin | CharField | VARCHAR(10) | - | Yes |
| Mahasiswa | agama | CharField | VARCHAR(20) | - | Yes |
| Mahasiswa | status_mahasiswa | CharField | VARCHAR(20) | - | No |
| Mahasiswa | semester_berjalan | IntegerField | INT | - | Yes |
| Mahasiswa | nama_ayah | CharField | VARCHAR(100) | - | Yes |
| Mahasiswa | nama_ibu | CharField | VARCHAR(100) | - | Yes |
| Mahasiswa | pekerjaan_ayah | CharField | VARCHAR(100) | - | Yes |
| Mahasiswa | pekerjaan_ibu | CharField | VARCHAR(100) | - | Yes |
| Mahasiswa | no_telp_ortu | CharField | VARCHAR(15) | - | Yes |
| Mahasiswa | alamat_ortu | TextField | LONGTEXT | - | Yes |
| Mahasiswa | foto | CharField | VARCHAR(255) | - | Yes |

#### MataKuliah
| Tabel (Model) | Field | Tipe Django | Tipe Database (Asumsi MySQL) | Primary/Foreign Key | Nullable |
|---------------|-------|-------------|-------------------------------|---------------------|----------|
| MataKuliah | id | AutoField | INT AUTO_INCREMENT | Primary Key | No |
| MataKuliah | kode_mk | CharField | VARCHAR(10) | - | No |
| MataKuliah | nama_mk | CharField | VARCHAR(100) | - | No |
| MataKuliah | sks | IntegerField | INT | - | No |
| MataKuliah | program_studi | ForeignKey | INT | Foreign Key (ProgramStudi) | No |
| MataKuliah | semester | IntegerField | INT | - | No |
| MataKuliah | deskripsi | TextField | LONGTEXT | - | Yes |

#### Kelas
| Tabel (Model) | Field | Tipe Django | Tipe Database (Asumsi MySQL) | Primary/Foreign Key | Nullable |
|---------------|-------|-------------|-------------------------------|---------------------|----------|
| Kelas | id | AutoField | INT AUTO_INCREMENT | Primary Key | No |
| Kelas | kode_kelas | CharField | VARCHAR(20) | - | No |
| Kelas | mata_kuliah | ForeignKey | INT | Foreign Key (MataKuliah) | No |
| Kelas | dosen | ForeignKey | INT | Foreign Key (Dosen) | No |
| Kelas | tahun_ajaran | CharField | VARCHAR(9) | - | No |
| Kelas | semester | CharField | VARCHAR(10) | - | No |
| Kelas | kuota | IntegerField | INT | - | No |

#### KRS
| Tabel (Model) | Field | Tipe Django | Tipe Database (Asumsi MySQL) | Primary/Foreign Key | Nullable |
|---------------|-------|-------------|-------------------------------|---------------------|----------|
| KRS | id | AutoField | INT AUTO_INCREMENT | Primary Key | No |
| KRS | mahasiswa | ForeignKey | INT | Foreign Key (Mahasiswa) | No |
| KRS | kelas | ForeignKey | INT | Foreign Key (Kelas) | No |
| KRS | tanggal_daftar | DateTimeField | DATETIME | - | No |
| KRS | status | CharField | VARCHAR(10) | - | No |

#### Jadwal
| Tabel (Model) | Field | Tipe Django | Tipe Database (Asumsi MySQL) | Primary/Foreign Key | Nullable |
|---------------|-------|-------------|-------------------------------|---------------------|----------|
| Jadwal | id | AutoField | INT AUTO_INCREMENT | Primary Key | No |
| Jadwal | kelas | ForeignKey | INT | Foreign Key (Kelas) | No |
| Jadwal | hari | CharField | VARCHAR(10) | - | No |
| Jadwal | jam_mulai | TimeField | TIME | - | No |
| Jadwal | jam_selesai | TimeField | TIME | - | No |
| Jadwal | ruangan | CharField | VARCHAR(20) | - | No |

#### Presensi
| Tabel (Model) | Field | Tipe Django | Tipe Database (Asumsi MySQL) | Primary/Foreign Key | Nullable |
|---------------|-------|-------------|-------------------------------|---------------------|----------|
| Presensi | id | AutoField | INT AUTO_INCREMENT | Primary Key | No |
| Presensi | krs | ForeignKey | INT | Foreign Key (KRS) | No |
| Presensi | tanggal | DateField | DATE | - | No |
| Presensi | pertemuan_ke | IntegerField | INT | - | No |
| Presensi | status | CharField | VARCHAR(10) | - | No |
| Presensi | keterangan | TextField | LONGTEXT | - | Yes |
| Presensi | created_at | DateTimeField | DATETIME | - | No |

#### Nilai
| Tabel (Model) | Field | Tipe Django | Tipe Database (Asumsi MySQL) | Primary/Foreign Key | Nullable |
|---------------|-------|-------------|-------------------------------|---------------------|----------|
| Nilai | id | AutoField | INT AUTO_INCREMENT | Primary Key | No |
| Nilai | krs | OneToOneField | INT | Foreign Key (KRS) | No |
| Nilai | nilai_huruf | CharField | VARCHAR(2) | - | Yes |
| Nilai | nilai_angka | FloatField | DOUBLE | - | Yes |
| Nilai | created_at | DateTimeField | DATETIME | - | No |
| Nilai | updated_at | DateTimeField | DATETIME | - | No |

#### Notification
| Tabel (Model) | Field | Tipe Django | Tipe Database (Asumsi MySQL) | Primary/Foreign Key | Nullable |
|---------------|-------|-------------|-------------------------------|---------------------|----------|
| Notification | id | AutoField | INT AUTO_INCREMENT | Primary Key | No |
| Notification | user | ForeignKey | INT | Foreign Key (User) | No |
| Notification | krs | ForeignKey | INT | Foreign Key (KRS) | Yes |
| Notification | title | CharField | VARCHAR(200) | - | No |
| Notification | message | TextField | LONGTEXT | - | No |
| Notification | notification_type | CharField | VARCHAR(20) | - | No |
| Notification | is_read | BooleanField | TINYINT(1) | - | No |
| Notification | created_at | DateTimeField | DATETIME | - | No |

### 3. Diagram Relasi (Deskriptif)

**Relasi Utama:**
- **ProgramStudi → memiliki → MataKuliah**: One-to-Many (One program studi memiliki banyak mata kuliah)
- **ProgramStudi → memiliki → Dosen**: One-to-Many (One program studi memiliki banyak dosen)
- **ProgramStudi → memiliki → Mahasiswa**: One-to-Many (One program studi memiliki banyak mahasiswa)
- **Dosen → mengampu → Kelas**: One-to-Many (One dosen dapat mengampu banyak kelas)
- **MataKuliah → memiliki → Kelas**: One-to-Many (One mata kuliah dapat memiliki banyak kelas)
- **Mahasiswa → mengambil → Kelas (via KRS)**: Many-to-Many through KRS (Mahasiswa mengambil banyak kelas melalui KRS)
- **Kelas → memiliki → Jadwal**: One-to-Many (One kelas memiliki banyak jadwal)
- **KRS → memiliki → Presensi**: One-to-Many (Satu KRS memiliki banyak catatan presensi)
- **KRS → memiliki → Nilai**: One-to-One (Satu KRS memiliki satu nilai)
- **User → berperan sebagai → Mahasiswa**: One-to-One (Melalui OneToOneField)
- **User → berperan sebagai → Dosen**: One-to-One (Melalui OneToOneField)
- **User → memiliki → Notification**: One-to-Many (Satu user bisa menerima banyak notifikasi)

**Relasi dengan Opsi onDelete dan related_name:**
- Dosen.dosen_program_studi: onDelete=models.CASCADE
- Mahasiswa.mahasiswa_program_studi: onDelete=models.CASCADE
- KRS.mahasiswa: onDelete=models.CASCADE
- KRS.kelas: onDelete=models.CASCADE
- Jadwal.kelas: onDelete=models.CASCADE, related_name='jadwal'
- Presensi.krs: onDelete=models.CASCADE, related_name='presensi'
- Notification.user: onDelete=models.CASCADE, related_name='notifications'

### 4. Kualitas & Rekomendasi Desain

**Kelebihan:**
- Struktur database telah memperhatikan normalisasi dan menghindari duplikasi data
- Relasi antar entitas telah ditentukan dengan tepat
- Penggunaan constraint yang sesuai untuk mencegah data ganda (unique=True)
- Penggunaan choices field untuk membatasi nilai yang valid

**Kekurangan:**
- Beberapa field seperti `foto` menggunakan CharField daripada FileField (hanya menyimpan path)
- Tidak ada indeks khusus yang didefinisikan (selain default dan unique constraint)
- Field `foto` hanya menyimpan path tanpa validasi tipe file
- Tidak semua model memiliki metode `__str__` untuk tampilan admin

**Duplikasi Data:**
- Tidak ditemukan duplikasi data yang signifikan, struktur relasi sudah cukup baik

**Field tanpa Metaclass:**
- Beberapa model tidak memiliki `Meta.verbose_name` atau `Meta.verbose_name_plural`

### 5. Keamanan Database

**Isu Keamanan:**
- File `.env` tidak diabaikan dalam .gitignore, ini merupakan **risiko tinggi** karena mungkin akan tercommit
- Kredensial database saat ini disimpan melalui variabel lingkungan di .env

**Rekomendasi Keamanan:**
- Tambahkan `.env` ke file `.gitignore` agar tidak ikut tercommit ke Git
- Gunakan variabel lingkungan untuk semua kredensial (sudah dilakukan dengan baik)
- Gunakan role-based access control pada database MySQL
- Gunakan koneksi SSL ke database production

### 6. Rekomendasi Optimasi

**Indeks:**
- Tambahkan indeks untuk field yang sering di-filter seperti `nim`, `kode_mk`, `nidn`, dan `kode_kelas`
- Gunakan `db_index=True` untuk field-field yang sering digunakan dalam pencarian

**Query Optimization:**
- Gunakan `select_related()` untuk mengakses ForeignKey dalam loop
- Gunakan `prefetch_related()` untuk mengakses Many-to-Many relasi
- Implementasikan caching untuk query yang sering diakses (IPK, jadwal)

**Partisi:**
- Gunakan partisi tabel untuk Presensi dan KRS jika jumlah data > 100.000 record
- Gunakan partisi berdasarkan tahun semester untuk tabel Presensi

### 7. Lampiran: Struktur Model Penting

```python
class Mahasiswa(models.Model):
    nim = models.CharField(max_length=15, unique=True)
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    nama = models.CharField(max_length=100)
    program_studi = models.ForeignKey(ProgramStudi, on_delete=models.CASCADE)
    angkatan = models.IntegerField()
    no_telp = models.CharField(max_length=15, blank=True)
    email = models.EmailField(blank=True)
    alamat = models.TextField(blank=True)
    # ... (field lainnya)
    
    def __str__(self):
        return f"{self.nim} - {self.nama}"

class Dosen(models.Model):
    nidn = models.CharField(max_length=20, unique=True)
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    nama = models.CharField(max_length=100)
    program_studi = models.ForeignKey(ProgramStudi, on_delete=models.CASCADE)
    jabatan = models.CharField(max_length=50)
    # ... (field lainnya)
    
    def __str__(self):
        return self.nama

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

    def __str__(self):
        return f"{self.mahasiswa.nama} - {self.kelas.mata_kuliah.nama_mk}"

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
        ('A', 'A'), ('A-', 'A-'), ('B+', 'B+'), ('B', 'B'),
        ('B-', 'B-'), ('C+', 'C+'), ('C', 'C'), ('D', 'D'), ('E', 'E')
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
```