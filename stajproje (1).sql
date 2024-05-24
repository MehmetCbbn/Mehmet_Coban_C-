-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 24 May 2024, 09:13:09
-- Sunucu sürümü: 10.4.32-MariaDB
-- PHP Sürümü: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `stajproje`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kullanicilar`
--

CREATE TABLE `kullanicilar` (
  `kul_id` int(11) NOT NULL,
  `kul_ad` varchar(50) NOT NULL,
  `kul_sif` varchar(30) NOT NULL,
  `kul_tur` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `kullanicilar`
--

INSERT INTO `kullanicilar` (`kul_id`, `kul_ad`, `kul_sif`, `kul_tur`) VALUES
(1, 'Muhammed', '12345', 'ogretmen'),
(2, 'Sekreter', '1234', 'sekreter'),
(3, 'tugba', '12', 'ogretmen'),
(4, 'emre', '123321', 'ogretmen');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `ogrenciler`
--

CREATE TABLE `ogrenciler` (
  `ogr_kayit_no` int(11) NOT NULL,
  `ogr_ad` varchar(25) NOT NULL,
  `ogr_soyad` varchar(25) NOT NULL,
  `ogr_no` int(11) NOT NULL,
  `ogr_sinif` int(11) NOT NULL,
  `ogr_staj_kod` varchar(10) NOT NULL,
  `ogr_staj_yer` varchar(50) NOT NULL,
  `ogr_ogretmen` varchar(40) NOT NULL,
  `ogr_tc_no` int(11) NOT NULL,
  `ogr_cep_tel_no` int(11) NOT NULL,
  `ogr_eposta` varchar(30) NOT NULL,
  `ogr_staj_baslangic` date NOT NULL,
  `ogr_staj_bitis` date NOT NULL,
  `ogr_evrakpersonelteslim` tinyint(1) NOT NULL,
  `ogr_basvurudilekcesi` tinyint(1) NOT NULL,
  `ogr_mustehaklikbelgesi` tinyint(1) NOT NULL,
  `ogr_kimlikfotokopisi` int(11) NOT NULL,
  `ogr_stajdegerlendirme` int(11) NOT NULL,
  `ogr_stajraporu` int(11) NOT NULL,
  `ogr_stajbasarikontrol` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `ogrenciler`
--

INSERT INTO `ogrenciler` (`ogr_kayit_no`, `ogr_ad`, `ogr_soyad`, `ogr_no`, `ogr_sinif`, `ogr_staj_kod`, `ogr_staj_yer`, `ogr_ogretmen`, `ogr_tc_no`, `ogr_cep_tel_no`, `ogr_eposta`, `ogr_staj_baslangic`, `ogr_staj_bitis`, `ogr_evrakpersonelteslim`, `ogr_basvurudilekcesi`, `ogr_mustehaklikbelgesi`, `ogr_kimlikfotokopisi`, `ogr_stajdegerlendirme`, `ogr_stajraporu`, `ogr_stajbasarikontrol`) VALUES
(16, 'narin', 'aga', 23456, 4, 'end400', 'baskent', 'emre', 123456, 234567, 'jyhgfbdvsc', '2024-05-08', '2024-05-23', 0, 1, 1, 1, 1, 1, 1),
(18, '', '', 0, 1, 'end300', '', 'emre', 0, 0, '', '0000-00-00', '0000-00-00', 0, 0, 0, 0, 0, 0, 1),
(21, 'Mehmett', 'Çobann', 765333, 1, 'end300', '', 'tugba', 1234567, 2147483647, 'cbnismehmet8@gmail.com', '0000-00-00', '0000-00-00', 0, 1, 1, 1, 1, 1, 1),
(24, 'vbghn', 'asv', 234, 0, '', '', 'tugba', 123, 654, 'ccccccccv', '2024-05-16', '2024-05-16', 1, 0, 1, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `puanlar`
--

CREATE TABLE `puanlar` (
  `ogr_no` int(11) NOT NULL,
  `ogr_puan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `puanlar`
--

INSERT INTO `puanlar` (`ogr_no`, `ogr_puan`) VALUES
(23456, 10);

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `kullanicilar`
--
ALTER TABLE `kullanicilar`
  ADD PRIMARY KEY (`kul_id`);

--
-- Tablo için indeksler `ogrenciler`
--
ALTER TABLE `ogrenciler`
  ADD PRIMARY KEY (`ogr_kayit_no`),
  ADD UNIQUE KEY `ogr_no` (`ogr_no`);

--
-- Tablo için indeksler `puanlar`
--
ALTER TABLE `puanlar`
  ADD PRIMARY KEY (`ogr_no`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `kullanicilar`
--
ALTER TABLE `kullanicilar`
  MODIFY `kul_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Tablo için AUTO_INCREMENT değeri `ogrenciler`
--
ALTER TABLE `ogrenciler`
  MODIFY `ogr_kayit_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `puanlar`
--
ALTER TABLE `puanlar`
  ADD CONSTRAINT `puanlar_ibfk_1` FOREIGN KEY (`ogr_no`) REFERENCES `ogrenciler` (`ogr_no`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
