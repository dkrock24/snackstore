

-- Volcando estructura de base de datos para db_snackstore
CREATE DATABASE IF NOT EXISTS `db_snackstore` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `db_snackstore`;

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

-- Volcando datos para la tabla db_snackstore.products: ~8 rows (aproximadamente)
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

