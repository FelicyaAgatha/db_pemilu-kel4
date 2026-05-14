-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for tugas_basdat
CREATE DATABASE IF NOT EXISTS `tugas_basdat` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `tugas_basdat`;

-- Dumping structure for table tugas_basdat.calon
CREATE TABLE IF NOT EXISTS `calon` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_periode` int DEFAULT NULL,
  `id_ketua` int DEFAULT NULL,
  `id_wakil` int DEFAULT NULL,
  `id_organisasi` int DEFAULT NULL,
  `visi` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `misi` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `proker` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `foto` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`),
  KEY `FK_calon_periode` (`id_periode`),
  KEY `id_siswa` (`id_organisasi`,`id_periode`,`id_wakil`) USING BTREE,
  KEY `fk_ketua` (`id_ketua`),
  KEY `fk_wakil` (`id_wakil`),
  CONSTRAINT `FK_calon_organisasi` FOREIGN KEY (`id_organisasi`) REFERENCES `organisasi` (`id`),
  CONSTRAINT `FK_calon_periode` FOREIGN KEY (`id_periode`) REFERENCES `periode` (`id`),
  CONSTRAINT `fk_ketua` FOREIGN KEY (`id_ketua`) REFERENCES `siswa` (`id_siswa`),
  CONSTRAINT `fk_wakil` FOREIGN KEY (`id_wakil`) REFERENCES `siswa` (`id_siswa`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table tugas_basdat.calon: ~4 rows (approximately)
INSERT INTO `calon` (`id`, `id_periode`, `id_ketua`, `id_wakil`, `id_organisasi`, `visi`, `misi`, `proker`, `foto`) VALUES
	(1, 1, 116, 101, 2, 'mante', 'keren', 'mbg', 'riska.jpeg'),
	(2, 1, 103, 108, 2, 'hehe', 'haha', 'huhu', 'riska.jpeg'),
	(3, 1, 122, 98, 1, 'osis', 'yang', 'hebat', 'abby.jpeg'),
	(4, 1, 101, 113, 1, 'mwehwhw', 'hdup', 'jokiwi', 'abby.jpeg');

-- Dumping structure for table tugas_basdat.detail_kelas
CREATE TABLE IF NOT EXISTS `detail_kelas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kode_kelas` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `detail_kelas` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `deskripsi` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `kode_jurusan` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_active` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `kode_kelas` (`kode_kelas`),
  KEY `kode_jurusan` (`kode_jurusan`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table tugas_basdat.detail_kelas: ~12 rows (approximately)
INSERT INTO `detail_kelas` (`id`, `kode_kelas`, `detail_kelas`, `deskripsi`, `kode_jurusan`, `is_active`) VALUES
	(58, 'kls01', '01', 'Kelas 11 RPL', 'JS-01', 'Y'),
	(59, 'kls02', '01', 'Kelas 11 RPL', 'JS-01', 'Y'),
	(60, 'kls03', '01', 'Kelas 11 RPL', 'JS-01', 'Y'),
	(61, 'kls01', '01', 'Kelas 11 RPL', 'JS-02', 'Y'),
	(62, 'kls02', '01', 'Kelas 11 RPL', 'JS-02', 'Y'),
	(63, 'kls03', '01', 'Kelas 11 RPL', 'JS-02', 'Y'),
	(64, 'kls01', '01', 'Kelas 11 RPL', 'JS-03', 'Y'),
	(65, 'kls02', '01', 'Kelas 11 RPL', 'JS-03', 'Y'),
	(66, 'kls03', '01', 'Kelas 11 RPL', 'JS-03', 'Y'),
	(67, 'kls01', '01', 'Kelas 11 RPL', 'JS-04', 'Y'),
	(68, 'kls02', '01', 'Kelas 11 RPL', 'JS-04', 'Y'),
	(69, 'kls03', '01', 'Kelas 11 RPL', 'JS-04', 'Y');

-- Dumping structure for table tugas_basdat.guru
CREATE TABLE IF NOT EXISTS `guru` (
  `id_guru` int NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `no_telepon` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `jenis_kelamin` enum('L','P') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_active` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id_guru`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table tugas_basdat.guru: ~14 rows (approximately)
INSERT INTO `guru` (`id_guru`, `nama`, `no_telepon`, `jenis_kelamin`, `is_active`) VALUES
	(63, 'Denisa Ramadanti', '081283998980', 'P', 'Y'),
	(64, 'Lidiawati', '081584973322', 'P', 'Y'),
	(65, 'Sri Rahayu', '085818703288', 'P', 'Y'),
	(66, 'Muhammad Haerudin', '081283998980', 'L', 'Y'),
	(67, 'Sediana Hadisujatma', '081584973322', 'L', 'Y'),
	(68, 'Naufal Irgi Ramadhan', '085818703288', 'L', 'Y'),
	(69, 'Ade Supriadi', '081283998980', 'L', 'Y'),
	(70, 'Eka Ayu Kurniasih', '081584973322', 'P', 'Y'),
	(71, 'Andika Mahendra', '085818703288', 'L', 'Y'),
	(72, 'Susiana', '081283998980', 'P', 'Y'),
	(73, 'Eka Riana', '081584973322', 'P', 'Y'),
	(74, 'Sukron Ansori', '081285935539', 'L', 'Y'),
	(75, 'rina', '08123462507', 'L', 'N'),
	(78, 'muntahar', '0987653450', 'L', 'Y');

-- Dumping structure for table tugas_basdat.guru_old
CREATE TABLE IF NOT EXISTS `guru_old` (
  `id_guru` int NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `gelar` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nik` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `no_telepon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `alamat` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status_kepegawaian` enum('UMUM','PRODUKTIF') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `jenis_kelamin` enum('L','P') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `mapel` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `kelas_diajar` enum('10','11','12') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `tempat_lahir` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  UNIQUE KEY `id_guru` (`id_guru`)
) ENGINE=InnoDB AUTO_INCREMENT=260 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table tugas_basdat.guru_old: ~65 rows (approximately)
INSERT INTO `guru_old` (`id_guru`, `nama`, `gelar`, `nik`, `nip`, `no_telepon`, `alamat`, `status_kepegawaian`, `email`, `jenis_kelamin`, `mapel`, `kelas_diajar`, `tempat_lahir`, `tanggal_lahir`) VALUES
	(195, 'Bu Denisa Ramadanti', 'S,Pd', '', '', '081283998980', 'Jl.anggur 10 no 46 perumnas 2 parungpanjang', 'UMUM', 'denisarmdnii@gmail.com', 'P', 'Bk', '11', 'Bogor', '2000-12-10'),
	(196, 'Lidiawati', 'S,Pd', '', '', '0815-8477-3332', 'Jagabita', 'UMUM', 'lialidiawati485@gmail.com', 'P', 'B. Indonesia', '11', 'Bogor', '1992-06-03'),
	(197, 'Sri Rahayu', 'S,E', '', '', '085881703228', 'Jagabaya', 'UMUM', 'zrie.y4yu0590@gmail.com', 'P', 'Pkwu', '11', 'Bogor', '1990-04-05'),
	(198, 'Muhammad Haerudin', 'S,Pd', '3173071910020001', '', '08158712514', 'Jl.mahoni 4 perumnas 1', 'UMUM', '', 'L', 'Pai', '11', 'Serang', '2002-10-19'),
	(199, 'Sediana Hadisujatma', 'S.Kom', '3201200605930002', '', '+62 813-2358-5494', 'Jl. Gangga kp. Cikuda', 'PRODUKTIF', 'ssendianahadi@gmail.com', 'L', 'Progdas', '11', 'Jakarta', '1993-05-06'),
	(200, 'Naufal Irgi Ramadhan', '-', '3201203010050001', '-', '085882323114', 'Perumahan Bumi Jati Elok Jl. Meranti Blok D 2 No 1', 'UMUM', 'mhmmdnouw@gmail.com', 'L', 'Pendidikan Jasmani, Olahraga, dan Kesehatan', '11', 'Bogor', '2005-10-30'),
	(201, 'Ade Supriadi', 'S,Pd', '32012011860006', '-', '082210227844', 'Parung Panjang', 'UMUM', 'adegodedsupriadi@gmail.com', 'L', 'Pendidikan Pancasila', '11', 'Bogor', '1985-04-11'),
	(202, 'Eka Ayu Kurniasih', 'S,Pd', '', '', '083895789355', 'Kp.Garukgak Rt 04/05 Desa Cikuda PP', 'UMUM', 'ayukurniasihhh223@gmail.com', 'P', 'Matematika', '11', 'Bogor', '2002-01-14'),
	(203, 'Andika Mahendra', '-', '3603201608030001', '-', '083894054762', 'Kp. Bungaok Rt 04/03 Desa Kemuning Kecamatan Legok', 'UMUM', 'andikamahendraaa16@gmail.com', 'L', 'B. Arab', '11', 'Tangerang', '2003-08-16'),
	(204, 'Susiana', 'S.Pd', '', '', '081289838813', 'Ciparai Bakti Parungpanjang', 'UMUM', 'nugraharessy@gmail.com', 'P', 'Bahasa Inggris', '11', 'Tangerang', '1993-05-13'),
	(205, 'Eka Riana', 'S.Kom', '', '', '087872285060', 'Parungpanjang', 'PRODUKTIF', 'ekarianaperintis@gmail.com', 'L', 'Pemrograman Web', '11', 'Bogor', '1989-07-30'),
	(206, 'Sediana Hadisujatma', 'S.Kom', '3201200605930002', '', '+62 813-2358-5494', 'Jl. Gangga kp. Cikuda', 'PRODUKTIF', 'ssendianahadi@gmail.com', 'L', 'PBO GUI', '11', 'Jakarta', '1993-05-06'),
	(207, 'Sukron Ansori', 'S.Kom', '3201230707870004', '', '081288953559', 'Kampung Cilejet', 'PRODUKTIF', 'sukronansori87@gmail.com', 'L', 'Basis Data', '11', 'Bogor', '1987-07-07'),
	(208, 'Bu Denisa Ramadanti', 'S,Pd', '', '', '081283998980', 'Jl.anggur 10 no 46 perumnas 2 parungpanjang', 'UMUM', 'denisarmdnii@gmail.com', 'P', 'Bk', '11', 'Bogor', '2000-12-10'),
	(209, 'Lidiawati', 'S,Pd', '', '', '0815-8477-3332', 'Jagabita', 'UMUM', 'lialidiawati485@gmail.com', 'P', 'B. Indonesia', '11', 'Bogor', '1992-06-03'),
	(210, 'Sri Rahayu', 'S,E', '', '', '085881703228', 'Jagabaya', 'UMUM', 'zrie.y4yu0590@gmail.com', 'P', 'Pkwu', '11', 'Bogor', '1990-04-05'),
	(211, 'Muhammad Haerudin', 'S,Pd', '3173071910020001', '', '08158712514', 'Jl.mahoni 4 perumnas 1', 'UMUM', '', 'L', 'Pai', '11', 'Serang', '2002-10-19'),
	(212, 'Sediana Hadisujatma', 'S.Kom', '3201200605930002', '', '+62 813-2358-5494', 'Jl. Gangga kp. Cikuda', 'PRODUKTIF', 'ssendianahadi@gmail.com', 'L', 'Progdas', '11', 'Jakarta', '1993-05-06'),
	(213, 'Naufal Irgi Ramadhan', '-', '3201203010050001', '-', '085882323114', 'Perumahan Bumi Jati Elok Jl. Meranti Blok D 2 No 1', 'UMUM', 'mhmmdnouw@gmail.com', 'L', 'Pendidikan Jasmani, Olahraga, dan Kesehatan', '11', 'Bogor', '2005-10-30'),
	(214, 'Ade Supriadi', 'S,Pd', '32012011860006', '-', '082210227844', 'Parung Panjang', 'UMUM', 'adegodedsupriadi@gmail.com', 'L', 'Pendidikan Pancasila', '11', 'Bogor', '1985-04-11'),
	(215, 'Eka Ayu Kurniasih', 'S,Pd', '', '', '083895789355', 'Kp.Garukgak Rt 04/05 Desa Cikuda PP', 'UMUM', 'ayukurniasihhh223@gmail.com', 'P', 'Matematika', '11', 'Bogor', '2002-01-14'),
	(216, 'Andika Mahendra', '-', '3603201608030001', '-', '083894054762', 'Kp. Bungaok Rt 04/03 Desa Kemuning Kecamatan Legok', 'UMUM', 'andikamahendraaa16@gmail.com', 'L', 'B. Arab', '11', 'Tangerang', '2003-08-16'),
	(217, 'Susiana', 'S.Pd', '', '', '081289838813', 'Ciparai Bakti Parungpanjang', 'UMUM', 'nugraharessy@gmail.com', 'P', 'Bahasa Inggris', '11', 'Tangerang', '1993-05-13'),
	(218, 'Eka Riana', 'S.Kom', '', '', '087872285060', 'Parungpanjang', 'PRODUKTIF', 'ekarianaperintis@gmail.com', 'L', 'Pemrograman Web', '11', 'Bogor', '1989-07-30'),
	(219, 'Sediana Hadisujatma', 'S.Kom', '3201200605930002', '', '+62 813-2358-5494', 'Jl. Gangga kp. Cikuda', 'PRODUKTIF', 'ssendianahadi@gmail.com', 'L', 'PBO GUI', '11', 'Jakarta', '1993-05-06'),
	(220, 'Sukron Ansori', 'S.Kom', '3201230707870004', '', '081288953559', 'Kampung Cilejet', 'PRODUKTIF', 'sukronansori87@gmail.com', 'L', 'Basis Data', '11', 'Bogor', '1987-07-07'),
	(221, 'Bu Denisa Ramadanti', 'S,Pd', '', '', '081283998980', 'Jl.anggur 10 no 46 perumnas 2 parungpanjang', 'UMUM', 'denisarmdnii@gmail.com', 'P', 'Bk', '11', 'Bogor', '2000-12-10'),
	(222, 'Lidiawati', 'S,Pd', '', '', '0815-8477-3332', 'Jagabita', 'UMUM', 'lialidiawati485@gmail.com', 'P', 'B. Indonesia', '11', 'Bogor', '1992-06-03'),
	(223, 'Sri Rahayu', 'S,E', '', '', '085881703228', 'Jagabaya', 'UMUM', 'zrie.y4yu0590@gmail.com', 'P', 'Pkwu', '11', 'Bogor', '1990-04-05'),
	(224, 'Muhammad Haerudin', 'S,Pd', '3173071910020001', '', '08158712514', 'Jl.mahoni 4 perumnas 1', 'UMUM', '', 'L', 'Pai', '11', 'Serang', '2002-10-19'),
	(225, 'Sediana Hadisujatma', 'S.Kom', '3201200605930002', '', '+62 813-2358-5494', 'Jl. Gangga kp. Cikuda', 'PRODUKTIF', 'ssendianahadi@gmail.com', 'L', 'Progdas', '11', 'Jakarta', '1993-05-06'),
	(226, 'Naufal Irgi Ramadhan', '-', '3201203010050001', '-', '085882323114', 'Perumahan Bumi Jati Elok Jl. Meranti Blok D 2 No 1', 'UMUM', 'mhmmdnouw@gmail.com', 'L', 'Pendidikan Jasmani, Olahraga, dan Kesehatan', '11', 'Bogor', '2005-10-30'),
	(227, 'Ade Supriadi', 'S,Pd', '32012011860006', '-', '082210227844', 'Parung Panjang', 'UMUM', 'adegodedsupriadi@gmail.com', 'L', 'Pendidikan Pancasila', '11', 'Bogor', '1985-04-11'),
	(228, 'Eka Ayu Kurniasih', 'S,Pd', '', '', '083895789355', 'Kp.Garukgak Rt 04/05 Desa Cikuda PP', 'UMUM', 'ayukurniasihhh223@gmail.com', 'P', 'Matematika', '11', 'Bogor', '2002-01-14'),
	(229, 'Andika Mahendra', '-', '3603201608030001', '-', '083894054762', 'Kp. Bungaok Rt 04/03 Desa Kemuning Kecamatan Legok', 'UMUM', 'andikamahendraaa16@gmail.com', 'L', 'B. Arab', '11', 'Tangerang', '2003-08-16'),
	(230, 'Susiana', 'S.Pd', '', '', '081289838813', 'Ciparai Bakti Parungpanjang', 'UMUM', 'nugraharessy@gmail.com', 'P', 'Bahasa Inggris', '11', 'Tangerang', '1993-05-13'),
	(231, 'Eka Riana', 'S.Kom', '', '', '087872285060', 'Parungpanjang', 'PRODUKTIF', 'ekarianaperintis@gmail.com', 'L', 'Pemrograman Web', '11', 'Bogor', '1989-07-30'),
	(232, 'Sediana Hadisujatma', 'S.Kom', '3201200605930002', '', '+62 813-2358-5494', 'Jl. Gangga kp. Cikuda', 'PRODUKTIF', 'ssendianahadi@gmail.com', 'L', 'PBO GUI', '11', 'Jakarta', '1993-05-06'),
	(233, 'Sukron Ansori', 'S.Kom', '3201230707870004', '', '081288953559', 'Kampung Cilejet', 'PRODUKTIF', 'sukronansori87@gmail.com', 'L', 'Basis Data', '11', 'Bogor', '1987-07-07'),
	(234, 'Bu Denisa Ramadanti', 'S,Pd', '', '', '081283998980', 'Jl.anggur 10 no 46 perumnas 2 parungpanjang', 'UMUM', 'denisarmdnii@gmail.com', 'P', 'Bk', '11', 'Bogor', '2000-12-10'),
	(235, 'Lidiawati', 'S,Pd', '', '', '0815-8477-3332', 'Jagabita', 'UMUM', 'lialidiawati485@gmail.com', 'P', 'B. Indonesia', '11', 'Bogor', '1992-06-03'),
	(236, 'Sri Rahayu', 'S,E', '', '', '085881703228', 'Jagabaya', 'UMUM', 'zrie.y4yu0590@gmail.com', 'P', 'Pkwu', '11', 'Bogor', '1990-04-05'),
	(237, 'Muhammad Haerudin', 'S,Pd', '3173071910020001', '', '08158712514', 'Jl.mahoni 4 perumnas 1', 'UMUM', '', 'L', 'Pai', '11', 'Serang', '2002-10-19'),
	(238, 'Sediana Hadisujatma', 'S.Kom', '3201200605930002', '', '+62 813-2358-5494', 'Jl. Gangga kp. Cikuda', 'PRODUKTIF', 'ssendianahadi@gmail.com', 'L', 'Progdas', '11', 'Jakarta', '1993-05-06'),
	(239, 'Naufal Irgi Ramadhan', '-', '3201203010050001', '-', '085882323114', 'Perumahan Bumi Jati Elok Jl. Meranti Blok D 2 No 1', 'UMUM', 'mhmmdnouw@gmail.com', 'L', 'Pendidikan Jasmani, Olahraga, dan Kesehatan', '11', 'Bogor', '2005-10-30'),
	(240, 'Ade Supriadi', 'S,Pd', '32012011860006', '-', '082210227844', 'Parung Panjang', 'UMUM', 'adegodedsupriadi@gmail.com', 'L', 'Pendidikan Pancasila', '11', 'Bogor', '1985-04-11'),
	(241, 'Eka Ayu Kurniasih', 'S,Pd', '', '', '083895789355', 'Kp.Garukgak Rt 04/05 Desa Cikuda PP', 'UMUM', 'ayukurniasihhh223@gmail.com', 'P', 'Matematika', '11', 'Bogor', '2002-01-14'),
	(242, 'Andika Mahendra', '-', '3603201608030001', '-', '083894054762', 'Kp. Bungaok Rt 04/03 Desa Kemuning Kecamatan Legok', 'UMUM', 'andikamahendraaa16@gmail.com', 'L', 'B. Arab', '11', 'Tangerang', '2003-08-16'),
	(243, 'Susiana', 'S.Pd', '', '', '081289838813', 'Ciparai Bakti Parungpanjang', 'UMUM', 'nugraharessy@gmail.com', 'P', 'Bahasa Inggris', '11', 'Tangerang', '1993-05-13'),
	(244, 'Eka Riana', 'S.Kom', '', '', '087872285060', 'Parungpanjang', 'PRODUKTIF', 'ekarianaperintis@gmail.com', 'L', 'Pemrograman Web', '11', 'Bogor', '1989-07-30'),
	(245, 'Sediana Hadisujatma', 'S.Kom', '3201200605930002', '', '+62 813-2358-5494', 'Jl. Gangga kp. Cikuda', 'PRODUKTIF', 'ssendianahadi@gmail.com', 'L', 'PBO GUI', '11', 'Jakarta', '1993-05-06'),
	(246, 'Sukron Ansori', 'S.Kom', '3201230707870004', '', '081288953559', 'Kampung Cilejet', 'PRODUKTIF', 'sukronansori87@gmail.com', 'L', 'Basis Data', '11', 'Bogor', '1987-07-07'),
	(247, 'Bu Denisa Ramadanti', 'S,Pd', '', '', '081283998980', 'Jl.anggur 10 no 46 perumnas 2 parungpanjang', 'UMUM', 'denisarmdnii@gmail.com', 'P', 'Bk', '11', 'Bogor', '2000-12-10'),
	(248, 'Lidiawati', 'S,Pd', '', '', '0815-8477-3332', 'Jagabita', 'UMUM', 'lialidiawati485@gmail.com', 'P', 'B. Indonesia', '11', 'Bogor', '1992-06-03'),
	(249, 'Sri Rahayu', 'S,E', '', '', '085881703228', 'Jagabaya', 'UMUM', 'zrie.y4yu0590@gmail.com', 'P', 'Pkwu', '11', 'Bogor', '1990-04-05'),
	(250, 'Muhammad Haerudin', 'S,Pd', '3173071910020001', '', '08158712514', 'Jl.mahoni 4 perumnas 1', 'UMUM', '', 'L', 'Pai', '11', 'Serang', '2002-10-19'),
	(251, 'Sediana Hadisujatma', 'S.Kom', '3201200605930002', '', '+62 813-2358-5494', 'Jl. Gangga kp. Cikuda', 'PRODUKTIF', 'ssendianahadi@gmail.com', 'L', 'Progdas', '11', 'Jakarta', '1993-05-06'),
	(252, 'Naufal Irgi Ramadhan', '-', '3201203010050001', '-', '085882323114', 'Perumahan Bumi Jati Elok Jl. Meranti Blok D 2 No 1', 'UMUM', 'mhmmdnouw@gmail.com', 'L', 'Pendidikan Jasmani, Olahraga, dan Kesehatan', '11', 'Bogor', '2005-10-30'),
	(253, 'Ade Supriadi', 'S,Pd', '32012011860006', '-', '082210227844', 'Parung Panjang', 'UMUM', 'adegodedsupriadi@gmail.com', 'L', 'Pendidikan Pancasila', '11', 'Bogor', '1985-04-11'),
	(254, 'Eka Ayu Kurniasih', 'S,Pd', '', '', '083895789355', 'Kp.Garukgak Rt 04/05 Desa Cikuda PP', 'UMUM', 'ayukurniasihhh223@gmail.com', 'P', 'Matematika', '11', 'Bogor', '2002-01-14'),
	(255, 'Andika Mahendra', '-', '3603201608030001', '-', '083894054762', 'Kp. Bungaok Rt 04/03 Desa Kemuning Kecamatan Legok', 'UMUM', 'andikamahendraaa16@gmail.com', 'L', 'B. Arab', '11', 'Tangerang', '2003-08-16'),
	(256, 'Susiana', 'S.Pd', '', '', '081289838813', 'Ciparai Bakti Parungpanjang', 'UMUM', 'nugraharessy@gmail.com', 'P', 'Bahasa Inggris', '11', 'Tangerang', '1993-05-13'),
	(257, 'Eka Riana', 'S.Kom', '', '', '087872285060', 'Parungpanjang', 'PRODUKTIF', 'ekarianaperintis@gmail.com', 'L', 'Pemrograman Web', '11', 'Bogor', '1989-07-30'),
	(258, 'Sediana Hadisujatma', 'S.Kom', '3201200605930002', '', '+62 813-2358-5494', 'Jl. Gangga kp. Cikuda', 'PRODUKTIF', 'ssendianahadi@gmail.com', 'L', 'PBO GUI', '11', 'Jakarta', '1993-05-06'),
	(259, 'Sukron Ansori', 'S.Kom', '3201230707870004', '', '081288953559', 'Kampung Cilejet', 'PRODUKTIF', 'sukronansori87@gmail.com', 'L', 'Basis Data', '11', 'Bogor', '1987-07-07');

