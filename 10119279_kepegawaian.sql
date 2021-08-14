-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Waktu pembuatan: 14 Agu 2021 pada 14.46
-- Versi server: 10.4.18-MariaDB
-- Versi PHP: 8.0.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `10119279_kepegawaian`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `id` varchar(2) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`) VALUES
('1', 'admin', 'admin'),
('2', 'admin', '21232f297a57a5a743894a0e4a801fc3');

-- --------------------------------------------------------

--
-- Struktur dari tabel `gaji_pokok`
--

CREATE TABLE `gaji_pokok` (
  `kd_jabatan` varchar(20) NOT NULL,
  `gol` int(11) DEFAULT NULL,
  `gaji_pokok` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `gaji_pokok`
--

INSERT INTO `gaji_pokok` (`kd_jabatan`, `gol`, `gaji_pokok`) VALUES
('pimpinan', 1, 7500000),
('sekretaris', 2, 5500000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `golongan`
--

CREATE TABLE `golongan` (
  `gol` int(11) NOT NULL,
  `tj_suami_istri` int(11) DEFAULT NULL,
  `tj_anak` int(11) DEFAULT NULL,
  `tj_makan` int(11) DEFAULT NULL,
  `tj_askes` int(11) DEFAULT NULL,
  `index_lembur` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `golongan`
--

INSERT INTO `golongan` (`gol`, `tj_suami_istri`, `tj_anak`, `tj_makan`, `tj_askes`, `index_lembur`) VALUES
(1, 600000, 100000, 1450000, 150000, 250000),
(2, 400000, 100000, 450000, 150000, 250000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `jabatan`
--

CREATE TABLE `jabatan` (
  `kd_jabatan` varchar(20) NOT NULL,
  `nama_jabatan` varchar(20) DEFAULT NULL,
  `tj_jabatan` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `jabatan`
--

INSERT INTO `jabatan` (`kd_jabatan`, `nama_jabatan`, `tj_jabatan`) VALUES
('bendahara', 'bendahara 1', 550000),
('pimpinan', 'pimpinan 1', 750000),
('sekretaris', 'sekretaris 1', 550000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pegawai`
--

CREATE TABLE `pegawai` (
  `nip` varchar(8) NOT NULL,
  `nama_pegawai` varchar(50) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `tempat_lahir` varchar(50) DEFAULT NULL,
  `gol` int(11) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `jumlah_anak` int(11) DEFAULT NULL,
  `pendidikan` varchar(10) DEFAULT NULL,
  `kd_jabatan` varchar(20) DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pegawai`
--

INSERT INTO `pegawai` (`nip`, `nama_pegawai`, `alamat`, `tempat_lahir`, `gol`, `status`, `jumlah_anak`, `pendidikan`, `kd_jabatan`, `tgl_lahir`) VALUES
('10119279', 'Martua Febrianto', 'Cikarang', 'Jakarta', 1, 'Belum Menikah', 0, 'SMK', 'pimpinan', '2000-02-12'),
('10123163', 'Budi Sudarsono', 'Bandung', 'Malang', 2, 'Menikah', 2, 's1', 'sekretaris', '1996-06-14');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `gaji_pokok`
--
ALTER TABLE `gaji_pokok`
  ADD PRIMARY KEY (`kd_jabatan`),
  ADD KEY `FK_gaji_pokok1` (`gol`);

--
-- Indeks untuk tabel `golongan`
--
ALTER TABLE `golongan`
  ADD PRIMARY KEY (`gol`);

--
-- Indeks untuk tabel `jabatan`
--
ALTER TABLE `jabatan`
  ADD PRIMARY KEY (`kd_jabatan`);

--
-- Indeks untuk tabel `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`nip`),
  ADD KEY `FK_pegawai1` (`gol`),
  ADD KEY `FK_pegawai2` (`kd_jabatan`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `gaji_pokok`
--
ALTER TABLE `gaji_pokok`
  ADD CONSTRAINT `FK_gaji_pokok1` FOREIGN KEY (`gol`) REFERENCES `golongan` (`gol`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_gaji_pokok2` FOREIGN KEY (`kd_jabatan`) REFERENCES `jabatan` (`kd_jabatan`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `pegawai`
--
ALTER TABLE `pegawai`
  ADD CONSTRAINT `FK_pegawai1` FOREIGN KEY (`gol`) REFERENCES `golongan` (`gol`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_pegawai2` FOREIGN KEY (`kd_jabatan`) REFERENCES `jabatan` (`kd_jabatan`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
