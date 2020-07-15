-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 06, 2018 at 05:30 PM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 7.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mynotescode`
--

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE `siswa` (
  `id` int(11) NOT NULL,
  `nis` varchar(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `jenis_kelamin` varchar(10) NOT NULL,
  `telp` varchar(15) NOT NULL,
  `alamat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `siswa`
--

INSERT INTO `siswa` (`id`, `nis`, `nama`, `jenis_kelamin`, `telp`, `alamat`) VALUES
(1, '1104070001', 'Rizaldi Maulidia Achmad', 'Laki-laki', '089277182122', 'Sumedang'),
(2, '1104070002', 'Siska Melina Rachman', 'Perempuan', '081262551722', 'Bandung'),
(3, '1104070003', 'Asep Dadan', 'Laki-laki', '085162718881', 'Garut'),
(6, '1104070004', 'Samba Ilham', 'Laki-laki', '08918817726', 'Bandung'),
(7, '1104070005', 'Nadya Nur Syahbandi', 'Perempuan', '081255171821', 'Jakarta');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `siswa`
--
ALTER TABLE `siswa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
