from django.core.management.base import BaseCommand
from django.contrib.auth.models import User
from academic.models import (
    ProgramStudi, Dosen, Mahasiswa, MataKuliah,
    Kelas, KRS, Jadwal, Presensi, Nilai
)
from datetime import datetime, timedelta
import random


class Command(BaseCommand):
    help = 'Populate database with dummy data'

    def handle(self, *args, **kwargs):
        self.stdout.write(self.style.SUCCESS('Starting to populate dummy data...'))

        # 1. Create 10 Program Studi
        self.stdout.write('Creating Program Studi...')
        program_studi_list = []
        prodi_data = [
            ('S1 Teknik Informatika', 'TI', 'S1'),
            ('S1 Sistem Informasi', 'SI', 'S1'),
            ('S1 Teknik Elektro', 'TE', 'S1'),
            ('S1 Teknik Mesin', 'TM', 'S1'),
            ('S1 Teknik Sipil', 'TS', 'S1'),
            ('S1 Arsitektur', 'AR', 'S1'),
            ('S1 Manajemen', 'MN', 'S1'),
            ('S1 Akuntansi', 'AK', 'S1'),
            ('S1 Ilmu Komunikasi', 'IK', 'S1'),
            ('S1 Psikologi', 'PS', 'S1'),
        ]

        for i, (nama, kode, jenjang) in enumerate(prodi_data, 1):
            prodi, created = ProgramStudi.objects.get_or_create(
                kode_prodi=kode,
                defaults={
                    'nama_prodi': nama,
                    'jenjang': jenjang
                }
            )
            program_studi_list.append(prodi)
            if created:
                self.stdout.write(self.style.SUCCESS(f'  Created: {nama}'))

        # 2. Create 10 Dosen with User accounts
        self.stdout.write('\nCreating Dosen...')
        dosen_list = []
        dosen_data = [
            ('Dr. Ahmad Fauzi, S.Kom., M.Kom.', '1234567890', 'Lektor Kepala'),
            ('Dr. Budi Santoso, S.T., M.T.', '1234567891', 'Lektor'),
            ('Prof. Citra Dewi, S.Si., M.Si., Ph.D.', '1234567892', 'Profesor'),
            ('Dr. Dedi Hermawan, S.E., M.M.', '1234567893', 'Lektor Kepala'),
            ('Dr. Eka Putri, S.Psi., M.Psi.', '1234567894', 'Lektor'),
            ('Prof. Fajar Ramadhan, S.Kom., M.Kom.', '1234567895', 'Profesor'),
            ('Dr. Gita Savitri, S.T., M.T.', '1234567896', 'Asisten Ahli'),
            ('Dr. Hendra Wijaya, S.Ars., M.Ars.', '1234567897', 'Lektor'),
            ('Dr. Indah Permata, S.Ikom., M.Ikom.', '1234567898', 'Asisten Ahli'),
            ('Prof. Joko Widodo, S.Ak., M.Ak.', '1234567899', 'Profesor'),
        ]

        jabatan_list = ['Profesor', 'Lektor Kepala', 'Lektor', 'Asisten Ahli']

        for i, (nama, nidn, jabatan) in enumerate(dosen_data, 1):
            username = f'dosen{i}'
            user, created = User.objects.get_or_create(
                username=username,
                defaults={
                    'email': f'dosen{i}@univ.ac.id',
                    'first_name': nama.split()[1] if len(nama.split()) > 1 else nama,
                    'last_name': nama.split()[0] if len(nama.split()) > 1 else '',
                }
            )
            if created:
                user.set_password('password123')
                user.save()

            prodi = program_studi_list[(i-1) % len(program_studi_list)]
            dosen, created = Dosen.objects.get_or_create(
                nidn=nidn,
                defaults={
                    'user': user,
                    'nama': nama,
                    'program_studi': prodi,
                    'jabatan': jabatan,
                    'no_telp': f'08123456{i:04d}'
                }
            )
            dosen_list.append(dosen)
            if created:
                self.stdout.write(self.style.SUCCESS(f'  Created: {nama}'))

        # 3. Create 10 Mahasiswa with User accounts
        self.stdout.write('\nCreating Mahasiswa...')
        mahasiswa_list = []
        mahasiswa_data = [
            ('Andi Pratama', '2021001', 'andi.pratama@student.univ.ac.id'),
            ('Bella Safira', '2021002', 'bella.safira@student.univ.ac.id'),
            ('Candra Kirana', '2021003', 'candra.kirana@student.univ.ac.id'),
            ('Dimas Anggara', '2021004', 'dimas.anggara@student.univ.ac.id'),
            ('Eka Sari', '2021005', 'eka.sari@student.univ.ac.id'),
            ('Fahmi Reza', '2021006', 'fahmi.reza@student.univ.ac.id'),
            ('Gina Lestari', '2021007', 'gina.lestari@student.univ.ac.id'),
            ('Hadi Gunawan', '2021008', 'hadi.gunawan@student.univ.ac.id'),
            ('Intan Permatasari', '2021009', 'intan.permata@student.univ.ac.id'),
            ('Jaka Sembung', '2021010', 'jaka.sembung@student.univ.ac.id'),
        ]

        for i, (nama, nim, email) in enumerate(mahasiswa_data, 1):
            username = f'mhs{nim}'
            user, created = User.objects.get_or_create(
                username=username,
                defaults={
                    'email': email,
                    'first_name': nama.split()[0],
                    'last_name': nama.split()[1] if len(nama.split()) > 1 else '',
                }
            )
            if created:
                user.set_password('password123')
                user.save()

            prodi = program_studi_list[(i-1) % len(program_studi_list)]
            mhs, created = Mahasiswa.objects.get_or_create(
                nim=nim,
                defaults={
                    'user': user,
                    'nama': nama,
                    'program_studi': prodi,
                    'angkatan': 2021,
                    'no_telp': f'08129876{i:04d}'
                }
            )
            mahasiswa_list.append(mhs)
            if created:
                self.stdout.write(self.style.SUCCESS(f'  Created: {nama} ({nim})'))

        # 4. Create 10 Mata Kuliah
        self.stdout.write('\nCreating Mata Kuliah...')
        matkul_list = []
        matkul_data = [
            ('Algoritma dan Pemrograman', 'TIF101', 4, 1),
            ('Basis Data', 'TIF201', 3, 2),
            ('Pemrograman Web', 'TIF202', 3, 2),
            ('Jaringan Komputer', 'TIF301', 3, 3),
            ('Sistem Operasi', 'TIF302', 3, 3),
            ('Kecerdasan Buatan', 'TIF401', 3, 4),
            ('Data Mining', 'TIF402', 3, 4),
            ('Keamanan Informasi', 'TIF403', 2, 4),
            ('Cloud Computing', 'TIF501', 3, 5),
            ('Mobile Programming', 'TIF502', 3, 5),
        ]

        for i, (nama, kode, sks, semester) in enumerate(matkul_data, 1):
            prodi = program_studi_list[0]  # Assign to TI
            matkul, created = MataKuliah.objects.get_or_create(
                kode_mk=kode,
                defaults={
                    'nama_mk': nama,
                    'sks': sks,
                    'semester': semester,
                    'program_studi': prodi
                }
            )
            matkul_list.append(matkul)
            if created:
                self.stdout.write(self.style.SUCCESS(f'  Created: {nama} ({kode})'))

        # 5. Create 10 Kelas
        self.stdout.write('\nCreating Kelas...')
        kelas_list = []
        tahun_ajaran = '2024/2025'

        for i, matkul in enumerate(matkul_list, 1):
            dosen = dosen_list[(i-1) % len(dosen_list)]
            kelas_name = chr(64 + (i % 3) + 1)  # A, B, C
            kode_kelas = f'{matkul.kode_mk}-{kelas_name}'

            kelas, created = Kelas.objects.get_or_create(
                kode_kelas=kode_kelas,
                defaults={
                    'mata_kuliah': matkul,
                    'dosen': dosen,
                    'tahun_ajaran': tahun_ajaran,
                    'semester': 'Ganjil',
                    'kuota': 40
                }
            )
            kelas_list.append(kelas)
            if created:
                self.stdout.write(self.style.SUCCESS(f'  Created: {matkul.nama_mk} - Kelas {kelas_name}'))

        # 6. Create 10 Jadwal
        self.stdout.write('\nCreating Jadwal...')
        hari_list = ['Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat']

        for i, kelas in enumerate(kelas_list, 1):
            hari = hari_list[i % len(hari_list)]
            jam_mulai = f'{8 + (i % 4) * 2}:00:00'
            jam_selesai = f'{10 + (i % 4) * 2}:00:00'

            jadwal, created = Jadwal.objects.get_or_create(
                kelas=kelas,
                hari=hari,
                defaults={
                    'jam_mulai': jam_mulai,
                    'jam_selesai': jam_selesai,
                    'ruangan': f'R.{100+i}'
                }
            )
            if created:
                self.stdout.write(self.style.SUCCESS(f'  Created: {kelas.mata_kuliah.nama_mk} - {hari} {jam_mulai}'))

        # 7. Create 10 KRS entries
        self.stdout.write('\nCreating KRS...')
        krs_list = []

        for i, mhs in enumerate(mahasiswa_list, 1):
            # Each student enrolls in 1 class
            kelas = kelas_list[i % len(kelas_list)]

            krs, created = KRS.objects.get_or_create(
                mahasiswa=mhs,
                kelas=kelas,
                defaults={
                    'status': 'disetujui'
                }
            )
            krs_list.append(krs)
            if created:
                self.stdout.write(self.style.SUCCESS(f'  Created: {mhs.nama} enrolled in {kelas.mata_kuliah.nama_mk}'))

        # 8. Create 10 Presensi entries
        self.stdout.write('\nCreating Presensi...')
        status_list = ['hadir', 'izin', 'sakit', 'alpha']

        for i, krs in enumerate(krs_list, 1):
            for pertemuan in range(1, 3):  # 2 meetings per KRS
                status = random.choice(status_list)
                tanggal = datetime.now().date() - timedelta(days=14-pertemuan*7)

                presensi, created = Presensi.objects.get_or_create(
                    krs=krs,
                    pertemuan_ke=pertemuan,
                    defaults={
                        'tanggal': tanggal,
                        'status': status
                    }
                )
                if created:
                    self.stdout.write(self.style.SUCCESS(f'  Created: Presensi {krs.mahasiswa.nama} - Pertemuan {pertemuan}'))

        # 9. Create 10 Nilai entries
        self.stdout.write('\nCreating Nilai...')
        nilai_huruf_list = ['A', 'A-', 'B+', 'B', 'B-', 'C+', 'C']

        for i, krs in enumerate(krs_list, 1):
            nilai_huruf = random.choice(nilai_huruf_list)
            nilai_angka = {
                'A': 95.0, 'A-': 88.0, 'B+': 83.0, 'B': 78.0,
                'B-': 73.0, 'C+': 68.0, 'C': 63.0
            }.get(nilai_huruf, 80.0)

            nilai, created = Nilai.objects.get_or_create(
                krs=krs,
                defaults={
                    'nilai_angka': nilai_angka,
                    'nilai_huruf': nilai_huruf
                }
            )
            if created:
                self.stdout.write(self.style.SUCCESS(f'  Created: Nilai {krs.mahasiswa.nama} - {nilai_huruf}'))

        self.stdout.write(self.style.SUCCESS('\n✓ All dummy data created successfully!'))
        self.stdout.write(self.style.SUCCESS('\nSummary:'))
        self.stdout.write(f'  - Program Studi: {ProgramStudi.objects.count()}')
        self.stdout.write(f'  - Dosen: {Dosen.objects.count()}')
        self.stdout.write(f'  - Mahasiswa: {Mahasiswa.objects.count()}')
        self.stdout.write(f'  - Mata Kuliah: {MataKuliah.objects.count()}')
        self.stdout.write(f'  - Kelas: {Kelas.objects.count()}')
        self.stdout.write(f'  - KRS: {KRS.objects.count()}')
        self.stdout.write(f'  - Jadwal: {Jadwal.objects.count()}')
        self.stdout.write(f'  - Presensi: {Presensi.objects.count()}')
        self.stdout.write(f'  - Nilai: {Nilai.objects.count()}')
