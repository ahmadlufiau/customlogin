-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 27, 2019 at 07:48 PM
-- Server version: 5.7.21
-- PHP Version: 7.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_customlogin`
--

-- --------------------------------------------------------

--
-- Table structure for table `pegawai`
--

DROP TABLE IF EXISTS `pegawai`;
CREATE TABLE IF NOT EXISTS `pegawai` (
  `id_pegawai` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nip` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(191) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_pegawai`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pegawai`
--

INSERT INTO `pegawai` (`id_pegawai`, `nip`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, '111111111', 'pic@gmail.com', '$2y$12$Eu0ky1nyW/SF/rKbtPuzGeOjcJhLHedXdeL26E7LsH7Aj2vhihRHO', NULL, NULL, NULL),
(2, '222222222', 'pimpinan@gmail.com', '$2y$12$Eu0ky1nyW/SF/rKbtPuzGeOjcJhLHedXdeL26E7LsH7Aj2vhihRHO', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pegawai_role`
--

DROP TABLE IF EXISTS `pegawai_role`;
CREATE TABLE IF NOT EXISTS `pegawai_role` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pegawai_id` int(11) UNSIGNED NOT NULL,
  `role_id` int(11) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`pegawai_id`),
  KEY `role_id` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pegawai_role`
--

INSERT INTO `pegawai_role` (`id`, `pegawai_id`, `role_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL),
(2, 2, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id_role` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nama_role` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_role`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id_role`, `nama_role`, `created_at`, `updated_at`) VALUES
(1, 'pic', NULL, NULL),
(2, 'pimpinan', NULL, NULL);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pegawai_role`
--
ALTER TABLE `pegawai_role`
  ADD CONSTRAINT `pegawai_role_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id_role`),
  ADD CONSTRAINT `pegawai_role_ibfk_2` FOREIGN KEY (`pegawai_id`) REFERENCES `pegawai` (`id_pegawai`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
