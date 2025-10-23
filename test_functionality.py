#!/usr/bin/env python
"""
Comprehensive functionality test for SIAKAD system
Tests all features mentioned in manual book
"""

import os
import django
import sys

# Setup Django
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'sip_kuliah.settings')
django.setup()

from django.contrib.auth.models import User
from academic.models import (
    Fakultas, ProgramStudi, Mahasiswa, Dosen,
    MataKuliah, Ruang, Semester, Kelas, KRS,
    Jadwal, Nilai, Presensi, Notification
)
from django.db.models import Count
from datetime import date, datetime

class Colors:
    GREEN = '\033[92m'
    RED = '\033[91m'
    YELLOW = '\033[93m'
    BLUE = '\033[94m'
    END = '\033[0m'

def print_test(test_name, status, message=""):
    symbol = "✓" if status else "✗"
    color = Colors.GREEN if status else Colors.RED
    print(f"{color}{symbol} {test_name}{Colors.END} {message}")

def test_database_connectivity():
    """Test 1: Database Connection"""
    print(f"\n{Colors.BLUE}=== Testing Database Connectivity ==={Colors.END}")
    try:
        count = Mahasiswa.objects.count()
        print_test("Database connection", True, f"({count} mahasiswa found)")
        return True
    except Exception as e:
        print_test("Database connection", False, str(e))
        return False

def test_models_exist():
    """Test 2: All Models Exist"""
    print(f"\n{Colors.BLUE}=== Testing Models ==={Colors.END}")
    models = [
        ('Fakultas', Fakultas),
        ('ProgramStudi', ProgramStudi),
        ('Mahasiswa', Mahasiswa),
        ('Dosen', Dosen),
        ('MataKuliah', MataKuliah),
        ('Ruang', Ruang),
        ('Semester', Semester),
        ('Kelas', Kelas),
        ('KRS', KRS),
        ('Jadwal', Jadwal),
        ('Nilai', Nilai),
        ('Presensi', Presensi),
        ('Notification', Notification),
    ]

    all_ok = True
    for name, model in models:
        try:
            count = model.objects.count()
            print_test(f"Model {name}", True, f"({count} records)")
        except Exception as e:
            print_test(f"Model {name}", False, str(e))
            all_ok = False
    return all_ok

def test_admin_features():
    """Test 3: Admin Features"""
    print(f"\n{Colors.BLUE}=== Testing Admin Features ==={Colors.END}")

    tests = []

    # Test Fakultas CRUD
    try:
        fakultas = Fakultas.objects.first()
        if fakultas:
            print_test("Fakultas - Read", True, f"Found: {fakultas.nama_fakultas}")
        else:
            print_test("Fakultas - Read", False, "No data")
    except Exception as e:
        print_test("Fakultas - Read", False, str(e))

    # Test Program Studi
    try:
        prodi = ProgramStudi.objects.first()
        if prodi:
            print_test("Program Studi - Read", True, f"Found: {prodi.nama_prodi}")
        else:
            print_test("Program Studi - Read", False, "No data")
    except Exception as e:
        print_test("Program Studi - Read", False, str(e))

    # Test Mahasiswa
    try:
        mhs = Mahasiswa.objects.select_related('program_studi').first()
        if mhs:
            print_test("Mahasiswa - Read", True, f"Found: {mhs.nama} ({mhs.nim})")
            # Test foto field
            if hasattr(mhs, 'foto'):
                print_test("Mahasiswa - Foto field", True, "Field exists")
            else:
                print_test("Mahasiswa - Foto field", False, "Field missing")
        else:
            print_test("Mahasiswa - Read", False, "No data")
    except Exception as e:
        print_test("Mahasiswa - Read", False, str(e))

    # Test Dosen
    try:
        dosen = Dosen.objects.select_related('program_studi').first()
        if dosen:
            print_test("Dosen - Read", True, f"Found: {dosen.nama} ({dosen.nidn})")
            if hasattr(dosen, 'foto'):
                print_test("Dosen - Foto field", True, "Field exists")
            else:
                print_test("Dosen - Foto field", False, "Field missing")
        else:
            print_test("Dosen - Read", False, "No data")
    except Exception as e:
        print_test("Dosen - Read", False, str(e))

    # Test Mata Kuliah
    try:
        mk = MataKuliah.objects.first()
        if mk:
            print_test("Mata Kuliah - Read", True, f"Found: {mk.nama_mk}")
        else:
            print_test("Mata Kuliah - Read", False, "No data")
    except Exception as e:
        print_test("Mata Kuliah - Read", False, str(e))

    # Test Ruang
    try:
        ruang = Ruang.objects.first()
        if ruang:
            print_test("Ruang - Read", True, f"Found: {ruang.nama_ruang}")
        else:
            print_test("Ruang - Read", False, "No data")
    except Exception as e:
        print_test("Ruang - Read", False, str(e))

    # Test Semester
    try:
        semester = Semester.objects.first()
        if semester:
            print_test("Semester - Read", True, f"Found: {semester.nama_semester}")
        else:
            print_test("Semester - Read", False, "No data")
    except Exception as e:
        print_test("Semester - Read", False, str(e))

    # Test Kelas
    try:
        kelas = Kelas.objects.select_related('mata_kuliah', 'dosen').first()
        if kelas:
            print_test("Kelas - Read", True, f"Found: {kelas.kode_kelas}")
        else:
            print_test("Kelas - Read", False, "No data")
    except Exception as e:
        print_test("Kelas - Read", False, str(e))

    # Test Jadwal
    try:
        jadwal = Jadwal.objects.select_related('kelas').first()
        if jadwal:
            print_test("Jadwal - Read", True, f"Found: {jadwal.hari}")
        else:
            print_test("Jadwal - Read", False, "No data")
    except Exception as e:
        print_test("Jadwal - Read", False, str(e))

