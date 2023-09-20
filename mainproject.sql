-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 04, 2023 at 03:29 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mainproject`
--

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `photo`, `created_at`, `updated_at`) VALUES
(1, '1687801396_banner2.jpg', '2023-06-26 17:43:16', '2023-06-26 17:43:16'),
(2, '1687801412_banner1.jpg', '2023-06-26 17:43:32', '2023-06-26 17:43:32'),
(3, '1687801436_banner3.jpg', '2023-06-26 17:43:56', '2023-06-26 17:43:56');

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

CREATE TABLE `brand` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brand`
--

INSERT INTO `brand` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Nike', NULL, '2023-06-25 05:16:49', '2023-06-25 05:16:49'),
(2, 'Adidas', NULL, '2023-06-25 05:16:58', '2023-06-25 05:16:58'),
(3, 'Jordan', NULL, '2023-06-25 05:17:22', '2023-06-25 05:17:22'),
(4, 'Yeezy', NULL, '2023-06-25 05:17:34', '2023-06-25 05:17:34');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Sneaker', NULL, '2023-06-25 05:10:20', '2023-06-25 05:10:20'),
(2, 'Slipper', NULL, '2023-06-25 05:10:31', '2023-06-25 05:10:31'),
(8, 'Men', NULL, '2023-06-26 15:06:10', '2023-06-26 15:06:10'),
(9, 'Women', NULL, '2023-06-26 15:06:22', '2023-06-26 15:06:22');

-- --------------------------------------------------------

--
-- Table structure for table `contact_us`
--

CREATE TABLE `contact_us` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contact_us`
--

INSERT INTO `contact_us` (`id`, `user_id`, `title`, `content`, `created_at`, `updated_at`) VALUES
(1, 1, 'hii', 'demo', '2023-06-26 08:14:44', '2023-06-26 08:14:44');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `discount_amount` double DEFAULT NULL,
  `expiry_date` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `discount_amount`, `expiry_date`, `created_at`, `updated_at`) VALUES
(1, 'CPDM1', 40, '2023-06-30 00:00:00', '2023-06-25 05:28:00', '2023-06-25 05:28:00'),
(2, 'CPDM2', 10, '2023-06-30 00:00:00', '2023-06-25 05:28:10', '2023-06-25 05:28:10'),
(3, 'CPDM3', 40, '2023-06-30 00:00:00', '2023-06-25 05:28:19', '2023-06-25 05:28:19'),
(4, 'CPDM4', 40, '2023-06-30 00:00:00', '2023-06-25 05:28:27', '2023-06-25 05:28:27'),
(5, 'CPDM5', 10, '2023-06-30 00:00:00', '2023-06-25 05:28:36', '2023-06-25 05:28:36');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inform`
--

CREATE TABLE `inform` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `inform`
--

INSERT INTO `inform` (`id`, `photo`, `title`, `content`, `created_at`, `updated_at`) VALUES
(1, 'fb26c6857a13cde8de3c7bb2d5827699.jpg', 'Breaking News: Exciting New Sneaker Release on 1/7/2023', 'Mark your calendars and prepare to step up your sneaker game! On 1st July 2023, a highly anticipated new sneaker is set to make its grand entrance, captivating sneakerheads and fashion enthusiasts worldwide. This cutting-edge footwear masterpiece promises to redefine style, comfort, and innovation.  Designed with meticulous attention to detail, the upcoming sneaker represents the culmination of months of research, development, and creative ingenuity. Crafted by a team of visionary designers and engineers, this shoe is poised to leave an indelible mark on the sneaker industry.  Unparalleled Design:  Prepare to be awestruck by the striking aesthetics of this sneaker. Seamlessly blending contemporary elements with timeless appeal, it boasts a sleek and modern silhouette that effortlessly complements any outfit. The combination of premium materials and expert craftsmanship ensures both durability and an impeccable finish.  Revolutionary Comfort:  Say goodbye to sacrificing comfort for style. The creators of this remarkable sneaker have gone above and beyond to ensure an unparalleled wearing experience. Employing cutting-edge cushioning technology, this shoe provides exceptional support and impact absorption, allowing you to effortlessly conquer the streets, the gym, or any terrain you encounter.  Innovative Features:  Pushing the boundaries of innovation, this sneaker introduces a range of groundbreaking features. From advanced ventilation systems to enhance breathability, moisture-wicking properties for a cool and dry feel, to customizable fit options, every aspect has been meticulously engineered to elevate your sneaker experience.  Limited Edition Release:  As a testament to its exclusivity and desirability, the release of this exceptional sneaker will be limited. A limited production run ensures that those fortunate enough to secure a pair will possess a true collector\'s item. Be prepared to join the ranks of elite sneaker connoisseurs who value both style and rarity.  Community Collaboration:  In a bold move to foster creativity and celebrate the sneaker community, the brand behind this remarkable release has collaborated with renowned artists and influencers. The result is a vibrant fusion of artistry and urban culture, manifesting in unique colorways and limited editions that resonate with the fashion-forward individual.  How to Get Your Hands on a Pair:  To ensure you don\'t miss out on this extraordinary sneaker, mark 1st July 2023 on your calendar. Stay tuned to the official website and social media channels of the brand for updates and detailed information on the release. Swift action and a keen eye will be necessary to secure a pair of this coveted footwear.  Prepare to embark on a journey of style, innovation, and self-expression with the upcoming sneaker release on 1st July 2023. Don\'t miss your chance to be part of sneaker history as this iconic shoe takes the world by storm. Lace up, step forward, and embrace the future of sneaker culture!', '2023-06-25 14:01:25', '2023-06-25 14:01:25');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2023_05_22_141103_create_categories_table', 1),
(5, '2023_05_22_144103_create_brand_table', 1),
(6, '2023_05_22_153638_create_products_table', 1),
(7, '2023_05_22_154407_create_order_table', 1),
(8, '2023_05_22_154617_create_order_items_table', 1),
(9, '2023_05_31_074528_create_slider', 1),
(10, '2023_06_04_174535_create_contact_us_table', 1),
(11, '2023_06_04_174848_create_survey_table', 1),
(12, '2023_06_05_072316_create_products-deltail', 1),
(13, '2023_06_05_073346_create_product_comments_table', 1),
(14, '2023_06_05_091112_create_product_images', 1),
(15, '2023_06_07_072712_create_inform_table', 1),
(16, '2023_06_07_072856_create_banner_table', 1),
(17, '2023_06_21_151848_create_coupons_table', 1),
(18, '2023_06_25_212156_create_payments_table', 2),
(19, '2023_06_25_221910_create_payments_table', 3),
(20, '2023_06_25_222626_create_payments_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(255) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `payment_type` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`id`, `user_id`, `status`, `first_name`, `last_name`, `address`, `email`, `phone`, `country`, `city`, `payment_type`, `created_at`, `updated_at`) VALUES
(1, 1, 'canceled', 'Tai', 'Co', 'khoncsodsads', 'Cotrinhhientai@gmail.com', '+023921321', 'GO dau', 'VietNam', 'pay_later', '2023-06-26 06:51:01', '2023-06-26 08:05:18'),
(2, 1, 'confirmed', 'The', 'Cot', 'Chomoi, Angiang', 'Cotrinhhientai@gmail.com', '+023921321', 'GO dau', 'VietNam', 'pay_later', '2023-06-26 08:00:35', '2023-06-26 08:04:54'),
(3, 2, 'confirmed', 'Tri', 'Minh', 'xã Hành Đức, huyện Nghĩa Hành', 'votrung10a3nh1@gmail.com', '223', 'viet nam', 'Quảng Ngãi', 'online_payment', '2023-06-26 09:13:32', '2023-06-26 09:25:33'),
(4, 2, 'pending', 'Tri', 'Minh', 'xã Hành Đức, huyện Nghĩa Hành', 'thecot2004@gmail.com', '345534535', 'viet nam', 'Quảng Ngãi', 'online_payment', '2023-06-26 09:15:48', '2023-06-26 09:15:48'),
(5, 2, 'pending', 'Tri', 'Minh', 'xã Hành Đức, huyện Nghĩa Hành', 'trungvo.11062004@gmail.com', '01998874568', 'viet nam', 'Quảng Ngãi', 'online_payment', '2023-06-26 09:35:39', '2023-06-26 09:35:39'),
(6, 2, 'canceled', 'Tri', 'Minh', 'xã Hành Đức, huyện Nghĩa Hành', 'votrung10a3nh1@gmail.com', '01998874568', 'viet nam', 'Quảng Ngãi', 'online_payment', '2023-06-26 09:37:40', '2023-06-26 09:46:00'),
(7, 6, 'confirmed', 'trung vo', 'vo', 'hanh duc', 'votrung10a3nh1@gmail.com', '+84817558315', 'Vietnam', 'wuang ngai', 'pay_later', '2023-06-26 09:49:09', '2023-06-26 09:49:47'),
(8, 1, 'pending', 'Chien', 'van chien', '57/70/8 dien bien phu', 'chiencvts2208042@fpt.edu.vn', '0123456789', 'Vietnam', 'Saigon', 'online_payment', '2023-06-26 17:53:43', '2023-06-26 17:53:43'),
(9, 1, 'pending', 'Chien', 'van chien', '57/70/8 dien bien phu', 'chiencvts2208042@fpt.edu.vn', '0123456789', 'Vietnam', 'Saigon', 'pay_later', '2023-06-26 17:56:29', '2023-06-26 17:56:29'),
(10, 1, 'pending', 'Chien', 'van chien', '57/70/8 dien bien phu', 'chiencvts2208042@fpt.edu.vn', '0123456789', 'Vietnam', 'Saigon', 'online_payment', '2023-06-26 17:57:48', '2023-06-26 17:57:48'),
(11, 8, 'pending', 'Hao', 'Nguyen', '15 hong bang', 'huyhvv9@gmail.com', '0146357247656', 'Vietnam', 'tp. Ho Chi Minh', 'pay_later', '2023-07-02 13:59:33', '2023-07-02 13:59:33');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `size` double NOT NULL,
  `amount` int(11) NOT NULL,
  `delivery_fee` varchar(255) DEFAULT NULL,
  `total` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `quantity`, `size`, `amount`, `delivery_fee`, `total`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 1, 43, 150, NULL, 150, '2023-06-26 06:51:01', '2023-06-26 06:51:01'),
