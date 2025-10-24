/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.4.8-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: aliuts
-- ------------------------------------------------------
-- Server version	11.4.8-MariaDB-ubu2404

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Current Database: `aliuts`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `aliuts` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `aliuts`;

--
-- Table structure for table `academic_dosen`
--

DROP TABLE IF EXISTS `academic_dosen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `academic_dosen` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nidn` varchar(20) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `jabatan` varchar(50) NOT NULL,
  `no_telp` varchar(15) NOT NULL,
  `user_id` int(11) NOT NULL,
  `program_studi_id` bigint(20) NOT NULL,
  `alamat` longtext NOT NULL,
  `email` varchar(254) NOT NULL,
  `foto` varchar(100) DEFAULT NULL,
  `gelar_belakang` varchar(50) NOT NULL,
  `gelar_depan` varchar(20) NOT NULL,
  `jenis_kelamin` varchar(10) NOT NULL,
  `nip` varchar(30) NOT NULL,
  `pendidikan_terakhir` varchar(50) NOT NULL,
  `status_kepegawaian` varchar(50) NOT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `tempat_lahir` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nidn` (`nidn`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `academic_dosen_program_studi_id_0800388f_fk_academic_` (`program_studi_id`),
  CONSTRAINT `academic_dosen_program_studi_id_0800388f_fk_academic_` FOREIGN KEY (`program_studi_id`) REFERENCES `academic_programstudi` (`id`),
  CONSTRAINT `academic_dosen_user_id_053e907a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academic_dosen`
--

LOCK TABLES `academic_dosen` WRITE;
/*!40000 ALTER TABLE `academic_dosen` DISABLE KEYS */;
INSERT INTO `academic_dosen` VALUES
(1,'1234567890','Dr. Ahmad Fauzi, S.Kom., M.Kom.','Lektor Kepala','081234560001',2,1,'','','dosen/WhatsApp_Image_2022-05-28_at_6.26.26_PM.jpeg','','','L','11009987564534','S3','Tetap','1983-10-22','Aceh Utara'),
(2,'1234567891','Dr. Budi Santoso, S.T., M.T.','Lektor','081234560002',3,2,'','','dosen/IMG_0664.jpeg','','','','','','',NULL,''),
(3,'1234567892','Prof. Citra Dewi, S.Si., M.Si., Ph.D.','Profesor','081234560003',4,3,'','','','','','','','','',NULL,''),
(4,'1234567893','Dr. Dedi Hermawan, S.E., M.M.','Lektor Kepala','081234560004',5,4,'','','dosen/IMG_0665.jpeg','','','','','','',NULL,''),
(5,'1234567894','Dr. Eka Putri, S.Psi., M.Psi.','Lektor','081234560005',6,5,'','','dosen/IMG_0664_HW2W7hb.jpeg','','','','','','',NULL,''),
(6,'1234567895','Prof. Fajar Ramadhan, S.Kom., M.Kom.','Profesor','081234560006',7,6,'','','','','','','','','',NULL,''),
(7,'1234567896','Dr. Gita Savitri, S.T., M.T.','Asisten Ahli','081234560007',8,7,'','','','','','','','','',NULL,''),
(8,'1234567897','Dr. Hendra Wijaya, S.Ars., M.Ars.','Lektor','081234560008',9,8,'','','','','','','','','',NULL,''),
(9,'1234567898','Dr. Indah Permata, S.Ikom., M.Ikom.','Asisten Ahli','081234560009',10,9,'','','','','','','','','',NULL,''),
(10,'1234567899','Prof. Joko Widodo, S.Ak., M.Ak.','Profesor','081234560010',11,10,'','','','','','','','','',NULL,'');
/*!40000 ALTER TABLE `academic_dosen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `academic_fakultas`
--

DROP TABLE IF EXISTS `academic_fakultas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `academic_fakultas` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `kode_fakultas` varchar(10) NOT NULL,
  `nama_fakultas` varchar(100) NOT NULL,
  `dekan` varchar(100) NOT NULL,
  `no_telp` varchar(15) NOT NULL,
  `email` varchar(254) NOT NULL,
  `alamat` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `kode_fakultas` (`kode_fakultas`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academic_fakultas`
--

LOCK TABLES `academic_fakultas` WRITE;
/*!40000 ALTER TABLE `academic_fakultas` DISABLE KEYS */;
INSERT INTO `academic_fakultas` VALUES
(1,'FT','Fakultas Teknik','Prof. Dr. Ir. Budi Santoso, M.T.','','','','2025-10-22 17:47:15.842137','2025-10-22 17:47:16.757783'),
(2,'FE','Fakultas Ekonomi','Prof. Dr. Siti Nurjanah, S.E., M.M.','','','','2025-10-22 17:47:15.842137','2025-10-22 17:47:16.757783'),
(3,'FH','Fakultas Hukum','Prof. Dr. Ahmad Fauzi, S.H., M.H.','','','','2025-10-22 17:47:15.842137','2025-10-22 17:47:16.757783');
/*!40000 ALTER TABLE `academic_fakultas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `academic_jadwal`
--

DROP TABLE IF EXISTS `academic_jadwal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `academic_jadwal` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `hari` varchar(10) NOT NULL,
  `jam_mulai` time(6) NOT NULL,
  `jam_selesai` time(6) NOT NULL,
  `ruangan` varchar(20) NOT NULL,
  `kelas_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `academic_jadwal_kelas_id_8e67460b_fk_academic_kelas_id` (`kelas_id`),
  CONSTRAINT `academic_jadwal_kelas_id_8e67460b_fk_academic_kelas_id` FOREIGN KEY (`kelas_id`) REFERENCES `academic_kelas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academic_jadwal`
--

LOCK TABLES `academic_jadwal` WRITE;
/*!40000 ALTER TABLE `academic_jadwal` DISABLE KEYS */;
INSERT INTO `academic_jadwal` VALUES
(1,'Selasa','10:00:00.000000','12:00:00.000000','R.101',1),
(2,'Rabu','12:00:00.000000','14:00:00.000000','R.102',2),
(3,'Kamis','14:00:00.000000','16:00:00.000000','R.103',3),
(4,'Jumat','08:00:00.000000','10:00:00.000000','R.104',4),
(5,'Senin','10:00:00.000000','12:00:00.000000','R.105',5),
(6,'Selasa','12:00:00.000000','14:00:00.000000','R.106',6),
(7,'Rabu','14:00:00.000000','16:00:00.000000','R.107',7),
(8,'Kamis','08:00:00.000000','10:00:00.000000','R.108',8),
(9,'Jumat','10:00:00.000000','12:00:00.000000','R.109',9),
(10,'Senin','12:00:00.000000','14:00:00.000000','R.110',10),
(11,'Senin','08:00:00.000000','09:40:00.000000','R301',1),
(12,'Selasa','13:00:00.000000','14:40:00.000000','Ruang Kelas 301',1),
(13,'Rabu','08:00:00.000000','09:40:00.000000','Ruang Kelas 301',5),
(14,'Selasa','08:00:00.000000','09:40:00.000000','Ruang Kelas 301',6),
(15,'Selasa','08:00:00.000000','09:40:00.000000','Auditorium Utama',7),
(16,'Selasa','15:00:00.000000','16:40:00.000000','Auditorium Utama',8),
(17,'Rabu','10:00:00.000000','11:40:00.000000','R301',1),
(18,'Kamis','08:00:00.000000','09:40:00.000000','R301',2),
(19,'Kamis','13:00:00.000000','14:40:00.000000','LAB01',3),
(20,'Jumat','13:00:00.000000','14:40:00.000000','AUD01',4),
(21,'Selasa','15:00:00.000000','16:40:00.000000','AUD01',5),
(22,'Senin','08:00:00.000000','09:40:00.000000','R301',6),
(23,'Jumat','15:00:00.000000','16:40:00.000000','LAB01',7),
(24,'Jumat','13:00:00.000000','14:40:00.000000','R301',8),
(25,'Kamis','10:00:00.000000','11:40:00.000000','AUD01',9),
(26,'Kamis','13:00:00.000000','14:40:00.000000','LAB01',10);
/*!40000 ALTER TABLE `academic_jadwal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `academic_kelas`
--

DROP TABLE IF EXISTS `academic_kelas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `academic_kelas` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `kode_kelas` varchar(20) NOT NULL,
  `tahun_ajaran` varchar(9) NOT NULL,
  `semester` varchar(10) NOT NULL,
  `kuota` int(11) NOT NULL,
  `dosen_id` bigint(20) NOT NULL,
  `mata_kuliah_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `kode_kelas` (`kode_kelas`),
  KEY `academic_kelas_dosen_id_710c39da_fk_academic_dosen_id` (`dosen_id`),
  KEY `academic_kelas_mata_kuliah_id_22c96436_fk_academic_matakuliah_id` (`mata_kuliah_id`),
  CONSTRAINT `academic_kelas_dosen_id_710c39da_fk_academic_dosen_id` FOREIGN KEY (`dosen_id`) REFERENCES `academic_dosen` (`id`),
  CONSTRAINT `academic_kelas_mata_kuliah_id_22c96436_fk_academic_matakuliah_id` FOREIGN KEY (`mata_kuliah_id`) REFERENCES `academic_matakuliah` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academic_kelas`
--

LOCK TABLES `academic_kelas` WRITE;
/*!40000 ALTER TABLE `academic_kelas` DISABLE KEYS */;
INSERT INTO `academic_kelas` VALUES
(1,'TIF101-B','2024/2025','Ganjil',40,1,1),
(2,'TIF201-C','2024/2025','Ganjil',40,2,2),
(3,'TIF202-A','2024/2025','Ganjil',40,3,3),
(4,'TIF301-B','2024/2025','Ganjil',40,4,4),
(5,'TIF302-C','2024/2025','Ganjil',40,5,5),
(6,'TIF401-A','2024/2025','Ganjil',40,6,6),
(7,'TIF402-B','2024/2025','Ganjil',40,7,7),
(8,'TIF403-C','2024/2025','Ganjil',40,8,8),
(9,'TIF501-A','2024/2025','Ganjil',40,9,9),
(10,'TIF502-B','2024/2025','Ganjil',40,10,10);
/*!40000 ALTER TABLE `academic_kelas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `academic_krs`
--

DROP TABLE IF EXISTS `academic_krs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `academic_krs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tanggal_daftar` datetime(6) NOT NULL,
  `status` varchar(10) NOT NULL,
  `kelas_id` bigint(20) NOT NULL,
  `mahasiswa_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `academic_krs_mahasiswa_id_kelas_id_b5fab860_uniq` (`mahasiswa_id`,`kelas_id`),
  KEY `academic_krs_kelas_id_c528b8b8_fk_academic_kelas_id` (`kelas_id`),
  CONSTRAINT `academic_krs_kelas_id_c528b8b8_fk_academic_kelas_id` FOREIGN KEY (`kelas_id`) REFERENCES `academic_kelas` (`id`),
  CONSTRAINT `academic_krs_mahasiswa_id_988a7338_fk_academic_mahasiswa_id` FOREIGN KEY (`mahasiswa_id`) REFERENCES `academic_mahasiswa` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academic_krs`
--

LOCK TABLES `academic_krs` WRITE;
/*!40000 ALTER TABLE `academic_krs` DISABLE KEYS */;
INSERT INTO `academic_krs` VALUES
(1,'2025-10-18 05:59:48.324237','disetujui',2,1),
(2,'2025-10-18 05:59:48.356693','disetujui',3,2),
(3,'2025-10-18 05:59:48.360355','disetujui',4,3),
(4,'2025-10-18 05:59:48.364280','disetujui',5,4),
(5,'2025-10-18 05:59:48.368161','disetujui',6,5),
(6,'2025-10-18 05:59:48.372060','disetujui',7,6),
(7,'2025-10-18 05:59:48.374903','disetujui',8,7),
(8,'2025-10-18 05:59:48.377437','disetujui',9,8),
(9,'2025-10-18 05:59:48.380103','disetujui',10,9),
(10,'2025-10-18 05:59:48.383748','disetujui',1,10),
(16,'2025-10-18 10:29:55.331558','disetujui',1,1),
(17,'2025-10-22 19:51:34.335177','Aktif',8,11),
(18,'2025-10-22 19:51:34.370221','Aktif',10,11),
(19,'2025-10-22 19:51:34.371367','Aktif',4,11),
(20,'2025-10-22 19:51:34.372347','Aktif',1,11),
(21,'2025-10-22 19:51:34.374263','Aktif',9,12),
(22,'2025-10-22 19:51:34.375165','Aktif',7,12),
(23,'2025-10-22 19:51:34.376040','Aktif',4,12),
(24,'2025-10-22 19:51:34.376990','Aktif',10,13),
(25,'2025-10-22 19:51:34.377931','Aktif',9,13),
(26,'2025-10-22 19:51:34.378857','Aktif',6,13),
(27,'2025-10-22 19:51:34.379779','Aktif',3,13),
(28,'2025-10-22 19:51:34.391487','Aktif',9,14),
(29,'2025-10-22 19:51:34.392898','Aktif',6,14),
(30,'2025-10-22 19:51:34.407342','Aktif',8,14),
(31,'2025-10-22 19:51:34.436443','Aktif',7,15),
(32,'2025-10-22 19:51:34.438144','Aktif',10,15),
(33,'2025-10-22 19:51:34.439063','Aktif',8,15),
(34,'2025-10-22 19:51:34.439970','Aktif',9,15),
(35,'2025-10-22 19:51:34.440855','Aktif',3,15),
(36,'2025-10-22 19:51:34.441718','Aktif',1,15),
(37,'2025-10-22 19:51:34.442635','Aktif',10,16),
(38,'2025-10-22 19:51:34.443475','Aktif',3,16),
(39,'2025-10-22 19:51:34.444387','Aktif',7,16),
(40,'2025-10-22 19:51:34.445290','Aktif',5,17),
(41,'2025-10-22 19:51:34.446187','Aktif',1,17),
(42,'2025-10-22 19:51:34.447071','Aktif',6,17),
(43,'2025-10-22 19:51:34.447961','Aktif',3,17),
(44,'2025-10-22 19:51:34.448916','Aktif',7,17),
(45,'2025-10-22 19:51:34.449886','Aktif',10,17),
(46,'2025-10-22 19:51:34.450891','Aktif',6,18),
(47,'2025-10-22 19:51:34.451783','Aktif',7,18),
(48,'2025-10-22 19:51:34.452657','Aktif',2,18),
(49,'2025-10-22 19:51:34.453534','Aktif',8,18),
(50,'2025-10-22 19:51:34.454428','Aktif',4,18),
(51,'2025-10-22 19:51:34.455386','Aktif',1,18),
(52,'2025-10-22 19:51:34.456368','Aktif',5,19),
(53,'2025-10-22 19:51:34.457327','Aktif',7,19),
(54,'2025-10-22 19:51:34.458268','Aktif',9,19),
(55,'2025-10-22 19:51:34.459246','Aktif',10,20),
(56,'2025-10-22 19:51:34.460177','Aktif',7,20),
(57,'2025-10-22 19:51:34.461139','Aktif',3,20),
(58,'2025-10-22 19:51:34.462078','Aktif',9,21),
(59,'2025-10-22 19:51:34.462970','Aktif',5,21),
(60,'2025-10-22 19:51:34.463919','Aktif',4,21),
(61,'2025-10-22 19:51:34.464874','Aktif',7,21),
(62,'2025-10-22 19:51:34.465847','Aktif',1,22),
(63,'2025-10-22 19:51:34.466763','Aktif',10,22),
(64,'2025-10-22 19:51:34.467613','Aktif',8,22),
(65,'2025-10-22 19:51:34.468452','Aktif',5,22),
(66,'2025-10-22 19:51:34.469413','Aktif',4,23),
(67,'2025-10-22 19:51:34.470319','Aktif',10,23),
(68,'2025-10-22 19:51:34.471252','Aktif',5,23),
(69,'2025-10-22 19:51:34.472218','Aktif',8,23),
(70,'2025-10-22 19:51:34.485628','Aktif',5,24),
(71,'2025-10-22 19:51:34.493675','Aktif',7,24),
(72,'2025-10-22 19:51:34.501785','Aktif',2,24),
(73,'2025-10-22 19:51:34.503509','Aktif',9,25),
(74,'2025-10-22 19:51:34.509062','Aktif',5,25),
(75,'2025-10-22 19:51:34.510870','Aktif',8,25),
(76,'2025-10-22 19:51:34.517230','Aktif',7,25),
(77,'2025-10-22 19:51:34.524487','Aktif',7,27),
(78,'2025-10-22 19:51:34.525966','Aktif',6,27),
(79,'2025-10-22 19:51:34.532128','Aktif',5,27),
(80,'2025-10-22 19:51:34.533537','Aktif',1,27),
(81,'2025-10-22 19:51:34.534295','Aktif',10,27),
(82,'2025-10-22 19:51:34.535698','Aktif',7,28),
(83,'2025-10-22 19:51:34.537085','Aktif',4,28),
(84,'2025-10-22 19:51:34.538003','Aktif',1,28),
(85,'2025-10-22 19:51:34.547701','Aktif',1,29),
(86,'2025-10-22 19:51:34.549016','Aktif',8,29),
(87,'2025-10-22 19:51:34.553188','Aktif',7,29),
(88,'2025-10-22 19:51:34.554418','Aktif',4,29),
(89,'2025-10-22 19:51:34.555589','Aktif',3,30),
(90,'2025-10-22 19:51:34.556340','Aktif',2,30),
(91,'2025-10-22 19:51:34.557268','Aktif',1,30),
(92,'2025-10-22 19:51:34.567390','Aktif',4,30),
(93,'2025-10-22 19:51:34.568231','Aktif',7,30),
(94,'2025-10-22 19:51:34.576267','Aktif',8,30),
(95,'2025-10-22 19:51:34.577603','Aktif',3,31),
(96,'2025-10-22 19:51:34.578949','Aktif',8,31),
(97,'2025-10-22 19:51:34.579767','Aktif',4,31),
(98,'2025-10-22 19:51:34.580909','Aktif',10,31),
(99,'2025-10-22 19:51:34.581755','Aktif',2,31),
(100,'2025-10-22 19:51:34.596578','Aktif',5,31),
(101,'2025-10-22 19:51:34.598349','Aktif',1,32),
(102,'2025-10-22 19:51:34.599248','Aktif',9,32),
(103,'2025-10-22 19:51:34.602896','Aktif',10,32),
(104,'2025-10-22 19:51:34.604397','Aktif',4,32),
(105,'2025-10-22 19:51:34.605942','Aktif',5,32),
(106,'2025-10-22 19:51:34.612188','Aktif',3,32),
(107,'2025-10-22 19:51:34.613154','Aktif',2,34),
(108,'2025-10-22 19:51:34.614689','Aktif',10,34),
(109,'2025-10-22 19:51:34.616415','Aktif',1,34),
(110,'2025-10-22 19:51:34.628537','Aktif',7,34),
(111,'2025-10-22 19:51:34.636615','Aktif',4,35),
(112,'2025-10-22 19:51:34.638180','Aktif',5,35),
(113,'2025-10-22 19:51:34.639708','Aktif',1,35),
(114,'2025-10-22 19:51:34.640852','Aktif',2,35),
(115,'2025-10-22 19:51:34.644416','Aktif',3,35),
(116,'2025-10-22 19:51:34.651292','Aktif',6,36),
(117,'2025-10-22 19:51:34.652717','Aktif',9,36),
(118,'2025-10-22 19:51:34.654535','Aktif',4,36),
(119,'2025-10-22 19:51:34.656026','Aktif',3,36),
(120,'2025-10-22 19:51:34.657578','Aktif',7,36),
(121,'2025-10-22 19:51:34.658667','Aktif',4,37),
(122,'2025-10-22 19:51:34.667304','Aktif',1,37),
(123,'2025-10-22 19:51:34.675145','Aktif',6,37),
(124,'2025-10-22 19:51:34.676612','Aktif',5,38),
(125,'2025-10-22 19:51:34.678568','Aktif',6,38),
(126,'2025-10-22 19:51:34.689196','Aktif',1,38),
(127,'2025-10-22 19:51:34.690780','Aktif',3,38),
(128,'2025-10-22 19:51:34.696358','Aktif',10,39),
(129,'2025-10-22 19:51:34.697854','Aktif',3,39),
(130,'2025-10-22 19:51:34.704250','Aktif',9,39),
(131,'2025-10-22 19:51:34.705963','Aktif',6,39),
(132,'2025-10-22 19:51:34.707548','Aktif',2,39),
(133,'2025-10-22 19:51:34.718286','Aktif',1,40),
(134,'2025-10-22 19:51:34.723196','Aktif',4,40),
(135,'2025-10-22 19:51:34.725016','Aktif',7,40),
(136,'2025-10-22 19:51:34.726703','Aktif',8,40);
/*!40000 ALTER TABLE `academic_krs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `academic_mahasiswa`
--

DROP TABLE IF EXISTS `academic_mahasiswa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `academic_mahasiswa` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nim` varchar(15) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `angkatan` int(11) NOT NULL,
  `no_telp` varchar(15) NOT NULL,
  `user_id` int(11) NOT NULL,
  `program_studi_id` bigint(20) NOT NULL,
  `agama` varchar(20) NOT NULL,
  `alamat` longtext NOT NULL,
  `alamat_ortu` longtext NOT NULL,
  `email` varchar(254) NOT NULL,
  `foto` varchar(100) DEFAULT NULL,
  `jenis_kelamin` varchar(10) NOT NULL,
  `nama_ayah` varchar(100) NOT NULL,
  `nama_ibu` varchar(100) NOT NULL,
  `no_telp_ortu` varchar(15) NOT NULL,
  `pekerjaan_ayah` varchar(100) NOT NULL,
  `pekerjaan_ibu` varchar(100) NOT NULL,
  `semester_berjalan` int(11) NOT NULL,
  `status_mahasiswa` varchar(20) NOT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `tempat_lahir` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nim` (`nim`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `academic_mahasiswa_program_studi_id_20767a24_fk_academic_` (`program_studi_id`),
  CONSTRAINT `academic_mahasiswa_program_studi_id_20767a24_fk_academic_` FOREIGN KEY (`program_studi_id`) REFERENCES `academic_programstudi` (`id`),
  CONSTRAINT `academic_mahasiswa_user_id_436c64ad_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=355 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academic_mahasiswa`
--

LOCK TABLES `academic_mahasiswa` WRITE;
/*!40000 ALTER TABLE `academic_mahasiswa` DISABLE KEYS */;
INSERT INTO `academic_mahasiswa` VALUES
(1,'2021001','Andi Pratama',2021,'081298760001',12,1,'Islam','Lambhuk,Banda Aceh,Aceh','','ali@email.com','mahasiswa/ali_photo_s2_Hwwl4no.jpeg','L','murtaza','Ila','085260828894','Swasta','rumah tangga',1,'Aktif','1984-10-07','Banda Aceh'),
(2,'2021002','Bella Safira',2021,'081298760002',13,2,'','','','','','','','','','','',1,'Aktif',NULL,''),
(3,'2021003','Candra Kirana',2021,'081298760003',14,3,'','','','','','','','','','','',1,'Aktif',NULL,''),
(4,'2021004','Dimas Anggara',2021,'081298760004',15,4,'','','','','','','','','','','',1,'Aktif',NULL,''),
(5,'2021005','Eka Sari',2021,'081298760005',16,5,'','','','','','','','','','','',1,'Aktif',NULL,''),
(6,'2021006','Fahmi Reza',2021,'081298760006',17,6,'','','','','','','','','','','',1,'Aktif',NULL,''),
(7,'2021007','Gina Lestari',2021,'081298760007',18,7,'','','','','','','','','','','',1,'Aktif',NULL,''),
(8,'2021008','Hadi Gunawan',2021,'081298760008',19,8,'','','','','','','','','','','',1,'Aktif',NULL,''),
(9,'2021009','Intan Permatasari',2021,'081298760009',20,9,'','','','','','','','','','','',1,'Aktif',NULL,''),
(10,'2021010','Jaka Sembung',2021,'081298760010',21,10,'','','','','','','','','','','',1,'Aktif',NULL,''),
(11,'11TE2021625','Rina Azzahra',2021,'08683026972',23,3,'Islam','Jl. Thamrin No. 74','','rina.azzahra93@student.ac.id','mahasiswa/IMG_0660.jpeg','P','','','','','',1,'Cuti','2005-05-05','Bandung'),
(12,'12TI2024352','Yoga Pratama Rahmawati',2024,'08733338480',24,1,'','Jl. Merdeka No. 55','','yoga.rahmawati24@yahoo.com','mahasiswa/IMG_0661.jpeg','','','','','','',1,'Aktif','2005-02-23','Semarang'),
(13,'13IK2022106','Siti Setia Maulana',2022,'08751294442',25,9,'Islam','Jl. Sudirman No. 54','','siti.maulana61@gmail.com','mahasiswa/IMG_0662.jpeg','P','','','','','',6,'Lulus','2001-07-10','Bandung'),
(14,'14TS2021609','Rafi Pratama Azzahra',2021,'08706706277',26,5,'Islam','Jl. Menteng No. 86','','rafi.azzahra9@student.ac.id','mahasiswa/IMG_0660_r0Wk25y.jpeg','P','','','','','',4,'DO','2001-09-18','Yogyakarta'),
(15,'15IK2020791','Nur Bhakti Kusnadi',2020,'08932802171',27,9,'Islam','Jl. Gatot Subroto No. 32','','nur.kusnadi41@gmail.com','','P','','','','','',1,'Mengundurkan Diri','2007-07-02','Bandung'),
(16,'16TE2020427','Rizki Pratama Kusuma',2020,'08548642718',28,3,'','Jl. Gatot Subroto No. 93','','rizki.kusuma42@gmail.com','','Laki-laki','','','','','',1,'Aktif','2004-08-05','Yogyakarta'),
(17,'17SI2020915','Yoga Mandala Kusuma',2020,'08798152241',29,2,'','Jl. Sudirman No. 96','','yoga.kusuma84@student.ac.id','','Perempuan','','','','','',1,'Aktif','2002-06-27','Jakarta'),
(18,'18AR2024125','Sari Pratama Fauzi',2024,'08483812661',30,6,'','Jl. Gatot Subroto No. 14','','sari.fauzi23@student.ac.id','','Laki-laki','','','','','',1,'Aktif','2007-04-02','Bandung'),
(19,'19TE2023436','Fajar Mahendra Fauzi',2023,'08916554619',31,3,'','Jl. Merdeka No. 24','','fajar.fauzi61@yahoo.com','','Perempuan','','','','','',1,'Aktif','2001-05-01','Bandung'),
(20,'20AK2023259','Lestari Adhi Ramadhan',2023,'08243420649',32,8,'','Jl. Thamrin No. 42','','lestari.ramadhan38@outlook.com','','Perempuan','','','','','',1,'Aktif','2002-02-16','Medan'),
(21,'21TI2023720','Rizki Adhi Maulana',2023,'08755898525',33,1,'','Jl. Thamrin No. 77','','rizki.maulana97@yahoo.com','','Laki-laki','','','','','',1,'Aktif','2002-06-12','Surabaya'),
(22,'220022023752','Rizki Pratama Maulana',2023,'08716973857',34,11,'','Jl. Menteng No. 32','','rizki.maulana92@outlook.com','','Laki-laki','','','','','',1,'Aktif','2004-02-28','Surabaya'),
(23,'23PS2024788','Indah Mahendra Anggraini',2024,'08943707961',35,10,'','Jl. Merdeka No. 53','','indah.anggraini61@yahoo.com','','Perempuan','','','','','',1,'Aktif','2001-12-29','Surabaya'),
(24,'24TE2022461','Doni Adhi Susanti',2022,'08791240745',36,3,'','Jl. Menteng No. 27','','doni.susanti42@outlook.com','','Perempuan','','','','','',1,'Aktif','2005-03-09','Yogyakarta'),
(25,'25SI2021734','Nadia Perkasa Permata',2021,'08518420318',37,2,'','Jl. Sudirman No. 20','','nadia.permata88@student.ac.id','','Perempuan','','','','','',1,'Aktif','2003-01-24','Yogyakarta'),
(26,'26AR2022918','Sari Setia Wijaya',2022,'08442132617',38,6,'','Jl. Merdeka No. 90','','sari.wijaya55@outlook.com','','Perempuan','','','','','',1,'Lulus','2005-11-22','Yogyakarta'),
(27,'27TI2022458','Reza Pratama Fauzi',2022,'08896073984',39,1,'','Jl. Sudirman No. 7','','reza.fauzi33@yahoo.com','','Perempuan','','','','','',1,'Cuti','2000-12-11','Medan'),
(28,'28TM2024607','Arif Anggraini',2024,'08698145708',40,4,'','Jl. Menteng No. 58','','arif.anggraini48@gmail.com','','Perempuan','','','','','',1,'Aktif','2006-01-27','Yogyakarta'),
(29,'29TE2022509','Rafi Pratama Mulyadi',2022,'08787516250',41,3,'','Jl. Gatot Subroto No. 16','','rafi.mulyadi60@outlook.com','','Laki-laki','','','','','',1,'Aktif','2004-02-05','Semarang'),
(30,'30SI2021546','Nur Perkasa Kusnadi',2021,'08798098419',42,2,'','Jl. Thamrin No. 54','','nur.kusnadi26@gmail.com','','Laki-laki','','','','','',1,'Aktif','2005-11-29','Semarang'),
(31,'31MN2023703','Rahman Adhi Permata',2023,'08595967687',43,7,'','Jl. Thamrin No. 27','','rahman.permata75@outlook.com','','Perempuan','','','','','',1,'Aktif','2004-12-14','Surabaya'),
(32,'32AK2024305','Nadia Mahendra Maulana',2024,'08177494221',44,8,'','Jl. Gatot Subroto No. 75','','nadia.maulana31@yahoo.com','','Perempuan','','','','','',1,'Aktif','2005-01-23','Semarang'),
(33,'33TI2024257','Hendra Pratama Firmansyah',2024,'08633758539',45,1,'','Jl. Thamrin No. 18','','hendra.firmansyah6@yahoo.com','','Laki-laki','','','','','',1,'Lulus','2002-08-31','Surabaya'),
(34,'34SI2022539','Rizki Perkasa Utami',2022,'08463677889',46,2,'','Jl. Merdeka No. 8','','rizki.utami72@outlook.com','','Laki-laki','','','','','',1,'Aktif','2007-04-23','Semarang'),
(35,'35TI2020831','Rafi Adhi Utami',2020,'08766671678',47,1,'','Jl. Thamrin No. 55','','rafi.utami1@student.ac.id','','Perempuan','','','','','',1,'Aktif','2006-09-24','Medan'),
(36,'36AK2022809','Aulia Cahaya Kusnadi',2022,'08685593083',48,8,'','Jl. Menteng No. 10','','aulia.kusnadi48@yahoo.com','','Perempuan','','','','','',1,'Aktif','2006-05-08','Medan'),
(37,'37TS2024968','Zahra Setia Purnama',2024,'08248249223',49,5,'','Jl. Thamrin No. 29','','zahra.purnama74@gmail.com','','Laki-laki','','','','','',1,'Aktif','2001-01-15','Jakarta'),
(38,'38MN2024147','Putri Pratama Kusuma',2024,'08179841505',50,7,'','Jl. Thamrin No. 59','','putri.kusuma41@gmail.com','','Perempuan','','','','','',1,'Cuti','2007-03-02','Surabaya'),
(39,'390022023856','Zahra Mandala Putri',2023,'08805157395',51,11,'','Jl. Gatot Subroto No. 29','','zahra.putri55@gmail.com','','Laki-laki','','','','','',1,'Aktif','2004-07-28','Yogyakarta'),
(40,'40AK2020548','Fajar Pratama Kusuma',2020,'08384993816',52,8,'','Jl. Merdeka No. 56','','fajar.kusuma92@student.ac.id','','Laki-laki','','','','','',1,'Aktif','2002-03-16','Yogyakarta'),
(41,'2024TI9382','Qori Hidayat',2024,'083145102496',54,1,'','Jl. Sudirman No. 13','','2024TI9382@student.univ.ac.id','','P','','','','','',1,'Aktif','2006-06-08','Yogyakarta'),
(42,'2021TI5787','Vina Nugroho',2021,'082513727791',55,1,'','Jl. Diponegoro No. 37','','2021TI5787@student.univ.ac.id','','P','','','','','',1,'Aktif','2003-09-05','Semarang'),
(43,'2024TI5308','Wawan Utomo',2024,'087408935940',56,1,'','Jl. Thamrin No. 34','','2024TI5308@student.univ.ac.id','','P','','','','','',1,'Aktif','2006-01-07','Surabaya'),
(44,'2021TI7026','Zahra Kusuma',2021,'086561192143',57,1,'','Jl. Diponegoro No. 19','','2021TI7026@student.univ.ac.id','','L','','','','','',1,'Aktif','2003-08-22','Bandung'),
(45,'2021TI3332','Eko Gunawan',2021,'083393597392',58,1,'','Jl. Diponegoro No. 75','','2021TI3332@student.univ.ac.id','','L','','','','','',1,'Aktif','2003-05-23','Bandung'),
(46,'2020TI2453','Tono Subagyo',2020,'081773146353',59,1,'','Jl. Sudirman No. 95','','2020TI2453@student.univ.ac.id','','L','','','','','',1,'Aktif','2002-10-28','Semarang'),
(47,'2021TI2512','Dian Rahayu',2021,'084225201140',60,1,'','Jl. Sudirman No. 78','','2021TI2512@student.univ.ac.id','','L','','','','','',1,'Cuti','2003-12-11','Yogyakarta'),
(48,'2024TI1436','Bayu Sari',2024,'085426770661',61,1,'','Jl. Sudirman No. 4','','2024TI1436@student.univ.ac.id','','L','','','','','',1,'Aktif','2006-01-24','Jakarta'),
(49,'2022TI4529','Umar Prabowo',2022,'086351778722',62,1,'','Jl. Thamrin No. 83','','2022TI4529@student.univ.ac.id','','L','','','','','',1,'Aktif','2004-02-25','Bandung'),
(50,'2020TI4067','Rendi Kurniawan',2020,'087532607676',63,1,'','Jl. Gatot Subroto No. 84','','2020TI4067@student.univ.ac.id','','L','','','','','',1,'Aktif','2002-08-01','Semarang'),
(51,'2022TI6820','Made Wijaya',2022,'082844341975',64,1,'','Jl. Sudirman No. 70','','2022TI6820@student.univ.ac.id','','L','','','','','',1,'Aktif','2004-12-21','Jakarta'),
(52,'2021TI4325','Joko Firmansyah',2021,'087838132484',65,1,'','Jl. Sudirman No. 26','','2021TI4325@student.univ.ac.id','','L','','','','','',1,'Aktif','2003-09-02','Semarang'),
(53,'2023TI3818','Wati Hartono',2023,'085536293022',66,1,'','Jl. Thamrin No. 42','','2023TI3818@student.univ.ac.id','','L','','','','','',1,'Aktif','2005-06-07','Semarang'),
(54,'2023TI5094','Maya Hartono',2023,'088142765561',67,1,'','Jl. Sudirman No. 14','','2023TI5094@student.univ.ac.id','','L','','','','','',1,'Aktif','2005-06-15','Surabaya'),
(55,'2021TI9407','Bayu Saputra',2021,'082621993320',68,1,'','Jl. Sudirman No. 48','','2021TI9407@student.univ.ac.id','','P','','','','','',1,'Cuti','2003-03-18','Surabaya'),
(56,'2021TI2380','Vita Wijaya',2021,'085537294056',69,1,'','Jl. Diponegoro No. 24','','2021TI2380@student.univ.ac.id','','P','','','','','',1,'Aktif','2003-04-02','Jakarta'),
(57,'2022TI4823','Vita Rahayu',2022,'089746946869',70,1,'','Jl. Sudirman No. 82','','2022TI4823@student.univ.ac.id','','P','','','','','',1,'Aktif','2004-04-08','Bandung'),
(58,'2022TI5816','Umi Firmansyah',2022,'089075726364',71,1,'','Jl. Sudirman No. 20','','2022TI5816@student.univ.ac.id','','P','','','','','',1,'Aktif','2004-05-26','Semarang'),
(59,'2021TI7365','Umi Wibowo',2021,'083826929128',72,1,'','Jl. Thamrin No. 67','','2021TI7365@student.univ.ac.id','','L','','','','','',1,'Aktif','2003-09-04','Yogyakarta'),
(60,'2024TI4434','Hadi Gunawan',2024,'089747342377',73,1,'','Jl. Diponegoro No. 96','','2024TI4434@student.univ.ac.id','','L','','','','','',1,'Aktif','2006-04-26','Yogyakarta'),
(61,'2022TI1440','Indah Nugroho',2022,'081616560989',74,1,'','Jl. Diponegoro No. 10','','2022TI1440@student.univ.ac.id','','L','','','','','',1,'Aktif','2004-08-23','Semarang'),
(62,'2021TI5135','Dewi Firmansyah',2021,'081865600671',75,1,'','Jl. Diponegoro No. 32','','2021TI5135@student.univ.ac.id','','L','','','','','',1,'Aktif','2003-08-16','Semarang'),
(63,'2021TI1055','Jaya Susanto',2021,'086445862580',76,1,'','Jl. Sudirman No. 58','','2021TI1055@student.univ.ac.id','','P','','','','','',1,'Aktif','2003-10-14','Surabaya'),
(64,'2020TI8459','Kiki Kurniawan',2020,'081098795473',77,1,'','Jl. Thamrin No. 50','','2020TI8459@student.univ.ac.id','','L','','','','','',1,'Aktif','2002-06-21','Yogyakarta'),
(65,'2024TI3470','Sari Maharani',2024,'088903605595',78,1,'','Jl. Gatot Subroto No. 44','','2024TI3470@student.univ.ac.id','','L','','','','','',1,'Aktif','2006-07-27','Jakarta'),
(66,'2020TI6338','Yanti Wibowo',2020,'086407436924',79,1,'','Jl. Gatot Subroto No. 40','','2020TI6338@student.univ.ac.id','','L','','','','','',1,'Aktif','2002-12-19','Bandung'),
(67,'2020TI4553','Bayu Firmansyah',2020,'088836725414',80,1,'','Jl. Gatot Subroto No. 22','','2020TI4553@student.univ.ac.id','','P','','','','','',1,'Aktif','2002-05-23','Semarang'),
(68,'2024TI1347','Ahmad Rahayu',2024,'086022749557',81,1,'','Jl. Thamrin No. 69','','2024TI1347@student.univ.ac.id','','P','','','','','',1,'Cuti','2006-04-17','Surabaya'),
(69,'2023TI7463','Oscar Putra',2023,'084162706907',82,1,'','Jl. Sudirman No. 22','','2023TI7463@student.univ.ac.id','','P','','','','','',1,'Aktif','2005-06-12','Yogyakarta'),
(70,'2024TI6898','Joko Santoso',2024,'082208897819',83,1,'','Jl. Gatot Subroto No. 5','','2024TI6898@student.univ.ac.id','','L','','','','','',1,'Aktif','2006-10-22','Surabaya'),
(71,'2020TI3156','Lisa Santoso',2020,'087674260561',84,1,'','Jl. Sudirman No. 84','','2020TI3156@student.univ.ac.id','','L','','','','','',1,'Aktif','2002-09-17','Yogyakarta'),
(72,'2024TI4831','Jaya Permana',2024,'088806960290',85,1,'','Jl. Sudirman No. 30','','2024TI4831@student.univ.ac.id','','P','','','','','',1,'Aktif','2006-02-11','Jakarta'),
(73,'2021TI2008','Zaki Saputra',2021,'081365432823',86,1,'','Jl. Sudirman No. 15','','2021TI2008@student.univ.ac.id','','L','','','','','',1,'Cuti','2003-02-09','Jakarta'),
(74,'2021TI1182','Putri Lestari',2021,'089497331466',87,1,'','Jl. Sudirman No. 39','','2021TI1182@student.univ.ac.id','','L','','','','','',1,'Aktif','2003-10-12','Semarang'),
(75,'2024TI4365','Maya Prabowo',2024,'082246998130',88,1,'','Jl. Sudirman No. 22','','2024TI4365@student.univ.ac.id','','P','','','','','',1,'Aktif','2006-10-01','Semarang'),
(76,'2022TI5438','Vita Hakim',2022,'087404053110',89,1,'','Jl. Thamrin No. 53','','2022TI5438@student.univ.ac.id','','P','','','','','',1,'Aktif','2004-08-22','Surabaya'),
(77,'2020TI1599','Indah Rahayu',2020,'081377624129',90,1,'','Jl. Thamrin No. 36','','2020TI1599@student.univ.ac.id','','P','','','','','',1,'Aktif','2002-04-10','Bandung'),
(78,'2020TI5229','Bayu Rahayu',2020,'081337877914',91,1,'','Jl. Gatot Subroto No. 17','','2020TI5229@student.univ.ac.id','','P','','','','','',1,'Cuti','2002-07-16','Semarang'),
(79,'2022TI2318','Dewi Kurniawan',2022,'087946567733',92,1,'','Jl. Sudirman No. 42','','2022TI2318@student.univ.ac.id','','P','','','','','',1,'Aktif','2004-04-17','Jakarta'),
(80,'2024TI5943','Lisa Hakim',2024,'083986174506',93,1,'','Jl. Thamrin No. 58','','2024TI5943@student.univ.ac.id','','L','','','','','',1,'Aktif','2006-06-11','Yogyakarta'),
(81,'2024TI2861','Made Santoso',2024,'082790690739',94,1,'','Jl. Thamrin No. 70','','2024TI2861@student.univ.ac.id','','P','','','','','',1,'Aktif','2006-09-07','Jakarta'),
(82,'2023TI1665','Kartika Rahayu',2023,'082068136790',95,1,'','Jl. Sudirman No. 32','','2023TI1665@student.univ.ac.id','','L','','','','','',1,'Aktif','2005-11-03','Jakarta'),
(83,'2021TI7540','Joko Firmansyah',2021,'087138304821',96,1,'','Jl. Gatot Subroto No. 71','','2021TI7540@student.univ.ac.id','','P','','','','','',1,'Aktif','2003-03-17','Bandung'),
(84,'2022TI4594','Qori Maharani',2022,'085256086038',97,1,'','Jl. Diponegoro No. 6','','2022TI4594@student.univ.ac.id','','P','','','','','',1,'Cuti','2004-11-08','Yogyakarta'),
(85,'2022SI8169','Agus Permana',2022,'086683386917',98,2,'','Jl. Sudirman No. 61','','2022SI8169@student.univ.ac.id','','P','','','','','',1,'Aktif','2004-08-05','Surabaya'),
(86,'2024SI2312','Jaya Hakim',2024,'088702168363',99,2,'','Jl. Diponegoro No. 38','','2024SI2312@student.univ.ac.id','','P','','','','','',1,'Aktif','2006-02-02','Surabaya'),
(87,'2021SI8472','Joko Saputra',2021,'087437070013',100,2,'','Jl. Thamrin No. 19','','2021SI8472@student.univ.ac.id','','P','','','','','',1,'Aktif','2003-07-10','Surabaya'),
(88,'2020SI4124','Hadi Utomo',2020,'083680222970',101,2,'','Jl. Sudirman No. 66','','2020SI4124@student.univ.ac.id','','L','','','','','',1,'Aktif','2002-09-25','Surabaya'),
(89,'2023SI8791','Ratna Sari',2023,'081519657739',102,2,'','Jl. Thamrin No. 48','','2023SI8791@student.univ.ac.id','','P','','','','','',1,'Aktif','2005-03-05','Bandung'),
(90,'2020SI6721','Budi Hidayat',2020,'088242339258',103,2,'','Jl. Gatot Subroto No. 11','','2020SI6721@student.univ.ac.id','','P','','','','','',1,'Aktif','2002-02-16','Bandung'),
(91,'2022SI4404','Rendi Sari',2022,'088221794664',104,2,'','Jl. Thamrin No. 57','','2022SI4404@student.univ.ac.id','','P','','','','','',1,'Cuti','2004-02-21','Jakarta'),
(92,'2023SI8052','Evi Hidayat',2023,'083824015662',105,2,'','Jl. Diponegoro No. 19','','2023SI8052@student.univ.ac.id','','L','','','','','',1,'Aktif','2005-06-28','Semarang'),
(93,'2023SI2561','Nina Hakim',2023,'087914327358',106,2,'','Jl. Sudirman No. 72','','2023SI2561@student.univ.ac.id','','P','','','','','',1,'Aktif','2005-10-10','Semarang'),
(94,'2021SI6112','Nina Hidayat',2021,'087526763243',107,2,'','Jl. Diponegoro No. 7','','2021SI6112@student.univ.ac.id','','L','','','','','',1,'Aktif','2003-08-16','Semarang'),
(95,'2023SI8640','Ahmad Rahayu',2023,'089527332174',108,2,'','Jl. Gatot Subroto No. 76','','2023SI8640@student.univ.ac.id','','L','','','','','',1,'Aktif','2005-03-26','Jakarta'),
(96,'2023SI7713','Indah Subagyo',2023,'087732224659',109,2,'','Jl. Sudirman No. 49','','2023SI7713@student.univ.ac.id','','P','','','','','',1,'Cuti','2005-09-01','Surabaya'),
(97,'2020SI8245','Oki Wijaya',2020,'081221183813',110,2,'','Jl. Sudirman No. 76','','2020SI8245@student.univ.ac.id','','L','','','','','',1,'Aktif','2002-11-08','Jakarta'),
(98,'2020SI7745','Candra Putra',2020,'088401014942',111,2,'','Jl. Diponegoro No. 96','','2020SI7745@student.univ.ac.id','','L','','','','','',1,'Aktif','2002-06-15','Bandung'),
(99,'2022SI7602','Oki Putra',2022,'084609527289',112,2,'','Jl. Diponegoro No. 88','','2022SI7602@student.univ.ac.id','','P','','','','','',1,'Aktif','2004-02-15','Semarang'),
(100,'2023SI6771','Pandu Setiawan',2023,'084822321035',113,2,'','Jl. Sudirman No. 37','','2023SI6771@student.univ.ac.id','','L','','','','','',1,'Aktif','2005-06-14','Bandung'),
(101,'2023SI3381','Vita Hartono',2023,'088174453266',114,2,'','Jl. Sudirman No. 68','','2023SI3381@student.univ.ac.id','','P','','','','','',1,'Aktif','2005-01-06','Semarang'),
(102,'2021SI4245','Rendi Saputra',2021,'087824147548',115,2,'','Jl. Diponegoro No. 13','','2021SI4245@student.univ.ac.id','','L','','','','','',1,'Aktif','2003-02-12','Surabaya'),
(103,'2020SI4032','Qori Susanto',2020,'084734485229',116,2,'','Jl. Thamrin No. 40','','2020SI4032@student.univ.ac.id','','P','','','','','',1,'Aktif','2002-02-04','Semarang'),
(104,'2024SI9883','Agus Hartono',2024,'089637790960',117,2,'','Jl. Diponegoro No. 78','','2024SI9883@student.univ.ac.id','','P','','','','','',1,'Cuti','2006-03-02','Surabaya'),
(105,'2020SI9682','Maya Hakim',2020,'081081273465',118,2,'','Jl. Thamrin No. 93','','2020SI9682@student.univ.ac.id','','L','','','','','',1,'Aktif','2002-07-20','Surabaya'),
(106,'2022SI8085','Zaki Hartono',2022,'082612703843',119,2,'','Jl. Diponegoro No. 87','','2022SI8085@student.univ.ac.id','','L','','','','','',1,'Aktif','2004-04-24','Surabaya'),
(107,'2023SI5160','Wawan Permana',2023,'086564386164',120,2,'','Jl. Diponegoro No. 99','','2023SI5160@student.univ.ac.id','','L','','','','','',1,'Aktif','2005-02-03','Yogyakarta'),
(108,'2024SI8418','Joko Lestari',2024,'085584153657',121,2,'','Jl. Diponegoro No. 100','','2024SI8418@student.univ.ac.id','','L','','','','','',1,'Aktif','2006-10-25','Semarang'),
(109,'2022SI2847','Eko Wibowo',2022,'086907082438',122,2,'','Jl. Gatot Subroto No. 39','','2022SI2847@student.univ.ac.id','','P','','','','','',1,'Aktif','2004-05-13','Surabaya'),
(110,'2021SI6538','Wawan Hakim',2021,'088514182630',123,2,'','Jl. Diponegoro No. 34','','2021SI6538@student.univ.ac.id','','P','','','','','',1,'Aktif','2003-12-03','Surabaya'),
(111,'2022SI4817','Hendra Nugroho',2022,'086116461745',124,2,'','Jl. Gatot Subroto No. 66','','2022SI4817@student.univ.ac.id','','L','','','','','',1,'Cuti','2004-11-16','Surabaya'),
(112,'2020SI3211','Wawan Sari',2020,'084873486005',125,2,'','Jl. Diponegoro No. 1','','2020SI3211@student.univ.ac.id','','L','','','','','',1,'Aktif','2002-10-21','Surabaya'),
(113,'2022SI8697','Vina Hidayat',2022,'085304529684',126,2,'','Jl. Diponegoro No. 88','','2022SI8697@student.univ.ac.id','','P','','','','','',1,'Aktif','2004-12-04','Semarang'),
(114,'2022SI8597','Citra Putra',2022,'081830833453',127,2,'','Jl. Gatot Subroto No. 36','','2022SI8597@student.univ.ac.id','','L','','','','','',1,'Aktif','2004-11-07','Surabaya'),
(115,'2023SI6783','Hadi Subagyo',2023,'084448844267',128,2,'','Jl. Sudirman No. 29','','2023SI6783@student.univ.ac.id','','P','','','','','',1,'Aktif','2005-03-28','Surabaya'),
(116,'2021SI6321','Vina Kusuma',2021,'086804845055',129,2,'','Jl. Diponegoro No. 71','','2021SI6321@student.univ.ac.id','','P','','','','','',1,'Aktif','2003-06-23','Bandung'),
(117,'2021SI6729','Yanti Gunawan',2021,'083354448259',130,2,'','Jl. Sudirman No. 5','','2021SI6729@student.univ.ac.id','','L','','','','','',1,'Cuti','2003-12-04','Semarang'),
(118,'2024SI4642','Qori Kusuma',2024,'081255476564',131,2,'','Jl. Thamrin No. 19','','2024SI4642@student.univ.ac.id','','P','','','','','',1,'Aktif','2006-06-20','Semarang'),
(119,'2022SI5108','Budi Hartono',2022,'083571528734',132,2,'','Jl. Thamrin No. 89','','2022SI5108@student.univ.ac.id','','P','','','','','',1,'Aktif','2004-07-26','Jakarta'),
(120,'2022SI3767','Tono Susanto',2022,'086810089356',133,2,'','Jl. Gatot Subroto No. 30','','2022SI3767@student.univ.ac.id','','L','','','','','',1,'Aktif','2004-04-21','Jakarta'),
(121,'2022SI6240','Kartika Susanto',2022,'089315497126',134,2,'','Jl. Gatot Subroto No. 71','','2022SI6240@student.univ.ac.id','','L','','','','','',1,'Aktif','2004-02-23','Surabaya'),
(122,'2020SI2945','Tono Susanto',2020,'089083821301',135,2,'','Jl. Sudirman No. 84','','2020SI2945@student.univ.ac.id','','P','','','','','',1,'Aktif','2002-07-12','Semarang'),
(123,'2022SI9545','Yanti Permana',2022,'082606244098',136,2,'','Jl. Diponegoro No. 87','','2022SI9545@student.univ.ac.id','','L','','','','','',1,'Aktif','2004-03-22','Yogyakarta'),
(124,'2021SI7174','Umar Pratama',2021,'083534146979',137,2,'','Jl. Thamrin No. 95','','2021SI7174@student.univ.ac.id','','P','','','','','',1,'Aktif','2003-02-26','Jakarta'),
(125,'2022TE1725','Joko Hidayat',2022,'089395097691',138,3,'','Jl. Diponegoro No. 70','','2022TE1725@student.univ.ac.id','','P','','','','','',1,'Aktif','2004-06-19','Jakarta'),
(126,'2021TE2036','Fitri Permana',2021,'083510093672',139,3,'','Jl. Diponegoro No. 92','','2021TE2036@student.univ.ac.id','','P','','','','','',1,'Aktif','2003-10-20','Bandung'),
(127,'2020TE6495','Candra Gunawan',2020,'082914273762',140,3,'','Jl. Thamrin No. 90','','2020TE6495@student.univ.ac.id','','P','','','','','',1,'Aktif','2002-08-05','Jakarta'),
(128,'2023TE8584','Yanti Sari',2023,'083567811742',141,3,'','Jl. Thamrin No. 11','','2023TE8584@student.univ.ac.id','','P','','','','','',1,'Aktif','2005-05-15','Yogyakarta'),
(129,'2022TE3686','Jaya Santoso',2022,'081609106916',142,3,'','Jl. Gatot Subroto No. 42','','2022TE3686@student.univ.ac.id','','P','','','','','',1,'Aktif','2004-06-11','Semarang'),
(130,'2023TE1265','Umar Prabowo',2023,'086793088971',143,3,'','Jl. Sudirman No. 65','','2023TE1265@student.univ.ac.id','','L','','','','','',1,'Aktif','2005-05-17','Yogyakarta'),
(131,'2022TE5320','Nani Putra',2022,'081999116353',144,3,'','Jl. Diponegoro No. 6','','2022TE5320@student.univ.ac.id','','L','','','','','',1,'Cuti','2004-07-28','Jakarta'),
(132,'2020TE2252','Lisa Rahayu',2020,'084324252860',145,3,'','Jl. Diponegoro No. 50','','2020TE2252@student.univ.ac.id','','P','','','','','',1,'Aktif','2002-02-22','Jakarta'),
(133,'2024TE9730','Galuh Subagyo',2024,'083480362652',146,3,'','Jl. Diponegoro No. 29','','2024TE9730@student.univ.ac.id','','L','','','','','',1,'Aktif','2006-04-23','Surabaya'),
(134,'2023TE1286','Lina Hakim',2023,'088736617607',147,3,'','Jl. Gatot Subroto No. 21','','2023TE1286@student.univ.ac.id','','P','','','','','',1,'Aktif','2005-04-10','Bandung'),
(135,'2020TE7898','Budi Wijaya',2020,'085354991340',148,3,'','Jl. Gatot Subroto No. 100','','2020TE7898@student.univ.ac.id','','L','','','','','',1,'Cuti','2002-07-25','Jakarta'),
(136,'2024TE8333','Siti Putra',2024,'086354950071',149,3,'','Jl. Sudirman No. 34','','2024TE8333@student.univ.ac.id','','L','','','','','',1,'Aktif','2006-05-04','Bandung'),
(137,'2020TE7653','Eko Pratama',2020,'085168673925',150,3,'','Jl. Thamrin No. 25','','2020TE7653@student.univ.ac.id','','L','','','','','',1,'Aktif','2002-12-10','Jakarta'),
(138,'2024TE2454','Wawan Hartono',2024,'089709429428',151,3,'','Jl. Gatot Subroto No. 58','','2024TE2454@student.univ.ac.id','','P','','','','','',1,'Aktif','2006-08-27','Bandung'),
(139,'2024TE8683','Zahra Prabowo',2024,'081598726392',152,3,'','Jl. Sudirman No. 12','','2024TE8683@student.univ.ac.id','','P','','','','','',1,'Aktif','2006-11-09','Surabaya'),
(140,'2024TE5497','Fitri Wijaya',2024,'089152759482',153,3,'','Jl. Diponegoro No. 94','','2024TE5497@student.univ.ac.id','','P','','','','','',1,'Aktif','2006-09-22','Surabaya'),
(141,'2022TE8898','Dian Sari',2022,'085324346499',154,3,'','Jl. Thamrin No. 68','','2022TE8898@student.univ.ac.id','','L','','','','','',1,'Aktif','2004-05-18','Yogyakarta'),
(142,'2021TE1649','Wati Nugroho',2021,'086997149167',155,3,'','Jl. Gatot Subroto No. 18','','2021TE1649@student.univ.ac.id','','P','','','','','',1,'Cuti','2003-03-04','Jakarta'),
(143,'2024TE5905','Lisa Subagyo',2024,'088831540143',156,3,'','Jl. Thamrin No. 56','','2024TE5905@student.univ.ac.id','','L','','','','','',1,'Aktif','2006-01-02','Surabaya'),
(144,'2021TE9048','Oki Lestari',2021,'084464525327',157,3,'','Jl. Gatot Subroto No. 84','','2021TE9048@student.univ.ac.id','','L','','','','','',1,'Aktif','2003-02-12','Yogyakarta'),
(145,'2022TE6222','Umi Hidayat',2022,'089785883025',158,3,'','Jl. Gatot Subroto No. 92','','2022TE6222@student.univ.ac.id','','L','','','','','',1,'Cuti','2004-05-08','Semarang'),
(146,'2021TE4718','Qori Lestari',2021,'085681931107',159,3,'','Jl. Gatot Subroto No. 71','','2021TE4718@student.univ.ac.id','','P','','','','','',1,'Aktif','2003-04-03','Jakarta'),
(147,'2021TE5304','Hadi Rahayu',2021,'082076093743',160,3,'','Jl. Sudirman No. 79','','2021TE5304@student.univ.ac.id','','P','','','','','',1,'Aktif','2003-08-06','Bandung'),
(148,'2020TE5280','Zahra Nugroho',2020,'088967625042',161,3,'','Jl. Diponegoro No. 8','','2020TE5280@student.univ.ac.id','','L','','','','','',1,'Aktif','2002-02-14','Semarang'),
(149,'2020TE1853','Putri Permana',2020,'089446878496',162,3,'','Jl. Gatot Subroto No. 59','','2020TE1853@student.univ.ac.id','','L','','','','','',1,'Aktif','2002-01-18','Yogyakarta'),
(150,'2021TE2392','Ahmad Setiawan',2021,'086456763756',163,3,'','Jl. Thamrin No. 28','','2021TE2392@student.univ.ac.id','','P','','','','','',1,'Aktif','2003-06-12','Surabaya'),
(151,'2024TE6300','Hadi Saputra',2024,'088322767559',164,3,'','Jl. Thamrin No. 53','','2024TE6300@student.univ.ac.id','','L','','','','','',1,'Cuti','2006-04-01','Surabaya'),
(152,'2021TE7661','Citra Permana',2021,'086764720243',165,3,'','Jl. Thamrin No. 58','','2021TE7661@student.univ.ac.id','','L','','','','','',1,'Aktif','2003-02-10','Yogyakarta'),
(153,'2023TE8517','Lisa Rahayu',2023,'085572611495',166,3,'','Jl. Thamrin No. 64','','2023TE8517@student.univ.ac.id','','P','','','','','',1,'Aktif','2005-03-19','Bandung'),
(154,'2021TM4113','Ahmad Rahayu',2021,'087790414504',167,4,'','Jl. Sudirman No. 65','','2021TM4113@student.univ.ac.id','','P','','','','','',1,'Aktif','2003-10-09','Semarang'),
(155,'2021TM9864','Pandu Lestari',2021,'089339222300',168,4,'','Jl. Thamrin No. 29','','2021TM9864@student.univ.ac.id','','L','','','','','',1,'Aktif','2003-10-14','Bandung'),
(156,'2021TM5085','Nani Kusuma',2021,'087798046749',169,4,'','Jl. Thamrin No. 61','','2021TM5085@student.univ.ac.id','','L','','','','','',1,'Aktif','2003-11-11','Bandung'),
(157,'2021TM4748','Nina Permana',2021,'089755899188',170,4,'','Jl. Gatot Subroto No. 8','','2021TM4748@student.univ.ac.id','','L','','','','','',1,'Aktif','2003-11-25','Bandung'),
(158,'2024TM2649','Dian Wijaya',2024,'087925251846',171,4,'','Jl. Diponegoro No. 91','','2024TM2649@student.univ.ac.id','','L','','','','','',1,'Aktif','2006-07-04','Yogyakarta'),
(159,'2021TM1027','Maya Subagyo',2021,'082721960348',172,4,'','Jl. Thamrin No. 35','','2021TM1027@student.univ.ac.id','','P','','','','','',1,'Aktif','2003-02-07','Bandung'),
(160,'2024TM2775','Fajar Prabowo',2024,'085151049105',173,4,'','Jl. Thamrin No. 24','','2024TM2775@student.univ.ac.id','','P','','','','','',1,'Aktif','2006-08-22','Bandung'),
(161,'2022TM4952','Tono Hartono',2022,'088913286744',174,4,'','Jl. Gatot Subroto No. 49','','2022TM4952@student.univ.ac.id','','L','','','','','',1,'Aktif','2004-09-06','Yogyakarta'),
(162,'2023TM8464','Qori Saputra',2023,'086434628236',175,4,'','Jl. Sudirman No. 61','','2023TM8464@student.univ.ac.id','','P','','','','','',1,'Aktif','2005-05-01','Yogyakarta'),
(163,'2024TM8079','Tono Hidayat',2024,'082379376913',176,4,'','Jl. Diponegoro No. 47','','2024TM8079@student.univ.ac.id','','P','','','','','',1,'Aktif','2006-05-23','Surabaya'),
(164,'2020TM6413','Gita Kurniawan',2020,'086314930253',177,4,'','Jl. Diponegoro No. 46','','2020TM6413@student.univ.ac.id','','P','','','','','',1,'Cuti','2002-08-18','Jakarta'),
(165,'2023TM3683','Fitri Prabowo',2023,'089858947403',178,4,'','Jl. Sudirman No. 29','','2023TM3683@student.univ.ac.id','','L','','','','','',1,'Aktif','2005-08-21','Yogyakarta'),
(166,'2023TM4581','Umar Santoso',2023,'083842619768',179,4,'','Jl. Diponegoro No. 17','','2023TM4581@student.univ.ac.id','','L','','','','','',1,'Aktif','2005-11-16','Surabaya'),
(167,'2020TM1509','Jaya Hakim',2020,'086597163744',180,4,'','Jl. Diponegoro No. 49','','2020TM1509@student.univ.ac.id','','P','','','','','',1,'Aktif','2002-09-02','Semarang'),
(168,'2023TM7461','Pandu Rahayu',2023,'086525311440',181,4,'','Jl. Gatot Subroto No. 70','','2023TM7461@student.univ.ac.id','','L','','','','','',1,'Cuti','2005-07-05','Jakarta'),
(169,'2021TM6185','Yanti Kurniawan',2021,'088874179128',182,4,'','Jl. Thamrin No. 72','','2021TM6185@student.univ.ac.id','','P','','','','','',1,'Aktif','2003-08-13','Bandung'),
(170,'2024TM5973','Wati Putra',2024,'086533160238',183,4,'','Jl. Thamrin No. 84','','2024TM5973@student.univ.ac.id','','L','','','','','',1,'Aktif','2006-04-02','Semarang'),
(171,'2020TM5400','Citra Hakim',2020,'082200028425',184,4,'','Jl. Thamrin No. 66','','2020TM5400@student.univ.ac.id','','L','','','','','',1,'Cuti','2002-12-25','Bandung'),
(172,'2021TM9086','Zaki Rahayu',2021,'088066067002',185,4,'','Jl. Sudirman No. 67','','2021TM9086@student.univ.ac.id','','P','','','','','',1,'Aktif','2003-01-25','Yogyakarta'),
(173,'2022TM2015','Qori Saputra',2022,'084014651720',186,4,'','Jl. Sudirman No. 29','','2022TM2015@student.univ.ac.id','','P','','','','','',1,'Aktif','2004-11-20','Yogyakarta'),
(174,'2024TM9645','Tina Nugroho',2024,'082588483479',187,4,'','Jl. Diponegoro No. 89','','2024TM9645@student.univ.ac.id','','L','','','','','',1,'Cuti','2006-12-19','Jakarta'),
(175,'2020TM7048','Dewi Gunawan',2020,'081773993898',188,4,'','Jl. Thamrin No. 15','','2020TM7048@student.univ.ac.id','','P','','','','','',1,'Aktif','2002-08-23','Bandung'),
(176,'2024TM3801','Rendi Sari',2024,'082754316089',189,4,'','Jl. Thamrin No. 86','','2024TM3801@student.univ.ac.id','','P','','','','','',1,'Aktif','2006-04-04','Bandung'),
(177,'2024TM9534','Citra Pratama',2024,'086906669695',190,4,'','Jl. Sudirman No. 68','','2024TM9534@student.univ.ac.id','','P','','','','','',1,'Aktif','2006-10-02','Semarang'),
(178,'2024TM2035','Siti Subagyo',2024,'088948675904',191,4,'','Jl. Diponegoro No. 12','','2024TM2035@student.univ.ac.id','','P','','','','','',1,'Aktif','2006-01-12','Jakarta'),
(179,'2022TM2586','Gita Permana',2022,'082278699345',192,4,'','Jl. Sudirman No. 47','','2022TM2586@student.univ.ac.id','','L','','','','','',1,'Aktif','2004-03-03','Yogyakarta'),
(180,'2023TM5597','Gita Susanto',2023,'086861687136',193,4,'','Jl. Diponegoro No. 77','','2023TM5597@student.univ.ac.id','','P','','','','','',1,'Aktif','2005-07-05','Bandung'),
(181,'2020TM3434','Umar Setiawan',2020,'089491195843',194,4,'','Jl. Sudirman No. 17','','2020TM3434@student.univ.ac.id','','L','','','','','',1,'Aktif','2002-09-21','Yogyakarta'),
(182,'2020TS9384','Kartika Gunawan',2020,'086717276125',195,5,'','Jl. Diponegoro No. 19','','2020TS9384@student.univ.ac.id','','P','','','','','',1,'Aktif','2002-12-21','Jakarta'),
(183,'2023TS4403','Zahra Setiawan',2023,'089898694196',196,5,'','Jl. Gatot Subroto No. 44','','2023TS4403@student.univ.ac.id','','P','','','','','',1,'Aktif','2005-05-10','Surabaya'),
(184,'2020TS4422','Tina Wijaya',2020,'085874998912',197,5,'','Jl. Diponegoro No. 15','','2020TS4422@student.univ.ac.id','','P','','','','','',1,'Aktif','2002-08-05','Bandung'),
(185,'2022TS2818','Nina Permana',2022,'081725685555',198,5,'','Jl. Diponegoro No. 77','','2022TS2818@student.univ.ac.id','','P','','','','','',1,'Cuti','2004-10-04','Yogyakarta'),
(186,'2023TS9891','Joko Hartono',2023,'089874315790',199,5,'','Jl. Sudirman No. 24','','2023TS9891@student.univ.ac.id','','P','','','','','',1,'Cuti','2005-05-26','Bandung'),
(187,'2021TS1915','Zaki Kusuma',2021,'088410116782',200,5,'','Jl. Gatot Subroto No. 65','','2021TS1915@student.univ.ac.id','','P','','','','','',1,'Aktif','2003-12-11','Surabaya'),
(188,'2021TS3148','Rendi Putra',2021,'084229924365',201,5,'','Jl. Sudirman No. 20','','2021TS3148@student.univ.ac.id','','L','','','','','',1,'Aktif','2003-09-04','Jakarta'),
(189,'2021TS3131','Zahra Kurniawan',2021,'083977414251',202,5,'','Jl. Sudirman No. 45','','2021TS3131@student.univ.ac.id','','L','','','','','',1,'Aktif','2003-10-03','Jakarta'),
(190,'2022TS1877','Pandu Subagyo',2022,'082234979995',203,5,'','Jl. Thamrin No. 82','','2022TS1877@student.univ.ac.id','','L','','','','','',1,'Aktif','2004-12-03','Semarang'),
(191,'2020TS1093','Ika Santoso',2020,'089564311571',204,5,'','Jl. Sudirman No. 47','','2020TS1093@student.univ.ac.id','','L','','','','','',1,'Aktif','2002-05-06','Bandung'),
(192,'2020TS6961','Oki Lestari',2020,'085524260102',205,5,'','Jl. Thamrin No. 4','','2020TS6961@student.univ.ac.id','','P','','','','','',1,'Cuti','2002-04-11','Jakarta'),
(193,'2020TS4222','Dian Wibowo',2020,'083007239688',206,5,'','Jl. Diponegoro No. 49','','2020TS4222@student.univ.ac.id','','L','','','','','',1,'Cuti','2002-09-04','Bandung'),
(194,'2020TS4429','Umi Kurniawan',2020,'084413749598',207,5,'','Jl. Thamrin No. 75','','2020TS4429@student.univ.ac.id','','L','','','','','',1,'Cuti','2002-07-01','Surabaya'),
(195,'2021TS9076','Oki Utomo',2021,'087570260984',208,5,'','Jl. Sudirman No. 68','','2021TS9076@student.univ.ac.id','','P','','','','','',1,'Aktif','2003-07-14','Bandung'),
(196,'2024TS7191','Agus Utomo',2024,'088494335539',209,5,'','Jl. Diponegoro No. 19','','2024TS7191@student.univ.ac.id','','P','','','','','',1,'Aktif','2006-02-21','Bandung'),
(197,'2020TS7639','Joko Wibowo',2020,'085097260035',210,5,'','Jl. Diponegoro No. 66','','2020TS7639@student.univ.ac.id','','L','','','','','',1,'Cuti','2002-09-28','Semarang'),
(198,'2022TS5429','Kiki Firmansyah',2022,'082992843102',211,5,'','Jl. Sudirman No. 94','','2022TS5429@student.univ.ac.id','','L','','','','','',1,'Aktif','2004-08-17','Semarang'),
(199,'2021TS8833','Ratna Sari',2021,'086451508244',212,5,'','Jl. Thamrin No. 5','','2021TS8833@student.univ.ac.id','','L','','','','','',1,'Aktif','2003-02-11','Jakarta'),
(200,'2023TS5906','Tono Nugroho',2023,'088763091532',213,5,'','Jl. Thamrin No. 74','','2023TS5906@student.univ.ac.id','','P','','','','','',1,'Cuti','2005-06-06','Yogyakarta'),
(201,'2024TS4885','Kartika Pratama',2024,'081187387021',214,5,'','Jl. Diponegoro No. 49','','2024TS4885@student.univ.ac.id','','L','','','','','',1,'Aktif','2006-07-17','Semarang'),
(202,'2022TS3956','Rendi Gunawan',2022,'088542584529',215,5,'','Jl. Thamrin No. 67','','2022TS3956@student.univ.ac.id','','L','','','','','',1,'Cuti','2004-12-10','Surabaya'),
(203,'2024TS1135','Lina Pratama',2024,'089197754945',216,5,'','Jl. Gatot Subroto No. 15','','2024TS1135@student.univ.ac.id','','P','','','','','',1,'Aktif','2006-03-21','Bandung'),
(204,'2020TS9695','Bayu Utomo',2020,'085898705979',217,5,'','Jl. Sudirman No. 20','','2020TS9695@student.univ.ac.id','','L','','','','','',1,'Aktif','2002-02-16','Surabaya'),
(205,'2020TS8515','Maya Maharani',2020,'084290804697',218,5,'','Jl. Diponegoro No. 39','','2020TS8515@student.univ.ac.id','','P','','','','','',1,'Cuti','2002-04-28','Jakarta'),
(206,'2020TS4786','Ratna Subagyo',2020,'089310054316',219,5,'','Jl. Thamrin No. 10','','2020TS4786@student.univ.ac.id','','P','','','','','',1,'Cuti','2002-09-12','Yogyakarta'),
(207,'2021AR8554','Gita Santoso',2021,'088572874068',220,6,'','Jl. Thamrin No. 72','','2021AR8554@student.univ.ac.id','','P','','','','','',1,'Cuti','2003-11-28','Surabaya'),
(208,'2022AR2128','Nani Maharani',2022,'083242038630',221,6,'','Jl. Sudirman No. 43','','2022AR2128@student.univ.ac.id','','P','','','','','',1,'Cuti','2004-06-28','Yogyakarta'),
(209,'2024AR3568','Siti Wibowo',2024,'088555196990',222,6,'','Jl. Thamrin No. 92','','2024AR3568@student.univ.ac.id','','L','','','','','',1,'Cuti','2006-03-19','Jakarta'),
(210,'2022AR3759','Ratna Subagyo',2022,'085281219284',223,6,'','Jl. Sudirman No. 36','','2022AR3759@student.univ.ac.id','','L','','','','','',1,'Aktif','2004-01-14','Bandung'),
(211,'2021AR5808','Gita Wijaya',2021,'086620097968',224,6,'','Jl. Gatot Subroto No. 69','','2021AR5808@student.univ.ac.id','','P','','','','','',1,'Aktif','2003-05-10','Jakarta'),
(212,'2024AR5374','Putri Hidayat',2024,'086371833505',225,6,'','Jl. Sudirman No. 43','','2024AR5374@student.univ.ac.id','','L','','','','','',1,'Cuti','2006-06-17','Bandung'),
(213,'2020AR8563','Candra Hidayat',2020,'086612175557',226,6,'','Jl. Sudirman No. 22','','2020AR8563@student.univ.ac.id','','L','','','','','',1,'Cuti','2002-10-03','Surabaya'),
(214,'2024AR8441','Oscar Santoso',2024,'089958755567',227,6,'','Jl. Diponegoro No. 59','','2024AR8441@student.univ.ac.id','','P','','','','','',1,'Aktif','2006-05-24','Surabaya'),
(215,'2023AR2448','Lina Setiawan',2023,'085374333615',228,6,'','Jl. Gatot Subroto No. 86','','2023AR2448@student.univ.ac.id','','P','','','','','',1,'Cuti','2005-05-06','Surabaya'),
(216,'2020AR2541','Umi Putra',2020,'084783492679',229,6,'','Jl. Thamrin No. 92','','2020AR2541@student.univ.ac.id','','P','','','','','',1,'Aktif','2002-08-10','Surabaya'),
(217,'2020AR6650','Umar Firmansyah',2020,'082329401887',230,6,'','Jl. Thamrin No. 10','','2020AR6650@student.univ.ac.id','','P','','','','','',1,'Aktif','2002-07-26','Semarang'),
(218,'2024AR4310','Maya Santoso',2024,'088347640912',231,6,'','Jl. Thamrin No. 85','','2024AR4310@student.univ.ac.id','','P','','','','','',1,'Aktif','2006-06-21','Bandung'),
(219,'2023AR8481','Dewi Saputra',2023,'081903997316',232,6,'','Jl. Thamrin No. 74','','2023AR8481@student.univ.ac.id','','P','','','','','',1,'Cuti','2005-11-22','Yogyakarta'),
(220,'2021AR3507','Yudi Rahayu',2021,'082654808376',233,6,'','Jl. Gatot Subroto No. 40','','2021AR3507@student.univ.ac.id','','L','','','','','',1,'Aktif','2003-09-16','Jakarta'),
(221,'2023AR2506','Vina Utomo',2023,'087202309567',234,6,'','Jl. Gatot Subroto No. 55','','2023AR2506@student.univ.ac.id','','L','','','','','',1,'Cuti','2005-07-16','Jakarta'),
(222,'2022AR7668','Candra Sari',2022,'084899269154',235,6,'','Jl. Gatot Subroto No. 53','','2022AR7668@student.univ.ac.id','','P','','','','','',1,'Aktif','2004-11-25','Yogyakarta'),
(223,'2024AR9590','Qori Setiawan',2024,'089870795525',236,6,'','Jl. Sudirman No. 22','','2024AR9590@student.univ.ac.id','','P','','','','','',1,'Aktif','2006-10-27','Surabaya'),
(224,'2022AR2188','Yudi Pratama',2022,'083413977977',237,6,'','Jl. Gatot Subroto No. 25','','2022AR2188@student.univ.ac.id','','P','','','','','',1,'Aktif','2004-02-21','Jakarta'),
(225,'2022AR9426','Tina Hartono',2022,'087200601026',238,6,'','Jl. Diponegoro No. 83','','2022AR9426@student.univ.ac.id','','P','','','','','',1,'Aktif','2004-05-16','Semarang'),
(226,'2024AR1892','Nani Kusuma',2024,'084053860298',239,6,'','Jl. Diponegoro No. 71','','2024AR1892@student.univ.ac.id','','P','','','','','',1,'Aktif','2006-03-17','Jakarta'),
(227,'2022AR5933','Wati Pratama',2022,'082447986584',240,6,'','Jl. Sudirman No. 88','','2022AR5933@student.univ.ac.id','','L','','','','','',1,'Aktif','2004-01-22','Semarang'),
(228,'2020AR1110','Galuh Lestari',2020,'083538001432',241,6,'','Jl. Thamrin No. 36','','2020AR1110@student.univ.ac.id','','P','','','','','',1,'Aktif','2002-06-06','Jakarta'),
(229,'2024MN7519','Wati Maharani',2024,'086275665327',242,7,'','Jl. Thamrin No. 45','','2024MN7519@student.univ.ac.id','','P','','','','','',1,'Aktif','2006-09-21','Surabaya'),
(230,'2022MN7526','Fajar Lestari',2022,'088219570770',243,7,'','Jl. Sudirman No. 50','','2022MN7526@student.univ.ac.id','','P','','','','','',1,'Cuti','2004-10-24','Yogyakarta'),
(231,'2020MN9807','Made Maharani',2020,'087974576055',244,7,'','Jl. Thamrin No. 93','','2020MN9807@student.univ.ac.id','','P','','','','','',1,'Aktif','2002-05-27','Jakarta'),
(232,'2024MN3797','Ratna Saputra',2024,'088409575310',245,7,'','Jl. Sudirman No. 79','','2024MN3797@student.univ.ac.id','','L','','','','','',1,'Aktif','2006-04-05','Jakarta'),
(233,'2020MN8478','Putri Sari',2020,'084323677327',246,7,'','Jl. Thamrin No. 14','','2020MN8478@student.univ.ac.id','','P','','','','','',1,'Aktif','2002-09-04','Yogyakarta'),
(234,'2021MN2157','Tina Sari',2021,'089792935629',247,7,'','Jl. Sudirman No. 72','','2021MN2157@student.univ.ac.id','','P','','','','','',1,'Aktif','2003-07-22','Semarang'),
(235,'2022MN5205','Pandu Hartono',2022,'089428351793',248,7,'','Jl. Thamrin No. 96','','2022MN5205@student.univ.ac.id','','P','','','','','',1,'Aktif','2004-06-10','Bandung'),
(236,'2023MN5918','Yudi Hartono',2023,'083177802741',249,7,'','Jl. Sudirman No. 10','','2023MN5918@student.univ.ac.id','','L','','','','','',1,'Aktif','2005-05-20','Jakarta'),
(237,'2024MN6211','Yudi Gunawan',2024,'083565532906',250,7,'','Jl. Gatot Subroto No. 11','','2024MN6211@student.univ.ac.id','','P','','','','','',1,'Aktif','2006-08-26','Surabaya'),
(238,'2024MN1261','Nani Putra',2024,'085162382591',251,7,'','Jl. Gatot Subroto No. 99','','2024MN1261@student.univ.ac.id','','L','','','','','',1,'Aktif','2006-07-01','Surabaya'),
(239,'2021MN3870','Kiki Hartono',2021,'082814977295',252,7,'','Jl. Sudirman No. 2','','2021MN3870@student.univ.ac.id','','L','','','','','',1,'Aktif','2003-04-24','Yogyakarta'),
(240,'2023MN5599','Dian Maharani',2023,'082709146731',253,7,'','Jl. Diponegoro No. 51','','2023MN5599@student.univ.ac.id','','P','','','','','',1,'Aktif','2005-09-19','Jakarta'),
(241,'2021MN8421','Budi Wibowo',2021,'086662413683',254,7,'','Jl. Sudirman No. 64','','2021MN8421@student.univ.ac.id','','P','','','','','',1,'Aktif','2003-05-16','Bandung'),
(242,'2020MN7941','Made Hartono',2020,'089717589818',255,7,'','Jl. Diponegoro No. 54','','2020MN7941@student.univ.ac.id','','P','','','','','',1,'Cuti','2002-05-25','Jakarta'),
(243,'2024MN2095','Budi Wijaya',2024,'085119319659',256,7,'','Jl. Sudirman No. 72','','2024MN2095@student.univ.ac.id','','P','','','','','',1,'Aktif','2006-02-18','Surabaya'),
(244,'2024MN7686','Evi Wijaya',2024,'083657660453',257,7,'','Jl. Gatot Subroto No. 55','','2024MN7686@student.univ.ac.id','','P','','','','','',1,'Aktif','2006-08-02','Surabaya'),
(245,'2024MN4606','Lisa Saputra',2024,'089689405793',258,7,'','Jl. Diponegoro No. 28','','2024MN4606@student.univ.ac.id','','P','','','','','',1,'Aktif','2006-11-01','Surabaya'),
(246,'2024MN4128','Qori Permana',2024,'085482174218',259,7,'','Jl. Diponegoro No. 54','','2024MN4128@student.univ.ac.id','','P','','','','','',1,'Aktif','2006-07-10','Yogyakarta'),
(247,'2023MN1062','Wawan Hidayat',2023,'083836006018',260,7,'','Jl. Sudirman No. 3','','2023MN1062@student.univ.ac.id','','P','','','','','',1,'Aktif','2005-08-01','Surabaya'),
(248,'2020MN1850','Hadi Hakim',2020,'085036917360',261,7,'','Jl. Sudirman No. 21','','2020MN1850@student.univ.ac.id','','P','','','','','',1,'Aktif','2002-05-05','Surabaya'),
(249,'2023MN2739','Kartika Lestari',2023,'082375216497',262,7,'','Jl. Gatot Subroto No. 5','','2023MN2739@student.univ.ac.id','','L','','','','','',1,'Cuti','2005-10-16','Surabaya'),
(250,'2020MN2742','Hadi Utomo',2020,'086677803986',263,7,'','Jl. Gatot Subroto No. 62','','2020MN2742@student.univ.ac.id','','L','','','','','',1,'Aktif','2002-12-08','Bandung'),
(251,'2023MN3063','Zahra Sari',2023,'086950820904',264,7,'','Jl. Gatot Subroto No. 45','','2023MN3063@student.univ.ac.id','','L','','','','','',1,'Aktif','2005-07-16','Jakarta'),
(252,'2020MN2772','Maya Gunawan',2020,'086115171486',265,7,'','Jl. Gatot Subroto No. 53','','2020MN2772@student.univ.ac.id','','L','','','','','',1,'Cuti','2002-04-19','Semarang'),
(253,'2022MN4510','Oki Firmansyah',2022,'085948999434',266,7,'','Jl. Gatot Subroto No. 86','','2022MN4510@student.univ.ac.id','','P','','','','','',1,'Aktif','2004-02-01','Surabaya'),
(254,'2022MN5640','Vita Kurniawan',2022,'085789296440',267,7,'','Jl. Diponegoro No. 59','','2022MN5640@student.univ.ac.id','','P','','','','','',1,'Aktif','2004-10-15','Bandung'),
(255,'2023MN4754','Maya Wibowo',2023,'087759078915',268,7,'','Jl. Sudirman No. 36','','2023MN4754@student.univ.ac.id','','L','','','','','',1,'Aktif','2005-08-11','Semarang'),
(256,'2020MN3131','Wawan Wijaya',2020,'081276304767',269,7,'','Jl. Gatot Subroto No. 69','','2020MN3131@student.univ.ac.id','','P','','','','','',1,'Aktif','2002-04-07','Yogyakarta'),
(257,'2022MN7494','Ika Lestari',2022,'083702720996',270,7,'','Jl. Diponegoro No. 6','','2022MN7494@student.univ.ac.id','','L','','','','','',1,'Cuti','2004-04-06','Yogyakarta'),
(258,'2020MN1827','Oscar Firmansyah',2020,'081707612339',271,7,'','Jl. Diponegoro No. 80','','2020MN1827@student.univ.ac.id','','P','','','','','',1,'Cuti','2002-05-02','Surabaya'),
(259,'2022MN3934','Galuh Lestari',2022,'086101420749',272,7,'','Jl. Gatot Subroto No. 17','','2022MN3934@student.univ.ac.id','','P','','','','','',1,'Aktif','2004-07-01','Yogyakarta'),
(260,'2022MN4352','Hadi Pratama',2022,'089534058707',273,7,'','Jl. Sudirman No. 47','','2022MN4352@student.univ.ac.id','','L','','','','','',1,'Aktif','2004-06-27','Bandung'),
(261,'2023MN2773','Wawan Santoso',2023,'083427013036',274,7,'','Jl. Sudirman No. 22','','2023MN2773@student.univ.ac.id','','P','','','','','',1,'Aktif','2005-03-04','Jakarta'),
(262,'2023MN4179','Yanti Nugroho',2023,'089873976956',275,7,'','Jl. Gatot Subroto No. 61','','2023MN4179@student.univ.ac.id','','L','','','','','',1,'Aktif','2005-07-19','Semarang'),
(263,'2020MN9464','Umi Gunawan',2020,'083788509919',276,7,'','Jl. Sudirman No. 37','','2020MN9464@student.univ.ac.id','','P','','','','','',1,'Aktif','2002-09-23','Bandung'),
(264,'2022MN6131','Galuh Hartono',2022,'088724697014',277,7,'','Jl. Diponegoro No. 24','','2022MN6131@student.univ.ac.id','','L','','','','','',1,'Aktif','2004-03-13','Bandung'),
(265,'2024MN5102','Dian Putra',2024,'081228643678',278,7,'','Jl. Sudirman No. 77','','2024MN5102@student.univ.ac.id','','P','','','','','',1,'Aktif','2006-04-18','Yogyakarta'),
(266,'2020AK3876','Oscar Putra',2020,'085642831579',279,8,'','Jl. Thamrin No. 72','','2020AK3876@student.univ.ac.id','','P','','','','','',1,'Aktif','2002-11-13','Yogyakarta'),
(267,'2022AK1064','Nina Prabowo',2022,'082415812066',280,8,'','Jl. Thamrin No. 23','','2022AK1064@student.univ.ac.id','','L','','','','','',1,'Aktif','2004-04-07','Bandung'),
(268,'2021AK4401','Oscar Hidayat',2021,'089971849430',281,8,'','Jl. Sudirman No. 99','','2021AK4401@student.univ.ac.id','','P','','','','','',1,'Aktif','2003-12-17','Bandung'),
(269,'2024AK8243','Dian Setiawan',2024,'089774505611',282,8,'','Jl. Sudirman No. 42','','2024AK8243@student.univ.ac.id','','P','','','','','',1,'Cuti','2006-04-04','Semarang'),
(270,'2020AK9410','Tina Subagyo',2020,'081007559477',283,8,'','Jl. Gatot Subroto No. 62','','2020AK9410@student.univ.ac.id','','L','','','','','',1,'Aktif','2002-05-27','Bandung'),
(271,'2024AK5066','Ika Santoso',2024,'089213080460',284,8,'','Jl. Thamrin No. 49','','2024AK5066@student.univ.ac.id','','P','','','','','',1,'Aktif','2006-06-15','Bandung'),
(272,'2020AK4594','Sari Hidayat',2020,'086752579897',285,8,'','Jl. Sudirman No. 95','','2020AK4594@student.univ.ac.id','','L','','','','','',1,'Aktif','2002-03-23','Semarang'),
(273,'2023AK2314','Putri Wibowo',2023,'083406427807',286,8,'','Jl. Diponegoro No. 25','','2023AK2314@student.univ.ac.id','','P','','','','','',1,'Aktif','2005-01-05','Yogyakarta'),
(274,'2021AK4202','Evi Lestari',2021,'084370196621',287,8,'','Jl. Sudirman No. 13','','2021AK4202@student.univ.ac.id','','L','','','','','',1,'Aktif','2003-11-27','Bandung'),
(275,'2022AK3976','Sari Wibowo',2022,'088813794275',288,8,'','Jl. Gatot Subroto No. 32','','2022AK3976@student.univ.ac.id','','L','','','','','',1,'Aktif','2004-02-02','Yogyakarta'),
(276,'2021AK2925','Lina Subagyo',2021,'082921495399',289,8,'','Jl. Gatot Subroto No. 28','','2021AK2925@student.univ.ac.id','','P','','','','','',1,'Aktif','2003-01-02','Surabaya'),
(277,'2021AK8221','Galuh Rahayu',2021,'088470967091',290,8,'','Jl. Sudirman No. 46','','2021AK8221@student.univ.ac.id','','L','','','','','',1,'Aktif','2003-06-09','Bandung'),
(278,'2021AK4994','Gita Rahayu',2021,'089112498209',291,8,'','Jl. Thamrin No. 81','','2021AK4994@student.univ.ac.id','','P','','','','','',1,'Cuti','2003-09-12','Bandung'),
(279,'2023AK5970','Wati Hartono',2023,'088043083916',292,8,'','Jl. Gatot Subroto No. 97','','2023AK5970@student.univ.ac.id','','L','','','','','',1,'Aktif','2005-08-03','Yogyakarta'),
(280,'2020AK3721','Budi Sari',2020,'085601742852',293,8,'','Jl. Sudirman No. 29','','2020AK3721@student.univ.ac.id','','P','','','','','',1,'Aktif','2002-06-24','Bandung'),
(281,'2021AK7821','Zaki Sari',2021,'082839746015',294,8,'','Jl. Sudirman No. 92','','2021AK7821@student.univ.ac.id','','L','','','','','',1,'Aktif','2003-09-03','Jakarta'),
(282,'2024AK3907','Ahmad Firmansyah',2024,'085032921811',295,8,'','Jl. Sudirman No. 95','','2024AK3907@student.univ.ac.id','','L','','','','','',1,'Aktif','2006-07-24','Semarang'),
(283,'2024AK4104','Pandu Rahayu',2024,'085564631261',296,8,'','Jl. Diponegoro No. 55','','2024AK4104@student.univ.ac.id','','L','','','','','',1,'Aktif','2006-01-21','Bandung'),
(284,'2024AK5965','Joko Santoso',2024,'085446918974',297,8,'','Jl. Thamrin No. 63','','2024AK5965@student.univ.ac.id','','L','','','','','',1,'Aktif','2006-08-03','Semarang'),
(285,'2023AK5662','Sari Sari',2023,'083226950183',298,8,'','Jl. Thamrin No. 46','','2023AK5662@student.univ.ac.id','','P','','','','','',1,'Cuti','2005-08-26','Surabaya'),
(286,'2023AK8020','Ratna Wibowo',2023,'084918860358',299,8,'','Jl. Sudirman No. 91','','2023AK8020@student.univ.ac.id','','L','','','','','',1,'Aktif','2005-11-16','Surabaya'),
(287,'2024AK2214','Yudi Rahayu',2024,'083331730894',300,8,'','Jl. Thamrin No. 59','','2024AK2214@student.univ.ac.id','','P','','','','','',1,'Aktif','2006-10-20','Surabaya'),
(288,'2021AK5019','Indah Rahayu',2021,'088299018664',301,8,'','Jl. Gatot Subroto No. 80','','2021AK5019@student.univ.ac.id','','P','','','','','',1,'Aktif','2003-08-26','Jakarta'),
(289,'2020AK6420','Wawan Saputra',2020,'082834656463',302,8,'','Jl. Gatot Subroto No. 53','','2020AK6420@student.univ.ac.id','','L','','','','','',1,'Aktif','2002-06-15','Surabaya'),
(290,'2022AK2900','Lisa Subagyo',2022,'089130876025',303,8,'','Jl. Gatot Subroto No. 51','','2022AK2900@student.univ.ac.id','','L','','','','','',1,'Aktif','2004-12-12','Jakarta'),
(291,'2022AK1083','Kartika Permana',2022,'088769181209',304,8,'','Jl. Thamrin No. 46','','2022AK1083@student.univ.ac.id','','L','','','','','',1,'Aktif','2004-05-16','Yogyakarta'),
(292,'2023AK1443','Zahra Setiawan',2023,'086867034158',305,8,'','Jl. Diponegoro No. 98','','2023AK1443@student.univ.ac.id','','L','','','','','',1,'Aktif','2005-11-19','Bandung'),
(293,'2023AK6233','Fajar Prabowo',2023,'081306367148',306,8,'','Jl. Thamrin No. 55','','2023AK6233@student.univ.ac.id','','L','','','','','',1,'Aktif','2005-06-20','Surabaya'),
(294,'2021AK7474','Candra Prabowo',2021,'085495181898',307,8,'','Jl. Diponegoro No. 30','','2021AK7474@student.univ.ac.id','','L','','','','','',1,'Aktif','2003-12-27','Bandung'),
(295,'2024AK7806','Made Permana',2024,'084011600151',308,8,'','Jl. Sudirman No. 9','','2024AK7806@student.univ.ac.id','','L','','','','','',1,'Cuti','2006-04-12','Semarang'),
(296,'2022AK4631','Putri Santoso',2022,'082644292488',309,8,'','Jl. Gatot Subroto No. 80','','2022AK4631@student.univ.ac.id','','L','','','','','',1,'Aktif','2004-07-22','Semarang'),
(297,'2020AK3990','Candra Santoso',2020,'082918178585',310,8,'','Jl. Gatot Subroto No. 12','','2020AK3990@student.univ.ac.id','','P','','','','','',1,'Aktif','2002-07-12','Surabaya'),
(298,'2023AK9734','Indah Hakim',2023,'085150622187',311,8,'','Jl. Diponegoro No. 47','','2023AK9734@student.univ.ac.id','','L','','','','','',1,'Aktif','2005-03-25','Jakarta'),
(299,'2024IK6390','Wawan Hakim',2024,'087535515204',312,9,'','Jl. Diponegoro No. 17','','2024IK6390@student.univ.ac.id','','L','','','','','',1,'Aktif','2006-07-12','Jakarta'),
(300,'2020IK5674','Budi Gunawan',2020,'088426328279',313,9,'','Jl. Gatot Subroto No. 26','','2020IK5674@student.univ.ac.id','','P','','','','','',1,'Aktif','2002-07-08','Jakarta'),
(301,'2022IK5489','Indah Gunawan',2022,'088355973151',314,9,'','Jl. Sudirman No. 83','','2022IK5489@student.univ.ac.id','','P','','','','','',1,'Aktif','2004-12-02','Surabaya'),
(302,'2021IK6555','Pandu Utomo',2021,'089630355568',315,9,'','Jl. Diponegoro No. 21','','2021IK6555@student.univ.ac.id','','L','','','','','',1,'Aktif','2003-09-09','Jakarta'),
(303,'2023IK7408','Bayu Hakim',2023,'081069605930',316,9,'','Jl. Gatot Subroto No. 62','','2023IK7408@student.univ.ac.id','','P','','','','','',1,'Aktif','2005-04-06','Jakarta'),
(304,'2024IK5091','Yanti Kusuma',2024,'089544166560',317,9,'','Jl. Gatot Subroto No. 87','','2024IK5091@student.univ.ac.id','','P','','','','','',1,'Aktif','2006-07-21','Jakarta'),
(305,'2021IK2741','Yanti Kusuma',2021,'081386576710',318,9,'','Jl. Gatot Subroto No. 92','','2021IK2741@student.univ.ac.id','','P','','','','','',1,'Aktif','2003-08-23','Semarang'),
(306,'2022IK7920','Dewi Sari',2022,'086583154350',319,9,'','Jl. Gatot Subroto No. 26','','2022IK7920@student.univ.ac.id','','P','','','','','',1,'Aktif','2004-12-19','Bandung'),
(307,'2021IK3611','Bayu Pratama',2021,'082522494967',320,9,'','Jl. Sudirman No. 88','','2021IK3611@student.univ.ac.id','','P','','','','','',1,'Aktif','2003-03-06','Surabaya'),
(308,'2020IK3709','Hendra Utomo',2020,'087062956479',321,9,'','Jl. Thamrin No. 49','','2020IK3709@student.univ.ac.id','','L','','','','','',1,'Aktif','2002-04-16','Yogyakarta'),
(309,'2021IK4709','Zahra Hartono',2021,'081602373290',322,9,'','Jl. Thamrin No. 39','','2021IK4709@student.univ.ac.id','','P','','','','','',1,'Aktif','2003-07-23','Yogyakarta'),
(310,'2021IK3406','Sari Prabowo',2021,'089788959556',323,9,'','Jl. Sudirman No. 66','','2021IK3406@student.univ.ac.id','','L','','','','','',1,'Cuti','2003-08-03','Surabaya'),
(311,'2024IK3471','Vina Prabowo',2024,'086483332497',324,9,'','Jl. Thamrin No. 53','','2024IK3471@student.univ.ac.id','','L','','','','','',1,'Aktif','2006-04-24','Bandung'),
(312,'2023IK1570','Kiki Hartono',2023,'082204192551',325,9,'','Jl. Thamrin No. 67','','2023IK1570@student.univ.ac.id','','P','','','','','',1,'Aktif','2005-07-07','Jakarta'),
(313,'2024IK9286','Oscar Sari',2024,'081250332630',326,9,'','Jl. Diponegoro No. 31','','2024IK9286@student.univ.ac.id','','P','','','','','',1,'Aktif','2006-03-11','Yogyakarta'),
(314,'2020IK2577','Agus Lestari',2020,'084898159658',327,9,'','Jl. Diponegoro No. 20','','2020IK2577@student.univ.ac.id','','L','','','','','',1,'Cuti','2002-11-12','Bandung'),
(315,'2021IK2073','Yanti Santoso',2021,'086093746646',328,9,'','Jl. Diponegoro No. 15','','2021IK2073@student.univ.ac.id','','P','','','','','',1,'Aktif','2003-03-23','Surabaya'),
(316,'2023PS1914','Wati Wibowo',2023,'083981926248',329,10,'','Jl. Gatot Subroto No. 92','','2023PS1914@student.univ.ac.id','','L','','','','','',1,'Aktif','2005-02-05','Bandung'),
(317,'2023PS5423','Ika Saputra',2023,'084992572692',330,10,'','Jl. Diponegoro No. 64','','2023PS5423@student.univ.ac.id','','P','','','','','',1,'Aktif','2005-08-22','Semarang'),
(318,'2024PS1645','Ahmad Nugroho',2024,'087859181275',331,10,'','Jl. Diponegoro No. 15','','2024PS1645@student.univ.ac.id','','L','','','','','',1,'Aktif','2006-02-16','Jakarta'),
(319,'2023PS6629','Vita Santoso',2023,'084007722047',332,10,'','Jl. Thamrin No. 78','','2023PS6629@student.univ.ac.id','','L','','','','','',1,'Cuti','2005-11-19','Jakarta'),
(320,'2022PS2816','Tina Nugroho',2022,'082415560013',333,10,'','Jl. Sudirman No. 62','','2022PS2816@student.univ.ac.id','','P','','','','','',1,'Cuti','2004-01-23','Jakarta'),
(321,'2022PS1754','Tina Subagyo',2022,'083973817896',334,10,'','Jl. Gatot Subroto No. 81','','2022PS1754@student.univ.ac.id','','P','','','','','',1,'Aktif','2004-03-14','Semarang'),
(322,'2023PS1651','Fitri Rahayu',2023,'081333547061',335,10,'','Jl. Thamrin No. 18','','2023PS1651@student.univ.ac.id','','P','','','','','',1,'Aktif','2005-06-16','Surabaya'),
(323,'2024PS8123','Yanti Kusuma',2024,'081782473109',336,10,'','Jl. Gatot Subroto No. 99','','2024PS8123@student.univ.ac.id','','L','','','','','',1,'Aktif','2006-08-02','Bandung'),
(324,'2021PS8443','Wawan Sari',2021,'082619468446',337,10,'','Jl. Gatot Subroto No. 40','','2021PS8443@student.univ.ac.id','','P','','','','','',1,'Aktif','2003-03-01','Surabaya'),
(325,'2023PS5728','Zahra Firmansyah',2023,'082764417902',338,10,'','Jl. Diponegoro No. 20','','2023PS5728@student.univ.ac.id','','L','','','','','',1,'Aktif','2005-11-20','Yogyakarta'),
(326,'2020PS2016','Lina Susanto',2020,'088460060551',339,10,'','Jl. Sudirman No. 77','','2020PS2016@student.univ.ac.id','','L','','','','','',1,'Aktif','2002-05-03','Semarang'),
(327,'2021PS8002','Citra Santoso',2021,'086957844519',340,10,'','Jl. Sudirman No. 60','','2021PS8002@student.univ.ac.id','','L','','','','','',1,'Aktif','2003-12-10','Surabaya'),
(328,'2021PS6388','Wawan Firmansyah',2021,'089287680407',341,10,'','Jl. Gatot Subroto No. 45','','2021PS6388@student.univ.ac.id','','L','','','','','',1,'Cuti','2003-04-02','Yogyakarta'),
(329,'2024PS4648','Qori Kusuma',2024,'086372194853',342,10,'','Jl. Sudirman No. 29','','2024PS4648@student.univ.ac.id','','L','','','','','',1,'Aktif','2006-12-22','Semarang'),
(330,'2021PS4030','Zahra Hidayat',2021,'084730978077',343,10,'','Jl. Diponegoro No. 88','','2021PS4030@student.univ.ac.id','','P','','','','','',1,'Aktif','2003-06-28','Yogyakarta'),
(331,'2022PS4757','Vita Kusuma',2022,'084558242258',344,10,'','Jl. Sudirman No. 5','','2022PS4757@student.univ.ac.id','','P','','','','','',1,'Aktif','2004-11-20','Yogyakarta'),
(332,'20220026740','Pandu Maharani',2022,'084018703657',345,11,'','Jl. Thamrin No. 14','','20220026740@student.univ.ac.id','','L','','','','','',1,'Aktif','2004-02-04','Jakarta'),
(333,'20230028145','Ratna Hakim',2023,'082297287240',346,11,'','Jl. Sudirman No. 92','','20230028145@student.univ.ac.id','','L','','','','','',1,'Aktif','2005-09-17','Semarang'),
(334,'20240026884','Qori Putra',2024,'085083898262',347,11,'','Jl. Gatot Subroto No. 99','','20240026884@student.univ.ac.id','','P','','','','','',1,'Aktif','2006-06-02','Surabaya'),
(335,'20230022811','Hadi Firmansyah',2023,'088073686938',348,11,'','Jl. Sudirman No. 71','','20230022811@student.univ.ac.id','','P','','','','','',1,'Aktif','2005-08-15','Jakarta'),
(336,'20210026773','Joko Putra',2021,'087965755020',349,11,'','Jl. Thamrin No. 20','','20210026773@student.univ.ac.id','','P','','','','','',1,'Aktif','2003-06-21','Surabaya'),
(337,'20210027353','Citra Wijaya',2021,'083157603383',350,11,'','Jl. Gatot Subroto No. 12','','20210027353@student.univ.ac.id','','L','','','','','',1,'Cuti','2003-12-17','Surabaya'),
(338,'20220022550','Maya Permana',2022,'083508558447',351,11,'','Jl. Sudirman No. 71','','20220022550@student.univ.ac.id','','L','','','','','',1,'Aktif','2004-11-07','Bandung'),
(339,'20200024080','Galuh Hidayat',2020,'083126993473',352,11,'','Jl. Sudirman No. 21','','20200024080@student.univ.ac.id','','L','','','','','',1,'Aktif','2002-11-05','Jakarta'),
(340,'20210021412','Vita Kurniawan',2021,'087952463892',353,11,'','Jl. Thamrin No. 68','','20210021412@student.univ.ac.id','','P','','','','','',1,'Aktif','2003-01-24','Yogyakarta'),
(341,'20210029236','Zaki Putra',2021,'089898338211',354,11,'','Jl. Gatot Subroto No. 37','','20210029236@student.univ.ac.id','','L','','','','','',1,'Cuti','2003-04-22','Jakarta'),
(342,'20200022868','Vina Utomo',2020,'082215698354',355,11,'','Jl. Diponegoro No. 95','','20200022868@student.univ.ac.id','','P','','','','','',1,'Aktif','2002-10-27','Bandung'),
(343,'20200028633','Hendra Lestari',2020,'084433367275',356,11,'','Jl. Diponegoro No. 2','','20200028633@student.univ.ac.id','','L','','','','','',1,'Aktif','2002-07-14','Jakarta'),
(344,'20220028927','Agus Hakim',2022,'082265634664',357,11,'','Jl. Gatot Subroto No. 15','','20220028927@student.univ.ac.id','','L','','','','','',1,'Aktif','2004-01-21','Yogyakarta'),
(345,'20200021903','Evi Lestari',2020,'087930355315',358,11,'','Jl. Thamrin No. 21','','20200021903@student.univ.ac.id','','P','','','','','',1,'Cuti','2002-03-22','Jakarta'),
(346,'20200023628','Candra Hakim',2020,'088033013978',359,11,'','Jl. Sudirman No. 80','','20200023628@student.univ.ac.id','','L','','','','','',1,'Cuti','2002-08-15','Surabaya'),
(347,'20200029135','Fajar Firmansyah',2020,'085703945371',360,11,'','Jl. Thamrin No. 65','','20200029135@student.univ.ac.id','','P','','','','','',1,'Aktif','2002-05-13','Bandung'),
(348,'20210021109','Kiki Subagyo',2021,'089611518727',361,11,'','Jl. Diponegoro No. 4','','20210021109@student.univ.ac.id','','L','','','','','',1,'Aktif','2003-02-25','Jakarta'),
(349,'20200023877','Nani Setiawan',2020,'089034923780',362,11,'','Jl. Diponegoro No. 35','','20200023877@student.univ.ac.id','','L','','','','','',1,'Aktif','2002-03-20','Surabaya'),
(350,'20220021340','Wati Saputra',2022,'089589702279',363,11,'','Jl. Sudirman No. 96','','20220021340@student.univ.ac.id','','P','','','','','',1,'Aktif','2004-06-22','Yogyakarta'),
(351,'20220029354','Zahra Nugroho',2022,'085221150480',364,11,'','Jl. Sudirman No. 40','','20220029354@student.univ.ac.id','','L','','','','','',1,'Aktif','2004-04-01','Semarang'),
(352,'20200026384','Gita Susanto',2020,'083493284578',365,11,'','Jl. Thamrin No. 28','','20200026384@student.univ.ac.id','','P','','','','','',1,'Aktif','2002-10-13','Jakarta'),
(353,'20210027338','Agus Rahayu',2021,'088525568358',366,11,'','Jl. Sudirman No. 7','','20210027338@student.univ.ac.id','','P','','','','','',1,'Aktif','2003-06-05','Semarang'),
(354,'20210026792','Oscar Gunawan',2021,'085826000539',367,11,'','Jl. Thamrin No. 50','','20210026792@student.univ.ac.id','','L','','','','','',1,'Aktif','2003-06-17','Bandung');
/*!40000 ALTER TABLE `academic_mahasiswa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `academic_matakuliah`
--

DROP TABLE IF EXISTS `academic_matakuliah`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `academic_matakuliah` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `kode_mk` varchar(10) NOT NULL,
  `nama_mk` varchar(100) NOT NULL,
  `sks` int(11) NOT NULL,
  `semester` int(11) NOT NULL,
  `deskripsi` longtext NOT NULL,
  `program_studi_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `kode_mk` (`kode_mk`),
  KEY `academic_matakuliah_program_studi_id_4a58b85b_fk_academic_` (`program_studi_id`),
  CONSTRAINT `academic_matakuliah_program_studi_id_4a58b85b_fk_academic_` FOREIGN KEY (`program_studi_id`) REFERENCES `academic_programstudi` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academic_matakuliah`
--

LOCK TABLES `academic_matakuliah` WRITE;
/*!40000 ALTER TABLE `academic_matakuliah` DISABLE KEYS */;
INSERT INTO `academic_matakuliah` VALUES
(1,'TIF101','Algoritma dan Pemrograman',4,1,'',1),
(2,'TIF201','Basis Data',3,2,'',1),
(3,'TIF202','Pemrograman Web',3,2,'',1),
(4,'TIF301','Jaringan Komputer',3,3,'',1),
(5,'TIF302','Sistem Operasi',3,3,'',1),
(6,'TIF401','Kecerdasan Buatan',3,4,'',1),
(7,'TIF402','Data Mining',3,4,'',1),
(8,'TIF403','Keamanan Informasi',2,4,'',1),
(9,'TIF501','Cloud Computing',3,5,'',1),
(10,'TIF502','Mobile Programming',3,5,'',1);
/*!40000 ALTER TABLE `academic_matakuliah` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `academic_nilai`
--

DROP TABLE IF EXISTS `academic_nilai`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `academic_nilai` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nilai_huruf` varchar(2) DEFAULT NULL,
  `nilai_angka` double DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `krs_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `krs_id` (`krs_id`),
  CONSTRAINT `academic_nilai_krs_id_a5eff337_fk_academic_krs_id` FOREIGN KEY (`krs_id`) REFERENCES `academic_krs` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academic_nilai`
--

LOCK TABLES `academic_nilai` WRITE;
/*!40000 ALTER TABLE `academic_nilai` DISABLE KEYS */;
INSERT INTO `academic_nilai` VALUES
(1,'B',78,'2025-10-18 05:59:48.488212','2025-10-18 05:59:48.488258',1),
(2,'B-',73,'2025-10-18 05:59:48.492098','2025-10-18 05:59:48.492150',2),
(3,'B+',83,'2025-10-18 05:59:48.495254','2025-10-18 05:59:48.495278',3),
(4,'A',95,'2025-10-18 05:59:48.498131','2025-10-18 05:59:48.498153',4),
(5,'B-',73,'2025-10-18 05:59:48.500735','2025-10-18 05:59:48.500756',5),
(6,'B',78,'2025-10-18 05:59:48.503478','2025-10-18 05:59:48.503499',6),
(7,'A',95,'2025-10-18 05:59:48.506187','2025-10-18 05:59:48.506209',7),
(8,'A-',88,'2025-10-18 05:59:48.508884','2025-10-18 05:59:48.508905',8),
(9,'C',63,'2025-10-18 05:59:48.511551','2025-10-18 05:59:48.511581',9),
(10,'A',99,'2025-10-18 05:59:48.514260','2025-10-22 02:12:07.806317',10),
(11,'B+',78,'2025-10-18 10:38:35.015088','2025-10-22 02:12:07.823364',16);
/*!40000 ALTER TABLE `academic_nilai` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `academic_notification`
--

DROP TABLE IF EXISTS `academic_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `academic_notification` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `message` longtext NOT NULL,
  `notification_type` varchar(20) NOT NULL,
  `is_read` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `krs_id` bigint(20) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `academic_notification_krs_id_d78ad7ab_fk_academic_krs_id` (`krs_id`),
  KEY `academic_notification_user_id_50863454_fk_auth_user_id` (`user_id`),
  CONSTRAINT `academic_notification_krs_id_d78ad7ab_fk_academic_krs_id` FOREIGN KEY (`krs_id`) REFERENCES `academic_krs` (`id`),
  CONSTRAINT `academic_notification_user_id_50863454_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academic_notification`
--

LOCK TABLES `academic_notification` WRITE;
/*!40000 ALTER TABLE `academic_notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `academic_notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `academic_presensi`
--

DROP TABLE IF EXISTS `academic_presensi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `academic_presensi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tanggal` date NOT NULL,
  `pertemuan_ke` int(11) NOT NULL,
  `status` varchar(10) NOT NULL,
  `keterangan` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `krs_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `academic_presensi_krs_id_pertemuan_ke_7c44d824_uniq` (`krs_id`,`pertemuan_ke`),
  CONSTRAINT `academic_presensi_krs_id_367c72cb_fk_academic_krs_id` FOREIGN KEY (`krs_id`) REFERENCES `academic_krs` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=683 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academic_presensi`
--

LOCK TABLES `academic_presensi` WRITE;
/*!40000 ALTER TABLE `academic_presensi` DISABLE KEYS */;
INSERT INTO `academic_presensi` VALUES
(1,'2025-10-11',1,'alpha','','2025-10-18 05:59:48.388187',1),
(2,'2025-10-18',2,'hadir','','2025-10-18 05:59:48.397137',1),
(3,'2025-10-11',1,'sakit','','2025-10-18 05:59:48.400221',2),
(4,'2025-10-18',2,'hadir','','2025-10-18 05:59:48.403106',2),
(5,'2025-10-11',1,'hadir','','2025-10-18 05:59:48.405764',3),
(6,'2025-10-18',2,'sakit','','2025-10-18 05:59:48.408510',3),
(7,'2025-10-11',1,'hadir','','2025-10-18 05:59:48.411200',4),
(8,'2025-10-18',2,'alpha','','2025-10-18 05:59:48.414992',4),
(9,'2025-10-11',1,'sakit','','2025-10-18 05:59:48.418842',5),
(10,'2025-10-18',2,'izin','','2025-10-18 05:59:48.422825',5),
(11,'2025-10-11',1,'sakit','','2025-10-18 05:59:48.426775',6),
(12,'2025-10-18',2,'alpha','','2025-10-18 05:59:48.430826',6),
(13,'2025-10-11',1,'hadir','','2025-10-18 05:59:48.434976',7),
(14,'2025-10-18',2,'izin','','2025-10-18 05:59:48.445211',7),
(15,'2025-10-11',1,'hadir','','2025-10-18 05:59:48.449077',8),
(16,'2025-10-18',2,'sakit','','2025-10-18 05:59:48.457954',8),
(17,'2025-10-11',1,'hadir','','2025-10-18 05:59:48.461209',9),
(18,'2025-10-18',2,'alpha','','2025-10-18 05:59:48.475889',9),
(19,'2025-10-11',1,'sakit','','2025-10-18 05:59:48.479995',10),
(20,'2025-10-18',2,'hadir','','2025-10-18 05:59:48.484095',10),
(21,'2025-10-18',2,'hadir','','2025-10-18 17:19:58.063335',16),
(22,'2025-08-26',1,'Hadir','','2025-10-22 19:52:34.498380',17),
(23,'2025-10-17',2,'Hadir','','2025-10-22 19:52:34.523045',17),
(24,'2025-10-20',3,'Alpa','Presensi pertemuan ke-3','2025-10-22 19:52:34.524166',17),
(25,'2025-10-02',4,'Hadir','','2025-10-22 19:52:34.525653',17),
(26,'2025-08-26',5,'Hadir','','2025-10-22 19:52:34.526698',17),
(27,'2025-09-05',1,'Hadir','','2025-10-22 19:52:34.527754',18),
(28,'2025-08-28',2,'Hadir','','2025-10-22 19:52:34.528785',18),
(29,'2025-10-02',3,'Hadir','','2025-10-22 19:52:34.530052',18),
(30,'2025-08-25',4,'Hadir','','2025-10-22 19:52:34.530992',18),
(31,'2025-08-28',1,'Sakit','Presensi pertemuan ke-1','2025-10-22 19:52:34.531798',19),
(32,'2025-10-16',2,'Hadir','','2025-10-22 19:52:34.532628',19),
(33,'2025-09-04',3,'Sakit','Presensi pertemuan ke-3','2025-10-22 19:52:34.533646',19),
(34,'2025-10-16',4,'Hadir','','2025-10-22 19:52:34.534660',19),
(35,'2025-09-22',5,'Hadir','','2025-10-22 19:52:34.535671',19),
(36,'2025-08-27',6,'Hadir','','2025-10-22 19:52:34.536756',19),
(37,'2025-09-16',1,'Hadir','','2025-10-22 19:52:34.537788',20),
(38,'2025-09-30',2,'Hadir','','2025-10-22 19:52:34.538815',20),
(39,'2025-09-24',3,'Hadir','','2025-10-22 19:52:34.539842',20),
(40,'2025-09-15',4,'Alpa','Presensi pertemuan ke-4','2025-10-22 19:52:34.540786',20),
(41,'2025-09-11',5,'Hadir','','2025-10-22 19:52:34.541606',20),
(42,'2025-09-03',6,'Hadir','','2025-10-22 19:52:34.542102',20),
(43,'2025-10-09',7,'Hadir','','2025-10-22 19:52:34.542562',20),
(44,'2025-09-12',8,'Sakit','Presensi pertemuan ke-8','2025-10-22 19:52:34.543035',20),
(45,'2025-09-23',3,'Hadir','','2025-10-22 19:52:34.543529',21),
(46,'2025-10-08',4,'Hadir','','2025-10-22 19:52:34.544017',21),
(47,'2025-10-15',5,'Sakit','Presensi pertemuan ke-5','2025-10-22 19:52:34.544474',21),
(48,'2025-10-10',6,'Alpa','Presensi pertemuan ke-6','2025-10-22 19:52:34.544951',21),
(49,'2025-09-04',1,'Hadir','','2025-10-22 19:52:34.545438',22),
(50,'2025-10-21',2,'Hadir','','2025-10-22 19:52:34.545920',22),
(51,'2025-10-21',3,'Hadir','','2025-10-22 19:52:34.546389',22),
(52,'2025-10-14',4,'Hadir','','2025-10-22 19:52:34.546885',22),
(53,'2025-09-05',5,'Hadir','','2025-10-22 19:52:34.547361',22),
(54,'2025-08-28',6,'Alpa','Presensi pertemuan ke-6','2025-10-22 19:52:34.547841',22),
(55,'2025-10-13',7,'Hadir','','2025-10-22 19:52:34.548311',22),
(56,'2025-09-29',2,'Hadir','','2025-10-22 19:52:34.548843',23),
(57,'2025-10-06',3,'Hadir','','2025-10-22 19:52:34.549363',23),
(58,'2025-08-26',4,'Hadir','','2025-10-22 19:52:34.550069',23),
(59,'2025-10-20',1,'Hadir','','2025-10-22 19:52:34.551185',24),
(60,'2025-09-24',3,'Hadir','','2025-10-22 19:52:34.552247',24),
(61,'2025-10-02',4,'Hadir','','2025-10-22 19:52:34.553275',24),
(62,'2025-09-23',5,'Hadir','','2025-10-22 19:52:34.554275',24),
(63,'2025-09-02',6,'Hadir','','2025-10-22 19:52:34.555302',24),
(64,'2025-09-16',7,'Hadir','','2025-10-22 19:52:34.556307',24),
(65,'2025-08-29',8,'Hadir','','2025-10-22 19:52:34.557356',24),
(66,'2025-09-10',2,'Sakit','Presensi pertemuan ke-2','2025-10-22 19:52:34.558384',25),
(67,'2025-09-08',5,'Hadir','','2025-10-22 19:52:34.559415',25),
(68,'2025-10-14',6,'Hadir','','2025-10-22 19:52:34.560420',25),
(69,'2025-09-04',7,'Hadir','','2025-10-22 19:52:34.561856',25),
(70,'2025-09-26',2,'Hadir','','2025-10-22 19:52:34.562923',26),
(71,'2025-10-10',4,'Hadir','','2025-10-22 19:52:34.564014',26),
(72,'2025-09-25',5,'Hadir','','2025-10-22 19:52:34.565048',26),
(73,'2025-09-29',6,'Hadir','','2025-10-22 19:52:34.566061',26),
(74,'2025-10-16',7,'Hadir','','2025-10-22 19:52:34.567102',26),
(75,'2025-08-25',8,'Hadir','','2025-10-22 19:52:34.576964',26),
(76,'2025-09-04',1,'Hadir','','2025-10-22 19:52:34.580074',27),
(77,'2025-10-10',2,'Hadir','','2025-10-22 19:52:34.581608',27),
(78,'2025-09-03',3,'Hadir','','2025-10-22 19:52:34.584824',27),
(79,'2025-10-06',4,'Hadir','','2025-10-22 19:52:34.586609',27),
(80,'2025-09-03',5,'Hadir','','2025-10-22 19:52:34.601211',27),
(81,'2025-09-02',6,'Alpa','Presensi pertemuan ke-6','2025-10-22 19:52:34.607882',27),
(82,'2025-10-06',1,'Sakit','Presensi pertemuan ke-1','2025-10-22 19:52:34.615846',28),
(83,'2025-09-04',2,'Sakit','Presensi pertemuan ke-2','2025-10-22 19:52:34.618271',28),
(84,'2025-09-17',3,'Hadir','','2025-10-22 19:52:34.619916',28),
(85,'2025-09-19',4,'Hadir','','2025-10-22 19:52:34.623263',28),
(86,'2025-10-16',7,'Alpa','Presensi pertemuan ke-7','2025-10-22 19:52:34.629863',28),
(87,'2025-10-10',2,'Hadir','','2025-10-22 19:52:34.631999',29),
(88,'2025-08-26',3,'Hadir','','2025-10-22 19:52:34.634012',29),
(89,'2025-10-06',4,'Hadir','','2025-10-22 19:52:34.645271',29),
(90,'2025-10-09',5,'Hadir','','2025-10-22 19:52:34.646890',29),
(91,'2025-08-27',2,'Hadir','','2025-10-22 19:52:34.648610',30),
(92,'2025-09-23',4,'Hadir','','2025-10-22 19:52:34.652674',30),
(93,'2025-09-03',5,'Izin','Presensi pertemuan ke-5','2025-10-22 19:52:34.654116',30),
(94,'2025-09-18',1,'Izin','Presensi pertemuan ke-1','2025-10-22 19:52:34.658529',31),
(95,'2025-09-05',2,'Alpa','Presensi pertemuan ke-2','2025-10-22 19:52:34.660104',31),
(96,'2025-09-05',4,'Alpa','Presensi pertemuan ke-4','2025-10-22 19:52:34.662044',31),
(97,'2025-09-15',7,'Sakit','Presensi pertemuan ke-7','2025-10-22 19:52:34.662886',31),
(98,'2025-10-20',1,'Hadir','','2025-10-22 19:52:34.663909',32),
(99,'2025-10-15',2,'Izin','Presensi pertemuan ke-2','2025-10-22 19:52:34.670203',32),
(100,'2025-10-10',3,'Sakit','Presensi pertemuan ke-3','2025-10-22 19:52:34.678616',32),
(101,'2025-09-19',5,'Hadir','','2025-10-22 19:52:34.680331',32),
(102,'2025-09-01',2,'Hadir','','2025-10-22 19:52:34.681414',33),
(103,'2025-10-16',3,'Hadir','','2025-10-22 19:52:34.682910',33),
(104,'2025-10-13',4,'Hadir','','2025-10-22 19:52:34.692216',33),
(105,'2025-09-01',1,'Hadir','','2025-10-22 19:52:34.701623',34),
(106,'2025-10-09',2,'Hadir','','2025-10-22 19:52:34.703723',34),
(107,'2025-10-01',3,'Sakit','Presensi pertemuan ke-3','2025-10-22 19:52:34.704599',34),
(108,'2025-10-03',4,'Hadir','','2025-10-22 19:52:34.706397',34),
(109,'2025-10-09',5,'Izin','Presensi pertemuan ke-5','2025-10-22 19:52:34.707268',34),
(110,'2025-08-25',2,'Hadir','','2025-10-22 19:52:34.708666',35),
(111,'2025-09-18',3,'Izin','Presensi pertemuan ke-3','2025-10-22 19:52:34.713626',35),
(112,'2025-09-03',4,'Sakit','Presensi pertemuan ke-4','2025-10-22 19:52:34.716694',35),
(113,'2025-10-20',2,'Hadir','','2025-10-22 19:52:34.721030',36),
(114,'2025-08-27',4,'Sakit','Presensi pertemuan ke-4','2025-10-22 19:52:34.724545',36),
(115,'2025-09-17',6,'Hadir','','2025-10-22 19:52:34.732704',36),
(116,'2025-10-02',3,'Hadir','','2025-10-22 19:52:34.734461',37),
(117,'2025-10-08',1,'Hadir','','2025-10-22 19:52:34.736073',38),
(118,'2025-09-08',4,'Hadir','','2025-10-22 19:52:34.737133',38),
(119,'2025-09-11',5,'Hadir','','2025-10-22 19:52:34.738785',38),
(120,'2025-10-02',1,'Hadir','','2025-10-22 19:52:34.747021',39),
(121,'2025-09-04',2,'Hadir','','2025-10-22 19:52:34.748764',39),
(122,'2025-09-09',3,'Hadir','','2025-10-22 19:52:34.750604',39),
(123,'2025-09-10',4,'Hadir','','2025-10-22 19:52:34.762840',39),
(124,'2025-10-14',5,'Alpa','Presensi pertemuan ke-5','2025-10-22 19:52:34.764832',39),
(125,'2025-09-26',6,'Hadir','','2025-10-22 19:52:34.766663',39),
(126,'2025-09-19',7,'Hadir','','2025-10-22 19:52:34.768433',39),
(127,'2025-09-17',1,'Hadir','','2025-10-22 19:52:34.770056',40),
(128,'2025-10-10',2,'Hadir','','2025-10-22 19:52:34.771629',40),
(129,'2025-09-03',4,'Hadir','','2025-10-22 19:52:34.773150',41),
(130,'2025-10-08',1,'Hadir','','2025-10-22 19:52:34.774619',42),
(131,'2025-09-03',3,'Hadir','','2025-10-22 19:52:34.776140',42),
(132,'2025-08-29',4,'Hadir','','2025-10-22 19:52:34.777204',42),
(133,'2025-10-07',5,'Hadir','','2025-10-22 19:52:34.778817',42),
(134,'2025-09-26',7,'Hadir','','2025-10-22 19:52:34.779916',42),
(135,'2025-10-06',1,'Hadir','','2025-10-22 19:52:34.781720',43),
(136,'2025-10-16',2,'Hadir','','2025-10-22 19:52:34.782785',43),
(137,'2025-09-16',3,'Hadir','','2025-10-22 19:52:34.783823',43),
(138,'2025-09-22',4,'Hadir','','2025-10-22 19:52:34.784862',43),
(139,'2025-10-01',5,'Hadir','','2025-10-22 19:52:34.785898',43),
(140,'2025-10-10',7,'Hadir','','2025-10-22 19:52:34.786944',43),
(141,'2025-09-10',8,'Hadir','','2025-10-22 19:52:34.788057',43),
(142,'2025-09-03',1,'Hadir','','2025-10-22 19:52:34.789550',44),
(143,'2025-10-14',2,'Hadir','','2025-10-22 19:52:34.790943',44),
(144,'2025-10-10',3,'Hadir','','2025-10-22 19:52:34.792130',44),
(145,'2025-09-01',4,'Sakit','Presensi pertemuan ke-4','2025-10-22 19:52:34.793126',44),
(146,'2025-09-24',5,'Hadir','','2025-10-22 19:52:34.794137',44),
(147,'2025-09-03',6,'Hadir','','2025-10-22 19:52:34.795124',44),
(148,'2025-09-15',4,'Sakit','Presensi pertemuan ke-4','2025-10-22 19:52:34.796174',45),
(149,'2025-09-10',5,'Hadir','','2025-10-22 19:52:34.797160',45),
(150,'2025-09-08',1,'Hadir','','2025-10-22 19:52:34.798169',46),
(151,'2025-09-25',2,'Hadir','','2025-10-22 19:52:34.799174',46),
(152,'2025-10-21',3,'Hadir','','2025-10-22 19:52:34.800227',46),
(153,'2025-09-12',4,'Hadir','','2025-10-22 19:52:34.801218',46),
(154,'2025-10-21',4,'Alpa','Presensi pertemuan ke-4','2025-10-22 19:52:34.802241',47),
(155,'2025-08-26',2,'Hadir','','2025-10-22 19:52:34.803241',48),
(156,'2025-08-29',4,'Hadir','','2025-10-22 19:52:34.804273',48),
(157,'2025-10-01',5,'Hadir','','2025-10-22 19:52:34.805333',48),
(158,'2025-09-18',6,'Hadir','','2025-10-22 19:52:34.806320',48),
(159,'2025-09-15',7,'Hadir','','2025-10-22 19:52:34.807306',48),
(160,'2025-10-14',8,'Hadir','','2025-10-22 19:52:34.808303',48),
(161,'2025-09-04',1,'Hadir','','2025-10-22 19:52:34.809601',49),
(162,'2025-09-26',2,'Hadir','','2025-10-22 19:52:34.810600',49),
(163,'2025-09-05',3,'Hadir','','2025-10-22 19:52:34.811610',49),
(164,'2025-10-10',4,'Hadir','','2025-10-22 19:52:34.812611',49),
(165,'2025-09-09',5,'Hadir','','2025-10-22 19:52:34.813623',49),
(166,'2025-09-11',1,'Hadir','','2025-10-22 19:52:34.814615',50),
(167,'2025-10-06',2,'Hadir','','2025-10-22 19:52:34.815636',50),
(168,'2025-09-03',3,'Hadir','','2025-10-22 19:52:34.816624',50),
(169,'2025-10-15',4,'Hadir','','2025-10-22 19:52:34.817654',50),
(170,'2025-09-08',5,'Hadir','','2025-10-22 19:52:34.818645',50),
(171,'2025-10-17',6,'Hadir','','2025-10-22 19:52:34.819630',50),
(172,'2025-10-21',7,'Alpa','Presensi pertemuan ke-7','2025-10-22 19:52:34.820617',50),
(173,'2025-09-03',1,'Hadir','','2025-10-22 19:52:34.821656',51),
(174,'2025-10-02',3,'Hadir','','2025-10-22 19:52:34.822710',51),
(175,'2025-09-24',1,'Hadir','','2025-10-22 19:52:34.823768',52),
(176,'2025-09-25',2,'Izin','Presensi pertemuan ke-2','2025-10-22 19:52:34.824767',52),
(177,'2025-10-03',2,'Sakit','Presensi pertemuan ke-2','2025-10-22 19:52:34.825816',53),
(178,'2025-09-05',2,'Hadir','','2025-10-22 19:52:34.826840',54),
(179,'2025-10-21',4,'Sakit','Presensi pertemuan ke-4','2025-10-22 19:52:34.827864',54),
(180,'2025-09-15',5,'Hadir','','2025-10-22 19:52:34.828698',54),
(181,'2025-10-02',7,'Hadir','','2025-10-22 19:52:34.829564',54),
(182,'2025-10-21',2,'Hadir','','2025-10-22 19:52:34.830358',55),
(183,'2025-09-09',4,'Sakit','Presensi pertemuan ke-4','2025-10-22 19:52:34.831113',55),
(184,'2025-09-12',5,'Hadir','','2025-10-22 19:52:34.831888',55),
(185,'2025-09-19',2,'Izin','Presensi pertemuan ke-2','2025-10-22 19:52:34.832658',56),
(186,'2025-10-15',1,'Hadir','','2025-10-22 19:52:34.833371',57),
(187,'2025-09-11',3,'Hadir','','2025-10-22 19:52:34.834063',57),
(188,'2025-10-10',4,'Hadir','','2025-10-22 19:52:34.834808',57),
(189,'2025-09-30',5,'Hadir','','2025-10-22 19:52:34.835596',57),
(190,'2025-09-03',7,'Hadir','','2025-10-22 19:52:34.836391',57),
(191,'2025-09-09',2,'Alpa','Presensi pertemuan ke-2','2025-10-22 19:52:34.837181',58),
(192,'2025-09-08',1,'Hadir','','2025-10-22 19:52:34.838005',59),
(193,'2025-09-22',2,'Sakit','Presensi pertemuan ke-2','2025-10-22 19:52:34.838802',59),
(194,'2025-08-25',2,'Hadir','','2025-10-22 19:52:34.839594',60),
(195,'2025-09-19',3,'Hadir','','2025-10-22 19:52:34.840325',60),
(196,'2025-10-07',4,'Alpa','Presensi pertemuan ke-4','2025-10-22 19:52:34.841073',60),
(197,'2025-10-21',5,'Hadir','','2025-10-22 19:52:34.841878',60),
(198,'2025-09-08',6,'Hadir','','2025-10-22 19:52:34.842640',60),
(199,'2025-10-20',7,'Hadir','','2025-10-22 19:52:34.843417',60),
(200,'2025-10-10',1,'Hadir','','2025-10-22 19:52:34.844211',61),
(201,'2025-09-23',3,'Hadir','','2025-10-22 19:52:34.845054',61),
(202,'2025-10-08',4,'Alpa','Presensi pertemuan ke-4','2025-10-22 19:52:34.845856',61),
(203,'2025-09-16',5,'Hadir','','2025-10-22 19:52:34.846616',61),
(204,'2025-10-01',6,'Hadir','','2025-10-22 19:52:34.847375',61),
(205,'2025-09-01',7,'Hadir','','2025-10-22 19:52:34.848067',61),
(206,'2025-10-15',2,'Hadir','','2025-10-22 19:52:34.848768',62),
(207,'2025-10-16',3,'Hadir','','2025-10-22 19:52:34.849457',62),
(208,'2025-09-15',7,'Izin','Presensi pertemuan ke-7','2025-10-22 19:52:34.850179',62),
(209,'2025-10-02',8,'Alpa','Presensi pertemuan ke-8','2025-10-22 19:52:34.850907',62),
(210,'2025-09-17',3,'Izin','Presensi pertemuan ke-3','2025-10-22 19:52:34.851708',63),
(211,'2025-09-09',4,'Hadir','','2025-10-22 19:52:34.852471',63),
(212,'2025-09-23',5,'Hadir','','2025-10-22 19:52:34.853280',63),
(213,'2025-10-10',6,'Hadir','','2025-10-22 19:52:34.854060',63),
(214,'2025-10-17',1,'Hadir','','2025-10-22 19:52:34.854858',64),
(215,'2025-09-16',2,'Izin','Presensi pertemuan ke-2','2025-10-22 19:52:34.855652',64),
(216,'2025-09-19',4,'Hadir','','2025-10-22 19:52:34.856397',64),
(217,'2025-09-30',5,'Hadir','','2025-10-22 19:52:34.857132',64),
(218,'2025-08-29',2,'Hadir','','2025-10-22 19:52:34.857881',65),
(219,'2025-09-24',4,'Hadir','','2025-10-22 19:52:34.858647',65),
(220,'2025-10-20',3,'Sakit','Presensi pertemuan ke-3','2025-10-22 19:52:34.859435',66),
(221,'2025-09-03',1,'Hadir','','2025-10-22 19:52:34.860278',67),
(222,'2025-09-25',3,'Hadir','','2025-10-22 19:52:34.861073',67),
(223,'2025-10-01',4,'Hadir','','2025-10-22 19:52:34.861800',67),
(224,'2025-09-05',5,'Hadir','','2025-10-22 19:52:34.862535',67),
(225,'2025-09-23',1,'Hadir','','2025-10-22 19:52:34.863292',68),
(226,'2025-10-02',2,'Hadir','','2025-10-22 19:52:34.864038',68),
(227,'2025-09-16',4,'Hadir','','2025-10-22 19:52:34.864816',68),
(228,'2025-10-09',6,'Hadir','','2025-10-22 19:52:34.865600',68),
(229,'2025-10-06',1,'Hadir','','2025-10-22 19:52:34.866364',69),
(230,'2025-09-24',2,'Hadir','','2025-10-22 19:52:34.867110',69),
(231,'2025-10-10',4,'Hadir','','2025-10-22 19:52:34.867851',69),
(232,'2025-09-09',5,'Sakit','Presensi pertemuan ke-5','2025-10-22 19:52:34.868599',69),
(233,'2025-09-24',6,'Hadir','','2025-10-22 19:52:34.869384',69),
(234,'2025-10-14',7,'Hadir','','2025-10-22 19:52:34.870119',69),
(235,'2025-09-22',2,'Hadir','','2025-10-22 19:52:34.870825',70),
(236,'2025-08-26',1,'Hadir','','2025-10-22 19:52:34.871469',71),
(237,'2025-10-13',2,'Hadir','','2025-10-22 19:52:34.872131',71),
(238,'2025-10-06',3,'Izin','Presensi pertemuan ke-3','2025-10-22 19:52:34.872770',71),
(239,'2025-10-09',4,'Hadir','','2025-10-22 19:52:34.873414',71),
(240,'2025-08-28',6,'Hadir','','2025-10-22 19:52:34.874048',71),
(241,'2025-09-24',1,'Hadir','','2025-10-22 19:52:34.874711',72),
(242,'2025-09-25',3,'Hadir','','2025-10-22 19:52:34.875360',72),
(243,'2025-09-17',4,'Hadir','','2025-10-22 19:52:34.875995',72),
(244,'2025-09-01',1,'Hadir','','2025-10-22 19:52:34.876631',73),
(245,'2025-09-10',2,'Izin','Presensi pertemuan ke-2','2025-10-22 19:52:34.877250',73),
(246,'2025-10-03',3,'Alpa','Presensi pertemuan ke-3','2025-10-22 19:52:34.877885',73),
(247,'2025-09-05',5,'Izin','Presensi pertemuan ke-5','2025-10-22 19:52:34.878526',73),
(248,'2025-09-08',6,'Hadir','','2025-10-22 19:52:34.879184',73),
(249,'2025-08-26',5,'Hadir','','2025-10-22 19:52:34.879836',74),
(250,'2025-08-26',6,'Izin','Presensi pertemuan ke-6','2025-10-22 19:52:34.880466',74),
(251,'2025-09-23',8,'Izin','Presensi pertemuan ke-8','2025-10-22 19:52:34.965070',74),
(252,'2025-10-15',1,'Hadir','','2025-10-22 19:52:34.985628',75),
(253,'2025-09-11',2,'Hadir','','2025-10-22 19:52:34.986800',75),
(254,'2025-08-27',6,'Hadir','','2025-10-22 19:52:34.987750',75),
(255,'2025-09-05',3,'Hadir','','2025-10-22 19:52:34.988648',76),
(256,'2025-09-25',4,'Sakit','Presensi pertemuan ke-4','2025-10-22 19:52:34.989500',76),
(257,'2025-09-02',6,'Hadir','','2025-10-22 19:52:34.990332',76),
(258,'2025-09-22',7,'Hadir','','2025-10-22 19:52:34.991085',76),
(259,'2025-09-22',1,'Alpa','Presensi pertemuan ke-1','2025-10-22 19:52:34.991891',77),
(260,'2025-10-10',2,'Hadir','','2025-10-22 19:52:34.992555',77),
(261,'2025-09-19',3,'Hadir','','2025-10-22 19:52:34.993281',77),
(262,'2025-10-01',4,'Hadir','','2025-10-22 19:52:34.993964',77),
(263,'2025-08-28',1,'Hadir','','2025-10-22 19:52:34.994609',78),
(264,'2025-09-26',2,'Hadir','','2025-10-22 19:52:34.995219',78),
(265,'2025-09-24',3,'Hadir','','2025-10-22 19:52:34.995862',78),
(266,'2025-10-01',4,'Hadir','','2025-10-22 19:52:34.996496',78),
(267,'2025-08-27',5,'Izin','Presensi pertemuan ke-5','2025-10-22 19:52:34.996957',78),
(268,'2025-10-14',6,'Izin','Presensi pertemuan ke-6','2025-10-22 19:52:34.997606',78),
(269,'2025-09-02',1,'Sakit','Presensi pertemuan ke-1','2025-10-22 19:52:34.998290',79),
(270,'2025-08-27',2,'Sakit','Presensi pertemuan ke-2','2025-10-22 19:52:34.998966',79),
(271,'2025-10-08',3,'Hadir','','2025-10-22 19:52:34.999622',79),
(272,'2025-09-01',4,'Izin','Presensi pertemuan ke-4','2025-10-22 19:52:35.000249',79),
(273,'2025-09-11',2,'Hadir','','2025-10-22 19:52:35.000918',80),
(274,'2025-10-08',1,'Hadir','','2025-10-22 19:52:35.001589',81),
(275,'2025-10-03',2,'Alpa','Presensi pertemuan ke-2','2025-10-22 19:52:35.002258',81),
(276,'2025-09-05',4,'Alpa','Presensi pertemuan ke-4','2025-10-22 19:52:35.002920',81),
(277,'2025-10-14',5,'Alpa','Presensi pertemuan ke-5','2025-10-22 19:52:35.003565',81),
(278,'2025-10-21',6,'Hadir','','2025-10-22 19:52:35.004233',81),
(279,'2025-09-30',7,'Hadir','','2025-10-22 19:52:35.004874',81),
(280,'2025-09-01',2,'Alpa','Presensi pertemuan ke-2','2025-10-22 19:52:35.005520',82),
(281,'2025-09-19',1,'Sakit','Presensi pertemuan ke-1','2025-10-22 19:52:35.006208',83),
(282,'2025-09-26',2,'Izin','Presensi pertemuan ke-2','2025-10-22 19:52:35.006860',83),
(283,'2025-10-03',3,'Izin','Presensi pertemuan ke-3','2025-10-22 19:52:35.007502',83),
(284,'2025-08-26',5,'Hadir','','2025-10-22 19:52:35.008171',83),
(285,'2025-10-15',1,'Hadir','','2025-10-22 19:52:35.008630',84),
(286,'2025-10-08',2,'Hadir','','2025-10-22 19:52:35.009337',84),
(287,'2025-08-26',3,'Sakit','Presensi pertemuan ke-3','2025-10-22 19:52:35.010021',84),
(288,'2025-09-15',4,'Hadir','','2025-10-22 19:52:35.010664',84),
(289,'2025-10-07',5,'Hadir','','2025-10-22 19:52:35.011315',84),
(290,'2025-09-16',1,'Hadir','','2025-10-22 19:52:35.011990',85),
(291,'2025-10-20',2,'Alpa','Presensi pertemuan ke-2','2025-10-22 19:52:35.012646',85),
(292,'2025-10-16',3,'Hadir','','2025-10-22 19:52:35.013261',85),
(293,'2025-08-28',4,'Sakit','Presensi pertemuan ke-4','2025-10-22 19:52:35.013910',85),
(294,'2025-09-24',5,'Hadir','','2025-10-22 19:52:35.014578',85),
(295,'2025-08-25',6,'Sakit','Presensi pertemuan ke-6','2025-10-22 19:52:35.015247',85),
(296,'2025-09-10',8,'Hadir','','2025-10-22 19:52:35.015903',85),
(297,'2025-08-26',1,'Sakit','Presensi pertemuan ke-1','2025-10-22 19:52:35.016547',86),
(298,'2025-09-10',4,'Hadir','','2025-10-22 19:52:35.017224',86),
(299,'2025-10-03',5,'Hadir','','2025-10-22 19:52:35.017871',86),
(300,'2025-09-08',1,'Hadir','','2025-10-22 19:52:35.018528',87),
(301,'2025-10-20',2,'Hadir','','2025-10-22 19:52:35.019225',87),
(302,'2025-09-12',1,'Izin','Presensi pertemuan ke-1','2025-10-22 19:52:35.019916',88),
(303,'2025-09-30',2,'Hadir','','2025-10-22 19:52:35.020567',88),
(304,'2025-10-15',3,'Hadir','','2025-10-22 19:52:35.021211',88),
(305,'2025-10-07',5,'Hadir','','2025-10-22 19:52:35.021866',88),
(306,'2025-08-26',1,'Hadir','','2025-10-22 19:52:35.031212',89),
(307,'2025-10-07',2,'Hadir','','2025-10-22 19:52:35.032026',89),
(308,'2025-10-21',3,'Sakit','Presensi pertemuan ke-3','2025-10-22 19:52:35.032698',89),
(309,'2025-09-26',4,'Hadir','','2025-10-22 19:52:35.039365',89),
(310,'2025-09-02',5,'Sakit','Presensi pertemuan ke-5','2025-10-22 19:52:35.040519',89),
(311,'2025-10-02',6,'Hadir','','2025-10-22 19:52:35.041681',89),
(312,'2025-09-01',1,'Hadir','','2025-10-22 19:52:35.042906',90),
(313,'2025-09-05',2,'Hadir','','2025-10-22 19:52:35.044047',90),
(314,'2025-09-04',4,'Hadir','','2025-10-22 19:52:35.045231',90),
(315,'2025-09-29',5,'Hadir','','2025-10-22 19:52:35.055039',90),
(316,'2025-10-02',6,'Alpa','Presensi pertemuan ke-6','2025-10-22 19:52:35.056268',90),
(317,'2025-09-09',1,'Hadir','','2025-10-22 19:52:35.057379',91),
(318,'2025-10-21',2,'Hadir','','2025-10-22 19:52:35.058420',91),
(319,'2025-09-18',3,'Hadir','','2025-10-22 19:52:35.059422',91),
(320,'2025-08-28',5,'Hadir','','2025-10-22 19:52:35.060465',91),
(321,'2025-08-28',1,'Hadir','','2025-10-22 19:52:35.062369',92),
(322,'2025-10-13',3,'Hadir','','2025-10-22 19:52:35.063452',92),
(323,'2025-09-09',4,'Hadir','','2025-10-22 19:52:35.064593',92),
(324,'2025-10-17',5,'Hadir','','2025-10-22 19:52:35.065994',92),
(325,'2025-10-14',6,'Hadir','','2025-10-22 19:52:35.067038',92),
(326,'2025-09-15',7,'Hadir','','2025-10-22 19:52:35.068035',92),
(327,'2025-10-06',8,'Hadir','','2025-10-22 19:52:35.069024',92),
(328,'2025-09-01',2,'Izin','Presensi pertemuan ke-2','2025-10-22 19:52:35.070088',93),
(329,'2025-10-02',1,'Hadir','','2025-10-22 19:52:35.071162',94),
(330,'2025-09-22',2,'Hadir','','2025-10-22 19:52:35.072246',94),
(331,'2025-09-01',1,'Izin','Presensi pertemuan ke-1','2025-10-22 19:52:35.073350',95),
(332,'2025-09-30',2,'Izin','Presensi pertemuan ke-2','2025-10-22 19:52:35.074449',95),
(333,'2025-10-13',3,'Izin','Presensi pertemuan ke-3','2025-10-22 19:52:35.075621',95),
(334,'2025-10-16',4,'Sakit','Presensi pertemuan ke-4','2025-10-22 19:52:35.077357',95),
(335,'2025-10-06',5,'Hadir','','2025-10-22 19:52:35.078613',95),
(336,'2025-09-18',6,'Hadir','','2025-10-22 19:52:35.079726',95),
(337,'2025-09-25',7,'Hadir','','2025-10-22 19:52:35.080846',95),
(338,'2025-10-07',2,'Hadir','','2025-10-22 19:52:35.081926',96),
(339,'2025-09-12',5,'Alpa','Presensi pertemuan ke-5','2025-10-22 19:52:35.083005',96),
(340,'2025-10-08',1,'Alpa','Presensi pertemuan ke-1','2025-10-22 19:52:35.084150',97),
(341,'2025-10-08',2,'Hadir','','2025-10-22 19:52:35.085316',97),
(342,'2025-08-28',4,'Hadir','','2025-10-22 19:52:35.086677',97),
(343,'2025-09-29',1,'Hadir','','2025-10-22 19:52:35.088104',98),
(344,'2025-09-29',2,'Alpa','Presensi pertemuan ke-2','2025-10-22 19:52:35.089179',98),
(345,'2025-10-06',3,'Hadir','','2025-10-22 19:52:35.090200',98),
(346,'2025-09-24',4,'Hadir','','2025-10-22 19:52:35.090952',98),
(347,'2025-10-17',5,'Hadir','','2025-10-22 19:52:35.091997',98),
(348,'2025-09-18',6,'Hadir','','2025-10-22 19:52:35.093499',98),
(349,'2025-08-28',7,'Hadir','','2025-10-22 19:52:35.095430',98),
(350,'2025-09-30',1,'Hadir','','2025-10-22 19:52:35.097029',99),
(351,'2025-09-19',2,'Hadir','','2025-10-22 19:52:35.098252',99),
(352,'2025-09-04',3,'Hadir','','2025-10-22 19:52:35.099621',99),
(353,'2025-10-08',4,'Hadir','','2025-10-22 19:52:35.100239',99),
(354,'2025-09-24',5,'Izin','Presensi pertemuan ke-5','2025-10-22 19:52:35.101200',99),
(355,'2025-10-06',6,'Hadir','','2025-10-22 19:52:35.101896',99),
(356,'2025-10-16',7,'Hadir','','2025-10-22 19:52:35.102986',99),
(357,'2025-10-10',1,'Hadir','','2025-10-22 19:52:35.104105',100),
(358,'2025-08-29',2,'Izin','Presensi pertemuan ke-2','2025-10-22 19:52:35.104820',100),
(359,'2025-10-17',3,'Alpa','Presensi pertemuan ke-3','2025-10-22 19:52:35.105901',100),
(360,'2025-09-12',4,'Izin','Presensi pertemuan ke-4','2025-10-22 19:52:35.107025',100),
(361,'2025-09-18',5,'Hadir','','2025-10-22 19:52:35.117371',100),
(362,'2025-10-16',6,'Alpa','Presensi pertemuan ke-6','2025-10-22 19:52:35.118021',100),
(363,'2025-09-24',7,'Hadir','','2025-10-22 19:52:35.119149',100),
(364,'2025-10-06',1,'Hadir','','2025-10-22 19:52:35.119839',101),
(365,'2025-09-01',2,'Hadir','','2025-10-22 19:52:35.121006',101),
(366,'2025-10-10',3,'Hadir','','2025-10-22 19:52:35.121680',101),
(367,'2025-10-20',4,'Alpa','Presensi pertemuan ke-4','2025-10-22 19:52:35.122776',101),
(368,'2025-09-11',5,'Sakit','Presensi pertemuan ke-5','2025-10-22 19:52:35.123449',101),
(369,'2025-09-17',6,'Hadir','','2025-10-22 19:52:35.133437',101),
(370,'2025-10-20',7,'Hadir','','2025-10-22 19:52:35.161139',101),
(371,'2025-09-10',8,'Hadir','','2025-10-22 19:52:35.161913',101),
(372,'2025-10-21',1,'Hadir','','2025-10-22 19:52:35.163040',102),
(373,'2025-08-25',3,'Hadir','','2025-10-22 19:52:35.163723',102),
(374,'2025-10-21',4,'Hadir','','2025-10-22 19:52:35.164856',102),
(375,'2025-10-10',5,'Hadir','','2025-10-22 19:52:35.181305',102),
(376,'2025-09-01',7,'Hadir','','2025-10-22 19:52:35.182473',102),
(377,'2025-10-20',2,'Alpa','Presensi pertemuan ke-2','2025-10-22 19:52:35.184302',103),
(378,'2025-09-02',4,'Hadir','','2025-10-22 19:52:35.185303',103),
(379,'2025-10-13',6,'Izin','Presensi pertemuan ke-6','2025-10-22 19:52:35.186328',103),
(380,'2025-09-16',3,'Hadir','','2025-10-22 19:52:35.186996',104),
(381,'2025-09-29',4,'Hadir','','2025-10-22 19:52:35.187615',104),
(382,'2025-09-29',1,'Hadir','','2025-10-22 19:52:35.188218',105),
(383,'2025-09-18',2,'Hadir','','2025-10-22 19:52:35.188872',105),
(384,'2025-08-26',3,'Alpa','Presensi pertemuan ke-3','2025-10-22 19:52:35.189519',105),
(385,'2025-09-18',4,'Hadir','','2025-10-22 19:52:35.190190',105),
(386,'2025-09-17',5,'Hadir','','2025-10-22 19:52:35.190814',105),
(387,'2025-08-26',6,'Hadir','','2025-10-22 19:52:35.191460',105),
(388,'2025-10-21',2,'Hadir','','2025-10-22 19:52:35.192118',106),
(389,'2025-10-15',5,'Hadir','','2025-10-22 19:52:35.192986',106),
(390,'2025-10-08',1,'Sakit','Presensi pertemuan ke-1','2025-10-22 19:52:35.193810',107),
(391,'2025-10-14',2,'Hadir','','2025-10-22 19:52:35.194574',107),
(392,'2025-10-08',4,'Izin','Presensi pertemuan ke-4','2025-10-22 19:52:35.195367',107),
(393,'2025-09-12',5,'Hadir','','2025-10-22 19:52:35.196131',107),
(394,'2025-08-29',1,'Hadir','','2025-10-22 19:52:35.196913',108),
(395,'2025-08-26',3,'Hadir','','2025-10-22 19:52:35.197647',108),
(396,'2025-09-15',1,'Hadir','','2025-10-22 19:52:35.198437',109),
(397,'2025-09-26',2,'Hadir','','2025-10-22 19:52:35.199216',109),
(398,'2025-09-30',3,'Hadir','','2025-10-22 19:52:35.199942',109),
(399,'2025-09-23',6,'Hadir','','2025-10-22 19:52:35.200672',109),
(400,'2025-09-23',8,'Hadir','','2025-10-22 19:52:35.201424',109),
(401,'2025-09-22',1,'Hadir','','2025-10-22 19:52:35.202212',110),
(402,'2025-09-01',2,'Hadir','','2025-10-22 19:52:35.202978',110),
(403,'2025-10-15',4,'Hadir','','2025-10-22 19:52:35.203762',110),
(404,'2025-10-07',5,'Hadir','','2025-10-22 19:52:35.204612',110),
(405,'2025-10-10',6,'Sakit','Presensi pertemuan ke-6','2025-10-22 19:52:35.205811',110),
(406,'2025-09-17',7,'Hadir','','2025-10-22 19:52:35.207526',110),
(407,'2025-08-25',8,'Hadir','','2025-10-22 19:52:35.208802',110),
(408,'2025-09-11',2,'Hadir','','2025-10-22 19:52:35.209913',111),
(409,'2025-08-28',3,'Izin','Presensi pertemuan ke-3','2025-10-22 19:52:35.211005',111),
(410,'2025-09-03',4,'Hadir','','2025-10-22 19:52:35.212099',111),
(411,'2025-10-16',5,'Hadir','','2025-10-22 19:52:35.213188',111),
(412,'2025-10-03',6,'Hadir','','2025-10-22 19:52:35.214328',111),
(413,'2025-09-25',7,'Hadir','','2025-10-22 19:52:35.215421',111),
(414,'2025-10-17',2,'Hadir','','2025-10-22 19:52:35.216555',112),
(415,'2025-09-10',3,'Alpa','Presensi pertemuan ke-3','2025-10-22 19:52:35.217622',112),
(416,'2025-10-17',5,'Hadir','','2025-10-22 19:52:35.218725',112),
(417,'2025-10-21',6,'Hadir','','2025-10-22 19:52:35.219876',112),
(418,'2025-09-26',7,'Hadir','','2025-10-22 19:52:35.220970',112),
(419,'2025-10-21',8,'Hadir','','2025-10-22 19:52:35.222061',112),
(420,'2025-09-23',2,'Hadir','','2025-10-22 19:52:35.223220',113),
(421,'2025-09-30',3,'Hadir','','2025-10-22 19:52:35.224298',113),
(422,'2025-09-23',4,'Alpa','Presensi pertemuan ke-4','2025-10-22 19:52:35.225463',113),
(423,'2025-08-25',2,'Hadir','','2025-10-22 19:52:35.226617',114),
(424,'2025-10-13',3,'Hadir','','2025-10-22 19:52:35.227776',114),
(425,'2025-09-23',4,'Sakit','Presensi pertemuan ke-4','2025-10-22 19:52:35.228889',114),
(426,'2025-10-16',5,'Hadir','','2025-10-22 19:52:35.229970',114),
(427,'2025-10-15',7,'Hadir','','2025-10-22 19:52:35.231096',114),
(428,'2025-08-27',8,'Hadir','','2025-10-22 19:52:35.232248',114),
(429,'2025-08-28',1,'Hadir','','2025-10-22 19:52:35.233340',115),
(430,'2025-09-01',2,'Hadir','','2025-10-22 19:52:35.234529',115),
(431,'2025-08-27',3,'Hadir','','2025-10-22 19:52:35.235635',115),
(432,'2025-09-10',1,'Alpa','Presensi pertemuan ke-1','2025-10-22 19:52:35.236839',116),
(433,'2025-10-02',3,'Sakit','Presensi pertemuan ke-3','2025-10-22 19:52:35.238014',116),
(434,'2025-10-01',1,'Hadir','','2025-10-22 19:52:35.239105',117),
(435,'2025-10-08',2,'Hadir','','2025-10-22 19:52:35.240189',117),
(436,'2025-10-16',3,'Hadir','','2025-10-22 19:52:35.241270',117),
(437,'2025-09-05',5,'Hadir','','2025-10-22 19:52:35.242391',117),
(438,'2025-09-29',6,'Hadir','','2025-10-22 19:52:35.243840',117),
(439,'2025-09-02',1,'Hadir','','2025-10-22 19:52:35.245292',118),
(440,'2025-09-15',3,'Hadir','','2025-10-22 19:52:35.246764',118),
(441,'2025-09-04',4,'Hadir','','2025-10-22 19:52:35.248188',118),
(442,'2025-09-09',6,'Alpa','Presensi pertemuan ke-6','2025-10-22 19:52:35.249662',118),
(443,'2025-09-19',7,'Hadir','','2025-10-22 19:52:35.251090',118),
(444,'2025-09-23',3,'Hadir','','2025-10-22 19:52:35.252538',119),
(445,'2025-09-03',4,'Hadir','','2025-10-22 19:52:35.254030',119),
(446,'2025-09-19',5,'Hadir','','2025-10-22 19:52:35.255460',119),
(447,'2025-09-26',6,'Hadir','','2025-10-22 19:52:35.256853',119),
(448,'2025-09-24',1,'Hadir','','2025-10-22 19:52:35.258246',120),
(449,'2025-10-09',2,'Hadir','','2025-10-22 19:52:35.259671',120),
(450,'2025-10-20',3,'Hadir','','2025-10-22 19:52:35.261096',120),
(451,'2025-10-07',4,'Hadir','','2025-10-22 19:52:35.262493',120),
(452,'2025-09-08',6,'Hadir','','2025-10-22 19:52:35.263780',120),
(453,'2025-10-08',1,'Sakit','Presensi pertemuan ke-1','2025-10-22 19:52:35.265070',121),
(454,'2025-09-16',3,'Hadir','','2025-10-22 19:52:35.266212',121),
(455,'2025-10-21',4,'Hadir','','2025-10-22 19:52:35.267329',121),
(456,'2025-09-23',1,'Hadir','','2025-10-22 19:52:35.268397',122),
(457,'2025-09-01',2,'Hadir','','2025-10-22 19:52:35.269541',122),
(458,'2025-09-11',4,'Hadir','','2025-10-22 19:52:35.270677',122),
(459,'2025-09-23',1,'Hadir','','2025-10-22 19:52:35.271863',123),
(460,'2025-09-19',2,'Alpa','Presensi pertemuan ke-2','2025-10-22 19:52:35.273061',123),
(461,'2025-09-18',3,'Hadir','','2025-10-22 19:52:35.274214',123),
(462,'2025-09-02',4,'Hadir','','2025-10-22 19:52:35.275334',123),
(463,'2025-08-27',1,'Hadir','','2025-10-22 19:52:35.276516',124),
(464,'2025-10-15',2,'Hadir','','2025-10-22 19:52:35.277639',124),
(465,'2025-09-23',3,'Hadir','','2025-10-22 19:52:35.278782',124),
(466,'2025-09-25',1,'Hadir','','2025-10-22 19:52:35.279902',125),
(467,'2025-09-16',2,'Hadir','','2025-10-22 19:52:35.280990',125),
(468,'2025-09-02',3,'Hadir','','2025-10-22 19:52:35.282087',125),
(469,'2025-10-10',4,'Hadir','','2025-10-22 19:52:35.283195',125),
(470,'2025-09-30',6,'Hadir','','2025-10-22 19:52:35.284326',125),
(471,'2025-10-09',1,'Alpa','Presensi pertemuan ke-1','2025-10-22 19:52:35.285770',126),
(472,'2025-09-12',2,'Hadir','','2025-10-22 19:52:35.286972',126),
(473,'2025-10-20',1,'Hadir','','2025-10-22 19:52:35.288124',127),
(474,'2025-09-25',2,'Sakit','Presensi pertemuan ke-2','2025-10-22 19:52:35.289275',127),
(475,'2025-09-22',3,'Hadir','','2025-10-22 19:52:35.290420',127),
(476,'2025-08-26',1,'Alpa','Presensi pertemuan ke-1','2025-10-22 19:52:35.291577',128),
(477,'2025-10-02',2,'Sakit','Presensi pertemuan ke-2','2025-10-22 19:52:35.292926',128),
(478,'2025-10-17',3,'Hadir','','2025-10-22 19:52:35.294169',128),
(479,'2025-09-16',4,'Hadir','','2025-10-22 19:52:35.295295',128),
(480,'2025-09-08',5,'Hadir','','2025-10-22 19:52:35.296382',128),
(481,'2025-08-29',6,'Hadir','','2025-10-22 19:52:35.297603',128),
(482,'2025-10-17',2,'Izin','Presensi pertemuan ke-2','2025-10-22 19:52:35.298769',129),
(483,'2025-10-13',1,'Hadir','','2025-10-22 19:52:35.299959',130),
(484,'2025-10-20',2,'Alpa','Presensi pertemuan ke-2','2025-10-22 19:52:35.301130',130),
(485,'2025-08-28',3,'Alpa','Presensi pertemuan ke-3','2025-10-22 19:52:35.302267',130),
(486,'2025-10-08',4,'Hadir','','2025-10-22 19:52:35.303410',130),
(487,'2025-09-15',1,'Hadir','','2025-10-22 19:52:35.304580',131),
(488,'2025-09-04',2,'Hadir','','2025-10-22 19:52:35.305646',131),
(489,'2025-09-03',3,'Hadir','','2025-10-22 19:52:35.306793',131),
(490,'2025-10-20',4,'Hadir','','2025-10-22 19:52:35.307898',131),
(491,'2025-09-23',6,'Alpa','Presensi pertemuan ke-6','2025-10-22 19:52:35.309013',131),
(492,'2025-09-02',7,'Hadir','','2025-10-22 19:52:35.310123',131),
(493,'2025-09-08',3,'Alpa','Presensi pertemuan ke-3','2025-10-22 19:52:35.311550',132),
(494,'2025-09-30',1,'Hadir','','2025-10-22 19:52:35.313013',133),
(495,'2025-09-03',2,'Hadir','','2025-10-22 19:52:35.314434',133),
(496,'2025-09-12',3,'Hadir','','2025-10-22 19:52:35.315869',133),
(497,'2025-10-09',4,'Hadir','','2025-10-22 19:52:35.317299',133),
(498,'2025-10-07',6,'Izin','Presensi pertemuan ke-6','2025-10-22 19:52:35.318718',133),
(499,'2025-10-06',7,'Hadir','','2025-10-22 19:52:35.320172',133),
(500,'2025-09-25',8,'Hadir','','2025-10-22 19:52:35.321566',133),
(501,'2025-09-30',1,'Hadir','','2025-10-22 19:52:35.323013',134),
(502,'2025-10-13',2,'Sakit','Presensi pertemuan ke-2','2025-10-22 19:52:35.324439',134),
(503,'2025-08-29',1,'Izin','Presensi pertemuan ke-1','2025-10-22 19:52:35.325928',135),
(504,'2025-09-18',3,'Hadir','','2025-10-22 19:52:35.327345',135),
(505,'2025-08-28',1,'Hadir','','2025-10-22 19:52:35.328818',136),
(506,'2025-10-02',2,'Hadir','','2025-10-22 19:52:35.330181',136),
(507,'2025-10-16',3,'Hadir','','2025-10-22 19:52:35.331468',136),
(508,'2025-08-28',6,'Hadir','','2025-10-22 19:52:35.332862',136),
(509,'2025-09-01',7,'Hadir','','2025-10-22 19:52:35.334192',136),
(514,'2025-09-18',1,'Alpa','Presensi pertemuan ke-1','2025-10-22 19:53:25.322411',21),
(515,'2025-08-26',2,'Hadir','','2025-10-22 19:53:25.323693',21),
(518,'2025-09-24',1,'Hadir','','2025-10-22 19:53:25.327534',23),
(521,'2025-09-08',1,'Sakit','Presensi pertemuan ke-1','2025-10-22 19:53:25.331128',25),
(523,'2025-10-20',1,'Sakit','Presensi pertemuan ke-1','2025-10-22 19:53:25.333410',26),
(527,'2025-10-06',1,'Alpa','Presensi pertemuan ke-1','2025-10-22 19:53:25.338293',29),
(529,'2025-09-16',1,'Hadir','','2025-10-22 19:53:25.341123',30),
(533,'2025-10-14',1,'Hadir','','2025-10-22 19:53:25.345616',33),
(537,'2025-09-03',1,'Hadir','','2025-10-22 19:53:25.350308',36),
(539,'2025-08-27',1,'Izin','Presensi pertemuan ke-1','2025-10-22 19:53:25.353104',37),
(544,'2025-10-14',1,'Hadir','','2025-10-22 19:53:25.360425',41),
(545,'2025-08-26',2,'Sakit','Presensi pertemuan ke-2','2025-10-22 19:53:25.361910',41),
(546,'2025-10-06',5,'Hadir','','2025-10-22 19:53:25.363373',41),
(547,'2025-10-02',2,'Sakit','Presensi pertemuan ke-2','2025-10-22 19:53:25.364873',42),
(551,'2025-09-02',1,'Hadir','','2025-10-22 19:53:25.371525',45),
(552,'2025-08-25',2,'Hadir','','2025-10-22 19:53:25.373049',45),
(553,'2025-10-02',3,'Izin','Presensi pertemuan ke-3','2025-10-22 19:53:25.374486',45),
(556,'2025-09-10',1,'Hadir','','2025-10-22 19:53:25.378891',47),
(557,'2025-08-26',2,'Hadir','','2025-10-22 19:53:25.380443',47),
(558,'2025-09-05',3,'Hadir','','2025-10-22 19:53:25.381853',47),
(560,'2025-09-22',1,'Hadir','','2025-10-22 19:53:25.384786',48),
(566,'2025-09-24',1,'Alpa','Presensi pertemuan ke-1','2025-10-22 19:53:25.390377',53),
(569,'2025-09-30',1,'Hadir','','2025-10-22 19:53:25.392995',55),
(571,'2025-08-25',1,'Hadir','','2025-10-22 19:53:25.394887',56),
(579,'2025-09-30',1,'Hadir','','2025-10-22 19:53:25.404200',63),
(580,'2025-10-16',2,'Hadir','','2025-10-22 19:53:25.405347',63),
(583,'2025-10-09',1,'Hadir','','2025-10-22 19:53:25.408958',65),
(584,'2025-10-10',3,'Hadir','','2025-10-22 19:53:25.410175',65),
(586,'2025-09-18',1,'Hadir','','2025-10-22 19:53:25.416430',66),
(588,'2025-10-20',2,'Izin','Presensi pertemuan ke-2','2025-10-22 19:53:25.419619',67),
(592,'2025-10-14',1,'Hadir','','2025-10-22 19:53:25.425618',70),
(595,'2025-09-24',2,'Hadir','','2025-10-22 19:53:25.429354',72),
(597,'2025-10-15',2,'Hadir','','2025-10-22 19:53:25.431264',74),
(598,'2025-08-26',3,'Sakit','Presensi pertemuan ke-3','2025-10-22 19:53:25.432902',74),
(601,'2025-09-15',2,'Hadir','','2025-10-22 19:53:25.438222',76),
(607,'2025-09-26',3,'Hadir','','2025-10-22 19:53:25.449126',81),
(609,'2025-09-12',1,'Alpa','Presensi pertemuan ke-1','2025-10-22 19:53:25.452429',82),
(621,'2025-10-15',1,'Hadir','','2025-10-22 19:53:25.471804',93),
(625,'2025-09-29',1,'Alpa','Presensi pertemuan ke-1','2025-10-22 19:53:25.477561',96),
(626,'2025-09-18',3,'Hadir','','2025-10-22 19:53:25.478638',96),
(627,'2025-09-12',4,'Hadir','','2025-10-22 19:53:25.479682',96),
(635,'2025-09-03',1,'Hadir','','2025-10-22 19:53:25.495960',103),
(636,'2025-09-19',3,'Hadir','','2025-10-22 19:53:25.497063',103),
(638,'2025-09-08',1,'Hadir','','2025-10-22 19:53:25.508331',104),
(639,'2025-10-21',2,'Hadir','','2025-10-22 19:53:25.509370',104),
(642,'2025-09-15',1,'Hadir','','2025-10-22 19:53:25.547317',106),
(643,'2025-10-16',3,'Sakit','Presensi pertemuan ke-3','2025-10-22 19:53:25.548374',106),
(644,'2025-09-29',4,'Hadir','','2025-10-22 19:53:25.549378',106),
(648,'2025-08-26',3,'Hadir','','2025-10-22 19:53:25.553552',110),
(649,'2025-09-19',1,'Hadir','','2025-10-22 19:53:25.554571',111),
(651,'2025-10-15',1,'Izin','Presensi pertemuan ke-1','2025-10-22 19:53:25.557013',112),
(653,'2025-09-05',1,'Izin','Presensi pertemuan ke-1','2025-10-22 19:53:25.558655',113),
(655,'2025-09-29',1,'Hadir','','2025-10-22 19:53:25.560146',114),
(658,'2025-09-23',2,'Hadir','','2025-10-22 19:53:25.562159',116),
(662,'2025-09-01',1,'Hadir','','2025-10-22 19:53:25.564885',119),
(672,'2025-09-10',1,'Hadir','','2025-10-22 19:53:25.571848',129),
(673,'2025-10-03',5,'Hadir','','2025-10-22 19:53:25.572493',129),
(676,'2025-10-09',1,'Hadir','','2025-10-22 19:53:25.574475',132),
(679,'2025-10-06',4,'Hadir','','2025-10-22 19:53:25.576465',134),
(680,'2025-10-20',5,'Hadir','','2025-10-22 19:53:25.577129',134);
/*!40000 ALTER TABLE `academic_presensi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `academic_programstudi`
--

DROP TABLE IF EXISTS `academic_programstudi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `academic_programstudi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `kode_prodi` varchar(10) NOT NULL,
  `nama_prodi` varchar(100) NOT NULL,
  `jenjang` varchar(20) NOT NULL,
  `kaprodi` varchar(100) NOT NULL,
  `fakultas_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `kode_prodi` (`kode_prodi`),
  KEY `academic_programstud_fakultas_id_5480b6eb_fk_academic_` (`fakultas_id`),
  CONSTRAINT `academic_programstud_fakultas_id_5480b6eb_fk_academic_` FOREIGN KEY (`fakultas_id`) REFERENCES `academic_fakultas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academic_programstudi`
--

LOCK TABLES `academic_programstudi` WRITE;
/*!40000 ALTER TABLE `academic_programstudi` DISABLE KEYS */;
INSERT INTO `academic_programstudi` VALUES
(1,'TI','S1 Teknik Informatika','S1','',1),
(2,'SI','S1 Sistem Informasi','S1','',1),
(3,'TE','S1 Teknik Elektro','S1','',1),
(4,'TM','S1 Teknik Mesin','S1','',1),
(5,'TS','S1 Teknik Sipil','S1','',1),
(6,'AR','S1 Arsitektur','S1','',1),
(7,'MN','S1 Manajemen','S1','',2),
(8,'AK','S1 Akuntansi','S1','',2),
(9,'IK','S1 Ilmu Komunikasi','S1','',3),
(10,'PS','S1 Psikologi','S1','',3),
(11,'002','AI','S1','',1);
/*!40000 ALTER TABLE `academic_programstudi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `academic_ruang`
--

DROP TABLE IF EXISTS `academic_ruang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `academic_ruang` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `kode_ruang` varchar(10) NOT NULL,
  `nama_ruang` varchar(50) NOT NULL,
  `gedung` varchar(20) NOT NULL,
  `lantai` varchar(10) NOT NULL,
  `kapasitas` int(11) NOT NULL,
  `jenis_ruang` varchar(20) NOT NULL,
  `fasilitas` longtext NOT NULL,
  `status` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `kode_ruang` (`kode_ruang`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academic_ruang`
--

LOCK TABLES `academic_ruang` WRITE;
/*!40000 ALTER TABLE `academic_ruang` DISABLE KEYS */;
INSERT INTO `academic_ruang` VALUES
(1,'R301','Ruang Kelas 301','A','3',40,'Kelas','','Aktif'),
(2,'LAB01','Laboratorium Komputer 1','B','1',30,'Lab','','Aktif'),
(3,'AUD01','Auditorium Utama','C','1',200,'Auditorium','','Aktif');
/*!40000 ALTER TABLE `academic_ruang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `academic_semester`
--

DROP TABLE IF EXISTS `academic_semester`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `academic_semester` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nama_semester` varchar(50) NOT NULL,
  `kode_semester` varchar(10) NOT NULL,
  `tahun_ajaran` varchar(9) NOT NULL,
  `jenis_semester` varchar(10) NOT NULL,
  `tanggal_mulai` date NOT NULL,
  `tanggal_selesai` date NOT NULL,
  `aktif` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `kode_semester` (`kode_semester`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academic_semester`
--

LOCK TABLES `academic_semester` WRITE;
/*!40000 ALTER TABLE `academic_semester` DISABLE KEYS */;
INSERT INTO `academic_semester` VALUES
(1,'Semester Ganjil 2025/2026','20251','2025/2026','Ganjil','2025-08-01','2026-01-31',1),
(2,'Semester Genap 2024/2025','20242','2024/2025','Genap','2025-02-01','2025-07-31',0);
/*!40000 ALTER TABLE `academic_semester` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES
(1,'Can add log entry',1,'add_logentry'),
(2,'Can change log entry',1,'change_logentry'),
(3,'Can delete log entry',1,'delete_logentry'),
(4,'Can view log entry',1,'view_logentry'),
(5,'Can add permission',2,'add_permission'),
(6,'Can change permission',2,'change_permission'),
(7,'Can delete permission',2,'delete_permission'),
(8,'Can view permission',2,'view_permission'),
(9,'Can add group',3,'add_group'),
(10,'Can change group',3,'change_group'),
(11,'Can delete group',3,'delete_group'),
(12,'Can view group',3,'view_group'),
(13,'Can add user',4,'add_user'),
(14,'Can change user',4,'change_user'),
(15,'Can delete user',4,'delete_user'),
(16,'Can view user',4,'view_user'),
(17,'Can add content type',5,'add_contenttype'),
(18,'Can change content type',5,'change_contenttype'),
(19,'Can delete content type',5,'delete_contenttype'),
(20,'Can view content type',5,'view_contenttype'),
(21,'Can add session',6,'add_session'),
(22,'Can change session',6,'change_session'),
(23,'Can delete session',6,'delete_session'),
(24,'Can view session',6,'view_session'),
(25,'Can add mata kuliah',7,'add_matakuliah'),
(26,'Can change mata kuliah',7,'change_matakuliah'),
(27,'Can delete mata kuliah',7,'delete_matakuliah'),
(28,'Can view mata kuliah',7,'view_matakuliah'),
(29,'Can add program studi',8,'add_programstudi'),
(30,'Can change program studi',8,'change_programstudi'),
(31,'Can delete program studi',8,'delete_programstudi'),
(32,'Can view program studi',8,'view_programstudi'),
(33,'Can add dosen',9,'add_dosen'),
(34,'Can change dosen',9,'change_dosen'),
(35,'Can delete dosen',9,'delete_dosen'),
(36,'Can view dosen',9,'view_dosen'),
(37,'Can add kelas',10,'add_kelas'),
(38,'Can change kelas',10,'change_kelas'),
(39,'Can delete kelas',10,'delete_kelas'),
(40,'Can view kelas',10,'view_kelas'),
(41,'Can add jadwal',11,'add_jadwal'),
(42,'Can change jadwal',11,'change_jadwal'),
(43,'Can delete jadwal',11,'delete_jadwal'),
(44,'Can view jadwal',11,'view_jadwal'),
(45,'Can add mahasiswa',12,'add_mahasiswa'),
(46,'Can change mahasiswa',12,'change_mahasiswa'),
(47,'Can delete mahasiswa',12,'delete_mahasiswa'),
(48,'Can view mahasiswa',12,'view_mahasiswa'),
(49,'Can add krs',13,'add_krs'),
(50,'Can change krs',13,'change_krs'),
(51,'Can delete krs',13,'delete_krs'),
(52,'Can view krs',13,'view_krs'),
(53,'Can add nilai',14,'add_nilai'),
(54,'Can change nilai',14,'change_nilai'),
(55,'Can delete nilai',14,'delete_nilai'),
(56,'Can view nilai',14,'view_nilai'),
(57,'Can add presensi',15,'add_presensi'),
(58,'Can change presensi',15,'change_presensi'),
(59,'Can delete presensi',15,'delete_presensi'),
(60,'Can view presensi',15,'view_presensi'),
(61,'Can add notification',16,'add_notification'),
(62,'Can change notification',16,'change_notification'),
(63,'Can delete notification',16,'delete_notification'),
(64,'Can view notification',16,'view_notification'),
(65,'Can add fakultas',17,'add_fakultas'),
(66,'Can change fakultas',17,'change_fakultas'),
(67,'Can delete fakultas',17,'delete_fakultas'),
(68,'Can view fakultas',17,'view_fakultas'),
(69,'Can add ruang',18,'add_ruang'),
(70,'Can change ruang',18,'change_ruang'),
(71,'Can delete ruang',18,'delete_ruang'),
(72,'Can view ruang',18,'view_ruang'),
(73,'Can add semester',19,'add_semester'),
(74,'Can change semester',19,'change_semester'),
(75,'Can delete semester',19,'delete_semester'),
(76,'Can view semester',19,'view_semester');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=368 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES
(1,'pbkdf2_sha256$1000000$5uLZnhIrf6QobGTxfuJ9La$fR/802tThR213KTlneD+zcpmo75DXwLzGBeJOsEp/e8=','2025-10-24 14:49:57.459557',1,'admin','','','admin@siakad.ac.id',1,1,'2025-10-17 18:46:48.891217'),
(2,'pbkdf2_sha256$1000000$U4s2lUpphZHOz6vkTNqhaS$/wWkjxnwS+jesJLWKUa/2Rpm7iXK3dGi0kNCsTj8Q6Y=','2025-10-24 14:46:02.890255',0,'dosen1','Ahmad','Dr.','ahmad.fauzi@univ.ac.id',0,1,'2025-10-18 05:57:33.254438'),
(3,'pbkdf2_sha256$1000000$GC4H6KOIdwa6r5ahBJU3Bo$RnlwklBY7cpRF23wFnPPOncUDvWmHJ/92eqPVHyOa4Q=',NULL,0,'dosen2','Budi','Dr.','dosen2@univ.ac.id',0,1,'2025-10-18 05:59:12.095445'),
(4,'pbkdf2_sha256$1000000$9wPuK23bFuPFr4IW64kNFe$IgstvH4/yEgIgspjV+F5qT1aLM/HIF/yMOxAxWms1n4=',NULL,0,'dosen3','Citra','Prof.','dosen3@univ.ac.id',0,1,'2025-10-18 05:59:14.516243'),
(5,'pbkdf2_sha256$1000000$Y7rJuyd68OEbu05WjrmxgV$yDPya49/yMMzwN71oI9QEWdbxOT51FVPd5vvw7uZ3Hs=',NULL,0,'dosen4','Dedi','Dr.','dosen4@univ.ac.id',0,1,'2025-10-18 05:59:16.747132'),
(6,'pbkdf2_sha256$1000000$lS2gCcgv3cmmRHCSM16VS8$PPm7lJMc5FhAe1y3flGWr1QC/xQfqmCtaJLfGRTJxd8=',NULL,0,'dosen5','Eka','Dr.','dosen5@univ.ac.id',0,1,'2025-10-18 05:59:18.146736'),
(7,'pbkdf2_sha256$1000000$8DaJooCqWuEuPyi6u6J5UX$vrAG+yFawygwkii9kuqW5xpByqPzFtBXs3XGvMkCFOI=',NULL,0,'dosen6','Fajar','Prof.','dosen6@univ.ac.id',0,1,'2025-10-18 05:59:19.227945'),
(8,'pbkdf2_sha256$1000000$3EyzUQK8wpy0qazTVNEkgK$RBxv+VkBnE7jnT/w54yu9s1WZ4ye3q0wV3/NasjfEjo=',NULL,0,'dosen7','Gita','Dr.','dosen7@univ.ac.id',0,1,'2025-10-18 05:59:20.309320'),
(9,'pbkdf2_sha256$1000000$ucHgaJz3IslFRhcAHviIpm$zVndU6kjb8EIK6OJYKdcLkielFvkS0grp4P0kA4Fe1Y=',NULL,0,'dosen8','Hendra','Dr.','dosen8@univ.ac.id',0,1,'2025-10-18 05:59:22.287901'),
(10,'pbkdf2_sha256$1000000$QstLtKyTLN9uZwHKl9eVcm$pmyMDpvk31ZF+fsPNf02glHF+obuzjsK+xEvoj1EgT4=',NULL,0,'dosen9','Indah','Dr.','dosen9@univ.ac.id',0,1,'2025-10-18 05:59:24.634835'),
(11,'pbkdf2_sha256$1000000$OWo2JQpp3EXvEkhN42f7rA$pyra6kxy4Co0VGXaljw6GKEeej4rWIBqrjOf6nD37GM=',NULL,0,'dosen10','Joko','Prof.','dosen10@univ.ac.id',0,1,'2025-10-18 05:59:26.788454'),
(12,'pbkdf2_sha256$1000000$eMWo59zWTL7n33Pg7Q11RT$vyTATtWVxgURhpo17gwpuItKhRvIH6CV1RLbXDvdOeE=','2025-10-24 14:39:56.261799',0,'mhs2021001','Andi','Pratama','andi.pratama@student.univ.ac.id',0,1,'2025-10-18 05:59:29.046607'),
(13,'pbkdf2_sha256$1000000$DTol0LpjfENuIdT8b0s3Zl$HyETU/OJ6TcLURPvg8vCg1E7NRXd99sKPmY1mZ7bJdM=',NULL,0,'mhs2021002','Bella','Safira','bella.safira@student.univ.ac.id',0,1,'2025-10-18 05:59:31.249116'),
(14,'pbkdf2_sha256$1000000$NLkE32FAGeLOZ05GChxpRB$toqxff3LlyRP5Qa7H6IWsWb7Ya0pnJGbVauWr7xyn/Y=',NULL,0,'mhs2021003','Candra','Kirana','candra.kirana@student.univ.ac.id',0,1,'2025-10-18 05:59:33.416315'),
(15,'pbkdf2_sha256$1000000$uRg326z0W7gvvnQnuqugMx$6cpBGVl5b5cuiEq+PP7LxdNd5kQ2JaqLQhjfkFtxUpM=',NULL,0,'mhs2021004','Dimas','Anggara','dimas.anggara@student.univ.ac.id',0,1,'2025-10-18 05:59:35.228097'),
(16,'pbkdf2_sha256$1000000$0Yq3mn0nxj5MBW00MDep3U$w1yNbiKfL81T8rX0HH1XVJpx9kAynMgcwWkYg6/QP9w=',NULL,0,'mhs2021005','Eka','Sari','eka.sari@student.univ.ac.id',0,1,'2025-10-18 05:59:37.084459'),
(17,'pbkdf2_sha256$1000000$Y57c8sxWwraqPyrsH3YSgp$PN96AhhSmUnQUZiHWHzNtGMt7XfwqPk4Iv3lDKZ1Lq4=',NULL,0,'mhs2021006','Fahmi','Reza','fahmi.reza@student.univ.ac.id',0,1,'2025-10-18 05:59:39.013938'),
(18,'pbkdf2_sha256$1000000$7R0LQjrVWE9N2Uhu8BNdmV$mrEpHJmeBzVZHbcPEj3cQiBrs8bY+C/MObagvjsUD38=',NULL,0,'mhs2021007','Gina','Lestari','gina.lestari@student.univ.ac.id',0,1,'2025-10-18 05:59:40.895733'),
(19,'pbkdf2_sha256$1000000$E3aYgvOGHqhyEqBiKPLsoj$Bxp9hcJvJifAZvXIgq8XZhMSu5l/vaCZ8wKqrLGtEZ0=',NULL,0,'mhs2021008','Hadi','Gunawan','hadi.gunawan@student.univ.ac.id',0,1,'2025-10-18 05:59:42.507580'),
(20,'pbkdf2_sha256$1000000$PsWnSiCHTiE2WQiEbavdj5$fnTcf4e/Zd4NVIFwBVOPPKS1kxCNlVKSrvpzmpB4awo=',NULL,0,'mhs2021009','Intan','Permatasari','intan.permata@student.univ.ac.id',0,1,'2025-10-18 05:59:44.746917'),
(21,'pbkdf2_sha256$1000000$Dr8MIw0v3hYTLwgqxZztQp$Oo/CY/irPHVOS8t2dCHNHNflFzZMkyMLg8Sli0SU9qk=',NULL,0,'mhs2021010','Jaka','Sembung','jaka.sembung@student.univ.ac.id',0,1,'2025-10-18 05:59:46.715845'),
(23,'pbkdf2_sha256$1000000$zcoJGcpOo0ktZxMt8dDXIn$nU0eDLC54T6gMu9oEMO66P2d1tdCCfTEp+d7xlYKiZs=',NULL,0,'mahasiswa001','Rina','Azzahra','rina.azzahra93@student.ac.id',0,1,'2025-10-22 19:50:42.797877'),
(24,'pbkdf2_sha256$1000000$FgDdjTojibv6dmxD6fjuAN$2dLRw8WEB4wvyqjFvNwEyCOYHIj9mGTZP3hejdVNaIU=',NULL,0,'mahasiswa002','Yoga','Pratama Rahmawati','yoga.rahmawati24@yahoo.com',0,1,'2025-10-22 19:50:44.495469'),
(25,'pbkdf2_sha256$1000000$ioBFRwlwu3oZwWXjEJzeoq$VVsxZe/WMDt7VnNYehDEzr7s2tkxP/eZRVkDetzi63Y=',NULL,0,'mahasiswa003','Siti','Setia Maulana','siti.maulana61@gmail.com',0,1,'2025-10-22 19:50:45.775965'),
(26,'pbkdf2_sha256$1000000$hwUoEb5H5m39RuzFA470Hi$GzOe2PxQrDdVruQklvR6RXUqUlsCF42nVaMY0AEcpWE=',NULL,0,'mahasiswa004','Rafi','Pratama Azzahra','rafi.azzahra9@student.ac.id',0,1,'2025-10-22 19:50:48.036408'),
(27,'pbkdf2_sha256$1000000$tzWwKTyyh65UAbh8WYB4aJ$Fz2k6WOklXm66gjfbYefiv02sNnOIq1fXrDRhugAcgM=',NULL,0,'mahasiswa005','Nur','Bhakti Kusnadi','nur.kusnadi41@gmail.com',0,1,'2025-10-22 19:50:49.402188'),
(28,'pbkdf2_sha256$1000000$ZRRMVp6NCsx59VDB74FutQ$+z1VkjMZ+hNwxFGXVE4Na6Z6QcfJfuOgseIJXW1xb1k=',NULL,0,'mahasiswa006','Rizki','Pratama Kusuma','rizki.kusuma42@gmail.com',0,1,'2025-10-22 19:50:51.156542'),
(29,'pbkdf2_sha256$1000000$rBCQS3Q2m9x4xhsIROg3Np$/xHFklxzJ7QyN6rkYzHfjDvrEqIuI8dlayON3lL0gKQ=',NULL,0,'mahasiswa007','Yoga','Mandala Kusuma','yoga.kusuma84@student.ac.id',0,1,'2025-10-22 19:50:53.483629'),
(30,'pbkdf2_sha256$1000000$rYwWo0moZGqOhJDTHKcFf4$rTTNEqvcHxOCDpqHra5plVQrJTpBauj/2mwVb6glUQA=',NULL,0,'mahasiswa008','Sari','Pratama Fauzi','sari.fauzi23@student.ac.id',0,1,'2025-10-22 19:50:55.311357'),
(31,'pbkdf2_sha256$1000000$SQkw8IrrdNAoTihWvKUihr$8IUA9jgjK8qh6ghVx//CQukQ9edDpf23VfxqnSOqoOY=',NULL,0,'mahasiswa009','Fajar','Mahendra Fauzi','fajar.fauzi61@yahoo.com',0,1,'2025-10-22 19:50:57.744468'),
(32,'pbkdf2_sha256$1000000$102HNIVFfCXQ4lOWJSIvJi$aewBXGMpUyg8kO0kdilYGXJZb99GWStMH8cX3f8ajFE=',NULL,0,'mahasiswa010','Lestari','Adhi Ramadhan','lestari.ramadhan38@outlook.com',0,1,'2025-10-22 19:50:59.107158'),
(33,'pbkdf2_sha256$1000000$cQGcURbjTqZAyoiMZP6MSX$pLUrcLQxt2AbNGJ//YO89pXUvlmA5pKEZxeFJ+MkSNE=',NULL,0,'mahasiswa011','Rizki','Adhi Maulana','rizki.maulana97@yahoo.com',0,1,'2025-10-22 19:51:00.690834'),
(34,'pbkdf2_sha256$1000000$0nE0k2YYX4PXb7vXYU6YOP$mLSr7VRYaMPFjHJ+8ZqYJ1O5bQLfbz2A8CD5w2JRBBs=',NULL,0,'mahasiswa012','Rizki','Pratama Maulana','rizki.maulana92@outlook.com',0,1,'2025-10-22 19:51:02.187194'),
(35,'pbkdf2_sha256$1000000$aW6I976HYy0cqHgsLjefng$GqrrMTFJrxH8aOa9V6icBPt3xHdITOjc3fYSMGgXnXk=',NULL,0,'mahasiswa013','Indah','Mahendra Anggraini','indah.anggraini61@yahoo.com',0,1,'2025-10-22 19:51:03.570613'),
(36,'pbkdf2_sha256$1000000$zJnJKhBRyGNZoro8LseRxY$XFJ3Q9LtXJvsZCeId3oGBRkmx9vJ5Em58bATyK5jppM=',NULL,0,'mahasiswa014','Doni','Adhi Susanti','doni.susanti42@outlook.com',0,1,'2025-10-22 19:51:04.751606'),
(37,'pbkdf2_sha256$1000000$TgVTRVpqmoZVr9MY4eWhyK$HrkmjdicGddtj5Y+Sbo4yCVO4xh4ZHZb1EzfxCNQ3TA=',NULL,0,'mahasiswa015','Nadia','Perkasa Permata','nadia.permata88@student.ac.id',0,1,'2025-10-22 19:51:05.960034'),
(38,'pbkdf2_sha256$1000000$c3CUYJJSaV2ghuH8QaGGCn$5959ikIJK7s55RsQ3mQZlaUz6XoZQGcjoSoh8nQ0VQo=',NULL,0,'mahasiswa016','Sari','Setia Wijaya','sari.wijaya55@outlook.com',0,1,'2025-10-22 19:51:08.090190'),
(39,'pbkdf2_sha256$1000000$Ui3z97E1LhgHReVjToQCY4$ZE0EKEVTJwRSzgkA0xEz4mXAFUKtx8R4/3jJOpvvCUM=',NULL,0,'mahasiswa017','Reza','Pratama Fauzi','reza.fauzi33@yahoo.com',0,1,'2025-10-22 19:51:10.162429'),
(40,'pbkdf2_sha256$1000000$Ivy29z4RBK6r2RilxkPHKr$HhQ+It6h6Zd/ZARZN498nvhUzQRmqGsS3274U4iKZ/k=',NULL,0,'mahasiswa018','Arif','Anggraini','arif.anggraini48@gmail.com',0,1,'2025-10-22 19:51:12.184502'),
(41,'pbkdf2_sha256$1000000$TmVGKQ5KDxmHLxgxNAeqH2$daVgsWYNlwymitQqUjlq2uN5lp2cucwFav87puRpCZg=',NULL,0,'mahasiswa019','Rafi','Pratama Mulyadi','rafi.mulyadi60@outlook.com',0,1,'2025-10-22 19:51:14.315493'),
(42,'pbkdf2_sha256$1000000$WrSfiX7LaX3vBCzjlkAXaB$ZqZ8LNPxZNpxa4ySfIYPp7b7iHEqahyQ2Sq+WgD0AWM=',NULL,0,'mahasiswa020','Nur','Perkasa Kusnadi','nur.kusnadi26@gmail.com',0,1,'2025-10-22 19:51:15.651928'),
(43,'pbkdf2_sha256$1000000$J11xpLbKOQ8YfvtlHOfuRE$jumLfLPjFXY4TqYeqkA27s0NA9/NWWi63O8rhgYIDGg=',NULL,0,'mahasiswa021','Rahman','Adhi Permata','rahman.permata75@outlook.com',0,1,'2025-10-22 19:51:17.516039'),
(44,'pbkdf2_sha256$1000000$CnfqPdMssBG7hyuttsegmY$mPneWR19dQAN6tJkog+TuXQG/5F0TQUU0ZAGsLJUPZ8=',NULL,0,'mahasiswa022','Nadia','Mahendra Maulana','nadia.maulana31@yahoo.com',0,1,'2025-10-22 19:51:18.692582'),
(45,'pbkdf2_sha256$1000000$Oth3dYcasy37xnejRGorZD$zrPrq2zoFQ+BPQt6D/OKu20szkyWYQIydMYpDhpiVH4=',NULL,0,'mahasiswa023','Hendra','Pratama Firmansyah','hendra.firmansyah6@yahoo.com',0,1,'2025-10-22 19:51:20.061689'),
(46,'pbkdf2_sha256$1000000$dJe88BNrBcnEX2tQAq2902$Tlp2hqjHztO3oDrYHQIICdRke9fnKAmpA8ePcOBT4BA=',NULL,0,'mahasiswa024','Rizki','Perkasa Utami','rizki.utami72@outlook.com',0,1,'2025-10-22 19:51:21.170929'),
(47,'pbkdf2_sha256$1000000$OGfRg45SixLFJjizgqpHhN$ljZZjI+WWNML4fxJXJmDIkPfazZ+yIYUPlU2aaXiUKE=',NULL,0,'mahasiswa025','Rafi','Adhi Utami','rafi.utami1@student.ac.id',0,1,'2025-10-22 19:51:22.809889'),
(48,'pbkdf2_sha256$1000000$8QGVWH1RCG5PtkCIiN0RP2$QGu/zfHhfXvlOko8ZIxIo5e+aByua9QyPSo2kqDapaQ=',NULL,0,'mahasiswa026','Aulia','Cahaya Kusnadi','aulia.kusnadi48@yahoo.com',0,1,'2025-10-22 19:51:24.392769'),
(49,'pbkdf2_sha256$1000000$FSeACk54jeKsAV0Ek2qm60$IKwkZ0z5j5fQfmtdh0yYFSjlq1UmfrHbAi0QwsE7/Qw=',NULL,0,'mahasiswa027','Zahra','Setia Purnama','zahra.purnama74@gmail.com',0,1,'2025-10-22 19:51:25.876198'),
(50,'pbkdf2_sha256$1000000$bl0nqikTXfLraHonWf21XR$enGbo93VapaM7YSEs9r0rqrvELmCAA0RKA2oq6IXgEE=',NULL,0,'mahasiswa028','Putri','Pratama Kusuma','putri.kusuma41@gmail.com',0,1,'2025-10-22 19:51:27.529255'),
(51,'pbkdf2_sha256$1000000$QvGolSE11supV2FT8Ek7BJ$W+PSHiBl0m6j970puJJDO7bpsbR2ZQggjFhn3LmuSc8=',NULL,0,'mahasiswa029','Zahra','Mandala Putri','zahra.putri55@gmail.com',0,1,'2025-10-22 19:51:29.844127'),
(52,'pbkdf2_sha256$1000000$8szUXWcwNwaxK3NDQaTVbj$SjpER6gmf92y9G4X1tkVNgtOzcqYGJz75Un3/OOylQw=',NULL,0,'mahasiswa030','Fajar','Pratama Kusuma','fajar.kusuma92@student.ac.id',0,1,'2025-10-22 19:51:32.376900'),
(53,'pbkdf2_sha256$1000000$2qAHVUbVatbW2AYz2COKJg$r0h9dOWPDya0G5TC7LrWbFAH5W4opmSqOOlpcvZsZuA=','2025-10-22 21:19:09.836866',1,'test_admin','Test','Admin','test@example.com',1,1,'2025-10-22 21:19:06.751662'),
(54,'pbkdf2_sha256$1000000$31xVh8stb00o5nNIWR4Qkc$0oFJ07k/HqguLXyM+vhokanjrPg0AJNs34BOVsfQv/4=',NULL,0,'2024TI9382','Zahra','Pratama','',0,1,'2025-10-23 15:42:48.231813'),
(55,'pbkdf2_sha256$1000000$RqVRmpSOE1XMyzVENQ963Z$4ktYHiDFVPT6reoiSZuDgNcGXYUVSeKvQ0oefMMAaEY=',NULL,0,'2021TI5787','Tono','Gunawan','',0,1,'2025-10-23 15:42:49.915238'),
(56,'pbkdf2_sha256$1000000$uF5bBj320koH1k1J8lSgWA$jG4YVMWn3WbvSZTMgsrFGco6NKsOOD3qUXkaIra1rD0=',NULL,0,'2024TI5308','Tono','Maharani','',0,1,'2025-10-23 15:42:51.802162'),
(57,'pbkdf2_sha256$1000000$TA0O3GQ7IeEypjnm9XqTul$0+WI35xtysNLOZTKjJ5bEEK18OYeHulPFCUfI0CIdfM=',NULL,0,'2021TI7026','Agus','Wibowo','',0,1,'2025-10-23 15:42:53.409178'),
(58,'pbkdf2_sha256$1000000$Rxp1UeTCu5HvrwPjQSy0nU$a6m5mEPgpXQfwpcDedfNCYuVLNtc90Hdt7Ge/4EV6l8=',NULL,0,'2021TI3332','Pandu','Putra','',0,1,'2025-10-23 15:42:54.667355'),
(59,'pbkdf2_sha256$1000000$dkJUEI9ff05JBwZykRW5VS$DWShXbcgFEqdEttDzK57dXQ79yYHFlNW+UF2UfUd17M=',NULL,0,'2020TI2453','Lina','Hidayat','',0,1,'2025-10-23 15:42:56.059533'),
(60,'pbkdf2_sha256$1000000$VFRhRxd8J3F5d33iw1HNm7$b6oDDGQCkmk6XpqjLJ5WUGwrDDSAHj89U+SK+hfGr+g=',NULL,0,'2021TI2512','Gita','Subagyo','',0,1,'2025-10-23 15:42:58.113504'),
(61,'pbkdf2_sha256$1000000$QvzDGNirsBH2XF51lTxpPI$vRZyTgV7amgqru2AK6Qem/RZjh6wnWAAJivQIPdaSA0=',NULL,0,'2024TI1436','Maya','Setiawan','',0,1,'2025-10-23 15:43:00.110997'),
(62,'pbkdf2_sha256$1000000$SGwnltoF75GAErqcM6KEvx$MVXs9CbuDY7Gjmjru8vNIsA0H5pZX99rY53419EBtRc=',NULL,0,'2022TI4529','Rendi','Lestari','',0,1,'2025-10-23 15:43:02.642123'),
(63,'pbkdf2_sha256$1000000$lAy71LJXm2IAibS63wCWIX$+uF+J6Gj2AS3yX1CebYTo0mCAtbHBn4ueCq9+CuC8Xg=',NULL,0,'2020TI4067','Tina','Setiawan','',0,1,'2025-10-23 15:43:04.396760'),
(64,'pbkdf2_sha256$1000000$r9oECdvmYCOeDU0PWvaYMX$zohLFtu4c+DEg9t1zWR1hzSEBeTtoN6Kk4ggupL0tWs=',NULL,0,'2022TI6820','Dian','Hakim','',0,1,'2025-10-23 15:43:06.712234'),
(65,'pbkdf2_sha256$1000000$L23MVaCJkcZF9dQOruSZib$Q0YsF/NgstneuNHL/RygawV1fa2Gz0aeJQA5ZJ8dKqY=',NULL,0,'2021TI4325','Lina','Hidayat','',0,1,'2025-10-23 15:43:08.839334'),
(66,'pbkdf2_sha256$1000000$tyCc7Bh4uZ95E3q6CQfIl1$4O6vfjsL3mj9BmC76d/tFRyCouMBSbcRejXHrcFxer4=',NULL,0,'2023TI3818','Citra','Gunawan','',0,1,'2025-10-23 15:43:10.583663'),
(67,'pbkdf2_sha256$1000000$NBC8oE3nLTzUYeBzZC6Hsm$zrgho1AFCD5IVcVm1eBWt7uz3rtDH3yp3DvJcYCS8Qk=',NULL,0,'2023TI5094','Tina','Hartono','',0,1,'2025-10-23 15:43:12.552130'),
(68,'pbkdf2_sha256$1000000$o6ns1qBxCS94DbkB4GcS6q$SWwd/eooNmYbWzMUK+RzykF7zLdhZGQnT8MguZHwr70=',NULL,0,'2021TI9407','Tono','Wibowo','',0,1,'2025-10-23 15:43:13.856380'),
(69,'pbkdf2_sha256$1000000$ciQU7UZ7BGjaLq2e0Q6puM$g9a3Qs6+j3EgkBYzAgzzQjIn6D9R/rLKLd7aFjHiR8o=',NULL,0,'2021TI2380','Umar','Putra','',0,1,'2025-10-23 15:43:16.234519'),
(70,'pbkdf2_sha256$1000000$xsYNmr51fp7TyJpfmQukBN$F5XUuytggpOvmzvg6LbSLJHF7l6KSZHizDl01AkWVys=',NULL,0,'2022TI4823','Bayu','Putra','',0,1,'2025-10-23 15:43:18.482381'),
(71,'pbkdf2_sha256$1000000$hcJrVHjuzWZFClze70cLcc$ITOl4UjRR6xfgHzcq0FmqZDMNUL7S/GTGF8oofq/iYg=',NULL,0,'2022TI5816','Nina','Wibowo','',0,1,'2025-10-23 15:43:20.357428'),
(72,'pbkdf2_sha256$1000000$ne4oiMMy0NOo97DQTHCuIE$/9wU+6BcypMaN0imK+BEiMPEfjuIg5nLm1pdmmNchtw=',NULL,0,'2021TI7365','Kiki','Kusuma','',0,1,'2025-10-23 15:43:22.257534'),
(73,'pbkdf2_sha256$1000000$oz64P3JRs5wbhJVTAeCPC2$oUc3EojHZ3RiIaWclWUadJ7a/EKCS5MCtpFIEUSnR7k=',NULL,0,'2024TI4434','Kiki','Wibowo','',0,1,'2025-10-23 15:43:24.575201'),
(74,'pbkdf2_sha256$1000000$F9rYH8Ql6cIivnnqd5jb0J$NsxqO95LJgsjavdZlKq6AdSBu68VJmaAwAA5VS5gB74=',NULL,0,'2022TI1440','Fitri','Susanto','',0,1,'2025-10-23 15:43:26.983490'),
(75,'pbkdf2_sha256$1000000$h4Q0UbC40TkYhrQrsBy0QQ$Vycs6uom4QelGPn/QSZOlkEsS3IliMymxV0cK4nuHbw=',NULL,0,'2021TI5135','Ahmad','Utomo','',0,1,'2025-10-23 15:43:28.925088'),
(76,'pbkdf2_sha256$1000000$fYZQu2q8iJhc2pFLvbnzxr$er3aOq9hLWqyhiFU1C+c8/vF/foqmT5WmPKeOJ9HtJw=',NULL,0,'2021TI1055','Oki','Hartono','',0,1,'2025-10-23 15:43:31.114195'),
(77,'pbkdf2_sha256$1000000$T30FVq8ScK9dBsmfjmbK0X$peYB6pLa1vBwLFpiiXJ1phaNevLib0ILRMb8nPZ29BU=',NULL,0,'2020TI8459','Indah','Utomo','',0,1,'2025-10-23 15:43:32.995090'),
(78,'pbkdf2_sha256$1000000$xxhFPutbn4krEK07WAlUoC$+uqZaLAdqWZzhvVlWCc4G6rEuyBNCQLrw9aQHcRhYZQ=',NULL,0,'2024TI3470','Maya','Utomo','',0,1,'2025-10-23 15:43:35.246873'),
(79,'pbkdf2_sha256$1000000$iAA7vJFa8nghfKLfPRIkRs$qKklLpHA1GSbfGK8+rB46VBjQFrOWYpINsbIYk+u3As=',NULL,0,'2020TI6338','Fajar','Sari','',0,1,'2025-10-23 15:43:37.298442'),
(80,'pbkdf2_sha256$1000000$LYgMbdfYVF5wX5zGCWzBV5$moPCzr178rFEafBixWER8IszpdLB3pt8ct3tqtKyJmc=',NULL,0,'2020TI4553','Agus','Wijaya','',0,1,'2025-10-23 15:43:39.846453'),
(81,'pbkdf2_sha256$1000000$I8fun2l10HbRUt75IP1O9l$OEO+JGRzXnP9oWLNP0IcsvHxlzZNvLKx7fRyvykX4wE=',NULL,0,'2024TI1347','Lisa','Kusuma','',0,1,'2025-10-23 15:43:41.234485'),
(82,'pbkdf2_sha256$1000000$BG4e2OJhaspVOJBK3wtSYG$O6yBauuGC/cFFM/f9FML2q0ufpdAPSo/iWIMERfOrlM=',NULL,0,'2023TI7463','Tina','Rahayu','',0,1,'2025-10-23 15:43:43.074837'),
(83,'pbkdf2_sha256$1000000$YG0NekwxRpnGtah7oA4hiT$6eWo5pRfCDUMzSTBFBlT52u85d27cqZm8I1PWcaH/ls=',NULL,0,'2024TI6898','Candra','Hidayat','',0,1,'2025-10-23 15:43:44.827224'),
(84,'pbkdf2_sha256$1000000$51gflZCrNqdfVdocbuBuIf$FnNWKmYQDiwz6knKP5ZHqhgeGa0k0YUI0im2h/fmpFg=',NULL,0,'2020TI3156','Citra','Kusuma','',0,1,'2025-10-23 15:43:46.241021'),
(85,'pbkdf2_sha256$1000000$xjsBPHrTfhxnqBSKVcMdmk$lvHutMLlPdFpSe/GLDePsvhTNQWEQeQQ2AqY6/jTeAo=',NULL,0,'2024TI4831','Jaya','Hidayat','',0,1,'2025-10-23 15:43:48.631692'),
(86,'pbkdf2_sha256$1000000$TiS1ZceQTUA7IvWmukjSWT$ewykqPauTV16R4N9mA6pRY//7kjnI0otILO/IIfdyr4=',NULL,0,'2021TI2008','Sari','Putra','',0,1,'2025-10-23 15:43:51.232986'),
(87,'pbkdf2_sha256$1000000$rVtEew33CuWLBZzJmHqfXY$vh7JrVVdF7gZSh+COyu0EkbPqRfUXLx/TRgH5S5Pu/U=',NULL,0,'2021TI1182','Evi','Setiawan','',0,1,'2025-10-23 15:43:53.381620'),
(88,'pbkdf2_sha256$1000000$uPtntVZGmk0g6APyJF9mIx$+PMBfemwBU67TnS62gR5drgxRXl+0NAIE3UrcrCMzss=',NULL,0,'2024TI4365','Putri','Kurniawan','',0,1,'2025-10-23 15:43:54.776037'),
(89,'pbkdf2_sha256$1000000$Z1QIp1fESyjs9UU1UYiIRT$d59LOg/EinUqiFXgL2GsU+xgj1bPv+7yysUR2pP6Z+4=',NULL,0,'2022TI5438','Fitri','Prabowo','',0,1,'2025-10-23 15:43:56.394339'),
(90,'pbkdf2_sha256$1000000$nSKme4rjaQwBaSIXEKZbSX$OIeDBntVFiBt63dWVphsnMQ32ypRROSfYJInJfFUWPw=',NULL,0,'2020TI1599','Evi','Saputra','',0,1,'2025-10-23 15:43:57.870455'),
(91,'pbkdf2_sha256$1000000$bIavRk4b7eqPu7FHsKBtyC$TrJdDD6Rx4XcyGMPeK3qRuBYB9uxX+Ai/CJH4WmsGeg=',NULL,0,'2020TI5229','Wawan','Susanto','',0,1,'2025-10-23 15:43:59.907381'),
(92,'pbkdf2_sha256$1000000$1bsu4MCFLRpqaa1vZkbpRH$mhzpwsFyR0FldqbpX/gWyXunj2QgustDddLEe35NQrs=',NULL,0,'2022TI2318','Yanti','Permana','',0,1,'2025-10-23 15:44:02.096469'),
(93,'pbkdf2_sha256$1000000$2SHH1rSjcwpYm1hAHKKCuX$4oX1ko6NKXDgLf0ePu4+IhejfIJGAMaqkiBBAqUOUFA=',NULL,0,'2024TI5943','Siti','Subagyo','',0,1,'2025-10-23 15:44:03.424107'),
(94,'pbkdf2_sha256$1000000$hJI5100wM3KLT3JD4RHMTa$bH8mYRnbLyjV9tOdoiNprI/vHscklzYgPgiRm3t1QDA=',NULL,0,'2024TI2861','Candra','Nugroho','',0,1,'2025-10-23 15:44:05.184807'),
(95,'pbkdf2_sha256$1000000$80hPCFlRxWJGq1j8YErdQQ$NfNryWEntCWDDLh+s5VnxUk/wQUe9GjlOYoaYqmJp2I=',NULL,0,'2023TI1665','Lisa','Subagyo','',0,1,'2025-10-23 15:44:07.358011'),
(96,'pbkdf2_sha256$1000000$kVW8CKOpBT1s7Rt9dbYhmZ$NGnAuKTb29hF6K50kvcdaCSPMLz/t21R+r/OuGnmm/s=',NULL,0,'2021TI7540','Tono','Subagyo','',0,1,'2025-10-23 15:44:09.432278'),
(97,'pbkdf2_sha256$1000000$PAELIIFXPz0kW5p1DKWnL2$oJulwtdmJvEOUCWBjca6b2wQa2ahXrI2Y6MGWgD9boI=',NULL,0,'2022TI4594','Evi','Setiawan','',0,1,'2025-10-23 15:44:11.950167'),
(98,'pbkdf2_sha256$1000000$2u9J8mJLqev4yALO25lzoT$Ho1S5DyI1HhIkE/z8EieTK7Rsg3iD6roifeQWn/lG8s=',NULL,0,'2022SI8169','Eko','Putra','',0,1,'2025-10-23 15:44:13.771422'),
(99,'pbkdf2_sha256$1000000$laqujDgj8KrYmFaeL1fGTA$w0ZrrR2hHRM5Gu7SFz/ZvGoy2K0/1hz/fE5QgRfqNoM=',NULL,0,'2024SI2312','Agus','Saputra','',0,1,'2025-10-23 15:44:15.190659'),
(100,'pbkdf2_sha256$1000000$fHzq2wiwOb7aaonxVrbbZD$E6lhNLRijLuyX+1Acc1WQIvuQWyJwI6tnkPZCE4OdvA=',NULL,0,'2021SI8472','Fajar','Putra','',0,1,'2025-10-23 15:44:17.327130'),
(101,'pbkdf2_sha256$1000000$KRkjwRFgckyBtimQDtF5an$0wneA0AJF7soeRWZ0xHOoJmY9jejUGcMSTHco9w6O7Y=',NULL,0,'2020SI4124','Rendi','Putra','',0,1,'2025-10-23 15:44:18.993341'),
(102,'pbkdf2_sha256$1000000$25SUknsbpSliRGdYZQlZzZ$bMQgwok5X1sKI03X/0IImH8Ma4qVFnSTAFiNm3c5kxE=',NULL,0,'2023SI8791','Fitri','Saputra','',0,1,'2025-10-23 15:44:20.897277'),
(103,'pbkdf2_sha256$1000000$W4l9oPvab4tQxcOuzQA3LW$JySstOAnW2fzTqu1ne1ueXNGDGvBnHSwTa0fdK/sL+E=',NULL,0,'2020SI6721','Kiki','Setiawan','',0,1,'2025-10-23 15:44:23.163017'),
(104,'pbkdf2_sha256$1000000$83Jz4TsU7GJJH9i0fsm8sO$YoDR+J1dVmmtbxU2Wi6NV/JpCesen8Y/BGrrvNtSYEQ=',NULL,0,'2022SI4404','Jaya','Subagyo','',0,1,'2025-10-23 15:44:24.565620'),
(105,'pbkdf2_sha256$1000000$MgTSetF9AWfm4KeAHPYH62$fRjaGtNko1VaFMZnPXDRXlcZ3mO24MWXmw3uQqMRJCo=',NULL,0,'2023SI8052','Rendi','Kusuma','',0,1,'2025-10-23 15:44:26.206271'),
(106,'pbkdf2_sha256$1000000$0mvpa4mitslEDk9AEaJOxZ$5GC44KIGbUb/C+SusEqOHHQ4rihSERJZAQt8j2yeeM4=',NULL,0,'2023SI2561','Hendra','Kurniawan','',0,1,'2025-10-23 15:44:28.056061'),
(107,'pbkdf2_sha256$1000000$hUEzDO6ieyt4Ac4zay5Dbb$lZJI4lJJrHbdohdvMClkemyvEyJtMhRE5ehxR13eGhs=',NULL,0,'2021SI6112','Fajar','Hartono','',0,1,'2025-10-23 15:44:30.579013'),
(108,'pbkdf2_sha256$1000000$SXmKcFIypDJpjZ2mI4Iprk$dPb+C9AQsxwR+4V5pd5S4eH51iRRNLyPQevfxNYwmec=',NULL,0,'2023SI8640','Hendra','Gunawan','',0,1,'2025-10-23 15:44:32.013896'),
(109,'pbkdf2_sha256$1000000$xSOFFs7zjuurLclwxmlHB5$pvMhaH+hYTPNyGCZMcCyfKo4VDplYm6qCbbwaPQWGLg=',NULL,0,'2023SI7713','Fitri','Susanto','',0,1,'2025-10-23 15:44:33.816719'),
(110,'pbkdf2_sha256$1000000$Va8D0rQ8pD0toGdd0H2Hzm$UWCuYRkbn7egg7gFGzTTY3x2dComkfECqt5vdLrJC6I=',NULL,0,'2020SI8245','Kiki','Rahayu','',0,1,'2025-10-23 15:44:36.058642'),
(111,'pbkdf2_sha256$1000000$ADkYRJiJF02CyRbPBd1CdQ$ao2nK72GzdOTLh0gqgV2YyS85Yhls31V7rIbbxzBsF0=',NULL,0,'2020SI7745','Hadi','Hartono','',0,1,'2025-10-23 15:44:38.123340'),
(112,'pbkdf2_sha256$1000000$CKbrNuuX5zXk7taubsaLF1$8TqsZ44clHPx+J1/vr1UtEf9UyoitFkmVJNVz5wFG7c=',NULL,0,'2022SI7602','Zahra','Hakim','',0,1,'2025-10-23 15:44:40.264824'),
(113,'pbkdf2_sha256$1000000$fF0Bnc9ODOrXFazRdIIJks$BSBxsTg6osmJvElMgwPBxp/uvH7y2n9lwg48UpbnQTI=',NULL,0,'2023SI6771','Qori','Santoso','',0,1,'2025-10-23 15:44:42.568625'),
(114,'pbkdf2_sha256$1000000$B6LldKg0e4LkRccMyjwWLD$cZ6X9kKkAfx6ZTLwNsJUKi+jdcduffSjfVpB9oCbgu4=',NULL,0,'2023SI3381','Oki','Wibowo','',0,1,'2025-10-23 15:44:44.555816'),
(115,'pbkdf2_sha256$1000000$ODM48g5c96FUvyN6MRtrmm$yULde5X2k9iaMLkgESBDmOyvcfWXwcatojVQB4Pl9T0=',NULL,0,'2021SI4245','Vita','Pratama','',0,1,'2025-10-23 15:44:46.817356'),
(116,'pbkdf2_sha256$1000000$XtMhd0o7rc9uMZYw3hryg4$HF3SzHsFhMJOzoV9Voxv/GMApORQtnLmOPcv8eAdE/g=',NULL,0,'2020SI4032','Budi','Wibowo','',0,1,'2025-10-23 15:44:48.819358'),
(117,'pbkdf2_sha256$1000000$Jf5GQ6fYIC5h5Zr4gWhNZk$nf84lsqA6lEdmruY/UC12aR/pJ5et5kL2X5ljeiYJn0=',NULL,0,'2024SI9883','Umi','Rahayu','',0,1,'2025-10-23 15:44:51.042407'),
(118,'pbkdf2_sha256$1000000$Ko3rB1IbkotyjjMJsafoEe$L36z5cioBkKnup4vc14NofgGIXby/BCKBgs+EzLYqzc=',NULL,0,'2020SI9682','Nani','Sari','',0,1,'2025-10-23 15:44:52.996199'),
(119,'pbkdf2_sha256$1000000$CU9ZOLyMK02M7pLdBOvQws$RCc7KmZ2Jet5WrJZUcgsrd68Okdzs/omT7UFWpV4GtI=',NULL,0,'2022SI8085','Umar','Rahayu','',0,1,'2025-10-23 15:44:54.076371'),
(120,'pbkdf2_sha256$1000000$DGXfgoupPZFDmsIKFXUlWG$YtRy9ZR2xiFBdkGiGEVRRIy+EJ/0x67SevNYr3t6rco=',NULL,0,'2023SI5160','Kartika','Wibowo','',0,1,'2025-10-23 15:44:55.473799'),
(121,'pbkdf2_sha256$1000000$7Lss6IxGbTOXRAOiRzjl0A$wg67CkWUEM+zGfXcxYW/4OBtKPLIleozQva+L1UB7vE=',NULL,0,'2024SI8418','Siti','Hidayat','',0,1,'2025-10-23 15:44:57.125508'),
(122,'pbkdf2_sha256$1000000$oTigL4jAPVLMILzOfsnUd8$/bk/FAZUkhGYIUD3CEMqfpKrfC0FybThluaI6ve05A0=',NULL,0,'2022SI2847','Dian','Hakim','',0,1,'2025-10-23 15:44:59.205076'),
(123,'pbkdf2_sha256$1000000$pB0RDm9xh2b11VsPzxoHMQ$vIt3DkueAlvypGJuLkBQQFP3A4bZeyDXd8RAm4nCVC0=',NULL,0,'2021SI6538','Vita','Putra','',0,1,'2025-10-23 15:45:00.641335'),
(124,'pbkdf2_sha256$1000000$6vlRpnslt7UxKLL96Me2n1$oBwvASfFHUO0WgMTD2MudYF7cJIMPVRWpJE9aa0X9hU=',NULL,0,'2022SI4817','Tono','Setiawan','',0,1,'2025-10-23 15:45:02.461649'),
(125,'pbkdf2_sha256$1000000$Op1cWTuEPUySfBwhOJFbpY$j1MixW5s9bh4jpMAlXE8glZPZYkmf95DU0V+c1JzgNo=',NULL,0,'2020SI3211','Rendi','Subagyo','',0,1,'2025-10-23 15:45:03.537816'),
(126,'pbkdf2_sha256$1000000$nMvxDDfDzBhIB18TRv4ffD$m/HOXdM31Q3SsHlyJZmgu/EUU+IPAHwkkW8SSgzh9vI=',NULL,0,'2022SI8697','Gita','Prabowo','',0,1,'2025-10-23 15:45:05.008596'),
(127,'pbkdf2_sha256$1000000$7MOxTp2L5xraIK80xeWO2A$KR+8MHXanXi7I3yLOffSvLUXp2Ljk0KFg7J5b8zaypY=',NULL,0,'2022SI8597','Jaya','Santoso','',0,1,'2025-10-23 15:45:06.164943'),
(128,'pbkdf2_sha256$1000000$CjiWqQRmPS6WgNuVJq2RV8$KCfpa3h1sCESE8NnIj9wMFJtRI6b8RPjAGb6r7+DpdQ=',NULL,0,'2023SI6783','Dian','Santoso','',0,1,'2025-10-23 15:45:07.846966'),
(129,'pbkdf2_sha256$1000000$zst049O5v9XbrVkVELpja9$4/tM/t9YetXvBlalJn3H0dBdZy0nrNSGBG3JTC5KMtI=',NULL,0,'2021SI6321','Wawan','Nugroho','',0,1,'2025-10-23 15:45:09.252863'),
(130,'pbkdf2_sha256$1000000$MhL7njcqWTLTYDIryRaDho$ODv6CShHnogQxIZJYudpQQeiYBYMvRF2IyX9WS9vf6Y=',NULL,0,'2021SI6729','Bayu','Lestari','',0,1,'2025-10-23 15:45:11.256075'),
(131,'pbkdf2_sha256$1000000$1Yy4jkbPfRbBdVLx3Pp7dc$dkF6aWlM7D+hKqC9VwBFNWl4ucG4FbizfW4g7GOy/K0=',NULL,0,'2024SI4642','Umi','Sari','',0,1,'2025-10-23 15:45:13.553513'),
(132,'pbkdf2_sha256$1000000$bjbxU2YRSOzQJak5nKoL0G$+AGn+JGQfYeJrjHsok66nN+L9rJTINVnrD/+kUa3Obk=',NULL,0,'2022SI5108','Ratna','Santoso','',0,1,'2025-10-23 15:45:15.231129'),
(133,'pbkdf2_sha256$1000000$Zqgz2CQzhJ9ULQKpw2IB02$Ite+/qPSPFI5xJxfGbsGBrHk5CtCIxRIKQzOnMwhoAo=',NULL,0,'2022SI3767','Sari','Permana','',0,1,'2025-10-23 15:45:17.067344'),
(134,'pbkdf2_sha256$1000000$goEuiENjlEugn2rsJiBbRn$LPM2B+28Y/Gv4rwL4pCxX7tm5Gx7nHY5n7hhab9uhFo=',NULL,0,'2022SI6240','Zahra','Firmansyah','',0,1,'2025-10-23 15:45:19.505294'),
(135,'pbkdf2_sha256$1000000$PHqS82TwPmokkr25SkIRLO$ulTYNEPn5P+8zOttxDeTXtpwjlbEwigkDn1orvhZoxo=',NULL,0,'2020SI2945','Maya','Utomo','',0,1,'2025-10-23 15:45:21.902655'),
(136,'pbkdf2_sha256$1000000$7nuJVL3MCDBB7YxRNfFy1p$19Qlwet3C/Z8nJal+OjNo9CXg/11sMAYboKLqtZD93U=',NULL,0,'2022SI9545','Oscar','Susanto','',0,1,'2025-10-23 15:45:23.160217'),
(137,'pbkdf2_sha256$1000000$2z76dyq6ie8K5KIHgc6my8$cIwX0UE05uS5L+D65x8GpW9sKBMqssM3DVPFzCvk5BI=',NULL,0,'2021SI7174','Joko','Saputra','',0,1,'2025-10-23 15:45:25.024923'),
(138,'pbkdf2_sha256$1000000$dcRnS7UdCeJoX2Kz23DAtt$b3dUWZLRiH802+tw18tcwBkDKOQAiHn0hl7JQE0KVGM=',NULL,0,'2022TE1725','Bayu','Sari','',0,1,'2025-10-23 15:45:26.719258'),
(139,'pbkdf2_sha256$1000000$E7zv4NqeY0BXcGmNYj8IVJ$bQlPz58CLJSkkLO3DPjLpVbkfSRQc5y8Y7deRZxY+TA=',NULL,0,'2021TE2036','Indah','Lestari','',0,1,'2025-10-23 15:45:28.534558'),
(140,'pbkdf2_sha256$1000000$s7rZoMQxXXUi2CcThaUzkZ$XAAa0e59Ahn93h/PkcnIGRk7tcLzZW6TBHP4gkQDMSo=',NULL,0,'2020TE6495','Wawan','Setiawan','',0,1,'2025-10-23 15:45:30.406897'),
(141,'pbkdf2_sha256$1000000$c1fsFMWv76ATkkXiFiM16f$mke+LeoQOnEwWhH8fimQx0/eD/KDrPB7IQ5loFGNkIQ=',NULL,0,'2023TE8584','Wawan','Hidayat','',0,1,'2025-10-23 15:45:32.996950'),
(142,'pbkdf2_sha256$1000000$vbJfseyAceafPVjST7bO1o$MHaFMM+1m/J94QP2djHn9hAZia2SdtoVuU2xRbGZNvk=',NULL,0,'2022TE3686','Gita','Saputra','',0,1,'2025-10-23 15:45:35.602954'),
(143,'pbkdf2_sha256$1000000$I0nL14KSLvubHfUbdr2WSZ$aHDU2zr8ZWM9Ve82uS1GV55l943oU5JGCI/SwX8N3us=',NULL,0,'2023TE1265','Indah','Prabowo','',0,1,'2025-10-23 15:45:37.411365'),
(144,'pbkdf2_sha256$1000000$2JHeW1rKXeeuMvzlmuO9r5$AT4hzXUbtnWlYO4PSJTUZ2XJbs9iTmOBPsXtRA2/IC0=',NULL,0,'2022TE5320','Dian','Subagyo','',0,1,'2025-10-23 15:45:39.200094'),
(145,'pbkdf2_sha256$1000000$AQr3cWxUoHZYNh4c1ev22n$fWmO0nyErcs6qL5Ph2l5eEz65NJ+zoNONhOVH/DM/M4=',NULL,0,'2020TE2252','Jaya','Utomo','',0,1,'2025-10-23 15:45:40.329331'),
(146,'pbkdf2_sha256$1000000$HdBfCG3p0ZTZCI2fuw1bjs$ivkN39LkR3ke8qpuMr2W3Tsymv1my9EkOOw78Grbo3E=',NULL,0,'2024TE9730','Ratna','Hidayat','',0,1,'2025-10-23 15:45:42.415495'),
(147,'pbkdf2_sha256$1000000$TO6Evk57beiNslNEKkivf8$f+H/hJ8d9RdDJYKW/2vD6bMZv4DsLk/pL9V9lQFH6vE=',NULL,0,'2023TE1286','Ratna','Sari','',0,1,'2025-10-23 15:45:44.523681'),
(148,'pbkdf2_sha256$1000000$TtiS6Pr7SYu9fc4Ex7SM9H$xBBIKg7U0gbhz08KBr42WtEAiHe3OiAvNfmdHMeTAYY=',NULL,0,'2020TE7898','Bayu','Setiawan','',0,1,'2025-10-23 15:45:46.443330'),
(149,'pbkdf2_sha256$1000000$svEnN8ff5rLKDQInw6UJxp$UZZvp+6knl+KoCNWn45Ao7d43LDZU8j8V04+j+hnJ8Q=',NULL,0,'2024TE8333','Yudi','Hartono','',0,1,'2025-10-23 15:45:47.593359'),
(150,'pbkdf2_sha256$1000000$m480al1rAmPL9QLGkajUGZ$y/v95/mW/RQCCEmWjJx/H9M+10Qw8hwYXeGbkENQpEM=',NULL,0,'2020TE7653','Hadi','Hakim','',0,1,'2025-10-23 15:45:48.862794'),
(151,'pbkdf2_sha256$1000000$VWwp1JVLLIxjFA1FTJTTYx$Y6n+FkQ4xaSFfaCdKwMR5j5XyGQO+m4rnwHhrfu3Sv8=',NULL,0,'2024TE2454','Candra','Rahayu','',0,1,'2025-10-23 15:45:50.668075'),
(152,'pbkdf2_sha256$1000000$EZK8AyJYFqJPUg3hcZXFkl$djwiAJ/cjJycuWVpd01ZSiijaKbZaL/KWNXS6WN6Xnw=',NULL,0,'2024TE8683','Nani','Kusuma','',0,1,'2025-10-23 15:45:52.902295'),
(153,'pbkdf2_sha256$1000000$K0GL0c0bZpxYkRnIUUVfVd$6gRttj0K7tywmIrRHZx0cGZCuLtsTGDVLbLkn4pM6pY=',NULL,0,'2024TE5497','Kiki','Permana','',0,1,'2025-10-23 15:45:54.191866'),
(154,'pbkdf2_sha256$1000000$UUh21FMuvQWfjV66K1BKQS$Jkz49lUJEvDQIoia6tyq9YZlWOSUx3HH6GWvUorYv6I=',NULL,0,'2022TE8898','Pandu','Kusuma','',0,1,'2025-10-23 15:45:55.647554'),
(155,'pbkdf2_sha256$1000000$LOnyj6cx7yjr7GXMmh4pCD$3A6eg/J4o0f3UbnftvZ2F9pEC9fzvBc0hd64xArWcrM=',NULL,0,'2021TE1649','Dian','Rahayu','',0,1,'2025-10-23 15:45:57.916133'),
(156,'pbkdf2_sha256$1000000$Tr3BIdyGBhG7UC4C1PMjqg$0/ZWRLP4jn6vVgboGembGE1aVjerDcYej0A4o1xAZrY=',NULL,0,'2024TE5905','Kiki','Rahayu','',0,1,'2025-10-23 15:45:59.863102'),
(157,'pbkdf2_sha256$1000000$zQzgOZR0zGMlxI06Az6zTs$bL51In6bzJN0l6gQHJqc9GDSVC6w48CqWUe3jVF9RKc=',NULL,0,'2021TE9048','Indah','Hakim','',0,1,'2025-10-23 15:46:02.091329'),
(158,'pbkdf2_sha256$1000000$KRwptvDnjmEmQVYyujzKQa$ZnMiL0zJ2A+FgaGbrhXGEZaYeX85r32exweIKk3lRkM=',NULL,0,'2022TE6222','Jaya','Putra','',0,1,'2025-10-23 15:46:04.089896'),
(159,'pbkdf2_sha256$1000000$khB4oA3Mmw9excEBZH2M6H$9IZNM3xhB+OlsTXLONh9Qz/spEYn6Xo8walJOADdzeg=',NULL,0,'2021TE4718','Candra','Permana','',0,1,'2025-10-23 15:46:05.572726'),
(160,'pbkdf2_sha256$1000000$ZF60RKBnsysbQUxZkinBIB$O/lCs8zGQlPmkT13hrM8fi/uCzBdze7fBLpzV5dX4us=',NULL,0,'2021TE5304','Yudi','Prabowo','',0,1,'2025-10-23 15:46:07.157592'),
(161,'pbkdf2_sha256$1000000$5nQxHnYAw1Yypc4BZJfSXM$wtaqjixxDDnY4ODflFeePqqEL7hw9DIi/+ipBFtHPIU=',NULL,0,'2020TE5280','Evi','Firmansyah','',0,1,'2025-10-23 15:46:09.108160'),
(162,'pbkdf2_sha256$1000000$zVyojSw2iGNQDs4cMMCx3j$FzbqauvHj71KY9Qq6Jbv1KTdNsRYAv/8WJhB7yi/4TA=',NULL,0,'2020TE1853','Lina','Firmansyah','',0,1,'2025-10-23 15:46:10.837197'),
(163,'pbkdf2_sha256$1000000$nLXK8DDudos1k2dmv40rmj$L1HeYjLKPIaJ97Lh+raS0HKPxAY0VJBRbYLi7ndrpVg=',NULL,0,'2021TE2392','Vina','Firmansyah','',0,1,'2025-10-23 15:46:12.465929'),
(164,'pbkdf2_sha256$1000000$3M4Bn7OUTOLEzuC6BCWDwr$VOOifYU45wiPJDnN/JVa1Mjojs1pfeOIjNdaJYP8O/o=',NULL,0,'2024TE6300','Nani','Prabowo','',0,1,'2025-10-23 15:46:14.159670'),
(165,'pbkdf2_sha256$1000000$qktZaDyW9c8phF7YkBVyhf$4TpGJHcfo26nBXdnyq8NflNzYAtDx/LQlxm3SAS/z1A=',NULL,0,'2021TE7661','Umar','Sari','',0,1,'2025-10-23 15:46:16.180129'),
(166,'pbkdf2_sha256$1000000$1tgOJjIrFMhZUFxeetM36A$d7/rwAPElVE5XT9CpverMjj/2wCW26tR+7ClDFGvpp0=',NULL,0,'2023TE8517','Citra','Kusuma','',0,1,'2025-10-23 15:46:17.361756'),
(167,'pbkdf2_sha256$1000000$K4VC6eRTF2CnRURY66aNcu$JuKPDMAS3+0T6NuJ+mUsdR9Avxr/qZuqAUc53R3L1mA=',NULL,0,'2021TM4113','Budi','Santoso','',0,1,'2025-10-23 15:46:18.704393'),
(168,'pbkdf2_sha256$1000000$d1wWz7K1DkLXuj07sFtwNr$3uxFqfOIYSbQioeiQTQVej5pYFd0K9YtpykAIbYF9bE=',NULL,0,'2021TM9864','Dian','Hakim','',0,1,'2025-10-23 15:46:20.148873'),
(169,'pbkdf2_sha256$1000000$mk5S2HRoDRgmwmEWx92Ky9$WP655C98gcJG4zctBHzvDEH3Nke9Bv8Knk+GRK0KSvg=',NULL,0,'2021TM5085','Qori','Wibowo','',0,1,'2025-10-23 15:46:22.205201'),
(170,'pbkdf2_sha256$1000000$2PBiR4B5WGPkf41hVAwAy7$6ZLbsLIseeQZRLJqMOY6raTsAuUduMHIoUuqcYk/cCs=',NULL,0,'2021TM4748','Dewi','Putra','',0,1,'2025-10-23 15:46:24.363972'),
(171,'pbkdf2_sha256$1000000$ObeEUFYqVkcIKfN35MizCa$WFo0kFuuc2FDp1JiSmOKWf1Xs/5az+Mkj/wpf9Co1P4=',NULL,0,'2024TM2649','Indah','Firmansyah','',0,1,'2025-10-23 15:46:26.321365'),
(172,'pbkdf2_sha256$1000000$F58CGDk30sbq4mGhMsDEBH$MfEuD0Z6GhtiGBAq9MAJaebQ3hCf8qrk9dKHTFvkxAc=',NULL,0,'2021TM1027','Ahmad','Lestari','',0,1,'2025-10-23 15:46:28.514239'),
(173,'pbkdf2_sha256$1000000$MQnoFUMqZgw9uQuiHnm4Vx$HJG1qF+aWkuHwp/wz5+TeZg2iYf9g0Vy1Dj1CqS20Us=',NULL,0,'2024TM2775','Dewi','Kusuma','',0,1,'2025-10-23 15:46:30.503948'),
(174,'pbkdf2_sha256$1000000$8y5dPBY3VfrIxG47OBm2yZ$YZX8agv6K5DD83jszDbevMFjASnlivbBoGfHrVTVzZ0=',NULL,0,'2022TM4952','Tina','Putra','',0,1,'2025-10-23 15:46:31.639517'),
(175,'pbkdf2_sha256$1000000$dIAMQFxCdMjKzu3cJA8zsQ$SNCvpPIz5XbxCVdVWAYSQ9Hx/1WYS2AuWcyP5DBZ3QM=',NULL,0,'2023TM8464','Made','Hakim','',0,1,'2025-10-23 15:46:33.099540'),
(176,'pbkdf2_sha256$1000000$pdEVTe70Tk27YcVH8Lg3HN$KNfvqWTU4H+YP9toqrwcK7eW/rOTheNgkZo0bMXsPV4=',NULL,0,'2024TM8079','Oki','Kusuma','',0,1,'2025-10-23 15:46:35.128982'),
(177,'pbkdf2_sha256$1000000$sJcezKoOk4m9p0jg0yxvKT$BElasd7AQhfnDHbqo1S7MW58zAAQ45hm7Ngf7mlJ1d0=',NULL,0,'2020TM6413','Vina','Setiawan','',0,1,'2025-10-23 15:46:36.616871'),
(178,'pbkdf2_sha256$1000000$EbdHrDPyKsqdr5jMIAY2tW$53YnCj+Ghzk7waKs5JQAx6bxTWiSjQ2DGMocjcnWG4g=',NULL,0,'2023TM3683','Zaki','Prabowo','',0,1,'2025-10-23 15:46:38.627567'),
(179,'pbkdf2_sha256$1000000$fwiDhPL8vFLFpHe6UpSOWY$dTbL4n6BicviP3nMJis4+pjSLzDYylG+YCbz/Tni044=',NULL,0,'2023TM4581','Jaya','Susanto','',0,1,'2025-10-23 15:46:40.764880'),
(180,'pbkdf2_sha256$1000000$TiX3e2mAhxt5tmENUEnrfw$7BHfmPQreuB4WImP4dPHJHZHrhlpKf7qzYWGobbea/M=',NULL,0,'2020TM1509','Dewi','Kurniawan','',0,1,'2025-10-23 15:46:41.914039'),
(181,'pbkdf2_sha256$1000000$097MU7SU5Fk2D11Sdhdr7H$gkWpLIzHyP7bpuQjAVpyclihIVKXYya1XAUx1dTP5Es=',NULL,0,'2023TM7461','Ika','Santoso','',0,1,'2025-10-23 15:46:43.614181'),
(182,'pbkdf2_sha256$1000000$jlc2PO2okYQ87ZUz5mnKI0$+9YgKvxfGQ05cyC5Z+bXEfWHE7lPKyisiXbnLHjoUks=',NULL,0,'2021TM6185','Nani','Susanto','',0,1,'2025-10-23 15:46:45.995943'),
(183,'pbkdf2_sha256$1000000$pS8y28ITfYMBbxgzZDVjpV$mRBi28Jxu2EM+UyzWT5IFWxzd0YRK4DLvCNQEm3iuDE=',NULL,0,'2024TM5973','Hendra','Pratama','',0,1,'2025-10-23 15:46:47.580669'),
(184,'pbkdf2_sha256$1000000$dnQ8ajydeXB4yqMpQdDBmK$nKjaVBZk/FNhvxSan3UhfAxkOgU+JmyU4105PINjkHA=',NULL,0,'2020TM5400','Citra','Kurniawan','',0,1,'2025-10-23 15:46:49.322848'),
(185,'pbkdf2_sha256$1000000$25dvHrRgUlWpCFCsv0YDGW$qQ4pohJvnHecWyAvH+OGE/4KUYy0/DaPgEXIQIv2MzE=',NULL,0,'2021TM9086','Umi','Saputra','',0,1,'2025-10-23 15:46:51.038921'),
(186,'pbkdf2_sha256$1000000$fGrC9REnQHRorm8TMmpnuy$y6GPN0atmWpiMYuP3Gk7u44cH/fUhh9NjfPUPP5K42E=',NULL,0,'2022TM2015','Kartika','Lestari','',0,1,'2025-10-23 15:46:52.810364'),
(187,'pbkdf2_sha256$1000000$QzIGLfhTAcT1GTEDzDbKrh$6RrkiUut26/o6458fWhcQPkfS+zkz2ZDoUDT2sUAqck=',NULL,0,'2024TM9645','Maya','Nugroho','',0,1,'2025-10-23 15:46:54.689908'),
(188,'pbkdf2_sha256$1000000$8tFSdYD3F8k9RVVm3UXOgm$UTJa59sH9AAHSm9mGm/9mKU4nZGU8XPPBr+KSym8Ymg=',NULL,0,'2020TM7048','Jaya','Lestari','',0,1,'2025-10-23 15:46:56.731053'),
(189,'pbkdf2_sha256$1000000$bGEEjuTr9kCYbEEKgST6SM$PF0HWehDr3AyVThdsl0Nvdn63+qBk26uxv38N1wT9HI=',NULL,0,'2024TM3801','Putri','Lestari','',0,1,'2025-10-23 15:46:57.946252'),
(190,'pbkdf2_sha256$1000000$FOB9KrAnKlPsBClYe7LRwc$cSqpD2lBaTSuFMFk6NjUnNp0Yctdn1S1VecgsOqIEUE=',NULL,0,'2024TM9534','Eko','Hidayat','',0,1,'2025-10-23 15:46:59.340942'),
(191,'pbkdf2_sha256$1000000$vPYXcYI1rPO6rxlYEwYU2p$4+BkR+f11PxKGDsMS4scHgbyKOwDpjByHmPobaxZVE4=',NULL,0,'2024TM2035','Candra','Prabowo','',0,1,'2025-10-23 15:47:01.833090'),
(192,'pbkdf2_sha256$1000000$yWYBabx413z6hsGKCSlInN$k9UGsQOAgXdEqy1fv1k/QkhF8j9UtOKG+gAb5Ew7z1A=',NULL,0,'2022TM2586','Yanti','Saputra','',0,1,'2025-10-23 15:47:03.631018'),
(193,'pbkdf2_sha256$1000000$VbhfTFmGGl8PZ71CgxuDVc$qt3LaHNZNQec5j+QooVpXasdS37dslGkrGIhRWsX6PI=',NULL,0,'2023TM5597','Rendi','Nugroho','',0,1,'2025-10-23 15:47:04.852354'),
(194,'pbkdf2_sha256$1000000$c2f8FJFOMLcIoOSXe86pca$LP1zPWsv4Zv8oVSXE6MOv0hqrL3I5QQ7wPVntYqtVd8=',NULL,0,'2020TM3434','Fitri','Rahayu','',0,1,'2025-10-23 15:47:07.461342'),
(195,'pbkdf2_sha256$1000000$qLnjHbA2OLRGYi0pYMKJy8$vZp0eDIepj0MMxPdXcT5/YQJMde69JTyPLSc16m8SK8=',NULL,0,'2020TS9384','Zaki','Firmansyah','',0,1,'2025-10-23 15:47:09.967931'),
(196,'pbkdf2_sha256$1000000$VRYD4WjIhIAqNt1Cvlnr2k$1NYZLBKRpLk+C+ezj6PIl7R+IO7zb+hJ5mLVSE00YHw=',NULL,0,'2023TS4403','Eko','Saputra','',0,1,'2025-10-23 15:47:12.473695'),
(197,'pbkdf2_sha256$1000000$oZHAqO8NsxrttNjR6TCYNN$Cg8cjVMEyNZmoS2MeKWB0GG18VavRbQW88f02BaP6a4=',NULL,0,'2020TS4422','Fajar','Pratama','',0,1,'2025-10-23 15:47:15.067203'),
(198,'pbkdf2_sha256$1000000$jZSc71gPm8hxPYIMgQKsc5$DdcuONXyjNAkiXk5CBjcMxXzNF6NULgNLEApe5yQwx8=',NULL,0,'2022TS2818','Yudi','Hakim','',0,1,'2025-10-23 15:47:17.411458'),
(199,'pbkdf2_sha256$1000000$aWVaqfeIbqtFoic2cSC4rl$uw5aq7K5DPoEsYeVEVFtWlLcreBVVCWhhSdqTratvcc=',NULL,0,'2023TS9891','Joko','Kusuma','',0,1,'2025-10-23 15:47:19.772886'),
(200,'pbkdf2_sha256$1000000$TUJVGqw6iknRwUj5rh8qgq$7+m+yFWQrFfbrYRGdhFNGvXeUB9ikmrI6nHnUqW5U6Q=',NULL,0,'2021TS1915','Pandu','Gunawan','',0,1,'2025-10-23 15:47:21.625556'),
(201,'pbkdf2_sha256$1000000$l1CSAlMGBlyF7vIF0m3bHB$n3JLqZVe81GHZmyNXFfUhrFEam6AHr8j6JEYRlZN7sE=',NULL,0,'2021TS3148','Tono','Prabowo','',0,1,'2025-10-23 15:47:23.578307'),
(202,'pbkdf2_sha256$1000000$E4YYsy5WS82kBcFqQykpW4$IWcQhj0zDDhQGOTf/VH3eipB86EzT9uMidX1GGEQVL4=',NULL,0,'2021TS3131','Fitri','Santoso','',0,1,'2025-10-23 15:47:24.677999'),
(203,'pbkdf2_sha256$1000000$4e9zUC31dBla8yEPlWh09Y$zTuMozy1NbXDzafpLyHmnhOktPAAGO0EvTX9xMCL+Dg=',NULL,0,'2022TS1877','Eko','Pratama','',0,1,'2025-10-23 15:47:26.094944'),
(204,'pbkdf2_sha256$1000000$HXsVf1AUa0yDjTySF4YjOI$j3wyACUlYDAd3NXE1BKr6q8kRY1chJbn0lE/lackN1I=',NULL,0,'2020TS1093','Sari','Maharani','',0,1,'2025-10-23 15:47:27.724044'),
(205,'pbkdf2_sha256$1000000$wnk7ixR0HpipFXDHw6BjS7$2zeJJ89fhyR8Zg478/sO12QU7Gqdk5h9onl2CKVQUT4=',NULL,0,'2020TS6961','Zaki','Permana','',0,1,'2025-10-23 15:47:29.296368'),
(206,'pbkdf2_sha256$1000000$NhO4m61bYFUoqRMlZry0I2$buhaobVSEb+Yt7a/78c1d313vnBPxwY80R6fYMCLmjQ=',NULL,0,'2020TS4222','Rendi','Utomo','',0,1,'2025-10-23 15:47:31.449542'),
(207,'pbkdf2_sha256$1000000$sy4yvd3TNUOVQ0W7FqZBil$JWb2lAoDyPaOtMOQiQ8GmEQnriJErg6//YSZ95J1lM8=',NULL,0,'2020TS4429','Yanti','Kurniawan','',0,1,'2025-10-23 15:47:32.951243'),
(208,'pbkdf2_sha256$1000000$s13zYeFvILHPAx3lYqcVyA$f8nxoRPnhww6mNs7eUoQhI50j/nUvOeypjaOcSeQ5UM=',NULL,0,'2021TS9076','Yudi','Sari','',0,1,'2025-10-23 15:47:34.663996'),
(209,'pbkdf2_sha256$1000000$kXXo3LORVANTihsfEueuBT$0R8mflxllmMnw7Kk/pf2Hb2lcaRJOrU1sJgpf/sHKXM=',NULL,0,'2024TS7191','Made','Hidayat','',0,1,'2025-10-23 15:47:36.598824'),
(210,'pbkdf2_sha256$1000000$4KD41rZcSehDucmJXJx2PC$pfq6sW9xW1Y8vF+m7wKQlRKW9UR8rmmAxBi/qE4jq8o=',NULL,0,'2020TS7639','Tono','Kusuma','',0,1,'2025-10-23 15:47:38.657416'),
(211,'pbkdf2_sha256$1000000$NyJEDE4j2FH4Gy87FbmyyS$2VEhs+xGNeMlcGT+rZeerDYj5I/PiD7Se2xRC+fmPO8=',NULL,0,'2022TS5429','Zahra','Sari','',0,1,'2025-10-23 15:47:40.626180'),
(212,'pbkdf2_sha256$1000000$8pQlWPXtFy52tdJuaM5eHd$duHwe0FvVu4oX02EON/PvH2wfSFhnC6/8SWUv31mNpU=',NULL,0,'2021TS8833','Oki','Kurniawan','',0,1,'2025-10-23 15:47:41.951275'),
(213,'pbkdf2_sha256$1000000$rHGOjbfiPPqv7HBU6hNgc5$AtFa+jhuzRMB+24hv9hBQT79i8lJvVjgrXI1XRINZC0=',NULL,0,'2023TS5906','Putri','Wibowo','',0,1,'2025-10-23 15:47:43.533970'),
(214,'pbkdf2_sha256$1000000$zngZpSEQHA7DZDGhgDxoB6$Dqxiia8IfOUVp4AkWJj8TQIrraNh2g60q/CqySxDSUQ=',NULL,0,'2024TS4885','Kartika','Rahayu','',0,1,'2025-10-23 15:47:45.473674'),
(215,'pbkdf2_sha256$1000000$3fKnXeBz8yLDrtAP6kOP0d$sKSOjdfHzsUGyQtHB87gpqGWtU8CRztapwmUMltQ7wI=',NULL,0,'2022TS3956','Citra','Kurniawan','',0,1,'2025-10-23 15:47:46.678035'),
(216,'pbkdf2_sha256$1000000$q87jrFhsdZ61EgvSkY1Wk2$c9pIjDNBJ7HDcCthRM3fPAOUmkH9djasVuLw7eewOMI=',NULL,0,'2024TS1135','Ratna','Utomo','',0,1,'2025-10-23 15:47:48.082499'),
(217,'pbkdf2_sha256$1000000$GEo0KfYFjVg318LpTtg8XY$3/x91isx6z2Oz0sNNMYjxaxBlEstdNWnU6762nRqTm4=',NULL,0,'2020TS9695','Hadi','Sari','',0,1,'2025-10-23 15:47:49.535815'),
(218,'pbkdf2_sha256$1000000$p1Rrde0XoLmasVW6Sa17Ns$1ulJ6gGIuuf0FSIJ7Fjg8JLOkX1/lDNHp066Amh33oE=',NULL,0,'2020TS8515','Oki','Hartono','',0,1,'2025-10-23 15:47:50.873027'),
(219,'pbkdf2_sha256$1000000$jKRy7r0oSMKpiCDKbGjQhZ$A9hKEeXMHWYwN+r7eWsSMoZb7vaenhO+yoUEKAA7tvk=',NULL,0,'2020TS4786','Ika','Permana','',0,1,'2025-10-23 15:47:52.709267'),
(220,'pbkdf2_sha256$1000000$DXRYo8WGF1s6md94XGh7oy$bIzltuwINV/9lwCoqhvqycRI0AvNRpa9ZTlavSs5Azo=',NULL,0,'2021AR8554','Siti','Utomo','',0,1,'2025-10-23 15:47:54.829880'),
(221,'pbkdf2_sha256$1000000$Jju72qAxcRijoZVMNf1I90$8sxeZwxmGOuBshaYtHRtExhFJFYzCN9LyBWdd6IwmY8=',NULL,0,'2022AR2128','Sari','Hakim','',0,1,'2025-10-23 15:47:56.455195'),
(222,'pbkdf2_sha256$1000000$UU6NlcuDczeApsrOl1iCvC$VMncBeB/Wri4ELOUu3namUvvjqUHaZ5N1aUR9hzec4w=',NULL,0,'2024AR3568','Umi','Prabowo','',0,1,'2025-10-23 15:47:58.113787'),
(223,'pbkdf2_sha256$1000000$TrV1PkjlVdqewG9iLg8tu6$5aOmZR+hkzT8gwRpBza1CHttrr7kwvTEleHayQCh6qw=',NULL,0,'2022AR3759','Kiki','Sari','',0,1,'2025-10-23 15:47:59.907484'),
(224,'pbkdf2_sha256$1000000$RpjjUTwg47iYdNqCUs381f$jvC2unJrNkW1V1jakveP8MwSZg5cXN8Md009EquG67I=',NULL,0,'2021AR5808','Fitri','Putra','',0,1,'2025-10-23 15:48:01.864569'),
(225,'pbkdf2_sha256$1000000$c97owowy4GZc3NCGKeRLuX$XtsM131X7W+63DbRZh/plqxdJC8sK0DWy4MWzQxGkaI=',NULL,0,'2024AR5374','Oki','Firmansyah','',0,1,'2025-10-23 15:48:03.912689'),
(226,'pbkdf2_sha256$1000000$ttJR343wKzZT9OETpuzfCt$ivP/m0rg2qKtOYo/wPx6SXe3Xwdr16DtmdxUX3UBb94=',NULL,0,'2020AR8563','Jaya','Rahayu','',0,1,'2025-10-23 15:48:05.658350'),
(227,'pbkdf2_sha256$1000000$HM4oo27r25DH6ISYKkXWKc$8qUsvZkv8XmCe+jbQKi8nuZ4HrCcLpVTf91C9XhHAdI=',NULL,0,'2024AR8441','Candra','Putra','',0,1,'2025-10-23 15:48:06.803955'),
(228,'pbkdf2_sha256$1000000$QBwsgas2jWM534ngD1oP2P$MMp+mqR6owkxbAJRKqZHm8jKiPhJbmrIzFgYQrsH/d8=',NULL,0,'2023AR2448','Indah','Pratama','',0,1,'2025-10-23 15:48:08.468210'),
(229,'pbkdf2_sha256$1000000$5QsBzmLs1qnvR2poJbAnrB$PKsWGu1B+BsYQSDqfw7A7BS4s8z7QTv91DCcV9vC7LU=',NULL,0,'2020AR2541','Hendra','Kurniawan','',0,1,'2025-10-23 15:48:10.371957'),
(230,'pbkdf2_sha256$1000000$pquJCFOjsnJ5KIUOvuAhE3$TD+g/bmoNYB4jEfwq6UufOkcSBYU2QRquYjAggYYgTY=',NULL,0,'2020AR6650','Vina','Prabowo','',0,1,'2025-10-23 15:48:12.547936'),
(231,'pbkdf2_sha256$1000000$ku2LpsOEYVNDdlNEgLIzZR$LLb6Ot6xCku4pLU854Mt7S/Jp2hc/J5kvfesKOAoDX8=',NULL,0,'2024AR4310','Lisa','Lestari','',0,1,'2025-10-23 15:48:14.678814'),
(232,'pbkdf2_sha256$1000000$A93SNjboVg8mFDwBpF7oJx$s70YFOxAUDKOHuu8SsjPHAxbcRiG6uvCf730Bp5OonA=',NULL,0,'2023AR8481','Candra','Rahayu','',0,1,'2025-10-23 15:48:16.687315'),
(233,'pbkdf2_sha256$1000000$8JmwlyyT1YGzhxw7xPXxXC$X8yD5o4K7yIOe5z4JPbTEJdxV+NLjcJY8kL95DrqLdM=',NULL,0,'2021AR3507','Zaki','Susanto','',0,1,'2025-10-23 15:48:18.409917'),
(234,'pbkdf2_sha256$1000000$F2HfIT47w7itWHrCQx6Ac8$tOZGWCjsKsB1ocuLKkdHOWTFSb+9+VOB/KWFhYLqKAs=',NULL,0,'2023AR2506','Qori','Saputra','',0,1,'2025-10-23 15:48:20.054577'),
(235,'pbkdf2_sha256$1000000$OgllBn9YtrJFDpABJi7Np7$OMSO0PraK4aR69fKt/4z5PcsZUWunM1hhjmzJft1u7w=',NULL,0,'2022AR7668','Eko','Santoso','',0,1,'2025-10-23 15:48:22.384073'),
(236,'pbkdf2_sha256$1000000$WPRln3fiexTuzS6w53FhIS$SXXNxbSl276c1E6E+lVo+V8WckdpTc+TCtYFLllhWT4=',NULL,0,'2024AR9590','Oscar','Pratama','',0,1,'2025-10-23 15:48:24.649713'),
(237,'pbkdf2_sha256$1000000$lIQlSgWwWdhfCcTAYreVFX$YS9Sji4lKUpA3TlC72MIDTzX6o69l1/tg+sKRrWuXmE=',NULL,0,'2022AR2188','Tina','Hakim','',0,1,'2025-10-23 15:48:27.262940'),
(238,'pbkdf2_sha256$1000000$KKON1LYrPLJ4NTs2yxkAiM$H3pniFywTrhII+xpnY9klv3B0JoA+yqYGMlTxGcnv+E=',NULL,0,'2022AR9426','Kiki','Saputra','',0,1,'2025-10-23 15:48:29.866303'),
(239,'pbkdf2_sha256$1000000$hNUQhOtYim94wHczYmb4CH$8rM7b5VCZcC/CBiWZxGwYbxPv2PQZqsu+dBDAbLKuNA=',NULL,0,'2024AR1892','Bayu','Utomo','',0,1,'2025-10-23 15:48:32.475135'),
(240,'pbkdf2_sha256$1000000$Ol8jjlW8h5vMOBNSK1nOV0$GmGtMHxznKOF0Y9MqbZDKKrMJtbw7ckfcFAv/zibLFw=',NULL,0,'2022AR5933','Tina','Setiawan','',0,1,'2025-10-23 15:48:34.902796'),
(241,'pbkdf2_sha256$1000000$Cggokt16U0dp9UF1u3kFcT$aoRpdTRjmJzMEkFZtdHGdIz2kvSSGKEYepLwd71fJ4A=',NULL,0,'2020AR1110','Nani','Maharani','',0,1,'2025-10-23 15:48:37.498043'),
(242,'pbkdf2_sha256$1000000$j278CpmAuHbDp1Glb1t3ci$GrKphNuIRkNL5fxyFsgnl6ttrmdL2RyD4a0TRoriUs4=',NULL,0,'2024MN7519','Tina','Lestari','',0,1,'2025-10-23 15:48:40.077089'),
(243,'pbkdf2_sha256$1000000$EGiozcZY5bDPAwaqlT2iUc$uH4Iuxxu0HFO96CqVh0MKQmEBI9NPVOA8L6GZgzsCfw=',NULL,0,'2022MN7526','Dian','Subagyo','',0,1,'2025-10-23 15:48:42.687941'),
(244,'pbkdf2_sha256$1000000$PAtrVqiiHjtBqFqs0u2Exq$pKuB9vDz3GHV4i+X2ymQGscbHvc2Y/ECaF1B7qXnroM=',NULL,0,'2020MN9807','Nina','Santoso','',0,1,'2025-10-23 15:48:45.213039'),
(245,'pbkdf2_sha256$1000000$pegsCFRRvIQfI47zHJnR0y$ScGMOp7OUjchcEGYlZZrn3eKfpAc7+49R8leji07PuU=',NULL,0,'2024MN3797','Oscar','Firmansyah','',0,1,'2025-10-23 15:48:47.820610'),
(246,'pbkdf2_sha256$1000000$UOygFcO6o8isvcP9Jo4Jmo$lx1BSGsfn1kKHpIKnzC5mXvhp14zINzZ7gfVJk/0/fA=',NULL,0,'2020MN8478','Siti','Kurniawan','',0,1,'2025-10-23 15:48:50.389396'),
(247,'pbkdf2_sha256$1000000$10Td6hSFeuFjj6EAEkY2UB$PmwkyAtvPTQaFBDzCapLcJ/y0/p0sdAbAQBKSlVs04c=',NULL,0,'2021MN2157','Zahra','Santoso','',0,1,'2025-10-23 15:48:53.037166'),
(248,'pbkdf2_sha256$1000000$SkfXKglXIdd1r4lI0kmQq0$Z+GAd79nB+j+0d4fNFxsO/Na2ZnYFnEPi4VwAIKPXPM=',NULL,0,'2022MN5205','Vita','Hartono','',0,1,'2025-10-23 15:48:55.442810'),
(249,'pbkdf2_sha256$1000000$E104EMob1pmoWCJvXQE2dK$LI4bsMU7WS20xp52VZNwNJ4D8/O0Ls5DPOWK4Ox6Xa0=',NULL,0,'2023MN5918','Evi','Pratama','',0,1,'2025-10-23 15:48:58.087865'),
(250,'pbkdf2_sha256$1000000$EaGKmftQQWYCvAiKEutWSm$5KIqr1fpy3tdy6IRiiz6m2yh5FaT0xsckZyUV0fd5T8=',NULL,0,'2024MN6211','Rendi','Lestari','',0,1,'2025-10-23 15:49:00.693300'),
(251,'pbkdf2_sha256$1000000$gnoYtCpj6pUO1vDMTSbBeO$Y58iOu2q0fGg1FpzGVBDybfVQxlmQunRsbQDpCue+pE=',NULL,0,'2024MN1261','Umar','Gunawan','',0,1,'2025-10-23 15:49:03.273905'),
(252,'pbkdf2_sha256$1000000$2Db2UKdyPzzErAQCsVx88R$zNAm3/C3u9V9iP/rXk71iB1FevdRK87rYXd9bRDqsj8=',NULL,0,'2021MN3870','Wati','Subagyo','',0,1,'2025-10-23 15:49:05.672583'),
(253,'pbkdf2_sha256$1000000$6nuUAc2QzXkBO49uEiWjMs$ThPIIPmjaqjFbZjradpaQmbyArILhvQJG6sRf1e8Jt8=',NULL,0,'2023MN5599','Made','Pratama','',0,1,'2025-10-23 15:49:08.271619'),
(254,'pbkdf2_sha256$1000000$6eLe5MRC7CVkTeTqwgnpBc$xCzbsKaT5HkmORvNuCv54ZJ2tUHRqnVY+kKPrMiOPFM=',NULL,0,'2021MN8421','Tina','Saputra','',0,1,'2025-10-23 15:49:10.847414'),
(255,'pbkdf2_sha256$1000000$p5y7zzpiGCuoLdMSLvM2Wp$Re9wx848QAYGS1MYxqH30gjqmWH0q+qF/qwuSxVWmD8=',NULL,0,'2020MN7941','Umi','Permana','',0,1,'2025-10-23 15:49:13.456072'),
(256,'pbkdf2_sha256$1000000$Ox3EHDlFaKGshRx4hlveZN$PjhnTTWW8I69cpPl8lLK8IktgY3mj2wWHwxPY4lTJxE=',NULL,0,'2024MN2095','Hendra','Putra','',0,1,'2025-10-23 15:49:16.059769'),
(257,'pbkdf2_sha256$1000000$FpGdXExbQAnKfOTCjSOpIK$TLktLGSWspTEIIiRW2xA8+aC7XSfgqf8KHZer+w5SSk=',NULL,0,'2024MN7686','Budi','Permana','',0,1,'2025-10-23 15:49:18.673930'),
(258,'pbkdf2_sha256$1000000$0aV7RVcvWlQtToFVwqKqYR$ggraoZVw8YpIAWS1PtXaJ2QtuxU8F8Tj3Yn8l8eTd4s=',NULL,0,'2024MN4606','Siti','Utomo','',0,1,'2025-10-23 15:49:21.292617'),
(259,'pbkdf2_sha256$1000000$NOUZ9UlEgIDlCfA1YnvGs9$u5p4K/MUhlJUsLFF1xrpSkBklqXMNYiFo5GViwIsh+I=',NULL,0,'2024MN4128','Putri','Wibowo','',0,1,'2025-10-23 15:49:23.911014'),
(260,'pbkdf2_sha256$1000000$h5iHUHiDHRfMTOgZQRquWb$xJqP26/Sc51ovCgwyIi4jZ5JqHPZd1QjgmtU8tKPjwg=',NULL,0,'2023MN1062','Vina','Santoso','',0,1,'2025-10-23 15:49:26.311516'),
(261,'pbkdf2_sha256$1000000$fieZVcob7bEGjReBf6pkmU$h3vXVcigQx6FfWnvdQVxGENw4buzNGRLrzOkl4Akbtc=',NULL,0,'2020MN1850','Umi','Pratama','',0,1,'2025-10-23 15:49:28.914873'),
(262,'pbkdf2_sha256$1000000$5XJZ8L10Oyd6ybdCRuk17s$BKCoynVzB+ocxy+Gmofe4VH2auMYrMdvwDVs4PPiFv0=',NULL,0,'2023MN2739','Tina','Putra','',0,1,'2025-10-23 15:49:31.490923'),
(263,'pbkdf2_sha256$1000000$nmj440nW22Q7Ra4ulQlMWG$D9fRgSEnF5Muok2jJwbIMktalTliOO3Q9yrEHoIh4ak=',NULL,0,'2020MN2742','Galuh','Maharani','',0,1,'2025-10-23 15:49:34.107924'),
(264,'pbkdf2_sha256$1000000$2jzXg3tj5djdAewbffp7AV$GyKuG+oR3MVw1fNiOJQIHtSitxx+2mjdMdLp8T80tSA=',NULL,0,'2023MN3063','Nina','Hakim','',0,1,'2025-10-23 15:49:36.602342'),
(265,'pbkdf2_sha256$1000000$hXPlIkZusqf49AC3hDUPr4$zkQDxhDXd/Ma//9yehIE8vC5tdctrLbdiMUjF3pt5hY=',NULL,0,'2020MN2772','Kiki','Kusuma','',0,1,'2025-10-23 15:49:39.209287'),
(266,'pbkdf2_sha256$1000000$WrROjmmX7ImKbdummjtbBU$j2jPpKEpqhoYXgzWK0X/i+V2KrqMB5ZUpe5o9x8CK60=',NULL,0,'2022MN4510','Zahra','Hakim','',0,1,'2025-10-23 15:49:41.779600'),
(267,'pbkdf2_sha256$1000000$kfM4c8eAaUPG9qR6W5h3i7$fzTjL9oCGk/4Hw9equRPEgVntFnTfNm0pBt/RH5mOfI=',NULL,0,'2022MN5640','Umar','Santoso','',0,1,'2025-10-23 15:49:44.375201'),
(268,'pbkdf2_sha256$1000000$xk5gJ1RLQgrkKELS1asAWY$ph7LTnOjXJbyuMKJKZuBXG0dZnSqVSMrB0Uvw4VCdBE=',NULL,0,'2023MN4754','Zahra','Maharani','',0,1,'2025-10-23 15:49:46.964310'),
(269,'pbkdf2_sha256$1000000$P4kj1meRT7IqDfbf8VqmV3$qqKsLDlst973a9hw6ZT9uhdf26w6Iges+pXjHbcAzyY=',NULL,0,'2020MN3131','Tono','Santoso','',0,1,'2025-10-23 15:49:49.569960'),
(270,'pbkdf2_sha256$1000000$9gCVfG0qeru49MfwNB0ZnV$gWgc1tUEg1MV9ADBdU6Ju1FulP/B6ZzB73z99sgjq38=',NULL,0,'2022MN7494','Agus','Permana','',0,1,'2025-10-23 15:49:52.173910'),
(271,'pbkdf2_sha256$1000000$1u4F3YEVd926IKmkYqrBqw$gsFjn5k35b6dmLQeJz1JSlJ7vJqgvYvnpQFMZ4414l0=',NULL,0,'2020MN1827','Yanti','Nugroho','',0,1,'2025-10-23 15:49:54.781077'),
(272,'pbkdf2_sha256$1000000$IfSxiDmSaPTtnhFxbZe6wu$hgEFDWdcRX4SL9JTSplxDRAq6gFhk2u1bpl5gRlrQDk=',NULL,0,'2022MN3934','Nina','Gunawan','',0,1,'2025-10-23 15:49:57.383371'),
(273,'pbkdf2_sha256$1000000$k1JOfJsXCd9RqRGda2LvjA$9J61iWyJAVeoFkQmQAul5dHyYh4eSBp7Wi14LtmZ9gg=',NULL,0,'2022MN4352','Galuh','Wijaya','',0,1,'2025-10-23 15:49:59.992405'),
(274,'pbkdf2_sha256$1000000$iu0SawFVY0ANUDTQGxeVtK$wS05eT6IF8rpVfRUnYAG9gJfFj2YmnCp4Gzk2UPAuyY=',NULL,0,'2023MN2773','Vina','Kusuma','',0,1,'2025-10-23 15:50:02.602789'),
(275,'pbkdf2_sha256$1000000$SpqkAgEEOtwj2AQPzl2xkf$SSWIkifGvxVEoDzGUki+vXDPSAhnhX7EEMDnnpCf7Io=',NULL,0,'2023MN4179','Ratna','Susanto','',0,1,'2025-10-23 15:50:05.212661'),
(276,'pbkdf2_sha256$1000000$hBPz0qrXNdlylb5heQ6m9E$mo8iAFy4LVn55vkSpSaO+NzGpnSsursDR9JQePJ6Nu0=',NULL,0,'2020MN9464','Lina','Hakim','',0,1,'2025-10-23 15:50:07.824272'),
(277,'pbkdf2_sha256$1000000$vxWN0XEiqIQKGKqDxoxMKx$8mtwNgHfKmpdS7Nap9X8w4aF9lowZFxJ7cmQs/4o1iY=',NULL,0,'2022MN6131','Sari','Kurniawan','',0,1,'2025-10-23 15:50:10.436399'),
(278,'pbkdf2_sha256$1000000$81F2LKrajfHYTX8MubNUnY$r6cQjcvS4fOJaxiahzheOa/VxKEpg+mR1Ae+vZyLvSo=',NULL,0,'2024MN5102','Siti','Wijaya','',0,1,'2025-10-23 15:50:13.042913'),
(279,'pbkdf2_sha256$1000000$JBEV8FgSjkOXtvVQOAemCF$ZaZ1fqDUBOlzGrKY+jbE5cyJEwfC9pi5NFowo7mp5is=',NULL,0,'2020AK3876','Joko','Nugroho','',0,1,'2025-10-23 15:50:15.638385'),
(280,'pbkdf2_sha256$1000000$VJkA2h56n8v7W6j0OQtttI$bq++NLwjbWNFB6ji3MV44tRe521dj3qHl2dwmtv0YzE=',NULL,0,'2022AK1064','Tono','Hakim','',0,1,'2025-10-23 15:50:18.041443'),
(281,'pbkdf2_sha256$1000000$8dzvKURmxTbrf8MFtCyxTN$aKlCNHetCbcrAjMp9PIiLUrxqwbeGL98IG0M/YafXqw=',NULL,0,'2021AK4401','Dian','Firmansyah','',0,1,'2025-10-23 15:50:20.655674'),
(282,'pbkdf2_sha256$1000000$BKOIee01ZJgtMlzBZRa0pJ$wN6qxWHkVYp8NwBZzkCXLSbv3XWD07quCZDL7r4MCQM=',NULL,0,'2024AK8243','Indah','Sari','',0,1,'2025-10-23 15:50:23.267214'),
(283,'pbkdf2_sha256$1000000$RG9GiOerT217OBEuNPLWXX$ryCjFh61B7/IqJ9xgFatKFRC0ynZK6Ji0hsQddT+dtY=',NULL,0,'2020AK9410','Vina','Wijaya','',0,1,'2025-10-23 15:50:25.884578'),
(284,'pbkdf2_sha256$1000000$L4Zb7xrctydwuaNS980qKG$LkjBJq3vv6T0YJVXTaRPUkEFq69SUksoRMiEjruTv2Q=',NULL,0,'2024AK5066','Zaki','Sari','',0,1,'2025-10-23 15:50:27.500135'),
(285,'pbkdf2_sha256$1000000$Qlscu0Xg31FiRhruonrkGv$CSopEMcPcI1nclIYM8QbpsP65bPa+EyOBX+D7zPlOrM=',NULL,0,'2020AK4594','Kiki','Rahayu','',0,1,'2025-10-23 15:50:28.567311'),
(286,'pbkdf2_sha256$1000000$iqGPOcV7FuSUxaurDVd7MB$makOqJ1cWTG6VRj/H0N4HBVRVtpRT3Jq9cegQiMuyp8=',NULL,0,'2023AK2314','Qori','Hidayat','',0,1,'2025-10-23 15:50:29.634796'),
(287,'pbkdf2_sha256$1000000$JbLCTqkaHUcTksFZmv8AVy$a30XVhQgwMM8Xz76LP7xThEVPAHqMPJkMViaVCDHQFE=',NULL,0,'2021AK4202','Ika','Maharani','',0,1,'2025-10-23 15:50:30.703827'),
(288,'pbkdf2_sha256$1000000$efKgfOKNZbDHUT5eo1XUrl$LLR9VG0Yg0hPwVldb4Ck0fUokfG/PLzshuSZPh6DFb4=',NULL,0,'2022AK3976','Wati','Saputra','',0,1,'2025-10-23 15:50:31.769834'),
(289,'pbkdf2_sha256$1000000$mbGj1iBB8cIkYlw9gQUiFK$aFXNGhm1kTLB8Am40aaPwzEDG59ULKFf7lVAFL7SquA=',NULL,0,'2021AK2925','Candra','Subagyo','',0,1,'2025-10-23 15:50:32.839139'),
(290,'pbkdf2_sha256$1000000$iMQHpspKYSIbwoSVtvYZK7$1ryP1jiq6L9+qB9TmLlTv2GJp/4sbVIN7v+vyjue1Ic=',NULL,0,'2021AK8221','Yudi','Lestari','',0,1,'2025-10-23 15:50:33.911805'),
(291,'pbkdf2_sha256$1000000$ZzMLMxVtPw5fF1bGzGHvll$gln2Vqe2B0HzPLLp85I2tQyMi6KKTeWA8XfBswqio2w=',NULL,0,'2021AK4994','Umar','Permana','',0,1,'2025-10-23 15:50:34.977249'),
(292,'pbkdf2_sha256$1000000$butAEXMX53GZQJmwB2rzEF$zgy8MUKztVRx10g5CmXoNiJXbKEGr+HtVWebAma8lMo=',NULL,0,'2023AK5970','Umi','Hartono','',0,1,'2025-10-23 15:50:36.416304'),
(293,'pbkdf2_sha256$1000000$rFJJ9RIdkYVCOjvmF9fick$sFB0f+LFK8FdP8ekGPkY/ZJyT+UFN5EALffSVrV3uYo=',NULL,0,'2020AK3721','Vita','Wibowo','',0,1,'2025-10-23 15:50:38.492208'),
(294,'pbkdf2_sha256$1000000$DlyBgVs3CdfwLRjXQkEfyn$gzgGMGROYAVr1FtXE0GkIB+Ogx8Mq94FDSOYjARkqDc=',NULL,0,'2021AK7821','Made','Prabowo','',0,1,'2025-10-23 15:50:39.830556'),
(295,'pbkdf2_sha256$1000000$CPb1GUmyQUwgF0CSADfaRj$2VOXF3l7cPBJsRo98PtyszctxME13QZFjvdNm8LRX4A=',NULL,0,'2024AK3907','Umi','Putra','',0,1,'2025-10-23 15:50:42.397575'),
(296,'pbkdf2_sha256$1000000$1ZEgy254LzI02bGrVQenKY$HRFgb5rqG42qU1PhCJK+vyOMdu926pigd4mEOIf//YI=',NULL,0,'2024AK4104','Jaya','Firmansyah','',0,1,'2025-10-23 15:50:44.613019'),
(297,'pbkdf2_sha256$1000000$4k8jZm5t0gB2FgVLyrbd4w$/mN8Z/Cw7Qlb+gNbSbCc+vxEeC4WF7PgXJyxp/oX0IU=',NULL,0,'2024AK5965','Lina','Utomo','',0,1,'2025-10-23 15:50:45.679262'),
(298,'pbkdf2_sha256$1000000$ncyecIJd9Cy9BowJBm49yj$tyUaUU0mExEV86xntJ9z2bCrNfan0IaZKR+Mx6GvO6c=',NULL,0,'2023AK5662','Oki','Hartono','',0,1,'2025-10-23 15:50:46.783678'),
(299,'pbkdf2_sha256$1000000$e63z5IWdbrKxicuQgg8ijN$SaBig+fuxzhcKJnwYSEzXk6cI2nSCS7/hKx9OnhUqQM=',NULL,0,'2023AK8020','Rendi','Gunawan','',0,1,'2025-10-23 15:50:47.849019'),
(300,'pbkdf2_sha256$1000000$7Tfzq4tPXBicsJtND42YqV$BnyOIkgCTYzn1DwBfIiIBTBoTUEM6fZwlMh2L5U76U4=',NULL,0,'2024AK2214','Ika','Lestari','',0,1,'2025-10-23 15:50:48.917497'),
(301,'pbkdf2_sha256$1000000$F7bHCxGfeBIRppvEUsFEET$p8xkTaYzshUJFiktybSQaG5tws5W7N/ZHLtVcvwPe3M=',NULL,0,'2021AK5019','Nani','Gunawan','',0,1,'2025-10-23 15:50:50.782499'),
(302,'pbkdf2_sha256$1000000$BxJJEMQqoZLRFJ9gyWPBOr$Vo4ZF3z7ceIBOUNNpBDQI1nu6Rn82h+3Ngu6IRELBqs=',NULL,0,'2020AK6420','Ika','Pratama','',0,1,'2025-10-23 15:50:52.563677'),
(303,'pbkdf2_sha256$1000000$cJafDt2oczwhQjE1tjphXC$H4SYk6ZHjiEXYdoc1BXKLLOoOzrpT5Jlq1N/toX8ubY=',NULL,0,'2022AK2900','Rendi','Wijaya','',0,1,'2025-10-23 15:50:53.632927'),
(304,'pbkdf2_sha256$1000000$M7hrz00RSzOg9hRe9sizNE$uWBM6HoGmHvhkN5RiVGgd1ul/SbfJdRyQ5bxoWmPvB8=',NULL,0,'2022AK1083','Pandu','Putra','',0,1,'2025-10-23 15:50:54.701776'),
(305,'pbkdf2_sha256$1000000$sgf9NQxiNsv7tNIBlsiy6S$QNw7N+yFUs6ExHMl4vIyMWDIBFGypJRkuc2n2/M2nAU=',NULL,0,'2023AK1443','Jaya','Wibowo','',0,1,'2025-10-23 15:50:55.767283'),
(306,'pbkdf2_sha256$1000000$FE2GmHeYxq95xFYIgauY65$PWdmrV7em6LrNxr6JMEqruqntaGvKrXKX/HekoGvJ68=',NULL,0,'2023AK6233','Candra','Subagyo','',0,1,'2025-10-23 15:50:56.838167'),
(307,'pbkdf2_sha256$1000000$HAWGDBJYzIoiC2xDSEd9Ub$eiCJX6hZfX8wQH1ft/6dEaavXI9558UnSDFYHjmmln0=',NULL,0,'2021AK7474','Kartika','Utomo','',0,1,'2025-10-23 15:50:57.904671'),
(308,'pbkdf2_sha256$1000000$l92LeSGP5L1izTYK9Q1mYw$7TRl5YNtw+zP4k5RYeCAxDZQDm8TBR7Oqju1Fwp+UXI=',NULL,0,'2024AK7806','Kiki','Utomo','',0,1,'2025-10-23 15:50:59.053156'),
(309,'pbkdf2_sha256$1000000$aTW7rCLJ9PR9u5KIeILe4g$qagrCjAfLeyGwv6l8Nc0WtMOP/Otgx8q05FloR+t+WE=',NULL,0,'2022AK4631','Indah','Wibowo','',0,1,'2025-10-23 15:51:01.436790'),
(310,'pbkdf2_sha256$1000000$McPYrhWOsuMb9XMtknrELp$GIRsJGR3xrF18dcKxTA2lERystCJ/280GV0dNCHbs2M=',NULL,0,'2020AK3990','Tono','Nugroho','',0,1,'2025-10-23 15:51:04.038388'),
(311,'pbkdf2_sha256$1000000$G86PpMzkCymPBfbJ2M8o0m$K8YQXvA+dIVzX8LNecuxN9mYOtFXMjmCeznIW1Nyo1I=',NULL,0,'2023AK9734','Vita','Lestari','',0,1,'2025-10-23 15:51:06.607575'),
(312,'pbkdf2_sha256$1000000$gvpi5xKnvtAxgjjW0KShNs$jIm8BByRJ5gfURCRYlysCq9qrZJ8gCrbZsNrRPbv9W0=',NULL,0,'2024IK6390','Vita','Wijaya','',0,1,'2025-10-23 15:51:09.222822'),
(313,'pbkdf2_sha256$1000000$GoOz1jTlbeee7JZLo2vbEl$Gmf1vRF7H1lAp+5ejUZ9s+xBAnZsP1WaHMOW35o4AXo=',NULL,0,'2020IK5674','Indah','Maharani','',0,1,'2025-10-23 15:51:11.630077'),
(314,'pbkdf2_sha256$1000000$6JRrgqNZJyhsMcm2F5D91j$WiKUnzYqzvTzYeaNfN2p7IK3+vrvpS8SM7tgpb3R5us=',NULL,0,'2022IK5489','Gita','Setiawan','',0,1,'2025-10-23 15:51:14.236454'),
(315,'pbkdf2_sha256$1000000$lFCVYSxLPFG19WvTYEeQyJ$+KDQdvs/Z2mg7XAgW0hLimTx4/VplA0/W7Q3eaiRo14=',NULL,0,'2021IK6555','Made','Pratama','',0,1,'2025-10-23 15:51:16.812244'),
(316,'pbkdf2_sha256$1000000$YhPZYurIoi6GeEAMN1Y4A9$ti2NjMaVHClqFjO+x0rigJze6zoT57M043H2U0+PpxI=',NULL,0,'2023IK7408','Putri','Gunawan','',0,1,'2025-10-23 15:51:19.416977'),
(317,'pbkdf2_sha256$1000000$M3pJ1MAodcdjTh7Q7wmG56$lODwf9MXCwxy1obynpD7pm6YkHNvP4rs/VTfHXJMIP8=',NULL,0,'2024IK5091','Fajar','Nugroho','',0,1,'2025-10-23 15:51:21.807620'),
(318,'pbkdf2_sha256$1000000$FaA2j4k52Ojf8CRtg2pu4E$Hu2ZHaUuNyFtw+lwjndIkW0Vj9cLRKZkIlBUWq4KS5s=',NULL,0,'2021IK2741','Tono','Kurniawan','',0,1,'2025-10-23 15:51:24.419601'),
(319,'pbkdf2_sha256$1000000$yiKHbPM57RyRuCFG4DvmzH$zPxuqyw7U9UghlxM2YbO//6LuXYib++vhMD3pEyJneo=',NULL,0,'2022IK7920','Vita','Firmansyah','',0,1,'2025-10-23 15:51:26.980726'),
(320,'pbkdf2_sha256$1000000$L2T3qQweCcEN3zacUoqAme$iMgOm91dT8bGZeNy1ce5hVqsGvmcjwW6kflh77nSCgs=',NULL,0,'2021IK3611','Tono','Rahayu','',0,1,'2025-10-23 15:51:29.582835'),
(321,'pbkdf2_sha256$1000000$VRS84UudoOequN0SymMi5Z$TTviNeo1vr+oS9QTlEpWDwCmabl+KouCiv79/FoNHcA=',NULL,0,'2020IK3709','Wati','Sari','',0,1,'2025-10-23 15:51:31.975971'),
(322,'pbkdf2_sha256$1000000$lhGcMQvI9u4fV4yyCUyUOK$wi60Kj/ES8zN/PSDs+iJEqLu4oOc9QEaz0ESs1Fh50Y=',NULL,0,'2021IK4709','Lina','Utomo','',0,1,'2025-10-23 15:51:34.579343'),
(323,'pbkdf2_sha256$1000000$3IxRut6WfIF5BDhBazgWbd$QnJVZ+KT2kiLF1N0RsEX9aGGl0I6fe2jiFtKo7RQp3k=',NULL,0,'2021IK3406','Budi','Rahayu','',0,1,'2025-10-23 15:51:37.157036'),
(324,'pbkdf2_sha256$1000000$KvNR49d2RMmmlZ2Sw1DUmN$EsnWRvtkoQJoKOEd0Dwj8oR+44/kd7r3ehlXYKJpnjU=',NULL,0,'2024IK3471','Hendra','Wibowo','',0,1,'2025-10-23 15:51:39.759911'),
(325,'pbkdf2_sha256$1000000$ZF8VGuQREnz2fQggrAfH7d$zuQdfJTq0p+y3emQbm1x6TxosL2a/2MuHtBz2B+ik50=',NULL,0,'2023IK1570','Tina','Kurniawan','',0,1,'2025-10-23 15:51:42.278892'),
(326,'pbkdf2_sha256$1000000$tXfuR9400bqHloM65cVZEd$Qi41ysxh4hxougIXFj/GTjfy60vXMmP7VIeZ3N6QUdI=',NULL,0,'2024IK9286','Agus','Kurniawan','',0,1,'2025-10-23 15:51:44.884341'),
(327,'pbkdf2_sha256$1000000$LV5q02RvOiJkIBIz72wKOl$Y4BCCSYcNaTB0Nhwx4i70AKrILgAtDzmefzYmEMCOj0=',NULL,0,'2020IK2577','Kiki','Utomo','',0,1,'2025-10-23 15:51:47.453998'),
(328,'pbkdf2_sha256$1000000$yzCMSaAEyEic0bAxZxlKdy$8+m874tcxXRg2kA88VCfK5rGHrzOBdjY3ZDas91gp00=',NULL,0,'2021IK2073','Wati','Hartono','',0,1,'2025-10-23 15:51:50.064302'),
(329,'pbkdf2_sha256$1000000$m8avaFs1EyYRaSkWDHwNwa$7fncQl1dUWSKueTIBC23v7RZ8SmGuMqDxr/78urz8A8=',NULL,0,'2023PS1914','Jaya','Nugroho','',0,1,'2025-10-23 15:51:52.443659'),
(330,'pbkdf2_sha256$1000000$nChkuetLf5LFobd09TWDL4$idFDSipCN9G+gHEwRLhEjcF+BzzesW6oTjtcSGHoU/k=',NULL,0,'2023PS5423','Maya','Utomo','',0,1,'2025-10-23 15:51:55.045507'),
(331,'pbkdf2_sha256$1000000$qiw0DKhgJ5kM4BMTtf9QgW$vcWfZdm5z46vaTzXBi9xwR779rGhPjk7R4skr1s6huM=',NULL,0,'2024PS1645','Oki','Gunawan','',0,1,'2025-10-23 15:51:57.618989'),
(332,'pbkdf2_sha256$1000000$gdcfGIngGt7kr0ohCrd6GY$Dck5M+mv1Clf5tVeQofsocVubP39/SYjsvNwSwx2U24=',NULL,0,'2023PS6629','Fajar','Utomo','',0,1,'2025-10-23 15:52:00.222842'),
(333,'pbkdf2_sha256$1000000$yhpfWx53twcFd2cZ4LLDD4$uKfygOom4gOJTWpvZ+qmGn9SCIN/WmPifZA4/c50wAs=',NULL,0,'2022PS2816','Dian','Firmansyah','',0,1,'2025-10-23 15:52:02.815881'),
(334,'pbkdf2_sha256$1000000$1fqI0bRkzmEBheI4VVkYY2$oGufDR9VasYuWr1bYHJEfhDEvnI+yFdUQgIzBLkdHKw=',NULL,0,'2022PS1754','Bayu','Wibowo','',0,1,'2025-10-23 15:52:05.421611'),
(335,'pbkdf2_sha256$1000000$kF1AqZTtKJkytk70LUCzG5$tUcihjpCu/J8UVD9OEJkP5D4x8uXFp62fsWa82yq+As=',NULL,0,'2023PS1651','Dewi','Sari','',0,1,'2025-10-23 15:52:08.006312'),
(336,'pbkdf2_sha256$1000000$fmzuwuCpEiKlLN7PsbhBUv$ir9hoFrFei1Q/hW9o8fnJ6dWB/JkqyPxfLuw3+GQaoc=',NULL,0,'2024PS8123','Umar','Kurniawan','',0,1,'2025-10-23 15:52:10.620999'),
(337,'pbkdf2_sha256$1000000$lTWmOP0E5crbLoWFodxiy1$ydNe0qHd6i7ClxcZuFjBBYbrSMujpJPgB1uGA4qWBGA=',NULL,0,'2021PS8443','Tina','Wibowo','',0,1,'2025-10-23 15:52:13.225984'),
(338,'pbkdf2_sha256$1000000$MRTnjOjXLQOrSSeW1Ymokq$KwHTf0qVoj6EY6RQunWFXjK8gq5GOxNQNDty6HpNhow=',NULL,0,'2023PS5728','Qori','Prabowo','',0,1,'2025-10-23 15:52:15.833876'),
(339,'pbkdf2_sha256$1000000$daP6PYrSdtlD4AMf0iOBCF$8uAi9VdCzWFfsNUIqh/yBs8VmTMP8RtBYPtkwei4ITM=',NULL,0,'2020PS2016','Wati','Lestari','',0,1,'2025-10-23 15:52:18.435831'),
(340,'pbkdf2_sha256$1000000$VYqOUlXA43f5NPRhwiDnNn$Fz13EvHStaBHkAkJOepXnN4Tan+9cnd+gxPCfEdNNEg=',NULL,0,'2021PS8002','Nani','Maharani','',0,1,'2025-10-23 15:52:21.054075'),
(341,'pbkdf2_sha256$1000000$cvxPINIkUIdl8aTLpRAKB1$E9f2C3O9brUytD5H9zfD1TjjAOFz+a1MAXrWaghHb1g=',NULL,0,'2021PS6388','Hendra','Hakim','',0,1,'2025-10-23 15:52:23.634338'),
(342,'pbkdf2_sha256$1000000$sFp40frvO7DuGf2GC2NMlx$QGZJ0tI8eaz3RYE4C5VW2C1PO6VfacQq5mk56QuHIT8=',NULL,0,'2024PS4648','Lina','Susanto','',0,1,'2025-10-23 15:52:25.073654'),
(343,'pbkdf2_sha256$1000000$cdZpqjHIPkgx8C0lTKZpV4$/61MWEbjaah2CyuCkf1U4jaWHzii3cpXNwt3XbG+ajE=',NULL,0,'2021PS4030','Ahmad','Gunawan','',0,1,'2025-10-23 15:52:26.488677'),
(344,'pbkdf2_sha256$1000000$y7xfgYNIqI3CrCFTPJhnRA$ZIjogl66zMKKxabyTJAWkw2ycYYOL/d1SVJDRW1j850=',NULL,0,'2022PS4757','Hadi','Maharani','',0,1,'2025-10-23 15:52:27.743899'),
(345,'pbkdf2_sha256$1000000$RVaO83supG5QhsbuLwA8hD$2C5cmYg+OJKzFazHhcvebSkOHbgJWLEOT4j+UJZTWzw=',NULL,0,'20220026740','Ahmad','Permana','',0,1,'2025-10-23 15:52:28.812224'),
(346,'pbkdf2_sha256$1000000$ci0JGxUzrz4kJuq1bGB0eb$O6qz1CSLdKs7kUKvifz3TaNWPyik2RFXn1tWClGlYqo=',NULL,0,'20230028145','Yudi','Rahayu','',0,1,'2025-10-23 15:52:29.879973'),
(347,'pbkdf2_sha256$1000000$k7DTdfFXVXueOBC2dBj2cM$7GxNWVsklsC69R3r8mzLghD3aN/FmQtwyupmRSfwnh0=',NULL,0,'20240026884','Lisa','Maharani','',0,1,'2025-10-23 15:52:30.947490'),
(348,'pbkdf2_sha256$1000000$dMwQs8ypmGhHw9zNcpZXXT$bSfiachJI2sDsiPNQLUGYWjkr4aKcazm4B2GOyfllXo=',NULL,0,'20230022811','Zahra','Maharani','',0,1,'2025-10-23 15:52:32.014024'),
(349,'pbkdf2_sha256$1000000$owwxDY9KadP55ZoXJCsI4A$y+jiBQM+0smDMvzgvqaaz5xN7BZd5PbA5+PhDlt/6hA=',NULL,0,'20210026773','Wawan','Permana','',0,1,'2025-10-23 15:52:33.089160'),
(350,'pbkdf2_sha256$1000000$DJYUJTEj6pLEYySrdEDDCv$XqBIU1g1Np5rmRMXKL3MERJmpkgkLLRAVQ5juNUWyig=',NULL,0,'20210027353','Siti','Gunawan','',0,1,'2025-10-23 15:52:35.487652'),
(351,'pbkdf2_sha256$1000000$Vef71vyh1YV7rAX8oBWW8i$0n+T5eu0Psq9sjuqJareDyDbgxEfbG9bTBkb682sewU=',NULL,0,'20220022550','Sari','Rahayu','',0,1,'2025-10-23 15:52:36.757666'),
(352,'pbkdf2_sha256$1000000$LayiGQGLnfsmhpKo3zfnKY$M+T98HJKnTlZW5ciCZmKjtORcaR9EXtJqscED9qhFvE=',NULL,0,'20200024080','Umi','Rahayu','',0,1,'2025-10-23 15:52:38.279492'),
(353,'pbkdf2_sha256$1000000$TXUeCZKCOFqnmxHw2i4En8$FSjw3tw4zqudY+/78X9z1a3rUaLE6X/AQDaYZPdIU74=',NULL,0,'20210021412','Maya','Nugroho','',0,1,'2025-10-23 15:52:39.347684'),
(354,'pbkdf2_sha256$1000000$WmgoGyX6jhFg1M2x6hDcsZ$WMvYEW+RaHjbD12emqYSq5GwEJ+7XRVuK6ARVYEAK4o=',NULL,0,'20210029236','Wawan','Wijaya','',0,1,'2025-10-23 15:52:40.414022'),
(355,'pbkdf2_sha256$1000000$pBcWfe0ZCh7TDvrWBDhv1N$w0WopNbqG3WqTDuj1BfiWe9sb+8RFMkBMALhE/sjGqc=',NULL,0,'20200022868','Rendi','Putra','',0,1,'2025-10-23 15:52:41.479869'),
(356,'pbkdf2_sha256$1000000$4TfCAkSF6EKwZ9237u6y7x$ilQ+T0x0PQBWNoEWKxkmYidatTMXwg3kRIehqxPhSig=',NULL,0,'20200028633','Candra','Permana','',0,1,'2025-10-23 15:52:43.481012'),
(357,'pbkdf2_sha256$1000000$ra80U4oKK82GuBljAfA3xW$MpH4BtKcLI+EZiQG3eaML/baWfnSUP8NZ0jeiAkgHyw=',NULL,0,'20220028927','Tono','Setiawan','',0,1,'2025-10-23 15:52:46.100813'),
(358,'pbkdf2_sha256$1000000$TXfdGuRlcaPNSBOKEFVemZ$dlrcI03y8nAO/IpZZE0WZ7fXstip1xk3UqQZG1rHEj4=',NULL,0,'20200021903','Tina','Kurniawan','',0,1,'2025-10-23 15:52:48.715842'),
(359,'pbkdf2_sha256$1000000$Qi42TPrJCUlOMiVQP86W1Q$zh7AfmSSiC7XJG5NFEMiHkr+Cn4LW2OHCat85miZn14=',NULL,0,'20200023628','Eko','Santoso','',0,1,'2025-10-23 15:52:50.755937'),
(360,'pbkdf2_sha256$1000000$AgC3xXxWg5t4Bedy1HkNOu$ivUuCXaXrjhMVSFUnnzCslSiYR4gWICHyRDFXwsRv18=',NULL,0,'20200029135','Eko','Rahayu','',0,1,'2025-10-23 15:52:51.867940'),
(361,'pbkdf2_sha256$1000000$6uJiteqpoOld6pLkAttpFr$5tWCbxkr5lRUdf0/odi3yFB/jEpvsmmkqg/xou8XHhw=',NULL,0,'20210021109','Fitri','Lestari','',0,1,'2025-10-23 15:52:54.270836'),
(362,'pbkdf2_sha256$1000000$ia5hVTnK779CJWA0YRHsdt$ZG0PZ8266Ob/m6KjaekeF/lelugyJ3qQ31QCkRuUWws=',NULL,0,'20200023877','Indah','Santoso','',0,1,'2025-10-23 15:52:56.863606'),
(363,'pbkdf2_sha256$1000000$VmkvcLplOGdYxaWmNV3wXD$ugWIBten7pM8D2b8PRewmRRtzqybSRy+4x8UZkeUGSY=',NULL,0,'20220021340','Hadi','Utomo','',0,1,'2025-10-23 15:52:59.421936'),
(364,'pbkdf2_sha256$1000000$NqoWZ5HJwai6eboZswFTA2$jCUbU7shi4/y3EXYhwiJb+PDnOFi4ouIeoQz5Ub+YEo=',NULL,0,'20220029354','Citra','Utomo','',0,1,'2025-10-23 15:53:02.021422'),
(365,'pbkdf2_sha256$1000000$2bFhyzSOnuuE9YFW6ebAuH$/lbkpRQlb1KJ038R+mS5IQwsubnjBvCNX13OnEFrFU4=',NULL,0,'20200026384','Ika','Hakim','',0,1,'2025-10-23 15:53:04.640021'),
(366,'pbkdf2_sha256$1000000$SAq7JOsqYjsDLDhxIuvAin$WTD1eO+jz7WSScJKnytJWbqNn1Ur3gt4uMRLQALi83E=',NULL,0,'20210027338','Vita','Gunawan','',0,1,'2025-10-23 15:53:06.419363'),
(367,'pbkdf2_sha256$1000000$agUTi6ff0j01ysUxFbVf2F$enhiVSZjAiRVER1/q8kiGFUPSwyhqT0r9sBJUpVSvvU=',NULL,0,'20210026792','Nina','Putra','',0,1,'2025-10-23 15:53:08.855005');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES
(1,'2025-10-18 07:00:31.334678','11','002 - AI',1,'[{\"added\": {}}]',8,1),
(2,'2025-10-18 10:37:15.904061','11','002 - AI',2,'[]',8,1),
(3,'2025-10-18 17:30:28.350951','2','mhs2021001 - KRS Disetujui',3,'',16,1),
(4,'2025-10-18 17:30:28.366850','1','dosen1 - Pengajuan KRS Baru',3,'',16,1),
(5,'2025-10-23 14:57:41.032216','11','11TE2021625 - Rina Azzahra',2,'[{\"changed\": {\"fields\": [\"Jenis kelamin\", \"Agama\", \"Status mahasiswa\"]}}]',12,1),
(6,'2025-10-23 14:58:18.538991','13','13IK2022106 - Siti Setia Maulana',2,'[{\"changed\": {\"fields\": [\"Jenis kelamin\", \"Agama\", \"Status mahasiswa\", \"Semester berjalan\"]}}]',12,1),
(7,'2025-10-23 14:58:49.665508','14','14TS2021609 - Rafi Pratama Azzahra',2,'[{\"changed\": {\"fields\": [\"Jenis kelamin\", \"Agama\", \"Status mahasiswa\", \"Semester berjalan\"]}}]',12,1),
(8,'2025-10-23 14:59:41.072822','15','15IK2020791 - Nur Bhakti Kusnadi',2,'[{\"changed\": {\"fields\": [\"Jenis kelamin\", \"Agama\", \"Status mahasiswa\"]}}]',12,1),
(9,'2025-10-23 15:05:26.384433','11','11TE2021625 - Rina Azzahra',2,'[{\"changed\": {\"fields\": [\"Foto\"]}}]',12,1),
(10,'2025-10-23 15:06:40.239958','12','12TI2024352 - Yoga Pratama Rahmawati',2,'[{\"changed\": {\"fields\": [\"Jenis kelamin\", \"Foto\"]}}]',12,1),
(11,'2025-10-23 15:07:32.463028','13','13IK2022106 - Siti Setia Maulana',2,'[{\"changed\": {\"fields\": [\"Foto\"]}}]',12,1),
(12,'2025-10-23 15:07:49.292638','14','14TS2021609 - Rafi Pratama Azzahra',2,'[{\"changed\": {\"fields\": [\"Foto\"]}}]',12,1),
(13,'2025-10-23 15:09:06.599502','2','Dr. Budi Santoso, S.T., M.T.',2,'[{\"changed\": {\"fields\": [\"Foto\"]}}]',9,1),
(14,'2025-10-23 15:09:50.252559','4','Dr. Dedi Hermawan, S.E., M.M.',2,'[{\"changed\": {\"fields\": [\"Foto\"]}}]',9,1),
(15,'2025-10-23 15:40:23.188802','5','Dr. Eka Putri, S.Psi., M.Psi.',2,'[{\"changed\": {\"fields\": [\"Foto\"]}}]',9,1),
(16,'2025-10-23 16:22:28.736267','1','Dr. Ahmad Fauzi, S.Kom., M.Kom.',2,'[{\"changed\": {\"fields\": [\"Status kepegawaian\"]}}]',9,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES
(9,'academic','dosen'),
(17,'academic','fakultas'),
(11,'academic','jadwal'),
(10,'academic','kelas'),
(13,'academic','krs'),
(12,'academic','mahasiswa'),
(7,'academic','matakuliah'),
(14,'academic','nilai'),
(16,'academic','notification'),
(15,'academic','presensi'),
(8,'academic','programstudi'),
(18,'academic','ruang'),
(19,'academic','semester'),
(1,'admin','logentry'),
(3,'auth','group'),
(2,'auth','permission'),
(4,'auth','user'),
(5,'contenttypes','contenttype'),
(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES
(1,'contenttypes','0001_initial','2025-10-17 18:46:17.619411'),
(2,'auth','0001_initial','2025-10-17 18:46:21.402219'),
(3,'academic','0001_initial','2025-10-17 18:46:27.351670'),
(4,'admin','0001_initial','2025-10-17 18:46:28.243403'),
(5,'admin','0002_logentry_remove_auto_add','2025-10-17 18:46:28.269579'),
(6,'admin','0003_logentry_add_action_flag_choices','2025-10-17 18:46:28.288749'),
(7,'contenttypes','0002_remove_content_type_name','2025-10-17 18:46:28.793457'),
(8,'auth','0002_alter_permission_name_max_length','2025-10-17 18:46:29.110268'),
(9,'auth','0003_alter_user_email_max_length','2025-10-17 18:46:29.293209'),
(10,'auth','0004_alter_user_username_opts','2025-10-17 18:46:29.305959'),
(11,'auth','0005_alter_user_last_login_null','2025-10-17 18:46:29.560124'),
(12,'auth','0006_require_contenttypes_0002','2025-10-17 18:46:29.561508'),
(13,'auth','0007_alter_validators_add_error_messages','2025-10-17 18:46:29.586806'),
(14,'auth','0008_alter_user_username_max_length','2025-10-17 18:46:29.751725'),
(15,'auth','0009_alter_user_last_name_max_length','2025-10-17 18:46:29.926653'),
(16,'auth','0010_alter_group_name_max_length','2025-10-17 18:46:30.135249'),
(17,'auth','0011_update_proxy_permissions','2025-10-17 18:46:30.161490'),
(18,'auth','0012_alter_user_first_name_max_length','2025-10-17 18:46:30.351684'),
(19,'sessions','0001_initial','2025-10-17 18:46:30.693251'),
(20,'academic','0002_dosen_alamat_dosen_email_dosen_foto_and_more','2025-10-18 06:40:21.768190'),
(21,'academic','0003_notification','2025-10-18 10:04:48.124600'),
(22,'academic','0004_alter_dosen_foto_alter_mahasiswa_foto','2025-10-20 14:27:18.304821'),
(23,'academic','0005_fakultas_ruang_programstudi_kaprodi_and_more','2025-10-22 14:52:21.029286'),
(24,'academic','0006_semester','2025-10-22 15:10:43.965655'),
(25,'academic','0007_alter_dosen_options_alter_fakultas_options_and_more','2025-10-22 17:33:26.203548'),
(26,'academic','0008_fakultas_created_at_fakultas_updated_at','2025-10-22 17:47:17.826651');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES
('01y02n2085d3hv3dhayq37juvgr5uycw','.eJxVjMEOwiAQRP-FsyGwhUo9evcbCMsuUjWQlPZk_Hdp0oOeJjNvZt7Ch23Nfmu8-JnERWhx-s0wxCeXHdAjlHuVsZZ1mVHuFXnQJm-V-HU9un8HObTc14pJ0zkCEnBKYFEDo7MTKMOjGS116UYZY10KbgCDrPXgFA4RphjF5wvnhzeR:1vBXeg:eJJqwJTMeGN4Exu9tEIE5aox0lAJV2ZPESF_SGVMuFE','2025-11-05 12:09:26.269114'),
('0gb8yrt8d6v1xllod6d1caqe4qduuomw','.eJxVjMEOwiAQRP-FsyGwhUo9evcbCMsuUjWQlPZk_Hdp0oOeJjNvZt7Ch23Nfmu8-JnERWhx-s0wxCeXHdAjlHuVsZZ1mVHuFXnQJm-V-HU9un8HObTc14pJ0zkCEnBKYFEDo7MTKMOjGS116UYZY10KbgCDrPXgFA4RphjF5wvnhzeR:1vBsXs:6Utp4F8git-vUtsPi1svM95l-dHWX_R2pT16A0TnyIs','2025-11-06 10:27:48.023576'),
('0iek3w0xlbl60pkqkcdrvcv1w7q8hsxg','.eJxVjMEOwiAQRP-FsyGwhUo9evcbCMsuUjWQlPZk_Hdp0oOeJjNvZt7Ch23Nfmu8-JnERWhx-s0wxCeXHdAjlHuVsZZ1mVHuFXnQJm-V-HU9un8HObTc14pJ0zkCEnBKYFEDo7MTKMOjGS116UYZY10KbgCDrPXgFA4RphjF5wvnhzeR:1vBeV0:rPuK6nA7g8Q1NPvHjzYCeM1Rno7b1ZFUZzeifzQpLt0','2025-11-05 19:27:54.077601'),
('0xyyz5y40j1vmkezmaetfr1hw2ljtm7k','.eJxVjEEOwiAQRe_C2pCBSaG4dO8ZyMAMUjU0Ke3KeHdt0oVu_3vvv1Skba1x67LEidVZGXX63RLlh7Qd8J3abdZ5busyJb0r-qBdX2eW5-Vw_w4q9fqtBRyhRSnJGSIQ7xCKYQiEwfiMZSQiizaEgSBla1j8yMV5dIMPkNT7A-ZzN8I:1v9psS:FO8YxRf-zub9VPDTEADJH-WBeTZTAMR4_t-HXXenAdw','2025-10-31 19:12:36.575286'),
('2ia8am1o9zy0eazp3luwkr9rw2lchw47','.eJxVjMEOwiAQRP-FsyGwhUo9evcbCMsuUjWQlPZk_Hdp0oOeJjNvZt7Ch23Nfmu8-JnERWhx-s0wxCeXHdAjlHuVsZZ1mVHuFXnQJm-V-HU9un8HObTc14pJ0zkCEnBKYFEDo7MTKMOjGS116UYZY10KbgCDrPXgFA4RphjF5wvnhzeR:1vBg8y:nmrVcYlRkA1_zMVByUVTp2snRv3XT2FpUrvstaJO75w','2025-11-05 21:13:16.906525'),
('2mc816qschzcvhzjcf3vk53gis6laqi5','.eJxVjMEOwiAQRP-FsyGwhUo9evcbCMsuUjWQlPZk_Hdp0oOeJjNvZt7Ch23Nfmu8-JnERWhx-s0wxCeXHdAjlHuVsZZ1mVHuFXnQJm-V-HU9un8HObTc14pJ0zkCEnBKYFEDo7MTKMOjGS116UYZY10KbgCDrPXgFA4RphjF5wvnhzeR:1vBfh2:MJo7VkFeBga3ZxFVbmIq5O7tOUov3PJGtXtT9pcUelM','2025-11-05 20:44:24.745971'),
('2wvrk5ltbve9wrc2h319ehk83dfbkzg2','.eJxVjMEOwiAQRP-FsyGwhUo9evcbCMsuUjWQlPZk_Hdp0oOeJjNvZt7Ch23Nfmu8-JnERWhx-s0wxCeXHdAjlHuVsZZ1mVHuFXnQJm-V-HU9un8HObTc14pJ0zkCEnBKYFEDo7MTKMOjGS116UYZY10KbgCDrPXgFA4RphjF5wvnhzeR:1vBb7U:Us_GBFouV-QsFxnfNUlNEbM_awXNhw8m_UYQL7lr5Uk','2025-11-05 15:51:24.957342'),
('2xhg1cott10xs8wcjca6p8afmaco50lo','.eJxVjMEOwiAQRP-FsyGwhUo9evcbCMsuUjWQlPZk_Hdp0oOeJjNvZt7Ch23Nfmu8-JnERWhx-s0wxCeXHdAjlHuVsZZ1mVHuFXnQJm-V-HU9un8HObTc14pJ0zkCEnBKYFEDo7MTKMOjGS116UYZY10KbgCDrPXgFA4RphjF5wvnhzeR:1vBvjw:W32T-KIW6-HSUZF3c7gmnOd94h9oH0qeasfABd42l0Y','2025-11-06 13:52:28.221485'),
('3n1ndpm6mpcgd91d2yijz9ul7r4y7i4w','.eJxVjEEOwiAQRe_C2pCBSaG4dO8ZyMAMUjU0Ke3KeHdt0oVu_3vvv1Skba1x67LEidVZGXX63RLlh7Qd8J3abdZ5busyJb0r-qBdX2eW5-Vw_w4q9fqtBRyhRSnJGSIQ7xCKYQiEwfiMZSQiizaEgSBla1j8yMV5dIMPkNT7A-ZzN8I:1vA4Ei:fIXLyb7CpScnglPkcv09IQditRpCOY0qoB3XAE7JVNI','2025-11-01 10:32:32.227532'),
('3v8o2dhqbb8vv88fbig7cq7xqbt9xusg','.eJxVjMEOwiAQRP-FsyGwhUo9evcbCMsuUjWQlPZk_Hdp0oOeJjNvZt7Ch23Nfmu8-JnERWhx-s0wxCeXHdAjlHuVsZZ1mVHuFXnQJm-V-HU9un8HObTc14pJ0zkCEnBKYFEDo7MTKMOjGS116UYZY10KbgCDrPXgFA4RphjF5wvnhzeR:1vBWuT:zDnCx8GI-NC0r1RSnd9zZbFCnae3haJilW2h5BYlxDY','2025-11-05 11:21:41.050589'),
('55p72layib7jmswz2b72v6s350gmw9c4','.eJxVjMEOwiAQRP-FsyGwhUo9evcbCMsuUjWQlPZk_Hdp0oOeJjNvZt7Ch23Nfmu8-JnERWhx-s0wxCeXHdAjlHuVsZZ1mVHuFXnQJm-V-HU9un8HObTc14pJ0zkCEnBKYFEDo7MTKMOjGS116UYZY10KbgCDrPXgFA4RphjF5wvnhzeR:1vBe9K:CQ1caRUfEWw1p4_jNRWczFmu-hGOBebV-jzeFlXelBc','2025-11-05 19:05:30.339615'),
('65900yt04vrixlc7mvpllhzjbcnmnt5a','.eJxVjMEOwiAQRP-FsyGwhUo9evcbCMsuUjWQlPZk_Hdp0oOeJjNvZt7Ch23Nfmu8-JnERWhx-s0wxCeXHdAjlHuVsZZ1mVHuFXnQJm-V-HU9un8HObTc14pJ0zkCEnBKYFEDo7MTKMOjGS116UYZY10KbgCDrPXgFA4RphjF5wvnhzeR:1vBuX9:ALHhxj9Bk758ito8vawr3Cqh6c20R7XuboTZhk7pwUU','2025-11-06 12:35:11.690642'),
('878yuy5hj1ukzc0jou35lr27r8618wjs','.eJxVjMEOwiAQRP-FsyGwhUo9evcbCMsuUjWQlPZk_Hdp0oOeJjNvZt7Ch23Nfmu8-JnERWhx-s0wxCeXHdAjlHuVsZZ1mVHuFXnQJm-V-HU9un8HObTc14pJ0zkCEnBKYFEDo7MTKMOjGS116UYZY10KbgCDrPXgFA4RphjF5wvnhzeR:1vBeNQ:xC0aEynOFdsSxnotC8rBGuAmeLycVwXh03qGp7ZBhQI','2025-11-05 19:20:04.047416'),
('8v0pbmcp766izkzvj1aa7480j1qz433n','.eJxVjMEOwiAQRP-FsyGwhUo9evcbCMsuUjWQlPZk_Hdp0oOeJjNvZt7Ch23Nfmu8-JnERWhx-s0wxCeXHdAjlHuVsZZ1mVHuFXnQJm-V-HU9un8HObTc14pJ0zkCEnBKYFEDo7MTKMOjGS116UYZY10KbgCDrPXgFA4RphjF5wvnhzeR:1vBIl7:pGalhtsAYO4G2IwHxgGP5fZGoER4T350zVh3uNvdTp4','2025-11-04 20:15:05.176709'),
('977q3uifwv9is14de5xyg800xi4ijbpv','.eJxVjEEOwiAQRe_C2pCBSaG4dO8ZyMAMUjU0Ke3KeHdt0oVu_3vvv1Skba1x67LEidVZGXX63RLlh7Qd8J3abdZ5busyJb0r-qBdX2eW5-Vw_w4q9fqtBRyhRSnJGSIQ7xCKYQiEwfiMZSQiizaEgSBla1j8yMV5dIMPkNT7A-ZzN8I:1v9ptH:WZ5sj6rniv3Gs0rVrvgrIRK_f4mj2XWYVlZOdkeJaTM','2025-10-31 19:13:27.238558'),
('9b39xpbishdkteesp1opv836h74s1g1e','.eJxVjMEOwiAQRP-FsyGwhUo9evcbCMsuUjWQlPZk_Hdp0oOeJjNvZt7Ch23Nfmu8-JnERWhx-s0wxCeXHdAjlHuVsZZ1mVHuFXnQJm-V-HU9un8HObTc14pJ0zkCEnBKYFEDo7MTKMOjGS116UYZY10KbgCDrPXgFA4RphjF5wvnhzeR:1vByfM:yvLeNzJ7ULVrtIA30iYywz5Kr28HpSBogDVpZu4b5OU','2025-11-06 16:59:56.374098'),
('9fb3z862rou8taabd85neds08ba592zi','.eJxVjDsOwjAQBe_iGln-rT-U9JzBWnttHECOFCcV4u4QKQW0b2bei0Xc1ha3UZY4ETszxU6_W8L8KH0HdMd-m3me-7pMie8KP-jg15nK83K4fwcNR_vWQlVdPVkVdMi2eucBnBCmOOFsQmMlpUCARgKSAQg5a0muCAJjdUns_QHDDjdQ:1vA3eJ:omantxv4o7kiwHxO8lnH-tuiOwvK7x24wBykQEQgjno','2025-11-01 09:54:55.948158'),
('9my3njylo3tlcef1tudijctzt9jnkl88','.eJxVjMEOwiAQRP-FsyGwhUo9evcbCMsuUjWQlPZk_Hdp0oOeJjNvZt7Ch23Nfmu8-JnERWhx-s0wxCeXHdAjlHuVsZZ1mVHuFXnQJm-V-HU9un8HObTc14pJ0zkCEnBKYFEDo7MTKMOjGS116UYZY10KbgCDrPXgFA4RphjF5wvnhzeR:1vBuKh:KP4bm4GCNirGjWz484qRqBzc9KHpFg_vyj8pMaUGHkc','2025-11-06 12:22:19.098289'),
('9o8vgrnjblp888s5aravlwakiqrccx79','.eJxVjMEOwiAQRP-FsyGwhUo9evcbCMsuUjWQlPZk_Hdp0oOeJjNvZt7Ch23Nfmu8-JnERWhx-s0wxCeXHdAjlHuVsZZ1mVHuFXnQJm-V-HU9un8HObTc14pJ0zkCEnBKYFEDo7MTKMOjGS116UYZY10KbgCDrPXgFA4RphjF5wvnhzeR:1vBrae:ChyK_aBzUgF5mbLQQ17JFwKsH9cIaoWSkrQBdUhvrto','2025-11-06 09:26:36.553141'),
('9uap0ov8f6347y8wzwqlnwkv50zj2jpr','.eJxVjEEOwiAQRe_C2pCBSaG4dO8ZyMAMUjU0Ke3KeHdt0oVu_3vvv1Skba1x67LEidVZGXX63RLlh7Qd8J3abdZ5busyJb0r-qBdX2eW5-Vw_w4q9fqtBRyhRSnJGSIQ7xCKYQiEwfiMZSQiizaEgSBla1j8yMV5dIMPkNT7A-ZzN8I:1v9pqU:rEdagqnxWTx_rz_oVK1GKJxprhSR5JwehFrH2f-J_Tg','2025-10-31 19:10:34.696447'),
('a933kyv2sk0qnyxsp7xdn2lxczeveaaw','.eJxVjMEOwiAQRP-FsyGwhUo9evcbCMsuUjWQlPZk_Hdp0oOeJjNvZt7Ch23Nfmu8-JnERWhx-s0wxCeXHdAjlHuVsZZ1mVHuFXnQJm-V-HU9un8HObTc14pJ0zkCEnBKYFEDo7MTKMOjGS116UYZY10KbgCDrPXgFA4RphjF5wvnhzeR:1vBeZT:hLSQMAyGSxr-ba2FglKaG9xPiYDEfSOdZKqXKuz_cEg','2025-11-05 19:32:31.612459'),
('aal0c6yuaw8wn0qyutanumoa6vf8g648','.eJxVjMEOwiAQRP-FsyGwhUo9evcbCMsuUjWQlPZk_Hdp0oOeJjNvZt7Ch23Nfmu8-JnERWhx-s0wxCeXHdAjlHuVsZZ1mVHuFXnQJm-V-HU9un8HObTc14pJ0zkCEnBKYFEDo7MTKMOjGS116UYZY10KbgCDrPXgFA4RphjF5wvnhzeR:1vBent:5w54dUt-tBJ0gmyTwutpsCpNuCRkn8VVaSr-GfUwlDY','2025-11-05 19:47:25.184964'),
('adswz2ngyx6ih42xyztayvp8742ova4s','.eJxVjDsOwjAQBe_iGln-rT-U9JzBWnttHECOFCcV4u4QKQW0b2bei0Xc1ha3UZY4ETszxU6_W8L8KH0HdMd-m3me-7pMie8KP-jg15nK83K4fwcNR_vWQlVdPVkVdMi2eucBnBCmOOFsQmMlpUCARgKSAQg5a0muCAJjdUns_QHDDjdQ:1vAegA:ENZejU33AWw_UN8oNkpVoiDYnPCXqQmX1CG0WYUSx3M','2025-11-03 01:27:18.256686'),
('ai7yqmzt0tyo4zyq5dx7fqbzdzjc2dfj','.eJxVjEEOwiAQRe_C2pCBSaG4dO8ZyMAMUjU0Ke3KeHdt0oVu_3vvv1Skba1x67LEidVZGXX63RLlh7Qd8J3abdZ5busyJb0r-qBdX2eW5-Vw_w4q9fqtBRyhRSnJGSIQ7xCKYQiEwfiMZSQiizaEgSBla1j8yMV5dIMPkNT7A-ZzN8I:1vA4Un:Lp84Po2LzRGlgklcQj6N5s3vYWrweBgHuelQe9CCE38','2025-11-01 10:49:09.685001'),
('ain78e6xwb3lg0du7b51svmocf1szevl','.eJxVjDsOwjAQBe_iGln-rT-U9JzBWnttHECOFCcV4u4QKQW0b2bei0Xc1ha3UZY4ETszxU6_W8L8KH0HdMd-m3me-7pMie8KP-jg15nK83K4fwcNR_vWQlVdPVkVdMi2eucBnBCmOOFsQmMlpUCARgKSAQg5a0muCAJjdUns_QHDDjdQ:1vAObp:VN7Dlzvg1Zp0iA7e4eCCqbdRnYD6ctrIYhKUV2VrgXw','2025-11-02 08:17:45.683209'),
('bmmz4awdwvj7hxtvrwzawpd5uuob3xqb','.eJxVjMEOwiAQRP-FsyGwhUo9evcbCMsuUjWQlPZk_Hdp0oOeJjNvZt7Ch23Nfmu8-JnERWhx-s0wxCeXHdAjlHuVsZZ1mVHuFXnQJm-V-HU9un8HObTc14pJ0zkCEnBKYFEDo7MTKMOjGS116UYZY10KbgCDrPXgFA4RphjF5wvnhzeR:1vBeWf:kfLHexhN3jrJsr6gfn72wGgzV4IFsbzaTyzuj7Q_aOM','2025-11-05 19:29:37.141306'),
('bs3wmwo89f8onrmwujo42dgl6v304ktl','.eJxVjMEOwiAQRP-FsyGwhUo9evcbCMsuUjWQlPZk_Hdp0oOeJjNvZt7Ch23Nfmu8-JnERWhx-s0wxCeXHdAjlHuVsZZ1mVHuFXnQJm-V-HU9un8HObTc14pJ0zkCEnBKYFEDo7MTKMOjGS116UYZY10KbgCDrPXgFA4RphjF5wvnhzeR:1vBkiT:HWDwPEzTg3UbAZbQqn6q4sxp9rOGAJFN45g5ILkLS3Q','2025-11-06 02:06:13.139318'),
('cpsnj099zc2vd6xp8u01wh34x24ha71j','.eJxVjMEOwiAQRP-FsyGwhUo9evcbCMsuUjWQlPZk_Hdp0oOeJjNvZt7Ch23Nfmu8-JnERWhx-s0wxCeXHdAjlHuVsZZ1mVHuFXnQJm-V-HU9un8HObTc14pJ0zkCEnBKYFEDo7MTKMOjGS116UYZY10KbgCDrPXgFA4RphjF5wvnhzeR:1vBHhI:AjzQmVRROCeyaEyKKqEPCe9JNg89e3AGu0GaLAY3bRM','2025-11-04 19:07:04.153011'),
('eeceg4x5w6sgsuyl51jy4pa3ymh2imma','.eJxVjEEOgjAQRe_StWmmnQ5Ul-45A5lpR4saSCisjHcXEha6fe_9_zY9r0vp16pzP2RzMYTm9AuF01PH3eQHj_fJpmlc5kHsntjDVttNWV_Xo_07KFzLtj6jupsnaEiSRB-DggpQC442HlqWFBI2SQNxVM8eo0NAEHQs0Abz-QL0kjdN:1vBgEf:NW-URUXQysDfgTgVb5mgVsqA2xj69wAYSVzRUYohl0Q','2025-11-05 21:19:09.838364'),
('efvx99pyv0c0v6jbr148fmgpwmzani8v','.eJxVjMEOwiAQRP-FsyGwhUo9evcbCMsuUjWQlPZk_Hdp0oOeJjNvZt7Ch23Nfmu8-JnERWhx-s0wxCeXHdAjlHuVsZZ1mVHuFXnQJm-V-HU9un8HObTc14pJ0zkCEnBKYFEDo7MTKMOjGS116UYZY10KbgCDrPXgFA4RphjF5wvnhzeR:1vBg2g:7n9YFVYLZizjw7KSzEXxW70VQftcwu4Sa6QKm15-qNo','2025-11-05 21:06:46.569117'),
('ejeb8auiuhdgyl3jplf85mgi3i8eddzv','.eJxVjMEOwiAQRP-FsyGwhUo9evcbCMsuUjWQlPZk_Hdp0oOeJjNvZt7Ch23Nfmu8-JnERWhx-s0wxCeXHdAjlHuVsZZ1mVHuFXnQJm-V-HU9un8HObTc14pJ0zkCEnBKYFEDo7MTKMOjGS116UYZY10KbgCDrPXgFA4RphjF5wvnhzeR:1vBrER:74O1rYse3K6wOgN2OAxwf_dg3ro8WeYliqo7mEix4u4','2025-11-06 09:03:39.577797'),
('eos4xyyy0o0ld3yoskmy9qssh8lkfd3n','.eJxVjMEOwiAQRP-FsyGwhUo9evcbCMsuUjWQlPZk_Hdp0oOeJjNvZt7Ch23Nfmu8-JnERWhx-s0wxCeXHdAjlHuVsZZ1mVHuFXnQJm-V-HU9un8HObTc14pJ0zkCEnBKYFEDo7MTKMOjGS116UYZY10KbgCDrPXgFA4RphjF5wvnhzeR:1vBcpT:Z7UQALkKyt0HHl0WbVo_rJ3xDl8NOVcrYypOX_J5oZU','2025-11-05 17:40:55.948081'),
('fjbtfmv9rzyb1bh5m1y78j2wyo5yvrru','.eJxVjMEOwiAQRP-FsyGwhUo9evcbCMsuUjWQlPZk_Hdp0oOeJjNvZt7Ch23Nfmu8-JnERWhx-s0wxCeXHdAjlHuVsZZ1mVHuFXnQJm-V-HU9un8HObTc14pJ0zkCEnBKYFEDo7MTKMOjGS116UYZY10KbgCDrPXgFA4RphjF5wvnhzeR:1vBY6L:a4AM1ohbEq00BOFu2tci0Xg-6FGm1vY72ojLF1J8Pig','2025-11-05 12:38:01.162556'),
('fv5kipksk1xfm03bysw4jjnjwe8cn7ju','.eJxVjEEOwiAQRe_C2pCBSaG4dO8ZyMAMUjU0Ke3KeHdt0oVu_3vvv1Skba1x67LEidVZGXX63RLlh7Qd8J3abdZ5busyJb0r-qBdX2eW5-Vw_w4q9fqtBRyhRSnJGSIQ7xCKYQiEwfiMZSQiizaEgSBla1j8yMV5dIMPkNT7A-ZzN8I:1vA4Z2:4ivL02YzC47Dk_iKtyZZaQZV4EIJ8mLGBESHyKV6cfg','2025-11-01 10:53:32.931032'),
('ghtwj5b90sakdb4hv9uy7v1wh68rkgwj','.eJxVjMEOwiAQRP-FsyGwhUo9evcbCMsuUjWQlPZk_Hdp0oOeJjNvZt7Ch23Nfmu8-JnERWhx-s0wxCeXHdAjlHuVsZZ1mVHuFXnQJm-V-HU9un8HObTc14pJ0zkCEnBKYFEDo7MTKMOjGS116UYZY10KbgCDrPXgFA4RphjF5wvnhzeR:1vCJ77:NuVMWBzJ9ubbrAZO-mA3cj6Ep2thz32xi0G0AgaPfXs','2025-11-07 14:49:57.471252'),
('gnqalhcn5k7u1gi7gtk93irolwdngiuu','.eJxVjMsOwiAQRf-FtSG8CoxL934DGWCQqoGktCvjv2uTLnR7zzn3xQJuaw3boCXMmZ2ZVOz0O0ZMD2o7yXdst85Tb-syR74r_KCDX3um5-Vw_w4qjvqtExoiSsKrAkWUyeoYhUPQPgutrAQ7CZm18No56TxEa3zKVFJEr8EAe38ACRo3tw:1vA6lH:1eWHsntEkUKraJu3VsBlEfud7-zjurD2AOp_cdRwOS8','2025-11-01 13:14:19.973032'),
('gq6ytl3b9b1gd56d17a26jbqx6g3a3nb','.eJxVjMEOwiAQRP-FsyGwhUo9evcbCMsuUjWQlPZk_Hdp0oOeJjNvZt7Ch23Nfmu8-JnERWhx-s0wxCeXHdAjlHuVsZZ1mVHuFXnQJm-V-HU9un8HObTc14pJ0zkCEnBKYFEDo7MTKMOjGS116UYZY10KbgCDrPXgFA4RphjF5wvnhzeR:1vBytp:cyTDPUl5s70pKSDbz9PdnwifYh8omqoBBGooIfz4QqY','2025-11-06 17:14:53.680171'),
('h4j3m659tsod6r8c82bmnrurwdi7f4bj','.eJxVjEEOwiAQRe_C2pCBSaG4dO8ZyMAMUjU0Ke3KeHdt0oVu_3vvv1Skba1x67LEidVZGXX63RLlh7Qd8J3abdZ5busyJb0r-qBdX2eW5-Vw_w4q9fqtBRyhRSnJGSIQ7xCKYQiEwfiMZSQiizaEgSBla1j8yMV5dIMPkNT7A-ZzN8I:1vA4Za:QJvlaEar1kR27ClFXBfz6XZviW9d6wErgQaYHjywRuk','2025-11-01 10:54:06.843978'),
('hzsk6915ydrb1qd9mz67qn2e00b5kxpg','.eJxVjEEOwiAQRe_C2pCBSaG4dO8ZyMAMUjU0Ke3KeHdt0oVu_3vvv1Skba1x67LEidVZGXX63RLlh7Qd8J3abdZ5busyJb0r-qBdX2eW5-Vw_w4q9fqtBRyhRSnJGSIQ7xCKYQiEwfiMZSQiizaEgSBla1j8yMV5dIMPkNT7A-ZzN8I:1vA4hl:48NSn1pPnQW6efZG2sqZimF6c8c8csL_nQUCz-K6kLM','2025-11-01 11:02:33.151044'),
('ip5rftxbrq7bbxd4i20atfsicy518mb2','.eJxVjMEOwiAQRP-FsyGwhUo9evcbCMsuUjWQlPZk_Hdp0oOeJjNvZt7Ch23Nfmu8-JnERWhx-s0wxCeXHdAjlHuVsZZ1mVHuFXnQJm-V-HU9un8HObTc14pJ0zkCEnBKYFEDo7MTKMOjGS116UYZY10KbgCDrPXgFA4RphjF5wvnhzeR:1vBjL0:RhiLTyok0ddVBmKyVDvj3CEVBfMF9DLiW4fcidXnOrY','2025-11-06 00:37:54.510125'),
('jva21tu74neoxctgrixdcfjdvubgmr5d','.eJxVjMEOwiAQRP-FsyGwhUo9evcbCMsuUjWQlPZk_Hdp0oOeJjNvZt7Ch23Nfmu8-JnERWhx-s0wxCeXHdAjlHuVsZZ1mVHuFXnQJm-V-HU9un8HObTc14pJ0zkCEnBKYFEDo7MTKMOjGS116UYZY10KbgCDrPXgFA4RphjF5wvnhzeR:1vBb7U:Us_GBFouV-QsFxnfNUlNEbM_awXNhw8m_UYQL7lr5Uk','2025-11-05 15:51:24.063768'),
('k5drhz33hsomm6dt73y2khjjvn37eium','.eJxVjMEOwiAQRP-FsyGwhUo9evcbCMsuUjWQlPZk_Hdp0oOeJjNvZt7Ch23Nfmu8-JnERWhx-s0wxCeXHdAjlHuVsZZ1mVHuFXnQJm-V-HU9un8HObTc14pJ0zkCEnBKYFEDo7MTKMOjGS116UYZY10KbgCDrPXgFA4RphjF5wvnhzeR:1vBeYQ:Okyxrebque2N0ZpYxvP1YOb7rTYvPkMTKHXf_MdHEds','2025-11-05 19:31:26.592186'),
('k9vrjjly7cykovfdo7lxtdjk6m7cddb0','.eJxVjMsOwiAQRf-FtSG8CoxL934DGWCQqoGktCvjv2uTLnR7zzn3xQJuaw3boCXMmZ2ZVOz0O0ZMD2o7yXdst85Tb-syR74r_KCDX3um5-Vw_w4qjvqtExoiSsKrAkWUyeoYhUPQPgutrAQ7CZm18No56TxEa3zKVFJEr8EAe38ACRo3tw:1vArdU:bpXuhdynWgEfcNd0uXOmwaFPc5cqLnD6CCLVf29Aupw','2025-11-03 15:17:24.607807'),
('lnsjdpbcte9yv1809tjo1o3y172wnti4','.eJxVjEEOwiAQRe_C2pCBSaG4dO8ZyMAMUjU0Ke3KeHdt0oVu_3vvv1Skba1x67LEidVZGXX63RLlh7Qd8J3abdZ5busyJb0r-qBdX2eW5-Vw_w4q9fqtBRyhRSnJGSIQ7xCKYQiEwfiMZSQiizaEgSBla1j8yMV5dIMPkNT7A-ZzN8I:1vAUgI:BNup4-92wo_R2I8wFzPEOrqXqAfLxXO0GR9mQpeF9b0','2025-11-02 14:46:46.406600'),
('mgfqp1zgw42tpsteo2vcr8putyc7mya9','.eJxVjEEOwiAQRe_C2pCBSaG4dO8ZyMAMUjU0Ke3KeHdt0oVu_3vvv1Skba1x67LEidVZGXX63RLlh7Qd8J3abdZ5busyJb0r-qBdX2eW5-Vw_w4q9fqtBRyhRSnJGSIQ7xCKYQiEwfiMZSQiizaEgSBla1j8yMV5dIMPkNT7A-ZzN8I:1vAT5H:GIkFNovbvVc58gTyxw38x_iIZYYGoFmDPE0qS54hKos','2025-11-02 13:04:27.345496'),
('mxqvzycyatqwgm72ys5z59oh9bgqyj7m','.eJxVjEEOwiAQRe_C2pCBSaG4dO8ZyMAMUjU0Ke3KeHdt0oVu_3vvv1Skba1x67LEidVZGXX63RLlh7Qd8J3abdZ5busyJb0r-qBdX2eW5-Vw_w4q9fqtBRyhRSnJGSIQ7xCKYQiEwfiMZSQiizaEgSBla1j8yMV5dIMPkNT7A-ZzN8I:1vAAbc:LOOipc7lXoYwxnTCFI0FePQcNJ0mSgQITJLGkbTV-bg','2025-11-01 17:20:36.835943'),
('n32g325wi9pxkej2ccejp3xhswzj36ey','.eJxVjEEOwiAQRe_C2pCBSaG4dO8ZyMAMUjU0Ke3KeHdt0oVu_3vvv1Skba1x67LEidVZGXX63RLlh7Qd8J3abdZ5busyJb0r-qBdX2eW5-Vw_w4q9fqtBRyhRSnJGSIQ7xCKYQiEwfiMZSQiizaEgSBla1j8yMV5dIMPkNT7A-ZzN8I:1v9pd4:x8aZE1_0bZyTkaQ84Bt3VpzaUWC-LBRcVtrXYBgQh9I','2025-10-31 18:56:42.008859'),
('nigndd7ebql323rb7q9vxn46md99vo7i','.eJxVjMEOwiAQRP-FsyGwhUo9evcbCMsuUjWQlPZk_Hdp0oOeJjNvZt7Ch23Nfmu8-JnERWhx-s0wxCeXHdAjlHuVsZZ1mVHuFXnQJm-V-HU9un8HObTc14pJ0zkCEnBKYFEDo7MTKMOjGS116UYZY10KbgCDrPXgFA4RphjF5wvnhzeR:1vBydq:BZiPAZ_LVZov9J-R32ytyg_lz9UY-wzLWrt7eQJkCqU','2025-11-06 16:58:22.791122'),
('oua5sa50adh742ws28ctujr76z28rgqg','.eJxVjMsOwiAQRf-FtSG8CoxL934DGWCQqoGktCvjv2uTLnR7zzn3xQJuaw3boCXMmZ2ZVOz0O0ZMD2o7yXdst85Tb-syR74r_KCDX3um5-Vw_w4qjvqtExoiSsKrAkWUyeoYhUPQPgutrAQ7CZm18No56TxEa3zKVFJEr8EAe38ACRo3tw:1vA0lG:0U8V0U46VBUUrPAVBkzHdk9wexDYyydrcA4l2ucD63Y','2025-11-01 06:49:54.789844'),
('p5veo8kmhxqy97gsmahdq47tclnk3t10','.eJxVjEEOwiAQRe_C2pCBSaG4dO8ZyMAMUjU0Ke3KeHdt0oVu_3vvv1Skba1x67LEidVZGXX63RLlh7Qd8J3abdZ5busyJb0r-qBdX2eW5-Vw_w4q9fqtBRyhRSnJGSIQ7xCKYQiEwfiMZSQiizaEgSBla1j8yMV5dIMPkNT7A-ZzN8I:1vA4kz:jfNvs8kaGlhReyWv-lcr2eeETUjJ8LkM8yE90MRx-cU','2025-11-01 11:05:53.119702'),
('pqxn528f8uovwx6mlr9n26d63ninelxw','.eJxVjMEOwiAQRP-FsyGwhUo9evcbCMsuUjWQlPZk_Hdp0oOeJjNvZt7Ch23Nfmu8-JnERWhx-s0wxCeXHdAjlHuVsZZ1mVHuFXnQJm-V-HU9un8HObTc14pJ0zkCEnBKYFEDo7MTKMOjGS116UYZY10KbgCDrPXgFA4RphjF5wvnhzeR:1vBHuB:x_hPEh2edjPX42p1ohMkRuLNGG8N68VsviRZZHWNBIk','2025-11-04 19:20:23.740908'),
('pvgp3s4wkf8ywr80354d5a557yapxp5z','.eJxVjMEOwiAQRP-FsyGwhUo9evcbCMsuUjWQlPZk_Hdp0oOeJjNvZt7Ch23Nfmu8-JnERWhx-s0wxCeXHdAjlHuVsZZ1mVHuFXnQJm-V-HU9un8HObTc14pJ0zkCEnBKYFEDo7MTKMOjGS116UYZY10KbgCDrPXgFA4RphjF5wvnhzeR:1vBuXm:knzAUf2TPXAzud2z-buI5Zh0KPtSZ2gOpP61XcLrDmE','2025-11-06 12:35:50.801382'),
('pxaahpad7j9it1xkfgdfr60b7e4itote','.eJxVjEEOwiAQRe_C2pCBSaG4dO8ZyMAMUjU0Ke3KeHdt0oVu_3vvv1Skba1x67LEidVZGXX63RLlh7Qd8J3abdZ5busyJb0r-qBdX2eW5-Vw_w4q9fqtBRyhRSnJGSIQ7xCKYQiEwfiMZSQiizaEgSBla1j8yMV5dIMPkNT7A-ZzN8I:1vB8pR:nN9kmErpEDzFvefCRVWkpXRz6O7b-a1dF3AeABGFiBQ','2025-11-04 09:38:53.481300'),
('qfcze7waoyj36hyq6n408htczytxdkfe','.eJxVjMEOwiAQRP-FsyGwhUo9evcbCMsuUjWQlPZk_Hdp0oOeJjNvZt7Ch23Nfmu8-JnERWhx-s0wxCeXHdAjlHuVsZZ1mVHuFXnQJm-V-HU9un8HObTc14pJ0zkCEnBKYFEDo7MTKMOjGS116UYZY10KbgCDrPXgFA4RphjF5wvnhzeR:1vBrDe:Kv8mNIwvnCKPtQ0NMcmTR-LJ7XrCg88wCSJ8uG9q_VQ','2025-11-06 09:02:50.949804'),
('qxspido8bqj95itix78um48xoeh4i5rt','.eJxVjMsOwiAQRf-FtSG8CoxL934DGWCQqoGktCvjv2uTLnR7zzn3xQJuaw3boCXMmZ2ZVOz0O0ZMD2o7yXdst85Tb-syR74r_KCDX3um5-Vw_w4qjvqtExoiSsKrAkWUyeoYhUPQPgutrAQ7CZm18No56TxEa3zKVFJEr8EAe38ACRo3tw:1vA0QU:vm4sbObqpqLowEF3KF7T1MYB-UaXQPzx6S0gJxOw68g','2025-11-01 06:28:26.361980'),
('r7bk2xb0806b5gdaifi5q9xk0azhu1d9','.eJxVjEEOwiAQRe_C2pCBSaG4dO8ZyMAMUjU0Ke3KeHdt0oVu_3vvv1Skba1x67LEidVZGXX63RLlh7Qd8J3abdZ5busyJb0r-qBdX2eW5-Vw_w4q9fqtBRyhRSnJGSIQ7xCKYQiEwfiMZSQiizaEgSBla1j8yMV5dIMPkNT7A-ZzN8I:1vA4Dx:fxibv6Rlc_E8RsAFNEsqIz_IUICfbR52NSWLz83p1rE','2025-11-01 10:31:45.056273'),
('sjqsa0d83oypqa4ayvkf4qzg7t71qz93','.eJxVjMEOwiAQRP-FsyGwhUo9evcbCMsuUjWQlPZk_Hdp0oOeJjNvZt7Ch23Nfmu8-JnERWhx-s0wxCeXHdAjlHuVsZZ1mVHuFXnQJm-V-HU9un8HObTc14pJ0zkCEnBKYFEDo7MTKMOjGS116UYZY10KbgCDrPXgFA4RphjF5wvnhzeR:1vBrLf:avGvN2srgXevtaVx2CXnZi9DkE-9rAdBUk-CDdI-wP0','2025-11-06 09:11:07.648651'),
('ttq7r67t6p9vo67d6zobylbxzmyc18hn','.eJxVjEEOwiAQRe_C2pCBSaG4dO8ZyMAMUjU0Ke3KeHdt0oVu_3vvv1Skba1x67LEidVZGXX63RLlh7Qd8J3abdZ5busyJb0r-qBdX2eW5-Vw_w4q9fqtBRyhRSnJGSIQ7xCKYQiEwfiMZSQiizaEgSBla1j8yMV5dIMPkNT7A-ZzN8I:1vATCL:nJo1baKG9i-u8t8-uu0fwbayFRKtmiQ5caHZqvM7Yvk','2025-11-02 13:11:45.930190'),
('untzfw0ly064pyx86lxoa69qdtjkiycj','.eJxVjMEOwiAQRP-FsyGwhUo9evcbCMsuUjWQlPZk_Hdp0oOeJjNvZt7Ch23Nfmu8-JnERWhx-s0wxCeXHdAjlHuVsZZ1mVHuFXnQJm-V-HU9un8HObTc14pJ0zkCEnBKYFEDo7MTKMOjGS116UYZY10KbgCDrPXgFA4RphjF5wvnhzeR:1vByeD:XzbSXQEIwA7adPLRjun421NSIvz3uvEQGKWzVfmIp1E','2025-11-06 16:58:45.178282'),
('v8l8n1batfjeluz3snj1aqt3g0y5540g','.eJxVjMEOwiAQRP-FsyGwhUo9evcbCMsuUjWQlPZk_Hdp0oOeJjNvZt7Ch23Nfmu8-JnERWhx-s0wxCeXHdAjlHuVsZZ1mVHuFXnQJm-V-HU9un8HObTc14pJ0zkCEnBKYFEDo7MTKMOjGS116UYZY10KbgCDrPXgFA4RphjF5wvnhzeR:1vBXdM:lkSCJDf7TnFm7b8COV6bdvnPOof9DWhgiHRnlE1Q1KQ','2025-11-05 12:08:04.640172'),
('wn96x4zciylxdppu2f9cpfzuqzo2udho','.eJxVjEEOwiAQRe_C2pCBSaG4dO8ZyMAMUjU0Ke3KeHdt0oVu_3vvv1Skba1x67LEidVZGXX63RLlh7Qd8J3abdZ5busyJb0r-qBdX2eW5-Vw_w4q9fqtBRyhRSnJGSIQ7xCKYQiEwfiMZSQiizaEgSBla1j8yMV5dIMPkNT7A-ZzN8I:1vATCL:nJo1baKG9i-u8t8-uu0fwbayFRKtmiQ5caHZqvM7Yvk','2025-11-02 13:11:45.502130'),
('x5b2mljajmok4w840n77utx6c3ci1f3p','.eJxVjMEOwiAQRP-FsyGwhUo9evcbCMsuUjWQlPZk_Hdp0oOeJjNvZt7Ch23Nfmu8-JnERWhx-s0wxCeXHdAjlHuVsZZ1mVHuFXnQJm-V-HU9un8HObTc14pJ0zkCEnBKYFEDo7MTKMOjGS116UYZY10KbgCDrPXgFA4RphjF5wvnhzeR:1vBubJ:ZnocBntx_EHve35luQW2nV6M14VTUpOeYiSDLpqOkTQ','2025-11-06 12:39:29.653629'),
('ydkclf0zpso2np822wcyfagdyr0fra5s','.eJxVjMEOwiAQRP-FsyGwhUo9evcbCMsuUjWQlPZk_Hdp0oOeJjNvZt7Ch23Nfmu8-JnERWhx-s0wxCeXHdAjlHuVsZZ1mVHuFXnQJm-V-HU9un8HObTc14pJ0zkCEnBKYFEDo7MTKMOjGS116UYZY10KbgCDrPXgFA4RphjF5wvnhzeR:1vBkUW:pqPRqdI6FniqRB2KOplNhX1xe3BR7pItVbzsjHFExKA','2025-11-06 01:51:48.727486'),
('ywfe6r13dr11j04mtf40s7e88u64g0gf','.eJxVjMEOwiAQRP-FsyGwhUo9evcbCMsuUjWQlPZk_Hdp0oOeJjNvZt7Ch23Nfmu8-JnERWhx-s0wxCeXHdAjlHuVsZZ1mVHuFXnQJm-V-HU9un8HObTc14pJ0zkCEnBKYFEDo7MTKMOjGS116UYZY10KbgCDrPXgFA4RphjF5wvnhzeR:1vBIjx:ogGVD-zvx7_AEvZ6hYYQZgSJmrRgGvpGNRBKZBbgN_I','2025-11-04 20:13:53.065679'),
('z62jqshaclg47qzamspwhzcjdztkepcg','.eJxVjEEOwiAQRe_C2pCBSaG4dO8ZyMAMUjU0Ke3KeHdt0oVu_3vvv1Skba1x67LEidVZGXX63RLlh7Qd8J3abdZ5busyJb0r-qBdX2eW5-Vw_w4q9fqtBRyhRSnJGSIQ7xCKYQiEwfiMZSQiizaEgSBla1j8yMV5dIMPkNT7A-ZzN8I:1vA4w1:ex8WoD8cC5p9c3m5DR_SrQq85_o5QGO4lEqJoMInfNE','2025-11-01 11:17:17.511375'),
('z6vyauivvejhetw09hihywsylqu0gddu','.eJxVjEEOwiAQRe_C2pCBSaG4dO8ZyMAMUjU0Ke3KeHdt0oVu_3vvv1Skba1x67LEidVZGXX63RLlh7Qd8J3abdZ5busyJb0r-qBdX2eW5-Vw_w4q9fqtBRyhRSnJGSIQ7xCKYQiEwfiMZSQiizaEgSBla1j8yMV5dIMPkNT7A-ZzN8I:1vA4dV:6qRcAZMd7zYyXvUdc45J82wD_KnUqt6Bl07YiQ159kg','2025-11-01 10:58:09.496924'),
('zbqm9sapk7x3luafa4i5u9sjofgh2qaz','.eJxVjEEOwiAQRe_C2pCBSaG4dO8ZyMAMUjU0Ke3KeHdt0oVu_3vvv1Skba1x67LEidVZGXX63RLlh7Qd8J3abdZ5busyJb0r-qBdX2eW5-Vw_w4q9fqtBRyhRSnJGSIQ7xCKYQiEwfiMZSQiizaEgSBla1j8yMV5dIMPkNT7A-ZzN8I:1vA4zX:jMueHzOqiHMGnOKNgWAIoSx4Oh31xHIbU2pJ7ECTVzI','2025-11-01 11:20:55.050904');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'aliuts'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2025-10-25  3:09:03
