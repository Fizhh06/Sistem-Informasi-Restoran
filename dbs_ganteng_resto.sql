SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbs_ganteng_resto`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_arus_kas`
--

CREATE TABLE `tbl_arus_kas` (
  `id` int(13) NOT NULL,
  `kd_transaksi` varchar(30) DEFAULT NULL,
  `tipe` varchar(50) DEFAULT NULL,
  `arus` varchar(10) DEFAULT NULL,
  `total` int(25) DEFAULT NULL,
  `waktu` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `operator` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_bahan_baku`
--

CREATE TABLE `tbl_bahan_baku` (
  `id` int(11) NOT NULL,
  `kd_bahan` varchar(4) NOT NULL,
  `nama` varchar(200) NOT NULL,
  `deks` text NOT NULL,
  `kategori` varchar(50) NOT NULL,
  `satuan` varchar(50) NOT NULL,
  `stok` int(10) NOT NULL,
  `aktif` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_bantuan`
--

CREATE TABLE `tbl_bantuan` (
  `id` int(3) NOT NULL,
  `judul` varchar(255) DEFAULT NULL,
  `deks` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_bantuan`
--

INSERT INTO `tbl_bantuan` (`id`, `judul`, `deks`) VALUES
(1, 'Proses pemesanan di website customer tidak bisa di proses', 'Pastikan settingan firebase sudah benar'),
(2, 'Print struk tidak berjalan', 'Pastikan koneksi ke printer, pastikan printer terdeteksi di sistem operasi. Port printer juga harus diperhatikan'),
(3, 'Key firebase sudah di masukkan, tetapi tidak bekerja', 'Kemungkinan rules dari realtime database path belum di aktifkan, silahkan aktifkan terlebih dahulu.'),
(4, 'Laporan tipe PDF tidak bisa di akses (print)', 'Masalah yang mungkin terjadi adalah jika anda menggunakan server linux sebagai webserver, pastikan folder aplikasi sudah mendapatkan hak akses penuh untuk read, write.'),
(5, 'Proses checkout tidak berjalan', 'Kemungkinan masalah ada di path server pada settingan file base.php, perhatikan apakah semuanya sudah benar'),
(6, 'Email tidak terkirim', 'Pastikan settingan SMTP sudah sesuai, jika menggunakan gmail sebagai host, pastikan settingan dari sisi gmailnya sudah di aktifkan');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_csrf_token`
--

CREATE TABLE `tbl_csrf_token` (
  `id` int(10) NOT NULL,
  `token` varchar(30) DEFAULT NULL,
  `login_from` varchar(20) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `valid_until` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_delivery_order`
--

CREATE TABLE `tbl_delivery_order` (
  `id` int(5) NOT NULL,
  `kd_pesanan` varchar(15) DEFAULT NULL,
  `pelanggan` varchar(20) DEFAULT NULL,
  `kurir` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `tipe_pembayaran` varchar(20) DEFAULT NULL,
  `dikirim` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `diterima` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `alamat_pengiriman` text,
  `masuk` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_firebase_config`
--

CREATE TABLE `tbl_firebase_config` (
  `id` int(2) NOT NULL,
  `kd_setting` varchar(155) DEFAULT NULL,
  `caption` varchar(155) DEFAULT NULL,
  `value` varchar(155) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_kategori_menu`
--

CREATE TABLE `tbl_kategori_menu` (
  `id` int(3) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `deks` text NOT NULL,
  `active` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_kategori_menu`
--

INSERT INTO `tbl_kategori_menu` (`id`, `nama`, `deks`, `active`) VALUES
(1, 'Makanan Utama', 'Makanan utama\r\n', '1'),
(2, 'Coffe', 'Coffe & Cappucino\r\n', '1'),
(3, 'Side Food (Snack)', 'Makanan kecil & pendamping', '1'),
(4, 'Cake', 'Kue', '1'),
(5, 'Tea', 'Kategori minuman', '1'),
(6, 'Pasta', 'Pasta', '1'),
(7, 'Juice', 'Kategori jus', '1'),
(8, 'Milkshake', 'Kategori milkshake', '1'),
(9, 'Seafood', 'Seafood', '1'),
(10, 'Noodles', 'Noodles', '1');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_meja`
--

CREATE TABLE `tbl_meja` (
  `id` int(5) NOT NULL,
  `kd_meja` varchar(5) NOT NULL,
  `nama` varchar(111) NOT NULL,
  `deks` text NOT NULL,
  `status` varchar(50) NOT NULL,
  `jlh_tamu` int(3) DEFAULT NULL,
  `last_visit` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_menu`
--

CREATE TABLE `tbl_menu` (
  `id` int(5) NOT NULL,
  `kd_menu` varchar(10) NOT NULL,
  `nama` varchar(200) NOT NULL,
  `deks` text NOT NULL,
  `kategori` varchar(50) NOT NULL,
  `satuan` varchar(50) NOT NULL,
  `harga` int(20) NOT NULL,
  `pic` varchar(200) NOT NULL,
  `total_dipesan` int(7) NOT NULL,
  `aktif` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_menu`
--

INSERT INTO `tbl_menu` (`id`, `kd_menu`, `nama`, `deks`, `kategori`, `satuan`, `harga`, `pic`, `total_dipesan`, `aktif`) VALUES
(1, '08128922', 'Nasi Goreng Spesial', 'Nasi goreng spesial dengan tambahan topping sosis, nugget, dan udang', '1', 'porsi', 25000, '08128922.jpg', 0, '1'),
(21, '45446025', 'Teh Manis Dingin', 'Teh manis dingin ukuran sedang', '5', 'porsi', 7000, '45446025.jpg', 0, '1'),
(2, '38216412', 'Mie Ayam', 'Mie Ayam dengan Telur', '1', 'porsi', 20000, '38216412.jpg', 0, '1'),
(3, '40855812', 'Ayam Bakar', 'Ayam Bakar dengan Bumbu Madu', '1', 'porsi', 25000, '40855812.jpg', 0, '1'),
(4, '56410573', 'Ayam Geprek', 'Ayam Geprek dengan Nasi Putih', '1', 'porsi', 25000, '56410573.jpg', 0, '1'),
(5, '92867835', 'Sate Ayam', 'Sate Ayam dengan Bumbu Kacang dan tambahan Lontong', '1', 'porsi', 25000, '92867835.jpg', 0, '1'),
(6, '39716680', 'Kentang Goreng', 'Kentang Goreng ala Prancis', '3', 'porsi', 10000, '39716680.jpg', 0, '1'),
(7, '51046036', 'Tempe Goreng', 'Tempe Goreng Cita Rasa Indonesia', '3', 'porsi', 10000, '51046036.jpg', 0, '1'),
(8, '76926355', 'Nugget Goreng', 'Nugget Handmade oleh koki kami', '3', 'porsi', 10000, '76926355.jpg', 0, '1'),
(9, '56517281', 'Bakso Goreng', 'Bakso Goreng Handmade yang dibuat menggunakan daging ayam', '3', 'porsi', 10000, '56517281.jpg', 0, '1'),
(10, '78706074', 'Jus Alpukat', 'Menggunakan Buah yang masi segar', '7', 'porsi', 15000, '78706074.jpg', 0, '1'),
(11, '08206185', 'Jus Belimbing', 'Menggunakan Buah yang masi segar', '7', 'porsi', 15000, '08206185.jpg', 0, '1')

-- --------------------------------------------------------

--
-- Table structure for table `tbl_mitra`
--

CREATE TABLE `tbl_mitra` (
  `id` int(5) NOT NULL,
  `kd_mitra` varchar(8) NOT NULL,
  `nama` varchar(155) NOT NULL,
  `deks` text NOT NULL,
  `alamat` text NOT NULL,
  `pemilik` varchar(100) NOT NULL,
  `hp` varchar(20) NOT NULL,
  `aktif` varchar(1) NOT NULL,
  `tipe` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_operator`
--

CREATE TABLE `tbl_operator` (
  `id` int(5) NOT NULL,
  `username` varchar(55) NOT NULL,
  `nama` varchar(55) NOT NULL,
  `alamat` text NOT NULL,
  `hp` varchar(20) NOT NULL,
  `posisi` varchar(50) NOT NULL,
  `total_waktu_kerja` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pelanggan`
--

CREATE TABLE `tbl_pelanggan` (
  `id` int(5) NOT NULL,
  `id_pelanggan` varchar(20) NOT NULL,
  `nama` varchar(111) NOT NULL,
  `alamat` text NOT NULL,
  `no_hp` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `last_visit` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_pelanggan`
--

INSERT INTO `tbl_pelanggan` (`id`, `id_pelanggan`, `nama`, `alamat`, `no_hp`, `email`, `last_visit`) VALUES
(1, 'cash', 'Cash (Pelanggan default)', '-', '-', '-', '2020-06-22 09:07:13');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pembayaran`
--

CREATE TABLE `tbl_pembayaran` (
  `id` int(7) NOT NULL,
  `kd_invoice` varchar(30) NOT NULL,
  `kd_pesanan` varchar(30) NOT NULL,
  `waktu` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `total` int(25) NOT NULL,
  `kd_promo` varchar(111) DEFAULT NULL,
  `diskon` int(25) NOT NULL,
  `tax` int(15) DEFAULT NULL,
  `total_final` int(25) NOT NULL,
  `tunai` int(25) NOT NULL,
  `kembali` int(25) NOT NULL,
  `operator` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pembelian_bahan_baku`
--

CREATE TABLE `tbl_pembelian_bahan_baku` (
  `id` int(10) NOT NULL,
  `kd_pembelian` varchar(15) DEFAULT NULL,
  `mitra` varchar(100) DEFAULT NULL,
  `waktu` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `total` int(20) DEFAULT NULL,
  `operator` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pengeluaran`
--

CREATE TABLE `tbl_pengeluaran` (
  `id` int(9) NOT NULL,
  `kd_pengeluaran` varchar(20) DEFAULT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `deks` text,
  `kategori` varchar(50) DEFAULT NULL,
  `total` int(20) DEFAULT NULL,
  `operator` varchar(50) DEFAULT NULL,
  `waktu` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pesanan`
--

CREATE TABLE `tbl_pesanan` (
  `id` int(7) NOT NULL,
  `kd_pesanan` varchar(20) NOT NULL,
  `pelanggan` varchar(111) NOT NULL,
  `tipe` varchar(50) NOT NULL,
  `jumlah_tamu` int(3) NOT NULL,
  `meja` varchar(111) DEFAULT NULL,
  `waktu_masuk` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `waktu_selesai` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `operator` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_promo`
--

CREATE TABLE `tbl_promo` (
  `id` int(4) NOT NULL,
  `kd_promo` varchar(8) NOT NULL,
  `nama` varchar(111) NOT NULL,
  `deks` text NOT NULL,
  `tipe` varchar(25) NOT NULL,
  `value` int(20) NOT NULL,
  `kuota` int(5) NOT NULL,
  `tanggal_expired` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_setting`
--

CREATE TABLE `tbl_setting` (
  `id` int(3) NOT NULL,
  `kd_setting` varchar(200) NOT NULL,
  `caption` varchar(111) NOT NULL,
  `deks` text NOT NULL,
  `value` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_setting`
--



--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `id` int(5) NOT NULL,
  `username` varchar(111) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `password` varchar(111) NOT NULL,
  `tipe` varchar(11) NOT NULL,
  `last_login` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`id`, `username`, `nama`, `password`, `tipe`, `last_login`) VALUES
(1, 'admin', 'Nadha Resto Admin', '$2y$10$QzSw1T9csavkHjJEjeYsOumM3tOrT1WKWZQPAe/4tuFSql.lYSfxq', 'admin', '2020-09-15 16:04:53');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_arus_kas`
--
ALTER TABLE `tbl_arus_kas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_bahan_baku`
--
ALTER TABLE `tbl_bahan_baku`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_bantuan`
--
ALTER TABLE `tbl_bantuan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_csrf_token`
--
ALTER TABLE `tbl_csrf_token`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_delivery_order`
--
ALTER TABLE `tbl_delivery_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_firebase_config`
--
ALTER TABLE `tbl_firebase_config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_kategori_menu`
--
ALTER TABLE `tbl_kategori_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_meja`
--
ALTER TABLE `tbl_meja`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_menu`
--
ALTER TABLE `tbl_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_mitra`
--
ALTER TABLE `tbl_mitra`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_operator`
--
ALTER TABLE `tbl_operator`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_pelanggan`
--
ALTER TABLE `tbl_pelanggan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_pembayaran`
--
ALTER TABLE `tbl_pembayaran`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_pembelian_bahan_baku`
--
ALTER TABLE `tbl_pembelian_bahan_baku`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_pengeluaran`
--
ALTER TABLE `tbl_pengeluaran`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_pesanan`
--
ALTER TABLE `tbl_pesanan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_promo`
--
ALTER TABLE `tbl_promo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_setting`
--
ALTER TABLE `tbl_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_slider`
--
ALTER TABLE `tbl_slider`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_temp_pembelian_bahan_baku`
--
ALTER TABLE `tbl_temp_pembelian_bahan_baku`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_temp_pesanan`
--
ALTER TABLE `tbl_temp_pesanan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_temp_self_service`
--
ALTER TABLE `tbl_temp_self_service`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_timeline`
--
ALTER TABLE `tbl_timeline`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_transaksi`
--
ALTER TABLE `tbl_transaksi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`id`,`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_arus_kas`
--
ALTER TABLE `tbl_arus_kas`
  MODIFY `id` int(13) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_bahan_baku`
--
ALTER TABLE `tbl_bahan_baku`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_bantuan`
--
ALTER TABLE `tbl_bantuan`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_csrf_token`
--
ALTER TABLE `tbl_csrf_token`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_delivery_order`
--
ALTER TABLE `tbl_delivery_order`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_firebase_config`
--
ALTER TABLE `tbl_firebase_config`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_kategori_menu`
--
ALTER TABLE `tbl_kategori_menu`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbl_meja`
--
ALTER TABLE `tbl_meja`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_menu`
--
ALTER TABLE `tbl_menu`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `tbl_mitra`
--
ALTER TABLE `tbl_mitra`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_operator`
--
ALTER TABLE `tbl_operator`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_pelanggan`
--
ALTER TABLE `tbl_pelanggan`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_pembayaran`
--
ALTER TABLE `tbl_pembayaran`
  MODIFY `id` int(7) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_pembelian_bahan_baku`
--
ALTER TABLE `tbl_pembelian_bahan_baku`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_pengeluaran`
--
ALTER TABLE `tbl_pengeluaran`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_pesanan`
--
ALTER TABLE `tbl_pesanan`
  MODIFY `id` int(7) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_promo`
--
ALTER TABLE `tbl_promo`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_setting`
--
ALTER TABLE `tbl_setting`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `tbl_slider`
--
ALTER TABLE `tbl_slider`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_temp_pembelian_bahan_baku`
--
ALTER TABLE `tbl_temp_pembelian_bahan_baku`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_temp_pesanan`
--
ALTER TABLE `tbl_temp_pesanan`
  MODIFY `id` int(7) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_temp_self_service`
--
ALTER TABLE `tbl_temp_self_service`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_timeline`
--
ALTER TABLE `tbl_timeline`
  MODIFY `id` int(7) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_transaksi`
--
ALTER TABLE `tbl_transaksi`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
