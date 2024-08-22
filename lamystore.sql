-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost:3306
-- Thời gian đã tạo: Th8 22, 2024 lúc 03:10 PM
-- Phiên bản máy phục vụ: 8.0.30
-- Phiên bản PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `lamystore`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customers`
--

CREATE TABLE `customers` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `customers`
--

INSERT INTO `customers` (`id`, `name`, `phone`, `address`, `email`, `password`, `token`, `status`, `created_at`, `updated_at`) VALUES
(4, 'phan tran thu phuong', '0362372125', '38 dang vinh ham', 'phuong.ptt.62cntt@ntu.edu.vn', '$2y$10$23kntOoHFWFuCFRPD4vrme15xpSfLeOT701/ln.moS1D9rRmB2SZe', 'LXTSFXJSTT', 1, '2024-04-21 04:37:52', '2024-05-28 12:49:27'),
(5, 'Nguyễn Thành Đạt', '0905354944', '32/29 Phú Xương', 'dat.ntha.62cntt@ntu.edu.vn', '$2y$10$lxpeGE6QzJK0CI5tFj0akeAtlnGNq0tMN2.xXrLkyQrj/husqrnYa', NULL, 1, '2024-05-07 12:44:14', '2024-05-07 12:47:01'),
(6, 'Ngô Trung Kiên', '0905354944', '58 đường 2 tháng 4', 'kien.nt.62cntt@ntu.edu.vn', '$2y$10$1.0bOx294parGvq.7ef0aOGgV.8.EIF9UkbE11k9DTAv8sw.NWqGq', NULL, 1, '2024-05-18 00:44:06', '2024-05-18 00:45:29');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `menus`
--

CREATE TABLE `menus` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `menus`
--

INSERT INTO `menus` (`id`, `name`, `parent_id`, `url`, `active`, `created_at`, `updated_at`) VALUES
(1, 'Trang chủ', 0, '/', 1, '2024-04-05 10:05:17', '2024-04-05 10:05:17'),
(2, 'Sản phẩm', 0, 'product', 1, '2024-04-05 10:05:30', '2024-04-05 10:05:30'),
(3, 'Đơn hàng', 0, 'order', 1, '2024-04-05 10:06:34', '2024-04-05 10:06:34'),
(4, 'Giảm giá', 0, 'sale', 1, '2024-04-05 10:06:48', '2024-05-27 13:06:45');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(2, '2023_03_17_075119_create_users_table', 1),
(3, '2023_03_17_075221_create_trademarks_table', 1),
(4, '2023_03_17_075238_create_promotions_table', 1),
(5, '2023_03_17_075253_create_product_types_table', 1),
(6, '2023_03_17_075306_create_products_table', 1),
(7, '2023_03_17_130549_create_menus_table', 1),
(8, '2023_03_24_104100_create_sliders_table', 1),
(9, '2023_04_27_155112_create_customers_table', 1),
(10, '2023_04_29_113826_add_gmail_verification_token_to_customers', 1),
(11, '2023_05_04_102127_create_statuses_table', 1),
(12, '2023_05_06_160521_create_orders_table', 1),
(13, '2023_05_06_160535_create_orderdetails_table', 1),
(14, '2023_05_31_184824_create_sales_table', 1),
(15, '2023_05_31_185306_add_sale_to_orders', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orderdetails`
--

