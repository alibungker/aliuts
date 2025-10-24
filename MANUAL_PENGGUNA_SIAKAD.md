# PANDUAN PENGGUNA SISTEM INFORMASI AKADEMIK (SIAKAD)

**Versi:** 1.0
**Tanggal:** 24 Oktober 2025
**Dikelola oleh:** Perguruan Tinggi XYZ

---

## DAFTAR ISI

1. [Pengantar](#pengantar)
2. [Struktur Sistem](#struktur-sistem)
3. [Login dan Autentikasi](#login-dan-autentikasi)
4. [Dashboard Mahasiswa](#dashboard-mahasiswa)
5. [Dashboard Dosen](#dashboard-dosen)
6. [Panduan Mahasiswa](#panduan-mahasiswa)
   - [Kartu Rencana Studi (KRS)](#kartu-rencana-studi-krs)
   - [Kartu Hasil Studi (KHS)](#kartu-hasil-studi-khs)
   - [Jadwal Kuliah](#jadwal-kuliah)
   - [Presensi](#presensi)
   - [Biodata Mahasiswa](#biodata-mahasiswa)
   - [Cetak Kartu Mahasiswa](#cetak-kartu-mahasiswa)
7. [Panduan Dosen](#panduan-dosen)
   - [Manajemen Kelas](#manajemen-kelas)
   - [Input Nilai](#input-nilai)
   - [Input Presensi](#input-presensi)
   - [Approval KRS](#approval-krs)
   - [Notifikasi](#notifikasi)
   - [Biodata Dosen](#biodata-dosen)
   - [Cetak Kartu Dosen](#cetak-kartu-dosen)
8. [Antarmuka Administrator](#antarmuka-administrator)
9. [Troubleshooting](#troubleshooting)
10. [FAQ](#faq)
11. [Tips dan Best Practices](#tips-dan-best-practices)

---

## PENGANTAR

Sistem Informasi Akademik (SIAKAD) adalah platform terintegrasi untuk mengelola berbagai aspek akademik di perguruan tinggi. Sistem ini dirancang untuk memudahkan mahasiswa, dosen, dan administrator dalam mengakses informasi akademik secara real-time.

### Tujuan Manual
- Memberikan panduan langkah demi langkah penggunaan sistem
- Membantu pengguna memahami fitur yang tersedia
- Menjawab pertanyaan umum tentang penggunaan sistem
- Memberikan tips untuk penggunaan yang efektif

---

## STRUKTUR SISTEM

### Tingkatan Pengguna
SIAKAD memiliki tiga tingkatan pengguna utama:

1. **Administrator**
   - Akses penuh ke seluruh sistem
   - Manajemen data master (fakultas, prodi, mata kuliah, dll)
   - Manajemen pengguna dan konfigurasi sistem

2. **Dosen**
   - Manajemen kelas yang diampu
   - Input nilai dan presensi mahasiswa
   - Approval KRS mahasiswa
   - Akses laporan akademik

3. **Mahasiswa**
   - Pengajuan KRS online
   - Melihat KHS dan jadwal kuliah
   - Memantau presensi dan nilai
   - Mengupdate biodata pribadi

### Modul Utama
- **Akademik:** Manajemen data akademik (mata kuliah, kelas, jadwal)
- **KRS:** Kartu Rencana Studi
- **KHS:** Kartu Hasil Studi
- **Presensi:** Manajemen kehadiran
- **Nilai:** Input dan monitoring nilai
- **Notifikasi:** Sistem informasi real-time

---

## LOGIN DAN AUTENTIKASI

### Cara Login ke Sistem

1. **Buka Browser**
   - Gunakan browser modern (Chrome, Firefox, Safari, Edge)
   - Kunjungi URL sistem SIAKAD

2. **Halaman Login**
   - Klik tombol "Login" pada menu navigasi
   - Anda akan diarahkan ke halaman login

3. **Input Kredensial**
   ```
   Username: [Username yang telah terdaftar]
   Password: [Password yang telah terdaftar]
   ```

4. **Tekan Enter atau Klik Login**
   - Sistem akan memvalidasi kredensial Anda
   - Jika berhasil, Anda akan diarahkan ke dashboard sesuai peran

### Arahkan Otomatis ke Dashboard
- **Mahasiswa:** Diarahkan ke Dashboard Mahasiswa
- **Dosen:** Diarahkan ke Dashboard Dosen
- **Administrator:** Diarahkan ke panel admin

### Tips Login
- Gunakan koneksi internet yang stabil
- Pastikan caps lock tidak aktif
- Jika lupa password, hubungi administrator
- Logout setelah selesai menggunakan sistem

---

## DASHBOARD MAHASISWA

### Tampilan Umum Dashboard

Dashboard mahasiswa menampilkan ringkasan informasi akademik penting:

#### 1. Header Selamat Datang
- **Nama lengkap mahasiswa**
- **NIM (Nomor Induk Mahasiswa)**
- **Program Studi**
- **Foto profil (jika ada)**

#### 2. Statistik Akademik
- **Total SKS Semester Ini:** Jumlah SKS yang sedang diambil
- **IPK:** Indeks Prestasi Kumulatif
- **Mata Kuliah Aktif:** Jumlah mata kuliah semester ini

#### 3. Akses Cepat
Tombol pintasan ke fitur-fitur utama:
- **KRS:** Menuju halaman Kartu Rencana Studi
- **KHS:** Menuju halaman Kartu Hasil Studi
- **Jadwal:** Lihat jadwal kuliah
- **Presensi:** Riwayat kehadiran
- **Biodata:** Data pribadi lengkap

#### 4. Daftar Mata Kuliah Semester Ini
Tabel menampilkan mata kuliah yang sedang diambil:
- Kode mata kuliah
- Nama mata kuliah
- SKS
- Dosen pengampu
- Status KRS (Disetujui/Pending/Ditolak)

### Navigasi Menu
Menu navigasi utama untuk mahasiswa:
- **Dashboard:** Halaman utama
- **Biodata:** Data pribadi dan kontak
- **KRS:** Pengajuan dan manajemen KRS
- **KHS:** Lihat hasil studi dan nilai
- **Jadwal:** Jadwal perkuliahan
- **Presensi:** Riwayat kehadiran
- **Logout:** Keluar dari sistem

---

## DASHBOARD DOSEN

### Tampilan Umum Dashboard

Dashboard dosen menampilkan informasi mengenai kelas yang diampu:

#### 1. Header Selamat Datang
- **Nama lengkap dosen**
- **NIDN (Nomor Induk Dosen Nasional)**
- **Program Studi**
- **Foto profil (jika ada)**

#### 2. Akses Cepat
Tombol pintasan ke fitur utama:
- **Kelas:** Kelola kelas yang diampu
- **Biodata:** Data pribadi lengkap
- **Notifikasi:** Pengajuan KRS mahasiswa

#### 3. Daftar Kelas yang Diampu
Card untuk setiap kelas yang diampu menampilkan:
- **Nama mata kuliah**
- **Kode mata kuliah dan kelas**
- **SKS**
- **Kuota mahasiswa**
- **Semester**
- **Tombol "Lihat Detail"** untuk menuju halaman detail kelas

### Navigasi Menu
Menu navigasi utama untuk dosen:
- **Dashboard:** Halaman utama
- **Biodata:** Data pribadi dan kontak
- **Kelas:** Daftar kelas yang diampu
- **Logout:** Keluar dari sistem

---

## PANDUAN MAHASISWA

### KARTU RENCANA STUDI (KRS)

#### Pengantar KRS
KRS adalah dokumen resmi yang berisi daftar mata kuliah yang akan diambil mahasiswa dalam satu semester. Setiap mahasiswa wajib mengisi KRS setiap semester.

#### Langkah-langkah Mengisi KRS

1. **Akses Halaman KRS**
   - Login ke sistem SIAKAD
   - Klik menu "KRS" pada navigasi
   - Anda akan melihat halaman KRS dengan dua bagian utama

2. **Bagian 1: KRS Saya**
   - Menampilkan mata kuliah yang sudah diambil
   - Status KRS: Disetujui, Pending, atau Ditolak
   - Total SKS dan jumlah mata kuliah
   - Tombol hapus untuk KRS yang belum disetujui

3. **Bagian 2: Daftar Kelas Tersedia**
   - Daftar mata kuliah yang dapat diambil
   - Informasi lengkap setiap mata kuliah:
     - Kode mata kuliah
     - Nama mata kuliah
     - SKS
     - Kelas
     - Dosen pengampu
     - Kuota tersedia
     - Semester

4. **Menambah Mata Kuliah**
   - Cari mata kuliah yang diinginkan
   - Klik tombol "Tambah" pada kolom aksi
   - Sistem akan menampilkan konfirmasi
   - Mata kuliah akan ditambahkan ke KRS Saya dengan status "Pending"

5. **Menghapus Mata Kuliah**
   - Hanya bisa dilakukan untuk KRS dengan status "Pending"
   - Klik tombol "Hapus" pada mata kuliah yang ingin dibatalkan
   - Konfirmasi penghapusan
   - Mata kuliah akan dihapus dari KRS

6. **Proses Approval**
   - KRS dengan status "Pending" akan dikirim ke dosen pengampu
   - Dosen akan memutuskan approval atau penolakan
   - Anda akan menerima notifikasi melalui sistem

#### Tips dan Best Practices KRS

1. **Perencanaan Matang**
   - Konsultasikan dengan dosen wali
   - Perhatikan prasyarat mata kuliah
   - Sesuaikan dengan kapasitas diri

2. **Waktu Pengajuan**
   - Ajukan KRS sesuai jadwal yang ditentukan
   - Hindari pengajuan di menit terakhir
   - Sistem akan menolak pengajuan di luar periode KRS

3. **Monitoring Status**
   - Cek status KRS secara berkala
   - Segera hubungi dosen jika KRS ditolak
   - Pastikan semua KRS disetujui sebelum perkuliahan dimulai

4. **Kuota Kelas**
   - Perhatikan kuota tersedia
   - Alternatif pilihan kelas jika kuota penuh
   - Ajukan secepatnya untuk kelas favorit

#### Status KRS dan Artinya

| Status | Warna | Arti | Aksi |
|--------|-------|------|------|
| Disetujui | Hijau | KRS disetujui dosen | Tidak bisa dihapus |
| Pending | Kuning | Menunggu approval | Bisa dihapus |
| Ditolak | Merah | KRS ditolak dosen | Ajukan ulang |

### KARTU HASIL STUDI (KHS)

#### Pengantar KHS
KHS menampilkan hasil belajar mahasiswa berupa nilai untuk setiap mata kuliah yang telah diambil. KHS penting untuk:
- Memantau prestasi akademik
- Mengetahui IPK dan IPS
- Evaluasi hasil belajar
- Syarat administratif

#### Cara Melihat KHS

1. **Akses Halaman KHS**
   - Login ke sistem SIAKAD
   - Klik menu "KHS" pada navigasi

2. **Filter Semester**
   - Pilih tahun ajaran yang ingin dilihat
   - Pilih semester (Ganjil/Genap)
   - Sistem akan menampilkan KHS sesuai filter

3. **Informasi Utama KHS**
   - **IPS (Indeks Prestasi Semester):** Indeks prestasi semester yang dipilih
   - **IPK (Indeks Prestasi Kumulatif):** Indeks prestasi keseluruhan
   - **Total Mata Kuliah:** Jumlah mata kuliah semester tersebut
   - **Total SKS:** Jumlah SKS semester tersebut

4. **Tabel Detail Nilai**
   Setiap mata kuliah menampilkan:
   - Kode mata kuliah
   - Nama mata kuliah
   - SKS
   - Dosen pengampu
   - Nilai angka (0-100)
   - Nilai huruf (A, B+, B, C, D, E)
   - Bobot nilai (0.0-4.0)

#### Konversi Nilai

| Nilai Angka | Nilai Huruf | Bobot | Kategori |
|-------------|-------------|-------|----------|
| 85-100 | A | 4.0 | Sangat Baik |
| 80-84 | A- | 3.7 | Sangat Baik |
| 75-79 | B+ | 3.3 | Baik |
| 70-74 | B | 3.0 | Baik |
| 65-69 | B- | 2.7 | Cukup Baik |
| 60-64 | C+ | 2.3 | Cukup Baik |
| 55-59 | C | 2.0 | Cukup |
| 50-54 | D | 1.0 | Kurang |
| <50 | E | 0.0 | Gagal |

#### Tips untuk Meningkatkan Nilai

1. **Monitor Berkala**
   - Cek KHS setiap akhir semester
   - Identifikasi mata kuliah dengan nilai rendah
   - Buat perencanaan perbaikan

2. **Konsultasi dengan Dosen**
   - Diskusikan kesulitan akademik
   - Mintakan saran untuk perbaikan
   - Ikuti bimbingan akademik

3. **Fokus pada Prioritas**
   - Prioritaskan mata kuliah dengan SKS tinggi
   - Berikan perhatian khusus pada mata kuliah prasyarat
   - Manajemen waktu yang baik

### JADWAL KULIAH

#### Pengantar Jadwal Kuliah
Jadwal kuliah menampilkan waktu dan tempat perkuliahan untuk semua mata kuliah yang diambil dalam semester aktif.

#### Cara Melihat Jadwal Kuliah

1. **Akses Halaman Jadwal**
   - Login ke sistem SIAKAD
   - Klik menu "Jadwal" pada navigasi

2. **Tampilan Jadwal**
   - Jadwal ditampilkan per hari (Senin-Sabtu)
   - Setiap mata kuliah menampilkan:
     - Nama mata kuliah
     - Kode kelas
     - Dosen pengampu
     - Waktu (jam mulai - jam selesai)
     - Ruangan

3. **Informasi Detail**
   - Hari perkuliahan
   - Jam mulai dan selesai
   - Lokasi ruangan
   - Dosen pengampu

#### Tips Menggunakan Jadwal

1. **Planning Harian**
   - Cek jadwal setiap pagi
   - Persiapkan materi perkuliahan
   - Datang 10-15 menit lebih awal

2. **Konflik Jadwal**
   - Sistem mencegah jadwal bertabrakan
   - Hubungi administrator jika ada masalah jadwal
   - Sesuaikan dengan kegiatan lain

3. **Perubahan Jadwal**
   - Sistem akan update otomatis jika ada perubahan
   - Periksa notifikasi perubahan
   - Konfirmasi ke dosen atau admin

### PRESENSI

#### Pengantar Presensi
Sistem presensi mencatat kehadiran mahasiswa dalam setiap pertemuan perkuliahan. Presensi penting untuk:
- Evaluasi kehadiran
- Syarat kelulusan mata kuliah
- Administrasi akademik

#### Cara Melihat Riwayat Presensi

1. **Akses Halaman Presensi**
   - Login ke sistem SIAKAD
   - Klik menu "Presensi" pada navigasi

2. **Tampilan Presensi**
   - Daftar semua mata kuliah yang diambil
   - Setiap pertemuan menampilkan:
     - Tanggal pertemuan
     - Mata kuliah
     - Pertemuan ke-
     - Status kehadiran
     - Keterangan (jika ada)

3. **Status Kehadiran**
   - **Hadir:** Mahasiswa hadir pada pertemuan tersebut
   - **Izin:** Mahasiswa izin dengan keterangan yang jelas
   - **Sakit:** Mahasiswa sakit dengan dokumen pendukung
   - **Alpha:** Mahasiswa tidak hadir tanpa keterangan

#### Aturan Presensi

1. **Batas Kehadiran Minimum**
   - Minimum 75% kehadiran untuk boleh ujian
   - Informasi detail ada di setiap mata kuliah
   - Konsultasi dengan dosen jika ada masalah

2. **Keterangan Izin/Sakit**
   - Sertakan dokumen pendukung
   - Ajukan izin sesuai prosedur
   - Informasikan kepada dosen pengampu

3. **Monitoring Berkala**
   - Cek presensi setiap minggu
   - Pastikan data presensi akurat
   - Laporkan jika ada kesalahan data

### BIODATA MAHASISWA

#### Pengantar Biodata
Halaman biodata menampilkan data pribadi lengkap mahasiswa. Data ini penting untuk administrasi dan komunikasi.

#### Cara Melihat dan Mengedit Biodata

1. **Lihat Biodata**
   - Login ke sistem SIAKAD
   - Klik menu "Biodata" pada navigasi
   - Data akan ditampilkan dalam bentuk form terstruktur

2. **Edit Biodata**
   - Klik tombol "Edit Biodata"
   - Perbarui informasi yang diperlukan
   - Upload foto profil (opsional)
   - Klik "Simpan" untuk menyimpan perubahan

3. **Data yang Dapat Diupdate**
   - Data pribadi (tempat/tanggal lahir, jenis kelamin)
   - Informasi kontak (email, telepon, alamat)
   - Data orang tua (nama, pekerjaan, kontak)
   - Foto profil

#### Pentingnya Data Lengkap

1. **Administrasi Akademik**
   - Syarat untuk layanan akademik
   - Kontak untuk komunikasi penting
   - Identitas resmi di perguruan tinggi

2. **Keakuratan Data**
   - Pastikan semua data valid dan up-to-date
   - Update perubahan kontak segera
   - Hubungi admin untuk data yang tidak bisa diubah

### CETAK KARTU MAHASISWA

#### Pengantar Kartu Mahasiswa
Kartu mahasiswa adalah identitas resmi mahasiswa yang dapat dicetak untuk berbagai keperluan administratif.

#### Cara Mencetak Kartu Mahasiswa

1. **Akses Halaman Cetak**
   - Login ke sistem SIAKAD
   - Klik menu "Cetak Kartu" pada navigasi

2. **Tampilan Kartu**
   - Data pribadi lengkap
   - Foto mahasiswa
   - NIM dan program studi
   - Format cetak yang profesional

3. **Proses Cetak**
   - Gunakan browser modern untuk hasil terbaik
   - Atur pengaturan printer (portrait/lanscape)
   - Gunakan kertas dengan kualitas baik

---

## PANDUAN DOSEN

### MANAJEMEN KELAS

#### Pengantar Manajemen Kelas
Dosen dapat melihat dan mengelola semua kelas yang diampu dalam satu semester. Setiap kelas memiliki informasi lengkap mengenai mata kuliah dan mahasiswa yang terdaftar.

#### Cara Mengakses Kelas

1. **Daftar Kelas**
   - Login ke sistem SIAKAD
   - Klik menu "Kelas" pada navigasi
   - Daftar semua kelas yang diampu akan ditampilkan

2. **Informasi Kelas**
   Setiap kelas menampilkan:
   - Nama mata kuliah
   - Kode mata kuliah
   - SKS
   - Kuota mahasiswa
   - Semester dan tahun ajaran

3. **Detail Kelas**
   Klik "Lihat Detail" untuk melihat:
   - Informasi lengkap mata kuliah
   - Daftar mahasiswa yang terdaftar
   - Aksi untuk input nilai dan presensi

#### Monitoring Kelas

1. **Jumlah Mahasiswa**
   - Pantau jumlah mahasiswa terdaftar
   - Bandingkan dengan kuota kelas
   - Identifikasi kelas yang over/under capacity

2. **Status KRS**
   - Monitor pengajuan KRS mahasiswa
   - Approve atau reject KRS yang masuk
   - Pastikan semua mahasiswa memiliki status KRS valid

### INPUT NILAI

#### Pengantar Input Nilai
Fitur ini memungkinkan dosen untuk menginput nilai mahasiswa untuk setiap mata kuliah yang diampu. Nilai akan otomatis dihitung untuk IPS dan IPK mahasiswa.

#### Cara Input Nilai

1. **Akses Halaman Input Nilai**
   - Buka halaman detail kelas
   - Klik tombol "Input Nilai"
   - Daftar mahasiswa akan ditampilkan

2. **Form Input Nilai**
   - Setiap mahasiswa memiliki field nilai angka
   - Input nilai dalam skala 0-100
   - Sistem akan otomatis konversi ke nilai huruf

3. **Proses Input**
   - Input nilai untuk setiap mahasiswa
   - Klik "Simpan" untuk menyimpan semua nilai
   - Konfirmasi penyimpanan

#### Kriteria Penilaian

| Nilai Angka | Nilai Huruf | Kategori | Deskripsi |
|-------------|-------------|----------|-----------|
| 85-100 | A | Sangat Baik | Prestasi luar biasa |
| 80-84 | A- | Sangat Baik | Prestasi sangat baik |
| 75-79 | B+ | Baik | Prestasi di atas rata-rata |
| 70-74 | B | Baik | Prestasi baik |
| 65-69 | B- | Cukup Baik | Prestasi memuaskan |
| 60-64 | C+ | Cukup Baik | Prestasi cukup |
| 55-59 | C | Cukup | Prestasi minimal |
| 50-54 | D | Kurang | Perlu perbaikan |
| <50 | E | Gagal | Tidak memenuhi syarat |

#### Best Practices Input Nilai

1. **Objektivitas**
   - Berdasarkan kriteria yang ditetapkan
   - Fair dan transparan
   - Dokumentasi lengkap

2. **Waktu Input**
   - Input nilai setelah akhir semester
   - Deadline sesuai kalender akademik
   - Review kembali sebelum submit

3. **Konsistensi**
   - Gunakan standar penilaian yang sama
   - Konsultasi dengan dosen lain
   - Review kriteria penilaian

### INPUT PRESENSI

#### Pengantar Input Presensi
Sistem presensi digital memudahkan dosen untuk mencatat kehadiran mahasiswa setiap pertemuan secara online.

#### Cara Input Presensi

1. **Akses Halaman Input Presensi**
   - Buka halaman detail kelas
   - Klik tombol "Input Presensi"
   - Form presensi akan ditampilkan

2. **Form Presensi**
   - Pilih tanggal pertemuan
   - Input nomor pertemuan ke-
   - Pilih status untuk setiap mahasiswa:
     - Hadir
     - Izin
     - Sakit
     - Alpha

3. **Simpan Data**
   - Review kembali status presensi
   - Klik "Simpan" untuk menyimpan
   - Konfirmasi penyimpanan

#### Status Presensi

| Status | Deskripsi | Dokumen Pendukung |
|--------|-----------|-------------------|
| Hadir | Mahasiswa hadir di kelas | Tidak perlu |
| Izin | Mahasiswa izin dengan alasan jelas | Surat izin |
| Sakit | Mahasiswa sakit | Surat dokter |
| Alpha | Mahasiswa tidak hadir tanpa keterangan | Tidak ada |

#### Tips Presensi Efektif

1. **Konsistensi**
   - Input presensi setiap pertemuan
   - Gunakan kriteria yang sama
   - Dokumentasi lengkap

2. **Waktu Input**
   - Input presensi setelah perkuliahan
   - Jangan tunda lebih dari 24 jam
   - Review sebelum submit

3. **Monitoring**
   - Track kehadiran mahasiswa
   - Identifikasi masalah kehadiran
   - Hubungi mahasiswa bermasalah

### APPROVAL KRS

#### Pengantar Approval KRS
Mahasiswa mengajukan KRS untuk setiap semester, dan dosen perlu menyetujui KRS tersebut. Approval penting untuk memastikan mahasiswa mengambil mata kuliah yang tepat.

#### Cara Approval KRS

1. **Akses Notifikasi**
   - Login ke sistem SIAKAD
   - Klik menu "Notifikasi"
   - Daftar pengajuan KRS akan ditampilkan

2. **Review Pengajuan**
   - Setiap notifikasi menampilkan:
     - Nama mahasiswa
     - Mata kuliah yang diajukan
     - Kelas yang dipilih
     - Waktu pengajuan

3. **Proses Approval**
   - Klik tombol "Approve" untuk menyetujui
   - Klik tombol "Reject" untuk menolak
   - Mahasiswa akan menerima notifikasi otomatis

#### Kriteria Approval

1. **Prasyarat Mata Kuliah**
   - Pastikan mahasiswa memenuhi prasyarat
   - Cek transkrip sebelumnya
   - Konsultasi dengan dosen wali

2. **Kuota Kelas**
   - Pastikan kuota masih tersedia
   - Prioritaskan mahasiswa sesuai aturan
   - Koordinasi dengan admin jika perlu

3. **Jadwal**
   - Pastikan tidak ada konflik jadwal
   - Verifikasi waktu tempat kuliah
   - Konsultasikan dengan admin

#### Best Practices Approval

1. **Response Time**
   - Approve dalam waktu 24-48 jam
   - Jangan biarkan pending terlalu lama
   - Berikan feedback jika reject

2. **Komunikasi**
   - Hubungi mahasiswa jika ada masalah
   - Berikan alasan yang jelas untuk penolakan
   - Tawarkan alternatif jika perlu

### NOTIFIKASI

#### Pengantar Notifikasi
Sistem notifikasi memberikan informasi real-time kepada dosen mengenai berbagai aktivitas akademik yang memerlukan perhatian.

#### Jenis Notifikasi

1. **KRS Pending**
   - Mahasiswa mengajukan KRS
   - Memerlukan approval dosen
   - Link langsung ke halaman approval

2. **Sistem Informasi**
   - Pengumuman penting
   - Perubahan jadwal
   - Informasi akademik lainnya

#### Cara Mengelola Notifikasi

1. **Akses Notifikasi**
   - Klik ikon lonceng pada dashboard
   - Atau klik menu "Notifikasi"
   - Daftar semua notifikasi akan ditampilkan

2. **Status Notifikasi**
   - **Belum Dibaca:** Warna biru/negara
   - **Sudah Dibaca:** Warna abu-abu
   - Sistem otomatis tandai sebagai dibaca

3. **Aksi Notifikasi**
   - Klik notifikasi untuk detail
   - Link langsung ke halaman terkait
   - Hapus notifikasi yang tidak perlu

### BIODATA DOSEN

#### Pengantar Biodata Dosen
Halaman biodata dosen menampilkan data pribadi dan profesional lengkap. Data ini penting untuk identitas akademik dan administrasi.

#### Cara Mengelola Biodata

1. **Lihat Biodata**
   - Login ke sistem SIAKAD
   - Klik menu "Biodata"
   - Data lengkap akan ditampilkan

2. **Edit Biodata**
   - Klik "Edit Biodata"
   - Update informasi yang diperlukan
   - Upload foto profil (opsional)
   - Simpan perubahan

3. **Data yang Dapat Diupdate**
   - Data pribadi (tempat/tanggal lahir, jenis kelamin)
   - Informasi kontak (email, telepon, alamat)
   - Data profesional (gelar, pendidikan terakhir, NIP)
   - Foto profil

### CETAK KARTU DOSEN

#### Pengantar Kartu Dosen
Kartu dosen adalah identitas resmi yang dapat dicetak untuk berbagai keperluan profesional dan administratif.

#### Cara Mencetak Kartu Dosen

1. **Akses Halaman Cetak**
   - Login ke sistem SIAKAD
   - Klik menu "Cetak Kartu"
   - Kartu akan ditampilkan dalam format cetak

2. **Proses Cetak**
   - Gunakan pengaturan printer yang sesuai
   - Pilih kualitas cetak yang baik
   - Kartu siap digunakan

---

## ANTARMUKA ADMINISTRATOR

### Dashboard Administrator
Administrator memiliki akses penuh ke sistem melalui interface Django Admin yang dapat diakses di `/admin/`.

### Modul Administrator

1. **Manajemen Users**
   - Mahasiswa (akun dan biodata)
   - Dosen (akun dan biodata)
   - Administrator sistem

2. **Data Master Akademik**
   - Fakultas
   - Program Studi
   - Mata Kuliah
   - Ruang kuliah
   - Semester

3. **Operasional Akademik**
   - Kelas dan penawaran
   - Jadwal kuliah
   - KRS mahasiswa
   - Input nilai dan presensi

4. **Laporan dan Monitoring**
   - Statistik akademik
   - Monitoring aktivitas
   - Laporan bulanan/semesteran

### Tugas Utama Administrator

1. **Setup Awal Semester**
   - Aktifkan semester baru
   - Input jadwal kuliah
   - Konfigurasi kelas dan kuota

2. **Support Pengguna**
   - Reset password
   - Update biodata
   - Solusi masalah teknis

3. **Maintenence Sistem**
   - Backup data
   - Update sistem
   - Monitoring performa

---

## TROUBLESHOOTING

### Masalah Login

**Masalah:** Tidak bisa login ke sistem

**Solusi:**
1. Periksa username dan password
2. Pastikan caps lock tidak aktif
3. Clear cache browser
4. Coba browser berbeda
5. Hubungi administrator untuk reset password

**Masalah:** Lupa password

**Solusi:**
1. Hubungi administrator sistem
2. Berikan identitas lengkap
3. Minta reset password
4. Buat password baru yang kuat

### Masalah KRS

**Masalah:** Tidak bisa menambah KRS

**Solusi:**
1. Periksa periode pengajuan KRS
2. Pastikan kuota kelas masih tersedia
3. Cek prasyarat mata kuliah
4. Hubungi dosen wali atau administrator

**Masalah:** KRS ditolak dosen

**Solusi:**
1. Kontak dosen pengampu mata kuliah
2. Tanyakan alasan penolakan
3. Ajukan ulang jika masih ada kesempatan
4. Pilih mata kuliah alternatif

### Masalah Nilai

**Masalah:** Nilai tidak muncul di KHS

**Solusi:**
1. Tunggu beberapa hari setelah akhir semester
2. Kontak dosen pengampu
3. Hubungi administrator jika masalah berlanjut
4. Pastikan KRS sudah disetujui

**Masalah:** Ada kesalahan input nilai

**Solusi:**
1. Hubungi dosen pengampu segera
2. Berikan bukti yang valid
3. Minta koreksi nilai
4. Follow up sampai nilai diperbaiki

### Masalah Sistem

**Masalah:** Lemot atau tidak responsif

**Solusi:**
1. Cek koneksi internet
2. Clear cache dan cookies browser
3. Restart browser
4. Coba akses di waktu lain
5. Report ke administrator

**Masalah:** Error muncul di layar

**Solusi:**
1. Screenshot pesan error
2. Catat langkah yang menyebabkan error
3. Refresh halaman
4. Report ke administrator dengan detail

### Masalah Presensi

**Masalah:** Data presensi tidak akurat

**Solusi:**
1. Hubungi dosen pengampu kelas
2. Tunjukkan bukti kehadiran
3. Minta koreksi data
4. Follow up sampai diperbaiki

**Masalah:** Tidak bisa cetak kartu

**Solusi:**
1. Periksa printer dan kertas
2. Update browser ke versi terbaru
3. Coba browser berbeda
4. Download dan print dari PDF

---

## FAQ (FREQUENTLY ASKED QUESTIONS)

### Pertanyaan Umum Mahasiswa

**Q: Kapan waktu pengajuan KRS?**
A: Waktu pengajuan KRS diinformasikan melalui pengumuman akademik. Biasanya 2 minggu sebelum perkuliahan dimulai.

**Q: Berapa batas SKS yang bisa diambil per semester?**
A: Batas SKS tergantung pada IPK semester sebelumnya:
- IPK ≥ 3.00: maksimal 24 SKS
- IPK 2.50-2.99: maksimal 21 SKS
- IPK < 2.50: maksimal 18 SKS

**Q: Bagaimana jika lupa password?**
A: Hubungi administrator sistem dengan membawa kartu identitas mahasiswa.

**Q: Apakah bisa mengubah KRS setelah disetujui?**
A: Tidak bisa. KRS yang sudah disetujui tidak bisa diubah kecuali ada alasan khusus dengan persetujuan dosen wali dan administrator.

**Q: Kapan nilai bisa dilihat di KHS?**
A: Nilai bisa dilihat setelah semua dosen selesai menginput nilai dan administrator memvalidasi, biasanya 2-3 minggu setelah akhir semester.

### Pertanyaan Umum Dosen

**Q: Bagaimana cara melihat daftar mahasiswa kelas?**
A: Login ke sistem, klik menu "Kelas", pilih kelas yang diinginkan, dan klik "Lihat Detail".

**Q: Sampai kapan batas waktu input nilai?**
A: Batas waktu input nilai adalah 1 minggu setelah ujian akhir semester. Konfirmasi ke administrator untuk deadline spesifik.

**Q: Apakah bisa mengubah nilai setelah diinput?**
A: Bisa, selama periode input nilai masih dibuka dan dengan persetujuan administrator.

**Q: Bagaimana cara approve KRS mahasiswa?**
A: Klik menu "Notifikasi", lihat daftar KRS pending, dan klik "Approve" atau "Reject".

**Q: Apakah yang terjadi jika lupa input presensi?**
A: Data presensi bisa diinput secara retroaktif. Hubungi administrator untuk bantuan teknis.

### Pertanyaan Teknis

**Q: Browser apa yang disupport?**
A: Chrome, Firefox, Safari, dan Edge versi terbaru. Pastikan browser selalu diupdate.

**Q: Bagaimana cara melaporkan masalah sistem?**
A: Hubungi administrator via email atau datang langsung ke IT support. Sertakan screenshot dan detail masalah.

**Q: Apakah sistem bisa diakses dari mobile?**
A: Ya, sistem responsive dan bisa diakses dari smartphone atau tablet.

**Q: Bagaimana jika internet tidak stabil?**
A: Sistem autosave untuk data penting, namun disarankan menggunakan koneksi stabil saat input data penting.

**Q: Apakah data aman di sistem?**
A: Ya, sistem menggunakan enkripsi dan backup rutin untuk menjaga keamanan data.

---

## TIPS DAN BEST PRACTICES

### Tips untuk Mahasiswa

1. **Planning Akademik**
   - Buat jadwal belajar rutin
   - Konsultasi dengan dosen wali setiap semester
   - Download materi perkuliahan secara berkala
   - Backup semua data penting

2. **Manajemen Waktu**
   - Gunakan calendar digital untuk deadline
   - Set reminder untuk jadwal penting
   - Selesaikan tugas sebelum deadline
   - Jangan menunda-nunda pekerjaan

3. **Akurasi Data**
   - Update biodata segera setelah ada perubahan
   - Periksa data akademik secara berkala
   - Laporkan kesalahan data segera
   - Simpan bukti transaksi akademik

4. **Kesehatan Digital**
   - Gunakan password yang kuat dan unik
   - Jangan share password dengan orang lain
   - Logout setelah selesai menggunakan sistem
   - Laporkan aktivitas mencurigakan

### Tips untuk Dosen

1. **Efisiensi Pengajaran**
   - Siapkan materi sebelum perkuliahan
   - Gunakan sistem untuk sharing materi
   - Input presensi secara konsisten
   - Feedback mahasiswa secara berkala

2. **Akuntabilitas**
   - Dokumentasi lengkap untuk semua aktivitas
   - Deadline oriented untuk input nilai
   - Review ulang data sebelum submit
   - Backup data penting

3. **Komunikasi**
   - Responsive terhadap notifikasi
   - Berikan feedback yang jelas dan konstruktif
   - Update mahasiswa tentang perubahan
   - Koordinasi dengan administrator

4. **Professional Development**
   - Update knowledge tentang sistem
   - Ikuti training yang disediakan
   - Share best practices dengan dosen lain
   - Contribute untuk improvement sistem

### Tips Umum

1. **Security**
   - Gunakan koneksi internet yang aman
   - Hindari public WiFi untuk transaksi penting
   - Update sistem operasi dan browser
   - Gunakan antivirus yang update

2. **Backup**
   - Print dokumentasi penting
   - Simpan digital backup di lokasi aman
   - Screenshot konfirmasi transaksi
   - Archive data setiap semester

3. **Communication**
   - Gunakan official channel untuk komunikasi
   - Email documentation untuk konfirmasi
   - Follow up important matters
   - Build good relationship with admin

4. **Continuous Learning**
   - Explore all features sistem
   - Join training sessions
   - Read updated documentation
   - Provide feedback for improvement

---

## KONTAK SUPPORT

### Informasi Support
- **Email:** support.sistemakad@kampus.ac.id
- **Telepon:** (021) 1234-5678
- **WhatsApp:** +62 812-3456-7890
- **Lokasi:** Gedung Rektorat Lantai 2, Ruang IT Support

### Jam Operasional
- **Senin - Jumat:** 08:00 - 17:00 WIB
- **Sabtu:** 08:00 - 12:00 WIB
- **Minggu/Tanggal Merah:** Tutup

### Emergency Support
Untuk urgent issues selama jam kerja:
- Hotline: (021) 9999-0000
- Email urgent: emergency.sistemakad@kampus.ac.id

---

## PANDUAN VERSI MOBILE

### Akses Mobile
Sistem SIAKAD sepenuhnya responsive dan dapat diakses melalui:
- Smartphone (Android/iOS)
- Tablet
- Any mobile device dengan browser modern

### Tips Mobile Access
1. **Browser Optimization**
   - Gunakan Chrome/Safari mobile
   - Update browser ke versi terbaru
   - Clear cache regularly

2. **Connection**
   - Gunakan WiFi untuk download besar
   - Mobile data untuk quick access
   - Offline mode untuk informasi basic

3. **Interface Navigation**
   - Swipe untuk scroll tables
   - Tap untuk expand menus
   - Pinch untuk zoom detail

---

## CHANGE LOG

### Versi 1.0 (24 Oktober 2025)
- Initial release comprehensive user manual
- Complete documentation for all user types
- Step-by-step guides for all major features
- Troubleshooting and FAQ sections
- Best practices and tips

---

## COPYRIGHT & DISCLAIMER

**Copyright © 2025 Perguruan Tinggi XYZ. All rights reserved.**

Manual ini diperuntukkan bagi pengguna Sistem Informasi Akademik (SIAKAD) Perguruan Tinggi XYZ. Informasi dalam manual ini dapat berubah sewaktu-waktu tanpa pemberitahuan terlebih dahulu.

Untuk informasi terbaru, hubungi bagian IT Support atau kunjungi website resmi perguruan tinggi.

---

**Terima kasih telah menggunakan Sistem Informasi Akademik kami!**