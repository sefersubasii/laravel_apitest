-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 26 Şub 2022, 20:26:02
-- Sunucu sürümü: 10.4.22-MariaDB
-- PHP Sürümü: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `api`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(4, '2014_10_12_000000_create_users_table', 1),
(5, '2022_02_26_151947_create_products_table', 1),
(6, '2022_02_26_152037_create_products__stocks_table', 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `idvatgroup` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(8,2) NOT NULL,
  `fixedstockprice` double(8,2) DEFAULT NULL,
  `idsupplier` int(11) DEFAULT NULL,
  `productcode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `productcode_supplier` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deliverytime` int(11) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `barcode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unlimitedstock` tinyint(1) NOT NULL,
  `assembled` tinyint(1) NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `length` int(11) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `minimum_purchase_quantity` int(11) DEFAULT NULL,
  `purchase_in_quantities_of` int(11) DEFAULT NULL,
  `hs_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_of_origin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `idfulfilment_customer` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `products`
--

INSERT INTO `products` (`id`, `idvatgroup`, `name`, `price`, `fixedstockprice`, `idsupplier`, `productcode`, `productcode_supplier`, `deliverytime`, `description`, `barcode`, `unlimitedstock`, `assembled`, `type`, `weight`, `length`, `width`, `height`, `minimum_purchase_quantity`, `purchase_in_quantities_of`, `hs_code`, `country_of_origin`, `active`, `idfulfilment_customer`, `created_at`, `updated_at`) VALUES
(21082394, 11362, 'dx sefer', 51.99, 0.00, NULL, '123', '', 0, 'asd', '', 0, 0, 'normal', 0, 15, NULL, NULL, 0, 0, '', '', 1, NULL, '2022-02-26 16:02:13', '2022-02-26 16:02:13'),
(21082395, 11362, 'zengen 28', 150.99, 0.00, NULL, '1638637959', '', NULL, 'This istem was updated by idris', NULL, 0, 0, 'normal', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, NULL, '2022-02-26 16:02:13', '2022-02-26 16:02:13'),
(21082396, 11362, 'sefer deneme', 45.90, 0.00, NULL, '1638638060', '', NULL, 'Deneme test', '9983762736270', 0, 0, 'normal', 0, 0, 0, 0, 0, 0, '', '', 0, NULL, '2022-02-26 16:02:13', '2022-02-26 16:02:13'),
(21082397, 11362, 'Ceday 222', 128.87, 0.00, NULL, '1638638069', '', NULL, 'Hello from starwars. This side is wonderfull. Whats up??', NULL, 0, 0, 'normal', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, NULL, '2022-02-26 16:02:13', '2022-02-26 16:02:13'),
(21082398, 11362, 'new item', 3232.00, 0.00, NULL, '1638638231', '', NULL, 'this is a wonderfull product', NULL, 0, 0, 'normal', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, NULL, '2022-02-26 16:02:13', '2022-02-26 16:02:13'),
(21082399, 11362, 'item 007', 2525.00, 0.00, NULL, '1638638791', '', NULL, 'This is item is 007', NULL, 0, 0, 'normal', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, NULL, '2022-02-26 16:02:13', '2022-02-26 16:02:13'),
(21082400, 11362, 'cccsss', 333.00, 0.00, NULL, '1638638868', '', NULL, 'ccc sss ddd', NULL, 0, 0, 'normal', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, NULL, '2022-02-26 16:02:13', '2022-02-26 16:02:13'),
(21082401, 11362, 'starbucs', 22.00, 0.00, NULL, '1638641266', '', NULL, 'harika', NULL, 0, 0, 'normal', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, NULL, '2022-02-26 16:02:13', '2022-02-26 16:02:13'),
(21082402, 11362, 'Java Chip', 25.00, 0.00, NULL, '1638646746', '', NULL, 'A delicious drink from starbucks', NULL, 0, 0, 'normal', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, NULL, '2022-02-26 16:02:13', '2022-02-26 16:02:13'),
(21082403, 11362, 'qwerty', 1.00, 0.00, NULL, '1638781862', '', NULL, 'qwe', NULL, 0, 0, 'normal', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, NULL, '2022-02-26 16:02:13', '2022-02-26 16:02:13'),
(21082404, 11362, 'Lexar', 1.00, 0.00, NULL, '1qweqwe', '', NULL, 'A good printer', NULL, 0, 0, 'normal', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, NULL, '2022-02-26 16:02:13', '2022-02-26 16:02:13'),
(21082405, 11362, 'babik', 1.00, 0.00, NULL, '1qweqwe123', '', NULL, 'tütüncü', NULL, 0, 0, 'normal', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, NULL, '2022-02-26 16:02:13', '2022-02-26 16:02:13'),
(21082406, 11362, 'mesat', 33.00, 0.00, NULL, '22', '', NULL, 'test', NULL, 0, 0, 'normal', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, NULL, '2022-02-26 16:02:13', '2022-02-26 16:02:13'),
(21082407, 11362, 'Turkish', 11.00, 3333.00, 71546, '2V5TIHAH', '11', 0, 'A turkish product', '', 0, 0, 'normal', 0, 0, 0, 0, 0, 0, NULL, NULL, 1, NULL, '2022-02-26 16:02:13', '2022-02-26 16:02:13'),
(21082408, 11362, 'salim mous', 15471.00, 1848.00, NULL, '542828828287266', '542828828287266', NULL, NULL, '', 0, 0, 'normal', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, NULL, '2022-02-26 16:02:13', '2022-02-26 16:02:13'),
(21082409, 11362, 'salim mous', 15471.00, 1848.00, NULL, '5428288282877', '5428288282877', NULL, NULL, '', 0, 0, 'normal', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, NULL, '2022-02-26 16:02:13', '2022-02-26 16:02:13'),
(21082410, 11362, 'Hyperkewl Evaporative Cooling Vest Ultra Blue 7-9yr', 54.46, 0.00, NULL, '883629-22', '', NULL, NULL, NULL, 0, 0, 'normal', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, NULL, '2022-02-26 16:02:13', '2022-02-26 16:02:13'),
(21082411, 11362, 'Hyperkewl Evaporative Cooling Vest Ultra Blue 7-9yr', 54.46, 0.00, NULL, '883629-22d', '', NULL, NULL, NULL, 0, 0, 'normal', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, NULL, '2022-02-26 16:02:13', '2022-02-26 16:02:13'),
(21082412, 11362, 'Hyperkewl Evaporative Cooling Vest Ultra Blue 7-9yr', 54.46, 0.00, NULL, '883629-22ddd', '', NULL, NULL, NULL, 0, 0, 'normal', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, NULL, '2022-02-26 16:02:13', '2022-02-26 16:02:13'),
(21082413, 11362, 'Hyperkewl Evaporative Cooling Vest Ultra Red', 51.99, 0.00, NULL, '885285894', '', NULL, 'test', NULL, 0, 0, 'normal', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, NULL, '2022-02-26 16:02:13', '2022-02-26 16:02:13'),
(21082414, 11362, 'mesat', 33.00, 0.00, NULL, '88585894', '', NULL, 'test', NULL, 0, 0, 'normal', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, NULL, '2022-02-26 16:02:13', '2022-02-26 16:02:13'),
(21082415, 11362, 'bbb', 50.00, 0.00, NULL, 'B0020MLK00', '', 0, 'sss', '1234567890', 0, 0, 'normal', 0, NULL, NULL, NULL, 0, 0, '', '', 1, NULL, '2022-02-26 16:02:13', '2022-02-26 16:02:13'),
(21082416, 11362, 'HP 36A (CB436A) toner black 4000 pages (BULK)', 85.50, 16.10, 71544, 'BUL10005', '350638-071494', 0, NULL, '', 0, 0, 'normal', 0, 0, 0, 0, 0, 0, NULL, NULL, 1, NULL, '2022-02-26 16:02:13', '2022-02-26 16:02:13'),
(21082417, 11362, 'Lexmark 12A7465 toner black 21000 pages', 104.50, 0.00, NULL, 'BUL10048', '', 0, '12A7465', '', 0, 0, 'normal', 0, NULL, NULL, NULL, 0, 0, '', '', 1, NULL, '2022-02-26 16:02:13', '2022-02-26 16:02:13'),
(21082418, 11362, 'Name of Product', 555.00, 0.00, NULL, 'Code', '', NULL, 'Description', NULL, 0, 0, 'normal', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, NULL, '2022-02-26 16:02:13', '2022-02-26 16:02:13'),
(21082419, 11362, 'Apple iPod Shuffle Purple', 59.95, 49.95, NULL, 'DKS-092383', 'DKS-092383', NULL, NULL, '9983762736271', 0, 0, 'normal', 500, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, NULL, '2022-02-26 16:02:13', '2022-02-26 16:02:13'),
(21082420, 11364, 'HP 36A (CB436A) toner black 4000 pages (Ecotone) updated thru api', 85.60, 0.00, 71544, 'ECO10005-1', '', 3, 'ASDASDASD', '', 0, 0, 'normal', 1, 5, 5, 5, 0, 0, '', '', 1, NULL, '2022-02-26 16:02:13', '2022-02-26 16:02:13'),
(21082421, 11362, '11 Lexssssssmark 12A7465 toner black 21000 pages (Ecotone)', 104.50, 0.00, 71544, 'ECO10048', 'K12007E3', 0, NULL, '', 0, 1, 'composition_with_stock', 0, 0, 0, 0, 0, 0, NULL, NULL, 1, NULL, '2022-02-26 16:02:13', '2022-02-26 16:02:13'),
(21082422, 11362, 'Ecotone box 375x135x110mm Small', 43.00, 0.69, 71546, 'ECOBOX1', NULL, 2, '', '', 0, 0, 'normal', NULL, NULL, NULL, NULL, 0, 0, '', 'FR', 1, NULL, '2022-02-26 16:02:13', '2022-02-26 16:02:13'),
(21082423, 11362, 'Ecotone box 375x165x360mm', 4.00, 1.00, NULL, 'ECOBOX3', '', 0, NULL, '', 0, 0, 'normal', 0, NULL, NULL, NULL, 0, 0, '', '', 1, NULL, '2022-02-26 16:02:13', '2022-02-26 16:02:13'),
(21082424, 11362, 'gd', 1200.00, 24.00, NULL, 'mby-ecoton-2512', '2421', NULL, NULL, '2511', 0, 0, 'normal', 23, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, NULL, '2022-02-26 16:02:13', '2022-02-26 16:02:13'),
(21082425, 11362, 'Product 001', 414.22, 400.00, NULL, 'p001', '', NULL, 'Test product 1', NULL, 1, 0, 'unlimited_stock', 1501, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, NULL, '2022-02-26 16:02:13', '2022-02-26 16:02:13'),
(21082426, 11362, 'The last product', 852.00, 0.00, NULL, 'Product 001', '', NULL, 'This is the last product', NULL, 0, 0, 'normal', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, NULL, '2022-02-26 16:02:13', '2022-02-26 16:02:13'),
(21082427, 11362, 'Samsung 27\" Led', 325.99, 0.00, NULL, 'Samsung 002', '', NULL, 'Very nice screen', NULL, 0, 0, 'normal', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, NULL, '2022-02-26 16:02:13', '2022-02-26 16:02:13'),
(21082428, 11362, '12312311123', 0.00, 0.00, NULL, 'sjs', '', NULL, NULL, NULL, 0, 0, 'normal', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, NULL, '2022-02-26 16:02:13', '2022-02-26 16:02:13'),
(21082429, 11362, 'Test Product 22', 555.44, 0.00, NULL, 'Test 001', '', NULL, 'This is an another product and it added by idris.', NULL, 0, 0, 'normal', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, NULL, '2022-02-26 16:02:13', '2022-02-26 16:02:13'),
(21082430, 11362, 'Test Product 4', 123.11, 0.00, NULL, 'test 004', '', NULL, 'The test product', NULL, 0, 0, 'normal', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, NULL, '2022-02-26 16:02:13', '2022-02-26 16:02:13'),
(21082431, 11362, 'Test Ürün', 5.00, 4.40, NULL, 'test-123', '', NULL, 'Test Ürün', '6789797445', 0, 0, 'normal', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, NULL, '2022-02-26 16:02:13', '2022-02-26 16:02:13'),
(21082432, 11362, 'Test Ürün Son', 150.00, 0.00, NULL, 'test123456798', '', NULL, 'Test ürün içerik', '', 0, 0, 'normal', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, NULL, '2022-02-26 16:02:13', '2022-02-26 16:02:13'),
(21082433, 11362, 'Test Ürün Son', 150.00, 0.00, NULL, 'test1234567981', '', NULL, 'Test ürün içerik', '', 0, 0, 'normal', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, NULL, '2022-02-26 16:02:13', '2022-02-26 16:02:13'),
(21082434, 11362, 'Test Ürün Son', 150.00, 0.00, NULL, 'test1234567981a', '', NULL, 'Test ürün içerik', '', 0, 0, 'normal', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, NULL, '2022-02-26 16:02:13', '2022-02-26 16:02:13'),
(21082435, 11362, 'Test Ürün Son', 150.00, 0.00, NULL, 'test1234567981e', '', NULL, 'Test ürün içerik', '', 0, 0, 'normal', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, NULL, '2022-02-26 16:02:13', '2022-02-26 16:02:13'),
(21082436, 11362, 'test4', 100.00, 100.00, 71546, 'test4', NULL, NULL, 'test4', '', 0, 0, 'normal', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, NULL, '2022-02-26 16:02:13', '2022-02-26 16:02:13'),
(21082437, 11362, 'test5', 200.00, 0.00, NULL, 'test5', NULL, NULL, 'test5', '', 0, 0, 'normal', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, NULL, '2022-02-26 16:02:13', '2022-02-26 16:02:13'),
(21082438, 11362, 'test7', 500.00, 0.00, NULL, 'test7', NULL, NULL, 'test7', '', 0, 0, 'normal', 200, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, NULL, '2022-02-26 16:02:13', '2022-02-26 16:02:13'),
(21082439, 11362, 'test8', 200.00, 200.00, NULL, 'test8', NULL, NULL, 'test8', '', 0, 0, 'normal', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, NULL, '2022-02-26 16:02:13', '2022-02-26 16:02:13'),
(21082440, 11362, 'Test Ürün', 180.00, 160.00, NULL, 'TR87979822', '', NULL, 'Test Ürün', '8974984984241', 0, 0, 'normal', 158, 150, 150, 150, 0, 0, NULL, NULL, 1, NULL, '2022-02-26 16:02:13', '2022-02-26 16:02:13');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `products__stocks`
--

CREATE TABLE `products__stocks` (
  `idwarehouse` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `product_Id` int(10) UNSIGNED NOT NULL,
  `reserved` int(11) NOT NULL DEFAULT 0,
  `reservedbackorders` int(11) NOT NULL DEFAULT 0,
  `reservedpicklists` int(11) NOT NULL DEFAULT 0,
  `reservedallocations` int(11) NOT NULL DEFAULT 0,
  `freestock` int(11) NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `products__stocks`
--

INSERT INTO `products__stocks` (`idwarehouse`, `stock`, `product_Id`, `reserved`, `reservedbackorders`, `reservedpicklists`, `reservedallocations`, `freestock`, `failed_at`) VALUES
(6209, 64, 21082394, 0, 0, 0, 0, 64, '2022-02-26 19:02:13'),
(6824, 4196, 21082394, 0, 0, 0, 0, 4196, '2022-02-26 19:02:13'),
(6209, 620, 21082395, 0, 0, 0, 0, 620, '2022-02-26 19:02:13'),
(6824, 73, 21082395, 0, 0, 0, 0, 73, '2022-02-26 19:02:13'),
(6824, 20, 21082397, 0, 0, 0, 0, 20, '2022-02-26 19:02:13'),
(6824, 106, 21082398, 0, 0, 0, 0, 106, '2022-02-26 19:02:13'),
(6824, 20, 21082402, 0, 0, 0, 0, 20, '2022-02-26 19:02:13'),
(5766, 2, 21082404, 0, 0, 0, 0, 2, '2022-02-26 19:02:13'),
(5766, 2, 21082412, 0, 0, 0, 0, 2, '2022-02-26 19:02:13'),
(6621, 0, 21082415, 0, 0, 0, 0, 0, '2022-02-26 19:02:13'),
(5766, 0, 21082416, 0, 0, 0, 0, 0, '2022-02-26 19:02:13'),
(6209, 11, 21082417, 0, 0, 0, 0, 11, '2022-02-26 19:02:13'),
(5766, 0, 21082420, 0, 0, 0, 0, 0, '2022-02-26 19:02:13'),
(6209, 13, 21082420, 0, 0, 0, 0, 13, '2022-02-26 19:02:13'),
(6621, 13, 21082420, 0, 0, 0, 0, 13, '2022-02-26 19:02:13'),
(6824, 3, 21082420, 0, 0, 0, 0, 3, '2022-02-26 19:02:13'),
(6209, 3, 21082421, 2, 0, 2, 0, 1, '2022-02-26 19:02:13'),
(5766, 6, 21082421, 0, 0, 0, 0, 6, '2022-02-26 19:02:13'),
(6824, 0, 21082421, 0, 0, 0, 0, 0, '2022-02-26 19:02:13'),
(5766, 0, 21082422, 0, 0, 0, 0, 0, '2022-02-26 19:02:13'),
(6209, 8, 21082423, 0, 0, 0, 0, 8, '2022-02-26 19:02:13'),
(6209, 5, 21082426, 0, 0, 0, 0, 5, '2022-02-26 19:02:13'),
(6621, 2, 21082426, 0, 0, 0, 0, 2, '2022-02-26 19:02:13'),
(6209, 50, 21082427, 0, 0, 0, 0, 50, '2022-02-26 19:02:13'),
(6824, 48, 21082428, 0, 0, 0, 0, 48, '2022-02-26 19:02:13'),
(6209, 50, 21082428, 0, 0, 0, 0, 50, '2022-02-26 19:02:13'),
(6824, 5, 21082430, 0, 0, 0, 0, 5, '2022-02-26 19:02:13'),
(6209, 1, 21082431, 0, 0, 0, 0, 1, '2022-02-26 19:02:13'),
(6209, 15, 21082433, 0, 0, 0, 0, 15, '2022-02-26 19:02:13'),
(6209, 5, 21082434, 0, 0, 0, 0, 5, '2022-02-26 19:02:13'),
(6621, 4, 21082434, 0, 0, 0, 0, 4, '2022-02-26 19:02:13'),
(6209, 10, 21082438, 0, 0, 0, 0, 10, '2022-02-26 19:02:13'),
(6209, 10, 21082439, 0, 0, 0, 0, 10, '2022-02-26 19:02:13'),
(6209, 3, 21082440, 0, 0, 0, 0, 3, '2022-02-26 19:02:13'),
(6621, 2, 21082440, 0, 0, 0, 0, 3, '2022-02-26 19:02:13');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `products__stocks`
--
ALTER TABLE `products__stocks`
  ADD KEY `products__stocks_product_id_foreign` (`product_Id`);

--
-- Tablo için indeksler `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Tablo için AUTO_INCREMENT değeri `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21082441;

--
-- Tablo için AUTO_INCREMENT değeri `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `products__stocks`
--
ALTER TABLE `products__stocks`
  ADD CONSTRAINT `products__stocks_product_id_foreign` FOREIGN KEY (`product_Id`) REFERENCES `products` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
