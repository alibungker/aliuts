# Laporan Akhir Pengembangan Aplikasi Sistem Informasi Kuliah Berbasis Django

## 1. Ringkasan Eksekutif

Laporan ini menyajikan dokumentasi akhir pengembangan Sistem Informasi Kuliah (SIMKuliah) yang dibangun menggunakan framework Django dan database MySQL. Tujuan utama dari sistem ini adalah mengotomatisasi proses akademik perguruan tinggi, termasuk manajemen data mahasiswa dan dosen, pendaftaran Kartu Rencana Studi (KRS), pengelolaan nilai, serta sistem presensi.

### Teknologi yang Digunakan:
- **Framework**: Django (Python)
- **Database**: MySQL
- **Bahasa Pemrograman**: Python
- **Arsitektur**: Model-View-Controller (MVC) Django
- **Server**: Web Server (Apache/Nginx)

## 2. Arsitektur MVC Django

Sistem SIMKuliah mengikuti arsitektur Model-View-Controller yang diterapkan dalam framework Django. Arsitektur ini terdiri dari:

### Model
- Merupakan lapisan representasi data dan logika tingkat rendah dari sistem
- Berinteraksi langsung dengan database menggunakan Django ORM
- Contoh: Mahasiswa, Dosen, MataKuliah, KRS, Nilai, Presensi, Jadwal

### View
- Menangani logika tampilan dan interaksi pengguna
- Menerima permintaan (request) dari pengguna dan mengembalikan respons (response)
- Berisi fungsi-fungsi yang mengimplementasikan bisnis logika

### Controller (Django URL Routing)
- Django secara otomatis menangani routing permintaan HTTP ke view yang sesuai
- File urls.py mendefinisikan pola URL dan mengarahkan ke view terkait

### Template
- Lapisan presentasi yang menampilkan data ke pengguna
- Menggunakan template engine Django untuk render HTML dinamis

## 3. Daftar Aplikasi dan Fungsinya

### Aplikasi Utama: academic

Aplikasi academic merupakan inti dari sistem SIMKuliah dengan struktur sebagai berikut:

#### Models.py
- **ProgramStudi**: Mengelola data program studi/jurusan
- **Dosen**: Menyimpan informasi dosen lengkap dengan NIDN dan data akademik
- **Mahasiswa**: Menyimpan informasi mahasiswa lengkap dengan data pribadi dan akademik
- **MataKuliah**: Mengelola informasi mata kuliah (kode, nama, SKS, semester)
- **Kelas**: Menyambungkan antara mata kuliah, dosen, dan kuota
- **KRS**: Sistem pendaftaran mata kuliah dengan workflow persetujuan
- **Jadwal**: Penjadwalan kelas berdasarkan hari dan waktu
- **Presensi**: Sistem kehadiran mahasiswa
- **Nilai**: Sistem penilaian dengan konversi huruf dan angka
- **Notification**: Sistem notifikasi untuk workflow

#### Views.py
- **Dashboard Mahasiswa**: Menyediakan informasi akademik pribadi
- **Dashboard Dosen**: Menyediakan informasi kelas dan mahasiswa
- **Manajemen KRS**: Fungsi untuk mendaftar dan mengelola mata kuliah
- **Manajemen Nilai**: Fungsi untuk input dan manajemen nilai mahasiswa
- **Manajemen Presensi**: Fungsi untuk input kehadiran mahasiswa
- **Manajemen Jadwal**: Fungsi untuk melihat jadwal kuliah
- **Fungsi Otentikasi**: Login, logout, dan verifikasi peran

#### urls.py
- File routing yang menghubungkan URL dengan fungsi view
- Menyediakan endpoint untuk semua fitur sistem

#### Forms.py
- Form registrasi dan validasi data masukan pengguna
- Mencegah input data yang tidak valid

## 4. Implementasi Fitur Utama

### 4.1 Fitur Kartu Rencana Studi (KRS)
- Implementasi sistem pendaftaran mata kuliah dengan workflow persetujuan
- Mahasiswa dapat mendaftar ke kelas dengan status "pending" awalnya
- Dosen harus menyetujui pendaftaran KRS mahasiswa
- Validasi kuota kelas untuk mencegah kelebihan kapasitas
- Sistem notifikasi otomatis untuk permintaan KRS baru

### 4.2 Fitur Manajemen Nilai
- Sistem input nilai oleh dosen dengan validasi
- Konversi otomatis antara nilai angka dan huruf
- Perhitungan IPK (Indeks Prestasi Kumulatif) dan IPS (Indeks Prestasi Semester)
- Penyimpanan nilai dalam format huruf dan numerik
- Fungsi update nilai dengan mekanisme CRUD

### 4.3 Fitur Jadwal Kuliah
- Sistem manajemen jadwal berdasarkan kelas dan ruang
- Jadwal terhubung langsung dengan sistem presensi
- Tampilan jadwal yang mudah dipahami berdasarkan hari dan waktu
- Validasi konflik jadwal

## 5. Pengujian

### 5.1 Unit Testing
- Django menyediakan framework pengujian bawaan untuk menulis unit test
- Pengujian dilakukan untuk model, view, dan fungsionalitas kritis
- Pengujian validasi input dan workflow bisnis logika
- Pengujian otentikasi dan otorisasi peran pengguna

