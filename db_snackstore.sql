-- --------------------------------------------------------
-- Host:                         localhost
-- Versión del servidor:         10.1.34-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win32
-- HeidiSQL Versión:             10.1.0.5464
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para db_snackstore
CREATE DATABASE IF NOT EXISTS `db_snackstore` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `db_snackstore`;

-- Volcando estructura para tabla db_snackstore.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Volcando datos para la tabla db_snackstore.migrations: ~8 rows (aproximadamente)
DELETE FROM `migrations`;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_100000_create_password_resets_table', 1),
	(2, '2019_06_01_094925_create_table_role', 1),
	(3, '2019_06_02_094925_create_table_product', 1),
	(4, '2019_06_03_000003_create_table_users', 1),
	(5, '2019_06_15_094925_create_table_product_price_log', 1),
	(6, '2019_06_15_095221_create_purchases_table', 1),
	(7, '2019_06_15_194999_create_table_product_linking', 1),
	(8, '2019_06_16_015952_create_purchase_details_table', 1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Volcando estructura para tabla db_snackstore.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Volcando datos para la tabla db_snackstore.password_resets: ~0 rows (aproximadamente)
DELETE FROM `password_resets`;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Volcando estructura para tabla db_snackstore.products
CREATE TABLE IF NOT EXISTS `products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name_product` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price_product` double(8,2) NOT NULL,
  `stock_product` int(11) NOT NULL,
  `description_product` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_product` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Volcando datos para la tabla db_snackstore.products: ~9 rows (aproximadamente)
DELETE FROM `products`;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` (`id`, `name_product`, `price_product`, `stock_product`, `description_product`, `status_product`, `created_at`, `updated_at`) VALUES
	(1, 'Jalapenos', 0.96, 200, 'Snack Picante 14g', 1, '2019-06-17 02:12:28', '2019-06-18 23:40:31'),
	(2, 'Gomitas', 0.44, 100, 'Gomitas 40g', 1, '2019-06-18 23:10:23', '2019-06-18 23:10:23'),
	(3, 'Mani Japones', 0.45, 200, 'Mani Japones 20g', 1, '2019-06-17 02:25:41', '2019-06-17 02:25:41'),
	(4, 'Nachos', 0.60, 200, 'Nachos 11g', 1, '2019-06-16 21:06:08', '2019-06-16 21:06:08'),
	(5, 'Elotitos', 0.60, 200, 'Elotitos 11g', 1, '2019-06-16 21:06:08', '2019-06-16 21:06:08'),
	(6, 'Quesitos', 0.80, 200, 'Quesitos 11g', 1, '2019-06-16 21:06:08', '2019-06-16 21:06:08'),
	(7, 'Platanitos', 1.50, 39, 'Platanitos 30g', 1, '2019-06-18 02:36:06', '2019-06-19 00:38:31'),
	(8, 'Pop Corn', 1.80, 100, 'Pop Corn 20g', 1, '2019-06-18 23:09:08', '2019-06-18 23:09:08'),
	(9, 'Doritos', 0.55, 100, 'Doritos 30g', 1, '2019-06-18 23:10:23', '2019-06-18 23:10:23');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;

-- Volcando estructura para tabla db_snackstore.product_linkings
CREATE TABLE IF NOT EXISTS `product_linkings` (
  `id_linking` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_product` int(10) unsigned DEFAULT NULL,
  `id_customer` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_linking`),
  KEY `product_linkings_id_product_foreign` (`id_product`),
  KEY `product_linkings_id_customer_foreign` (`id_customer`),
  CONSTRAINT `product_linkings_id_customer_foreign` FOREIGN KEY (`id_customer`) REFERENCES `users` (`id`),
  CONSTRAINT `product_linkings_id_product_foreign` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Volcando datos para la tabla db_snackstore.product_linkings: ~1 rows (aproximadamente)
DELETE FROM `product_linkings`;
/*!40000 ALTER TABLE `product_linkings` DISABLE KEYS */;
INSERT INTO `product_linkings` (`id_linking`, `id_product`, `id_customer`, `created_at`, `updated_at`) VALUES
	(2, 1, 2, '2019-06-17 02:14:05', '2019-06-17 02:14:05'),
	(3, 5, 3, '2019-06-19 00:20:02', '2019-06-19 00:20:02');
/*!40000 ALTER TABLE `product_linkings` ENABLE KEYS */;

-- Volcando estructura para tabla db_snackstore.product_price_logs
CREATE TABLE IF NOT EXISTS `product_price_logs` (
  `id_price_log` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_product` int(10) unsigned DEFAULT NULL,
  `last_price` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_price_log`),
  KEY `product_price_logs_id_product_foreign` (`id_product`),
  CONSTRAINT `product_price_logs_id_product_foreign` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Volcando datos para la tabla db_snackstore.product_price_logs: ~8 rows (aproximadamente)
DELETE FROM `product_price_logs`;
/*!40000 ALTER TABLE `product_price_logs` DISABLE KEYS */;
INSERT INTO `product_price_logs` (`id_price_log`, `id_product`, `last_price`, `created_at`, `updated_at`) VALUES
	(1, 1, 1.00, '2019-06-17 02:28:43', '2019-06-17 02:28:43'),
	(2, 1, 0.50, '2019-06-17 02:29:09', '2019-06-17 02:29:09'),
	(3, 1, 0.50, '2019-06-17 02:31:06', '2019-06-17 02:31:06'),
	(4, 1, 0.70, '2019-06-17 02:31:31', '2019-06-17 02:31:31'),
	(5, 1, 0.75, '2019-06-18 23:37:11', '2019-06-18 23:37:11'),
	(6, 1, 0.85, '2019-06-18 23:39:37', '2019-06-18 23:39:37'),
	(7, 1, 0.95, '2019-06-18 23:40:31', '2019-06-18 23:40:31'),
	(8, 1, 0.57, '2019-06-18 23:47:12', '2019-06-18 23:47:12');
/*!40000 ALTER TABLE `product_price_logs` ENABLE KEYS */;

-- Volcando estructura para tabla db_snackstore.purchases
CREATE TABLE IF NOT EXISTS `purchases` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_customer` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `purchases_id_customer_foreign` (`id_customer`),
  CONSTRAINT `purchases_id_customer_foreign` FOREIGN KEY (`id_customer`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Volcando datos para la tabla db_snackstore.purchases: ~8 rows (aproximadamente)
DELETE FROM `purchases`;
/*!40000 ALTER TABLE `purchases` DISABLE KEYS */;
INSERT INTO `purchases` (`id`, `id_customer`, `created_at`, `updated_at`) VALUES
	(1, 2, '2019-06-17 02:15:11', '2019-06-17 02:15:11'),
	(2, 2, '2019-06-18 02:37:59', '2019-06-18 02:37:59'),
	(3, 2, '2019-06-19 00:32:01', '2019-06-19 00:32:01'),
	(4, 2, '2019-06-19 00:32:49', '2019-06-19 00:32:49'),
	(5, 2, '2019-06-19 00:36:23', '2019-06-19 00:36:23'),
	(6, 2, '2019-06-19 00:36:42', '2019-06-19 00:36:42'),
	(7, 3, '2019-06-19 00:37:02', '2019-06-19 00:37:02'),
	(8, 3, '2019-06-19 00:38:28', '2019-06-19 00:38:28');
/*!40000 ALTER TABLE `purchases` ENABLE KEYS */;

-- Volcando estructura para tabla db_snackstore.purchase_details
CREATE TABLE IF NOT EXISTS `purchase_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_purchase` int(10) unsigned DEFAULT NULL,
  `id_product` int(10) unsigned DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `purchase_details_id_purchase_foreign` (`id_purchase`),
  KEY `purchase_details_id_product_foreign` (`id_product`),
  CONSTRAINT `purchase_details_id_product_foreign` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`),
  CONSTRAINT `purchase_details_id_purchase_foreign` FOREIGN KEY (`id_purchase`) REFERENCES `purchases` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Volcando datos para la tabla db_snackstore.purchase_details: ~8 rows (aproximadamente)
DELETE FROM `purchase_details`;
/*!40000 ALTER TABLE `purchase_details` DISABLE KEYS */;
INSERT INTO `purchase_details` (`id`, `id_purchase`, `id_product`, `quantity`, `created_at`, `updated_at`) VALUES
	(1, 1, 1, 1, '2019-06-17 02:15:11', '2019-06-17 02:15:11'),
	(2, 2, 7, 1, '2019-06-18 02:37:59', '2019-06-18 02:37:59'),
	(3, 3, 7, 10, '2019-06-19 00:32:03', '2019-06-19 00:32:03'),
	(4, 4, 7, 10, '2019-06-19 00:32:49', '2019-06-19 00:32:49'),
	(5, 5, 7, 10, '2019-06-19 00:36:23', '2019-06-19 00:36:23'),
	(6, 6, 7, 10, '2019-06-19 00:36:42', '2019-06-19 00:36:42'),
	(7, 7, 7, 10, '2019-06-19 00:37:02', '2019-06-19 00:37:02'),
	(8, 8, 7, 10, '2019-06-19 00:38:31', '2019-06-19 00:38:31');
/*!40000 ALTER TABLE `purchase_details` ENABLE KEYS */;

-- Volcando estructura para tabla db_snackstore.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `id_role` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name_role` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_role`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Volcando datos para la tabla db_snackstore.roles: ~6 rows (aproximadamente)
DELETE FROM `roles`;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`id_role`, `name_role`, `created_at`, `updated_at`) VALUES
	(1, 'admin', '2019-06-16 20:33:24', '2019-06-16 20:33:24'),
	(2, 'user', '2019-06-16 20:39:33', '2019-06-16 20:39:33'),
	(3, 'admin', NULL, NULL),
	(4, 'admin', '2019-06-16 20:39:33', '2019-06-16 20:39:33'),
	(5, 'cliente', '2019-06-18 22:25:57', '2019-06-18 22:25:57'),
	(6, 'cliente2', '2019-06-19 00:16:31', '2019-06-19 00:16:31');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;

-- Volcando estructura para tabla db_snackstore.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` int(10) unsigned DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `users_role_foreign` (`role`),
  CONSTRAINT `users_role_foreign` FOREIGN KEY (`role`) REFERENCES `roles` (`id_role`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Volcando datos para la tabla db_snackstore.users: ~2 rows (aproximadamente)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `email`, `password`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
	(2, 'Test Man', 'test1@email.com', '$2y$10$/mjW7Myh7eSN7lCj0nVRIOhCqW9ILUpsMQkFPzsH5wQTJsJvQU9vm', 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9sb2NhbGhvc3Q6ODAwMFwvYXBpXC9sb2dpbiIsIml', '2019-06-17 02:11:39', '2019-06-17 02:11:39'),
	(3, 'Rafael', 'rgutierreztejada@gmail.com', '$2y$10$4aIDx.SPcDmhdaMlzA8qfeg58IjMsxCComnKtVze8AkG3UFzG4X2G', 2, NULL, '2019-06-18 22:18:56', '2019-06-18 22:18:56');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
