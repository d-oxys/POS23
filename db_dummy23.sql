-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 31 Jul 2024 pada 05.14
-- Versi server: 10.4.24-MariaDB-log
-- Versi PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_dummy23`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `companies`
--

CREATE TABLE `companies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subdistrict_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `companies`
--

INSERT INTO `companies` (`id`, `name`, `subdistrict_id`, `created_at`, `updated_at`) VALUES
(1, 'PT Maju Mundur', NULL, '2024-07-31 01:30:03', '2024-07-31 01:30:03'),
(2, 'PT Maju Maju', NULL, '2024-07-31 01:53:34', '2024-07-31 01:53:34');

-- --------------------------------------------------------

--
-- Struktur dari tabel `departments`
--

CREATE TABLE `departments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `division_id` bigint(20) UNSIGNED NOT NULL,
  `KdDept` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'Aktif',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `departments`
--

INSERT INTO `departments` (`id`, `name`, `slug`, `division_id`, `KdDept`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Departemen Keuangan', 'departemen-keuangan', 1, '01', 'Aktif', '2024-07-31 01:30:05', '2024-07-31 01:30:05'),
(2, 'Departemen Pemasaran', 'departemen-pemasaran', 2, '02', 'Aktif', '2024-07-31 01:53:37', '2024-07-31 01:53:37');

-- --------------------------------------------------------

--
-- Struktur dari tabel `directorates`
--

CREATE TABLE `directorates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `directorates`
--

INSERT INTO `directorates` (`id`, `name`, `slug`, `company_id`, `created_at`, `updated_at`) VALUES
(1, 'Direktorat Keuangan', 'direktorat-keuangan', 1, '2024-07-31 01:30:04', '2024-07-31 01:30:04'),
(2, 'Direktorat Pemasaran', 'direktorat-pemasaran', 2, '2024-07-31 01:53:35', '2024-07-31 01:53:35');

-- --------------------------------------------------------

--
-- Struktur dari tabel `divisions`
--

CREATE TABLE `divisions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `directorate_id` bigint(20) UNSIGNED NOT NULL,
  `KdBrand` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NmBrand` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `divisions`
--

