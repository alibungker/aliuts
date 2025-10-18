# Analisis Sistem Informasi Akademik (SIMKuliah)

## Daftar Isi
1. [Gambaran Umum Sistem](#gambaran-umum-sistem)
2. [Entity Relationship Diagram (ERD)](#entity-relationship-diagram-erd)
3. [Analisis Entitas](#analisis-entitas)
4. [Analisis Relasi](#analisis-relasi)
5. [Fitur-fitur Utama](#fitur-fitur-utama)
6. [Kesimpulan](#kesimpulan)

## Gambaran Umum Sistem

SIMKuliah adalah sistem informasi akademik berbasis Django yang dirancang untuk mengelola berbagai aspek operasional akademik seperti manajemen mahasiswa, dosen, mata kuliah, kelas, pendaftaran matakuliah (KRS), penilaian, presensi, dan sistem notifikasi. Sistem ini mendukung dua peran utama yaitu mahasiswa dan dosen, masing-masing dengan fungsionalitas khusus sesuai perannya.

### Teknologi yang Digunakan
- **Framework**: Django 5.2.7
- **Database**: MySQL
- **Bahasa Pemrograman**: Python
- **Integrasi AI**: Google Gemini API

## Entity Relationship Diagram (ERD)

Berikut adalah representasi visual dari struktur database SIMKuliah:

```
+------------------+        +---------------------+        +------------------+
|   ProgramStudi   |        |      MataKuliah     |        |      Kelas       |
+------------------+        +---------------------+        +------------------+
| id (PK)          |<-------| program_studi_id (FK)|        | id (PK)          |
| kode_prodi (U)   | 1    N | id (PK)             | 1    N | kode_kelas (U)   |
| nama_prodi       |        | kode_mk (U)         |--------| mata_kuliah_id (FK)|
| jenjang          |        | nama_mk             |        | dosen_id (FK)    |
+------------------+        | sks                 |        | tahun_ajaran     |
                           | semester            |        | semester         |
+------------------+        | deskripsi           |        | kuota            |
|      User        |        +---------------------+        +------------------+
+------------------+               | 1
| id (PK)          |               | N
| username         |               |
| email            |        +------------------+
| password         |        |     Dosen        |
| ...              |        +------------------+
+------------------+        | id (PK)          |
    | 1                     | nidn (U)         |
    | N                     | user_id (FK)     |
+------------------+        | nama             |
|   Mahasiswa      |        | program_studi_id (FK)|
+------------------+        | jabatan          |
| id (PK)          |        | no_telp          |
| nim (U)          |        | email            |
| user_id (FK)     |        | alamat           |
| nama             |        | tempat_lahir     |
| program_studi_id (FK)|    | tanggal_lahir    |
| angkatan         |        | jenis_kelamin    |
| no_telp          |        | pendidikan_terakhir|
| email            |        | gelar_depan      |
| alamat           |        | gelar_belakang   |
| tempat_lahir     |        | status_kepegawaian|
| tanggal_lahir    |        | nip              |
| jenis_kelamin    |        | foto             |
| agama            |        +------------------+
| status_mahasiswa |
| semester_berjalan|        +------------------+
| nama_ayah        |        |    Jadwal        |
| nama_ibu         |        +------------------+
| pekerjaan_ayah   |        | id (PK)          |
| pekerjaan_ibu    |        | kelas_id (FK)    |
| no_telp_ortu     |        | hari             |
| alamat_ortu      |        | jam_mulai        |
| foto             |        | jam_selesai      |
+------------------+        | ruangan          |
    | 1                     +------------------+
    | N                         | N
+------------------+            | 1
|      KRS         |------------+
+------------------+ 1
| id (PK)          | N
| mahasiswa_id (FK)|--------+
| kelas_id (FK)    |       |
| tanggal_daftar   |       |
| status           |       |
+------------------+       |
    | 1                    |
    | N                    |
+------------------+       |
|     Presensi     |       |
+------------------+       |
| id (PK)          |       |
| krs_id (FK)      |-------+
| tanggal          | 1
| pertemuan_ke     | N     +------------------+
| status           |       |      Nilai       |
| keterangan       |       +------------------+
| created_at       |       | id (PK)          |
+------------------+       | krs_id (FK)      |
                           | nilai_huruf      |
+------------------+       | nilai_angka      |
|  Notification    |       | created_at       |
+------------------+       | updated_at       |
| id (PK)          |       +------------------+
| user_id (FK)     |
| krs_id (FK)      |
| title            |
| message          |
| notification_type|
| is_read          |
| created_at       |
+------------------+

```

### Kardinalitas Relasi:
- ProgramStudi 1 : N MataKuliah
- ProgramStudi 1 : N Dosen
- ProgramStudi 1 : N Mahasiswa
- MataKuliah 1 : N Kelas
- Dosen 1 : N Kelas
- Mahasiswa 1 : N KRS
- Kelas 1 : N KRS
- KRS 1 : 1 Nilai
- KRS 1 : N Presensi
- User 1 : 1 Mahasiswa
- User 1 : 1 Dosen
- User 1 : N Notification
- Kelas 1 : N Jadwal

## Analisis Entitas

### 1. ProgramStudi
Entitas ini merepresentasikan program studi atau jurusan di institusi pendidikan.
- **Atribut**: id (PK), kode_prodi (unik), nama_prodi, jenjang (D3/S1/S2/S3)
- **Deskripsi**: Mengelompokkan mata kuliah, mahasiswa, dan dosen berdasarkan bidang studi

### 2. MataKuliah
Entitas yang merepresentasikan mata kuliah yang ditawarkan.
- **Atribut**: id (PK), kode_mk (unik), nama_mk, sks, semester, deskripsi, program_studi_id (FK)
- **Deskripsi**: Informasi lengkap tentang mata kuliah termasuk jumlah SKS dan semester diselenggarakan

### 3. Kelas
Entitas yang merepresentasikan kelas spesifik dari suatu mata kuliah.
- **Atribut**: id (PK), kode_kelas (unik), mata_kuliah_id (FK), dosen_id (FK), tahun_ajaran, semester, kuota
- **Deskripsi**: Koneksi antara mata kuliah dengan dosen pengajar dan kapasitas kelas

### 4. User (Django Auth)
Sistem otentikasi bawaan Django sebagai basis identitas pengguna.
- **Atribut**: id (PK), username, email, password (hashed), dll
- **Deskripsi**: Entitas dasar untuk otentikasi sistem

### 5. Mahasiswa
Entitas yang merepresentasikan mahasiswa dalam sistem.
- **Atribut**: id (PK), nim (unik), user_id (FK), nama, program_studi_id (FK), angkatan, no_telp, email, alamat, tempat_lahir, tanggal_lahir, jenis_kelamin, agama, status_mahasiswa, semester_berjalan, nama_ayah, nama_ibu, pekerjaan_ayah, pekerjaan_ibu, no_telp_ortu, alamat_ortu, foto
- **Deskripsi**: Informasi lengkap tentang mahasiswa termasuk data pribadi dan keluarga

### 6. Dosen
Entitas yang merepresentasikan dosen pengajar.
- **Atribut**: id (PK), nidn (unik), user_id (FK), nama, program_studi_id (FK), jabatan, no_telp, email, alamat, tempat_lahir, tanggal_lahir, jenis_kelamin, pendidikan_terakhir, gelar_depan, gelar_belakang, status_kepegawaian, nip, foto
- **Deskripsi**: Informasi lengkap tentang dosen termasuk data profesional

### 7. KRS (Kartu Rencana Studi)
Entitas yang merepresentasikan pendaftaran mata kuliah oleh mahasiswa.
- **Atribut**: id (PK), mahasiswa_id (FK), kelas_id (FK), tanggal_daftar, status (pending/disetujui/ditolak)
- **Deskripsi**: Proses pendaftaran mata kuliah dengan sistem persetujuan dari dosen

### 8. Jadwal
Entitas yang merepresentasikan jadwal kelas.
- **Atribut**: id (PK), kelas_id (FK), hari (Senin-Sabtu), jam_mulai, jam_selesai, ruangan
- **Deskripsi**: Penjadwalan pertemuan kelas termasuk hari, waktu, dan tempat

### 9. Presensi
Entitas yang merepresentasikan kehadiran mahasiswa.
- **Atribut**: id (PK), krs_id (FK), tanggal, pertemuan_ke, status (hadir/izin/sakit/alpha), keterangan, created_at
- **Deskripsi**: Sistem presensi yang dihubungkan dengan KRS mahasiswa

### 10. Nilai
Entitas yang merepresentasikan nilai akademik mahasiswa.
- **Atribut**: id (PK), krs_id (FK), nilai_huruf (A-E), nilai_angka, created_at, updated_at
- **Deskripsi**: Penilaian akademik untuk setiap KRS yang telah diselesaikan

### 11. Notification
Entitas yang merepresentasikan notifikasi dalam sistem.
- **Atribut**: id (PK), user_id (FK), krs_id (FK), title, message, notification_type (krs_pending/krs_approved/krs_rejected/info), is_read, created_at
- **Deskripsi**: Sistem notifikasi untuk menginformasikan update penting

## Analisis Relasi

### Relasi One-to-Many (1:N)
- ProgramStudi ke MataKuliah: Satu program studi bisa memiliki banyak mata kuliah
- MataKuliah ke Kelas: Satu mata kuliah bisa memiliki banyak kelas (paralel)
- Dosen ke Kelas: Satu dosen bisa mengajar banyak kelas
- Mahasiswa ke KRS: Satu mahasiswa bisa memiliki banyak KRS (dalam berbagai semester)
- KRS ke Presensi: Satu KRS bisa memiliki banyak catatan presensi
- User ke Notification: Satu user bisa menerima banyak notifikasi

### Relasi One-to-One (1:1)
- User ke Mahasiswa: Setiap user terhubung ke satu entitas mahasiswa
- User ke Dosen: Setiap user terhubung ke satu entitas dosen
- KRS ke Nilai: Setiap KRS memiliki satu nilai (ketika telah dinilai)

### Relasi Many-to-Many (M:N)
- Dosen dan Mahasiswa melalui Kelas: Dosen mengajar banyak mahasiswa dalam suatu kelas
- Mahasiswa dan MataKuliah melalui KRS: Mahasiswa mengambil banyak mata kuliah melalui KRS

### Kekangan dan Indeks
- **Unique Constraints**: kode_prodi, kode_mk, kode_kelas, nidn, nim
- **Composite Unique Constraints**: (mahasiswa_id, kelas_id) di KRS untuk mencegah pendaftaran ganda
- **Composite Unique Constraints**: (krs_id, pertemuan_ke) di Presensi untuk mencegah duplikasi presensi
- **Check Constraints**: Status (pending/disetujui/ditolak), jenis_kelamin (L/P), hari (Senin-Sabtu), nilai (A-E)

## Fitur-fitur Utama

### 1. Sistem Otorisasi Role-based
- Peran Mahasiswa: Mengelola KRS, melihat jadwal, presensi, nilai, biodata
- Peran Dosen: Mengelola kelas, input nilai dan presensi, menyetujui KRS mahasiswa
- Sistem login terintegrasi dengan Django Auth

### 2. Workflow Persetujuan KRS
- Mahasiswa mendaftar ke kelas dengan status pending
- Dosen menyetujui atau menolak KRS mahasiswa
- Sistem notifikasi otomatis untuk perubahan status KRS

### 3. Sistem Penilaian Lengkap
- Konversi nilai angka ke huruf (A-E)
- Perhitungan IPK (Indeks Prestasi Kumulatif) dan IPS (Indeks Prestasi Semester)
- Penyimpanan nilai dalam format huruf dan numerik

### 4. Sistem Presensi Terpadu
- Presensi per pertemuan dengan status lengkap (hadir/izin/sakit/alpha)
- Penyimpanan tanggal dan nomor pertemuan
- Koneksi langsung dengan KRS mahasiswa

### 5. Manajemen Jadwal
- Penjadwalan fleksibel per kelas
- Dukungan untuk jadwal yang berulang di berbagai hari
- Integrasi dengan sistem presensi

### 6. Integrasi AI Gemini
- CLI berbasis AI untuk bantuan pengembangan
- Fasilitas debugging dan pembuatan kode otomatis
- Manajemen perintah Django terintegrasi

## Kesimpulan

Desain database SIMKuliah merepresentasikan sistem informasi akademik yang komprehensif dengan struktur relasional yang baik. Skema ini mendukung semua fungsi akademik utama termasuk manajemen mahasiswa, dosen, pendaftaran mata kuliah, penilaian, dan presensi. 

Desain ini menunjukkan prinsip-prinsip basis data relasional yang baik dengan normalisasi yang meminimalkan redundansi data. Relasi antar entitas telah ditentukan dengan tepat untuk mendukung kompleksitas operasi akademik. Sistem persetujuan KRS menambahkan fitur administratif penting, sementara sistem notifikasi memastikan alur informasi yang efektif.

Skema database ini siap untuk mendukung institusi pendidikan dengan berbagai program studi, mata kuliah, dan pengguna dalam jumlah besar. Integrasi dengan sistem AI Gemini juga memberikan kemudahan dalam pengembangan dan pengelolaan sistem secara keseluruhan.