CREATE TABLE `orderdetails` (
  `id` bigint UNSIGNED NOT NULL,
  `order_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `quantity` int NOT NULL,
  `price` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `orderdetails`
--

INSERT INTO `orderdetails` (`id`, `order_id`, `product_id`, `quantity`, `price`, `created_at`, `updated_at`) VALUES
(1, 4, 25, 1, 153000, '2024-04-25 13:55:47', '2024-04-25 13:55:47'),
(2, 4, 24, 1, 135150, '2024-04-25 13:55:47', '2024-04-25 13:55:47'),
(3, 6, 20, 1, 135000, '2024-04-25 14:25:05', '2024-04-25 14:25:05'),
(4, 7, 26, 1, 152910, '2024-04-25 14:27:00', '2024-04-25 14:27:00'),
(5, 7, 12, 2, 71910, '2024-04-25 14:27:00', '2024-04-25 14:27:00'),
(6, 7, 9, 2, 71910, '2024-04-25 14:27:00', '2024-04-25 14:27:00'),
(7, 8, 13, 1, 360000, '2024-05-07 05:34:25', '2024-05-07 05:34:25'),
(8, 9, 30, 2, 71910, '2024-05-07 12:48:07', '2024-05-07 12:48:07'),
(9, 9, 14, 1, 225000, '2024-05-07 12:48:07', '2024-05-07 12:48:07'),
(10, 10, 24, 2, 135150, '2024-05-08 06:26:06', '2024-05-08 06:26:06'),
(11, 10, 17, 2, 179100, '2024-05-08 06:26:06', '2024-05-08 06:26:06'),
(12, 11, 26, 1, 152910, '2024-05-18 00:47:52', '2024-05-18 00:47:52'),
(13, 11, 5, 1, 152910, '2024-05-18 00:47:52', '2024-05-18 00:47:52'),
(14, 12, 25, 1, 153000, '2024-05-18 00:48:48', '2024-05-18 00:48:48'),
(15, 12, 22, 1, 112500, '2024-05-18 00:48:48', '2024-05-18 00:48:48'),
(16, 13, 61, 3, 94050, '2024-06-06 08:43:37', '2024-06-06 08:43:37'),
(17, 13, 63, 2, 719100, '2024-06-06 08:43:37', '2024-06-06 08:43:37'),
(18, 13, 60, 5, 270000, '2024-06-06 08:43:37', '2024-06-06 08:43:37'),
(19, 14, 58, 2, 225000, '2024-06-06 08:45:41', '2024-06-06 08:45:41'),
(20, 14, 56, 1, 218500, '2024-06-06 08:45:41', '2024-06-06 08:45:41'),
(21, 14, 54, 2, 152910, '2024-06-06 08:45:41', '2024-06-06 08:45:41'),
(22, 14, 46, 1, 190000, '2024-06-06 08:45:41', '2024-06-06 08:45:41'),
(23, 15, 25, 1, 153000, '2024-06-06 08:48:19', '2024-06-06 08:48:19'),
(24, 15, 21, 1, 108000, '2024-06-06 08:48:19', '2024-06-06 08:48:19'),
(25, 15, 23, 1, 107100, '2024-06-06 08:48:19', '2024-06-06 08:48:19'),
(26, 16, 42, 1, 189999, '2024-06-06 08:50:17', '2024-06-06 08:50:17'),
(27, 16, 41, 1, 341905, '2024-06-06 08:50:17', '2024-06-06 08:50:17'),
(28, 16, 39, 1, 270000, '2024-06-06 08:50:17', '2024-06-06 08:50:17'),
(29, 16, 14, 1, 225000, '2024-06-06 08:50:17', '2024-06-06 08:50:17'),
(30, 17, 49, 1, 114000, '2024-06-06 08:51:21', '2024-06-06 08:51:21'),
(31, 17, 50, 1, 172800, '2024-06-06 08:51:21', '2024-06-06 08:51:21'),
(32, 17, 47, 1, 172800, '2024-06-06 08:51:21', '2024-06-06 08:51:21'),
(33, 17, 37, 1, 85000, '2024-06-06 08:51:21', '2024-06-06 08:51:21'),
(34, 18, 69, 2, 285000, '2024-06-06 10:57:35', '2024-06-06 10:57:35'),
(35, 18, 65, 3, 270000, '2024-06-06 10:57:35', '2024-06-06 10:57:35'),
(36, 18, 64, 2, 198000, '2024-06-06 10:57:35', '2024-06-06 10:57:35'),
(37, 18, 67, 1, 323910, '2024-06-06 10:57:35', '2024-06-06 10:57:35'),
(38, 19, 7, 1, 233910, '2024-06-06 10:59:26', '2024-06-06 10:59:26'),
(39, 19, 1, 1, 172800, '2024-06-06 10:59:26', '2024-06-06 10:59:26'),
(40, 19, 58, 1, 225000, '2024-06-06 10:59:26', '2024-06-06 10:59:26'),
(41, 20, 5, 3, 152910, '2024-06-10 00:40:50', '2024-06-10 00:40:50'),
(42, 20, 8, 1, 68400, '2024-06-10 00:40:50', '2024-06-10 00:40:50');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` bigint UNSIGNED NOT NULL,
  `customer_id` bigint UNSIGNED NOT NULL,
  `status_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `sale_id` bigint UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `customer_id`, `status_id`, `user_id`, `created_at`, `updated_at`, `sale_id`) VALUES
(4, 4, 5, NULL, '2024-04-25 13:55:47', '2024-04-25 14:20:07', 1),
(6, 4, 4, NULL, '2024-04-25 14:25:05', '2024-06-06 08:52:46', 1),
(7, 4, 4, NULL, '2024-04-25 14:27:00', '2024-04-29 01:34:04', 1),
(8, 4, 4, NULL, '2024-05-07 05:34:25', '2024-05-07 05:36:02', 1),
(9, 5, 5, NULL, '2024-05-07 12:48:07', '2024-05-09 05:41:12', 3),
(10, 4, 4, NULL, '2024-05-08 06:26:06', '2024-06-06 08:53:07', 3),
(11, 6, 2, NULL, '2024-05-18 00:47:52', '2024-06-06 08:53:19', 4),
(12, 6, 1, NULL, '2024-05-18 00:48:48', '2024-05-18 00:48:48', 3),
(13, 4, 5, NULL, '2024-06-06 08:43:37', '2024-06-06 08:54:03', 3),
(14, 4, 4, NULL, '2024-06-06 08:45:40', '2024-06-06 08:53:48', 4),
(15, 4, 4, NULL, '2024-06-06 08:48:19', '2024-06-06 08:57:28', 2),
(16, 5, 2, NULL, '2024-06-06 08:50:17', '2024-06-06 08:53:39', 4),
(17, 5, 3, NULL, '2024-06-06 08:51:21', '2024-06-06 08:53:32', 4),
(18, 5, 1, NULL, '2024-06-06 10:57:35', '2024-06-06 10:57:35', 3),
(19, 5, 1, NULL, '2024-06-06 10:59:26', '2024-06-06 10:59:26', 5),
(20, 4, 1, NULL, '2024-06-10 00:40:49', '2024-06-10 00:40:49', 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `producttype_id` bigint UNSIGNED NOT NULL,
  `trademark_id` bigint UNSIGNED NOT NULL,
  `promotion_id` bigint UNSIGNED NOT NULL,
  `thumb` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int NOT NULL,
  `price` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `content`, `producttype_id`, `trademark_id`, `promotion_id`, `thumb`, `quantity`, `price`, `created_at`, `updated_at`) VALUES
(1, 'Áo hai dây Lovito đính nơ xếp nếp màu trơn thường ngày cho nữ', '- V1: dưới 86cm \r\n                        \r\n- V2: dưới 71cm \r\n                        \r\n1m50 – 1m55 từ 40 – 45kg vừa  \r\n                       \r\n1m55 – 1m6 từ 46 – 50kg vừa\r\n                         \r\nTrên 1m6 từ 51 – 53kg vừa', '<p>✅ĐIỂM NỔI BẬT</p>\r\n\r\n<p>-❤️Xếp nếp</p>\r\n\r\n<p>-❤️Phối nơ</p>\r\n\r\n<p>-❤️Kết cấu tinh tế</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>✅M&Ocirc; TẢ</p>\r\n\r\n<p>Hoa văn: M&agrave;u trơn</p>\r\n\r\n<p>Phong c&aacute;ch: Thường ng&agrave;y</p>\r\n\r\n<p>K&iacute;ch thước lớn: Kh&ocirc;ng</p>\r\n\r\n<p>Chất liệu: Polyester</p>\r\n\r\n<p>Th&agrave;nh phần: 100% Polyester</p>\r\n\r\n<p>Độ vừa vặn: D&aacute;ng rộng</p>\r\n\r\n<p>Vải xuy&ecirc;n thấu: Kh&ocirc;ng</p>\r\n\r\n<p>Độ co gi&atilde;n: Kh&ocirc;ng co gi&atilde;n</p>\r\n\r\n<p>Xuất xứ: Trung Quốc đại lục</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>✅G&Oacute;I H&Agrave;NG BAO GỒM</p>\r\n\r\n<p>1X&Aacute;o hai d&acirc;y</p>', 7, 3, 1, '/storage/uploads/2024/04/18/ao2day.jpg', 11, 192000, '2024-04-18 12:55:41', '2024-06-06 10:59:26'),
(2, 'Quần Ống Rộng PARACHUTE Cạp Chun Mát Lạnh Mùa Hè', '- Size: Freesize 51-54kg\r\n- Quần dài 98cm\r\n- Eo quần 70-76cm\r\n- v3 <94cm', '<p>Quần ống rộng nữ vải gi&oacute; loại đẹp form xinh</p>\r\n\r\n<p>Quần Ống Rộng Cạp Chun M&aacute;t Lạnh M&ugrave;a H&egrave;, Quần vải nữ phong c&aacute;ch thanh lịch c&oacute; thể mặc đi l&agrave;m đi chơi</p>\r\n\r\n<p>Sẵn be ghi hồng đen</p>', 1, 4, 1, '/storage/uploads/2024/04/18/ongrong.jpg', 50, 169900, '2024-04-18 13:00:38', '2024-04-21 03:34:18'),
(3, 'Quần ly sup phiên bản ống rộng Chất chéo thái ạ', '- Size: Freesize 51-54kg\r\n- Quần dài 98cm\r\n- Eo quần 70-76cm\r\n- v3 <94cm', '<p>Quần ly sup phi&ecirc;n bản ống rộng, năm nay trend ống rộng ch&aacute;y tr&ecirc;n mọi mặt trận mn ơi</p>\r\n\r\n<p>Chất ch&eacute;o th&aacute;i ạ</p>', 1, 1, 1, '/storage/uploads/2024/04/18/vn-11134207-7r98o-llspiebedqsfd6.jpg', 12, 192000, '2024-04-18 13:02:21', '2024-04-21 06:51:14'),
(4, 'Quần Tây Nữ (SIMPLE PANTS)', '', '<p>QUẦN ỐNG XU&Ocirc;NG KH&Oacute;A GIỮA D&Agrave;I 100CM mix với &aacute;o thun &ocirc;m body, &aacute;o thun hay một chiếc &aacute;o thun croptop, sơ mi cũng sẽ l&agrave; những &yacute; tưởng hay ho để n&agrave;ng mix match! - Chất tuyết mưa đứng d&aacute;ng d&agrave;y dặn - Chiều d&agrave;i 100cm C&oacute; m&agrave;u: Đen, T&iacute;m như ảnh Đủ 4 size: S M L XL cho chị em lựa ✔ Chất tuyết mưa đứng d&aacute;ng d&agrave;y dặn ✔ Chiều d&agrave;i 100cm ✔ C&oacute; 3 m&agrave;u: Đen, Trắng, Be như ảnh ✔ Đủ 4 size: S M L XL cho chị em lựa _ Quần d&agrave;i 100cm m&atilde; 09 S bụng 60~66 m&ocirc;ng 80~85 ống dưới gấu 44 d&agrave;i 100cm M bụng 66~70 m&ocirc;ng 85~90 ống 45 d&agrave;i 100cm L bụng 70~74m&ocirc;ng 90~95 ống 46 d&agrave;i 100cm XL bụng74~77m&ocirc;ng 95~100 ống 47 d&agrave;i 100cm XXL bụng 77 ~ 80 m&ocirc;ng 100~105 ống 48 d&agrave;i 100cm T&ugrave;y theo chiều cao của từng người. Nếu ph&acirc;n v&acirc;n bạn c&oacute; thể nhắn tin cho shop để shop tư vấn nha.</p>', 1, 1, 1, '/storage/uploads/2024/04/18/hình ảnh_2024-04-18_200345125.png', 12, 219900, '2024-04-18 13:04:20', '2024-04-18 13:04:20'),
(5, 'Quần ống đứng túi ngang chất ruby', '', '<p>Cập bến m&atilde; quần xu&ocirc;ng</p>\r\n\r\n<p>Quần ống đứng t&uacute;i ngang si&ecirc;u đẹp nha kh&aacute;ch</p>\r\n\r\n<p>Chất ch&eacute;o ruby h&agrave;ng cao cấp ạ</p>\r\n\r\n<p>Sẵn kho 4 m&agrave;u</p>\r\n\r\n<p>✅ S M L</p>', 1, 4, 1, '/storage/uploads/2024/04/18/sg-11134201-23020-lqrbyi7t19mv6a.jpg', 8, 169900, '2024-04-18 13:06:16', '2024-06-10 00:40:50'),
(6, 'Áo sát nách Lovito thêu họa tiết xếp nếp phối dây rút hoa nhí thường ngày cho nữ', '', '<p>✅ĐIỂM NỔI BẬT</p>\r\n\r\n<p>-❤️D&acirc;y r&uacute;t</p>\r\n\r\n<p>-❤️Xếp nếp</p>\r\n\r\n<p>-❤️Th&ecirc;u</p>\r\n\r\n<p>-❤️Kết cấu tốt</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>✅M&Ocirc; TẢ</p>\r\n\r\n<p>Hoa văn: Hoa nh&iacute;</p>\r\n\r\n<p>Phong c&aacute;ch: Thường ng&agrave;y</p>\r\n\r\n<p>K&iacute;ch thước lớn: Kh&ocirc;ng</p>\r\n\r\n<p>Chất liệu: Polyester</p>\r\n\r\n<p>Th&agrave;nh phần: 100% Polyester</p>\r\n\r\n<p>Độ vừa vặn: Vừa vặn th&ocirc;ng thường</p>\r\n\r\n<p>Vải xuy&ecirc;n thấu: Kh&ocirc;ng</p>\r\n\r\n<p>Độ co gi&atilde;n: Kh&ocirc;ng co gi&atilde;n</p>\r\n\r\n<p>Xuất xứ: Trung Quốc đại lục</p>', 7, 3, 1, '/storage/uploads/2024/04/18/aoday.jpg', 12, 200000, '2024-04-18 13:07:53', '2024-04-18 13:07:53'),
(7, 'Áo hai dây Lovito cột nơ lưng màu trơn thường ngày cho nữ', '- V1: dưới 86cm \r\n                        \r\n- V2: dưới 71cm \r\n                        \r\n1m50 – 1m55 từ 40 – 45kg vừa  \r\n                       \r\n1m55 – 1m6 từ 46 – 50kg vừa\r\n                         \r\nTrên 1m6 từ 51 – 53kg vừa', '<p>&nbsp;</p>\r\n\r\n<p>✅ĐIỂM NỔI BẬT -❤️D&acirc;y buộc sau lưng -❤️Mềm mại v&agrave; thoải m&aacute;i ✅M&Ocirc; TẢ Hoa văn: M&agrave;u trơn Phong c&aacute;ch: Ng&agrave;y thường K&iacute;ch thước lớn: Kh&ocirc;ng Chất liệu: Polyester Th&agrave;nh phần: 100% Polyester Độ vừa vặn: Vừa vặn th&ocirc;ng thường Vải xuy&ecirc;n thấu: Kh&ocirc;ng Độ co gi&atilde;n: Kh&ocirc;ng co gi&atilde;n Xuất xứ: Trung Quốc đại lục</p>', 7, 1, 1, '/storage/uploads/2024/04/18/nolung.jpg', 4, 259900, '2024-04-18 13:08:39', '2024-06-06 10:59:26'),
(8, 'Mũ lưỡi trai bóng chày Boston kiểu dáng thông thường dành cho nữ', '✅Điểm nổi bật\r\n\r\n-❤️Boston\r\n\r\n-❤️ Mũ bóng chày', '<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>✅M&ocirc; TẢ</p>\r\n\r\n<p>M&ocirc; h&igrave;nh: Thư</p>\r\n\r\n<p>Phong c&aacute;ch: giản dị</p>\r\n\r\n<p>Chất liệu: Kh&aacute;c</p>\r\n\r\n<p>Th&agrave;nh phần: 100% Kh&aacute;c</p>\r\n\r\n<p>Xuất xứ: Trung Quốc đại lục</p>', 3, 1, 1, '/storage/uploads/2024/04/18/sg-11134201-7rcf8-ltxpdeor4y7068.jpg', 49, 76000, '2024-04-18 13:11:24', '2024-06-10 00:40:50'),
(9, 'Mũ lưỡi trai Lovito thêu chữ cái cơ bản thường ngày cho nữ', '-❤️Cơ bản', '<p>Hoa văn: Chữ Phong c&aacute;ch: Ng&agrave;y thường Chất liệu: Polyester Th&agrave;nh phần: 100% Polyester Xuất xứ: Trung Quốc đại lục</p>', 3, 3, 1, '/storage/uploads/2024/04/18/sg-11134201-7rbly-lnh3sidfmngi0b.jpg', 28, 79900, '2024-04-18 13:13:09', '2024-04-25 14:27:00'),
(10, 'Mũ Lovito vành cong đỉnh vòm thêu họa tiết chữ chân mèo thể thao cho nữ', '-❤️Hoa văn\r\n-❤️Thêu\r\n-❤️Kiểu vòm\r\n-❤️Vành cong\r\n-❤️Móng vuốt mèo', '<p>Hoa văn: Chữ Phong c&aacute;ch: Thể thao Chất liệu: Kh&aacute;c Xuất xứ: Trung Quốc đại lục</p>', 3, 3, 1, '/storage/uploads/2024/04/18/sg-11134201-7rbll-louhyuc5ks3q31.jpg', 40, 80000, '2024-04-18 13:14:22', '2024-04-18 13:14:22'),
(11, 'Mũ Lovito đắp vải màu trơn thường ngày cho nữ', 'ĐIỂM NỔI BẬT\r\n-❤️Chắp vá', '<p>Hoa văn: M&agrave;u trơn Phong c&aacute;ch: Ng&agrave;y thường Chất liệu: Polyester Th&agrave;nh phần: 100% Polyester Xuất xứ: Trung Quốc đại lục</p>', 3, 3, 1, '/storage/uploads/2024/04/18/sg-11134201-7rbkp-loowo2c1q37rb4.jpg', 50, 80000, '2024-04-18 13:17:30', '2024-04-18 13:17:30'),
(12, 'Mũ Lovito đơn giản kỹ thuật số đắp vải họa tiết chữ thường ngày cho nữ', '-❤️Hoa văn\r\n-❤️Tròn\r\n-❤️Chắp vá\r\n-❤️Kỹ thuật số\r\n-❤️Đơn giản', '<p>Hoa văn: Chữ Phong c&aacute;ch: Ng&agrave;y thường Chất liệu: Kh&aacute;c Th&agrave;nh phần: 100%Kh&aacute;c Xuất xứ: Trung Quốc đại lục</p>', 3, 3, 1, '/storage/uploads/2024/04/18/sg-11134201-7rbmq-lp7fw3bh9ybyf2.jpg', 10, 79900, '2024-04-18 13:19:15', '2024-04-25 14:27:00'),
(13, 'Set áo 2 dây cánh tiên phối chân váy xếp tầng TABISHOP', 'Kích thước:', '<p>Chất liệu: đũi sọc</p>', 12, 1, 1, '/storage/uploads/2024/04/19/setbo2.jpg', 4, 400000, '2024-04-19 01:49:37', '2024-05-07 05:34:25'),
(14, 'Đầm ống - Đầm cup ngực dáng xoè hoạ tiết hoa mùa xuân tươi tắn', 'dài 66cm nguc 90 eo 72', '<p>Một chiếc đầm hoa v&ocirc; c&ugrave;ng xinh xắn vừa cập bến nh&agrave; Choco, hoạ tiết hoa tươi mới.</p>\r\n\r\n<p>&mdash; Đầm c&oacute; nh&uacute;n smocking ph&iacute;a sau n&ecirc;n độ co gi&atilde;n rất tốt</p>', 6, 2, 1, '/storage/uploads/2024/04/19/dam1.jpg', 19, 250000, '2024-04-19 01:51:03', '2024-06-06 08:50:17'),
(15, 'Áo somi tay dài nữ bảng màu pastel mới ngọt ngào xinh đẹp', '- V1: dưới 86cm \r\n                        \r\n- V2: dưới 71cm \r\n                        \r\n1m50 – 1m55 từ 40 – 45kg vừa  \r\n                       \r\n1m55 – 1m6 từ 46 – 50kg vừa\r\n                         \r\nTrên 1m6 từ 51 – 53kg vừa', '<p>&Aacute;o sơ mi th&ocirc; tay d&agrave;i.</p>\r\n\r\n<p>Chất th&ocirc; mềm.</p>\r\n\r\n<p>Freesize form rộng đu&ocirc;i t&ocirc;m.</p>', 7, 2, 1, '/storage/uploads/2024/04/19/somi.jpg', 7, 219900, '2024-04-19 01:52:40', '2024-04-21 03:28:20'),
(16, 'Quần short jeans mềm nữ to gấu lưng cao basic', 'eo 70 - chiều dài 34 - rộng ống 30 - ngang 43', '<p>Chất jeans mềm basic.</p>\r\n\r\n<p>Lưng cao cạp chuẩn fullsize SML.</p>', 4, 2, 1, '/storage/uploads/2024/04/19/qs2.jpg', 15, 150000, '2024-04-19 01:55:03', '2024-05-24 13:14:05'),
(17, 'Chân váy kaki 1 lớp retro xếp ly form dài', 'Dài váy 88cm\r\n\r\nEo chun co dãn 56-78cm.\r\n\r\nHông dưới 120cm.', '<p>Ch&acirc;n v&aacute;y kaki 1 lớp retro form d&agrave;i 88cm.</p>\r\n\r\n<p>Chất kaki 2 da.</p>\r\n\r\n<p>Freesize co d&atilde;n dưới 60kg.</p>', 2, 2, 1, '/storage/uploads/2024/04/19/cv12.jpg', 18, 199000, '2024-04-19 01:57:22', '2024-05-08 06:26:06'),
(18, 'Chân váy ren tầng dáng ngắn ulzzang 2 lớp', 'Eo 58-80cm.\r\n\r\nDài váy 39cm\r\n\r\nĐáy lót.', '<p>Ch&acirc;n v&aacute;y ren tầng d&aacute;ng ngắn Ulzzang.</p>\r\n\r\n<p>Lưng chun co d&atilde;n 58-80cm.</p>\r\n\r\n<p>Chất len QC chuẩn c&oacute; l&oacute;t quần trong.</p>', 2, 2, 1, '/storage/uploads/2024/04/19/cv3.jpg', 40, 100000, '2024-04-19 01:59:04', '2024-04-19 01:59:04'),
(20, 'Chân váy chữ A basic kèm belt.', 'Chất kate 2 biên siêu mượt.\r\n\r\nChân váy có lót quần trong.\r\n\r\nKèm nịt.', '<p>Chất kate 2 bi&ecirc;n si&ecirc;u mượt.</p>\r\n\r\n<p>Ch&acirc;n v&aacute;y c&oacute; l&oacute;t quần trong.</p>\r\n\r\n<p>K&egrave;m nịt.</p>', 2, 2, 1, '/storage/uploads/2024/04/19/cv4.jpg', 20, 150000, '2024-04-19 02:18:30', '2024-04-25 14:25:05'),
(21, 'Áo thun thêu N.Y// cổ bo viền fulltag', 'Chiều dài: 67cm\r\n\r\nNgang áo: 57cm\r\n\r\nỐng tay: 19cm\r\n\r\nVai áo: 52cm', '<p>&Aacute;o thun th&ecirc;u chữ N.Y// bo cổ fulltag.</p>\r\n\r\n<p>Freesize form rộng dưới 70kg.</p>\r\n\r\n<p>Chất thun cotton 2 chiều co d&atilde;n.</p>', 9, 1, 1, '/storage/uploads/2024/04/19/5.jpg', 24, 120000, '2024-04-19 02:20:09', '2024-06-06 08:48:19'),
(22, 'Áo thun A/DI/DAS đỏ form rộng thêu logo', 'Dài áo: 68cm\r\n\r\nVai áo: 39cm\r\n\r\nNgang thân: 53cm\r\n\r\nDài tay: 20cm', '<p>&Aacute;o thun ADIDAS đỏ th&ecirc;u logo.</p>\r\n\r\n<p>Freesize form rộng.</p>\r\n\r\n<p>Chất thun cotton.</p>\r\n\r\n<p>Freesize dưới 70kg.</p>', 9, 1, 1, '/storage/uploads/2024/04/19/at6.jpg', 39, 125000, '2024-04-19 02:21:28', '2024-05-18 00:48:48'),
(23, 'Áo thun form rộng in chữ LA VIE EN ROS', 'Dài áo\r\n\r\nVai áo\r\n\r\nNgang thân', '<p>&Aacute;o thun cotton form rộng in chữ LA VIE EN ROSE.</p>\r\n\r\n<p>Freesize dưới 60kg.</p>\r\n\r\n<p>Chất cotton lạnh si&ecirc;u th&iacute;ch.</p>', 9, 1, 1, '/storage/uploads/2024/04/19/at5.jpg', 19, 119000, '2024-04-19 02:23:27', '2024-06-06 08:48:19'),
(24, 'Áo babytee cotton in chữ NEVERFORGET', '- V1: dưới 86cm \r\n                        \r\n- V2: dưới 71cm \r\n                        \r\n1m50 – 1m55 từ 40 – 45kg vừa  \r\n                       \r\n1m55 – 1m6 từ 46 – 50kg vừa\r\n                         \r\nTrên 1m6 từ 51 – 53kg vừa', '<p>&Aacute;o thun &ocirc;m body nữ d&aacute;ng baby tee tay ngắn cổ tr&ograve;n m&agrave;u đen trắng &nbsp; được may với chất vải thun borip , t&ocirc;n d&aacute;ng, kh&ocirc;ng như c&aacute;c loại vải nho&atilde;i x&ugrave; tr&ecirc;n thị trường nh&eacute;.&nbsp;<br />\r\n- &Aacute;o &nbsp;phom thường , d&agrave;i 57cm, rộng 42cm.H&igrave;nh in pet Kĩ thuật số sắc n&eacute;t.</p>\r\n\r\n<p><br />\r\n- Mẫu &Aacute;o thun &ocirc;m body nữ d&aacute;ng baby tee tay ngắn cổ tr&ograve;n m&agrave;u đen trắng gợi cảm đầy nữ t&iacute;nh, đầy dễ thương, mặc dự tiệc, dạ hội, đi chơi... ,mang phong c&aacute;ch thời trang h&agrave;n quốc.</p>\r\n\r\n<p><br />\r\n- M&agrave;u sắc trắng, đen, đỏ, nude,v&agrave;ng,xanh ... l&agrave; những gam m&agrave;u nổi bật dễ mặc rất t&ocirc;n d&aacute;ng.</p>\r\n\r\n<p><br />\r\n- &Aacute;o thun &ocirc;m body nữ d&aacute;ng baby tee tay ngắn cổ tr&ograve;n m&agrave;u đen trắng được thiết kế cho c&aacute;c chị c&oacute; c&acirc;n nặng tầm 38kg --&gt; 53kg cao 1m65 trở xuống.<br />\r\n&nbsp;</p>', 9, 2, 2, '/storage/uploads/2024/04/19/at7.jpg', 9, 159000, '2024-04-19 02:27:22', '2024-05-08 06:26:06'),
(25, 'Áo thun babytee in tim kèm khăn', '- V1: dưới 86cm \r\n                        \r\n- V2: dưới 71cm \r\n                        \r\n1m50 – 1m55 từ 40 – 45kg vừa  \r\n                       \r\n1m55 – 1m6 từ 46 – 50kg vừa\r\n                         \r\nTrên 1m6 từ 51 – 53kg vừa', '<p>TẶNG K&Egrave;M KHĂN) &Aacute;o thun babytee in tim đỏ.</p>\r\n\r\n<p>Freesize dưới 56kg.</p>\r\n\r\n<p>Chất cotton co d&atilde;n nhẹ.</p>', 9, 1, 2, '/storage/uploads/2024/04/19/at8.jpg', 19, 180000, '2024-04-19 02:28:38', '2024-06-06 08:48:19'),
(26, 'Set áo yếm denim xanh kèm áo thun trắng basic', 'Set áo yếm\r\n\r\n-Áo yếm: \r\n\r\n+Dài: 37\r\n\r\n+Ngang: 61\r\n\r\n-Áo trắng:\r\n\r\n+Dài: 55\r\n\r\n+Ngang: 34\r\n\r\n+Ống tay: 20\r\n\r\n+Dài tay: 16', '<p>Set yếm denim basic k&egrave;m &aacute;o thun trắng.</p>\r\n\r\n<p>Chất denim vừa phải - &aacute;o thun trắng chất zip cotton.</p>\r\n\r\n<p>.</p>', 7, 1, 1, '/storage/uploads/2024/04/19/k1.jpg', 7, 169900, '2024-04-19 02:29:57', '2024-05-24 13:13:33'),
(27, 'Áo ống cúp ngực, áo quây xếp ly nữ áo ống body có mút sang chảnh G274', '- V1: dưới 86cm \r\n                        \r\n- V2: dưới 71cm \r\n                        \r\n1m50 – 1m55 từ 40 – 45kg vừa  \r\n                       \r\n1m55 – 1m6 từ 46 – 50kg vừa\r\n                         \r\nTrên 1m6 từ 51 – 53kg vừa', '<p>&Aacute;o ống c&uacute;p ngực, &aacute;o qu&acirc;y xếp ly c&oacute; m&uacute;t được may &aacute;o trắng đen vải voan, &aacute;o xanh vải jean lụa, , t&ocirc;n d&aacute;ng, kh&ocirc;ng như c&aacute;c loại vải nho&atilde;i x&ugrave; tr&ecirc;n thị trường nh&eacute;.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>D&agrave;i th&acirc;n &aacute;o:30cm, phần t&ugrave;ng dưới :18cm, tổng d&agrave;i 48cm , c&uacute;p ngực c&oacute; m&uacute;t &ocirc;m body, ph&iacute;a sau lưng chạy mocking nh&uacute;n chống tụt.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Mẫu &Aacute;o ống c&uacute;p ngực, &aacute;o qu&acirc;y xếp ly c&oacute; m&uacute;t gợi cảm đầy nữ t&iacute;nh, đầy dễ thương, mặc dự tiệc, dạ hội, đi chơi... ,mang phong c&aacute;ch thời trang h&agrave;n quốc.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>M&agrave;u sắc trắng, đen, ... l&agrave; những gam m&agrave;u nổi bật dễ mặc rất t&ocirc;n d&aacute;ng.</p>', 7, 1, 2, '/storage/uploads/2024/04/21/ao102.jpg', 11, 192000, '2024-04-21 03:11:33', '2024-04-21 03:27:31'),
(28, 'Váy Chữ A Nữ Thiết Kế Cổ Bẻ Dáng Dài', 'Eo 70, dài 106, mông 94, cân nặng gợi ý 48kg - 53kg', '<p>- T&ecirc;n sản phẩm:&nbsp;V&aacute;y Chữ A Nữ Thiết Kế Cổ Bẻ D&aacute;ng D&agrave;i</p>\r\n\r\n<p>- Độ tuổi: &gt; 14&nbsp;tuổi</p>\r\n\r\n<p>- Ph&ugrave; hợp: Mặc&nbsp;đi l&agrave;m, đi chơi, đi tiệc.</p>\r\n\r\n<p>- Chất liệu: Vải cotton lạnh</p>\r\n\r\n<p>- M&agrave;u sắc: Đen/ Trắng/ Đỏ</p>\r\n\r\n<p>- Họa tiết: Trơn</p>\r\n\r\n<p>- Xuất xứ: Tự thiết kế v&agrave; sản xuất bởi FM Style tại Việt Nam&nbsp;</p>\r\n\r\n<p>- Cam kết 100% chất lượng từ chất vải đến đường chỉ, ph&aacute;t hiện lỗi được ho&agrave;n trả miễn ph&iacute;.</p>', 6, 2, 1, '/storage/uploads/2024/04/21/dam2.jpg', 12, 219900, '2024-04-21 06:41:26', '2024-04-21 06:41:26'),
(29, 'Váy Babydoll Nữ Váy Tay Bồng Thắt Eo Dáng Babydoll', '48kg - 57kg\r\nSize Số +/- 1 kg', '<p>- T&ecirc;n sản phẩm:&nbsp;V&aacute;y Tay Bồng Thắt Eo D&aacute;ng Babydoll</p>\r\n\r\n<p>- Độ tuổi: &gt; 15&nbsp;tuổi</p>\r\n\r\n<p>- Ph&ugrave; hợp: Mặc đi học, đi l&agrave;m, đi chơi, đi tiệc.</p>\r\n\r\n<p>- Chất liệu: Vải xốp nhắn</p>\r\n\r\n<p>- M&agrave;u sắc:&nbsp;Trắng/ Đen</p>\r\n\r\n<p>- Họa tiết: Trơn</p>\r\n\r\n<p>- Xuất xứ: Tự thiết kế v&agrave; sản xuất bởi FM Style tại Việt Nam&nbsp;</p>\r\n\r\n<p>- Cam kết 100% chất lượng từ chất vải đến đường chỉ, ph&aacute;t hiện lỗi được ho&agrave;n trả miễn ph&iacute;.</p>', 6, 2, 1, '/storage/uploads/2024/04/21/dam3.jpg', 20, 250000, '2024-04-21 06:43:17', '2024-04-21 06:43:17'),
(30, 'Áo babytee trơn chất cotton lạnh cao cấp - 247store.vn', '- V1: dưới 86cm \r\n                        \r\n- V2: dưới 71cm \r\n                        \r\n1m50 – 1m55 từ 40 – 45kg vừa  \r\n                       \r\n1m55 – 1m6 từ 46 – 50kg vừa\r\n                         \r\nTrên 1m6 từ 51 – 53kg vừa', '<p>&Aacute;o babytee trơn, chất cotton lạnh k&egrave;m bo form to chất cao cấp</p>\r\n\r\n<p>Gi&aacute; b&aacute;n lẻ 3xx đ&oacute; ạ</p>\r\n\r\n<p>Form to</p>', 9, 4, 1, '/storage/uploads/2024/04/21/at9.jpg', 80, 79900, '2024-04-21 06:46:01', '2024-05-09 05:41:07'),
(31, 'Áo khoác dài tay có nút trơn thông thường cho nữ', 'Chiều cao 160 - 167cm, nặng <65kg', '<p>M&ocirc; h&igrave;nh: trơn Phong c&aacute;ch: Giản dị Cộng với k&iacute;ch thước: Kh&ocirc;ng Chất liệu: polyeste Th&agrave;nh phần: 100% Polyester Loại ph&ugrave; hợp: Ph&ugrave; hợp thường xuy&ecirc;n Trong suốt: Kh&ocirc;ng K&eacute;o d&agrave;i: Kh&ocirc;ng căng Xuất xứ: Trung Quốc đại lục</p>', 7, 3, 1, '/storage/uploads/2024/04/21/ak1.jpg', 12, 359900, '2024-04-21 06:48:22', '2024-05-24 13:15:07'),
(32, 'Quần Sooc Kaki Co Giãn Sắn Gấu', 'Chất liệu : umi cao cấp dày dặn,dẻo,co giãn 4 chiều', 'quần sooc kaki siu Hottt nha em đã về nha ce ơii. \r\n\r\nE Vê tạm trước dc hon 100c. khách nha em trộm vía toàn mua combo 2 màu thay đổi. Đen đẹpp lắm luôn mà dễ măc vô cùng. Quần dáng dành cho ce nào k mặc dc dang cộc thì quất ngay e này cho emmmmm', 4, 2, 2, '/storage/uploads/2024/05/24/vn-11134207-7qukw-lilwnxkt4eto10.jpg', 30, 120000, '2024-05-24 12:38:41', '2024-05-24 12:38:41'),
(33, 'Chân váy jean xếp li có lót trong - 247store.vn', 'Chiều cao: 1m49 - 1m55\r\nCân nặng: 43kg - 50kg', 'Chân váy xếp li có lót trong lun nhaa\r\n\r\nQuần nhiều rồi thì mình thêm chân váy bán cho đắt hàng nha các bác', 2, 4, 1, '/storage/uploads/2024/05/24/vn-11134207-7qukw-lk0crz1z0l4yf5.jpg', 20, 169900, '2024-05-24 12:41:13', '2024-05-24 12:41:13'),
(34, 'Quần short phối sọc 3 line unisex 93 HEY quần short dáng rộng thể thao cho nam nữ hottrend', 'Chiều cao: 1m49 - 1m55\r\nCân nặng: 43kg - 50kg', 'Thông tin chi tiết sản phẩm\r\n- Tên sản phẩm: Quần short phối sọc 3 line unisex 93 HEY quần short dáng rộng thể thao cho nam nữ hottrend 2022\r\n- Thành phần: Chất vải đẹp, không quá dày tạo độ rũ cho vải..\r\n- Thông số kỹ thuật: form rộng. mặc thoải mái\r\n- Xuất xứ: Quảng Châu', 4, 2, 1, '/storage/uploads/2024/05/24/2fe4c0e1dda16735363c875c8754b8c1.jpg', 12, 90000, '2024-05-24 12:43:13', '2024-05-24 12:43:13'),
(35, 'Quần Sooc Nữ Quần Shot Nữ KaKi Lưng Cao Túi Mổ Ulzzang Phong Cách Hàn Quốc', 'eo 64-68cm, mông 90-95cm, đùi 65cm, dài 41cm', 'Quần Sooc Nữ, Quần Short Nữ KaKi Lưng Cao Túi Mổ Ulzzang Phong Cách Hàn Quốc Siêu Đẹp\r\n\r\nQuần Short Nữ KaKi được thiết kế thân trước cúc cài kéo khóa, túi mổ phía trước tạo điểm nhấn độcc và lạ mắt\r\n\r\nChất vải kaki thô mềm mại, co giãn mặc vô cùng thoải mái\r\n\r\nQuần Short Nữ KaKi Mix cùng với áo sơ mi, phông, 2 dây, crotop.... đều xinh ạ\r\n\r\nCác quý cô dạo phố, shopping, cafe, đi làm công sở đều xinh hết nấc nha\r\n\r\nThật sự chị em nào bỏ qua chiếc Quần Short KaKi này là tiếc lắm luôn ấy\r\n\r\nThanh xuân ngắn lắm các nàng ạ, không mua lúc này chẳng còn lúc nào mua được nữa đâu các nàng nha', 4, 1, 1, '/storage/uploads/2024/05/24/63297133e4ce505bc6b09cb7fb30cc60.jpg', 20, 120000, '2024-05-24 12:46:36', '2024-05-24 12:46:36'),
(36, 'Quần short nữ ống loe quần đùi nữ ống rộng thời trang chất tuyết mưa', '(47- 49 kg): Eo 69, Mông 92', 'Quần short nữ ống loe quần đùi nữ ống rộng thời trang chất tuyết mưa mềm mịn 909\r\n\r\n\r\n\r\n Tên sản phẩm :Quần short nữ ống loe quần đùi nữ ống rộng thời trang chất tuyết mưa mềm mịn MA_854\r\n\r\n Sản Xuất : Sản xuất trực tiếp tại xưởng - hàng Việt Nam\r\n\r\nĐịa chỉ xưởng chịu trách nhiệm sản phẩm : Xưởng may Bình đà - số 76 xóm dộc - bình minh - thanh oai - HN', 4, 2, 1, '/storage/uploads/2024/05/24/95debd3b964c4fdea35b75f6865f412a.jpg', 20, 169900, '2024-05-24 12:51:21', '2024-05-24 12:51:21'),
(37, 'Quần Short Nhung Gập Gấu ống Rộng Chất Nhung Tăm Siêu Hot', 'cạp 69cm dưới 52kg, 39 cm, ống loe 32,5, đáy  dài 31,5', 'QUẦN NHUNG TĂM chất mềm.mịn rất thích hợp cho nàng teen xinh đẹp \r\nChất tăm vải vừa gân nhỏ hàng 1 lớp ko có đai lưng\r\nBạn có thể mặc đi chơi dạo phố. Kết hợp giày thể thao hay bốt vừa điệu đà vừa sang chảnh', 4, 1, 2, '/storage/uploads/2024/05/24/sg-11134201-22100-s3q7v4g6zuiv8a.jpg', 49, 100000, '2024-05-24 12:58:25', '2024-06-06 08:51:21'),
(38, 'Váy Bò DEMIN Nhúm Ngực Dáng Ngắn Kèm Dây Hoa Sang Chảnh', 'Ngực 87-92\r\n eo 69-75 \r\nmông 90-93 \r\nChiều Dài 91', 'MIVÁY BÒ DENIM NHÚM NGỰC KÈM HOA \r\n\r\nDiện em đầm xinh hết nấc vào những ngày đẹp trời vừa up mood tự tin cho bản thân, vừa gây đốn tim cho người qua đường 💘\r\n\r\nVáy bò kèm nơ cổ chooker hoa . Siêu đẹp có lót đùi nha không lo hở', 6, 5, 3, '/storage/uploads/2024/05/24/vn-11134207-7r98o-lrwy63e0hcckb4.jpg', 20, 169900, '2024-05-24 13:55:24', '2024-05-24 13:55:24'),
(39, 'Váy Jumpsuit Tuyết Mưa Đen Cúp Ngực Chân Váy Xòe Đơn Giản Sang Chảnh', 'Ngực 87-92 \r\neo 69-75 \r\nmông 90-93 \r\nChiều Dài 91', 'Đơn giản bao sang luôn mấy bà ưiiii \r\n\r\nJUMP ĐEN CÚP KÈM TAG NƠ ĐÁ \r\n\r\nChất tuyết mưa xịn lắm nè ,  tag nơ đá rời nhé', 6, 1, 1, '/storage/uploads/2024/05/24/vn-11134207-7r98o-lu23qhxgk0f33c.jpg', 9, 300000, '2024-05-24 13:57:18', '2024-06-06 08:50:17'),
(40, 'Váy Xòe Mini Cổ Nhọn Phối Trắng Nơ Ngực Đáng Yêu Có Lót Đùi Bảo Hộ', 'Ngực 87-92 \r\neo 69-75 \r\nmông 90-93 \r\nChiều Dài 91', 'VÁY XOÈ CỔ NHỌN NƠ NGỰC KÈM TAG ĐÁ CÓ QUẦN ĐÙI TRONG !!\r\n\r\n\r\n\r\nChất vải chéo thái QC L1 mềm mại mặc cực thích ah ,trong tk có thêm lớp quần đùi liền mặc ko lo lộ ah', 6, 5, 3, '/storage/uploads/2024/05/24/vn-11134207-7r98o-lv62b9jhdti279.jpg', 18, 219900, '2024-05-24 13:58:31', '2024-05-24 14:40:44'),
(41, 'Váy Tacta Cổ Yếm Dáng Xòe Mini Phối Nơ Vai Siu To Tạo Điểm Nhấn', 'Ngực 87-92 \r\neo 69-75 \r\nmông 90-93 \r\nChiều Dài 91', 'VÁY XOÈ CỔ NHỌN NƠ NGỰC KÈM TAG ĐÁ CÓ QUẦN ĐÙI TRONG !!\r\n\r\n\r\n\r\nChất vải chéo thái QC L1 mềm mại mặc cực thích ah ,trong tk có thêm lớp quần đùi liền mặc ko lo lộ ah', 6, 5, 3, '/storage/uploads/2024/05/24/vn-11134207-7r98o-lu23qhxgr19b5f.jpg', 11, 359900, '2024-05-24 14:06:43', '2024-06-06 08:50:17'),
(42, 'Váy Bò 2 Dây Trơn Phối Ren Ngực Đơn Giản Chun Lưng Có Lót Đùi, Dây Tăng Giảm Cẩn Thận', 'Ngực 87-92 \r\neo 69-75 \r\nmông 90-93 \r\nChiều Dài 91', 'Váy bò 2 dây phối ren ngực cực xinh \r\n\r\nVáy ren bò dây quai điều chỉnh. Có lót đùi nha. Chun lưng ôm người . \r\n\r\n-----------------------------------\r\n\r\nChất liệu: Denim\r\n\r\nMàu: Xanh', 6, 5, 3, '/storage/uploads/2024/05/24/vn-11134207-7r98o-lvlii8jw57h866.jpg', 1, 199999, '2024-05-24 14:08:32', '2024-06-06 08:50:17'),
(43, 'Set Áo Đen Tuyết Mưa Đính Nơ Phối Cổ Sen Cute Mix Quần Short Tacta Lụa Màu Be Dịu Mắt', 'Ngực 87-92 \r\neo 69-75 \r\nmông 90-93 \r\nChiều Dài 91', 'Xinh quá ạ ,e vìa sẵnn hàng nha \r\n\r\n Set bộ nơ mix quần tacta lụa siu hot e về sẵn hàng \r\n\r\n  Áo chất tuyết mưa , quần chất tacta lụa , lên fom chuẩn mẫu \r\n\r\n  Đơn giản mà bao xinh lun nha \r\n\r\n--------------------------------\r\n\r\nChất liệu: Tuyết Mưa\r\n\r\nMàu: Đen', 12, 5, 1, '/storage/uploads/2024/05/24/vn-11134207-7r98o-lvg2045l8wwd82.jpg', 5, 219900, '2024-05-24 14:11:30', '2024-05-24 14:11:30'),
(44, 'Set Áo Cổ Yếm 3 Màu Kẻ Sọc Thô Đũi Mềm Mát Mix Quần Kaki Mặc Siêu Nhẹ, Siêu Thoải Mái', 'Ngực 87-92 \r\neo 69-75 \r\nmông 90-93 \r\nChiều Dài 91', 'Thề lun cái set này trông rất la bth cho đến khi mặc lên thì thấy nhức cái néc lunnn a\r\n\r\nSet áo kẻ thô đũi mềm mát mix quần kaki mặc nhẹ như ko mặc lunn. \r\n\r\n---------------------------------\r\n\r\nChất liệu: Kaki, Thô Đũi', 12, 5, 3, '/storage/uploads/2024/05/24/vn-11134207-7r98o-lvba2eshl2ml66.jpg', 11, 198000, '2024-05-24 14:12:58', '2024-05-24 14:12:58'),
(45, 'Set Chân Váy Bút Chì Đen +Áo Demin Cúp Ngực', 'Ngực 87-92 \r\neo 69-75 \r\nmông 90-93 \r\nChiều Dài 91', 'Hàng cây nói với lề đường \r\n\r\nMỗi khi đổ lá là thường nhớ anh ❤️❤️\r\n\r\nSET CHÂN VÁY BÚT CHÌ ĐEN + ÁO DEMIN CÚP NGỰC\r\n\r\nMột chiếc set gây thương nhớ cho mấy bà đây 🙏🏾👣\r\n\r\nĐi biển siu đẹp nha, bo chung dễ mang k tuột đâu nè. Cv dày dặn', 12, 5, 1, '/storage/uploads/2024/05/24/vn-11134207-7qukw-lj5egv2131le92.jpg', 20, 199000, '2024-05-24 14:15:00', '2024-05-24 14:15:00'),
(46, 'Set Áo Quây Bò Dập Ly Ngang Phối Lưng Chun Cẩn Thận Mix Chân Váy Xòe Xếp Ly Có Quần Bảo Hộ', 'Ngực 87-92 \r\neo 69-75 \r\nmông 90-93 \r\nChiều Dài 91', 'SET ÁO QUÂY MIX CV XẾP LY\r\n\r\nSet bò quây cv xếp ly. Đẹp xỉu lun . Bò áo xếp ly cẩn thận, chun lưng sau. Chân váy xoè A nha\r\n\r\n------------------------------\r\n\r\nChất liệu: Denim\r\n\r\nMàu: Xanh, Đen, Nâu', 12, 5, 3, '/storage/uploads/2024/05/24/vn-11134207-7r98o-lubw3zttsg0h6d.jpg', 9, 200000, '2024-05-24 14:17:10', '2024-06-06 08:45:41'),
(47, 'Chân Váy Ngắn Đính Nơ Coquette Đẹp, Chân Váy Xếp Ly Xòe Hàn Quốc Chất Cao Cấp Có Quần Trong', 'THÔNG TIN SẢN PHẨM:\r\n        • Chất vải: Tuysi\r\n        • Màu sắc: Đen, xám\r\n        • Form: Xòe	\r\n        • Họa tiết: Trơn xếp li\r\n        • Phong cách: Trẻ trung\r\n        • Xuất xứ: Việt Nam', 'Ngực 87-92 \r\neo 69-75 \r\nmông 90-93 \r\nChiều Dài 91', 2, 5, 1, '/storage/uploads/2024/05/24/vn-11134207-7r98o-ltnnl7jjtrt66a.jpg', 8, 192000, '2024-05-24 14:32:23', '2024-06-06 08:51:21'),
(48, 'Chân Váy KAKI Phối TÚI HỘP Cao Cấp Dáng Ngắn Lưng  KAKI Chân Váy Tenis Chữ A Công Sở', 'Ngực 87-92 \r\neo 69-75 \r\nmông 90-93 \r\nChiều Dài 91', 'Chân Váy KAKI Phối TÚI HỘP Cao Cấp Dáng Ngắn Lưng Cao Chất KAKI Chân Váy Tenis Chữ A Công Sở Đen Be Rêu 88-HQ(BIG SIZE)', 2, 5, 1, '/storage/uploads/2024/05/24/vn-11134207-7r98o-llhjvkbhk1x209.jpg', 6, 79900, '2024-05-24 14:33:55', '2024-05-24 14:37:04'),
(49, 'Chân Váy Dài Xòe Ghép Vải Phong Cách Mới Váy Hồng Nữ Eo Cao Chữ', 'Ngực 87-92 \r\neo 69-75 \r\nmông 90-93 \r\nChiều Dài 91', 'Mô hình: Màu rắn\r\n\r\nQuy trình xử lý: Nếp nhăn\r\n\r\nTên vải: Sợi Polyester\r\n\r\nThành phần vải chính: sợi polyeste\r\n\r\nThành phần vải chính 2: Bông\r\n\r\nThương hiệu: Hanzhen\r\n\r\nLoại váy: Váy bánh\r\n\r\nChiều dài váy: Váy Midi\r\n\r\nCác yếu tố phổ biến: Eo đàn hồi', 2, 5, 3, '/storage/uploads/2024/05/24/sg-11134201-7rcc5-ltg5ezc8x5n077.jpg', 18, 120000, '2024-05-24 14:35:44', '2024-06-06 08:51:21'),
(50, 'Quần jean nữ ống suông form rộng màu xanh đậm phong cách Hàn Quốc', 'Eo 68cm, \r\nMông 96cm, \r\nDài 103cm, \r\nỐng 50cm', 'Quần jean suông Saly ống đứng dài 100cm trẻ trung đi học đi làm\r\nChất liệu: denim\r\nMàu sắc: Xanh\r\nMix: Cardigan kèm quây, thun dài, croptop, blazer&quây', 1, 1, 1, '/storage/uploads/2024/05/24/vn-11134207-7qukw-lkezrizrf2jg82.jpg', 7, 192000, '2024-05-24 14:43:39', '2024-06-06 08:51:21'),
(51, 'Quần Parachute Harem Dáng Thụng Vintage, Quần Dài Dễ Vận Động Nhật Bản', 'Eo 68cm, \r\nMông 96cm, \r\nDài 103cm, \r\nỐng 50cm', 'Quần Parachute Harem Dáng Thụng Vintage, Quần Dài Dễ Vận Động Nhật Bản\r\n\r\n- MÔ TẢ SẢN PHẨM: \r\n\r\n - Chất liệu:  Parachute\r\n\r\n - Màu sắc sản phẩm: Đen- Ghi - Be\r\n\r\n - Kiểu dáng: dáng rộng', 1, 1, 1, '/storage/uploads/2024/05/24/vn-11134207-7r98o-lt67fholewg400.jpg', 20, 219900, '2024-05-24 14:45:00', '2024-05-24 14:45:00'),
(52, 'Quần Kaki Ống Rộng Viền Thể Thao Hàng Đẹp 2 Kiểu Form Rộng Suông Hàn Quốc', 'Eo 68cm, \r\nMông 96cm, \r\nDài 103cm, \r\nỐng 50cm', 'Quần Kaki Ống Rộng Viền Thể Thao Hàng Đẹp 2 Kiểu Form Rộng Suông Hàn Quốc\r\n\r\n\r\n\r\nTHÔNG TIN SẢN PHẨM \r\n\r\n\r\n\r\n- Chất liệu:  Vải kaki là loại vải mát có độ bền cao, ít bị nhăn và đặc biệt không bị xù lông nên bạn hoàn toàn có thể yên tâm khi sử dụng.\r\n\r\n- Form: Dáng quần rộng che khuyết điểm chân to cong, phong cách trẻ trung năng động thời trang rất được ưa chuộng hiện nay\r\n\r\n- Xuất xứ: sản xuẩn tại xưởng\r\n\r\n- Đặc điểm:\r\n\r\n+ Xưởng sản xuất trực tiếp nên giá cả rất rẻ so với thị trường bên ngoài khoảng 200-300k 1 quần\r\n\r\n+ Vải kaki thích hợp mặc vào cả 4 mùa\r\n\r\n+ Phối đồ: có nhiều cách phối đồ đẹp như\r\n\r\n1. Phối với áo croptop: style khỏe khoắn, năng động. lên đồ này vừa giúp khoe eo thon lại còn khiến chân trông dài hơn\r\n\r\n đáng kể\r\n\r\n2. Phối với áo thun dài tay đơn giản: Trông bạn sẽ trẻ trung tôn vóc dáng\r\n\r\n3. Phối đồ với áo form rộng: sẽ rất dễ thương thêm phần cá tính khi mặc set đồ này', 1, 1, 3, '/storage/uploads/2024/05/24/vn-11134207-7r98o-lru7az7l6htw0b.jpg', 11, 192000, '2024-05-24 14:46:16', '2024-05-24 14:46:16'),
(53, 'Quần Ống Rộng Vải Linen Hàng Đẹp Đứng Form Dáng Suông May Dập Ly Mẫu Mới Mặc Mát Mẻ', 'Eo 68cm, \r\nMông 96cm, \r\nDài 103cm, \r\nỐng 50cm', 'SẢN PHẨM QUẦN ỐNG RỘNG LINEN\r\n\r\n- Vải Linen là loại vải có độ bền cao, chất vải mềm mượt cùng ưu điểm cực đáng chú ý là có khả năng giữ màu vải rất lâu, không xảy ra tình trạng co rút nên sau nhiều lần giặt không bị biến dạng và bị hư hỏng.\r\n\r\n- Chất vải mát, thoáng khí thấm hút mồ hôi tốt mặc vào những mùa nắng nóng rất thích hợp', 1, 5, 1, '/storage/uploads/2024/05/24/vn-11134207-7r98o-lvhlwsxoqpvx7d.jpg', 12, 220000, '2024-05-24 14:47:57', '2024-05-24 14:47:57'),
(54, 'Quần thụng 2 viền dây hồng', '- Size: freesize < 68kg', 'THÔNG TIN SẢN PHẨM:\r\n\r\n- Chất liệu: Cotton pha\r\n\r\n- Hoạ tiết : bền và sắc nét', 1, 2, 1, '/storage/uploads/2024/05/24/vn-11134207-7r98o-lt5ahj11zj5w37.jpg', 19, 169900, '2024-05-24 14:49:32', '2024-06-06 08:45:41'),
(55, 'Chân váy demin nữ cạp cao dáng chữ A, chân váy jeans phối 2 túi trước siêu xinh phong cách', 'Eo 68cm, \r\nMông 96cm, \r\nDài 103cm, \r\nỐng 50cm', 'THÔNG TIN SẢN PHẨM CHÂN VÁY JEANS NỮ DÀI\r\n\r\n- Chân Váy phối 2 túi trước tạo điểm nhấn rất cá tính\r\n\r\n- Chân Váy chất liệu JEANS dày dặn.-\r\n\r\n- Chân Váy có 1 màu, Xanh dễ dàng kết hợp với áo phông, croptop.....\r\n\r\n- Chân Váy Jean  Dài Qua Gối,Chân Váy Dài không có quần trong các bạn nhé.', 2, 4, 2, '/storage/uploads/2024/05/24/vn-11134207-7r98o-lov2q62l9bob74.jpg', 20, 197000, '2024-05-24 14:51:29', '2024-05-24 14:51:29'),
(56, 'Quần giả váy jean nữ ngắn dáng chữ a cạp cao xanh đen tôn dáng cá tính', 'Chiều dài quần: 37cm, \r\nVòng eo:dưới 70cm, \r\nVòng hông: 90cm', 'THÔNG TIN SẢN PHẨM QUẦN SHORT JEAN NỮ\r\n\r\n- Quần shorts jeans nữ giả váy lưng cao siêu cá tính chất liệu dày dặn cao cấp tôn dáng\r\n\r\n- Quần shorts jeans nữ giả váy lưng cao dễ mix với nhiều loại áo \r\n\r\n- Chất liệu jeans dày dặn.\r\n\r\n Chú Ý: Quần short jeans không co giãn ạ', 2, 2, 3, '/storage/uploads/2024/05/24/vn-11134207-7r98o-ltrmdc4j0p3hf4.jpg', 19, 230000, '2024-05-24 14:52:50', '2024-06-06 08:45:41'),
(57, 'Chân váy jeans dáng dài rách xẻ tà sau phong cách Hàn', 'Chiều dài quần: 90cm, \r\nVòng eo:dưới 70cm, \r\nVòng hông: 90cm', 'THÔNG TIN SẢN PHẨM \r\n\r\n- Tên sản phẩm: Chân váy jean dài KABICO midi phong cách, chân váy dài tua gấu cạp cao tôn dáng A26\r\n\r\n-  Chất liệu:  kaki/jean dày dặn co giãn nhẹ thoải mái', 1, 4, 1, '/storage/uploads/2024/05/24/sg-11134201-7rbmq-loux5nxc3osm25.jpg', 18, 201000, '2024-05-24 14:55:13', '2024-05-24 14:55:13'),
(58, 'Chân váy jean dài KABICO cạp cao dáng dài qua gối, chân váy bò kaki dài phong cách', 'Chiều dài quần: 37cm, \r\nVòng eo:dưới 70cm, \r\nVòng hông: 90cm', 'THÔNG TIN SẢN PHẨM \r\n\r\n- Tên sản phẩm: Chân váy jean dài KABICO cạp cao dáng dài qua gối, chân váy bò kaki dài phong cách ulzzang A7\r\n\r\n-  Chất liệu:  kaki/jean dày dặn co giãn nhẹ thoải mái', 2, 3, 1, '/storage/uploads/2024/05/24/ab5f2091975246bc0ee2026dcca01249.jpg', 18, 250000, '2024-05-24 14:56:34', '2024-06-06 10:59:26'),
(59, 'Chân váy ulzzang midi ,chân váy dài xẻ sau phong cách trẻ - khoá trước', 'Chiều dài quần: 87cm, \r\nVòng eo:dưới 70cm, \r\nVòng hông: 90cm', 'THÔNG TIN SẢN PHẨM \r\n\r\n- Tên sản phẩm: Chân váy jean dài KABICO cạp cao dáng dài qua gối, chân váy bò kaki dài phong cách ulzzang A7\r\n\r\n-  Chất liệu:   dày dặn co giãn nhẹ thoải mái', 2, 2, 1, '/storage/uploads/2024/05/24/vn-11134207-7qukw-ligpou1n9vpudb.jpg', 9, 199900, '2024-05-24 14:58:32', '2024-05-24 14:58:32'),
(60, 'Chân váy dài xếp ly lưng cao hách dáng phong cách hàn quốc - không kèm đai', 'Chiều dài quần: 37cm, \r\nVòng eo:dưới 70cm, \r\nVòng hông: 90cm', 'Chân váy dài xếp ly lưng cao hách dáng phong cách hàn quốc - không kèm đai ,vải vitex cao cấp\r\n\r\n\r\n\r\nTHÔNG TIN SẢN PHẨM\r\n\r\n\r\n\r\n- Lên dáng sang trong lịch sự hot trend, với đường may chắc chắn tỉ mỉ se làm hài lòng khách hàng khó tính nhất', 2, 1, 1, '/storage/uploads/2024/05/24/vn-11134207-7qukw-leydx90eu1e2c2.jpg', 11, 300000, '2024-05-24 14:59:46', '2024-06-06 08:53:59'),
(61, 'Áo ba lỗ trễ vai trơn đơn giản dành cho nữ', 'Freesize dưới 55kg ( tùy thuộc vào chiều cao - bạn để lại inbox để được tư vấn tốt hơn nhé )', 'Mô TẢ \r\nMẫu: Trơn\r\nPhong cách: Thường ngày\r\nPlus Kích thước: Không\r\nChất liệu: Polyester\r\nThành phần: 100% Polyester\r\nLoại vừa vặn: Slim Fit\r\nSheer: Không\r\nCăng: Không căng\r\nKhu vực xuất xứ: Trung Quốc đại lục', 7, 3, 3, '/storage/uploads/2024/05/24/sg-11134201-7rd65-lva9hr9hq53a95.jpg', 15, 99000, '2024-05-24 15:01:54', '2024-06-06 08:53:59'),
(62, 'Áo Cổ Vuông Tay Ngắn PINKSTORE29 Phối Nơ Kiểu Nhún Ngực', 'Freesize dưới 55kg ( tùy thuộc vào chiều cao - bạn để lại inbox để được tư vấn tốt hơn nhé )', 'Áo kiểu cổ vuông tay ngắn, phối dây buộc nơ nhún ngực\r\nChất liệu thun dày dặn, thoáng mát, co giãn tốt\r\nÁo kiểu nữ có thể kết hợp với chân váy, quần jean hoặc quần ống rộng để đi dạo phố, cafe hoặc các buổi party,…', 7, 3, 2, '/storage/uploads/2024/05/24/sg-11134201-7rd5f-lva1sw0jl557ab.jpg', 23, 219900, '2024-05-24 15:03:48', '2024-05-24 15:03:48'),
(63, 'Áo thun FIDE BUNNY unisex form rộng cổ tròn', 'DÀI KHOẢNG 71 RỘNG 56CM ( FOM 40 - 70KG ĐỔ LẠI )', 'Áo thun FIDE BUNNY unisex form rộng cổ tròn BUNNY - AT34\r\n️Chất liệu:cotton 2 chiều\r\n️Bo cổ : 3 phân không bị giãn hay nhão sau khi giặt\r\n️Hình in : cam kết không bông trốc , không gây hại dạ ,\r\ndính màu , an toàn sức khoẻ cho người sử dụng ,\r\n️Thiết kế nhiều phong cách đa dạng khác nhau : streetwear , dễ thương, cá tính , mạnh mẽ, ngầu , năng đông, hiện thời , thiết mới luôn theo xu hướng trend', 9, 3, 1, '/storage/uploads/2024/05/24/vn-11134201-7r98o-luj41rg50y7978.jpg', 6, 799000, '2024-05-24 15:05:50', '2024-06-06 08:53:59'),
(64, 'Túi xách dáng vuông đeo vai hoạ tiết da cá sấu cao cấp hợp thời trang dễ phối đồ Hot', '- Kích thước : 15 x 20 x 9\r\n\r\n- Chất da PU cực bền, không dễ bong tróc, dễ lau chùi, không sợ bụi bẩn\r\n\r\n- Form túi cứng cáp, cực kì chắc chắn', '➡ HÀNG SHOP BÁN LÀ HÀNG Q.C  L.O ẠI 1, KHÔNG PHẢI HÀNG X.Ư.ỞNG GIA CÔNG LẠI. \r\n\r\n➡ HIỆN NAY CÓ NHIỂU SHOP LẤY HÌNH ẢNH TÚI ĐẸP NHƯNG BÊN NGOÀI XẤU, FORM TÚI ỌP ẸP DO LÀ HÀNG X.Ư. ỞNG NÊN NÀNG LƯU Ý NHA. T. IỀN NÀO CỦA NẤY Ạ. \r\n\r\n\r\n\r\n➡ HÀNG THẬT ĐẸP Y HÌNH 100%\r\n\r\n\r\n✨ Kích thước : 15 x 20 x 9\r\n\r\n✨ Chất da PU cực bền, không dễ bong tróc, dễ lau chùi, không sợ bụi bẩn\r\n\r\n✨Đường may tỉ mỉ - sự khác biệt nằm ở đường may, chất da và form túi, độ bền khi sử dụng so với hàng xưởng chất lượng kém\r\n\r\n✨Form túi cứng cáp, cực kì chắc chắn\r\n\r\n✨Vừa vặn: Các dòng điện thoại, sổ nhỏ, vật dụng cá nhân( son, phấn nước,……)', 13, 6, 1, '/storage/uploads/2024/06/06/vn-11134207-7r98o-lsn2vhrxigg436.jpg', 18, 220000, '2024-06-06 10:44:32', '2024-06-06 10:57:35'),
(65, 'Túi chuỗi chỉ thêu tinh tế khoá đơn đa năng, túi đeo đơn giản dễ phối', '✨ Kích thước : 15 x 20 x 9\r\n\r\n✨ Chất da PU cực bền, không dễ bong tróc, dễ lau chùi, không sợ bụi bẩn', '➡ HÀNG SHOP BÁN LÀ HÀNG Q.C  L.O ẠI 1, KHÔNG PHẢI HÀNG X.Ư.ỞNG GIA CÔNG LẠI. \r\n\r\n➡ HIỆN NAY CÓ NHIỂU SHOP LẤY HÌNH ẢNH TÚI ĐẸP NHƯNG BÊN NGOÀI XẤU, FORM TÚI ỌP ẸP DO LÀ HÀNG X.Ư. ỞNG NÊN NÀNG LƯU Ý NHA. T. IỀN NÀO CỦA NẤY Ạ. \r\n\r\n\r\n\r\n➡ HÀNG THẬT ĐẸP Y HÌNH 100%\r\n\r\n\r\n✨ Kích thước : 15 x 20 x 9\r\n\r\n✨ Chất da PU cực bền, không dễ bong tróc, dễ lau chùi, không sợ bụi bẩn\r\n\r\n✨Đường may tỉ mỉ - sự khác biệt nằm ở đường may, chất da và form túi, độ bền khi sử dụng so với hàng xưởng chất lượng kém\r\n\r\n✨Form túi cứng cáp, cực kì chắc chắn\r\n\r\n✨Vừa vặn: Các dòng điện thoại, sổ nhỏ, vật dụng cá nhân( son, phấn nước,……)', 13, 6, 1, '/storage/uploads/2024/06/06/vn-11134207-7r98o-lsn09xy91r5w6f.jpg', 1, 300000, '2024-06-06 10:46:54', '2024-06-06 10:57:35'),
(66, 'Túi đeo chéo da PU màu trơn dáng vuông nhỏ xinh xắn phong cách Hàn Quốc dành cho nữ', '✨ Kích thước :22 x 9 x 14\r\n\r\n✨ Chất da PU cực bền, không dễ bong tróc, dễ lau chùi, không sợ bụi bẩn', '➡ HÀNG SHOP BÁN LÀ HÀNG Q.C  L.O ẠI 1, KHÔNG PHẢI HÀNG X.Ư.ỞNG GIA CÔNG LẠI. \r\n\r\n➡ HIỆN NAY CÓ NHIỂU SHOP LẤY HÌNH ẢNH TÚI ĐẸP NHƯNG BÊN NGOÀI XẤU, FORM TÚI ỌP ẸP DO LÀ HÀNG X.Ư. ỞNG NÊN NÀNG LƯU Ý NHA. T. IỀN NÀO CỦA NẤY Ạ. \r\n\r\n\r\n\r\n➡ HÀNG THẬT ĐẸP Y HÌNH 100%\r\n\r\n\r\n✨ Kích thước : 15 x 20 x 9\r\n\r\n✨ Chất da PU cực bền, không dễ bong tróc, dễ lau chùi, không sợ bụi bẩn\r\n\r\n✨Đường may tỉ mỉ - sự khác biệt nằm ở đường may, chất da và form túi, độ bền khi sử dụng so với hàng xưởng chất lượng kém\r\n\r\n✨Form túi cứng cáp, cực kì chắc chắn\r\n\r\n✨Vừa vặn: Các dòng điện thoại, sổ nhỏ, vật dụng cá nhân( son, phấn nước,……)', 13, 6, 1, '/storage/uploads/2024/06/06/vn-11134207-7r98o-lsn09xy7yf9ga6.jpg', 20, 799000, '2024-06-06 10:48:01', '2024-06-06 10:48:01'),
(67, 'Túi xách nữ đeo vai đi chơi đi tiệc chất liệu da cao cấp thiết kế phong cách messenger', '✨ Kích thước :22 x 10 x 17\r\n\r\n✨ Chất da PU cực bền, không dễ bong tróc, dễ lau chùi, không sợ bụi bẩn', 'Túi đeo chéo da PU màu trơn dáng vuông nhỏ xinh xắn phong cách Hàn Quốc dành cho nữ', 13, 6, 1, '/storage/uploads/2024/06/06/vn-11134207-7r98o-lsn09xy8p41wa9.jpg', 0, 359900, '2024-06-06 10:49:01', '2024-06-06 10:57:35'),
(68, 'Túi Xách Đeo Chéo Vai Thời Trang Cao Cấp Y2K', 'Kích thước “ Rộng 20cm , cao 13cm , dày 7cm ( có thể điều chỉnh dây đeo vai)', 'Xu hướng thời trang Style \'\r\n\r\nChất liệu - PU\r\n\r\nPhong cách xu hướng túi - khác\r\n\r\nChuỗi yếu tố phổ biến\r\n\r\nCấu trúc bên trong của túi - túi đựng điện thoại di động\r\n\r\nĐộ cứng - mềm\r\n\r\nCảnh có thể áp dụng sắp xếp hàng ngày', 13, 6, 1, '/storage/uploads/2024/06/06/sg-11134201-7qveq-lgvz9exn1sik2c.jpg', 5, 219000, '2024-06-06 10:51:00', '2024-06-06 10:51:00'),
(69, 'Túi xách nữ đeo chéo chần trám da mềm Tuixachxinh2 phong cách Hàn Quốc', 'Chiều rộng : 19 cm\r\nChiều cao ： 10 cm\r\nĐộ dày: 7 cm', 'Mùa năm niêm yết: mùa hè 2023\r\nPhong cách: tươi và ngọt ngào\r\nCác yếu tố phổ biến: khâu\r\n\r\nChất liệu: PU\r\nKích thước túi: trong\r\nKết cấu lớp lót: PU\r\nMô hình: màu rắn\r\nphong cách xu hướng túi: túi vuông nhỏ\r\nmở nắp: dây kéo\r\ngói cấu trúc bên trong: túi điện thoại di động', 13, 6, 3, '/storage/uploads/2024/06/06/vn-11134207-7r98o-llw6ru1jrsv3f5.jpg', 7, 300000, '2024-06-06 10:53:04', '2024-06-06 10:57:35'),
(70, 'Túi xách nữ cầm tay Tim Ngọc hàng hót sang chảnh có dây đeo chéo', '- Kích thước: 20cm\r\n- Màu sắc: đen trăng hồng\r\n- Chất liệu: Da pu \r\n- Style: Hàn Quốc\r\n- Hàng không có hộp', '➡ HÀNG SHOP BÁN LÀ HÀNG Q.C  L.O ẠI 1, KHÔNG PHẢI HÀNG X.Ư.ỞNG GIA CÔNG LẠI. \r\n\r\n➡ HIỆN NAY CÓ NHIỂU SHOP LẤY HÌNH ẢNH TÚI ĐẸP NHƯNG BÊN NGOÀI XẤU, FORM TÚI ỌP ẸP DO LÀ HÀNG X.Ư. ỞNG NÊN NÀNG LƯU Ý NHA. T. IỀN NÀO CỦA NẤY Ạ. \r\n\r\n\r\n\r\n➡ HÀNG THẬT ĐẸP Y HÌNH 100%\r\n\r\n\r\n✨ Kích thước : 15 x 20 x 9\r\n\r\n✨ Chất da PU cực bền, không dễ bong tróc, dễ lau chùi, không sợ bụi bẩn\r\n\r\n✨Đường may tỉ mỉ - sự khác biệt nằm ở đường may, chất da và form túi, độ bền khi sử dụng so với hàng xưởng chất lượng kém\r\n\r\n✨Form túi cứng cáp, cực kì chắc chắn\r\n\r\n✨Vừa vặn: Các dòng điện thoại, sổ nhỏ, vật dụng cá nhân( son, phấn nước,……)', 13, 6, 3, '/storage/uploads/2024/06/06/63b9e07949045ac122d26e3857c27a3c.jpg', 12, 800000, '2024-06-06 10:54:46', '2024-06-06 10:54:46'),
(71, 'Túi xách nữ cầm tay đeo chéo Da bóng Di o hộp vuông sang chảnh hiện đại hot hit', '- Kích thước: \r\nSIZE 20: 19x17x10\r\nSIZE MINI: 14x12x10', '- Cân nặng: ~300g\r\n - Chất liệu: da bóng PU bền bỉ\r\n - Màu sắc: Đen / xám / trắng / hồng\r\n\r\n👌 Sản phẩm thích hợp với đi chơi, đi làm, đi dự tiệc, đi họp, đi shopping, đi du lịch…\r\n👌 Có thể đựng: điện thoại, ví tiền, son môi, đồ make up cơ bản …\r\n👌 Sản Phẩm Chuẩn 1.0.0% Như Hình Ảnh + Video', 13, 6, 3, '/storage/uploads/2024/06/06/vn-11134207-7r98o-lsc8h59ntsihcc.jpg', 1, 400000, '2024-06-06 10:56:13', '2024-06-06 10:56:13');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_types`
--

CREATE TABLE `product_types` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumb` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product_types`
--

INSERT INTO `product_types` (`id`, `name`, `thumb`, `active`, `created_at`, `updated_at`) VALUES
(1, 'Quần dài', '/storage/uploads/2024/05/24/z47536564180932da7ab36644d33d5f77b4cbea0a90f5c.jpg', 1, '2024-04-05 09:48:24', '2024-05-24 14:28:28'),
(2, 'Chân váy', '/storage/uploads/2024/05/24/800-800_21117b63-9a1e-482a-978e-f6dde83d7480.jpg', 1, '2024-04-05 09:49:24', '2024-05-24 14:18:53'),
(3, 'Mũ', '/storage/uploads/2024/05/24/images.jpg', 1, '2024-04-05 09:55:47', '2024-05-24 14:21:48'),
(4, 'Quần short', '/storage/uploads/2024/05/24/5daf9bd9a8e7465a078ea3ea7bf8eee7.jpg_720x720q80.jpg', 1, '2024-04-05 09:56:03', '2024-05-24 13:28:07'),
(6, 'Đầm', '/storage/uploads/2024/05/24/7a7f71a77d98032587a40da20bc54699.jpg_720x720q80.jpg', 1, '2024-04-18 12:43:54', '2024-05-24 13:25:17'),
(7, 'Áo kiểu', '/storage/uploads/2024/05/24/52a78e427ecaa1dcd7fbff8240188f1f.jpg', 1, '2024-04-18 12:44:13', '2024-05-24 13:20:37'),
(9, 'Áo thun', '/storage/uploads/2024/05/24/6a3d0c1d02f20709c4d4e3348a8b38e3.jpg', 1, '2024-04-18 12:44:48', '2024-05-24 13:32:38'),
(12, 'Set bộ', '/storage/uploads/2024/05/24/0e396e8015680f49d4c6ecac8f76b537.jpg', 1, '2024-04-18 12:45:41', '2024-05-24 13:17:21'),
(13, 'Túi', '/storage/uploads/2024/05/24/tui-xach-nu-6-600x600.jpg', 1, '2024-04-18 12:45:58', '2024-05-24 13:11:29');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `promotions`
--

CREATE TABLE `promotions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sale` decimal(2,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `promotions`
--

INSERT INTO `promotions` (`id`, `name`, `sale`, `created_at`, `updated_at`) VALUES
(1, 'KHUYENMAI10%', 0.10, '2024-04-05 10:29:20', '2024-04-05 10:29:20'),
(2, 'KHUYENMAI15%', 0.15, '2024-04-19 02:24:11', '2024-04-19 02:24:11'),
(3, 'KHUYENMAI5%', 0.05, '2024-04-19 02:25:12', '2024-04-19 02:25:12'),
(4, 'KHUYENMAI20%', 0.20, '2024-04-19 02:25:28', '2024-04-19 02:25:28');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sales`
--

CREATE TABLE `sales` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sale` decimal(2,2) NOT NULL,
  `quantity` int NOT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sales`
--

INSERT INTO `sales` (`id`, `name`, `token`, `sale`, `quantity`, `active`, `created_at`, `updated_at`) VALUES
(1, 'giamgia50%', 'giamgia50', 0.50, 8, 1, '2024-04-25 13:54:44', '2024-05-27 13:13:53'),
(2, 'giamgia5%', 'giamgia5', 0.05, 39, 1, '2024-04-29 01:33:08', '2024-06-06 08:48:19'),
(3, 'giamgia0%', 'giamgia0', 0.00, 1994, 1, '2024-05-07 05:36:50', '2024-06-10 00:40:50'),
(4, 'giamgia20%', 'giamgia20', 0.20, 16, 1, '2024-05-18 00:41:49', '2024-06-06 08:51:21'),
(5, 'giamgia15%', 'giamgia15', 0.15, 49, 1, '2024-05-27 13:07:33', '2024-06-06 10:59:26');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumb` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sliders`
--

INSERT INTO `sliders` (`id`, `name`, `thumb`, `description`, `active`, `created_at`, `updated_at`) VALUES
(1, 'Thu Phương', '/storage/uploads/2024/04/05/slide1.gif', 'sale 4.4', 1, '2024-04-05 10:51:30', '2024-04-05 10:51:30'),
(6, 'sale4.4', '/storage/uploads/2024/04/05/slide2.gif', 'toàn bộ shop', 1, '2024-04-05 11:57:18', '2024-04-05 11:57:18'),
(7, 'lamy', '/storage/uploads/2024/04/05/slide3.jpg', '.', 1, '2024-04-05 11:57:54', '2024-04-05 11:57:54'),
(8, 'shoplamy', '/storage/uploads/2024/04/05/2.jpg', 'mừng năm mới', 1, '2024-04-05 11:58:17', '2024-04-05 11:58:17'),
(9, 'Thời trang tiền cũ', '/storage/uploads/2024/04/18/hình ảnh_2024-04-18_203456682.png', '12', 1, '2024-04-18 13:35:02', '2024-04-18 13:35:02');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `statuses`
--

CREATE TABLE `statuses` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `statuses`
--

INSERT INTO `statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Chờ xác nhận', NULL, NULL),
(2, 'Xác nhận thành công', NULL, NULL),
(3, 'Đang giao hàng', NULL, NULL),
(4, 'Giao hàng thành công', NULL, NULL),
(5, 'Huỷ đơn hàng', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `trademarks`
--

CREATE TABLE `trademarks` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumb` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `trademarks`
--

INSERT INTO `trademarks` (`id`, `name`, `thumb`, `created_at`, `updated_at`) VALUES
(1, 'Quảng Châu', '/storage/uploads/2024/04/05/quangchau.jpg', '2024-04-05 12:00:33', '2024-04-05 12:00:33'),
(2, 'LAMY', '/storage/uploads/2024/04/05/logo.jpg', '2024-04-05 12:01:49', '2024-04-05 12:01:49'),
(3, 'LOVITO', '/storage/uploads/2024/04/05/lovito.jpg', '2024-04-05 12:02:56', '2024-04-05 12:02:56'),
(4, '247Store', '/storage/uploads/2024/04/18/4f8350908a9887f5dd1421fc48754aeb_tn.webp', '2024-04-18 12:58:39', '2024-04-18 12:58:39'),
(5, 'Lollaye', '/storage/uploads/2024/05/24/9b431be892d6e313ac61abe92a65a574_tn.jpg', '2024-05-24 13:49:30', '2024-05-24 13:49:30'),
(6, 'VOGUE', '/storage/uploads/2024/06/06/vn-11134004-7r98o-lsk5alaf7ijd00_tn.jpg', '2024-06-06 10:42:10', '2024-06-06 10:42:10');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` tinyint(1) NOT NULL,
  `cccd` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumb` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `gender`, `cccd`, `phone`, `email`, `thumb`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Thu Phương', 0, '056221009724', '0362372125', 'admin@localhost.com', '/storage/uploads/admin/avatar.jpg', '2024-04-05 09:02:25', '$2y$10$jkjVwrVDd/H5Eq13wzQ3iu.SDgjEZPpGjZ/0PmU2BJ5Q2qEuSsZ02', 'fpJaUkiCNCMPoOAkfx1f4h58ZqhTySw4qpfW2hQSlAbUqaG00gp2W7WZuDUS', NULL, '2024-04-05 10:04:41');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customers_email_unique` (`email`);

--
-- Chỉ mục cho bảng `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orderdetails_order_id_foreign` (`order_id`),
  ADD KEY `orderdetails_product_id_foreign` (`product_id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_customer_id_foreign` (`customer_id`),
  ADD KEY `orders_status_id_foreign` (`status_id`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_sale_id_foreign` (`sale_id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_name_unique` (`name`),
  ADD KEY `products_producttype_id_foreign` (`producttype_id`),
  ADD KEY `products_trademark_id_foreign` (`trademark_id`),
  ADD KEY `products_promotion_id_foreign` (`promotion_id`);

--
-- Chỉ mục cho bảng `product_types`
--
ALTER TABLE `product_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_types_name_unique` (`name`);

--
-- Chỉ mục cho bảng `promotions`
--
ALTER TABLE `promotions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `promotions_name_unique` (`name`);

--
-- Chỉ mục cho bảng `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sales_name_unique` (`name`),
  ADD UNIQUE KEY `sales_token_unique` (`token`);

--
-- Chỉ mục cho bảng `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sliders_name_unique` (`name`);

--
-- Chỉ mục cho bảng `statuses`
--
ALTER TABLE `statuses`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `trademarks`
--
ALTER TABLE `trademarks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `trademarks_name_unique` (`name`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `orderdetails`
--
ALTER TABLE `orderdetails`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT cho bảng `product_types`
--
ALTER TABLE `product_types`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `promotions`
--
ALTER TABLE `promotions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `sales`
--
ALTER TABLE `sales`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `statuses`
--
ALTER TABLE `statuses`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `trademarks`
--
ALTER TABLE `trademarks`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD CONSTRAINT `orderdetails_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `orderdetails_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  ADD CONSTRAINT `orders_sale_id_foreign` FOREIGN KEY (`sale_id`) REFERENCES `sales` (`id`),
  ADD CONSTRAINT `orders_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_producttype_id_foreign` FOREIGN KEY (`producttype_id`) REFERENCES `product_types` (`id`),
  ADD CONSTRAINT `products_promotion_id_foreign` FOREIGN KEY (`promotion_id`) REFERENCES `promotions` (`id`),
  ADD CONSTRAINT `products_trademark_id_foreign` FOREIGN KEY (`trademark_id`) REFERENCES `trademarks` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