(2, 2, 8, 1, 37, 60, NULL, 60, '2023-06-26 08:00:35', '2023-06-26 08:00:35'),
(3, 3, 1, 1, 44, 110, NULL, 110, '2023-06-26 09:13:32', '2023-06-26 09:13:32'),
(4, 4, 1, 2, 44, 110, NULL, 220, '2023-06-26 09:15:48', '2023-06-26 09:15:48'),
(5, 5, 1, 1, 44, 110, NULL, 110, '2023-06-26 09:35:39', '2023-06-26 09:35:39'),
(6, 6, 2, 1, 43, 150, NULL, 150, '2023-06-26 09:37:40', '2023-06-26 09:37:40'),
(7, 7, 1, 1, 44, 110, NULL, 110, '2023-06-26 09:49:09', '2023-06-26 09:49:09'),
(8, 8, 1, 2, 37, 99, NULL, 198, '2023-06-26 17:53:43', '2023-06-26 17:53:43'),
(9, 9, 1, 1, 36, 99, NULL, 99, '2023-06-26 17:56:29', '2023-06-26 17:56:29'),
(10, 10, 1, 1, 36, 99, NULL, 99, '2023-06-26 17:57:48', '2023-06-26 17:57:48'),
(11, 11, 2, 1, 39, 134, NULL, 134, '2023-07-02 13:59:33', '2023-07-02 13:59:33'),
(12, 11, 3, 1, 39, 210, NULL, 210, '2023-07-02 13:59:33', '2023-07-02 13:59:33');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payment_id` varchar(255) NOT NULL,
  `payer_id` varchar(255) NOT NULL,
  `payer_email` varchar(255) NOT NULL,
  `amount` double(10,2) NOT NULL,
  `currency` varchar(255) NOT NULL,
  `payment_status` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `payment_id`, `payer_id`, `payer_email`, `amount`, `currency`, `payment_status`, `created_at`, `updated_at`) VALUES
(1, 'PAYID-MSMVLEQ6CD6364299565123D', '69T2ML7RNPPA2', 'sb-ky0ew26380582@personal.example.com', 110.00, 'USD', 'approved', '2023-06-26 09:09:40', '2023-06-26 09:09:40'),
(2, 'PAYID-MSMVNKY9W5928115E747411U', '69T2ML7RNPPA2', 'sb-ky0ew26380582@personal.example.com', 110.00, 'USD', 'approved', '2023-06-26 09:13:32', '2023-06-26 09:13:32'),
(3, 'PAYID-MSMVONY0VG83044E0343262D', '69T2ML7RNPPA2', 'sb-ky0ew26380582@personal.example.com', 220.00, 'USD', 'approved', '2023-06-26 09:15:48', '2023-06-26 09:15:48'),
(4, 'PAYID-MSMVXMA11778747R3268323E', '69T2ML7RNPPA2', 'sb-ky0ew26380582@personal.example.com', 70.00, 'USD', 'approved', '2023-06-26 09:35:39', '2023-06-26 09:35:39'),
(5, 'PAYID-MSMVYVI01W28340EK899632K', '69T2ML7RNPPA2', 'sb-ky0ew26380582@personal.example.com', 150.00, 'USD', 'approved', '2023-06-26 09:37:40', '2023-06-26 09:37:40'),
(6, 'PAYID-MSM5ANQ42D60195Y1282372V', '69T2ML7RNPPA2', 'sb-ky0ew26380582@personal.example.com', 158.00, 'USD', 'approved', '2023-06-26 17:53:43', '2023-06-26 17:53:43'),
(7, 'PAYID-MSM5DEI2TL398064J185814D', '69T2ML7RNPPA2', 'sb-ky0ew26380582@personal.example.com', 59.00, 'USD', 'approved', '2023-06-26 17:57:48', '2023-06-26 17:57:48');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `content` text DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `discount` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `featured` varchar(255) DEFAULT NULL,
  `sku` varchar(255) DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `brand_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `slug`, `description`, `content`, `price`, `discount`, `quantity`, `featured`, `sku`, `category_id`, `brand_id`, `created_at`, `updated_at`) VALUES
