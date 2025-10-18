# SOFTWARE REQUIREMENTS SPECIFICATION (SRS)
## Sistem Informasi Kuliah

### 1. Pendahuluan
- **Tujuan**: Dokumentasi sistem yang sudah berjalan. SRS ini menggambarkan kebutuhan fungsional dan non-fungsional dari Sistem Informasi Kuliah (SIMKuliah) yang merupakan sistem informasi akademik digital untuk mengelola proses akademik di perguruan tinggi.

- **Cakupan**: Sistem mencakup fitur untuk pengelolaan data akademik mahasiswa dan dosen, pendaftaran Kartu Rencana Studi (KRS), pengelolaan nilai dan presensi, serta sistem notifikasi. Fitur yang tidak termasuk adalah pengelolaan keuangan, perpustakaan, dan sistem alumni.

- **Definisi**:
  - **KRS (Kartu Rencana Studi)**: Dokumen yang berisi daftar mata kuliah yang diambil mahasiswa dalam satu semester
  - **KHS (Kartu Hasil Studi)**: Dokumen yang berisi nilai dan Indeks Prestasi Semester (IPS) serta Indeks Prestasi Kumulatif (IPK) mahasiswa
  - **Dosen PA**: Dosen Pembimbing Akademik yang membimbing mahasiswa dalam pengambilan mata kuliah
  - **SKS (Satuan Kredit Semester)**: Jumlah jam belajar mahasiswa dalam satu semester
  - **IPK**: Indeks Prestasi Kumulatif, rata-rata nilai selama masa studi
  - **IPS**: Indeks Prestasi Semester, rata-rata nilai dalam satu semester

- **Referensi**: 
  - Permendikbud No. 3 Tahun 2020 tentang Standar Nasional Pendidikan Tinggi
  - Pedoman Akademik Institut Teknologi Indonesia
  - Kode Etik Mahasiswa dan Panduan Akademik

### 2. Deskripsi Umum Sistem
- **Perspektif produk**: Sistem ini mengotomatisasi proses akademik kampus seperti pendaftaran mata kuliah, pengelolaan nilai, presensi, dan manajemen jadwal. Sistem ini merupakan bagian penting dari pengelolaan akademik perguruan tinggi yang membantu mahasiswa, dosen, dan admin dalam proses belajar mengajar.

- **Fungsi utama**: 
  - Manajemen akun dan akses berbasis peran (mahasiswa, dosen)
  - Pendaftaran Kartu Rencana Studi (KRS) dengan sistem persetujuan
  - Pengelolaan nilai dan presensi oleh dosen
  - Penyediaan informasi akademik secara real-time
  - Pengelolaan jadwal kuliah dan informasi akademik lainnya

- **Karakteristik pengguna**: 
  - **Mahasiswa**: Pengguna utama yang mengakses informasi akademik, mendaftar KRS, dan melihat nilai
  - **Dosen**: Pengguna yang mengelola nilai, presensi, dan menyetujui KRS mahasiswa
  - **Admin**: Pengguna sistem yang mengelola data master dan pengguna (dosen dan mahasiswa)

- **Lingkungan implementasi**: Web-based menggunakan Python Django Framework, database MySQL, dan diakses melalui browser. Sistem berjalan pada domain aliuts.bungker.co.id.

### 3. Persyaratan Fungsional

| ID | Aktor | Deskripsi | Input | Proses | Output |
|----|-------|-----------|-------|--------|--------|
| F01 | Mahasiswa | Melihat dan mengelola dashboard pribadi | ID user | Otentikasi dan pengambilan data profil | Dashboard dengan informasi akademik pribadi |
| F02 | Mahasiswa | Mengelola Kartu Rencana Studi (KRS) | ID kelas, informasi akun | Validasi kuota dan proses pendaftaran KRS | KRS terdaftar dengan status pending |
| F03 | Dosen | Menyetujui atau menolak KRS mahasiswa | ID KRS, keputusan | Validasi dan update status KRS | Status KRS diubah dan notifikasi terkirim |
| F04 | Mahasiswa | Melihat Kartu Hasil Studi (KHS) | ID user | Pengambilan data nilai KRS disetujui | Tabel KHS dengan nilai dan perhitungan IPK/IPS |
| F05 | Mahasiswa | Melihat jadwal kuliah | ID user | Pengambilan data KRS disetujui dan jadwal | Tabel jadwal kuliah |
| F06 | Dosen | Menginput nilai mahasiswa | ID kelas, data nilai | Validasi dan penyimpanan nilai | Nilai berhasil disimpan ke sistem |
| F07 | Dosen | Menginput presensi mahasiswa | ID kelas, data presensi | Validasi dan penyimpanan presensi | Presensi berhasil disimpan |
| F08 | Mahasiswa | Melihat riwayat presensi | ID user | Pengambilan data presensi | Tabel presensi per pertemuan |
| F09 | Mahasiswa | Melihat dan mengedit biodata pribadi | Data biodata | Validasi dan update biodata | Biodata berhasil diupdate |
| F10 | Dosen | Melihat dan mengelola detail kelas | ID kelas | Pengambilan data kelas dan mahasiswa | Informasi detail kelas dan daftar mahasiswa |
| F11 | Sistem | Mengelola notifikasi | Event sistem | Pemantauan event dan pembuatan notifikasi | Notifikasi tersedia untuk pengguna |
| F12 | Mahasiswa | Menghapus KRS sebelum disetujui | ID KRS | Validasi status dan penghapusan KRS | KRS berhasil dihapus |
| F13 | Dosen | Mengelola profil pribadi | Data profil dosen | Validasi dan update profil | Profil dosen berhasil diupdate |

