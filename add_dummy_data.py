#!/usr/bin/env python
"""
Script untuk menambahkan dummy data ke database SIAKAD
- Mahasiswa per Program Studi
- Kelas dengan Mahasiswa Terbanyak
"""

import os
import django
import random
from datetime import date

# Setup Django
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'sip_kuliah.settings')
django.setup()

from django.contrib.auth.models import User
from academic.models import (
    Fakultas, ProgramStudi, Mahasiswa, Dosen,
    MataKuliah, Ruang, Semester, Kelas, KRS
)

def create_additional_mahasiswa():
    """Buat lebih banyak mahasiswa untuk setiap program studi"""
    print("\n=== Menambahkan Mahasiswa Dummy ===")

    # Ambil semua program studi
    prodi_list = list(ProgramStudi.objects.all())

    if not prodi_list:
        print("Tidak ada program studi. Buat dulu program studi.")
        return

    # Nama-nama dummy
    first_names = [
        "Ahmad", "Budi", "Citra", "Dewi", "Eko", "Fitri", "Gita", "Hendra",
        "Indah", "Joko", "Kartika", "Lisa", "Made", "Nina", "Oscar", "Putri",
        "Qori", "Rendi", "Siti", "Tono", "Umi", "Vina", "Wati", "Yudi", "Zahra",
        "Agus", "Bayu", "Candra", "Dian", "Evi", "Fajar", "Galuh", "Hadi",
        "Ika", "Jaya", "Kiki", "Lina", "Maya", "Nani", "Oki", "Pandu",
        "Ratna", "Sari", "Tina", "Umar", "Vita", "Wawan", "Yanti", "Zaki"
    ]

    last_names = [
        "Pratama", "Wijaya", "Kusuma", "Santoso", "Nugroho", "Wibowo",
        "Setiawan", "Kurniawan", "Firmansyah", "Hidayat", "Saputra", "Putra",
        "Sari", "Lestari", "Rahayu", "Maharani", "Utomo", "Gunawan",
        "Hakim", "Prabowo", "Susanto", "Hartono", "Subagyo", "Permana"
    ]

    # Target jumlah mahasiswa per prodi (variasi)
    target_counts = {
        'TI': 50,  # Teknik Informatika banyak
        'SI': 45,  # Sistem Informasi
        'TE': 35,  # Teknik Elektro
        'TM': 30,  # Teknik Mesin
        'TS': 28,  # Teknik Sipil
        'AR': 25,  # Arsitektur
        'MN': 40,  # Manajemen
        'AK': 38,  # Akuntansi
        'IK': 20,  # Ilmu Komunikasi
        'PS': 18,  # Psikologi
        'AI': 42,  # Artificial Intelligence (baru, populer)
    }

    added_count = 0
    angkatan_list = [2020, 2021, 2022, 2023, 2024]
    status_list = ['Aktif', 'Aktif', 'Aktif', 'Aktif', 'Cuti']  # Mostly aktif

    for prodi in prodi_list:
        kode = prodi.kode_prodi
        current_count = Mahasiswa.objects.filter(program_studi=prodi).count()
        target = target_counts.get(kode, 25)

        need_to_add = target - current_count

        if need_to_add <= 0:
            print(f"✓ {prodi.nama_prodi} ({kode}): Sudah ada {current_count} mahasiswa")
            continue

        print(f"+ Menambahkan {need_to_add} mahasiswa ke {prodi.nama_prodi} ({kode})")

        for i in range(need_to_add):
            # Generate NIM unik
            angkatan = random.choice(angkatan_list)
            nim_base = f"{angkatan}{kode}{random.randint(1000, 9999)}"

            # Pastikan NIM unik
            while Mahasiswa.objects.filter(nim=nim_base).exists():
                nim_base = f"{angkatan}{kode}{random.randint(1000, 9999)}"

            # Generate nama
            nama = f"{random.choice(first_names)} {random.choice(last_names)}"

            # Buat user
            username = nim_base
            user = User.objects.create_user(
                username=username,
                password='mahasiswa123',
                first_name=random.choice(first_names),
                last_name=random.choice(last_names)
            )

            # Buat mahasiswa
            mahasiswa = Mahasiswa.objects.create(
                nim=nim_base,
                nama=nama,
                program_studi=prodi,
                angkatan=angkatan,
                status_mahasiswa=random.choice(status_list),
                jenis_kelamin=random.choice(['L', 'P']),
                tempat_lahir=random.choice(['Jakarta', 'Bandung', 'Surabaya', 'Yogyakarta', 'Semarang']),
                tanggal_lahir=date(angkatan - 18, random.randint(1, 12), random.randint(1, 28)),
                alamat=f"Jl. {random.choice(['Sudirman', 'Thamrin', 'Gatot Subroto', 'Diponegoro'])} No. {random.randint(1, 100)}",
                no_telp=f"08{random.randint(1000000000, 9999999999)}",
                email=f"{username}@student.univ.ac.id",
                user=user
            )
            added_count += 1

    print(f"\n✓ Total {added_count} mahasiswa baru ditambahkan!")
    return added_count

