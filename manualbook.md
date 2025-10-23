# MANUAL BOOK
# SISTEM INFORMASI AKADEMIK (SIAKAD)
## aliuts.bungker.co.id

---

## Daftar Isi

1. [Pendahuluan](#pendahuluan)
2. [Akses Sistem](#akses-sistem)
3. [Panduan untuk Admin](#panduan-untuk-admin)
4. [Panduan untuk Dosen](#panduan-untuk-dosen)
5. [Panduan untuk Mahasiswa](#panduan-untuk-mahasiswa)
6. [FAQ & Troubleshooting](#faq--troubleshooting)

---

## Pendahuluan

### Tentang Sistem

Sistem Informasi Akademik (SIAKAD) adalah aplikasi berbasis web yang dirancang untuk mengelola data akademik perguruan tinggi. Sistem ini menyediakan fitur-fitur untuk:

- **Administrator**: Mengelola data master (Fakultas, Program Studi, Mahasiswa, Dosen, Mata Kuliah, Ruang)
- **Dosen**: Mengelola kelas, input nilai, presensi, dan persetujuan KRS
- **Mahasiswa**: Melihat jadwal, mengisi KRS, melihat KHS, dan presensi

### URL Akses

- **URL Utama**: https://aliuts.bungker.co.id
- **Admin Panel**: https://aliuts.bungker.co.id/admin/
- **Dashboard Dosen**: https://aliuts.bungker.co.id/dosen/
- **Dashboard Mahasiswa**: https://aliuts.bungker.co.id/mahasiswa/

---

## Akses Sistem

### Login ke Sistem

1. Buka browser (Chrome, Firefox, Edge, atau Safari)
2. Akses URL: `https://aliuts.bungker.co.id/admin/`
3. Masukkan **Username** dan **Password** yang telah diberikan
4. Klik tombol **Log in**

![Login Page](https://via.placeholder.com/800x400/4e73df/ffffff?text=Login+Page)

### Logout dari Sistem

1. Klik menu **user profile** di pojok kanan atas
2. Pilih **Logout**
3. Anda akan diarahkan kembali ke halaman login

---

## Panduan untuk Admin

### Dashboard Admin

Setelah login sebagai admin, Anda akan melihat dashboard dengan informasi:

- **Total Mahasiswa**: Jumlah seluruh mahasiswa terdaftar
- **Total Dosen**: Jumlah seluruh dosen
- **Total Kelas**: Jumlah kelas yang aktif
- **Mata Kuliah**: Total mata kuliah

![Admin Dashboard](https://via.placeholder.com/800x400/4e73df/ffffff?text=Admin+Dashboard)

### A. Mengelola Data Fakultas

#### Melihat Daftar Fakultas

1. Dari sidebar, klik **Master Data** → **Fakultas**
2. Anda akan melihat tabel berisi:
   - Kode Fakultas
   - Nama Fakultas
   - Dekan
   - Jumlah Program Studi
   - Jumlah Mahasiswa

![Fakultas List](https://via.placeholder.com/800x400/4e73df/ffffff?text=Daftar+Fakultas)

#### Menambah Fakultas Baru

1. Klik tombol **Add Fakultas** di pojok kanan atas
2. Isi form dengan data:
   - **Kode Fakultas**: Kode unik (contoh: FT, FMIPA)
   - **Nama Fakultas**: Nama lengkap fakultas
   - **Dekan**: Nama dekan
   - **No. Telepon**: Nomor kontak
   - **Email**: Email fakultas
   - **Alamat**: Alamat lengkap
3. Klik tombol **Save**

![Add Fakultas](https://via.placeholder.com/800x400/4e73df/ffffff?text=Form+Tambah+Fakultas)

#### Mengedit Data Fakultas

1. Pada tabel fakultas, klik icon **Edit** (pensil)
2. Ubah data yang diperlukan
3. Klik tombol **Save**

#### Menghapus Data Fakultas

1. Klik icon **Delete** (trash) pada fakultas yang akan dihapus
2. Konfirmasi penghapusan
3. Data akan dihapus permanen

**⚠️ Peringatan**: Pastikan tidak ada Program Studi yang terhubung sebelum menghapus fakultas.

---

### B. Mengelola Program Studi

#### Melihat Daftar Program Studi

1. Klik **Master Data** → **Program Studi**
2. Tabel menampilkan:
   - Kode Prodi
   - Nama Program Studi
   - Fakultas
   - Jenjang (D3/S1/S2/S3)
   - Ketua Prodi

![Program Studi List](https://via.placeholder.com/800x400/4e73df/ffffff?text=Daftar+Program+Studi)

#### Menambah Program Studi

1. Klik **Add Program Studi**
2. Isi form:
   - **Kode Prodi**: Kode unik
   - **Nama Program Studi**: Nama lengkap
   - **Fakultas**: Pilih dari dropdown
   - **Jenjang**: D3/S1/S2/S3
   - **Kaprodi**: Nama ketua program studi
3. Klik **Save**

---

### C. Mengelola Data Mahasiswa

#### Melihat Daftar Mahasiswa

1. Klik **Master Data** → **Mahasiswa**
2. Tabel menampilkan:
   - NIM
   - Nama Mahasiswa
   - Program Studi
   - Angkatan
   - Status (Aktif/Cuti/Lulus/DO)
   - Semester Berjalan

![Mahasiswa List](https://via.placeholder.com/800x400/4e73df/ffffff?text=Daftar+Mahasiswa)

#### Filter dan Pencarian

- Gunakan **Search Box** untuk mencari berdasarkan NIM atau Nama
- Filter berdasarkan:
  - Program Studi
  - Angkatan
  - Status Mahasiswa

#### Menambah Mahasiswa Baru

1. Klik **Add Mahasiswa**
2. Isi **Data Pribadi**:
   - NIM
   - Nama Lengkap
   - Tempat, Tanggal Lahir
   - Jenis Kelamin
   - Agama
   - No. Telepon
   - Email
   - Alamat
3. Isi **Data Akademik**:
   - Program Studi
   - Angkatan
   - Semester Berjalan
   - Status Mahasiswa
4. Isi **Data Orang Tua**:
   - Nama Ayah & Ibu
   - Pekerjaan Ayah & Ibu
   - No. Telp Orang Tua
   - Alamat Orang Tua
5. **Upload Foto** (opsional)
6. Klik **Save**

![Add Mahasiswa](https://via.placeholder.com/800x400/4e73df/ffffff?text=Form+Tambah+Mahasiswa)

**📌 Catatan Penting**:
- NIM harus unik dan tidak boleh duplikat
- Sistem akan otomatis membuat akun user dengan username = NIM
- Password default adalah NIM (mahasiswa diminta mengubahnya)

#### Mengedit Data Mahasiswa

1. Klik icon **Edit** pada mahasiswa yang akan diubah
2. Ubah data yang diperlukan
3. Klik **Save**

#### Upload Foto Mahasiswa

1. Edit data mahasiswa
2. Scroll ke bagian **Foto**
3. Klik **Choose File** dan pilih foto (format: JPG, PNG, max 2MB)
4. Klik **Save**

---

### D. Mengelola Data Dosen

#### Melihat Daftar Dosen

1. Klik **Master Data** → **Dosen**
2. Tabel menampilkan:
   - NIDN
   - Nama Dosen
   - Program Studi
   - Jabatan
   - Status Kepegawaian
   - Total Kelas

![Dosen List](https://via.placeholder.com/800x400/4e73df/ffffff?text=Daftar+Dosen)

#### Menambah Dosen Baru

1. Klik **Add Dosen**
2. Isi **Data Pribadi**:
   - NIDN
   - Nama Lengkap
   - Gelar Depan & Belakang
   - Tempat, Tanggal Lahir
   - Jenis Kelamin
   - No. Telepon
   - Email
   - Alamat
3. Isi **Data Kepegawaian**:
   - Program Studi
   - Jabatan (Asisten Ahli/Lektor/Lektor Kepala/Profesor)
   - Status Kepegawaian (PNS/Kontrak/Tetap/Honorer)
   - NIP
   - Pendidikan Terakhir
4. **Upload Foto** (opsional)
5. Klik **Save**

**📌 Catatan Penting**:
- NIDN harus unik
- Username = NIDN
- Password default = NIDN

---

### E. Mengelola Mata Kuliah

#### Melihat Daftar Mata Kuliah

1. Klik **Master Data** → **Mata Kuliah**
2. Tabel menampilkan:
   - Kode MK
   - Nama Mata Kuliah
   - SKS
   - Program Studi
   - Semester

![Mata Kuliah List](https://via.placeholder.com/800x400/4e73df/ffffff?text=Daftar+Mata+Kuliah)

#### Menambah Mata Kuliah

1. Klik **Add Mata Kuliah**
2. Isi form:
   - **Kode MK**: Kode unik (contoh: IF101, MTK201)
   - **Nama Mata Kuliah**: Nama lengkap
   - **SKS**: Jumlah SKS (1-6)
   - **Program Studi**: Pilih dari dropdown
   - **Semester**: Semester ke berapa (1-8)
   - **Deskripsi**: Deskripsi singkat (opsional)
3. Klik **Save**

---

### F. Mengelola Ruang Kelas

#### Melihat Daftar Ruang

1. Klik **Master Data** → **Ruang**
2. Tabel menampilkan:
   - Kode Ruang
   - Nama Ruang
   - Gedung
   - Lantai
   - Kapasitas
   - Jenis (Kelas/Lab/Seminar)
   - Status

![Ruang List](https://via.placeholder.com/800x400/4e73df/ffffff?text=Daftar+Ruang)

#### Menambah Ruang Baru

1. Klik **Add Ruang**
2. Isi form:
   - **Kode Ruang**: Kode unik
   - **Nama Ruang**: Nama ruang
   - **Gedung**: Nama gedung
   - **Lantai**: Nomor lantai
   - **Kapasitas**: Kapasitas maksimal
   - **Jenis Ruang**: Kelas/Lab/Seminar/Auditorium/Kantor
   - **Fasilitas**: Daftar fasilitas (AC, Proyektor, dll)
   - **Status**: Aktif/Maintenance/Tidak Aktif
3. Klik **Save**

---

### G. Mengelola Semester

#### Melihat Daftar Semester

1. Klik **Akademik** → **Semester**
2. Tabel menampilkan:
   - Kode Semester
   - Nama Semester
   - Tahun Ajaran
   - Jenis (Ganjil/Genap)
   - Tanggal Mulai & Selesai
   - Status Aktif

![Semester List](https://via.placeholder.com/800x400/4e73df/ffffff?text=Daftar+Semester)

#### Menambah Semester Baru

1. Klik **Tambah Semester**
2. Isi form:
   - **Kode Semester**: Contoh: 20251 (Tahun + 1 untuk Ganjil, 2 untuk Genap)
   - **Nama Semester**: Contoh: Semester Ganjil 2025/2026
   - **Tahun Ajaran**: 2025/2026
   - **Jenis Semester**: Ganjil/Genap
   - **Tanggal Mulai**: Tanggal mulai perkuliahan
   - **Tanggal Selesai**: Tanggal akhir perkuliahan
   - **Aktif**: Centang jika semester aktif
3. Klik **Save**

**📌 Catatan**: Hanya satu semester yang boleh aktif pada satu waktu.

---

### H. Mengelola Jadwal Kuliah

#### Melihat Daftar Jadwal

1. Klik **Akademik** → **Jadwal**
2. Filter berdasarkan:
   - Hari
   - Program Studi
   - Semester

![Jadwal List](https://via.placeholder.com/800x400/4e73df/ffffff?text=Daftar+Jadwal)

#### Menambah Jadwal Baru

1. Klik **Tambah Jadwal**
2. Isi form:
   - **Kelas**: Pilih kelas
   - **Hari**: Senin - Sabtu
   - **Jam Mulai**: Contoh: 08:00
   - **Jam Selesai**: Contoh: 10:00
   - **Ruangan**: Pilih ruangan yang tersedia
3. Klik **Save**

**⚠️ Sistem akan otomatis mengecek konflik jadwal**:
- Bentrok dosen
- Bentrok ruangan
- Bentrok mahasiswa

---

### I. Mengelola Kelas

#### Melihat Daftar Kelas

1. Klik **Akademik** → **Penawaran Kelas**
2. Tabel menampilkan:
   - Kode Kelas
   - Mata Kuliah
   - Dosen Pengampu
   - Tahun Ajaran
   - Semester
   - Kuota

#### Menambah Kelas Baru

1. Klik **Add Kelas**
2. Isi form:
   - **Kode Kelas**: Contoh: IF101-A
   - **Mata Kuliah**: Pilih dari dropdown
   - **Dosen**: Pilih dosen pengampu
   - **Tahun Ajaran**: 2024/2025
   - **Semester**: Ganjil/Genap
   - **Kuota**: Kapasitas maksimal mahasiswa
3. Klik **Save**

---

## Panduan untuk Dosen

### Login Dosen

1. Akses: `https://aliuts.bungker.co.id/admin/`
2. Username: **NIDN Anda**
3. Password: **Password yang diberikan**
4. Setelah login, klik **View site** atau akses `/dosen/`

![Dosen Dashboard](https://via.placeholder.com/800x400/1cc88a/ffffff?text=Dashboard+Dosen)

### Dashboard Dosen

Dashboard menampilkan:
- **Total Kelas**: Jumlah kelas yang diampu
- **Total Mahasiswa**: Total mahasiswa di semua kelas
- **Pending KRS**: KRS yang menunggu persetujuan
- **Notifikasi**: Pengumuman dan notifikasi terbaru

---

### A. Mengelola Kelas

#### Melihat Daftar Kelas

1. Klik menu **Kelas** di sidebar
2. Anda akan melihat semua kelas yang Anda ampu
3. Informasi yang ditampilkan:
   - Kode Kelas
   - Mata Kuliah
   - Semester
   - Jumlah Mahasiswa
   - Aksi (Detail, Nilai, Presensi)

![Dosen Kelas](https://via.placeholder.com/800x400/1cc88a/ffffff?text=Daftar+Kelas+Dosen)

#### Melihat Detail Kelas

1. Klik **Detail** pada kelas yang ingin dilihat
2. Informasi yang ditampilkan:
   - Daftar mahasiswa yang terdaftar
   - Jadwal kuliah
   - Statistik kehadiran
   - Progres nilai

---

### B. Input Nilai

#### Menginput Nilai Mahasiswa

1. Dari daftar kelas, klik **Nilai**
2. Tabel menampilkan daftar mahasiswa
3. Untuk setiap mahasiswa, input:
   - **Nilai Tugas**: 0-100
   - **Nilai UTS**: 0-100
   - **Nilai UAS**: 0-100
   - **Nilai Praktikum**: 0-100 (jika ada)
4. Sistem akan otomatis menghitung:
   - **Nilai Akhir** (sesuai bobot yang ditentukan)
   - **Nilai Huruf** (A, B, C, D, E)
5. Klik **Save** untuk menyimpan

![Input Nilai](https://via.placeholder.com/800x400/1cc88a/ffffff?text=Form+Input+Nilai)

**📊 Konversi Nilai Huruf**:
- A: 85-100
- B: 70-84
- C: 55-69
- D: 40-54
- E: 0-39

---

### C. Input Presensi

#### Mencatat Kehadiran Mahasiswa

1. Dari daftar kelas, klik **Presensi**
2. Pilih **Tanggal** dan **Pertemuan ke-**
3. Untuk setiap mahasiswa, pilih status:
   - **Hadir**: Mahasiswa hadir
   - **Izin**: Mahasiswa izin (dengan surat)
   - **Sakit**: Mahasiswa sakit (dengan surat)
   - **Alpa**: Mahasiswa tidak hadir tanpa keterangan
4. Tambahkan **Keterangan** jika diperlukan
5. Klik **Save**

![Input Presensi](https://via.placeholder.com/800x400/1cc88a/ffffff?text=Form+Input+Presensi)

**📌 Catatan**:
- Presensi dapat diinput maksimal 3 hari setelah perkuliahan
- Persentase kehadiran otomatis dihitung

---

### D. Persetujuan KRS

#### Menyetujui/Menolak KRS Mahasiswa

1. Klik menu **Notifikasi** atau lihat di dashboard
2. Anda akan melihat daftar KRS yang menunggu persetujuan
3. Review informasi mahasiswa:
   - Nama & NIM
   - Mata kuliah yang diambil
   - Total SKS
   - IP semester sebelumnya
4. Klik **Approve** untuk menyetujui
5. Klik **Reject** untuk menolak (berikan alasan)

![Approval KRS](https://via.placeholder.com/800x400/1cc88a/ffffff?text=Persetujuan+KRS)

**📌 Aturan Pengambilan SKS**:
- IP ≥ 3.00: Maksimal 24 SKS
- IP 2.50-2.99: Maksimal 21 SKS
- IP 2.00-2.49: Maksimal 18 SKS
- IP < 2.00: Maksimal 15 SKS

---

### E. Biodata Dosen

#### Melihat & Edit Biodata

1. Klik menu **Biodata**
2. Lihat informasi profil Anda
3. Klik **Edit Biodata** untuk mengubah:
   - Foto profil
   - No. Telepon
   - Email
   - Alamat
4. Klik **Save**

![Biodata Dosen](https://via.placeholder.com/800x400/1cc88a/ffffff?text=Biodata+Dosen)

#### Cetak Kartu Dosen

1. Klik **Cetak Kartu** dari menu Biodata
2. Sistem akan generate kartu identitas dosen
3. Klik **Print** atau **Download PDF**

---

## Panduan untuk Mahasiswa

### Login Mahasiswa

1. Akses: `https://aliuts.bungker.co.id/admin/`
2. Username: **NIM Anda**
3. Password: **Password yang diberikan**
4. Setelah login, klik **View site** atau akses `/mahasiswa/`

![Mahasiswa Dashboard](https://via.placeholder.com/800x400/36b9cc/ffffff?text=Dashboard+Mahasiswa)

### Dashboard Mahasiswa

Dashboard menampilkan:
- **Informasi Profil**: Nama, NIM, Program Studi, Semester
- **IPK**: Indeks Prestasi Kumulatif
- **SKS Diambil**: Total SKS semester berjalan
- **Jadwal Hari Ini**: Jadwal kuliah hari ini
- **Pengumuman**: Informasi terbaru

---

### A. Mengisi KRS (Kartu Rencana Studi)

#### Langkah-langkah Mengisi KRS

1. Klik menu **KRS** di sidebar
2. Pastikan periode KRS sedang aktif
3. Lihat daftar mata kuliah yang tersedia
4. Untuk menambah mata kuliah:
   - Klik **Tambah** pada mata kuliah yang diinginkan
   - Pilih **Kelas** (jika ada lebih dari satu kelas)
   - Konfirmasi dengan klik **Tambah**
5. Untuk menghapus mata kuliah:
   - Klik **Hapus** pada mata kuliah yang sudah dipilih
   - Konfirmasi penghapusan

![KRS Mahasiswa](https://via.placeholder.com/800x400/36b9cc/ffffff?text=Form+KRS+Mahasiswa)

**📌 Catatan Penting**:
- Perhatikan batas maksimal SKS sesuai IP Anda
- Pastikan tidak ada jadwal yang bentrok
- Cek prasyarat mata kuliah
- KRS harus disetujui oleh dosen wali

#### Mencetak KRS

1. Setelah KRS disetujui, klik **Cetak KRS**
2. File PDF akan otomatis terunduh
3. Print dan minta tanda tangan dosen wali

---

### B. Melihat KHS (Kartu Hasil Studi)

#### Melihat Nilai Semester

1. Klik menu **KHS**
2. Pilih **Semester** yang ingin dilihat
3. Informasi yang ditampilkan:
   - Kode & Nama Mata Kuliah
   - SKS
   - Nilai Huruf
   - Nilai Angka
   - Mutu (SKS × Nilai)
4. Di bagian bawah terlihat:
   - **IPS**: IP Semester
   - **Total SKS**: SKS yang diambil
   - **IPK**: IP Kumulatif

![KHS Mahasiswa](https://via.placeholder.com/800x400/36b9cc/ffffff?text=KHS+Mahasiswa)

#### Mencetak KHS

1. Klik **Cetak KHS**
2. Pilih semester atau **Cetak Semua**
3. File PDF akan terunduh
4. Print untuk arsip

---

### C. Melihat Jadwal Kuliah

#### Jadwal Mingguan

1. Klik menu **Jadwal**
2. Tabel menampilkan jadwal per hari:
   - **Hari**
   - **Jam**
   - **Mata Kuliah**
   - **Dosen**
   - **Ruangan**
3. Filter berdasarkan hari atau mata kuliah

![Jadwal Kuliah](https://via.placeholder.com/800x400/36b9cc/ffffff?text=Jadwal+Kuliah+Mahasiswa)

#### Notifikasi Jadwal

- Sistem akan mengirim notifikasi H-1 sebelum kuliah
- Notifikasi perubahan jadwal mendadak

---

### D. Melihat Presensi

#### Rekap Kehadiran

1. Klik menu **Presensi**
2. Pilih **Mata Kuliah**
3. Informasi yang ditampilkan:
   - Pertemuan ke-
   - Tanggal
   - Status Kehadiran (Hadir/Izin/Sakit/Alpa)
   - Keterangan
4. **Persentase Kehadiran** ditampilkan di atas

![Presensi Mahasiswa](https://via.placeholder.com/800x400/36b9cc/ffffff?text=Presensi+Mahasiswa)

**⚠️ Peringatan**:
- Kehadiran minimal 75% untuk mengikuti ujian
- Jika kehadiran < 75%, tidak dapat mengikuti UAS

---

### E. Biodata Mahasiswa

#### Melihat & Edit Biodata

1. Klik menu **Biodata**
2. Informasi yang ditampilkan:
   - **Data Pribadi**: Nama, NIM, Tempat/Tanggal Lahir, dll
   - **Data Akademik**: Program Studi, Angkatan, Status
   - **Data Orang Tua**: Nama, Pekerjaan, Kontak
3. Klik **Edit Biodata** untuk mengubah:
   - Foto profil
   - No. Telepon
   - Email
   - Alamat
   - Data orang tua
4. Klik **Save**

![Biodata Mahasiswa](https://via.placeholder.com/800x400/36b9cc/ffffff?text=Biodata+Mahasiswa)

**📌 Catatan**: Data yang tidak dapat diubah:
- NIM
- Nama Lengkap
- Program Studi
- Angkatan

(Hubungi admin untuk perubahan data tersebut)

#### Cetak Kartu Mahasiswa

1. Klik **Cetak Kartu** dari menu Biodata
2. Kartu mahasiswa akan ditampilkan dengan:
   - Foto
   - NIM
   - Nama
   - Program Studi
   - Masa Berlaku
3. Klik **Print** atau **Download PDF**

![Kartu Mahasiswa](https://via.placeholder.com/800x400/36b9cc/ffffff?text=Kartu+Mahasiswa)

---

## FAQ & Troubleshooting

### Pertanyaan Umum

#### 1. Lupa Password, apa yang harus dilakukan?

**Untuk Mahasiswa & Dosen**:
- Hubungi admin IT
- Berikan NIM/NIDN Anda
- Admin akan melakukan reset password
- Password baru akan dikirim via email/WA

**Untuk Admin**:
- Gunakan fitur "Forgot Password" di halaman login
- Atau hubungi super admin

---

#### 2. Tidak bisa login, selalu error?

**Penyebab umum**:
- Username atau password salah
- Akun belum diaktifkan
- Browser cache bermasalah

**Solusi**:
1. Pastikan username dan password benar (perhatikan huruf besar/kecil)
2. Coba gunakan browser lain (Chrome/Firefox)
3. Clear cache & cookies browser
4. Hubungi admin jika masih bermasalah

---

#### 3. Jadwal bentrok saat mengisi KRS?

**Sistem akan otomatis memblokir** pengambilan mata kuliah dengan jadwal bentrok.

**Solusi**:
- Pilih kelas lain dengan jadwal berbeda
- Atau konsultasi dengan dosen wali untuk solusi

---

#### 4. Tidak bisa input nilai (untuk Dosen)?

**Penyebab**:
- Periode input nilai belum dibuka
- Kelas tidak terdaftar atas nama Anda
- Mahasiswa belum terdaftar di kelas

**Solusi**:
1. Cek periode input nilai di admin
2. Pastikan Anda adalah dosen pengampu kelas tersebut
3. Hubungi admin jika ada kesalahan data

---

#### 5. Nilai belum muncul di KHS (untuk Mahasiswa)?

**Penyebab**:
- Dosen belum menginput nilai
- Nilai belum di-finalisasi
- Periode penerbitan KHS belum aktif

**Solusi**:
- Tunggu sampai periode penerbitan nilai
- Hubungi dosen pengampu jika sudah melewati batas waktu
- Konfirmasi ke admin akademik

---

#### 6. Upload foto gagal?

**Penyebab**:
- Ukuran file terlalu besar (max 2MB)
- Format file tidak didukung
- Koneksi internet lambat

**Solusi**:
1. Compress foto terlebih dahulu
2. Gunakan format JPG atau PNG
3. Pastikan ukuran file < 2MB
4. Gunakan koneksi internet yang stabil

---

#### 7. Tombol "Save" tidak berfungsi?

**Penyebab**:
- JavaScript error di browser
- Form belum lengkap diisi
- Field required masih kosong

**Solusi**:
1. Cek apakah semua field dengan tanda (*) sudah diisi
2. Refresh halaman (F5)
3. Clear cache browser
4. Gunakan browser lain

---

#### 8. Data tidak terupdate setelah di-save?

**Solusi**:
1. Refresh halaman (F5 atau Ctrl+F5)
2. Logout dan login kembali
3. Clear cache browser
4. Jika masih bermasalah, hubungi admin

---

### Error Messages

#### "Permission Denied"

**Arti**: Anda tidak memiliki akses ke halaman/fitur tersebut

**Solusi**:
- Pastikan Anda login dengan akun yang benar
- Hubungi admin untuk mendapat akses

---

#### "Invalid CSRF Token"

**Arti**: Session login Anda expired atau ada masalah keamanan

**Solusi**:
1. Logout dan login kembali
2. Clear cookies browser
3. Jangan buka sistem di banyak tab sekaligus

---

#### "Duplicate Entry"

**Arti**: Data yang diinput sudah ada di database

**Solusi**:
- Gunakan kode/NIM/NIDN yang berbeda
- Atau edit data yang sudah ada

---

### Kontak Support

Jika mengalami masalah yang tidak ada di FAQ:

**Admin Akademik**:
- Email: akademik@universitas.ac.id
- Telp: (021) 1234567
- WA: 0812-3456-7890

**IT Support**:
- Email: it@universitas.ac.id
- Telp: (021) 1234568
- WA: 0812-3456-7891

**Jam Operasional**:
- Senin - Jumat: 08:00 - 16:00 WIB
- Sabtu: 08:00 - 12:00 WIB
- Minggu & Libur: Tutup (Emergency via WA)

---

## Tips & Best Practices

### Untuk Mahasiswa

✅ **DO's**:
- Login secara berkala untuk cek pengumuman
- Isi KRS tepat waktu saat periode dibuka
- Selalu cek jadwal sebelum ke kampus
- Update biodata jika ada perubahan
- Simpan bukti cetak KRS dan KHS
- Backup data penting (screenshot nilai, dll)

❌ **DON'Ts**:
- Jangan share password ke orang lain
- Jangan isi KRS sembarangan tanpa konsultasi
- Jangan biarkan session login terbuka di komputer umum
- Jangan mengakses dari WiFi publik tanpa VPN

---

### Untuk Dosen

✅ **DO's**:
- Input nilai sebelum deadline
- Approve/reject KRS mahasiswa maksimal 3 hari
- Update presensi secara berkala
- Backup data nilai sebelum finalisasi
- Verifikasi data kelas di awal semester

❌ **DON'Ts**:
- Jangan menunda input nilai sampai akhir semester
- Jangan sembarangan approve KRS tanpa cek
- Jangan input nilai sembarangan (akan tercatat di log)

---

### Untuk Admin

✅ **DO's**:
- Backup database secara berkala (minimal 1x/hari)
- Monitor log aktivitas user
- Validasi data master sebelum semester dimulai
- Aktifkan periode KRS/input nilai tepat waktu
- Test fitur baru di environment development dulu

❌ **DON'Ts**:
- Jangan hapus data tanpa backup
- Jangan ubah data yang sudah finalized
- Jangan share akses admin ke pihak tidak berwenang

---

## Changelog & Updates

### Version 1.0.0 (Current)

**Fitur**:
- ✅ Dashboard Admin, Dosen, Mahasiswa
- ✅ Manajemen Master Data (Fakultas, Prodi, Mahasiswa, Dosen, MK, Ruang)
- ✅ Manajemen Semester & Jadwal
- ✅ KRS Online
- ✅ Input Nilai & Presensi
- ✅ KHS Online
- ✅ Upload Foto Profil
- ✅ Cetak Kartu Mahasiswa/Dosen
- ✅ Notifikasi & Approval KRS

**Known Issues**:
- Export data dalam format Excel (coming soon)
- Laporan akademik (coming soon)
- Mobile app (future release)

---

## Penutup

Manual book ini akan terus diperbarui sesuai dengan pengembangan sistem.

Untuk saran dan masukan, silakan hubungi:
- **IT Development Team**
- Email: dev@universitas.ac.id

---

**Terakhir diupdate**: Oktober 2025
**Versi Manual**: 1.0.0
**Versi Sistem**: 1.0.0

---

© 2025 Sistem Informasi Akademik - aliuts.bungker.co.id