### 5.2 Manual Testing
- Uji fungsionalitas end-to-end untuk semua peran pengguna
- Pengujian validasi input dan penanganan kesalahan
- Uji kompatibilitas browser dan perangkat mobile
- Uji keamanan dasar termasuk akses peran dan otentikasi

### 5.3 Penutupan Pengujian
- Semua fungsi utama telah diuji dan bekerja sesuai spesifikasi
- Tidak ditemukan celah keamanan kritis
- Performa sistem dalam batas wajar untuk penggunaan akademik

## 6. Keamanan

### 6.1 Perlindungan SQL Injection
- Django ORM secara otomatis melindungi dari SQL injection melalui parameterisasi query
- Semua query database diimplementasikan menggunakan Django ORM, bukan raw SQL
- Validasi input pengguna dilakukan sebelum proses ke database

### 6.2 Perlindungan XSS (Cross-Site Scripting)
- Django template engine secara otomatis melakukan escaping konten
- Input pengguna difilter untuk mencegah injeksi JavaScript
- Penggunaan Content Security Policy (CSP) untuk meningkatkan keamanan

### 6.3 Perlindungan CSRF (Cross-Site Request Forgery)
- Django menyediakan middleware CSRF protection secara default
- Setiap form dilengkapi dengan token CSRF untuk otentikasi permintaan
- Validasi token CSRF dilakukan sebelum memproses data penting

### 6.4 Otentikasi dan Otorisasi
- Sistem login aman dengan enkripsi password menggunakan Django Auth
- Fungsi dekorator `@login_required` untuk melindungi view
- Role-based access control untuk membatasi akses fitur

## 7. Kinerja

### 7.1 Caching
- Penggunaan Django caching framework untuk menyimpan data frekuensi tinggi
- Caching query hasil perhitungan IPK/IPS untuk mengurangi beban database
- Cache halaman statis dan data yang jarang berubah

### 7.2 Query Optimization
- Penggunaan `select_related()` dan `prefetch_related()` untuk mengurangi jumlah query database
- Indexing pada kolom-kolom kritis seperti kode_prodi, kode_mk, dan nim
- Query database dioptimalkan untuk menghindari N+1 problem

### 7.3 Optimasi Template
- Load data secara efisien di view sebelum mengirim ke template
- Penggunaan template inheritance untuk mengurangi duplikasi kode
- Minimasi jumlah database hit dalam template

## 8. Dokumentasi

### 8.1 Dokumentasi Kode
- Komentar dalam kode mengikuti standar Python dan Django
- Fungsi dan kelas memiliki docstring yang menjelaskan fungsionalitas
- Struktur proyek yang konsisten sesuai konvensi Django

### 8.2 Dokumentasi Proyek
- README.md menyediakan informasi setup awal
- File .env.example menyediakan contoh konfigurasi lingkungan
- Dokumentasi API (jika ada) dalam format Swagger atau Django REST Framework

### 8.3 Konfigurasi
- File requirements.txt menyediakan daftar dependensi
- Environment variables yang dibutuhkan terdokumentasi dengan baik
- Instruksi deployment dan setup lingkungan pengembangan

## 9. Rekomendasi

### 9.1 Deployment Production
- Gunakan Gunicorn sebagai WSGI HTTP server untuk production
- Gunakan Nginx sebagai reverse proxy untuk load balancing dan static file serving
- Terapkan SSL/TLS untuk komunikasi yang aman

### 9.2 Continous Integration/Continuous Deployment (CI/CD)
- Implementasi pipeline CI/CD untuk otomatisasi testing dan deployment
- Unit test dijalankan secara otomatis pada setiap commit
- Deployment otomatis ke staging dan production

### 9.3 Containerization
- Gunakan Docker untuk containerisasi aplikasi
- Buat Dockerfile dan docker-compose.yml untuk memudahkan deployment
- Manfaatkan Docker untuk lingkungan development yang konsisten

### 9.4 Monitoring dan Logging
- Implementasi sistem logging untuk monitoring kinerja
- Gunakan tools seperti Sentry untuk error tracking
- Monitor penggunaan memory dan CPU
- Backup database secara rutin

### 9.5 Skalabilitas
- Pertimbangkan penggunaan Redis untuk caching lanjutan
- Implementasi queue untuk proses background (jika diperlukan)
- Database clustering untuk peningkatan performa

## 10. Penutup

Sistem Informasi Kuliah (SIMKuliah) telah berhasil dikembangkan sesuai dengan standar ISO/IEC/IEEE 29119. Aplikasi ini menyediakan solusi komprehensif untuk manajemen akademik perguruan tinggi dengan pendekatan berbasis web. Sistem telah diuji dan ditemukan bekerja sesuai spesifikasi dengan mempertimbangkan aspek keamanan, kinerja, dan skalabilitas.

Implementasi mengikuti praktik terbaik pengembangan perangkat lunak dengan penggunaan framework Django yang menyediakan perlindungan built-in terhadap banyak kerentanan keamanan. Arsitektur MVC memudahkan pemeliharaan dan pengembangan fitur-fitur tambahan di masa depan.

Dengan rekomendasi yang telah disampaikan, sistem ini siap untuk di-deploy dalam lingkungan production dan dapat dikembangkan lebih lanjut sesuai dengan kebutuhan institusi pendidikan.