def create_additional_kelas():
    """Buat lebih banyak kelas untuk memiliki variasi"""
    print("\n=== Menambahkan Kelas Dummy ===")

    # Ambil data yang diperlukan
    mata_kuliah_list = list(MataKuliah.objects.all())
    dosen_list = list(Dosen.objects.all())
    semester_aktif = Semester.objects.filter(aktif=True).first()
    ruang_list = list(Ruang.objects.all())

    if not mata_kuliah_list or not dosen_list or not semester_aktif:
        print("Data tidak lengkap. Pastikan ada mata kuliah, dosen, dan semester aktif.")
        return

    # Target: setiap mata kuliah punya 2-4 kelas
    added_count = 0
    kelas_suffix = ['A', 'B', 'C', 'D', 'E', 'F']

    for mk in mata_kuliah_list:
        current_classes = Kelas.objects.filter(mata_kuliah=mk, semester=semester_aktif).count()
        target_classes = random.randint(2, 4)

        need_to_add = target_classes - current_classes

        if need_to_add <= 0:
            continue

        print(f"+ Menambahkan {need_to_add} kelas untuk {mk.nama_mk}")

        for i in range(need_to_add):
            # Cari suffix yang belum dipakai
            used_suffixes = set(
                Kelas.objects.filter(mata_kuliah=mk, semester=semester_aktif)
                .values_list('kode_kelas', flat=True)
            )

            available_suffixes = [s for s in kelas_suffix if f"{mk.kode_mk}-{s}" not in used_suffixes]

            if not available_suffixes:
                break

            suffix = available_suffixes[0]
            kode_kelas = f"{mk.kode_mk}-{suffix}"

            kelas = Kelas.objects.create(
                kode_kelas=kode_kelas,
                mata_kuliah=mk,
                dosen=random.choice(dosen_list),
                semester=semester_aktif,
                tahun_ajaran=f"{semester_aktif.tahun_ajaran}",
                kuota=random.choice([30, 35, 40, 45, 50])
            )
            added_count += 1

    print(f"\n✓ Total {added_count} kelas baru ditambahkan!")
    return added_count

def fill_krs_data():
    """Isi KRS dengan data mahasiswa ke berbagai kelas"""
    print("\n=== Mengisi Data KRS ===")

    mahasiswa_list = list(Mahasiswa.objects.filter(status_mahasiswa='Aktif'))
    kelas_list = list(Kelas.objects.all())

    if not mahasiswa_list or not kelas_list:
        print("Data tidak lengkap.")
        return

    added_count = 0

    # Setiap mahasiswa ambil 4-6 kelas
    for mahasiswa in mahasiswa_list:
        # Cek sudah punya KRS berapa
        current_krs = KRS.objects.filter(mahasiswa=mahasiswa).count()

        if current_krs >= 4:
            continue

        # Ambil beberapa kelas random
        num_classes = random.randint(4, 6)
        selected_classes = random.sample(kelas_list, min(num_classes, len(kelas_list)))

        for kelas in selected_classes:
            # Cek apakah sudah terdaftar
            if KRS.objects.filter(mahasiswa=mahasiswa, kelas=kelas).exists():
                continue

            # Buat KRS
            KRS.objects.create(
                mahasiswa=mahasiswa,
                kelas=kelas,
                status=random.choice(['Disetujui', 'Disetujui', 'Disetujui', 'Pending'])
            )
            added_count += 1

    print(f"\n✓ Total {added_count} KRS baru ditambahkan!")
    return added_count

def show_statistics():
    """Tampilkan statistik setelah menambahkan data"""
    print("\n" + "="*60)
    print("STATISTIK DATA SETELAH PENAMBAHAN")
    print("="*60)

    # Mahasiswa per prodi
    print("\n📊 Mahasiswa per Program Studi:")
    from django.db.models import Count

    prodi_stats = ProgramStudi.objects.annotate(
        mhs_count=Count('mahasiswa')
    ).order_by('-mhs_count')

    for prodi in prodi_stats:
        print(f"  • {prodi.nama_prodi:30s} ({prodi.kode_prodi}): {prodi.mhs_count:3d} mahasiswa")

    # Kelas dengan mahasiswa terbanyak
    print("\n🏆 Top 5 Kelas dengan Mahasiswa Terbanyak:")
    top_classes = Kelas.objects.annotate(
        student_count=Count('krs')
    ).order_by('-student_count')[:5]

    for i, kelas in enumerate(top_classes, 1):
        print(f"  {i}. {kelas.kode_kelas:15s} - {kelas.mata_kuliah.nama_mk:30s}: {kelas.student_count:3d} mahasiswa")

    # Total stats
    print(f"\n📈 Total Statistik:")
    print(f"  • Total Mahasiswa: {Mahasiswa.objects.count()}")
    print(f"  • Total Kelas: {Kelas.objects.count()}")
    print(f"  • Total KRS: {KRS.objects.count()}")
    print(f"  • Total Program Studi: {ProgramStudi.objects.count()}")
    print(f"  • Total Dosen: {Dosen.objects.count()}")

def main():
    print("\n" + "="*60)
    print("SCRIPT PENAMBAHAN DUMMY DATA - SIAKAD")
    print("="*60)

    try:
        # 1. Tambah mahasiswa
        create_additional_mahasiswa()

        # 2. Tambah kelas
        create_additional_kelas()

        # 3. Isi KRS
        fill_krs_data()

        # 4. Tampilkan statistik
        show_statistics()

        print("\n" + "="*60)
        print("✅ SELESAI! Dummy data berhasil ditambahkan")
        print("="*60)

    except Exception as e:
        print(f"\n❌ Error: {e}")
        import traceback
        traceback.print_exc()

if __name__ == '__main__':
    main()