### 4. Persyaratan Non-Fungsional
- **Kinerja**: 
  - Waktu respons halaman utama maksimum 3 detik
  - Sistem harus mampu melayani 1000+ pengguna aktif secara bersamaan
  - Proses penginputan nilai/presensi harus selesai dalam maksimum 2 detik

- **Keamanan**: 
  - Sistem harus memiliki otentikasi berbasis peran (role-based authentication)
  - Perlindungan terhadap SQL injection, XSS, dan CSRF attack
  - Validasi input dari pengguna untuk mencegah injeksi kode
  - Password harus di-hash menggunakan metode aman (bcrypt)

- **Ketersediaan**: 
  - Sistem harus aktif 24 jam sehari selama masa aktif akademik
  - Waktu downtime maksimum 2 jam per minggu untuk pemeliharaan
  - Sistem harus tetap aktif selama masa KRS dan ujian

- **Usability**: 
  - Antarmuka harus responsif dan kompatibel dengan mobile dan desktop
  - Desain intuitif dan mudah digunakan oleh pengguna dengan berbagai tingkat keahlian teknologi
  - Sistem harus menyediakan navigasi yang jelas dan petunjuk penggunaan

### 5. Antarmuka Eksternal
- **UI**: 
  - Dashboard utama berbeda untuk mahasiswa dan dosen
  - Form login dengan validasi otentikasi
  - Tabel data untuk menampilkan informasi seperti KRS, KHS, jadwal, presensi
  - Form pengisian biodata dan penginputan nilai/presensi
  - Sistem notifikasi untuk update penting

- **Integrasi**: 
  - Sistem mungkin terhubung ke sistem pembayaran untuk biaya kuliah (tidak terlihat dalam kode)
  - Sistem email untuk notifikasi otomatis (tidak terlihat dalam kode)
  - Sistem akademik utama kampus (tergantung implementasi institusi)

- **Perangkat**: 
  - Hanya membutuhkan peramban web modern (Chrome, Firefox, Safari, Edge)
  - Kompatibel dengan perangkat mobile, tablet, dan desktop
  - Tidak membutuhkan perangkat keras khusus

### 6. Model Data
- **Entitas Utama**:
  - **mahasiswa**: Informasi profil dan data akademik mahasiswa
  - **dosen**: Informasi profil dan data profesional dosen
  - **mata_kuliah**: Informasi mata kuliah yang ditawarkan
  - **kelas**: Koneksi antara mata kuliah dengan dosen dan kuota
  - **krs**: Kartu Rencana Studi mahasiswa dengan status
  - **nilai**: Nilai akademik dalam format huruf dan angka
  - **presensi**: Catatan kehadiran mahasiswa per pertemuan
  - **jadwal**: Jadwal pertemuan kelas
  - **notification**: Sistem notifikasi untuk update penting

- **Relasi Antar Entitas**:
  - mahasiswa terhubung ke user (one-to-one)
  - dosen terhubung ke user (one-to-one)
  - krs terhubung ke mahasiswa dan kelas (many-to-one)
  - nilai terhubung ke krs (one-to-one)
  - presensi terhubung ke krs (one-to-many)
  - kelas terhubung ke mata_kuliah dan dosen (many-to-one)

### 7. Asumsi dan Ketergantungan
- **Asumsi**:
  - Data pengguna (mahasiswa dan dosen) sudah tersedia sebelum sistem diimplementasikan
  - Jadwal akademik sudah ditentukan oleh bagian akademik
  - Sistem akan digunakan dalam jaringan internet yang stabil
  - Pengguna sudah familiar dengan penggunaan aplikasi web

- **Ketergantungan**:
  - Python ≥ 3.8 untuk menjalankan Django Framework
  - Django Framework ≥ 5.2.7
  - MySQL database server
  - Server web (Apache/Nginx) untuk hosting
  - Google Gemini API untuk fitur AI (opsional)
  - Koneksi internet stabil untuk akses sistem