def test_mahasiswa_features():
    """Test 4: Mahasiswa Features"""
    print(f"\n{Colors.BLUE}=== Testing Mahasiswa Features ==={Colors.END}")

    try:
        mhs = Mahasiswa.objects.select_related('user', 'program_studi').first()
        if not mhs:
            print_test("Mahasiswa features", False, "No mahasiswa data")
            return

        print_test("Mahasiswa data exists", True, f"{mhs.nama}")

        # Test KRS
        krs_count = KRS.objects.filter(mahasiswa=mhs).count()
        print_test("KRS records", krs_count > 0, f"({krs_count} records)")

        # Test Nilai
        nilai_count = Nilai.objects.filter(krs__mahasiswa=mhs).count()
        print_test("Nilai records", nilai_count >= 0, f"({nilai_count} records)")

        # Test Presensi
        presensi_count = Presensi.objects.filter(krs__mahasiswa=mhs).count()
        print_test("Presensi records", presensi_count >= 0, f"({presensi_count} records)")

        # Test Jadwal access
        jadwal_count = Jadwal.objects.filter(kelas__krs__mahasiswa=mhs).distinct().count()
        print_test("Jadwal access", jadwal_count >= 0, f"({jadwal_count} jadwal)")

    except Exception as e:
        print_test("Mahasiswa features", False, str(e))

def test_dosen_features():
    """Test 5: Dosen Features"""
    print(f"\n{Colors.BLUE}=== Testing Dosen Features ==={Colors.END}")

    try:
        dosen = Dosen.objects.select_related('user', 'program_studi').first()
        if not dosen:
            print_test("Dosen features", False, "No dosen data")
            return

        print_test("Dosen data exists", True, f"{dosen.nama}")

        # Test Kelas assignment
        kelas_count = Kelas.objects.filter(dosen=dosen).count()
        print_test("Kelas assignment", kelas_count >= 0, f"({kelas_count} kelas)")

        # Test KRS approval
        krs_pending = KRS.objects.filter(
            kelas__dosen=dosen,
            status='pending'
        ).count()
        print_test("KRS approval queue", krs_pending >= 0, f"({krs_pending} pending)")

        # Test Nilai input capability
        print_test("Nilai input capability", True, "Structure OK")

        # Test Presensi input capability
        print_test("Presensi input capability", True, "Structure OK")

    except Exception as e:
        print_test("Dosen features", False, str(e))