INSERT INTO `divisions` (`id`, `name`, `slug`, `directorate_id`, `KdBrand`, `NmBrand`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Divisi Kasir', 'divisi-kasir', 1, '1', 'Brand A', 'Aktif', '2024-07-31 01:30:04', '2024-07-31 01:30:04'),
(2, 'Divisi Pemasaran', 'divisi-pemasaran', 2, '2', 'Brand B', 'Aktif', '2024-07-31 01:53:36', '2024-07-31 01:53:36');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jabatans`
--

CREATE TABLE `jabatans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `levelA` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `levelN` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `golongan` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `templevelA` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `templevelN` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `templevel` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tempgolongan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `specialist` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `executive` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uangKesehatan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uangMakan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uangAkomodasi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Aktif',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `jabatans`
--

INSERT INTO `jabatans` (`id`, `levelA`, `levelN`, `level`, `golongan`, `title`, `templevelA`, `templevelN`, `templevel`, `tempgolongan`, `specialist`, `executive`, `uangKesehatan`, `uangMakan`, `uangAkomodasi`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Level 1', 'Level 1', 'Level 1', 'Golongan 1', 'Cashier', NULL, NULL, NULL, NULL, NULL, NULL, '10000', '5000', '15000', 'Aktif', '2024-07-31 01:30:06', '2024-07-31 01:30:06'),
(2, 'Level 2', 'Level 2', 'Level 2', 'Golongan 2', 'Marketer', NULL, NULL, NULL, NULL, NULL, NULL, '20000', '10000', '30000', 'Aktif', '2024-07-31 01:53:38', '2024-07-31 01:53:38');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jobroles`
--

CREATE TABLE `jobroles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jobdesc` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `requirement` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `section_id` bigint(20) UNSIGNED NOT NULL,
  `jabatan_id` bigint(20) UNSIGNED NOT NULL,
  `competency_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Aktif',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `jobroles`
--

INSERT INTO `jobroles` (`id`, `name`, `slug`, `jobdesc`, `requirement`, `section_id`, `jabatan_id`, `competency_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Cashier', 'cashier', 'Handle cash transactions', 'Good in math', 1, 1, NULL, 'Aktif', '2024-07-31 01:30:06', '2024-07-31 01:30:06'),
(2, 'Marketer', 'marketer', 'Handle marketing campaigns', 'Good in communication', 2, 2, NULL, 'Aktif', '2024-07-31 01:53:39', '2024-07-31 01:53:39');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sections`
--

CREATE TABLE `sections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `department_id` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Aktif',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `sections`
--

INSERT INTO `sections` (`id`, `name`, `slug`, `department_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Seksi Kasir', 'seksi-kasir', 1, 'Aktif', '2024-07-31 01:30:05', '2024-07-31 01:30:05'),
(2, 'Seksi Pemasaran', 'seksi-pemasaran', 2, 'Aktif', '2024-07-31 01:53:38', '2024-07-31 01:53:38');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `level` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `emailKantor` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ktp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `npwp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tanggalMasuk` date DEFAULT NULL,
  `awalKontrak` date DEFAULT NULL,
  `akhirKontrak` date DEFAULT NULL,
  `tanggalTetap` date DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Aktif',
  `namaNpwp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `noKk` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `statusKaryawan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `statusPph` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `saldoKesehatan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tahunUpdateKesehatan` year(4) NOT NULL,
  `jobrole_id` bigint(20) UNSIGNED DEFAULT NULL,
  `groupabsen_id` bigint(20) UNSIGNED DEFAULT NULL,
  `kebangsaan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jenisKelamin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tempatLahir` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tanggalLahir` date DEFAULT NULL,
  `statusPerkawinan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `agama` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pendidikanTerakhir` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `namaSekolah` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jurusanSekolah` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telpPribadi` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telpRumah` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telpDarurat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `noBPJS` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `noBPJSK` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `noSIM1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `noSIM2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `golonganDarah` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `beratBadan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tinggiBadan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ibuKandung` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alamatKTP` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `noRtRwKTP` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provinceKTP` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cityKTP` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `districtKTP` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subdistrictKTP` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kelDesaKTP` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alamatDomisili` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `noRtRwDomisili` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provinceDomisili` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cityDomisili` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `districtDomisili` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subdistrictDomisili` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kelDesaDomisili` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `emailPribadi` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rekeningBank` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `totalcuti` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `cutihangus` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `cutibirthday` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `updateCuti` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tglupdatecuti` date DEFAULT NULL,
  `imgPhoto` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `imgLamaranKerja` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `imgKTP` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `imgKK` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `imgNPWP` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `imgBPJS` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `imgBPJSK` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `imgIjazah` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `imgTranskrip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `imgVerklaring` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `imgKeteranganSehat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `password`, `level`, `emailKantor`, `nip`, `ktp`, `npwp`, `tanggalMasuk`, `awalKontrak`, `akhirKontrak`, `tanggalTetap`, `status`, `namaNpwp`, `noKk`, `statusKaryawan`, `statusPph`, `saldoKesehatan`, `tahunUpdateKesehatan`, `jobrole_id`, `groupabsen_id`, `kebangsaan`, `jenisKelamin`, `tempatLahir`, `tanggalLahir`, `statusPerkawinan`, `agama`, `pendidikanTerakhir`, `namaSekolah`, `jurusanSekolah`, `telpPribadi`, `telpRumah`, `telpDarurat`, `noBPJS`, `noBPJSK`, `noSIM1`, `noSIM2`, `golonganDarah`, `beratBadan`, `tinggiBadan`, `ibuKandung`, `alamatKTP`, `noRtRwKTP`, `provinceKTP`, `cityKTP`, `districtKTP`, `subdistrictKTP`, `kelDesaKTP`, `alamatDomisili`, `noRtRwDomisili`, `provinceDomisili`, `cityDomisili`, `districtDomisili`, `subdistrictDomisili`, `kelDesaDomisili`, `emailPribadi`, `rekeningBank`, `totalcuti`, `cutihangus`, `cutibirthday`, `updateCuti`, `tglupdatecuti`, `imgPhoto`, `imgLamaranKerja`, `imgKTP`, `imgKK`, `imgNPWP`, `imgBPJS`, `imgBPJSK`, `imgIjazah`, `imgTranskrip`, `imgVerklaring`, `imgKeteranganSehat`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Ichsan', 'password', 'Level 1', 'ichsan@ptmajumundur.com', '123456', '1234567890123456', '123456789012345678', NULL, NULL, NULL, NULL, 'Aktif', NULL, NULL, NULL, NULL, NULL, 0000, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-31 01:30:07', '2024-07-31 01:30:07'),
(2, 'Budi', 'password', 'Level 2', 'budi@ptmajumaju.com', '1234567', '2345678901234567', '234567890123456789', NULL, NULL, NULL, NULL, 'Aktif', NULL, NULL, NULL, NULL, NULL, 0000, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-31 01:53:39', '2024-07-31 01:54:58');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `companies_subdistrict_id_foreign` (`subdistrict_id`) USING BTREE;

--
-- Indeks untuk tabel `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `departments_division_id_foreign` (`division_id`) USING BTREE;

--
-- Indeks untuk tabel `directorates`
--
ALTER TABLE `directorates`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `directorates_company_id_foreign` (`company_id`) USING BTREE;

--
-- Indeks untuk tabel `divisions`
--
ALTER TABLE `divisions`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `divisions_directorate_id_foreign` (`directorate_id`) USING BTREE;

--
-- Indeks untuk tabel `jabatans`
--
ALTER TABLE `jabatans`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indeks untuk tabel `jobroles`
--
ALTER TABLE `jobroles`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `jobroles_competency_id_foreign` (`competency_id`) USING BTREE,
  ADD KEY `jobroles_jabatan_id_foreign_idx` (`jabatan_id`) USING BTREE,
  ADD KEY `jobroles_section_id_foreign_idx` (`section_id`) USING BTREE;

--
-- Indeks untuk tabel `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `sections_department_id_foreign_idx` (`department_id`) USING BTREE;

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `users_jobrole_id_foreign` (`jobrole_id`) USING BTREE,
  ADD KEY `users_groupabsen_id_foreign` (`groupabsen_id`) USING BTREE;

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `companies`
--
ALTER TABLE `companies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `departments`
--
ALTER TABLE `departments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `directorates`
--
ALTER TABLE `directorates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `divisions`
--
ALTER TABLE `divisions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `jabatans`
--
ALTER TABLE `jabatans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `jobroles`
--
ALTER TABLE `jobroles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `sections`
--
ALTER TABLE `sections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `companies`
--
ALTER TABLE `companies`
  ADD CONSTRAINT `companies_subdistrict_id_foreign` FOREIGN KEY (`subdistrict_id`) REFERENCES `subdistricts` (`id`);

--
-- Ketidakleluasaan untuk tabel `departments`
--
ALTER TABLE `departments`
  ADD CONSTRAINT `departments_division_id_foreign` FOREIGN KEY (`division_id`) REFERENCES `divisions` (`id`);

--
-- Ketidakleluasaan untuk tabel `directorates`
--
ALTER TABLE `directorates`
  ADD CONSTRAINT `directorates_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`);

--
-- Ketidakleluasaan untuk tabel `divisions`
--
ALTER TABLE `divisions`
  ADD CONSTRAINT `divisions_directorate_id_foreign` FOREIGN KEY (`directorate_id`) REFERENCES `directorates` (`id`);

--
-- Ketidakleluasaan untuk tabel `jobroles`
--
ALTER TABLE `jobroles`
  ADD CONSTRAINT `jobroles_competency_id_foreign` FOREIGN KEY (`competency_id`) REFERENCES `competencies` (`id`),
  ADD CONSTRAINT `jobroles_jabatan_id_foreign` FOREIGN KEY (`jabatan_id`) REFERENCES `jabatans` (`id`);

--
-- Ketidakleluasaan untuk tabel `sections`
--
ALTER TABLE `sections`
  ADD CONSTRAINT `section_department_id_fk` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`);

--
-- Ketidakleluasaan untuk tabel `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_groupabsen_id_foreign` FOREIGN KEY (`groupabsen_id`) REFERENCES `groupabsens` (`id`),
  ADD CONSTRAINT `users_jobrole_id_foreign` FOREIGN KEY (`jobrole_id`) REFERENCES `jobroles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