-- Dumping structure for table tugas_basdat.guru_to_mapel
CREATE TABLE IF NOT EXISTS `guru_to_mapel` (
  `id_gtm` int NOT NULL AUTO_INCREMENT,
  `id_guru` int DEFAULT NULL,
  `id_detail_kelas` int DEFAULT NULL,
  `kode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_active` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id_gtm`),
  KEY `id_guru` (`id_guru`),
  KEY `kode` (`kode`),
  KEY `id_detail_kelas` (`id_detail_kelas`)
) ENGINE=InnoDB AUTO_INCREMENT=5804 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table tugas_basdat.guru_to_mapel: ~7 rows (approximately)
INSERT INTO `guru_to_mapel` (`id_gtm`, `id_guru`, `id_detail_kelas`, `kode`, `is_active`) VALUES
	(5797, 63, 63, 'MP-01', 'Y'),
	(5798, 64, 64, 'MP-01', 'Y'),
	(5799, 65, 65, 'MP-01', 'Y'),
	(5800, 66, 66, 'MP-01', 'Y'),
	(5801, 67, 67, 'MP-01', 'Y'),
	(5802, 68, 68, 'MP-01', 'Y'),
	(5803, 69, 69, 'MP-01', 'Y');

-- Dumping structure for table tugas_basdat.guru_to_mapel_old
CREATE TABLE IF NOT EXISTS `guru_to_mapel_old` (
  `id_gtm` int NOT NULL AUTO_INCREMENT,
  `id_guru` int DEFAULT NULL,
  `id_mapel` int DEFAULT NULL,
  PRIMARY KEY (`id_gtm`),
  KEY `id_guru` (`id_guru`),
  KEY `id_mapel` (`id_mapel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table tugas_basdat.guru_to_mapel_old: ~0 rows (approximately)

-- Dumping structure for table tugas_basdat.jurusan
CREATE TABLE IF NOT EXISTS `jurusan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kode_jurusan` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nama_jurusan` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `deskripsi` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_active` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `kode_jurusan` (`kode_jurusan`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table tugas_basdat.jurusan: ~4 rows (approximately)
INSERT INTO `jurusan` (`id`, `kode_jurusan`, `nama_jurusan`, `deskripsi`, `is_active`) VALUES
	(1, 'JS-01', 'RPL', 'Rekayasa Perangkat Lunak', 'y'),
	(2, 'JS-02', 'DKV', 'Desain komunikasi Visual', 'y'),
	(3, 'JS-03', 'TKJ', 'Teknik Komputer Jaringan', 'y'),
	(4, 'JS-04', 'BIDI', 'Bisnis Digital', 'y');

-- Dumping structure for table tugas_basdat.kelas
CREATE TABLE IF NOT EXISTS `kelas` (
  `id_kelas` int NOT NULL AUTO_INCREMENT,
  `kode_kelas` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nama_kelas` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `deskripsi` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_active` enum('Y','N') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `id_jurusan` int DEFAULT NULL,
  PRIMARY KEY (`id_kelas`),
  KEY `kode_kelas` (`kode_kelas`),
  KEY `id_jurusan` (`id_jurusan`),
  CONSTRAINT `jurusan` FOREIGN KEY (`id_jurusan`) REFERENCES `tugas_basdat2`.`jurusan` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table tugas_basdat.kelas: ~3 rows (approximately)
INSERT INTO `kelas` (`id_kelas`, `kode_kelas`, `nama_kelas`, `deskripsi`, `is_active`, `id_jurusan`) VALUES
	(4, 'kls01', '10', 'kelas 10', 'Y', 1),
	(5, 'kls02', '11', 'kelas 11', 'Y', 1),
	(6, 'kls03', '12', 'kelas 12', 'Y', 1);

-- Dumping structure for table tugas_basdat.kelas_old
CREATE TABLE IF NOT EXISTS `kelas_old` (
  `id_kelas` int NOT NULL AUTO_INCREMENT,
  `jurusan` enum('rpl','tkj','bidi','dkv') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `kelas` enum('10','11','12') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id_kelas`)
) ENGINE=InnoDB AUTO_INCREMENT=259 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table tugas_basdat.kelas_old: ~2 rows (approximately)
INSERT INTO `kelas_old` (`id_kelas`, `jurusan`, `kelas`) VALUES
	(257, 'rpl', '10'),
	(258, 'rpl', '11');

-- Dumping structure for table tugas_basdat.mapel
CREATE TABLE IF NOT EXISTS `mapel` (
  `id_mapel` int NOT NULL AUTO_INCREMENT,
  `nama_mapel` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `kode_mapel` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_active` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id_mapel`),
  KEY `kode_mapel` (`kode_mapel`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table tugas_basdat.mapel: ~13 rows (approximately)
INSERT INTO `mapel` (`id_mapel`, `nama_mapel`, `kode_mapel`, `is_active`) VALUES
	(14, 'PKN', 'MP-01', 'Y'),
	(15, 'PAI', 'MP-02', 'Y'),
	(16, 'Bahasa Indonesia', 'MP-03', 'Y'),
	(17, 'Penjas', 'MP-04', 'Y'),
	(18, 'MTK', 'MP-05', 'Y'),
	(19, 'PBO GUI', 'MP-06', 'Y'),
	(20, 'Basis Data', 'MP-07', 'Y'),
	(21, 'BK', 'MP-08', 'Y'),
	(22, 'Bahasa Inggris', 'MP-09', 'Y'),
	(23, 'Progweb', 'MP-10', 'Y'),
	(24, 'Prodas', 'MP-11', 'Y'),
	(25, 'Bahasa Arab', 'MP-12', 'Y'),
	(26, 'PKWU', 'MP-13', 'Y');

-- Dumping structure for table tugas_basdat.mapel_old
CREATE TABLE IF NOT EXISTS `mapel_old` (
  `id_mapel` int NOT NULL AUTO_INCREMENT,
  `nama_mapel` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `kurikulum` enum('2013','merdeka') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  UNIQUE KEY `id_mapel` (`id_mapel`)
) ENGINE=InnoDB AUTO_INCREMENT=204 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table tugas_basdat.mapel_old: ~26 rows (approximately)
INSERT INTO `mapel_old` (`id_mapel`, `nama_mapel`, `kurikulum`) VALUES
	(178, 'Bk', 'merdeka'),
	(179, 'B. Indonesia', 'merdeka'),
	(180, 'Pkwu', 'merdeka'),
	(181, 'Pai', 'merdeka'),
	(182, 'Progdas', 'merdeka'),
	(183, 'Pendidikan Jasmani, Olahraga, dan Kesehatan', 'merdeka'),
	(184, 'Pendidikan Pancasila', 'merdeka'),
	(185, 'Matematika', 'merdeka'),
	(186, 'B. Arab', 'merdeka'),
	(187, 'Bahasa Inggris', 'merdeka'),
	(188, 'PBO GUI', 'merdeka'),
	(189, 'Pemrograman Web', 'merdeka'),
	(190, 'Basis Data', 'merdeka'),
	(191, 'Bk', 'merdeka'),
	(192, 'B. Indonesia', 'merdeka'),
	(193, 'Pkwu', 'merdeka'),
	(194, 'Pai', 'merdeka'),
	(195, 'Progdas', 'merdeka'),
	(196, 'Pendidikan Jasmani, Olahraga, dan Kesehatan', 'merdeka'),
	(197, 'Pendidikan Pancasila', 'merdeka'),
	(198, 'Matematika', 'merdeka'),
	(199, 'B. Arab', 'merdeka'),
	(200, 'Bahasa Inggris', 'merdeka'),
	(201, 'PBO GUI', 'merdeka'),
	(202, 'Pemrograman Web', 'merdeka'),
	(203, 'Basis Data', 'merdeka');

-- Dumping structure for table tugas_basdat.mapel_to_jurusan
CREATE TABLE IF NOT EXISTS `mapel_to_jurusan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kode_jurusan` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `kode_mapel` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `deskripsi` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_active` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `kode_jurusan` (`kode_jurusan`),
  KEY `kode_mapel` (`kode_mapel`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table tugas_basdat.mapel_to_jurusan: ~40 rows (approximately)
INSERT INTO `mapel_to_jurusan` (`id`, `kode_jurusan`, `kode_mapel`, `deskripsi`, `is_active`) VALUES
	(44, 'JS-01', 'MP-01', 'PKN adalah pelajaran umum kewarganegaraan - Mapel jurusan RPL', 'y'),
	(45, 'JS-01', 'MP-02', 'PAI adalah pendidikan agama Islam di SMK BPM - Mapel jurusan RPL', 'y'),
	(46, 'JS-01', 'MP-03', 'Bahasa Indonesia adalah pelajaran umum di SMK - Mapel jurusan RPL', 'y'),
	(47, 'JS-01', 'MP-04', 'Penjas adalah pendidikan jasmani untuk semua jurusan - Mapel jurusan RPL', 'y'),
	(48, 'JS-01', 'MP-05', 'MTK adalah matematika sebagai pelajaran dasar - Mapel jurusan RPL', 'y'),
	(49, 'JS-01', 'MP-06', 'PBO GUI adalah pemrograman berorientasi objek jurusan RPL - Mapel jurusan RPL', 'y'),
	(50, 'JS-01', 'MP-07', 'Basis Data adalah pelajaran jurusan RPL - Mapel jurusan RPL', 'y'),
	(51, 'JS-01', 'MP-08', 'BK adalah bimbingan konseling untuk semua siswa - Mapel jurusan RPL', 'y'),
	(52, 'JS-01', 'MP-09', 'Bahasa Inggris adalah pelajaran umum di SMK - Mapel jurusan RPL', 'y'),
	(53, 'JS-01', 'MP-10', 'Progweb adalah pemrograman web jurusan RPL - Mapel jurusan RPL', 'y'),
	(54, 'JS-01', 'MP-11', 'Prodas adalah program dasar jurusan RPL - Mapel jurusan RPL', 'y'),
	(55, 'JS-01', 'MP-12', 'Bahasa Arab adalah pelajaran bahasa asing pilihan - Mapel jurusan RPL', 'y'),
	(56, 'JS-01', 'MP-13', 'PKWU adalah prakarya dan kewirausahaan untuk semua jurusan - Mapel jurusan RPL', 'y'),
	(59, 'JS-02', 'MP-01', 'PKN adalah pelajaran umum kewarganegaraan - Mapel jurusan DKV', 'Y'),
	(60, 'JS-02', 'MP-02', 'PAI adalah pendidikan agama Islam di SMK BPM - Mapel jurusan DKV', 'Y'),
	(61, 'JS-02', 'MP-03', 'Bahasa Indonesia adalah pelajaran umum di SMK - Mapel jurusan DKV', 'Y'),
	(62, 'JS-02', 'MP-04', 'Penjas adalah pendidikan jasmani untuk semua jurusan - Mapel jurusan DKV', 'Y'),
	(63, 'JS-02', 'MP-05', 'MTK adalah matematika sebagai pelajaran dasar - Mapel jurusan DKV', 'Y'),
	(66, 'JS-02', 'MP-08', 'BK adalah bimbingan konseling untuk semua siswa - Mapel jurusan DKV', 'Y'),
	(67, 'JS-02', 'MP-09', 'Bahasa Inggris adalah pelajaran umum di SMK - Mapel jurusan DKV', 'Y'),
	(70, 'JS-02', 'MP-12', 'Bahasa Arab adalah pelajaran bahasa asing pilihan - Mapel jurusan DKV', 'Y'),
	(71, 'JS-02', 'MP-13', 'PKWU adalah prakarya dan kewirausahaan untuk semua jurusan - Mapel jurusan DKV', 'Y'),
	(74, 'JS-03', 'MP-01', 'PKN adalah pelajaran umum kewarganegaraan - Mapel jurusan TKJ', 'Y'),
	(75, 'JS-03', 'MP-02', 'PAI adalah pendidikan agama Islam di SMK BPM - Mapel jurusan TKJ', 'Y'),
	(76, 'JS-03', 'MP-03', 'Bahasa Indonesia adalah pelajaran umum di SMK - Mapel jurusan TKJ', 'Y'),
	(77, 'JS-03', 'MP-04', 'Penjas adalah pendidikan jasmani untuk semua jurusan - Mapel jurusan TKJ', 'Y'),
	(78, 'JS-03', 'MP-05', 'MTK adalah matematika sebagai pelajaran dasar - Mapel jurusan TKJ', 'Y'),
	(81, 'JS-03', 'MP-08', 'BK adalah bimbingan konseling untuk semua siswa - Mapel jurusan TKJ', 'Y'),
	(82, 'JS-03', 'MP-09', 'Bahasa Inggris adalah pelajaran umum di SMK - Mapel jurusan TKJ', 'Y'),
	(85, 'JS-03', 'MP-12', 'Bahasa Arab adalah pelajaran bahasa asing pilihan - Mapel jurusan TKJ', 'Y'),
	(86, 'JS-03', 'MP-13', 'PKWU adalah prakarya dan kewirausahaan untuk semua jurusan - Mapel jurusan TKJ', 'Y'),
	(89, 'JS-04', 'MP-01', 'PKN adalah pelajaran umum kewarganegaraan - Mapel jurusan BIDI', 'Y'),
	(90, 'JS-04', 'MP-02', 'PAI adalah pendidikan agama Islam di SMK BPM - Mapel jurusan BIDI', 'Y'),
	(91, 'JS-04', 'MP-03', 'Bahasa Indonesia adalah pelajaran umum di SMK - Mapel jurusan BIDI', 'Y'),
	(92, 'JS-04', 'MP-04', 'Penjas adalah pendidikan jasmani untuk semua jurusan - Mapel jurusan BIDI', 'Y'),
	(93, 'JS-04', 'MP-05', 'MTK adalah matematika sebagai pelajaran dasar - Mapel jurusan BIDI', 'Y'),
	(96, 'JS-04', 'MP-08', 'BK adalah bimbingan konseling untuk semua siswa - Mapel jurusan BIDI', 'Y'),
	(97, 'JS-04', 'MP-09', 'Bahasa Inggris adalah pelajaran umum di SMK - Mapel jurusan BIDI', 'Y'),
	(100, 'JS-04', 'MP-12', 'Bahasa Arab adalah pelajaran bahasa asing pilihan - Mapel jurusan BIDI', 'Y'),
	(101, 'JS-04', 'MP-13', 'PKWU adalah prakarya dan kewirausahaan untuk semua jurusan - Mapel jurusan BIDI', 'Y');

-- Dumping structure for table tugas_basdat.nilai
CREATE TABLE IF NOT EXISTS `nilai` (
  `id_nilai` int NOT NULL AUTO_INCREMENT,
  `id_siswa` int NOT NULL,
  `id_mapel` int NOT NULL,
  `semester` tinyint(1) NOT NULL,
  `tahun_ajaran` varchar(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nilai_harian` decimal(5,2) DEFAULT NULL,
  `nilai_uh` decimal(5,2) DEFAULT NULL,
  `nilai_uts` decimal(5,2) DEFAULT NULL,
  `nilai_uas` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`id_nilai`),
  KEY `Index 3` (`id_siswa`,`id_mapel`,`tahun_ajaran`,`semester`),
  CONSTRAINT `fk_nilai_siswa` FOREIGN KEY (`id_siswa`) REFERENCES `siswa` (`id_siswa`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table tugas_basdat.nilai: ~5 rows (approximately)
INSERT INTO `nilai` (`id_nilai`, `id_siswa`, `id_mapel`, `semester`, `tahun_ajaran`, `nilai_harian`, `nilai_uh`, `nilai_uts`, `nilai_uas`) VALUES
	(5, 91, 14, 1, '2024/2025', 85.00, 80.00, 78.00, 90.00),
	(6, 92, 15, 1, '2024/2025', 75.00, 70.00, 80.00, 85.00),
	(7, 93, 16, 1, '2024/2025', 88.00, 85.00, 90.00, 92.00),
	(8, 94, 18, 1, '2024/2025', 70.00, 72.00, 68.00, 75.00),
	(9, 95, 20, 1, '2024/2025', 92.00, 88.00, 95.00, 91.00);

-- Dumping structure for table tugas_basdat.organisasi
CREATE TABLE IF NOT EXISTS `organisasi` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table tugas_basdat.organisasi: ~2 rows (approximately)
INSERT INTO `organisasi` (`id`, `nama`) VALUES
	(1, 'osis'),
	(2, 'mpk');

-- Dumping structure for table tugas_basdat.periode
CREATE TABLE IF NOT EXISTS `periode` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tahun` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_active` enum('Y','N') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table tugas_basdat.periode: ~3 rows (approximately)
INSERT INTO `periode` (`id`, `tahun`, `is_active`) VALUES
	(1, '2025-2026', 'Y'),
	(2, '2026-2027', 'N'),
	(6, '2027-2028', 'N');

-- Dumping structure for table tugas_basdat.siswa
CREATE TABLE IF NOT EXISTS `siswa` (
  `id_siswa` int NOT NULL AUTO_INCREMENT,
  `nipd` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nama` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `jenis_kelamin` enum('L','P') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `tempat_lahir` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `telepon` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_active` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `id_jurusan` int DEFAULT NULL,
  PRIMARY KEY (`id_siswa`),
  KEY `id_jurusan` (`id_jurusan`),
  KEY `nipd` (`nipd`),
  CONSTRAINT `id_jurusan` FOREIGN KEY (`id_jurusan`) REFERENCES `tugas_basdat2`.`jurusan` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table tugas_basdat.siswa: ~29 rows (approximately)
INSERT INTO `siswa` (`id_siswa`, `nipd`, `nama`, `jenis_kelamin`, `tempat_lahir`, `tanggal_lahir`, `telepon`, `is_active`, `id_jurusan`) VALUES
	(91, '242510072', 'Putra Kasela', 'L', 'BOGOR', '2009-05-22', '83874599435', 'Y', 1),
	(92, '242510078', 'Sakanovagio', 'L', 'Tanggerang Kelapa Dua', '2007-11-01', '881012661003', 'Y', 1),
	(93, '242510065', 'Muhamad Irfan Ardiansyah', 'L', 'bogor', '2009-06-21', '81525776692', 'Y', 1),
	(94, '242510074', 'Ratu Haerunnisa', 'P', 'bogor', '2009-02-09', '088290645151', 'Y', 1),
	(95, '242510073', 'Ramadhan agil siraj', 'L', 'bogor', '2008-09-24', '85871615850', 'Y', 1),
	(96, '242510068', 'Muhammad Ihwan Utomo', 'L', 'Parung panjang', '2009-02-08', '85710480148', 'Y', 1),
	(97, '242510079', 'Siti Nur Kholisha', 'P', 'Bogor', '2009-12-06', '88290957722', 'Y', 1),
	(98, '242510055', 'Abdul Syahril Pratama', 'L', 'Bogor', '2009-07-16', '85772468392', 'Y', 1),
	(99, '242510076', 'Rina Rusliana', 'P', 'tanggerang', '2009-09-29', '85218100625', 'Y', 1),
	(100, '242510077', 'Robiyatun Nisa', 'P', 'Bogor', '2008-03-14', '085691838442', 'Y', 1),
	(101, '242510061', 'Iskandaribrahim', 'L', 'bogor', '2009-01-23', '89507334685', 'Y', 1),
	(102, '242510075', 'Reyvan Darmawan', 'L', 'Bogor', '2008-02-10', '8886159470', 'Y', 1),
	(103, '242510071', 'Oktapia Nurpadilah', 'P', 'Bogor', '2008-10-08', '89653348904', 'Y', 1),
	(104, '242510062', 'Marchel Hugo Putra Ramadhan', 'L', 'Wonogiri', '2008-09-09', '085882270825', 'Y', 1),
	(105, '242510057', 'Emre Razaq', 'L', 'Bogor', '2009-06-02', '81918820584', 'Y', NULL),
	(106, '242510070', 'Nurlita', 'P', 'bogor', '2009-04-22', '89651810420', 'Y', 1),
	(107, '242510064', 'Melvin Olivia', 'P', 'Bogor', '2008-12-10', '85779485241', 'Y', 1),
	(108, '242510080', 'Sugiarto Raharjo', 'L', 'Bogor', '2009-05-23', '85893814541', 'Y', 1),
	(109, '242510059', 'Felicya Agatha Susanto Lie', 'P', 'jakarta', '2009-03-02', '8998998663', 'Y', 1),
	(110, '242510069', 'Novita Damayanti', 'P', 'Pandeglang', '2008-11-29', '895325000000', 'Y', 1),
	(111, '242510067', 'Muhammad Farel Andriani', 'L', 'Jakarta', '2008-08-31', '85776649749', 'Y', 1),
	(112, '242510063', 'Maulidan Alif', 'L', 'jember', '2009-03-17', '81386202661', 'Y', 1),
	(113, '242510060', 'Fiqih Al Farizi', 'L', 'Tanggerang', '2009-06-18', '81999718152', 'Y', 1),
	(114, '242510066', 'M.Fahry Tri G', 'L', 'Parung panjang', '2008-04-18', '87771517495', 'Y', 1),
	(115, '242510056', 'Dimas Surya Putra', 'L', 'ciparai mandala', '2009-03-13', '81412098259', 'Y', 1),
	(116, '242510058', 'Farel Apandi', 'L', 'jakarta', '2009-02-16', '8983000362', 'Y', 1),
	(117, '242510081', 'Umar Hafidz Muhyidin', 'L', 'Bogor', '2009-05-11', '85710196817', 'Y', 1),
	(122, '123456', 'ranii', 'P', 'rumah sakit', '2029-09-09', '0813', 'y', 1),
	(123, '2511001', 'hugo', 'L', 'Rumah Sakit', '2007-03-14', '081387622001', '1', 1);

-- Dumping structure for table tugas_basdat.siswa_nipd
CREATE TABLE IF NOT EXISTS `siswa_nipd` (
  `id_nipd` int NOT NULL AUTO_INCREMENT,
  `nipd` int DEFAULT NULL,
  PRIMARY KEY (`id_nipd`),
  KEY `nipd` (`nipd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table tugas_basdat.siswa_nipd: ~0 rows (approximately)

-- Dumping structure for table tugas_basdat.siswa_old
CREATE TABLE IF NOT EXISTS `siswa_old` (
  `id_siswa` int NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nipd` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `telepon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `alamat` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `jenis_kelamin` enum('L','P') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `kelas` enum('10','11','12') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `jurusan` enum('rpl','tkj','bidi','dkv') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nama_ayah` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nama_ibu` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `tempat_lahir` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  PRIMARY KEY (`id_siswa`),
  KEY `nipd` (`nipd`)
) ENGINE=InnoDB AUTO_INCREMENT=1053 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table tugas_basdat.siswa_old: ~27 rows (approximately)
INSERT INTO `siswa_old` (`id_siswa`, `nama`, `nipd`, `telepon`, `alamat`, `email`, `jenis_kelamin`, `kelas`, `jurusan`, `nama_ayah`, `nama_ibu`, `tempat_lahir`, `tanggal_lahir`) VALUES
	(1026, 'Putra Kasela', '242510072', '83874599435', 'Perum 2 Jl duku 2', 'kaselaputra12@gmail.com', 'L', '11', 'rpl', 'eka', 'siti', 'BOGOR', '2009-05-22'),
	(1027, 'Sakanovagio', '242510078', '881012661003', 'Jl.Sidaro H10/07', 'sakanovagio0111@gmail.com', 'L', '11', 'rpl', 'Sudiharjo', 'Maria', 'Tanggerang Kelapa Dua', '2007-11-01'),
	(1028, 'Muhamad Irfan Ardiansyah', '242510065', '81525776692', 'Kp.cilangkap', 'm.irfan.a21062009@gmail.com', 'L', '11', 'rpl', 'Sumri', 'Mamas', 'bogor', '2009-06-21'),
	(1029, 'Ratu Haerunnisa', '242510074', '088290645151', 'perumnas 2', 'ratuhrnns@gmail.com', 'P', '11', 'rpl', 'maat', 'iis', 'bogor', '2009-02-09'),
	(1030, 'Ramadhan agil siraj', '242510073', '85871615850', 'griya', 'honibusa2008@gmail.com', 'L', '11', 'rpl', 'rudi', 'Ita', 'bogor', '2008-09-24'),
	(1031, 'Muhammad Ihwan Utomo', '242510068', '85710480148', 'Griya Parung Panjang', 'utomoihwan@gmail.com', 'L', '11', 'rpl', 'Sutomo', 'wati', 'Parung panjang', '2009-02-08'),
	(1032, 'Siti Nur Kholisha', '242510079', '88290957722', 'Kp.sukamanah', 'Imjieunyuri12@gmail.com', 'P', '11', 'rpl', 'Enjam', 'Ida', 'Bogor', '2009-12-06'),
	(1033, 'Abdul Syahril Pratama', '242510055', '85772468392', 'Perum 2', 'abdulsyaril07@gmail.com', 'L', '11', 'rpl', 'Kuat', 'Suci', 'Bogor', '2009-07-16'),
	(1034, 'Rina Rusliana', '242510076', '85218100625', 'griya parungpanjang', 'rusliana.rina029@gmail.com', 'P', '11', 'rpl', 'wawan', 'lusliana', 'tanggerang', '2009-09-29'),
	(1035, 'Robiyatun Nisa', '242510077', '085691838442', 'Griya Parungpanjang Blok A2C No.23', 'robiyatunnisa14@gmail.com', 'P', '11', 'rpl', 'Muhammad Nur', 'Rokayah', 'Bogor', '2008-03-14'),
	(1036, 'Iskandaribrahim', '242510061', '89507334685', 'Griya', 'iskandaribrahimibam@gmail.com', 'L', '11', 'rpl', 'Zulhakim', 'sugiati', 'bogor', '2009-01-23'),
	(1037, 'Reyvan Darmawan', '242510075', '8886159470', 'sadang', 'reyvandarmawan21008@gmail.com', 'L', '11', 'rpl', 'rudy', 'ame', 'Bogor', '2008-02-10'),
	(1038, 'Oktapia Nurpadilah', '242510071', '89653348904', 'Kp.Sukamanah 2', 'oktapia939@gmail.com', 'P', '11', 'rpl', 'Andi', 'Eneng', 'Bogor', '2008-10-08'),
	(1039, 'Marchel Hugo Putra Ramadhan', '242510062', '085882270825', 'Griya Parung Panjang Block D 1 F No. 16', 'osinken2000@gmail.com', 'L', '11', 'rpl', 'Eko', 'Nurhayati', 'Wonogiri', '2008-09-09'),
	(1040, 'Emre Razaq', '242510057', '81918820584', 'Taman sari', 'emreaja480@gmail.com', 'L', '11', 'rpl', 'M.najib', 'Awal', 'Bogor', '2009-06-02'),
	(1041, 'Nurlita', '242510070', '89651810420', 'kp.cibeber', 'lita8531@gmail.com', 'P', '11', 'rpl', 'Durahman', 'Sumiyati', 'bogor', '2009-04-22'),
	(1042, 'Melvin Olivia', '242510064', '85779485241', 'Sadangan', 'melvinolivia14@gmail.com', 'P', '11', 'rpl', 'Herman Zaelani', 'Leni Marlina', 'Bogor', '2008-12-10'),
	(1043, 'Sugiarto Raharjo', '242510080', '85893814541', 'Perum Sekar Tanjung', 'raharjosugiarto4@gmail.com', 'L', '11', 'rpl', 'Sukoto Raharjo', 'herbani', 'Bogor', '2009-05-23'),
	(1044, 'Felicya Agatha Susanto Lie', '242510059', '8998998663', 'millenium city', 'felicyafelicya03@gmail.com', 'P', '11', 'rpl', 'susanto', 'liana', 'jakarta', '2009-03-02'),
	(1045, 'Novita Damayanti', '242510069', '895325000000', 'kp. sadangan', 'novitadamayanti401@gmail.com', 'P', '11', 'rpl', 'Naming', 'Inih', 'Pandeglang', '2008-11-29'),
	(1046, 'Muhammad Farel Andriani', '242510067', '85776649749', 'Perum2 jl.Alpukat', 'muhammadfarelandriani@gmail.com', 'L', '11', 'rpl', 'Yani', 'Lia', 'Jakarta', '2008-08-31'),
	(1047, 'Maulidan Alif', '242510063', '81386202661', 'foresthill', 'maulidana360@gmail.com', 'L', '11', 'rpl', 'bagus', 'husnul', 'jember', '2009-03-17'),
	(1048, 'Fiqih Al Farizi', '242510060', '81999718152', 'kabasiran Tamansari', 'kaiymc20@gmail.com', 'L', '11', 'rpl', 'dodo', 'erba', 'Tanggerang', '2009-06-18'),
	(1049, 'M.Fahry Tri G', '242510066', '87771517495', 'Kp.marga mekar', 'fahri08111@gmail.com', 'L', '11', 'rpl', 'sadono', 'Ani', 'Parung panjang', '2008-04-18'),
	(1050, 'Dimas Surya Putra', '242510056', '81412098259', 'perum 2 sentraland', 'dondimascarlo@gmail.com', 'L', '11', 'rpl', 'supri', 'suryani', 'ciparai mandala', '2009-03-13'),
	(1051, 'Farel Apandi', '242510058', '8983000362', 'perum 2 jalan jambu 2 no 19', '@farelapandigmail.com.', 'L', '11', 'rpl', 'oban subandi', 'lismayanti', 'jakarta', '2009-02-16'),
	(1052, 'Umar Hafidz Muhyidin', '242510081', '85710196817', 'perum 2', 'umarhafidz0102@gmail.com', 'L', '11', 'rpl', 'Abdul fatha', 'sri Andriani', 'Bogor', '2009-05-11');

-- Dumping structure for table tugas_basdat.siswa_to_jurusan
CREATE TABLE IF NOT EXISTS `siswa_to_jurusan` (
  `id_stj` int NOT NULL AUTO_INCREMENT,
  `nipd` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `id_jurusan` int DEFAULT NULL,
  `deskripsi` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_active` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id_stj`),
  KEY `nipd` (`nipd`),
  KEY `id_jurusan` (`id_jurusan`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table tugas_basdat.siswa_to_jurusan: ~1 rows (approximately)
INSERT INTO `siswa_to_jurusan` (`id_stj`, `nipd`, `id_jurusan`, `deskripsi`, `is_active`) VALUES
	(1, '242510062', 1, 'RPL', '1');

-- Dumping structure for table tugas_basdat.siswa_to_kelas
CREATE TABLE IF NOT EXISTS `siswa_to_kelas` (
  `id_stk` int NOT NULL AUTO_INCREMENT,
  `kode_kelas` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nipd` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `tahun_ajar` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `is_active` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id_stk`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=275 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table tugas_basdat.siswa_to_kelas: ~27 rows (approximately)
INSERT INTO `siswa_to_kelas` (`id_stk`, `kode_kelas`, `nipd`, `tahun_ajar`, `start_date`, `end_date`, `is_active`) VALUES
	(248, 'kls02', '242510072', '2025', '2025-07-01', '2026-06-30', 'Y'),
	(249, 'kls02', '242510078', '2025', '2025-07-01', '2026-06-30', 'Y'),
	(250, 'kls02', '242510065', '2025', '2025-07-01', '2026-06-30', 'Y'),
	(251, 'kls02', '242510074', '2025', '2025-07-01', '2026-06-30', 'Y'),
	(252, 'kls02', '242510073', '2025', '2025-07-01', '2026-06-30', 'Y'),
	(253, 'kls02', '242510068', '2025', '2025-07-01', '2026-06-30', 'Y'),
	(254, 'kls02', '242510079', '2025', '2025-07-01', '2026-06-30', 'Y'),
	(255, 'kls02', '242510055', '2025', '2025-07-01', '2026-06-30', 'Y'),
	(256, 'kls02', '242510076', '2025', '2025-07-01', '2026-06-30', 'Y'),
	(257, 'kls02', '242510077', '2025', '2025-07-01', '2026-06-30', 'Y'),
	(258, 'kls02', '242510061', '2025', '2025-07-01', '2026-06-30', 'Y'),
	(259, 'kls02', '242510075', '2025', '2025-07-01', '2026-06-30', 'Y'),
	(260, 'kls02', '242510071', '2025', '2025-07-01', '2026-06-30', 'Y'),
	(261, 'kls02', '242510062', '2025', '2025-07-01', '2026-06-30', 'Y'),
	(262, 'kls02', '242510057', '2025', '2025-07-01', '2026-06-30', 'Y'),
	(263, 'kls02', '242510070', '2025', '2025-07-01', '2026-06-30', 'Y'),
	(264, 'kls02', '242510064', '2025', '2025-07-01', '2026-06-30', 'Y'),
	(265, 'kls02', '242510080', '2025', '2025-07-01', '2026-06-30', 'Y'),
	(266, 'kls02', '242510059', '2025', '2025-07-01', '2026-06-30', 'Y'),
	(267, 'kls02', '242510069', '2025', '2025-07-01', '2026-06-30', 'Y'),
	(268, 'kls02', '242510067', '2025', '2025-07-01', '2026-06-30', 'Y'),
	(269, 'kls02', '242510063', '2025', '2025-07-01', '2026-06-30', 'Y'),
	(270, 'kls02', '242510060', '2025', '2025-07-01', '2026-06-30', 'Y'),
	(271, 'kls02', '242510066', '2025', '2025-07-01', '2026-06-30', 'Y'),
	(272, 'kls02', '242510056', '2025', '2025-07-01', '2026-06-30', 'Y'),
	(273, 'kls02', '242510058', '2025', '2025-07-01', '2026-06-30', 'Y'),
	(274, 'kls02', '242510081', '2025', '2025-07-01', '2026-06-30', 'Y');

-- Dumping structure for procedure tugas_basdat.sp_delete_calon
DELIMITER //
CREATE PROCEDURE `sp_delete_calon`(
    IN p_id_calon INT
)
BEGIN

DELETE FROM calon
WHERE id_calon = p_id_calon;

END//
DELIMITER ;

-- Dumping structure for procedure tugas_basdat.sp_delete_guru
DELIMITER //
CREATE PROCEDURE `sp_delete_guru`(
    IN p_id_guru INT
)
BEGIN

DELETE FROM guru
WHERE id_guru = p_id_guru;

END//
DELIMITER ;

-- Dumping structure for procedure tugas_basdat.sp_delete_periode
DELIMITER //
CREATE PROCEDURE `sp_delete_periode`(
    IN p_id_periode INT
)
BEGIN

DELETE FROM periode
WHERE id_periode = p_id_periode;

END//
DELIMITER ;

-- Dumping structure for procedure tugas_basdat.sp_delete_siswa
DELIMITER //
CREATE PROCEDURE `sp_delete_siswa`(
    IN p_id_siswa INT
)
BEGIN

DELETE FROM siswa
WHERE id_siswa = p_id_siswa;

END//
DELIMITER ;

-- Dumping structure for procedure tugas_basdat.sp_delete_voting
DELIMITER //
CREATE PROCEDURE `sp_delete_voting`(
    IN p_id INT
)
BEGIN
    DELETE FROM voting
    WHERE id = p_id;
END//
DELIMITER ;

-- Dumping structure for procedure tugas_basdat.sp_insert_calon
DELIMITER //
CREATE PROCEDURE `sp_insert_calon`(
    IN p_id_ketua INT,
    IN p_id_wakil INT,
    IN p_id_organisasi INT,
    IN p_visi TEXT,
    IN p_misi TEXT,
    IN p_proker TEXT,
    IN p_foto VARCHAR(255)
)
BEGIN

INSERT INTO calon(
    id_ketua,
    id_wakil,
    id_organisasi,
    visi,
    misi,
    proker,
    foto
)
VALUES(
    p_id_ketua,
    p_id_wakil,
    p_id_organisasi,
    p_visi,
    p_misi,
    p_proker,
    p_foto
);

END//
DELIMITER ;

-- Dumping structure for procedure tugas_basdat.sp_insert_guru
DELIMITER //
CREATE PROCEDURE `sp_insert_guru`(
    IN p_nama VARCHAR(100),
    IN p_no_telepon VARCHAR(20),
    IN p_jenis_kelamin VARCHAR(10)
)
BEGIN

INSERT INTO guru(
    nama,
    no_telepon,
    jenis_kelamin
)
VALUES(
    p_nama,
    p_no_telepon,
    p_jenis_kelamin
);

END//
DELIMITER ;

-- Dumping structure for procedure tugas_basdat.sp_insert_periode
DELIMITER //
CREATE PROCEDURE `sp_insert_periode`(
	IN `p_tahun` VARCHAR(20),
	IN `p_is_active` ENUM('Y','N')
)
BEGIN

INSERT INTO periode(tahun,is_active)
VALUES(p_tahun, p_is_active);

END//
DELIMITER ;

-- Dumping structure for procedure tugas_basdat.sp_insert_siswa
DELIMITER //
CREATE PROCEDURE `sp_insert_siswa`(
    IN p_nipd VARCHAR(20),
    IN p_nama VARCHAR(100),
    IN p_jenis_kelamin VARCHAR(10),
    IN p_tempat_lahir VARCHAR(100),
    IN p_tanggal_lahir DATE,
    IN p_telepon VARCHAR(20)
)
BEGIN

INSERT INTO siswa(
    nipd,
    nama,
    jenis_kelamin,
    tempat_lahir,
    tanggal_lahir,
    telepon
)
VALUES(
    p_nipd,
    p_nama,
    p_jenis_kelamin,
    p_tempat_lahir,
    p_tanggal_lahir,
    p_telepon
);

END//
DELIMITER ;

-- Dumping structure for procedure tugas_basdat.sp_insert_voting
DELIMITER //
CREATE PROCEDURE `sp_insert_voting`(
	IN `p_id_user` INT,
	IN `p_id_calon` INT,
	IN `p_id_organisasi` INT
)
BEGIN


  IF EXISTS (
    SELECT 1 
    FROM voting 
    WHERE id_user = p_id_user 
    AND id_organisasi = p_id_organisasi
  ) THEN

    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Anda sudah voting di organisasi ini';

  ELSE

    INSERT INTO voting (id_user, id_calon, id_organisasi)
    VALUES (p_id_user, p_id_calon, p_id_organisasi);

  END IF;
END//
DELIMITER ;

-- Dumping structure for procedure tugas_basdat.sp_login
DELIMITER //
CREATE PROCEDURE `sp_login`(
	IN `p_nipd` VARCHAR(20),
	IN `p_password` VARCHAR(50)
)
BEGIN

    IF NOT EXISTS (
        SELECT 1 FROM user WHERE nipd = p_nipd
    ) THEN

        SELECT 'USER_TIDAK_DITEMUKAN' AS status, NULL AS id_user, NULL AS nipd, NULL AS role;

    ELSEIF NOT EXISTS (
        SELECT 1 FROM user WHERE nipd = p_nipd AND password = p_password
    ) THEN

        SELECT 'PASSWORD_SALAH' AS status, NULL AS id_user, NULL AS nipd, NULL AS role;

    ELSE

        SELECT 
            'LOGIN_BERHASIL' AS status, 
            id_user, 
            nipd,
            role
        FROM user
        WHERE nipd = p_nipd AND password = p_password;

    END IF;

END//
DELIMITER ;

-- Dumping structure for procedure tugas_basdat.sp_update_calon
DELIMITER //
CREATE PROCEDURE `sp_update_calon`(
    IN p_id_calon INT,
    IN p_visi TEXT,
    IN p_misi TEXT
)
BEGIN

UPDATE calon
SET
    visi = p_visi,
    misi = p_misi
WHERE id_calon = p_id_calon;

END//
DELIMITER ;

-- Dumping structure for procedure tugas_basdat.sp_update_guru
DELIMITER //
CREATE PROCEDURE `sp_update_guru`(
    IN p_id_guru INT,
    IN p_nama VARCHAR(100)
)
BEGIN

UPDATE guru
SET nama = p_nama
WHERE id_guru = p_id_guru;

END//
DELIMITER ;

-- Dumping structure for procedure tugas_basdat.sp_update_periode
DELIMITER //
CREATE PROCEDURE `sp_update_periode`(
    IN p_id_periode INT,
    IN p_tahun VARCHAR(20)
)
BEGIN

UPDATE periode
SET tahun = p_tahun
WHERE id_periode = p_id_periode;

END//
DELIMITER ;

-- Dumping structure for procedure tugas_basdat.sp_update_siswa
DELIMITER //
CREATE PROCEDURE `sp_update_siswa`(
    IN p_id_siswa INT,
    IN p_nama VARCHAR(100),
    IN p_telepon VARCHAR(20)
)
BEGIN

UPDATE siswa
SET
    nama = p_nama,
    telepon = p_telepon
WHERE id_siswa = p_id_siswa;

END//
DELIMITER ;

-- Dumping structure for procedure tugas_basdat.sp_update_voting
DELIMITER //
CREATE PROCEDURE `sp_update_voting`(
    IN p_id INT,
    IN p_id_user INT,
    IN p_id_calon INT
)
BEGIN
    UPDATE voting
    SET 
        id_user = p_id_user,
        id_calon = p_id_calon
    WHERE id = p_id;
END//
DELIMITER ;

-- Dumping structure for table tugas_basdat.tahun_ajaran
CREATE TABLE IF NOT EXISTS `tahun_ajaran` (
  `id_tahun_ajar` int NOT NULL AUTO_INCREMENT,
  `tahun_ajar` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `angkatan` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id_tahun_ajar`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table tugas_basdat.tahun_ajaran: ~6 rows (approximately)
INSERT INTO `tahun_ajaran` (`id_tahun_ajar`, `tahun_ajar`, `angkatan`) VALUES
	(1, '2024/2025', '2024'),
	(2, '2025/2026', '2025'),
	(3, '2024/2025', '2024'),
	(4, '2025/2026', '2025'),
	(5, '2024/2025', '2024'),
	(6, '2025/2026', '2025');

-- Dumping structure for table tugas_basdat.tipe_nilai
CREATE TABLE IF NOT EXISTS `tipe_nilai` (
  `id_tipe_nilai` int NOT NULL AUTO_INCREMENT,
  `tipe_nilai` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_active` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id_tipe_nilai`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table tugas_basdat.tipe_nilai: ~3 rows (approximately)
INSERT INTO `tipe_nilai` (`id_tipe_nilai`, `tipe_nilai`, `is_active`) VALUES
	(1, 'UTS', 'Y'),
	(2, 'UAS', 'Y'),
	(3, 'HARIAN', 'Y');

-- Dumping structure for table tugas_basdat.trs_absensi_kelas
CREATE TABLE IF NOT EXISTS `trs_absensi_kelas` (
  `id_absensi` int NOT NULL AUTO_INCREMENT,
  `nipd` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `id_kelas` int DEFAULT NULL,
  `id_mapel` int DEFAULT NULL,
  `id_guru` int DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `pertemuan_ke` int DEFAULT NULL,
  `status` enum('Hadir','Sakit','Izin','Alpha') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `keterangan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_absensi`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table tugas_basdat.trs_absensi_kelas: ~0 rows (approximately)
INSERT INTO `trs_absensi_kelas` (`id_absensi`, `nipd`, `id_kelas`, `id_mapel`, `id_guru`, `tanggal`, `pertemuan_ke`, `status`, `keterangan`, `created_at`) VALUES
	(1, '2024001', 1, 18, 70, '2025-01-13', 1, 'Hadir', NULL, '2026-04-20 08:51:18');

-- Dumping structure for table tugas_basdat.trs_nilai
CREATE TABLE IF NOT EXISTS `trs_nilai` (
  `id_trs` int NOT NULL AUTO_INCREMENT,
  `nipd` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `id_siswa_to_kelas` int DEFAULT NULL,
  `id_type_nilai` int DEFAULT NULL,
  `nilai` int DEFAULT NULL,
  `deskripsi` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `tgl_nilai` date DEFAULT NULL,
  `kode_mapel` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id_trs`),
  KEY `id_siswa_to_kelas` (`id_siswa_to_kelas`),
  CONSTRAINT `FK_trs_nilai_siswa_to_kelas` FOREIGN KEY (`id_siswa_to_kelas`) REFERENCES `siswa_to_kelas` (`id_stk`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table tugas_basdat.trs_nilai: ~27 rows (approximately)
INSERT INTO `trs_nilai` (`id_trs`, `nipd`, `id_siswa_to_kelas`, `id_type_nilai`, `nilai`, `deskripsi`, `tgl_nilai`, `kode_mapel`) VALUES
	(66, '242510072', 248, 1, 80, 'Nilai UTS', '2026-04-14', 'MP-01'),
	(67, '242510078', 249, 1, 80, 'Nilai UTS', '2026-04-14', 'MP-01'),
	(68, '242510065', 250, 1, 80, 'Nilai UTS', '2026-04-14', 'MP-01'),
	(69, '242510074', 251, 1, 80, 'Nilai UTS', '2026-04-14', 'MP-01'),
	(70, '242510073', 252, 1, 80, 'Nilai UTS', '2026-04-14', 'MP-01'),
	(71, '242510068', 253, 1, 80, 'Nilai UTS', '2026-04-14', 'MP-01'),
	(72, '242510079', 254, 1, 80, 'Nilai UTS', '2026-04-14', 'MP-01'),
	(73, '242510055', 255, 1, 80, 'Nilai UTS', '2026-04-14', 'MP-01'),
	(74, '242510076', 256, 1, 80, 'Nilai UTS', '2026-04-14', 'MP-01'),
	(75, '242510077', 257, 1, 80, 'Nilai UTS', '2026-04-14', 'MP-01'),
	(76, '242510061', 258, 1, 80, 'Nilai UTS', '2026-04-14', 'MP-01'),
	(77, '242510075', 259, 1, 80, 'Nilai UTS', '2026-04-14', 'MP-01'),
	(78, '242510071', 260, 1, 80, 'Nilai UTS', '2026-04-14', 'MP-01'),
	(79, '242510062', 261, 1, 80, 'Nilai UTS', '2026-04-14', 'MP-01'),
	(80, '242510057', 262, 1, 80, 'Nilai UTS', '2026-04-14', 'MP-01'),
	(81, '242510070', 263, 1, 80, 'Nilai UTS', '2026-04-14', 'MP-01'),
	(82, '242510064', 264, 1, 80, 'Nilai UTS', '2026-04-14', 'MP-01'),
	(83, '242510080', 265, 1, 80, 'Nilai UTS', '2026-04-14', 'MP-01'),
	(84, '242510059', 266, 1, 80, 'Nilai UTS', '2026-04-14', 'MP-01'),
	(85, '242510069', 267, 1, 80, 'Nilai UTS', '2026-04-14', 'MP-01'),
	(86, '242510067', 268, 1, 80, 'Nilai UTS', '2026-04-14', 'MP-01'),
	(87, '242510063', 269, 1, 80, 'Nilai UTS', '2026-04-14', 'MP-01'),
	(88, '242510060', 270, 1, 80, 'Nilai UTS', '2026-04-14', 'MP-01'),
	(89, '242510066', 271, 1, 80, 'Nilai UTS', '2026-04-14', 'MP-01'),
	(90, '242510056', 272, 1, 80, 'Nilai UTS', '2026-04-14', 'MP-01'),
	(91, '242510058', 273, 1, 80, 'Nilai UTS', '2026-04-14', 'MP-01'),
	(92, '242510081', 274, 1, 80, 'Nilai UTS', '2026-04-14', 'MP-01');

-- Dumping structure for table tugas_basdat.user
CREATE TABLE IF NOT EXISTS `user` (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nipd` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT (now()),
  `role` enum('admin','guru','siswa','wali_kelas') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `id_referensi` int DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `no_hp` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `foto` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` enum('aktif','nonaktif') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'aktif',
  `last_login` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `username` (`username`),
  KEY `password` (`password`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table tugas_basdat.user: ~28 rows (approximately)
INSERT INTO `user` (`id_user`, `username`, `password`, `nipd`, `created_at`, `role`, `id_referensi`, `email`, `no_hp`, `foto`, `status`, `last_login`) VALUES
	(1, 'admin', 'hugo', '123', '2026-04-20 08:51:18', 'admin', NULL, 'hugo@gmail.com', '08123456789', NULL, 'aktif', '2026-05-06 15:25:55'),
	(2, '242510072', '123', '242510072', '2026-05-06 13:03:01', 'siswa', NULL, NULL, '83874599435', NULL, 'aktif', '2026-05-06 13:03:01'),
	(3, '242510078', '123', '242510078', '2026-05-06 13:03:01', 'siswa', NULL, NULL, '881012661003', NULL, 'aktif', '2026-05-06 13:03:01'),
	(4, '242510065', '123', '242510065', '2026-05-06 13:03:01', 'siswa', NULL, NULL, '81525776692', NULL, 'aktif', '2026-05-06 13:03:01'),
	(5, '242510074', '123', '242510074', '2026-05-06 13:03:01', 'siswa', NULL, NULL, '088290645151', NULL, 'aktif', '2026-05-06 13:03:01'),
	(6, '242510073', '123', '242510073', '2026-05-06 13:03:01', 'siswa', NULL, NULL, '85871615850', NULL, 'aktif', '2026-05-06 13:03:01'),
	(7, '242510068', '123', '242510068', '2026-05-06 13:03:01', 'siswa', NULL, NULL, '85710480148', NULL, 'aktif', '2026-05-06 13:03:01'),
	(8, '242510079', '123', '242510079', '2026-05-06 13:03:01', 'siswa', NULL, NULL, '88290957722', NULL, 'aktif', '2026-05-06 13:03:01'),
	(9, '242510055', '123', '242510055', '2026-05-06 13:03:01', 'siswa', NULL, NULL, '85772468392', NULL, 'aktif', '2026-05-06 13:03:01'),
	(10, '242510076', '123', '242510076', '2026-05-06 13:03:01', 'siswa', NULL, NULL, '85218100625', NULL, 'aktif', '2026-05-06 13:03:01'),
	(11, '242510077', '123', '242510077', '2026-05-06 13:03:01', 'siswa', NULL, NULL, '085691838442', NULL, 'aktif', '2026-05-06 13:03:01'),
	(12, '242510061', '123', '242510061', '2026-05-06 13:03:01', 'siswa', NULL, NULL, '89507334685', NULL, 'aktif', '2026-05-06 13:03:01'),
	(13, '242510075', '123', '242510075', '2026-05-06 13:03:01', 'siswa', NULL, NULL, '8886159470', NULL, 'aktif', '2026-05-06 13:03:01'),
	(14, '242510071', '123', '242510071', '2026-05-06 13:03:01', 'siswa', NULL, NULL, '89653348904', NULL, 'aktif', '2026-05-06 13:03:01'),
	(15, '242510062', '123', '242510062', '2026-05-06 13:03:01', 'siswa', NULL, NULL, '085882270825', NULL, 'aktif', '2026-05-06 13:03:01'),
	(16, '242510057', '123', '242510057', '2026-05-06 13:03:01', 'siswa', NULL, NULL, '81918820584', NULL, 'aktif', '2026-05-06 13:03:01'),
	(17, '242510070', '123', '242510070', '2026-05-06 13:03:01', 'siswa', NULL, NULL, '89651810420', NULL, 'aktif', '2026-05-06 13:03:01'),
	(18, '242510064', '123', '242510064', '2026-05-06 13:03:01', 'siswa', NULL, NULL, '85779485241', NULL, 'aktif', '2026-05-06 13:03:01'),
	(19, '242510080', '123', '242510080', '2026-05-06 13:03:01', 'siswa', NULL, NULL, '85893814541', NULL, 'aktif', '2026-05-06 13:03:01'),
	(20, '242510059', '123', '242510059', '2026-05-06 13:03:01', 'siswa', NULL, NULL, '8998998663', NULL, 'aktif', '2026-05-06 13:03:01'),
	(21, '242510069', '123', '242510069', '2026-05-06 13:03:01', 'siswa', NULL, NULL, '895325000000', NULL, 'aktif', '2026-05-06 13:03:01'),
	(22, '242510067', '123', '242510067', '2026-05-06 13:03:01', 'siswa', NULL, NULL, '85776649749', NULL, 'aktif', '2026-05-06 13:03:01'),
	(23, '242510063', '123', '242510063', '2026-05-06 13:03:01', 'siswa', NULL, NULL, '81386202661', NULL, 'aktif', '2026-05-06 13:03:01'),
	(24, '242510060', '123', '242510060', '2026-05-06 13:03:01', 'siswa', NULL, NULL, '81999718152', NULL, 'aktif', '2026-05-06 13:03:01'),
	(25, '242510066', '123', '242510066', '2026-05-06 13:03:01', 'siswa', NULL, NULL, '87771517495', NULL, 'aktif', '2026-05-06 13:03:01'),
	(26, '242510056', '123', '242510056', '2026-05-06 13:03:01', 'siswa', NULL, NULL, '81412098259', NULL, 'aktif', '2026-05-06 13:03:01'),
	(27, '242510058', '123', '242510058', '2026-05-06 13:03:01', 'siswa', NULL, NULL, '8983000362', NULL, 'aktif', '2026-05-06 13:03:01'),
	(28, '242510081', '123', '242510081', '2026-05-06 13:03:01', 'siswa', NULL, NULL, '85710196817', NULL, 'aktif', '2026-05-06 13:03:01');

-- Dumping structure for table tugas_basdat.voting
CREATE TABLE IF NOT EXISTS `voting` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_user` int DEFAULT NULL,
  `id_calon` int DEFAULT NULL,
  `id_organisasi` int DEFAULT NULL,
  `id_periode` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_voting_user` (`id_user`),
  KEY `Index 2` (`id_calon`,`id_user`) USING BTREE,
  KEY `FK_voting_organisasi` (`id_organisasi`),
  KEY `FK_voting_periode` (`id_periode`),
  CONSTRAINT `FK_voting_calon` FOREIGN KEY (`id_calon`) REFERENCES `calon` (`id`),
  CONSTRAINT `FK_voting_organisasi` FOREIGN KEY (`id_organisasi`) REFERENCES `organisasi` (`id`),
  CONSTRAINT `FK_voting_periode` FOREIGN KEY (`id_periode`) REFERENCES `periode` (`id`),
  CONSTRAINT `FK_voting_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table tugas_basdat.voting: ~2 rows (approximately)
INSERT INTO `voting` (`id`, `id_user`, `id_calon`, `id_organisasi`, `id_periode`) VALUES
	(6, 1, 2, 2, 1),
	(7, 1, 3, 1, 1);

-- Dumping structure for view tugas_basdat.v_arsip
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `v_arsip` (
	`id` INT(10) NOT NULL,
	`tahun` VARCHAR(50) NULL COLLATE 'utf8mb4_general_ci'
) ENGINE=MyISAM;

-- Dumping structure for view tugas_basdat.v_calon
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `v_calon` (
	`id` INT(10) NOT NULL,
	`id_periode` INT(10) NULL,
	`id_ketua` INT(10) NULL,
	`id_wakil` INT(10) NULL,
	`id_organisasi` INT(10) NULL,
	`visi` VARCHAR(50) NULL COLLATE 'utf8mb4_general_ci',
	`misi` VARCHAR(50) NULL COLLATE 'utf8mb4_general_ci',
	`proker` VARCHAR(50) NULL COLLATE 'utf8mb4_general_ci',
	`foto` TEXT NULL COLLATE 'utf8mb4_general_ci'
) ENGINE=MyISAM;

-- Dumping structure for view tugas_basdat.v_detail_arsip
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `v_detail_arsip` (
	`id_periode` INT(10) NULL,
	`tahun` VARCHAR(50) NULL COLLATE 'utf8mb4_general_ci',
	`organisasi` VARCHAR(50) NULL COLLATE 'utf8mb4_general_ci',
	`nama_ketua` VARCHAR(100) NULL COLLATE 'utf8mb4_general_ci',
	`nama_wakil` VARCHAR(100) NULL COLLATE 'utf8mb4_general_ci',
	`total_vote` BIGINT(19) NOT NULL,
	`persen` DECIMAL(25,1) NULL
) ENGINE=MyISAM;

-- Dumping structure for view tugas_basdat.v_guru
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `v_guru` (
	`id_guru` INT(10) NOT NULL,
	`nama` VARCHAR(100) NULL COLLATE 'utf8mb4_general_ci',
	`no_telepon` VARCHAR(15) NULL COLLATE 'utf8mb4_general_ci',
	`jenis_kelamin` ENUM('L','P') NULL COLLATE 'utf8mb4_general_ci',
	`is_active` CHAR(1) NULL COLLATE 'utf8mb4_general_ci'
) ENGINE=MyISAM;

-- Dumping structure for view tugas_basdat.v_hasil_voting
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `v_hasil_voting` (
	`id` INT(10) NOT NULL,
	`nama_ketua` VARCHAR(100) NULL COLLATE 'utf8mb4_general_ci',
	`nama_wakil` VARCHAR(100) NULL COLLATE 'utf8mb4_general_ci',
	`nama_organisasi` VARCHAR(50) NULL COLLATE 'utf8mb4_general_ci',
	`foto` TEXT NULL COLLATE 'utf8mb4_general_ci',
	`total_vote` BIGINT(19) NOT NULL,
	`persen` DECIMAL(25,1) NULL
) ENGINE=MyISAM;

-- Dumping structure for view tugas_basdat.v_mpk
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `v_mpk` (
	`id` INT(10) NOT NULL,
	`id_periode` INT(10) NULL,
	`id_ketua` INT(10) NULL,
	`id_wakil` INT(10) NULL,
	`id_organisasi` INT(10) NULL,
	`visi` VARCHAR(50) NULL COLLATE 'utf8mb4_general_ci',
	`misi` VARCHAR(50) NULL COLLATE 'utf8mb4_general_ci',
	`proker` VARCHAR(50) NULL COLLATE 'utf8mb4_general_ci',
	`foto` TEXT NULL COLLATE 'utf8mb4_general_ci',
	`foto_path` MEDIUMTEXT NULL COLLATE 'utf8mb4_general_ci',
	`nama_ketua` VARCHAR(100) NULL COLLATE 'utf8mb4_general_ci',
	`nama_wakil` VARCHAR(100) NULL COLLATE 'utf8mb4_general_ci'
) ENGINE=MyISAM;

-- Dumping structure for view tugas_basdat.v_osis
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `v_osis` (
	`id` INT(10) NOT NULL,
	`id_periode` INT(10) NULL,
	`id_ketua` INT(10) NULL,
	`id_wakil` INT(10) NULL,
	`id_organisasi` INT(10) NULL,
	`visi` VARCHAR(50) NULL COLLATE 'utf8mb4_general_ci',
	`misi` VARCHAR(50) NULL COLLATE 'utf8mb4_general_ci',
	`proker` VARCHAR(50) NULL COLLATE 'utf8mb4_general_ci',
	`foto` TEXT NULL COLLATE 'utf8mb4_general_ci',
	`foto_path` MEDIUMTEXT NULL COLLATE 'utf8mb4_general_ci',
	`nama_ketua` VARCHAR(100) NULL COLLATE 'utf8mb4_general_ci',
	`nama_wakil` VARCHAR(100) NULL COLLATE 'utf8mb4_general_ci'
) ENGINE=MyISAM;

-- Dumping structure for view tugas_basdat.v_periode
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `v_periode` (
	`id` INT(10) NOT NULL,
	`tahun` VARCHAR(50) NULL COLLATE 'utf8mb4_general_ci',
	`is_active` ENUM('Y','N') NULL COLLATE 'utf8mb4_general_ci'
) ENGINE=MyISAM;

-- Dumping structure for view tugas_basdat.v_siswa
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `v_siswa` (
	`id_siswa` INT(10) NOT NULL,
	`nipd` VARCHAR(20) NULL COLLATE 'utf8mb4_general_ci',
	`nama` VARCHAR(100) NULL COLLATE 'utf8mb4_general_ci',
	`jenis_kelamin` ENUM('L','P') NULL COLLATE 'utf8mb4_general_ci',
	`tempat_lahir` VARCHAR(100) NULL COLLATE 'utf8mb4_general_ci',
	`tanggal_lahir` DATE NULL,
	`telepon` VARCHAR(20) NULL COLLATE 'utf8mb4_general_ci',
	`is_active` CHAR(1) NULL COLLATE 'utf8mb4_general_ci',
	`id_jurusan` INT(10) NULL
) ENGINE=MyISAM;

-- Dumping structure for view tugas_basdat.v_voting
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `v_voting` (
	`id` INT(10) NOT NULL,
	`id_user` INT(10) NULL,
	`id_calon` INT(10) NULL
) ENGINE=MyISAM;

-- Dumping structure for trigger tugas_basdat.trg_format_is_active
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `trg_format_is_active` BEFORE INSERT ON `mapel_to_jurusan` FOR EACH ROW BEGIN
    IF NEW.is_active IS NULL OR NEW.is_active = '' THEN
        SET NEW.is_active = 'Y';
    END IF;

    IF NEW.is_active NOT IN ('Y','N') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'is_active hanya boleh Y atau N!';
    END IF;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger tugas_basdat.trg_prevent_duplicate_mapel_jurusan
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `trg_prevent_duplicate_mapel_jurusan` BEFORE INSERT ON `mapel_to_jurusan` FOR EACH ROW BEGIN
    DECLARE total INT;

    SELECT COUNT(*) INTO total
    FROM mapel_to_jurusan
    WHERE kode_jurusan = NEW.kode_jurusan
      AND kode_mapel = NEW.kode_mapel;

    IF total > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Relasi mapel dan jurusan sudah ada!';
    END IF;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger tugas_basdat.trg_update_mapel_jurusan
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `trg_update_mapel_jurusan` BEFORE UPDATE ON `mapel_to_jurusan` FOR EACH ROW BEGIN
    IF NEW.is_active NOT IN ('Y','N') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'is_active hanya boleh Y atau N!';
    END IF;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger tugas_basdat.trg_validate_mapel_jurusan
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `trg_validate_mapel_jurusan` BEFORE INSERT ON `mapel_to_jurusan` FOR EACH ROW BEGIN
    DECLARE cek_jurusan INT;
    DECLARE cek_mapel INT;

    SELECT COUNT(*) INTO cek_jurusan
    FROM jurusan
    WHERE kode_jurusan = NEW.kode_jurusan;

    SELECT COUNT(*) INTO cek_mapel
    FROM mapel
    WHERE kode_mapel = NEW.kode_mapel;

    IF cek_jurusan = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Kode jurusan tidak ditemukan!';
    END IF;

    IF cek_mapel = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Kode mapel tidak ditemukan!';
    END IF;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for view tugas_basdat.v_arsip
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `v_arsip`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_arsip` AS select `p`.`id` AS `id`,`p`.`tahun` AS `tahun` from `periode` `p`;

-- Dumping structure for view tugas_basdat.v_calon
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `v_calon`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_calon` AS select `calon`.`id` AS `id`,`calon`.`id_periode` AS `id_periode`,`calon`.`id_ketua` AS `id_ketua`,`calon`.`id_wakil` AS `id_wakil`,`calon`.`id_organisasi` AS `id_organisasi`,`calon`.`visi` AS `visi`,`calon`.`misi` AS `misi`,`calon`.`proker` AS `proker`,`calon`.`foto` AS `foto` from `calon`;

-- Dumping structure for view tugas_basdat.v_detail_arsip
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `v_detail_arsip`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_detail_arsip` AS select `p`.`id` AS `id_periode`,`p`.`tahun` AS `tahun`,`o`.`nama` AS `organisasi`,`ketua`.`nama` AS `nama_ketua`,`wakil`.`nama` AS `nama_wakil`,count(`v`.`id`) AS `total_vote`,(case when ((select count(0) from (`voting` `v2` left join `calon` `c2` on((`v2`.`id_calon` = `c2`.`id`))) where (`c2`.`id_periode` = `p`.`id`)) = 0) then 0 else round(((count(`v`.`id`) / (select count(0) from (`voting` `v2` left join `calon` `c2` on((`v2`.`id_calon` = `c2`.`id`))) where (`c2`.`id_periode` = `p`.`id`))) * 100),1) end) AS `persen` from (((((`calon` `c` left join `voting` `v` on((`c`.`id` = `v`.`id_calon`))) left join `siswa` `ketua` on((`c`.`id_ketua` = `ketua`.`id_siswa`))) left join `siswa` `wakil` on((`c`.`id_wakil` = `wakil`.`id_siswa`))) left join `organisasi` `o` on((`c`.`id_organisasi` = `o`.`id`))) left join `periode` `p` on((`c`.`id_periode` = `p`.`id`))) group by `p`.`id`,`p`.`tahun`,`o`.`nama`,`ketua`.`nama`,`wakil`.`nama`;

-- Dumping structure for view tugas_basdat.v_guru
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `v_guru`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_guru` AS select `guru`.`id_guru` AS `id_guru`,`guru`.`nama` AS `nama`,`guru`.`no_telepon` AS `no_telepon`,`guru`.`jenis_kelamin` AS `jenis_kelamin`,`guru`.`is_active` AS `is_active` from `guru`;

-- Dumping structure for view tugas_basdat.v_hasil_voting
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `v_hasil_voting`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_hasil_voting` AS select `c`.`id` AS `id`,`ketua`.`nama` AS `nama_ketua`,`wakil`.`nama` AS `nama_wakil`,`o`.`nama` AS `nama_organisasi`,`c`.`foto` AS `foto`,ifnull(count(`v`.`id`),0) AS `total_vote`,(case when ((select count(0) from `voting`) = 0) then 0 else round(((count(`v`.`id`) / (select count(0) from `voting`)) * 100),1) end) AS `persen` from ((((`calon` `c` left join `siswa` `ketua` on((`c`.`id_ketua` = `ketua`.`id_siswa`))) left join `siswa` `wakil` on((`c`.`id_wakil` = `wakil`.`id_siswa`))) left join `organisasi` `o` on((`c`.`id_organisasi` = `o`.`id`))) left join `voting` `v` on((`c`.`id` = `v`.`id_calon`))) group by `c`.`id`,`ketua`.`nama`,`wakil`.`nama`,`o`.`nama`,`c`.`foto`;

-- Dumping structure for view tugas_basdat.v_mpk
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `v_mpk`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_mpk` AS select `c`.`id` AS `id`,`c`.`id_periode` AS `id_periode`,`c`.`id_ketua` AS `id_ketua`,`c`.`id_wakil` AS `id_wakil`,`c`.`id_organisasi` AS `id_organisasi`,`c`.`visi` AS `visi`,`c`.`misi` AS `misi`,`c`.`proker` AS `proker`,`c`.`foto` AS `foto`,concat('../assets/img/',`c`.`foto`) AS `foto_path`,`ketua`.`nama` AS `nama_ketua`,`wakil`.`nama` AS `nama_wakil` from ((`calon` `c` join `siswa` `ketua` on((`c`.`id_ketua` = `ketua`.`id_siswa`))) join `siswa` `wakil` on((`c`.`id_wakil` = `wakil`.`id_siswa`))) where (`c`.`id_organisasi` = 2);

-- Dumping structure for view tugas_basdat.v_osis
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `v_osis`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_osis` AS select `c`.`id` AS `id`,`c`.`id_periode` AS `id_periode`,`c`.`id_ketua` AS `id_ketua`,`c`.`id_wakil` AS `id_wakil`,`c`.`id_organisasi` AS `id_organisasi`,`c`.`visi` AS `visi`,`c`.`misi` AS `misi`,`c`.`proker` AS `proker`,`c`.`foto` AS `foto`,concat('../assets/img/',`c`.`foto`) AS `foto_path`,`ketua`.`nama` AS `nama_ketua`,`wakil`.`nama` AS `nama_wakil` from ((`calon` `c` join `siswa` `ketua` on((`c`.`id_ketua` = `ketua`.`id_siswa`))) join `siswa` `wakil` on((`c`.`id_wakil` = `wakil`.`id_siswa`))) where (`c`.`id_organisasi` = 1);

-- Dumping structure for view tugas_basdat.v_periode
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `v_periode`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_periode` AS select `periode`.`id` AS `id`,`periode`.`tahun` AS `tahun`,`periode`.`is_active` AS `is_active` from `periode`;

-- Dumping structure for view tugas_basdat.v_siswa
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `v_siswa`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_siswa` AS select `siswa`.`id_siswa` AS `id_siswa`,`siswa`.`nipd` AS `nipd`,`siswa`.`nama` AS `nama`,`siswa`.`jenis_kelamin` AS `jenis_kelamin`,`siswa`.`tempat_lahir` AS `tempat_lahir`,`siswa`.`tanggal_lahir` AS `tanggal_lahir`,`siswa`.`telepon` AS `telepon`,`siswa`.`is_active` AS `is_active`,`siswa`.`id_jurusan` AS `id_jurusan` from `siswa`;

-- Dumping structure for view tugas_basdat.v_voting
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `v_voting`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_voting` AS select `voting`.`id` AS `id`,`voting`.`id_user` AS `id_user`,`voting`.`id_calon` AS `id_calon` from `voting`;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