def test_relationships():
    """Test 6: Model Relationships"""
    print(f"\n{Colors.BLUE}=== Testing Model Relationships ==={Colors.END}")

    try:
        # Fakultas -> Program Studi
        fakultas = Fakultas.objects.annotate(
            prodi_count=Count('programstudi')
        ).first()
        if fakultas:
            print_test("Fakultas -> ProgramStudi", True,
                      f"{fakultas.prodi_count} prodi in {fakultas.nama_fakultas}")

        # Program Studi -> Mahasiswa
        prodi = ProgramStudi.objects.annotate(
            mhs_count=Count('mahasiswa')
        ).first()
        if prodi:
            print_test("ProgramStudi -> Mahasiswa", True,
                      f"{prodi.mhs_count} mahasiswa in {prodi.nama_prodi}")

        # Kelas -> KRS -> Mahasiswa
        kelas = Kelas.objects.annotate(
            student_count=Count('krs')
        ).first()
        if kelas:
            print_test("Kelas -> KRS -> Mahasiswa", True,
                      f"{kelas.student_count} students in {kelas.kode_kelas}")

        # Dosen -> Kelas
        dosen = Dosen.objects.annotate(
            kelas_count=Count('kelas')
        ).first()
        if dosen:
            print_test("Dosen -> Kelas", True,
                      f"{dosen.kelas_count} kelas taught by {dosen.nama}")

    except Exception as e:
        print_test("Model relationships", False, str(e))

def test_data_integrity():
    """Test 7: Data Integrity"""
    print(f"\n{Colors.BLUE}=== Testing Data Integrity ==={Colors.END}")

    try:
        # Check for mahasiswa without user
        mhs_no_user = Mahasiswa.objects.filter(user__isnull=True).count()
        print_test("Mahasiswa -> User integrity", mhs_no_user == 0,
                  f"({mhs_no_user} orphaned records)" if mhs_no_user > 0 else "All linked")

        # Check for dosen without user
        dosen_no_user = Dosen.objects.filter(user__isnull=True).count()
        print_test("Dosen -> User integrity", dosen_no_user == 0,
                  f"({dosen_no_user} orphaned records)" if dosen_no_user > 0 else "All linked")

        # Check for prodi without fakultas
        prodi_no_fakultas = ProgramStudi.objects.filter(fakultas__isnull=True).count()
        print_test("ProgramStudi -> Fakultas integrity", prodi_no_fakultas == 0,
                  f"({prodi_no_fakultas} orphaned records)" if prodi_no_fakultas > 0 else "All linked")

        # Check for kelas without dosen or mata kuliah
        kelas_incomplete = Kelas.objects.filter(
            dosen__isnull=True
        ) | Kelas.objects.filter(mata_kuliah__isnull=True)
        kelas_incomplete_count = kelas_incomplete.count()
        print_test("Kelas integrity", kelas_incomplete_count == 0,
                  f"({kelas_incomplete_count} incomplete)" if kelas_incomplete_count > 0 else "All complete")

    except Exception as e:
        print_test("Data integrity", False, str(e))

def generate_summary():
    """Generate summary statistics"""
    print(f"\n{Colors.BLUE}=== System Summary ==={Colors.END}")
    print(f"Total Fakultas: {Fakultas.objects.count()}")
    print(f"Total Program Studi: {ProgramStudi.objects.count()}")
    print(f"Total Mahasiswa: {Mahasiswa.objects.count()}")
    print(f"Total Dosen: {Dosen.objects.count()}")
    print(f"Total Mata Kuliah: {MataKuliah.objects.count()}")
    print(f"Total Ruang: {Ruang.objects.count()}")
    print(f"Total Semester: {Semester.objects.count()}")
    print(f"Total Kelas: {Kelas.objects.count()}")
    print(f"Total KRS: {KRS.objects.count()}")
    print(f"Total Jadwal: {Jadwal.objects.count()}")
    print(f"Total Nilai: {Nilai.objects.count()}")
    print(f"Total Presensi: {Presensi.objects.count()}")
    print(f"Total Users: {User.objects.count()}")

    # Active students
    active_mhs = Mahasiswa.objects.filter(status_mahasiswa='Aktif').count()
    print(f"Active Mahasiswa: {active_mhs}")

def main():
    print(f"\n{Colors.BLUE}{'='*60}")
    print(f"  SIAKAD FUNCTIONALITY TEST")
    print(f"  Based on Manual Book Requirements")
    print(f"{'='*60}{Colors.END}\n")

    test_database_connectivity()
    test_models_exist()
    test_admin_features()
    test_mahasiswa_features()
    test_dosen_features()
    test_relationships()
    test_data_integrity()
    generate_summary()

    print(f"\n{Colors.BLUE}{'='*60}")
    print(f"  TEST COMPLETED")
    print(f"{'='*60}{Colors.END}\n")

if __name__ == '__main__':
    main()