(1, 'Nike Air Force 1 \'07 FlyEase', 'Nike-Air-Force-1-\'07-FlyEase', 'Quicker than 1, 2, 3—the original hoops shoe lets you step in and get going. Its easy-entry FlyEase system gives you a hands-free experience, while crisp leather dons the cleanest color for ultimate wearability. Yeah, it\'s everything you love and then some.', 'Air Force 1  Debuting in 1982 as a basketball must-have, the Air Force 1 came into its own in the \'90s. The clean look of the classic white-on-white AF1 was endorsed from the basketball courts to the block and beyond. Finding its rhythm in hip-hop culture, releasing limited collabs and colorways, Air Force 1 became an iconic sneaker around the globe. And with over 2000 iterations of this staple, its impact on fashion, music and sneaker culture can’t be denied.', 110, 99, NULL, 'Sale', 'NK1234', 8, 1, '2023-06-25 05:24:32', '2023-06-25 05:24:32'),
(2, 'Nike Air Max 1 Premium', 'Nike-Air-Max-1-Premium', 'You know your favorite jeans—perfectly worn, faded in all the right spots, so soft you don\'t even notice you\'re wearing \'em. Now imagine something even better than that. The Air Max 1 \"Dirty Denim\" nods to the coveted 2003 drop that brought an aged-to-perfection look to the leader of the sneaker pack. Rough \'em up, wear \'em every day—the premium leather and washed denim get better with time. With this throwback look, worn well and well worn have become 1 and the same.', 'You know your favorite jeans—perfectly worn, faded in all the right spots, so soft you don\'t even notice you\'re wearing \'em. Now imagine something even better than that. The Air Max 1 \"Dirty Denim\" nods to the coveted 2003 drop that brought an aged-to-perfection look to the leader of the sneaker pack. Rough \'em up, wear \'em every day—the premium leather and washed denim get better with time. With this throwback look, worn well and well worn have become 1 and the same.   Benefits  Originally designed for performance running, visible Air cushioning puts the history of comfort beneath your feet. Rubber Waffle outsole delivers traction, durability and heritage style. Padded, low-cut collar looks sleek and feels comfortable. Shown: Mineral Slate/Lemon Wash/Khaki/Deep Royal Blue Style: DV3050-300  Air Max 1  Sure, Air Max 1 started as a running shoe, but you can’t keep innovation contained. Adopted by hip-hop culture, this runner with a controversial exposed Air unit could be found anywhere from the heart of Brooklyn to the streets of London. Its cutting-edge design and striking colorways, to this day, are celebrated year after year.', 150, 134, NULL, 'Sale', 'NK1235', 8, 1, '2023-06-25 06:02:09', '2023-06-25 06:02:09'),
(3, 'Nike Air VaporMax 2023 Flyknit', 'Nike-Air-VaporMax-2023-Flyknit', 'Have you ever walked on Air? Step into the Air VaporMax 2023 to see how it\'s done. The innovative tech is revealed through the perforated sockliner (pull it out to see more). The stretchy Flyknit upper is made with at least 20% recycled content by weight.', 'Have you ever walked on Air? Step into the Air VaporMax 2023 to see how it\'s done. The innovative tech is revealed through the perforated sockliner (pull it out to see more). The stretchy Flyknit upper is made with at least 20% recycled content by weight.   Lighter Than Air  You\'ll be walking on Air and feeling lighter than it—this shoe weighs less than any other model with this Air unit so far.   Flying High  Stretchy and supportive Flyknit upper creates a striking visual that\'s seamless, breathable and feels as light as air.   More Benefits  The first 1-piece Air unit to run the entire length of a shoe, it allows for smoother transitions and adds unbelievable cushioning. Seamless collar sculpts the ankle and helps reduces hot spots.  Product Details  Rubber outsole Traditional lacing Not intended for use as Personal Protective Equipment (PPE) Shown: Pure Platinum/Pure Platinum/Pure Platinum/White', 210, NULL, NULL, '', 'NK1236', 8, 1, '2023-06-25 06:06:04', '2023-06-25 06:06:04'),
(4, 'Nike Air VaporMax Plus', 'Nike-Air-VaporMax-Plus', 'The Nike Air VaporMax Plus looks to the past and propels you into the future. Nodding to the 1998 Air Max Plus with its floating cage, padded upper and heel logo, it adds revolutionary VaporMax Air technology to ramp up the comfort and create a modern look.', 'The Nike Air VaporMax Plus looks to the past and propels you into the future. Nodding to the 1998 Air Max Plus with its floating cage, padded upper and heel logo, it adds revolutionary VaporMax Air technology to ramp up the comfort and create a modern look.   Benefits  Bringing beach life to the city, the prominent arch draws inspiration from a whale\'s tail and adds structure while the iconic wavy fingers nod to palm trees and ocean waves. Originally designed for performance running, Nike Air units provide lightweight cushioning that lasts. Bold, gradient colors add heritage style to this powerhouse Air Max. Synthetic upper adds lightweight comfort and durability. Full-length rubber outsole adds traction and durability to your journey.  Product Details  Pull tab Reflective details Not intended for use as Personal Protective Equipment (PPE) Shown: White/Pure Platinum/White Style: 924453-100  Nike Air VaporMax  After the 7-year journey from ideation to release, the Air VaporMax represents a new era in Nike innovation. To truly capture the feeling of “running on air,“ the designers restructured the Air unit to be attached directly to the upper. As you step down, each lug gets pushed into the Air unit, ramping up the pressure. Then, as you step off, the pressure releases creating springy bounce with superior flexibility. Made for runners, the futuristic technology was quickly adopted by the street, bringing this light-as-air feeling to the masses.', 210, 189, NULL, 'Sale', 'NK1237', 8, 1, '2023-06-25 06:09:22', '2023-06-25 06:09:22'),
(6, 'SAMBA ORIGINALS SHOES', 'SAMBA-ORIGINALS-SHOES', 'An icon for decades, adidas Samba shoes originated on the indoor field — but they\'re made for your everyday look. This edition takes design inspiration from Los Angeles soccer culture, shaping a clean look that stands out while keeping things low-key. A premium suede upper and classic gum sole are hallmarks of heritage style. Pair this casual confidence with everything from tapered pants to loose-fit denim.', 'Regular fit Lace closure Suede upper Textile lining Gum rubber outsole Imported Product color: Crystal White / Clay Strata / Gum Product code: ID2047', 100, NULL, NULL, 'New', 'AD1234', 1, 2, '2023-06-25 06:20:22', '2023-06-25 06:20:22'),
(7, 'SUPERSTAR SHOES', 'SUPERSTAR-SHOES', 'Originally made for basketball courts in the \'70s. Celebrated by hip hop royalty in the \'80s. The adidas Superstar shoe is now a lifestyle staple for streetwear enthusiasts. The world-famous shell toe feature remains, providing style and protection. Just like it did on the B-ball courts back in the day.\r\n\r\nNow, whether at a festival or walking in the street you can enjoy yourself without the fear of being stepped on.\r\n\r\nThe serrated 3-Stripes detail and adidas Superstar box logo adds OG authenticity to your look', 'Lace closure Leather upper Iconic leather shoes Rubber outsole Imported Product color: Cloud White / Core Black / Cloud White Product code: EG4958', 120, NULL, NULL, 'New', 'AD1001', 1, 2, '2023-06-25 06:29:31', '2023-06-25 06:29:31'),
(8, 'ADILETTE SLIDES', 'ADILETTE-SLIDES', 'The Adilette debuted in 1970 as a shower slide for the German national football team during the world\'s biggest match in Mexico before being officially released back in \'72. It\'s been a style mainstay of adidas ever since. These slides stay true to the original look with a contoured footbed and 3-Stripes across the bandage upper.', 'Regular fit Slip-on design PU-coated synthetic bandage upper Quick-dry lining Contoured footbed Polyurethane outsole Imported Product color: Core Black / White / Core Black Product code: 280647', 60, NULL, NULL, 'New', 'AD1002', 2, 1, '2023-06-25 06:38:24', '2023-06-25 06:38:24'),
(9, 'ADILETTE 22 SLIDES', 'ADILETTE-22-SLIDES', 'For the design of these adidas slides we looked to topographic maps illustrating expeditions to Mars and the dimensional stages of a new planet. And the futuristic vibes don\'t end there. They\'re built with material made in part from sugarcane, one step on the road to a more sustainable future. Wear them on diverse terrain from wet to dry.\r\n\r\nThese slides are made with natural and renewable materials as part of our journey to design out finite resources and help end plastic waste.', 'Slip-on Bandage upper Bio-based EVA material made with 25% plant-based content derived from sugarcane Minimum of 50% natural and renewable materials Imported Product color: Light Brown / Light Brown / Core Black Product code: HQ4670', 55, NULL, NULL, 'New', 'AD1003', 2, 2, '2023-06-25 06:41:45', '2023-06-25 06:41:45'),
(12, 'STAN SMITH SHOES', 'STAN-SMITH-SHOES', 'Timeless appeal. Effortless style. Everyday versatility. For over 50 years and counting, adidas Stan Smith Shoes have continued to hold their place as an icon. This pair shows off a fresh redesign as part of adidas\' commitment to use only recycled polyester by 2024. With a vegan upper and an outsole made from rubber waste, they still have iconic style, they\'re just made with the planet in mind.\r\n\r\nThis product is made with vegan alternatives to animal-derived ingredients or materials. It is also made with Primegreen, a series of high-performance recycled materials. 50% of upper is recycled content. No virgin polyester.', 'Regular fit Lace closure Synthetic lining Rubber outsole Vegan Imported Product color: Cloud White / Cloud White / Collegiate Navy Product code: FX5501', 100, NULL, NULL, 'New', 'AD1007', 1, 2, '2023-06-25 06:57:56', '2023-06-25 06:57:56'),
(13, 'STAN SMITH CAPTAIN HOOK SHOES', 'STAN-SMITH-CAPTAIN-HOOK-SHOES', 'For over 50 years, the adidas Stan Smith sneaker has solidified its place as a style icon. Now the classic silhouette gets a magical update with these shoes inspired by Captain Hook, from Disney\'s \"Peter Pan.\" Make a statement with the deep red synthetic suede upper that will add a pop to any outfit. The heel patches are a reminder that \"It\'s not easy being green,\" so it\'s important to do our best for the planet.\r\n\r\nMade with a series of recycled materials, this upper features at least 50% recycled content. This product represents just one of our solutions to help end plastic waste.', 'Regular fit Lace closure Synthetic suede upper Synthetic leather lining Graphics on sockliner Rubber outsole ©Disney Upper contains a minimum of 50% recycled content Imported Product color: Pantone / Pantone / Core Black Product code: HP5581', 100, 69, NULL, 'Sale', 'AD1008', 1, 2, '2023-06-25 07:03:07', '2023-06-25 07:03:07'),
(14, 'STAN SMITH SHOES', 'STAN-SMITH-SHOES', 'Timeless appeal. Effortless style. Everyday versatility. For over 50 years and counting, adidas Stan Smith Shoes have continued to hold their place as an icon. This pair shows off a fresh redesign as part of adidas\' commitment to use only recycled polyester by 2024. With a vegan upper and an outsole made from rubber waste, they still have iconic style, they\'re just made with the planet in mind.\r\n\r\nThis product is made with vegan alternatives to animal-derived ingredients or materials. It is also made with Primegreen, a series of high-performance recycled materials. 50% of upper is recycled content. No virgin polyester', 'Regular fit Lace closure Synthetic lining Rubber outsole Vegan Imported Product color: Cloud White / Cloud White / Green Product code: FX5502', 100, NULL, NULL, 'New', 'AD1010', 1, 2, '2023-06-25 07:12:23', '2023-06-25 07:12:23'),
(15, 'SAMBA OG SHOES', 'SAMBA-OG-SHOES', 'Born on the soccer field, the Samba is a timeless icon of street style. These shoes stay true to their legacy with a soft leather upper and suede overlays.', 'Regular fit Lace closure Full grain leather upper with gritty suede and gold foil details Synthetic leather lining; Gum rubber cupsole Gum rubber midsole Imported Product color: Cloud White / Green / Supplier Colour Product code: IG1024', 110, NULL, NULL, 'New', 'AD1011', 1, 2, '2023-06-25 07:16:23', '2023-06-25 07:16:23'),
(22, 'Jordan Retro 6 G NRG', 'Jordan-Retro-6-G-NRG', 'Feel unbeatable from the tee box to the final putt in a design is pure early MJ: speed, class and laden with true early \'90s touches like visible Air and a translucent plastic sole that continue to stand the test of time. This model fuses the strut of 1st MJ’s championship with some of our best golf technology, helping you make a statement of confidence when it comes time to tame the course. With its deep, rich red accents and creamy white tones this version celebrates MJ\'s favorite beverage, 1 that goes down smooth with a big plate of barbecue and a side of cobbler while basking in warmhearted hospitality.', '2-year waterproof warranty Spiked design for added grip and stability Shown: White/Bordeaux/White Style: DV6796-116', 200, NULL, NULL, 'New', 'JD1001', 1, 3, '2023-06-25 08:08:17', '2023-06-25 08:08:17'),
(28, 'Air Jordan 1 Retro High OG', 'Air-Jordan-1-Retro-High-OG', 'No such thing as a perfect marriage, but this one comes pretty close. The classic AJ1 silhouette gets blessed with the most iconic element of the AJ3—you know what it is—proving that two icons are made even better together. Black, White and Tech Grey create a modern neutral colorway that will set off any \'fit, and premium materials will keep you on your feet all day. Cheers to the happy couple.', 'Classic leather offers durability and structure. Encapsulated Nike Air-Sole unit provides lightweight cushioning. Solid rubber outsole gives you traction on a variety of surfaces. Shown: Tech Grey/Black/White/Muslin Style: DZ5485-052', 200, NULL, NULL, 'New', 'JD1007', 1, 3, '2023-06-25 08:34:17', '2023-06-25 08:34:17'),
(29, 'Air Jordan 5 Retro SE Craft', 'Air-Jordan-5-Retro-SE-Craft', 'Bring some pop to your look with the AJ5, the shoe that\'s recognizably cool. All the original elements are here: lace toggles, premium leather and that unmissable midsole. Updated with new colors and textures, here\'s a shoe that keeps every look fresh.', 'Nike Air units provide lightweight cushioning. Genuine and synthetic leather and textile materials provide structure and durability. Lace toggle completes the iconic design. Shown: Light Orewood Brown/Flat Pewter/Sail/Safety Orange Style: FD9222-180', 210, NULL, NULL, 'New', 'JD1008', 1, 3, '2023-06-25 08:38:21', '2023-06-25 08:38:21'),
(30, 'Tatum 1 \"Pink Lemonade\"', 'Tatum-1-\"Pink-Lemonade\"', 'On those days when the sun just won\'t let up and your brow’s wet with sweat, what’s more refreshing than a glass of ice-cold lemonade? Nothing! The Tatum 1 \"Pink Lemonade\" is all about those summertime vibes. Bright, season-right pinks and yellows will make you get your sunglasses out—and check out the tongue pull tab for a nod to JT\'s son.', NULL, 220, 99, NULL, 'Sale', 'JD1009', 1, 1, '2023-06-25 08:41:27', '2023-06-25 08:41:58'),
(31, 'Air Jordan XXXVII Low GC', 'Air-Jordan-XXXVII-Low-GC', 'You\'ve got the hops and the speed—lace up in shoes that enhance what you bring to the court. The latest AJ is all about takeoffs and landings, with multiple Nike Air units to get you off the ground. The upper is made with strong, reinforced leno-weave fabric that\'ll keep you contained and leave your game uncompromised.\r\n\r\n\r\nLight and Secure\r\n\r\nThe strong, lightweight upper is designed to mimic the support given by a taped up ankle. It\'s made from layers of leno-weave and TPU ribbon that hold tight without weighing you down.\r\n\r\n\r\nAir on Air\r\n\r\nDouble stacked Nike Zoom Air units give you energy-returning responsiveness, helping you stop and start on a dime.\r\n\r\n\r\nAssisted Crash Landing\r\n\r\nFormula 23, Jordan\'s signature foam, is stacked thick in the heel so you can come down as hard as necessary— and bounce right back.', 'Top line shape and Jordan Air on the tongue nod to the AJ7\'s iconic look. Upper design is a throw back to the exoskeleton style of the AJ7. Shown: Black/Lilac Ice/Hydrogen Blue/Orange Chalk Style: FD8701-001', 210, 199, NULL, 'Sale', 'JD1010', 1, 3, '2023-06-25 08:46:34', '2023-06-25 08:46:34'),
(32, 'Jordan One Take 4', 'Jordan-One-Take-4', 'Get that speed you need, just like Russ. Inspired by Russell Westbrook\'s latest signature shoe, the outsole of the Jordan One Take 4 wraps up nearly to the midsole so you can start, stop or change direction in an instant. Meanwhile, energy-returning Zoom Air cushioning in the forefoot keeps you goin\' (and goin\', and goin\').\r\n\r\n\r\nUp-Front Response\r\n\r\nThe Zoom Air unit in the forefoot is top-loaded, bringing the responsive sensation closer to your foot when you\'re driving hard down the court.\r\n\r\n\r\nCool Containment\r\n\r\nMade with synthetic leather, ripstop and mesh, the airy-yet-durable upper keeps you contained with a unique, asymmetrical design. Lock loops give your feet even more security on the court.', 'Midfoot plate runs through the shoe for added stability. Herringbone outsole provides ample traction. Shown: White/Canyon Gold/Pinksicle/Court Purple Style: DO7193-100', 200, NULL, NULL, 'New', 'JD1011', 1, 3, '2023-06-25 08:50:14', '2023-06-25 08:50:14'),
(33, 'Air Jordan XXXVII Low', 'Air Jordan XXXVII Low', 'You\'ve got the hops and the speed—lace up in shoes that enhance what you bring to the court. The latest AJ is all about takeoffs and landings, with multiple Air units to get you off the ground and Formula 23 foam to cushion your impact. The upper is made with strong, reinforced leno-weave fabric that\'ll keep you contained no matter how fast you move—and leave your game uncompromised.\r\n\r\n\r\nLight and Secure\r\n\r\nThe strong, lightweight upper—designed to mimic the support given by a taped up ankle—is made from layers of leno-weave fabric and TPU ribbon that hold tight without weighing you down.\r\n\r\n\r\nAir on Air\r\n\r\nDouble stacked Air—a forefoot Air Strobel unit and a Zoom Air unit—give you energy-returning responsiveness, letting you stop and start on a dime.\r\n\r\n\r\nAssisted Crash Landing\r\n\r\nFormula 23, Jordan\'s signature foam, is stacked thick in the heel so you can come down hard and bounce right back.', 'Top line shape and Jordan on the tongue nod to the AJ7\'s iconic design. Upper design is a throw back to the exoskeleton style of the AJ7. Shown: Military Blue/Midnight Navy/True Red/White Style: DV9909-401', 240, NULL, NULL, 'New', 'JD1013', 1, 3, '2023-06-25 08:54:38', '2023-06-25 08:54:38'),
(34, 'Air Jordan XXXVII Low', 'Air-Jordan-XXXVII-Low', 'You\'ve got the hops and the speed—lace up in shoes that enhance what you bring to the court. The latest AJ is all about takeoffs and landings, with multiple Air units to help get you off the ground and Formula 23 foam to ease your impact. The upper is made with strong, reinforced leno-weave fabric that\'ll keep you feeling contained—and leave your game uncompromised.\r\n\r\n\r\nLight and Secure\r\n\r\nThe strong, lightweight upper is designed to mimic the support given by a taped up ankle. It\'s made from layers of leno-weave and TPU ribbon that hold tight without weighing you down.\r\n\r\n\r\nAir on Air\r\n\r\nDouble stacked Air—an Air Strobel unit and a Zoom Air unit in the forefoot—give you energy-returning responsiveness, letting you stop and start on a dime.\r\n\r\n\r\nAssisted Crash Landing\r\n\r\nFormula 23, Jordan\'s signature foam, is stacked thick in the heel so you can come down as hard as necessary— and bounce right back.', 'Top line shape and Jordan Air on the tongue nod to the AJ7\'s iconic look. Upper design is a throw back to the exoskeleton style of the AJ7. Shown: Black/University Red/Bright Concord/White Style: DQ4122-061', 210, 199, NULL, 'Sale', 'JD1014', 1, 3, '2023-06-25 08:58:51', '2023-06-25 08:58:51'),
(35, 'YEEZY 450 RESIN', 'YEEZY-450-RESIN', 'adidas + YEEZY announce the YEEZY 450 Resin. It will be available globally on December 17, 2021, with a recommended retail price of €/$200.\r\n\r\nThe YEEZY 450, the first YEEZY model to be made in Germany, features a unique design language with an industry-leading technology that uses advanced automated manufacturing throughout the production process. The one-piece premium knit and sock-like construction provides and adaptable fit with exceptional comfort. Meanwhile, a soft PU-injected midsole compound offers high-performance rebound and cushioning, delivering an innovative, one-of-a-kind aesthetic.', 'The YEEZY 450 Resin will be available on adidas.com/YEEZY, on CONFIRMED in Northa America and Europe, on the adidas app in select countries, in select retailers, and on YEEZY SUPPLY.', 300, NULL, NULL, 'New', 'YZ1001', 1, 4, '2023-06-25 09:07:35', '2023-06-25 09:07:35'),
(36, 'YEEZY SLIDE PURE AND THE YEEZY SLIDE OCHRE', 'YEEZY-SLIDE-PURE-AND-THE-YEEZY-SLIDE-OCHRE', 'adidas + YEEZY announce the YEEZY SLIDE Pure and the YEEZY SLIDE Ochre.\r\n\r\nThe YEEZY SLIDE Pure will be launching globally on December 13, 2021. Recommended retail price is €/$60.\r\n\r\nThe YEEZY SLIDE Ochre will be launching globally in adults, kids, and infant sizes on December 13, 2021. Recommended retail price €/$60 adult, €/$45 kids, €/$35 infants.', 'The YEEZY SLIDE features injected EVA foam to provide lightweight durability, while the soft top layer in the footbed offers immediate step in comfort. The outsole utilizes grooves for optimal flexibility and traction.  The YEEZY SLIDE Pure and Ochre will be available on adidas.com/YEEZY, on CONFIRMED in North America and Europe, on the adidas app in select countries, at select retailers, and on YEEZY SUPPLY.', 100, NULL, NULL, 'New', 'YZ1001', 2, 4, '2023-06-25 09:13:19', '2023-06-25 09:13:19'),
(37, 'YEEZY BOOST 350 V2 BELUGA RF / STEEPLE GREY / SOLAR RED', 'YEEZY-BOOST-350-V2-BELUGA-RF-/-STEEPLE-GREY-/-SOLAR-RED', 'adidas + YEEZY announce the YEEZY BOOST 350 V2 Beluga RF/Steeple Grey/Solar Red. It will be available globally on December 18, 2021 with a recommended retail price €/$240 adult, €/$160 kids, €/$140infant.\r\n\r\nThe YEEZY BOOST 350 V2 Beluga RF/Steeple Grey/Solar Red features an upper composed of multi-toned re-engineered primeknit with reflective threading. The post-dyed monofilament side stripe is woven into the upper. The midsole utilizes adidas’ innovative BOOST™ technology.', 'The YEEZY BOOST 350 V2 Beluga RF/Steeple Grey/Solar Red will be available on adidas.com/YEEZY, on CONFIRMED in North America and Europe, on the adidas app in select countries, in select retailers, and on YEEZY SUPPLY.', 350, 300, NULL, 'Sale', 'YZ1003', 1, 4, '2023-06-25 09:17:01', '2023-06-25 09:17:01'),
(38, 'YZY 350 V2 CMPCT SLATE BLUE', 'YZY-350-V2-CMPCT-SLATE-BLUE', 'adidas + YEEZY announce the YZY 350 V2 CMPCT Slate Blue. It will be available exclusively in the United States on December 6, 2021. Recommended retail price of €/$220.\r\n\r\nThe YZY 350 V2 CMPCT Slate Blue is highlighted by an engineered 3D knitted upper that provides a tight sock-like fit and premium lockdown support while no-tie stretch laces allows for easy on and off wear. The midsole utilizes adidas’ innovative BOOST™ technology to off the ultimate underfoot cushioning experience. The YZY 350 V2 CMPCT is made with a series of recycled materials, and at least 50% of the upper features recycled content, this product represents just one of our solutions to help end plastic waste.', 'The YZY 350 V2 CMPCT Slate Blue will be available on CONFIRMED, in select retailers, and on YEEZY SUPPLY.', 290, NULL, NULL, 'New', 'YZ1004', 1, 4, '2023-06-25 09:20:33', '2023-06-25 09:20:33'),
(39, 'YEEZY 700 V3 COPPER FADE', 'YEEZY-700-V3-COPPER-FADE', 'adidas + YEEZY announce the YEEZY 700 V3 Copper Fade. It will be available globally on December 10, 2021, with a recommended retail price of €/$200 adult.\r\n\r\nThe YEEZY 700 V3 Copper Fade features an upper composed of monofilament engineered mesh with RPU overlays for structure and durability while the bootie construction provides a snug adaptable fit. This model features no-tie stretch laces for easy on and off wear and comes equipped with a second set of standard laces. The PU encapsulated EVA midsole provides comfort and durability, and the herringbone rubber outsole offers unique design cues and improved traction.', 'The YEEZY 700 V3 Copper Fade will be available on adidas.com/YEEZY, on CONFIRMED in North America and Europe, on the adidas app in select countries, in select retailers, and on YEEZY SUPPLY.', 380, NULL, NULL, 'New', 'YZ1005', 1, 4, '2023-06-25 09:23:39', '2023-06-25 09:23:39'),
(40, 'YZY FOAM RUNNER MX SAND GREY', 'YZY-FOAM-RUNNER-MX-SAND-GREY', 'adidas + YEEZY announce the YZY FOAM RUNNER MX Sand Grey. It will be available globally on December 11, 2021, with a recommended retail price of €/$80 adults, €/$60 kids, €/$40 infant.\r\n\r\nThe YZY FOAM RUNNER features injected EVA foam to provide lightweight durability. This model is made using algae harvesting technology that helps to keep lakes clean. The soft top layer in the footbed offers immediate step in comfort. The strategically mapped vents around the foot provide air flow and breathability. Additionally, the YZY FOAM RUNNER will usher in a new box construction that does not require an additional shipping box when shipped, which leads to less cardboard material waste.', 'The YZY FOAM RUNNER MX Sand Grey will be available on adidas.com/YEEZY, on CONFIRMED in North America and Europe, on the adidas app in select countries, in select retailers, and on YEEZY SUPPLY.', 375, NULL, NULL, 'New', 'YZ1006', 1, 4, '2023-06-25 09:27:14', '2023-06-25 09:27:14'),
(41, 'YEEZY 500 ASH GREY', 'YEEZY-500-ASH-GREY', 'adidas + YEEZY announce the YEEZY 500 ASH GREY. It will be available globally on December 4, 2021, with a recommended retail price of €/$200.\r\n\r\nThe YEEZY 500 ASH GREY features an upper composed of full-grain leather and suede overlays that offer a premium finish, soft hand feel, along with a supportive and durable wear. Mesh upper provides lightweight breathability and comfort where it is needed, while reflective piping details add unique design cues and visual interest. A rubber wrap along the midsole provides support and abrasion resistance. The Adiprene+ cushioning absorbs impact and optimizes rebound while a light rubber outsole provides traction.', 'The YEEZY 500 ASH GREY will be available on adidas.com/YEEZY, on CONFIRMED in North America and Europe, on the adidas app in select countries, in select retailers, and on YEEZY SUPPLY.', 500, NULL, NULL, 'New', 'YZ1009', 1, 4, '2023-06-25 09:32:20', '2023-06-25 09:32:20'),
(42, 'YZY QNTM AMBER TINT', 'YZY-QNTM-AMBER-TINT', 'adidas + YEEZY announce the YZY QNTM Amber Tint. It will be available globally on December 3, 2021, with a recommended retail price of €/$250 adult, €/$180 kids, €/$160infant.\r\n\r\nThe YZY QNTM Amber Tint features an upper composed of embroidered mono mesh that provides a soft, resilient thread with a synthetic suede overlay that offers toe protection and durability. Reflective material throughout the inner webbing and heel counter emits light in darkness. The YZY QNTM elevates the cushioning experience with a re-engineered full-length drop-in boost midsole that provides optimal comfort where consumers need it most. A semi-translucent clear TPU cage wraps the boost and adds a distinct design element to the model while the herringbone patterned rubber outsole offers optimal traction.', 'The YZY QNTM Amber Tint will be available on adidas.com/YEEZY, on CONFIRMED in North America and Europe, on the adidas app in select countries, in select retailers, and on YEEZY SUPPLY.', 340, NULL, NULL, 'New', 'YZ1010', 1, 4, '2023-06-25 09:35:24', '2023-06-25 09:35:24'),
(43, 'Nike Cortez SE', 'Nike-Cortez-SE', 'The Nike Cortez SE brings back an iconic track style with a seasonal twist. Crafted with crisp leather and soft suede, these sneakers feature the same design lines and herringbone-patterned outsole as the original. Lilac accents add a whimsical touch for a look that feels fresh right out of the box.', 'Benefits  Inspired by the \'72 original, a foam midsole with iconic wedge insert helps deliver comfort from the get-go. Leather upper adds durability to a timeless classic. Padded, low-cut collar looks sleek and feels great. Herringbone outsole pattern pairs durable traction with Nike DNA. Shown: Sail/Sail/Club Gold/Iced Lilac Style: FJ4608-133', 100, NULL, NULL, NULL, 'NK1653', 1, 1, '2023-06-26 07:23:59', '2023-06-26 15:20:48'),
(44, 'Nike Air Max 270', 'Nike-Air-Max-270', 'Legendary Air gets lifted. Our first lifestyle Air Max brings you comfort, bold style and 270 degrees of Air to showcase one of our greatest innovations yet. Add a lightweight, airy upper and a low-cut collar and you\'ve got the perfect got-to kicks for everyday fun.', 'Benefits  Knit fabric on upper provides lightweight fit and airy feel to help your feet stay cool. Max Air 270 unit delivers unrivaled, all-day comfort. Stretchy inner sleeve and booty-like construction creates fit that feels personalized. Foam midsole feels soft and comfortable. Rubber on the outsole adds traction and durability.  Product Details  Pull tabs on heels Toe tip for durability Shown: White/Pearl Pink/Football Grey/Medium Soft Pink Style: FJ4575-100', 160, NULL, NULL, NULL, 'NK2561', 1, 1, '2023-06-26 07:27:45', '2023-06-26 15:25:00'),
(45, 'Nike Air Max 97 SE', 'Nike-Air-Max-97-SE', 'Fluff it up with this cheerful twist on the classic Air Max 97. A soft Swoosh logo and laces bring out the warm fuzzies, and the water-inspired design flows whether you\'re out for a walk or a night on the town. Full-length Nike Air cushioning lets you ride in performance comfort.', 'Benefits  Hidden lacing system delivers streamlined look. Foam midsole delivers plush cushioning. Rubber outsole adds traction and durability.  Product Details  Not intended for use as Personal Protective Equipment (PPE) Shown: White/Pink Foam/Pink Spell Style: FJ4549-100', 180, 160, NULL, 'sale', 'NK4321', 1, 1, '2023-06-26 07:31:27', '2023-06-26 15:32:48'),
(46, 'Dunk Low Sequoia and Alabaster', 'Dunk-Low-Sequoia-and-Alabaster', 'Skip work, skip school, skip rocks. Whatever your angle, this trophy catch from the Nike hatchery is the perfect look to take you straight to your secret fishing hole. With colors inspired by Brook, Rainbow and Cutthroat Trout, this fresh look is more head-turning than a rare one caught in the Pacific wonderland. The iridescent fish-scale Swoosh and woven ripstop underlays are certain to hook you, while graphics on the tongue and insole add bite to every step. Time to get fishin\'.', 'A union of icons. Upping your game with premium black leather and elephant print overlays, the sneaker that started it all is now decked out in the unmistakable details of the AJ3. Extra laces let you customize your look straight out the gate, and the elephant print shoebox is the perfect addition to your collection.', 110, NULL, NULL, NULL, 'NK2435', 1, 1, '2023-06-26 07:36:26', '2023-06-26 15:33:15'),
(47, 'Nike Blazer Mid \'77', 'Nike-Blazer-Mid-\'77', 'Styled for the ‘70s. Loved in the ‘80s. Classic in the ‘90s. Ready for the future. The Nike Blazer Mid ’77 delivers a timeless design that’s easy to wear. Its unbelievably crisp leather upper breaks in beautifully and pairs with bold retro branding and luscious suede accents for a premium feel. Exposed foam on the tongue and a special midsole finish make it look like you’ve just pulled them from the history books. Go ahead, perfect your outfit.', 'Benefits  Leather and synthetic upper looks crisp and is easy to style. Vintage treatment on the midsole adds the perfect touch of retro. Autoclave construction fuses the outsole to the midsole for a streamlined look that’s timeless. Exposed foam on the tongue provides a throwback look. Non-marking, solid-rubber outsole with herringbone pattern for excellent traction and durability that leaves the imprint you love. Shown: White/Sail/Peach/Black Style: CZ1055-100', 105, NULL, NULL, NULL, 'NK4891', 1, 1, '2023-06-26 07:39:28', '2023-06-26 15:33:51'),
(48, 'Yeezy Silde Cloud', 'Yeezy-Silde-Cloud', 'Foam sole\r\nThe adidas Yeezy Slide “Pure” is one of three earth tone colorways of the comfortable slip-on sandal to be released by Kanye West and adidas in April 2021\r\nReleasing next to the “Core” and “Resin” styles, the “Pure” features a beige-colored lightweight EVA foam construction for maximum comfort whether walking through the city streets or relaxing poolside\r\nLike all Yeezy Slides, the midfoot arch stabilizes the foot and the ridged outsole ensures grip on slippery surfaces\r\nRelease date: April 26, 2021.', 'The adidas Yeezy Slide “Pure” is one of three earth tone colorways of the comfortable slip-on sandal to be released by Kanye West and adidas in April 2021. Releasing next to the “Core” and “Resin” styles, the “Pure” features a beige-colored lightweight EVA foam construction for maximum comfort whether walking through the city streets or relaxing poolside. Like all Yeezy Slides, the midfoot arch stabilizes the foot and the ridged outsole ensures grip on slippery surfaces. Release date: April 26, 2021.', 200, NULL, NULL, 'Best', 'YZ1281', 2, 4, '2023-06-26 07:43:27', '2023-06-26 07:43:27'),
(49, 'adidas Mens Yeezy Foam Runner', 'adidas-Mens-Yeezy-Foam-Runner', '100% Leather\r\nImported\r\nRubber sole\r\nShaft measures approximately Ankle from arch\r\nHeel measures approximately 0.5\"\r\nInjected EVA foam upper is more water-friendly & more durable than others of its kind External rear heel sling BLOOM performance midsole foam is made of 10% algae biomass, transforming green water into clean water in the process FloatPro Foam midsole for a lightweight ride that lasts', 'Using advanced construction techniques, this easy on / easy off shoe is more durable that others of its kind--for days spent in and around water.', 480, NULL, NULL, 'Best', 'YZ1035', 1, 4, '2023-06-26 07:47:10', '2023-06-26 07:47:10'),
(50, 'adidas Mens Yeezy 350 V2 GY7164 Dazzling Blue', 'adidas-Mens-Yeezy-350-V2-GY7164-Dazzling-Blue', 'Rubber sole\r\nThe adidas Yeezy Boost 350 V2 “Dazzling Blue” is a February 2022 release of Kanye West’s most popular signature shoe in a colorway that mimics the appearance of styles from the model’s “Black Friday 2016” pack\r\nThe “Dazzling Blue” utilizes a similar color block to Yeezy Boost 350 V2 colorways from the “Black Friday 2016” collection in that it features a black woven Primeknit upper with a contrasting side stripe, which in this case appears in “Dazzling Blue\"\r\nReverse “SPLY-350” branding is found within the royal blue stripe\r\nBlack laces appear on top of the shoe in spite of its sock-like appearance\r\nThe “Dazzling Blue” rides on adidas’s Boost cushioning technology that’s encased within the black ribbed midsole', 'The adidas Yeezy Boost 350 V2 “Dazzling Blue” is a February 2022 release of Kanye West’s most popular signature shoe in a colorway that mimics the appearance of styles from the model’s “Black Friday 2016” pack. The “Dazzling Blue” utilizes a similar color block to Yeezy Boost 350 V2 colorways from the “Black Friday 2016” collection in that it features a black woven Primeknit upper with a contrasting side stripe, which in this case appears in “Dazzling Blue.” Reverse “SPLY-350” branding is found within the royal blue stripe. Black laces appear on top of the shoe in spite of its sock-like appearance. The “Dazzling Blue” rides on adidas’s Boost cushioning technology that’s encased within the black ribbed midsole. Release date: February 26, 2022', 400, NULL, NULL, 'Best', 'YZ1822', 1, 4, '2023-06-26 07:48:46', '2023-06-26 07:48:46'),
(51, 'Adidas Gradas Cloud White', 'adidas-gradas-cloud-white', 'The ADIDAS GRADAS CLOUD WHITE sneakers are a stylish and versatile footwear option. With their sleek design and clean lines, these shoes offer a contemporary look that complements various outfits. The cloud white color adds a touch of sophistication and elegance to your ensemble. Crafted with high-quality materials, these sneakers ensure durability and comfort throughout the day. Whether you\'re heading to the gym, running errands, or meeting friends, the ADIDAS GRADAS CLOUD WHITE sneakers are a perfect choice for fashion-forward individuals.', 'The ADIDAS GRADAS CLOUD WHITE sneakers combine style and functionality in one package. These sneakers feature a modern design with a cloud white color scheme that exudes a sense of class and sophistication. Made from premium materials, they offer excellent durability and long-lasting performance. The comfortable fit and cushioned insole provide maximum comfort, making them suitable for all-day wear. Whether you\'re going for a casual look or dressing up, these sneakers effortlessly elevate your outfit. Step out with confidence and embrace the sleek aesthetic of the ADIDAS GRADAS CLOUD WHITE sneakers.', 159, NULL, NULL, 'new', NULL, 9, 2, NULL, NULL),
(52, 'Adidas Nmd R1 Refined', 'adidas-nmd-r1-refined', 'The ADIDAS NMD R1 REFINED sneakers are a stylish and modern footwear option. Featuring a sleek and streamlined design, these shoes offer a contemporary look that effortlessly blends with any outfit. The refined color palette adds a touch of sophistication and versatility to your wardrobe. Crafted with premium materials, these sneakers provide durability and comfort for all-day wear. Whether you\'re exploring the city, hanging out with friends, or running errands, the ADIDAS NMD R1 REFINED sneakers are the perfect choice for individuals who appreciate both style and comfort.', 'Experience the perfect fusion of style and comfort with the ADIDAS NMD R1 REFINED sneakers. These sneakers boast a sleek and refined design that sets them apart from the crowd. The carefully chosen color palette enhances their versatility, allowing you to effortlessly pair them with various outfits. Made with high-quality materials, these sneakers offer exceptional durability and long-lasting performance. The cushioned insole and responsive midsole provide superior comfort, making them ideal for everyday wear. Whether you\'re strolling through the urban jungle or meeting up with friends, the ADIDAS NMD R1 REFINED sneakers deliver both fashion and functionality. Step up your footwear game with these stylish and comfortable sneakers.', 210, 196, 5, 'sale', 'NK00258', 9, 2, NULL, NULL),
(53, 'Nike Zoom Court Pro HC', 'nike-zoom-court-pro-hc', 'The Nike Zoom Court Pro HC sneakers are a versatile and performance-driven option for tennis enthusiasts. Designed with the needs of athletes in mind, these shoes offer exceptional stability and support on the court. The sleek and stylish design adds a touch of sophistication to your tennis attire. The Zoom Air technology provides responsive cushioning and energy return, enhancing your agility and speed during matches. With their durable construction and grippy outsole, these sneakers are built to withstand the demands of intense gameplay. Whether you\'re a casual player or a competitive athlete, the Nike Zoom Court Pro HC sneakers are designed to elevate your performance on the tennis court.', 'Elevate your tennis game with the Nike Zoom Court Pro HC sneakers. These sneakers are meticulously crafted to provide optimal performance and style on the court. The sleek and modern design showcases your sense of fashion while offering the functionality you need for intense gameplay. The Zoom Air technology in the midsole delivers responsive cushioning and superior energy return, ensuring explosive movements and quick direction changes. The supportive upper construction keeps your feet secure during lateral movements and sharp turns. The durable outsole with a herringbone pattern provides excellent traction on various court surfaces, allowing you to make precise movements with confidence. Whether you\'re a recreational player or a competitive athlete, the Nike Zoom Court Pro HC sneakers are the perfect companion for your tennis journey. Step onto the court with style, comfort, and enhanced performance.', 146, NULL, 18, NULL, 'Nk2589', 9, 1, NULL, NULL),
(54, 'Air Max Command', 'air-max-command', 'The Air Max Command sneakers are a classic and timeless option from Nike\'s iconic Air Max collection. With their retro-inspired design, these shoes offer a perfect blend of style and comfort. The Air Max cushioning technology in the midsole provides superior impact absorption and lightweight support, allowing for a smooth and cushioned stride. The breathable upper materials and padded collar offer a snug and comfortable fit. The versatile color options and signature Nike branding make these sneakers a stylish choice for both casual and athletic wear. Step up your footwear game with the Air Max Command sneakers and experience the perfect combination of fashion and functionality.', 'Embrace the classic and iconic style of the Air Max Command sneakers. These shoes pay homage to the retro designs of Nike\'s Air Max collection while incorporating modern comfort and performance features. The visible Air Max unit in the heel delivers responsive cushioning, reducing the impact on your feet and joints during every step. The breathable mesh upper keeps your feet cool and comfortable, while the padded collar provides additional support and a secure fit. Whether you\'re hitting the gym, running errands, or simply exploring the city, these sneakers effortlessly elevate your outfit. The versatile color options allow you to express your personal style, while the iconic Nike branding adds a touch of authenticity. Step into the Air Max Command sneakers and experience the perfect blend of timeless style and all-day comfort.', 189, NULL, NULL, 'New', 'Nk5588', 9, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_comments`
--

CREATE TABLE `product_comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `messages` varchar(255) DEFAULT NULL,
  `rating` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_comments`
--

INSERT INTO `product_comments` (`id`, `product_id`, `user_id`, `name`, `email`, `messages`, `rating`, `created_at`, `updated_at`) VALUES
(5, 29, 8, NULL, NULL, NULL, NULL, '2023-07-02 14:32:41', '2023-07-02 14:32:41');

-- --------------------------------------------------------

--
-- Table structure for table `product_details`
--

CREATE TABLE `product_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `size` double DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_details`
--

INSERT INTO `product_details` (`id`, `product_id`, `size`, `quantity`, `color`, `created_at`, `updated_at`) VALUES
(1, 1, 36, 10, 'white', '2023-06-25 05:26:35', '2023-06-25 05:26:35'),
(2, 1, 37, 10, 'blue', '2023-06-25 06:02:48', '2023-06-25 06:02:48'),
(3, 2, 39, 10, 'blue', '2023-06-25 06:04:27', '2023-06-25 06:04:27'),
(4, 3, 39, 2, 'white', '2023-06-25 06:06:31', '2023-06-25 06:06:31'),
(5, 7, 42, 6, 'white', '2023-06-25 06:31:40', '2023-06-25 06:31:40'),
(6, 6, 39, 2, 'black', '2023-06-25 06:32:29', '2023-06-25 06:32:29'),
(7, 4, 40, 2, 'white', '2023-06-25 06:32:54', '2023-06-25 06:32:54'),
(8, 7, 43, 2, 'white', '2023-06-25 06:33:42', '2023-06-25 06:33:42'),
(9, 7, 44, 4, 'black', '2023-06-25 06:34:13', '2023-06-25 06:34:13'),
(10, 7, 45, 4, 'white', '2023-06-25 06:34:50', '2023-06-25 06:34:50'),
(11, 8, 37, 7, 'black', '2023-06-25 06:40:01', '2023-06-25 06:40:01'),
(12, 9, 40, 12, 'yellow', '2023-06-25 06:45:29', '2023-06-25 06:45:29'),
(15, 12, 40, 5, 'white', '2023-06-25 06:58:18', '2023-06-25 06:58:18'),
(16, 13, 39, 2, 'red', '2023-06-25 07:03:26', '2023-06-25 07:03:26'),
(17, 14, 41, 6, 'white', '2023-06-25 07:12:39', '2023-06-25 07:12:39'),
(18, 15, 40, 2, 'white', '2023-06-25 07:16:48', '2023-06-25 07:16:48'),
(25, 22, 39, 9, 'white', '2023-06-25 08:08:31', '2023-06-25 08:08:31'),
(31, 28, 41, 10, 'white', '2023-06-25 08:34:31', '2023-06-25 08:34:31'),
(32, 29, 40, 7, 'white', '2023-06-25 08:38:40', '2023-06-25 08:38:40'),
(33, 30, 42, 7, 'red', '2023-06-25 08:42:51', '2023-06-25 08:42:51'),
(34, 31, 39, 5, 'blue', '2023-06-25 08:46:58', '2023-06-25 08:46:58'),
(35, 32, 39, 5, 'white', '2023-06-25 08:50:49', '2023-06-25 08:50:49'),
(36, 33, 38, 11, 'blue', '2023-06-25 08:54:59', '2023-06-25 08:54:59'),
(37, 34, 43, 8, 'black', '2023-06-25 08:59:21', '2023-06-25 08:59:21'),
(38, 35, 40, 8, 'white', '2023-06-25 09:07:58', '2023-06-25 09:07:58'),
(39, 36, 39, 7, 'white', '2023-06-25 09:13:48', '2023-06-25 09:13:48'),
(40, 37, 42, 9, 'brown', '2023-06-25 09:17:25', '2023-06-25 09:17:25'),
(41, 38, 40, 11, 'black', '2023-06-25 09:20:47', '2023-06-25 09:20:47'),
(42, 39, 42, 8, 'brown', '2023-06-25 09:24:01', '2023-06-25 09:24:01'),
(43, 40, 43, 9, 'brown', '2023-06-25 09:27:33', '2023-06-25 09:27:33'),
(44, 41, 44, 7, 'white', '2023-06-25 09:32:38', '2023-06-25 09:32:38'),
(45, 42, 44, 6, 'black', '2023-06-25 09:35:39', '2023-06-25 09:35:39'),
(46, 43, 39, 7, 'white', '2023-06-26 07:25:19', '2023-06-26 07:25:19'),
(47, 44, 40, 6, 'white', '2023-06-26 07:29:14', '2023-06-26 07:29:14'),
(48, 45, 34, 2, 'white', '2023-06-26 07:31:59', '2023-06-26 07:31:59'),
(49, 46, 35, 2, 'red', '2023-06-26 07:36:58', '2023-06-26 07:36:58'),
(50, 47, 36, 7, 'brown', '2023-06-26 07:40:05', '2023-06-26 07:40:05'),
(51, 48, 42, 7, 'brown', '2023-06-26 07:44:12', '2023-06-26 07:44:12'),
(52, 1, 39, 5, 'white', NULL, NULL),
(53, 1, 41, 10, 'white', NULL, NULL),
(54, 1, 42, 10, 'black', NULL, NULL),
(55, 2, 38, 5, 'white', NULL, NULL),
(56, 3, 41, 5, 'black', NULL, NULL),
(57, 49, 39, 4, 'white', '2023-06-26 10:30:31', '2023-06-26 10:30:31'),
(58, 50, 43, NULL, NULL, '2023-06-26 10:30:46', '2023-06-26 10:30:46'),
(59, 2, 40, 5, 'red', NULL, NULL),
(60, 2, 41, 3, 'black', NULL, NULL),
(61, 2, 42, 4, 'black', NULL, NULL),
(62, 3, 42, 4, 'blue', NULL, NULL),
(63, 3, 43, 7, 'black', NULL, NULL),
(64, 4, 41, 2, 'black', NULL, NULL),
(65, 4, 42, 6, 'black', NULL, NULL),
(66, 4, 44, 4, 'red', NULL, NULL),
(67, 4, 45, 7, 'red', NULL, NULL),
(68, 6, 40, 7, 'white', NULL, NULL),
(69, 6, 41, 6, 'black', NULL, NULL),
(70, 6, 42, 8, 'brown', NULL, NULL),
(71, 8, 38, 4, 'red', NULL, NULL),
(72, 8, 39, 5, 'black', NULL, NULL),
(73, 8, 40, 1, 'black', NULL, NULL),
(74, 9, 41, 4, 'white', NULL, NULL),
(75, 9, 42, 4, 'black', NULL, NULL),
(76, 9, 43, 4, 'black', NULL, NULL),
(77, 12, 41, 4, 'white', NULL, NULL),
(78, 12, 43, 5, 'white', NULL, NULL),
(79, 13, 40, 4, 'red', NULL, NULL),
(80, 13, 41, 4, 'red', NULL, NULL),
(81, 13, 42, 4, 'red', NULL, NULL),
(82, 14, 42, 5, 'white', NULL, NULL),
(83, 15, 42, 4, 'white', NULL, NULL),
(84, 15, 43, 3, 'white', NULL, NULL),
(85, 22, 40, 7, 'white', NULL, NULL),
(86, 22, 41, 7, 'white', NULL, NULL),
(87, 22, 43, 3, 'white', NULL, NULL),
(88, 22, 44, 2, 'white', NULL, NULL),
(89, 22, 45, 4, 'white', NULL, NULL),
(90, 28, 42, 4, 'white', NULL, NULL),
(91, 28, 43, 5, 'white', NULL, NULL),
(92, 28, 44, 5, 'white', NULL, NULL),
(93, 29, 41, 4, 'white', NULL, NULL),
(94, 30, 43, 7, 'red', NULL, NULL),
(95, 32, 40, 4, 'white', NULL, NULL),
(96, 33, 39, 2, 'blue', NULL, NULL),
(97, 34, 44, 3, 'black', NULL, NULL),
(98, 35, 41, 4, 'white', NULL, NULL),
(99, 36, 40, 3, 'white', NULL, NULL),
(100, 38, 42, 2, 'black', NULL, NULL),
(101, 39, 45, 5, 'black', NULL, NULL),
(102, 40, 45, 3, 'white', NULL, NULL),
(103, 42, 45, 4, 'black', NULL, NULL),
(104, 44, 41, 4, 'white', NULL, NULL),
(105, 45, 35, 5, 'white', NULL, NULL),
(106, 45, 36, 3, 'white', NULL, NULL),
(107, 47, 38, 3, 'black', NULL, NULL),
(108, 49, 40, 4, 'white', NULL, NULL),
(109, 51, 35, 5, 'white', NULL, NULL),
(110, 51, 36, 4, NULL, NULL, NULL),
(111, 52, 34.5, 4, 'white', NULL, NULL),
(112, 52, 36, 6, NULL, NULL, NULL),
(113, 52, 37, 4, NULL, NULL, NULL),
(114, 53, 35, 4, 'white', NULL, NULL),
(115, 53, 37.5, 8, NULL, NULL, NULL),
(116, 53, 39, 8, NULL, NULL, NULL),
(117, 54, 36, 5, NULL, NULL, NULL),
(118, 54, 38, 8, 'white', NULL, NULL),
(119, 54, 40, 5, 'brown', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `photo`, `created_at`, `updated_at`) VALUES
(1, 1, 'nike-m-1.png', '2023-06-25 05:25:37', '2023-06-25 05:25:37'),
(2, 1, 'nike-m-2.png', '2023-06-25 05:25:47', '2023-06-25 05:25:47'),
(3, 1, 'nike-m-3.png', '2023-06-25 05:25:56', '2023-06-25 05:25:56'),
(4, 1, 'nike-m-4.png', '2023-06-25 05:26:04', '2023-06-25 05:26:04'),
(5, 1, 'nike-m-5.png', '2023-06-25 05:26:19', '2023-06-25 05:26:19'),
(6, 2, 'nike2-m-1.png', '2023-06-25 06:03:15', '2023-06-25 06:03:15'),
(7, 2, 'nike2-m-2.png', '2023-06-25 06:03:25', '2023-06-25 06:03:25'),
(8, 2, 'nike2-m-3.png', '2023-06-25 06:03:35', '2023-06-25 06:03:35'),
(9, 2, 'nike2-m-4.png', '2023-06-25 06:03:44', '2023-06-25 06:03:44'),
(10, 2, 'nike2-m-5.png', '2023-06-25 06:03:51', '2023-06-25 06:03:51'),
(11, 3, 'nike5-m-1.png', '2023-06-25 06:06:50', '2023-06-25 06:06:50'),
(12, 3, 'nike5-m-2.png', '2023-06-25 06:06:59', '2023-06-25 06:06:59'),
(13, 3, 'nike5-m-3.png', '2023-06-25 06:07:10', '2023-06-25 06:07:10'),
(14, 3, 'nike5-m-4.png', '2023-06-25 06:07:19', '2023-06-25 06:07:19'),
(15, 3, 'nike5-m-5.png', '2023-06-25 06:07:28', '2023-06-25 06:07:28'),
(16, 4, 'nike4-m-1.png', '2023-06-25 06:09:22', '2023-06-25 06:09:22'),
(17, 4, 'nike4-m-2.png', '2023-06-25 06:09:39', '2023-06-25 06:09:39'),
(18, 4, 'nike4-m-3.png', '2023-06-25 06:09:51', '2023-06-25 06:09:51'),
(19, 4, 'nike4-m-4.png', '2023-06-25 06:10:02', '2023-06-25 06:10:02'),
(20, 4, 'nike4-m-5.png', '2023-06-25 06:10:21', '2023-06-25 06:10:21'),
(21, 6, 'giay2.avif', '2023-06-25 06:21:23', '2023-06-25 06:21:23'),
(22, 6, 'giay2.avif', '2023-06-25 06:23:41', '2023-06-25 06:23:41'),
(23, 6, 'giay3.avif', '2023-06-25 06:26:43', '2023-06-25 06:26:43'),
(24, 6, 'giay4.avif', '2023-06-25 06:26:58', '2023-06-25 06:26:58'),
(25, 6, 'giay5.avif', '2023-06-25 06:27:15', '2023-06-25 06:27:15'),
(26, 7, 'giay6.avif', '2023-06-25 06:30:01', '2023-06-25 06:30:01'),
(27, 7, 'giay7.avif', '2023-06-25 06:30:15', '2023-06-25 06:30:15'),
(28, 7, 'giay8.avif', '2023-06-25 06:30:34', '2023-06-25 06:30:34'),
(29, 7, 'giay9.avif', '2023-06-25 06:30:48', '2023-06-25 06:30:48'),
(30, 7, 'giay10.avif', '2023-06-25 06:30:59', '2023-06-25 06:30:59'),
(31, 8, 'giay11.avif', '2023-06-25 06:38:48', '2023-06-25 06:38:48'),
(32, 8, 'giay12.avif', '2023-06-25 06:38:59', '2023-06-25 06:38:59'),
(33, 8, 'giay13.avif', '2023-06-25 06:39:13', '2023-06-25 06:39:13'),
(34, 8, 'giay14.avif', '2023-06-25 06:39:26', '2023-06-25 06:39:26'),
(35, 8, 'giay15.avif', '2023-06-25 06:39:38', '2023-06-25 06:39:38'),
(36, 9, 'dep1.avif', '2023-06-25 06:43:13', '2023-06-25 06:43:13'),
(37, 9, 'dep2.avif', '2023-06-25 06:43:27', '2023-06-25 06:43:27'),
(38, 9, 'dep4.avif', '2023-06-25 06:44:00', '2023-06-25 06:44:00'),
(39, 9, 'dep3.avif', '2023-06-25 06:44:17', '2023-06-25 06:44:17'),
(40, 9, 'dep5.avif', '2023-06-25 06:44:31', '2023-06-25 06:44:31'),
(47, 12, 'giay16.avif', '2023-06-25 06:59:49', '2023-06-25 06:59:49'),
(48, 12, 'giay17.avif', '2023-06-25 07:00:00', '2023-06-25 07:00:00'),
(49, 12, 'giay18.avif', '2023-06-25 07:00:12', '2023-06-25 07:00:12'),
(50, 12, 'giay19.avif', '2023-06-25 07:00:22', '2023-06-25 07:00:22'),
(51, 12, 'giay20.avif', '2023-06-25 07:00:35', '2023-06-25 07:00:35'),
(52, 13, 'giay21.avif', '2023-06-25 07:04:54', '2023-06-25 07:04:54'),
(53, 13, 'giay22.avif', '2023-06-25 07:05:06', '2023-06-25 07:05:06'),
(54, 13, 'giay23.avif', '2023-06-25 07:05:16', '2023-06-25 07:05:16'),
(55, 13, 'giay24.avif', '2023-06-25 07:05:27', '2023-06-25 07:05:27'),
(56, 13, 'giay25.avif', '2023-06-25 07:05:38', '2023-06-25 07:05:38'),
(57, 14, 'giay26.avif', '2023-06-25 07:14:00', '2023-06-25 07:14:00'),
(58, 14, 'giay27.avif', '2023-06-25 07:14:11', '2023-06-25 07:14:11'),
(59, 14, 'giay28.avif', '2023-06-25 07:14:23', '2023-06-25 07:14:23'),
(60, 14, 'giay29.avif', '2023-06-25 07:14:34', '2023-06-25 07:14:34'),
(61, 14, 'giay30.avif', '2023-06-25 07:14:47', '2023-06-25 07:14:47'),
(62, 15, 'giay31.avif', '2023-06-25 07:17:58', '2023-06-25 07:17:58'),
(63, 15, 'giay32.avif', '2023-06-25 07:18:13', '2023-06-25 07:18:13'),
(64, 15, 'giay33.avif', '2023-06-25 07:18:23', '2023-06-25 07:18:23'),
(65, 15, 'giay34.avif', '2023-06-25 07:18:37', '2023-06-25 07:18:37'),
(66, 15, 'giay35.avif', '2023-06-25 07:18:48', '2023-06-25 07:18:48'),
(96, 22, 'giay1.png', '2023-06-25 08:08:44', '2023-06-25 08:08:44'),
(97, 22, 'giay2.png', '2023-06-25 08:08:56', '2023-06-25 08:08:56'),
(98, 22, 'giay3.png', '2023-06-25 08:09:05', '2023-06-25 08:09:05'),
(99, 22, 'giay4.png', '2023-06-25 08:09:14', '2023-06-25 08:09:14'),
(100, 22, 'giay5.png', '2023-06-25 08:09:24', '2023-06-25 08:09:24'),
(122, 28, 'giay6.png', '2023-06-25 08:34:54', '2023-06-25 08:34:54'),
(123, 28, 'giay7.png', '2023-06-25 08:35:07', '2023-06-25 08:35:07'),
(124, 28, 'giay8.png', '2023-06-25 08:35:27', '2023-06-25 08:35:27'),
(125, 28, 'giay9.png', '2023-06-25 08:35:48', '2023-06-25 08:35:48'),
(126, 28, 'giay10.png', '2023-06-25 08:36:02', '2023-06-25 08:36:02'),
(127, 29, 'giay11.png', '2023-06-25 08:38:59', '2023-06-25 08:38:59'),
(128, 29, 'giay12.png', '2023-06-25 08:39:13', '2023-06-25 08:39:13'),
(129, 29, 'giay13.png', '2023-06-25 08:39:26', '2023-06-25 08:39:26'),
(130, 29, 'giay14.png', '2023-06-25 08:39:37', '2023-06-25 08:39:37'),
(131, 29, 'giay15.png', '2023-06-25 08:39:48', '2023-06-25 08:39:48'),
(132, 30, 'giay16.png', '2023-06-25 08:43:07', '2023-06-25 08:43:07'),
(133, 30, 'giay17.png', '2023-06-25 08:43:20', '2023-06-25 08:43:20'),
(134, 30, 'giay18.png', '2023-06-25 08:43:31', '2023-06-25 08:43:31'),
(135, 30, 'giay19.png', '2023-06-25 08:43:47', '2023-06-25 08:43:47'),
(136, 30, 'giay20.png', '2023-06-25 08:44:00', '2023-06-25 08:44:00'),
(137, 31, 'giay21.png', '2023-06-25 08:47:13', '2023-06-25 08:47:13'),
(138, 31, 'giay22.png', '2023-06-25 08:47:24', '2023-06-25 08:47:24'),
(139, 31, 'giay23.png', '2023-06-25 08:47:34', '2023-06-25 08:47:34'),
(140, 31, 'giay24.png', '2023-06-25 08:47:44', '2023-06-25 08:47:44'),
(141, 31, 'giay25.png', '2023-06-25 08:48:11', '2023-06-25 08:48:11'),
(142, 32, 'giay26.png', '2023-06-25 08:51:22', '2023-06-25 08:51:22'),
(143, 32, 'giay27.png', '2023-06-25 08:51:34', '2023-06-25 08:51:34'),
(144, 32, 'giay28.png', '2023-06-25 08:51:48', '2023-06-25 08:51:48'),
(145, 32, 'giay29.png', '2023-06-25 08:51:59', '2023-06-25 08:51:59'),
(146, 32, 'giay30.png', '2023-06-25 08:52:25', '2023-06-25 08:52:25'),
(147, 33, 'giay31.png', '2023-06-25 08:55:14', '2023-06-25 08:55:14'),
(148, 33, 'giay32.png', '2023-06-25 08:55:24', '2023-06-25 08:55:24'),
(149, 33, 'giay33.png', '2023-06-25 08:55:40', '2023-06-25 08:55:40'),
(150, 33, 'giay34.png', '2023-06-25 08:55:52', '2023-06-25 08:55:52'),
(151, 33, 'giay35.png', '2023-06-25 08:56:05', '2023-06-25 08:56:05'),
(152, 34, 'giay36.png', '2023-06-25 08:59:57', '2023-06-25 08:59:57'),
(153, 34, 'giay37.png', '2023-06-25 09:00:10', '2023-06-25 09:00:10'),
(154, 34, 'giay38.png', '2023-06-25 09:00:20', '2023-06-25 09:00:20'),
(155, 34, 'giay39.png', '2023-06-25 09:00:31', '2023-06-25 09:00:31'),
(156, 34, 'giay40.png', '2023-06-25 09:00:43', '2023-06-25 09:00:43'),
(157, 35, 'giay1.jpeg', '2023-06-25 09:09:27', '2023-06-25 09:09:27'),
(158, 35, 'giay2.jpeg', '2023-06-25 09:09:41', '2023-06-25 09:09:41'),
(159, 35, 'giay4.jpeg', '2023-06-25 09:09:52', '2023-06-25 09:09:52'),
(160, 35, 'giay3.jpeg', '2023-06-25 09:10:05', '2023-06-25 09:10:05'),
(161, 35, 'giay5.jpeg', '2023-06-25 09:10:16', '2023-06-25 09:10:16'),
(162, 36, 'dep1.jpeg', '2023-06-25 09:14:00', '2023-06-25 09:14:00'),
(163, 36, 'dep2.jpeg', '2023-06-25 09:14:10', '2023-06-25 09:14:10'),
(164, 36, 'dep3.jpeg', '2023-06-25 09:14:21', '2023-06-25 09:14:21'),
(165, 36, 'dep4.jpeg', '2023-06-25 09:14:33', '2023-06-25 09:14:33'),
(166, 36, 'dep5.jpeg', '2023-06-25 09:14:51', '2023-06-25 09:14:51'),
(167, 37, 'giay6.jpeg', '2023-06-25 09:17:40', '2023-06-25 09:17:40'),
(168, 37, 'giay7.jpeg', '2023-06-25 09:17:51', '2023-06-25 09:17:51'),
(169, 37, 'giay8.jpeg', '2023-06-25 09:18:03', '2023-06-25 09:18:03'),
(170, 37, 'giay9.jpeg', '2023-06-25 09:18:16', '2023-06-25 09:18:16'),
(171, 37, 'giay10.jpeg', '2023-06-25 09:18:30', '2023-06-25 09:18:30'),
(172, 38, 'giay11.jpeg', '2023-06-25 09:21:00', '2023-06-25 09:21:00'),
(173, 38, 'giay12.jpeg', '2023-06-25 09:21:11', '2023-06-25 09:21:11'),
(174, 38, 'giay13.jpeg', '2023-06-25 09:21:22', '2023-06-25 09:21:22'),
(175, 38, 'giay14.jpeg', '2023-06-25 09:21:33', '2023-06-25 09:21:33'),
(176, 38, 'giay15.jpeg', '2023-06-25 09:21:45', '2023-06-25 09:21:45'),
(177, 39, 'giay16.jpeg', '2023-06-25 09:24:25', '2023-06-25 09:24:25'),
(178, 39, 'giay17.jpeg', '2023-06-25 09:24:39', '2023-06-25 09:24:39'),
(179, 39, 'giay18.jpeg', '2023-06-25 09:24:50', '2023-06-25 09:24:50'),
(180, 39, 'giay19.jpeg', '2023-06-25 09:25:01', '2023-06-25 09:25:01'),
(181, 39, 'giay20.jpeg', '2023-06-25 09:25:12', '2023-06-25 09:25:12'),
(182, 40, 'giay21.jpeg', '2023-06-25 09:27:47', '2023-06-25 09:27:47'),
(183, 40, 'giay22.jpeg', '2023-06-25 09:27:59', '2023-06-25 09:27:59'),
(184, 40, 'giay23.jpeg', '2023-06-25 09:28:18', '2023-06-25 09:28:18'),
(185, 40, 'giay24.jpeg', '2023-06-25 09:29:05', '2023-06-25 09:29:05'),
(186, 40, 'giay25.jpeg', '2023-06-25 09:29:16', '2023-06-25 09:29:16'),
(187, 41, 'giay26.jpeg', '2023-06-25 09:32:53', '2023-06-25 09:32:53'),
(188, 41, 'giay27.jpeg', '2023-06-25 09:33:03', '2023-06-25 09:33:03'),
(189, 41, 'giay28.jpeg', '2023-06-25 09:33:13', '2023-06-25 09:33:13'),
(190, 41, 'giay29.jpeg', '2023-06-25 09:33:24', '2023-06-25 09:33:24'),
(191, 41, 'giay30.jpeg', '2023-06-25 09:33:36', '2023-06-25 09:33:36'),
(192, 42, 'giay31.jpeg', '2023-06-25 09:36:04', '2023-06-25 09:36:04'),
(193, 42, 'giay32.jpeg', '2023-06-25 09:36:14', '2023-06-25 09:36:14'),
(194, 42, 'giay33.jpeg', '2023-06-25 09:36:24', '2023-06-25 09:36:24'),
(195, 42, 'giay34.jpeg', '2023-06-25 09:36:35', '2023-06-25 09:36:35'),
(196, 42, 'giay35.jpeg', '2023-06-25 09:36:45', '2023-06-25 09:36:45'),
(197, 43, 'nike4-w-1.png', '2023-06-26 07:25:38', '2023-06-26 07:25:38'),
(198, 43, 'nike4-w-2.png', '2023-06-26 07:25:51', '2023-06-26 07:25:51'),
(199, 43, 'nike4-w-3.png', '2023-06-26 07:26:02', '2023-06-26 07:26:02'),
(200, 43, 'nike4-w-4.png', '2023-06-26 07:26:14', '2023-06-26 07:26:14'),
(201, 43, 'nike4-w-5.png', '2023-06-26 07:26:24', '2023-06-26 07:26:24'),
(202, 44, 'nike-w-1.png', '2023-06-26 07:29:28', '2023-06-26 07:29:28'),
(203, 44, 'nike-w-2.png', '2023-06-26 07:29:37', '2023-06-26 07:29:37'),
(204, 44, 'nike-w-3.png', '2023-06-26 07:29:50', '2023-06-26 07:29:50'),
(205, 44, 'nike-w-3.png', '2023-06-26 07:30:00', '2023-06-26 07:30:00'),
(206, 44, 'nike-w-4.png', '2023-06-26 07:30:10', '2023-06-26 07:30:10'),
(207, 44, 'nike-w-5.png', '2023-06-26 07:30:22', '2023-06-26 07:30:22'),
(208, 45, 'nike2-w-1.png', '2023-06-26 07:33:38', '2023-06-26 07:33:38'),
(209, 45, 'nike2-w-2.png', '2023-06-26 07:33:54', '2023-06-26 07:33:54'),
(210, 45, 'nike2-w-3.png', '2023-06-26 07:34:05', '2023-06-26 07:34:05'),
(211, 45, 'nike2-w-4.png', '2023-06-26 07:34:16', '2023-06-26 07:34:16'),
(212, 45, 'nike2-w-5.png', '2023-06-26 07:34:24', '2023-06-26 07:34:24'),
(213, 46, 'nike5-w-1.png', '2023-06-26 07:37:11', '2023-06-26 07:37:11'),
(214, 46, 'nike5-w-2.png', '2023-06-26 07:37:28', '2023-06-26 07:37:28'),
(215, 46, 'nike5-w-3.png', '2023-06-26 07:37:41', '2023-06-26 07:37:41'),
(216, 46, 'nike5-w-4.png', '2023-06-26 07:37:50', '2023-06-26 07:37:50'),
(217, 46, 'nike5-w-5.png', '2023-06-26 07:37:59', '2023-06-26 07:37:59'),
(218, 47, 'nike3-w-1.png', '2023-06-26 07:40:20', '2023-06-26 07:40:20'),
(219, 47, 'nike3-w-2.png', '2023-06-26 07:40:29', '2023-06-26 07:40:29'),
(220, 47, 'nike3-w-3.png', '2023-06-26 07:40:40', '2023-06-26 07:40:40'),
(221, 47, 'nike3-w-4.png', '2023-06-26 07:40:49', '2023-06-26 07:40:49'),
(222, 47, 'nike3-w-5.png', '2023-06-26 07:40:58', '2023-06-26 07:40:58'),
(223, 48, 'best1.png', '2023-06-26 07:44:34', '2023-06-26 07:44:34'),
(224, 50, 'best3.png', '2023-06-26 07:49:09', '2023-06-26 07:49:09'),
(225, 49, 'best2.png', '2023-06-26 07:49:26', '2023-06-26 07:49:26'),
(226, 51, 'adidas1-1.jpeg', NULL, NULL),
(227, 51, 'adidas1-2.jpg', NULL, NULL),
(228, 51, 'adidas1-3.jpg', NULL, NULL),
(229, 51, 'adidas1-4.jpg', NULL, NULL),
(230, 52, 'adidas2-1.jpg', NULL, NULL),
(231, 52, 'adidas2-2.jpg', NULL, NULL),
(232, 52, 'adidas2-3.jpg', NULL, NULL),
(233, 52, 'adidas2-4.jpg', NULL, NULL),
(234, 53, 'nike1-1.jpg', NULL, NULL),
(235, 53, 'nike1-2.jpg', NULL, NULL),
(236, 53, 'nike1-3.jpg', NULL, NULL),
(237, 53, 'nike1-4.jpg', NULL, NULL),
(238, 54, 'nike2-1.jpg', NULL, NULL),
(239, 54, 'nike2-2.jpg', NULL, NULL),
(240, 54, 'nike2-3.jpg', NULL, NULL),
(241, 54, 'nike2-4.jpg', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `photo`, `created_at`, `updated_at`) VALUES
(1, 'cs1.png', NULL, NULL),
(2, 'cs2.png', NULL, NULL),
(3, 'cs3.png', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `survey`
--

CREATE TABLE `survey` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_chosen` bigint(20) UNSIGNED DEFAULT NULL,
  `code` varchar(255) NOT NULL,
  `user_provide` text DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `survey`
--

INSERT INTO `survey` (`id`, `user_id`, `user_chosen`, `code`, `user_provide`, `photo`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, '', NULL, '1687671845.png', '2023-06-25 05:35:00', '2023-06-25 05:44:05'),
(2, NULL, NULL, '', NULL, '1687671610.png', '2023-06-25 05:40:10', '2023-06-25 05:40:10'),
(3, NULL, NULL, '', NULL, '1687671857.png', '2023-06-25 05:44:17', '2023-06-25 05:44:17'),
(4, NULL, 1, 'CPDM1', 'anh trung khen dep vai l', NULL, '2023-06-25 05:48:02', '2023-06-25 05:48:02'),
(5, NULL, 2, 'CPDM3', 'kkkkk', NULL, '2023-06-25 05:49:15', '2023-06-25 05:49:15'),
(6, NULL, 3, 'CPDM1', 'that\'s cool', NULL, '2023-06-26 09:28:47', '2023-06-26 09:28:47'),
(7, NULL, 1, 'CPDM3', 'gg', NULL, '2023-06-26 17:16:06', '2023-06-26 17:16:06'),
(8, NULL, 1, 'CPDM3', 'vfv', NULL, '2023-06-26 17:19:29', '2023-06-26 17:19:29'),
(9, NULL, 3, 'CPDM1', 'nrbngf', NULL, '2023-06-26 17:20:27', '2023-06-26 17:20:27');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` varchar(255) NOT NULL DEFAULT 'user',
  `google_id` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `last_name`, `email`, `email_verified_at`, `password`, `role`, `google_id`, `avatar`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Chien', 'Co', 'Cotrinhhientai@gmail.com', NULL, '$2y$10$Nyfia5y.ookchPuR0SVVzesengvm9jFefMPleMFOH2vbVQ4yzFyJy', 'admin', NULL, 'thp.png', NULL, '2023-06-25 02:51:06', '2023-06-26 10:00:01'),
(2, 'Trung', 'Ho', 'trung@gmail.com', NULL, '$2y$10$Sqg.8l82CzoLaB5H.R79fOU8W0Q22WrgSLaoBjfGGpajHjniwA3fW', 'user', NULL, 'thp.png', NULL, '2023-06-25 14:10:01', '2023-06-26 09:40:35'),
(3, 'Cổ Tài', NULL, 'taicopgm@gmail.com', NULL, NULL, 'user', '105153357703871686564', NULL, NULL, '2023-06-26 07:10:34', '2023-06-26 07:10:34'),
(4, 'the', 'nguyen van', 'thecot2004@gmail.com', NULL, '$2y$10$7urCkPI3L3CVY8ziO50Py.uhLVqvmXzLcWMAiF5Z3BjQSiaKxM91G', 'user', NULL, NULL, NULL, '2023-06-26 09:20:34', '2023-06-26 09:20:34'),
(5, '36.Võ Quang Trung', NULL, 'votrung10a3nh1@gmail.com', NULL, NULL, 'user', '111699209247746284459', NULL, NULL, '2023-06-26 09:20:54', '2023-06-26 09:20:54'),
(6, 'trung vo', NULL, 'trungvo.11062004@gmail.com', NULL, NULL, 'user', '111298255427381296204', NULL, NULL, '2023-06-26 09:48:14', '2023-06-26 09:48:14'),
(7, 'chien', 'cao van', 'vanchien@gmail.com', NULL, '$2y$10$cxqDXVUI6oQIf4xG.P96QOhSUyz9V4ky1geQ0Io2rK9eE1fYTJrRW', 'user', NULL, NULL, NULL, '2023-06-26 16:46:16', '2023-06-26 16:46:16'),
(8, 'Hao', 'Nguyen', 'huyhvv9@gmail.com', NULL, '$2y$10$PmZ4tI6TpjnqlhNURWoRqegjDQAq90.PFlgOO2V46zi0SFxHf.jTS', 'user', NULL, NULL, '6cFO7CvVO8OHpO7QU1lclxd7KIFQQuCrSyZ025pHQ1A7Q92aPC3HitF3q9Yj', '2023-07-02 11:10:05', '2023-07-02 13:20:51'),
(9, 'win nguyen', NULL, 'coder6253@gmail.com', NULL, '$2y$10$JhwA017t93nX7JDOnCI6q.hZNh7k9A3Y2HbCgRdBE6BhMuoee/9Qu', 'admin', '113147823592479096218', NULL, '6mqpcPWLwMsVY58oPTh94HWlqfOEgjv9tZwHk8i195CjUL5tewuZaRCC5h3Z', '2023-07-02 12:00:21', '2023-07-02 13:36:29');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_us`
--
ALTER TABLE `contact_us`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contact_us_user_id_foreign` (`user_id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupons_code_unique` (`code`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `inform`
--
ALTER TABLE `inform`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_user_id_foreign` (`user_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`),
  ADD KEY `order_items_product_id_foreign` (`product_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_brand_id_foreign` (`brand_id`);

--
-- Indexes for table `product_comments`
--
ALTER TABLE `product_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_comments_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_details`
--
ALTER TABLE `product_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_details_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_images_product_id_foreign` (`product_id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `survey`
--
ALTER TABLE `survey`
  ADD PRIMARY KEY (`id`),
  ADD KEY `survey_user_id_foreign` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `brand`
--
ALTER TABLE `brand`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `contact_us`
--
ALTER TABLE `contact_us`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inform`
--
ALTER TABLE `inform`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `product_comments`
--
ALTER TABLE `product_comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `product_details`
--
ALTER TABLE `product_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=242;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `survey`
--
ALTER TABLE `survey`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `contact_us`
--
ALTER TABLE `contact_us`
  ADD CONSTRAINT `contact_us_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`),
  ADD CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`id`),
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Constraints for table `product_comments`
--
ALTER TABLE `product_comments`
  ADD CONSTRAINT `product_comments_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `product_details`
--
ALTER TABLE `product_details`
  ADD CONSTRAINT `product_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `product_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `survey`
--
ALTER TABLE `survey`
  ADD CONSTRAINT `survey_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
