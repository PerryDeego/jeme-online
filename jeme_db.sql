-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 28, 2019 at 05:38 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `best_ecom`
--
CREATE DATABASE IF NOT EXISTS `best_ecom` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `best_ecom`;

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(10) UNSIGNED NOT NULL,
  `products_id` int(11) NOT NULL,
  `product_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_color` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(8,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `user_email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `products_id`, `product_name`, `product_code`, `product_color`, `size`, `price`, `quantity`, `user_email`, `session_id`, `created_at`, `updated_at`) VALUES
(41, 31, 'House', 'SKU-House2', 'White and Brown', '10*10', 20.00, 2, 'weshare@gmail.com', 'bKnMoW6lH0eA6ciYTU47tgeayw5CFUzBkjkBb3F5', '2018-12-06 18:17:37', '2018-12-06 18:17:37'),
(42, 34, 'Lenovo ThinkPad', 'SKU-Lenovo X1', 'Black', '15 inch', 10.00, 2, 'weshare@gmail.com', 'bKnMoW6lH0eA6ciYTU47tgeayw5CFUzBkjkBb3F5', '2018-12-06 18:18:26', '2018-12-06 18:18:26'),
(40, 30, 'Link House New LC2', 'SKU-Link House1', 'Gray', 'Small', 10.00, 5, 'weshare@gmail.com', 'SFoV6rkDUv7y5F81nKOo5H3u0ERK3EYkcBQhUrcm', '2018-12-06 17:50:30', '2018-12-06 17:50:30'),
(39, 31, 'House', 'SKU-House1', 'White and Brown', '5*20', 25.00, 4, 'weshare@gmail.com', 'SFoV6rkDUv7y5F81nKOo5H3u0ERK3EYkcBQhUrcm', '2018-12-06 17:49:50', '2018-12-06 17:49:50'),
(36, 33, 'Cole Haan', 'SKU-Haan1', 'Brown', '25', 12.00, 1, 'weshare@gmail.com', 'OrHCEFHcACdGNXet3m2jVbzlJS0VybkkeknXXilx', '2018-12-06 02:18:10', '2018-12-06 02:18:10'),
(37, 32, 'Vionic Shoes Brand', 'SKU-Vionic3', 'All Colors', '30', 20.00, 1, 'weshare@gmail.com', 'OrHCEFHcACdGNXet3m2jVbzlJS0VybkkeknXXilx', '2018-12-06 02:30:33', '2018-12-06 02:30:33'),
(43, 35, 'Cloths', 'SKU-Red', 'Black', 'S', 2.00, 5, 'weshare@gmail.com', 'bKnMoW6lH0eA6ciYTU47tgeayw5CFUzBkjkBb3F5', '2018-12-06 18:18:31', '2018-12-06 18:18:31');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `name`, `description`, `url`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(12, 0, 'Car', 'Car Category', 'http://wornnarith.cambosoft.com', 1, NULL, '2018-10-22 21:32:33', '2018-11-16 02:00:00'),
(10, 0, 'House', 'House Category', 'http://wornnarith.cambosoft.com', 1, NULL, '2018-10-22 21:31:29', '2018-11-16 02:05:53'),
(11, 0, 'Shoes', 'Shoes Category', 'http://wornnarith.cambosoft.com', 1, NULL, '2018-10-22 21:32:14', '2018-11-16 02:07:15'),
(13, 0, 'Computer', 'Computer Category', 'http://wornnarith.cambosoft.com', 1, NULL, '2018-10-22 21:33:26', '2018-11-16 02:05:43'),
(14, 0, 'Cloths', 'Cloths Category', 'http://wornnarith.cambosoft.com', 1, NULL, '2018-10-22 21:34:31', '2018-11-16 02:05:18'),
(15, 12, 'Toyota', 'Toyota Sub Category of Car', 'http://wornnarith.cambosoft.com', 1, NULL, '2018-10-22 21:35:08', '2018-11-16 01:54:49'),
(16, 10, 'Link House', 'Link House Sub Category', 'http://wornnarith.cambosoft.com', 1, NULL, '2018-10-22 21:56:56', '2018-11-16 02:07:05'),
(17, 11, 'Man Shoes', 'Man Shoes Sub Category of Shoes', 'http://wornnarith.cambosoft.com', 1, NULL, '2018-10-22 21:58:13', '2018-11-16 01:53:44'),
(25, 0, 'Phone', 'LG V10', 'http://www.phonewiz.com', 0, NULL, '2019-08-22 09:56:56', '2019-08-22 09:56:56');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(10) UNSIGNED NOT NULL,
  `country_code` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `country_code`, `country_name`, `created_at`, `updated_at`) VALUES
(2, 'AL', 'Albania', NULL, NULL),
(3, 'DZ', 'Algeria', NULL, NULL),
(4, 'DS', 'American Samoa', NULL, NULL),
(5, 'AD', 'Andorra', NULL, NULL),
(6, 'AO', 'Angola', NULL, NULL),
(7, 'AI', 'Anguilla', NULL, NULL),
(8, 'AQ', 'Antarctica', NULL, NULL),
(9, 'AG', 'Antigua and Barbuda', NULL, NULL),
(10, 'AR', 'Argentina', NULL, NULL),
(11, 'AM', 'Armenia', NULL, NULL),
(12, 'AW', 'Aruba', NULL, NULL),
(13, 'AU', 'Australia', NULL, NULL),
(14, 'AT', 'Austria', NULL, NULL),
(15, 'AZ', 'Azerbaijan', NULL, NULL),
(16, 'BS', 'Bahamas', NULL, NULL),
(17, 'BH', 'Bahrain', NULL, NULL),
(18, 'BD', 'Bangladesh', NULL, NULL),
(19, 'BB', 'Barbados', NULL, NULL),
(20, 'BY', 'Belarus', NULL, NULL),
(21, 'BE', 'Belgium', NULL, NULL),
(22, 'BZ', 'Belize', NULL, NULL),
(23, 'BJ', 'Benin', NULL, NULL),
(24, 'BM', 'Bermuda', NULL, NULL),
(25, 'BT', 'Bhutan', NULL, NULL),
(26, 'BO', 'Bolivia', NULL, NULL),
(27, 'BA', 'Bosnia and Herzegovina', NULL, NULL),
(28, 'BW', 'Botswana', NULL, NULL),
(29, 'BV', 'Bouvet Island', NULL, NULL),
(30, 'BR', 'Brazil', NULL, NULL),
(31, 'IO', 'British Indian Ocean Territory', NULL, NULL),
(32, 'BN', 'Brunei Darussalam', NULL, NULL),
(33, 'BG', 'Bulgaria', NULL, NULL),
(34, 'BF', 'Burkina Faso', NULL, NULL),
(35, 'BI', 'Burundi', NULL, NULL),
(36, 'KH', 'Cambodia', NULL, NULL),
(37, 'CM', 'Cameroon', NULL, NULL),
(38, 'CA', 'Canada', NULL, NULL),
(39, 'CV', 'Cape Verde', NULL, NULL),
(40, 'KY', 'Cayman Islands', NULL, NULL),
(41, 'CF', 'Central African Republic', NULL, NULL),
(42, 'TD', 'Chad', NULL, NULL),
(43, 'CL', 'Chile', NULL, NULL),
(44, 'CN', 'China', NULL, NULL),
(45, 'CX', 'Christmas Island', NULL, NULL),
(46, 'CC', 'Cocos (Keeling) Islands', NULL, NULL),
(47, 'CO', 'Colombia', NULL, NULL),
(48, 'KM', 'Comoros', NULL, NULL),
(49, 'CG', 'Congo', NULL, NULL),
(50, 'CK', 'Cook Islands', NULL, NULL),
(51, 'CR', 'Costa Rica', NULL, NULL),
(52, 'AF', 'Afghanistan', NULL, NULL),
(53, 'AL', 'Albania', NULL, NULL),
(54, 'DZ', 'Algeria', NULL, NULL),
(55, 'DS', 'American Samoa', NULL, NULL),
(56, 'AD', 'Andorra', NULL, NULL),
(57, 'AO', 'Angola', NULL, NULL),
(58, 'AI', 'Anguilla', NULL, NULL),
(59, 'AQ', 'Antarctica', NULL, NULL),
(60, 'AG', 'Antigua and Barbuda', NULL, NULL),
(61, 'AR', 'Argentina', NULL, NULL),
(62, 'AM', 'Armenia', NULL, NULL),
(63, 'AW', 'Aruba', NULL, NULL),
(64, 'AU', 'Australia', NULL, NULL),
(65, 'AT', 'Austria', NULL, NULL),
(66, 'AZ', 'Azerbaijan', NULL, NULL),
(67, 'BS', 'Bahamas', NULL, NULL),
(68, 'BH', 'Bahrain', NULL, NULL),
(69, 'BD', 'Bangladesh', NULL, NULL),
(70, 'BB', 'Barbados', NULL, NULL),
(71, 'BY', 'Belarus', NULL, NULL),
(72, 'BE', 'Belgium', NULL, NULL),
(73, 'BZ', 'Belize', NULL, NULL),
(74, 'BJ', 'Benin', NULL, NULL),
(75, 'BM', 'Bermuda', NULL, NULL),
(76, 'BT', 'Bhutan', NULL, NULL),
(77, 'BO', 'Bolivia', NULL, NULL),
(78, 'BA', 'Bosnia and Herzegovina', NULL, NULL),
(79, 'BW', 'Botswana', NULL, NULL),
(80, 'BV', 'Bouvet Island', NULL, NULL),
(81, 'BR', 'Brazil', NULL, NULL),
(82, 'IO', 'British Indian Ocean Territory', NULL, NULL),
(83, 'BN', 'Brunei Darussalam', NULL, NULL),
(84, 'BG', 'Bulgaria', NULL, NULL),
(85, 'BF', 'Burkina Faso', NULL, NULL),
(86, 'BI', 'Burundi', NULL, NULL),
(87, 'KH', 'Cambodia', NULL, NULL),
(88, 'CM', 'Cameroon', NULL, NULL),
(89, 'CA', 'Canada', NULL, NULL),
(90, 'CV', 'Cape Verde', NULL, NULL),
(91, 'KY', 'Cayman Islands', NULL, NULL),
(92, 'CF', 'Central African Republic', NULL, NULL),
(93, 'TD', 'Chad', NULL, NULL),
(94, 'CL', 'Chile', NULL, NULL),
(95, 'CN', 'China', NULL, NULL),
(96, 'CX', 'Christmas Island', NULL, NULL),
(97, 'CC', 'Cocos (Keeling) Islands', NULL, NULL),
(98, 'CO', 'Colombia', NULL, NULL),
(99, 'KM', 'Comoros', NULL, NULL),
(100, 'CG', 'Congo', NULL, NULL),
(101, 'CK', 'Cook Islands', NULL, NULL),
(102, 'CR', 'Costa Rica', NULL, NULL),
(103, 'HR', 'Croatia (Hrvatska)', NULL, NULL),
(104, 'CU', 'Cuba', NULL, NULL),
(105, 'CY', 'Cyprus', NULL, NULL),
(106, 'CZ', 'Czech Republic', NULL, NULL),
(107, 'DK', 'Denmark', NULL, NULL),
(108, 'DJ', 'Djibouti', NULL, NULL),
(109, 'DM', 'Dominica', NULL, NULL),
(110, 'DO', 'Dominican Republic', NULL, NULL),
(111, 'TP', 'East Timor', NULL, NULL),
(112, 'EC', 'Ecuador', NULL, NULL),
(113, 'EG', 'Egypt', NULL, NULL),
(114, 'SV', 'El Salvador', NULL, NULL),
(115, 'GQ', 'Equatorial Guinea', NULL, NULL),
(116, 'ER', 'Eritrea', NULL, NULL),
(117, 'EE', 'Estonia', NULL, NULL),
(118, 'ET', 'Ethiopia', NULL, NULL),
(119, 'FK', 'Falkland Islands (Malvinas)', NULL, NULL),
(120, 'FO', 'Faroe Islands', NULL, NULL),
(121, 'FJ', 'Fiji', NULL, NULL),
(122, 'FI', 'Finland', NULL, NULL),
(123, 'FR', 'France', NULL, NULL),
(124, 'FX', 'France, Metropolitan', NULL, NULL),
(125, 'GF', 'French Guiana', NULL, NULL),
(126, 'PF', 'French Polynesia', NULL, NULL),
(127, 'TF', 'French Southern Territories', NULL, NULL),
(128, 'GA', 'Gabon', NULL, NULL),
(129, 'GM', 'Gambia', NULL, NULL),
(130, 'GE', 'Georgia', NULL, NULL),
(131, 'DE', 'Germany', NULL, NULL),
(132, 'GH', 'Ghana', NULL, NULL),
(133, 'GI', 'Gibraltar', NULL, NULL),
(134, 'GK', 'Guernsey', NULL, NULL),
(135, 'GR', 'Greece', NULL, NULL),
(136, 'GL', 'Greenland', NULL, NULL),
(137, 'GD', 'Grenada', NULL, NULL),
(138, 'GP', 'Guadeloupe', NULL, NULL),
(139, 'GU', 'Guam', NULL, NULL),
(140, 'GT', 'Guatemala', NULL, NULL),
(141, 'GN', 'Guinea', NULL, NULL),
(142, 'GW', 'Guinea-Bissau', NULL, NULL),
(143, 'GY', 'Guyana', NULL, NULL),
(144, 'HT', 'Haiti', NULL, NULL),
(145, 'HM', 'Heard and Mc Donald Islands', NULL, NULL),
(146, 'HN', 'Honduras', NULL, NULL),
(147, 'HK', 'Hong Kong', NULL, NULL),
(148, 'HU', 'Hungary', NULL, NULL),
(149, 'IS', 'Iceland', NULL, NULL),
(150, 'IN', 'India', NULL, NULL),
(151, 'IM', 'Isle of Man', NULL, NULL),
(152, 'ID', 'Indonesia', NULL, NULL),
(153, 'IR', 'Iran (Islamic Republic of)', NULL, NULL),
(154, 'IQ', 'Iraq', NULL, NULL),
(155, 'IE', 'Ireland', NULL, NULL),
(156, 'IL', 'Israel', NULL, NULL),
(157, 'IT', 'Italy', NULL, NULL),
(158, 'CI', 'Ivory Coast', NULL, NULL),
(159, 'JE', 'Jersey', NULL, NULL),
(160, 'JM', 'Jamaica', NULL, NULL),
(161, 'JP', 'Japan', NULL, NULL),
(162, 'JO', 'Jordan', NULL, NULL),
(163, 'KZ', 'Kazakhstan', NULL, NULL),
(164, 'KE', 'Kenya', NULL, NULL),
(165, 'KI', 'Kiribati', NULL, NULL),
(166, 'KP', 'Korea, Democratic People\'s Republic of', NULL, NULL),
(167, 'KR', 'Korea, Republic of', NULL, NULL),
(168, 'XK', 'Kosovo', NULL, NULL),
(169, 'KW', 'Kuwait', NULL, NULL),
(170, 'KG', 'Kyrgyzstan', NULL, NULL),
(171, 'LA', 'Lao People\'s Democratic Republic', NULL, NULL),
(172, 'LV', 'Latvia', NULL, NULL),
(173, 'LB', 'Lebanon', NULL, NULL),
(174, 'LS', 'Lesotho', NULL, NULL),
(175, 'LR', 'Liberia', NULL, NULL),
(176, 'LY', 'Libyan Arab Jamahiriya', NULL, NULL),
(177, 'LI', 'Liechtenstein', NULL, NULL),
(178, 'LT', 'Lithuania', NULL, NULL),
(179, 'LU', 'Luxembourg', NULL, NULL),
(180, 'MO', 'Macau', NULL, NULL),
(181, 'MK', 'Macedonia', NULL, NULL),
(182, 'MG', 'Madagascar', NULL, NULL),
(183, 'MW', 'Malawi', NULL, NULL),
(184, 'MY', 'Malaysia', NULL, NULL),
(185, 'MV', 'Maldives', NULL, NULL),
(186, 'ML', 'Mali', NULL, NULL),
(187, 'MT', 'Malta', NULL, NULL),
(188, 'MH', 'Marshall Islands', NULL, NULL),
(189, 'MQ', 'Martinique', NULL, NULL),
(190, 'MR', 'Mauritania', NULL, NULL),
(191, 'MU', 'Mauritius', NULL, NULL),
(192, 'TY', 'Mayotte', NULL, NULL),
(193, 'MX', 'Mexico', NULL, NULL),
(194, 'FM', 'Micronesia, Federated States of', NULL, NULL),
(195, 'MD', 'Moldova, Republic of', NULL, NULL),
(196, 'MC', 'Monaco', NULL, NULL),
(197, 'MN', 'Mongolia', NULL, NULL),
(198, 'ME', 'Montenegro', NULL, NULL),
(199, 'MS', 'Montserrat', NULL, NULL),
(200, 'MA', 'Morocco', NULL, NULL),
(201, 'MZ', 'Mozambique', NULL, NULL),
(202, 'MM', 'Myanmar', NULL, NULL),
(203, 'NA', 'Namibia', NULL, NULL),
(204, 'NR', 'Nauru', NULL, NULL),
(205, 'NP', 'Nepal', NULL, NULL),
(206, 'NL', 'Netherlands', NULL, NULL),
(207, 'AN', 'Netherlands Antilles', NULL, NULL),
(208, 'NC', 'New Caledonia', NULL, NULL),
(209, 'NZ', 'New Zealand', NULL, NULL),
(210, 'NI', 'Nicaragua', NULL, NULL),
(211, 'NE', 'Niger', NULL, NULL),
(212, 'NG', 'Nigeria', NULL, NULL),
(213, 'NU', 'Niue', NULL, NULL),
(214, 'NF', 'Norfolk Island', NULL, NULL),
(215, 'MP', 'Northern Mariana Islands', NULL, NULL),
(216, 'NO', 'Norway', NULL, NULL),
(217, 'OM', 'Oman', NULL, NULL),
(218, 'PK', 'Pakistan', NULL, NULL),
(219, 'PW', 'Palau', NULL, NULL),
(220, 'PS', 'Palestine', NULL, NULL),
(221, 'PA', 'Panama', NULL, NULL),
(222, 'PG', 'Papua New Guinea', NULL, NULL),
(223, 'PY', 'Paraguay', NULL, NULL),
(224, 'PE', 'Peru', NULL, NULL),
(225, 'PH', 'Philippines', NULL, NULL),
(226, 'PN', 'Pitcairn', NULL, NULL),
(227, 'PL', 'Poland', NULL, NULL),
(228, 'PT', 'Portugal', NULL, NULL),
(229, 'PR', 'Puerto Rico', NULL, NULL),
(230, 'QA', 'Qatar', NULL, NULL),
(231, 'RE', 'Reunion', NULL, NULL),
(232, 'RO', 'Romania', NULL, NULL),
(233, 'RU', 'Russian Federation', NULL, NULL),
(234, 'RW', 'Rwanda', NULL, NULL),
(235, 'KN', 'Saint Kitts and Nevis', NULL, NULL),
(236, 'LC', 'Saint Lucia', NULL, NULL),
(237, 'VC', 'Saint Vincent and the Grenadines', NULL, NULL),
(238, 'WS', 'Samoa', NULL, NULL),
(239, 'SM', 'San Marino', NULL, NULL),
(240, 'ST', 'Sao Tome and Principe', NULL, NULL),
(241, 'SA', 'Saudi Arabia', NULL, NULL),
(242, 'SN', 'Senegal', NULL, NULL),
(243, 'RS', 'Serbia', NULL, NULL),
(244, 'SC', 'Seychelles', NULL, NULL),
(245, 'SL', 'Sierra Leone', NULL, NULL),
(246, 'SG', 'Singapore', NULL, NULL),
(247, 'SK', 'Slovakia', NULL, NULL),
(248, 'SI', 'Slovenia', NULL, NULL),
(249, 'SB', 'Solomon Islands', NULL, NULL),
(250, 'SO', 'Somalia', NULL, NULL),
(251, 'ZA', 'South Africa', NULL, NULL),
(252, 'GS', 'South Georgia South Sandwich Islands', NULL, NULL),
(253, 'SS', 'South Sudan', NULL, NULL),
(254, 'ES', 'Spain', NULL, NULL),
(255, 'LK', 'Sri Lanka', NULL, NULL),
(256, 'SH', 'St. Helena', NULL, NULL),
(257, 'PM', 'St. Pierre and Miquelon', NULL, NULL),
(258, 'SD', 'Sudan', NULL, NULL),
(259, 'SR', 'Suriname', NULL, NULL),
(260, 'SJ', 'Svalbard and Jan Mayen Islands', NULL, NULL),
(261, 'SZ', 'Swaziland', NULL, NULL),
(262, 'SE', 'Sweden', NULL, NULL),
(263, 'CH', 'Switzerland', NULL, NULL),
(264, 'SY', 'Syrian Arab Republic', NULL, NULL),
(265, 'TW', 'Taiwan', NULL, NULL),
(266, 'TJ', 'Tajikistan', NULL, NULL),
(267, 'TZ', 'Tanzania, United Republic of', NULL, NULL),
(268, 'TH', 'Thailand', NULL, NULL),
(269, 'TG', 'Togo', NULL, NULL),
(270, 'TK', 'Tokelau', NULL, NULL),
(271, 'TO', 'Tonga', NULL, NULL),
(272, 'TT', 'Trinidad and Tobago', NULL, NULL),
(273, 'TN', 'Tunisia', NULL, NULL),
(274, 'TR', 'Turkey', NULL, NULL),
(275, 'TM', 'Turkmenistan', NULL, NULL),
(276, 'TC', 'Turks and Caicos Islands', NULL, NULL),
(277, 'TV', 'Tuvalu', NULL, NULL),
(278, 'UG', 'Uganda', NULL, NULL),
(279, 'UA', 'Ukraine', NULL, NULL),
(280, 'AE', 'United Arab Emirates', NULL, NULL),
(281, 'GB', 'United Kingdom', NULL, NULL),
(282, 'US', 'United States', NULL, NULL),
(283, 'UM', 'United States minor outlying islands', NULL, NULL),
(284, 'UY', 'Uruguay', NULL, NULL),
(285, 'UZ', 'Uzbekistan', NULL, NULL),
(286, 'VU', 'Vanuatu', NULL, NULL),
(287, 'VA', 'Vatican City State', NULL, NULL),
(288, 'VE', 'Venezuela', NULL, NULL),
(289, 'VN', 'Vietnam', NULL, NULL),
(290, 'VG', 'Virgin Islands (British)', NULL, NULL),
(291, 'VI', 'Virgin Islands (U.S.)', NULL, NULL),
(292, 'WF', 'Wallis and Futuna Islands', NULL, NULL),
(293, 'EH', 'Western Sahara', NULL, NULL),
(294, 'YE', 'Yemen', NULL, NULL),
(295, 'ZR', 'Zaire', NULL, NULL),
(296, 'ZM', 'Zambia', NULL, NULL),
(297, 'ZW', 'Zimbabwe', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` int(10) UNSIGNED NOT NULL,
  `coupon_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` int(11) NOT NULL,
  `amount_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiry_date` date NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `coupon_code`, `amount`, `amount_type`, `expiry_date`, `status`, `created_at`, `updated_at`) VALUES
(6, 'Coupon001', 10, 'Percentage', '2019-12-06', 1, '2018-12-05 20:19:15', '2018-12-05 20:19:15');

-- --------------------------------------------------------

--
-- Table structure for table `delivery_address`
--

CREATE TABLE `delivery_address` (
  `id` int(10) UNSIGNED NOT NULL,
  `users_id` int(11) NOT NULL,
  `users_email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pincode` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `delivery_address`
--

INSERT INTO `delivery_address` (`id`, `users_id`, `users_email`, `name`, `address`, `city`, `state`, `country`, `pincode`, `mobile`, `created_at`, `updated_at`) VALUES
(2, 4, 'weshare@gmail.com', 'weshare', 'address', 'city', 'state', 'Cambodia', 'pincode', 'mobile', NULL, NULL),
(3, 1, 'demo@gmail.com', 'WeShare', 'WeShare', 'WeShare', 'WeShare', 'Albania', '12252', '010313234', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(3, '2014_10_12_000000_create_users_table', 2),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(8, '2018_10_20_040609_create_categories_table', 3),
(9, '2018_10_24_075802_create_products_table', 4),
(10, '2018_11_08_024109_create_product_att_table', 5),
(11, '2018_11_20_055123_create_tblgallery_table', 6),
(12, '2018_11_26_070031_create_cart_table', 7),
(13, '2018_11_28_072535_create_coupons_table', 8),
(15, '2018_12_01_042342_create_countries_table', 10),
(19, '2018_12_03_043804_add_more_fields_to_users_table', 14),
(17, '2018_12_03_093548_create_delivery_address_table', 12),
(18, '2018_12_05_024718_create_orders_table', 13);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `users_id` int(11) NOT NULL,
  `users_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pincode` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_charges` double(8,2) NOT NULL,
  `coupon_code` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `coupon_amount` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_status` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_method` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `grand_total` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `users_id`, `users_email`, `name`, `address`, `city`, `state`, `pincode`, `country`, `mobile`, `shipping_charges`, `coupon_code`, `coupon_amount`, `order_status`, `payment_method`, `grand_total`, `created_at`, `updated_at`) VALUES
(7, 1, 'demo@gmail.com', 'WeShare', '123 Street', 'Phnom Penh', 'PP', '12252', 'Cambodia', '010313234', 0.00, 'NO Coupon', '0', 'success', 'Paypal', '70', '2018-12-06 18:20:18', '2018-12-06 18:20:18'),
(6, 4, 'weshare@gmail.com', 'weshare', 'address', 'city', 'state', 'pincode', 'Cambodia', 'mobile', 0.00, 'Coupon001', '2', 'success', 'Paypal', '18', '2018-12-06 01:45:09', '2018-12-06 01:45:09');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `categories_id` int(11) NOT NULL,
  `p_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `p_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `p_color` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(8,2) NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `categories_id`, `p_name`, `p_code`, `p_color`, `description`, `price`, `image`, `created_at`, `updated_at`) VALUES
(28, 15, 'Lexus Rx 330', '12152', 'White', 'EXCELLENT SAFETY FOR YOUR FAMILY<br>Child Safety Locks, Electronic Stability Control, Brake Assist, 4-Wheel ABS, Tire Pressure Monitoring System, 4-Wheel Disc Brakes Safety equipment includes Child Safety Locks', 15.00, '1544063712-lexus-rx-330.jpg', '2018-12-05 19:35:12', '2018-12-05 19:43:48'),
(27, 15, '2019 New Toyota Highlander XLE V6', 'XLE V6 FWD', 'White', 'Sunroof, Heated Leather Seats, NAV, 3rd Row Seat, Alloy Wheels, Quad Seats, Rear Air, Power Liftgate. XLE trim. Warranty 5 yrs/60k Miles - Drivetrain Warranty; AND MORE!', 20.00, '1544063425-2019-new-toyota-highlander-xle-v6.jpg', '2018-12-05 19:30:25', '2018-12-05 19:43:57'),
(29, 12, '2018 Toyota Prius', '1252', 'Red', 'VEHICLE FEATURES<br>Rear Spoiler, MP3 Player, Remote Trunk Release, Keyless Entry, Privacy Glass.&nbsp;', 5.00, '1544063924-2018-toyota-prius.jpg', '2018-12-05 19:38:44', '2018-12-05 19:43:38'),
(30, 16, 'Link House New LC2', 'L_1252', 'Gray', 'Borey Peng Huoth Cambodia', 10.00, '1544064142-link-house-new-lc2.jpg', '2018-12-05 19:42:22', '2018-12-05 19:42:22'),
(31, 10, 'House', '5214', 'White and Brown', 'House For Sale', 10.00, '1544064430-house.jpg', '2018-12-05 19:47:10', '2018-12-05 19:47:10'),
(32, 11, 'Vionic Shoes Brand', '5265', 'All Colors', 'Women Shoes', 12.00, '1544064607-vionic-shoes-brand.jpg', '2018-12-05 19:50:07', '2018-12-05 19:50:07'),
(33, 17, 'Cole Haan', 'KHR 775659.29', 'Brown', 'Men\'s Original Grand Wingtip Oxfords', 5.00, '1544064903-cole-haan.jpg', '2018-12-05 19:55:03', '2018-12-05 19:55:03'),
(34, 13, 'Lenovo ThinkPad', '1252', 'Black', 'Lenovo Thinkpad From China', 2.00, '1544065331-lenovo-thinkpad.jpg', '2018-12-05 20:02:12', '2018-12-05 20:02:12'),
(35, 14, 'Cloths', 'The Man', 'Black', 'Cloths Description here', 2.00, '1544065493-cloths.png', '2018-12-05 20:04:54', '2018-12-05 20:04:54');

-- --------------------------------------------------------

--
-- Table structure for table `product_att`
--

CREATE TABLE `product_att` (
  `id` int(10) UNSIGNED NOT NULL,
  `products_id` int(11) NOT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(8,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_att`
--

INSERT INTO `product_att` (`id`, `products_id`, `sku`, `size`, `price`, `stock`, `created_at`, `updated_at`) VALUES
(14, 34, 'SKU-Lenovo X1', '15 inch', 10.00, 2, '2018-12-05 20:08:43', '2018-12-05 20:08:43'),
(13, 35, 'SKU-Red', 'S', 2.00, 5, '2018-12-05 20:08:08', '2018-12-05 20:08:08'),
(12, 35, 'SKU-White', 'L', 6.00, 2, '2018-12-05 20:07:42', '2018-12-05 20:07:42'),
(11, 35, 'SKU-Black', 'M', 5.00, 10, '2018-12-05 20:07:11', '2018-12-05 20:07:11'),
(15, 34, 'SKU-Carbon', '14 inch', 4.00, 5, '2018-12-05 20:09:05', '2018-12-05 20:09:05'),
(16, 33, 'SKU-Haan1', '25', 12.00, 3, '2018-12-05 20:09:45', '2018-12-05 20:09:45'),
(17, 33, 'SKU-Haan2', '22', 10.00, 1, '2018-12-05 20:09:58', '2018-12-05 20:09:58'),
(18, 33, 'SKU-Haan3', '19', 2.00, 3, '2018-12-05 20:10:16', '2018-12-05 20:10:16'),
(19, 32, 'SKU-Vionic1', '20', 10.00, 5, '2018-12-05 20:11:02', '2018-12-05 20:11:02'),
(20, 32, 'SKU-Vionic2', '20', 15.00, 4, '2018-12-05 20:11:24', '2018-12-05 20:11:24'),
(21, 32, 'SKU-Vionic3', '30', 20.00, 1, '2018-12-05 20:11:38', '2018-12-05 20:11:38'),
(22, 31, 'SKU-House1', '5*20', 25.00, 4, '2018-12-05 20:12:13', '2018-12-05 20:12:13'),
(23, 31, 'SKU-House2', '10*10', 20.00, 2, '2018-12-05 20:12:30', '2018-12-05 20:12:30'),
(24, 31, 'SKU-House3', '20*20', 20.00, 5, '2018-12-05 20:12:46', '2018-12-05 20:12:46'),
(25, 30, 'SKU-Link House1', 'Small', 10.00, 5, '2018-12-05 20:13:06', '2018-12-05 20:13:06'),
(26, 30, 'SKU-House2', 'Medium', 15.00, 23, '2018-12-05 20:13:23', '2018-12-05 20:13:23'),
(27, 30, 'SKU-House3', 'Large', 5.00, 2, '2018-12-05 20:14:55', '2018-12-05 20:14:55'),
(28, 29, 'SKU-Prius1', 'One Size', 12.00, 2, '2018-12-05 20:15:43', '2018-12-05 20:15:43'),
(29, 28, 'SKU-Lexus Red', 'Size Red', 12.00, 12, '2018-12-05 20:16:28', '2018-12-05 20:16:28'),
(30, 28, 'SKU-Lexus2', 'Size Black', 11.00, 22, '2018-12-05 20:16:48', '2018-12-05 20:16:48'),
(31, 28, 'SKU-Lexus3', 'Size White', 12.00, 2, '2018-12-05 20:17:02', '2018-12-05 20:17:02'),
(32, 27, 'SKU-Hilander', 'Size Black', 50.00, 10, '2018-12-05 20:17:35', '2018-12-05 20:17:35'),
(33, 27, 'SKU-Hilander1', 'Size White', 20.00, 10, '2018-12-05 20:17:46', '2018-12-05 20:17:46'),
(34, 27, 'SKU-Hilande3', 'Size Red', 20.00, 10, '2018-12-05 20:18:01', '2018-12-05 20:18:01');

-- --------------------------------------------------------

--
-- Table structure for table `tblgallery`
--

CREATE TABLE `tblgallery` (
  `id` int(10) UNSIGNED NOT NULL,
  `products_id` int(11) NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tblgallery`
--

INSERT INTO `tblgallery` (`id`, `products_id`, `image`, `created_at`, `updated_at`) VALUES
(8, 27, '7664271544063472.jpg', '2018-12-05 19:31:12', '2018-12-05 19:31:12'),
(9, 27, '6768551544063472.jpg', '2018-12-05 19:31:13', '2018-12-05 19:31:13'),
(10, 27, '4131281544063473.jpg', '2018-12-05 19:31:13', '2018-12-05 19:31:13'),
(11, 28, '6720891544063734.jpg', '2018-12-05 19:35:34', '2018-12-05 19:35:34'),
(12, 28, '4686631544063734.jpg', '2018-12-05 19:35:34', '2018-12-05 19:35:34'),
(13, 28, '5960611544063759.jpeg', '2018-12-05 19:35:59', '2018-12-05 19:35:59'),
(14, 29, '5146071544063935.JPG', '2018-12-05 19:38:55', '2018-12-05 19:38:55'),
(15, 29, '762811544063935.jpg', '2018-12-05 19:38:55', '2018-12-05 19:38:55'),
(16, 29, '3716041544063935.jpg', '2018-12-05 19:38:56', '2018-12-05 19:38:56'),
(17, 30, '6832831544064156.jpg', '2018-12-05 19:42:37', '2018-12-05 19:42:37'),
(18, 30, '1655391544064157.jpg', '2018-12-05 19:42:37', '2018-12-05 19:42:37'),
(19, 30, '4693601544064157.jpg', '2018-12-05 19:42:37', '2018-12-05 19:42:37'),
(20, 31, '9233341544064441.jpg', '2018-12-05 19:47:21', '2018-12-05 19:47:21'),
(21, 31, '8167501544064441.jpg', '2018-12-05 19:47:22', '2018-12-05 19:47:22'),
(22, 31, '3887071544064442.jpg', '2018-12-05 19:47:22', '2018-12-05 19:47:22'),
(23, 32, '3998691544064618.jpg', '2018-12-05 19:50:18', '2018-12-05 19:50:18'),
(24, 32, '1159141544064618.jpg', '2018-12-05 19:50:18', '2018-12-05 19:50:18'),
(25, 32, '2035101544064618.jpg', '2018-12-05 19:50:18', '2018-12-05 19:50:18'),
(26, 33, '2128501544064917.jpg', '2018-12-05 19:55:17', '2018-12-05 19:55:17'),
(27, 33, '5649911544064917.jpg', '2018-12-05 19:55:17', '2018-12-05 19:55:17'),
(28, 33, '3704141544064917.jpg', '2018-12-05 19:55:17', '2018-12-05 19:55:17'),
(29, 34, '3899431544065346.JPG', '2018-12-05 20:02:26', '2018-12-05 20:02:26'),
(30, 34, '119131544065346.jpg', '2018-12-05 20:02:27', '2018-12-05 20:02:27'),
(31, 34, '6905491544065347.jpg', '2018-12-05 20:02:27', '2018-12-05 20:02:27'),
(32, 35, '981591544065510.jpeg', '2018-12-05 20:05:10', '2018-12-05 20:05:10'),
(33, 35, '5320811544065510.jpg', '2018-12-05 20:05:11', '2018-12-05 20:05:11'),
(34, 35, '1153181544065511.jpg', '2018-12-05 20:05:11', '2018-12-05 20:05:11');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin` tinyint(4) DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pincode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `admin`, `remember_token`, `created_at`, `updated_at`, `address`, `city`, `state`, `country`, `pincode`, `mobile`) VALUES
(1, 'WeShare', 'demo@gmail.com', NULL, '$2y$10$VaAF1snGwSPkIb3a2VpVEuernGR1KBSwSWaoYsDRdVpULzdBdXJia', 1, 'UCGR2lE2IfFIQtoNHGIpd5lQo4qAWpHXporVG4jNShVksoM3IsCNCFKE5biu', '2018-10-15 02:32:54', '2018-12-05 01:39:52', '123 Street', 'Phnom Penh', 'PP', 'Cambodia', '12252', '010313234'),
(4, 'weshare', 'weshare@gmail.com', NULL, '$2y$10$VaAF1snGwSPkIb3a2VpVEuernGR1KBSwSWaoYsDRdVpULzdBdXJia', NULL, 'aM3jklzLwgtIuufwmjKHXLpVUrVKYMAv7eI9oyrWtUxtxL5uQYmIAekJfNrY', '2018-12-06 01:40:27', '2018-12-06 01:40:27', NULL, NULL, NULL, NULL, NULL, NULL),
(5, 'User1', 'user1@gmail.com', NULL, '$2y$10$fUnb/86CjXaRaq7A24BdWuGCb0l4HEFQwkaaLdGNiogUxXVaPzNRa', NULL, NULL, '2019-08-24 23:33:08', '2019-08-24 23:33:08', NULL, NULL, NULL, NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`name`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_address`
--
ALTER TABLE `delivery_address`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_att`
--
ALTER TABLE `product_att`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblgallery`
--
ALTER TABLE `tblgallery`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=298;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `delivery_address`
--
ALTER TABLE `delivery_address`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `product_att`
--
ALTER TABLE `product_att`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `tblgallery`
--
ALTER TABLE `tblgallery`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Database: `ecommerce`
--
CREATE DATABASE IF NOT EXISTS `ecommerce` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `ecommerce`;

-- --------------------------------------------------------

--
-- Table structure for table `data_rows`
--

CREATE TABLE `data_rows` (
  `id` int(10) UNSIGNED NOT NULL,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `data_types`
--

CREATE TABLE `data_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(12, '2014_10_12_000000_create_users_table', 1),
(13, '2014_10_12_100000_create_password_resets_table', 1),
(14, '2016_01_01_000000_add_voyager_user_fields', 1),
(15, '2016_01_01_000000_create_data_types_table', 1),
(16, '2016_01_01_000000_create_pages_table', 1),
(17, '2016_01_01_000000_create_posts_table', 1),
(18, '2016_02_15_204651_create_product_categories_table', 1),
(19, '2016_05_19_173453_create_menu_table', 1),
(20, '2016_10_21_190000_create_roles_table', 1),
(21, '2016_10_21_190000_create_settings_table', 1),
(22, '2016_11_30_135954_create_permission_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8_unicode_ci,
  `body` text COLLATE utf8_unicode_ci,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8_unicode_ci,
  `meta_keywords` text COLLATE utf8_unicode_ci,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `table_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `seo_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `excerpt` text COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8_unicode_ci NOT NULL,
  `meta_keywords` text COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

CREATE TABLE `product_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  `details` text COLLATE utf8_unicode_ci,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'users/default.png',
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Indexes for table `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`);

--
-- Indexes for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_categories_slug_unique` (`slug`),
  ADD KEY `product_categories_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

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
-- AUTO_INCREMENT for table `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD CONSTRAINT `product_categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `product_categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
--
-- Database: `emp_mgmt`
--
CREATE DATABASE IF NOT EXISTS `emp_mgmt` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `emp_mgmt`;

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `id` int(10) UNSIGNED NOT NULL,
  `state_id` int(11) NOT NULL,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`id`, `state_id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Lovers Leep', '2019-06-15 04:08:08', '2019-06-15 04:08:08', NULL),
(2, 2, 'Rusta', '2019-06-21 07:16:48', '2019-06-21 07:16:48', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `id` int(10) UNSIGNED NOT NULL,
  `country_code` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`id`, `country_code`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'FR8', 'France', '2019-06-15 04:07:14', '2019-06-15 04:07:14', NULL),
(2, 'GR5', 'Germany', '2019-06-21 07:15:53', '2019-06-21 07:15:53', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Operation', '2019-06-15 04:05:22', '2019-06-15 04:05:22', NULL),
(2, 'Construction', '2019-06-28 07:29:28', '2019-06-28 07:29:28', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `division`
--

CREATE TABLE `division` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `division`
--

INSERT INTO `division` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Technical', '2019-06-15 04:06:04', '2019-06-15 04:06:04', NULL),
(2, 'Support', '2019-06-15 04:06:24', '2019-06-15 04:06:24', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int(10) UNSIGNED NOT NULL,
  `lastname` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `middlename` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city_id` int(11) NOT NULL,
  `state_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `zip` char(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `age` int(11) NOT NULL,
  `birthdate` date NOT NULL,
  `date_hired` date NOT NULL,
  `department_id` int(11) NOT NULL,
  `division_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `picture` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_salary`
--

CREATE TABLE `employee_salary` (
  `id` int(10) UNSIGNED NOT NULL,
  `employee_id` int(11) NOT NULL,
  `salary` decimal(16,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(9, '2014_10_12_000000_create_users_table', 1),
(10, '2017_03_17_163141_create_employees_table', 1),
(11, '2017_03_18_001905_create_employee_salary_table', 1),
(12, '2017_03_18_003431_create_department_table', 1),
(13, '2017_03_18_004142_create_division_table', 1),
(14, '2017_03_18_004326_create_country_table', 1),
(15, '2017_03_18_005005_create_state_table', 1),
(16, '2017_03_18_005241_create_city_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `state`
--

CREATE TABLE `state` (
  `id` int(10) UNSIGNED NOT NULL,
  `country_id` int(11) NOT NULL,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `state`
--

INSERT INTO `state` (`id`, `country_id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Paris', '2019-06-15 04:07:44', '2019-06-15 04:07:44', NULL),
(2, 1, 'Mascow', '2019-06-21 07:14:13', '2019-06-21 07:14:13', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `lastname`, `firstname`, `remember_token`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@gmail.com', '$2y$10$tHnHN9eTUWs4DLa3.RlVluehp7diZU/UOOGQBG74AI3GWMQf4U.Mm', 'Mr', 'admin', 'nhq9TxnDsG', NULL, '2017-03-25 18:43:48', '2017-03-25 18:43:48'),
(2, 'Admin', 'admin1@gmail.com', '$2y$10$V4T0lubS6Vy2afUS3zMPkOOBWfMlN03.KEoi/JwRzBu.KO/m2CtWa', 'Admin', 'Super', NULL, NULL, '2019-06-04 05:00:00', NULL),
(3, 'user1', 'user1@gmail.com', '$2y$10$EUpWGeO2CGe2hPDVexY.2eJJx8ZcTFNWyFnq4xEqNM.vv.0TPL3QC', 'User', 'Test', '5KEVIVi0V4xlWo6IOJNzNQzZX1vf62BrR9qEiLvkDVOMzZw5YrH6lBGlCOQ0', NULL, '2019-06-15 03:52:53', '2019-06-15 03:52:53'),
(4, 'User2', 'users2@gmail.com', '$2y$10$n2gMtfcV0HRDN9dfuBf8.eq1y7x2SzLTU9W2kM/OyIJQqvvs91uUe', 'User2', 'Test', NULL, NULL, '2019-06-15 03:54:06', '2019-06-15 03:54:06'),
(5, 'User3', 'user3@gmail.com', '$2y$10$Gaw/kKHGOC71p09Go7DvUevdlfYaZZiy31ZIMQgxKcX1zqi0Aojlq', 'User3', 'Test', NULL, NULL, '2019-06-15 03:55:25', '2019-06-15 03:55:25'),
(6, 'User5', 'user5@gmail.com', '$2y$10$1Wk71J9DK1GlaKw4PBLfz.U6Nu8eig4bQeNvk./X0y3.bSwvixlSq', 'User5', 'Test', NULL, NULL, '2019-06-15 04:04:18', '2019-06-15 04:04:18');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`id`),
  ADD KEY `city_state_id_foreign` (`state_id`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `division`
--
ALTER TABLE `division`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employees_city_id_foreign` (`city_id`),
  ADD KEY `employees_state_id_foreign` (`state_id`),
  ADD KEY `employees_country_id_foreign` (`country_id`),
  ADD KEY `employees_department_id_foreign` (`department_id`),
  ADD KEY `employees_division_id_foreign` (`division_id`),
  ADD KEY `employees_company_id_foreign` (`company_id`);

--
-- Indexes for table `employee_salary`
--
ALTER TABLE `employee_salary`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_salary_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `state`
--
ALTER TABLE `state`
  ADD PRIMARY KEY (`id`),
  ADD KEY `state_country_id_foreign` (`country_id`);

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
-- AUTO_INCREMENT for table `city`
--
ALTER TABLE `city`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `division`
--
ALTER TABLE `division`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_salary`
--
ALTER TABLE `employee_salary`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `state`
--
ALTER TABLE `state`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Database: `jeme`
--
CREATE DATABASE IF NOT EXISTS `jeme` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `jeme`;

-- --------------------------------------------------------

--
-- Table structure for table `buildings`
--

CREATE TABLE `buildings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `service_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `buildings`
--

INSERT INTO `buildings` (`id`, `user_id`, `service_id`, `location_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 2, 'Couples Resort & Spa', '2019-08-22 08:05:41', '2019-08-22 08:28:53'),
(2, 1, 2, 1, 'AC', '2019-08-22 08:06:07', '2019-08-22 08:06:07'),
(3, 1, 2, 1, 'AC Hotel', '2019-08-22 08:06:24', '2019-08-22 08:06:24'),
(4, 1, 1, 1, 'Pegasus', '2019-08-22 08:11:58', '2019-08-22 08:11:58');

-- --------------------------------------------------------

--
-- Table structure for table `faults`
--

CREATE TABLE `faults` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `job_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `job_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `issue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logged_by` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `installations`
--

CREATE TABLE `installations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `job_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contract_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `erector` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`id`, `user_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 1, 'New Kgn', '2019-08-22 07:56:09', '2019-08-22 07:56:09'),
(2, 1, 'Tower Isle', '2019-08-22 07:56:40', '2019-08-22 07:56:40'),
(3, 1, 'Downtown', '2019-08-26 04:17:45', '2019-08-26 04:17:45');

-- --------------------------------------------------------

--
-- Table structure for table `machine_numbers`
--

CREATE TABLE `machine_numbers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `building_id` int(10) UNSIGNED NOT NULL,
  `machine_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `machine_numbers`
--

INSERT INTO `machine_numbers` (`id`, `user_id`, `building_id`, `machine_no`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '08NRL901', '2019-08-22 08:29:43', '2019-08-22 08:29:43'),
(2, 1, 1, '08NRL902', '2019-08-22 08:30:11', '2019-08-22 08:30:11'),
(3, 1, 4, '09HLN670', '2019-08-26 06:50:45', '2019-08-26 06:50:45');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(9, '2014_10_12_000000_create_users_table', 1),
(10, '2014_10_12_100000_create_password_resets_table', 1),
(11, '2019_06_03_223625_create_permission_tables', 1),
(12, '2019_06_08_032011_create_installations_table', 1),
(13, '2019_06_14_134547_create_faults_table', 1),
(14, '2019_07_05_003743_create_service_numbers_table', 1),
(15, '2019_07_14_170834_create_locations_table', 1),
(16, '2019_07_17_231132_create_machine_numbers_table', 1),
(17, '2019_07_21_033940_create_service_orders_table', 1),
(18, '2019_08_19_012310_create_buildings_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_permissions`
--

INSERT INTO `model_has_permissions` (`permission_id`, `model_type`, `model_id`) VALUES
(1, 'App\\User', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\User', 1),
(1, 'App\\User', 5);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Super-admin roles & permissions', 'web', '2019-08-22 07:47:23', '2019-08-22 07:47:23');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Super-admin', 'web', '2019-08-22 07:47:23', '2019-08-22 07:47:23');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `service_numbers`
--

CREATE TABLE `service_numbers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `service_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `service_numbers`
--

INSERT INTO `service_numbers` (`id`, `user_id`, `service_no`, `created_at`, `updated_at`) VALUES
(1, 1, 'FML4001', '2019-08-22 07:54:48', '2019-08-22 07:54:48'),
(2, 1, 'FML4002', '2019-08-22 07:55:05', '2019-08-22 07:55:05'),
(3, 1, 'FML4003', '2019-08-22 07:55:29', '2019-08-22 07:55:29');

-- --------------------------------------------------------

--
-- Table structure for table `service_orders`
--

CREATE TABLE `service_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `order_no` int(10) UNSIGNED NOT NULL,
  `service_id` int(10) UNSIGNED NOT NULL,
  `building_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `machine_id` int(10) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `charge_to` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_of_person` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `taken_by` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `work_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `service_orders`
--

INSERT INTO `service_orders` (`id`, `user_id`, `order_no`, `service_id`, `building_id`, `location_id`, `machine_id`, `date`, `address`, `charge_to`, `customer`, `no_of_person`, `order_type`, `taken_by`, `status`, `work_description`, `created_at`, `updated_at`) VALUES
(2, 1, 10003, 1, 3, 1, 1, '2019-08-23', '34 Musgrave Ave', 'Sandals Group', 'Sandals', '3', 'FM EXAM', 'D Perry', 'Yes', 'Monthly Maintenance', '2019-08-25 03:57:42', '2019-08-25 03:57:42'),
(3, 1, 10063, 2, 1, 2, 2, '2019-08-28', 'Tower Isle', 'Couples Group', 'Couples', '2', 'FML EXAM', 'D. Perry', 'No', 'Monthly Maintainance', '2019-08-25 04:33:20', '2019-08-25 04:33:20'),
(5, 1, 10001, 3, 1, 2, 2, '2019-08-30', 'Tower Isle', 'Couples', 'Couples Group', '1', 'FML EXAM', 'D. Perry', 'Yes', 'Monthly Maintenance', '2019-08-25 21:50:13', '2019-08-25 21:50:13'),
(6, 2, 10044, 3, 3, 1, 2, '2019-08-30', '47 Musgrave Ave', 'Marriot', 'Marriot', '1', 'REPAIR', 'D. Perry', 'No', 'Check and repair top floor landing door lock.', '2019-08-25 22:25:34', '2019-08-25 22:25:34'),
(7, 2, 10003, 1, 3, 1, 1, '2020-02-21', '34 Musgrave Ave', 'Sandals Group', 'Sandals', '3', 'FML EXAM', 'D Perry', 'Yes', 'Monthly Maintenance', '2019-08-26 00:47:32', '2019-08-26 00:47:32'),
(8, 2, 10003, 1, 3, 1, 1, '2020-02-21', '34 Musgrave Ave', 'Sandals Group', 'Sandals', '3', 'FML EXAM', 'D Perry', 'Yes', 'Monthly Maintenance', '2019-08-26 00:48:18', '2019-08-26 00:48:18'),
(9, 2, 10001, 3, 4, 1, 1, '2019-08-31', '4 Knutford Boulevard', 'Pegasus', 'Pegasus', '1', 'CALL BACK', 'M. Samuel', 'Yes', 'Examine hoistway doors and return elevator to normal operation.', '2019-08-26 02:32:20', '2019-08-26 02:32:20');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Dwight Perry', 'dd.perry@hotmail.com', NULL, '$2y$10$VaAF1snGwSPkIb3a2VpVEuernGR1KBSwSWaoYsDRdVpULzdBdXJia', NULL, '2019-08-22 07:19:55', '2019-08-22 07:19:55'),
(3, 'User1', 'user1@gmail.com', NULL, '$2y$10$VDoC6RIUr.033oHIB.WuwO3vbP7JiZ23wFS7gkJrKGXO7Ic2c0laG', NULL, '2019-08-26 06:41:20', '2019-08-26 06:41:20'),
(4, 'User2', 'user2@gmail.com', NULL, '$2y$10$a05zObh3AW6XPwMYqfGunubteYA81r78VKRtw7Yb24vfz8tVHjZ4O', NULL, '2019-08-26 06:41:56', '2019-08-26 06:41:56'),
(5, 'Micheal Samuel', 'msamuel@yahoo.com', NULL, '$2y$10$NAwqEI5/ERXeyQsi768yAOZYdzwpOlZSddZD9o.iSj52NWGlaK/ra', NULL, '2019-08-28 06:02:57', '2019-08-28 06:02:57');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `buildings`
--
ALTER TABLE `buildings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faults`
--
ALTER TABLE `faults`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `installations`
--
ALTER TABLE `installations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `installations_job_number_unique` (`job_number`),
  ADD UNIQUE KEY `installations_contract_number_unique` (`contract_number`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `machine_numbers`
--
ALTER TABLE `machine_numbers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `service_numbers`
--
ALTER TABLE `service_numbers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_orders`
--
ALTER TABLE `service_orders`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `buildings`
--
ALTER TABLE `buildings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `faults`
--
ALTER TABLE `faults`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `installations`
--
ALTER TABLE `installations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `machine_numbers`
--
ALTER TABLE `machine_numbers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `service_numbers`
--
ALTER TABLE `service_numbers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `service_orders`
--
ALTER TABLE `service_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(11) NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

--
-- Dumping data for table `pma__designer_settings`
--

INSERT INTO `pma__designer_settings` (`username`, `settings_data`) VALUES
('root', '{\"angular_direct\":\"direct\",\"snap_to_grid\":\"off\",\"relation_lines\":\"true\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

--
-- Dumping data for table `pma__export_templates`
--

INSERT INTO `pma__export_templates` (`id`, `username`, `export_type`, `template_name`, `template_data`) VALUES
(1, 'root', 'database', 'jeme', '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"structure_or_data_forced\":\"0\",\"table_select[]\":[\"migrations\",\"model_has_permissions\",\"model_has_roles\",\"password_resets\",\"permissions\",\"roles\",\"role_has_permissions\",\"users\"],\"table_structure[]\":[\"migrations\",\"model_has_permissions\",\"model_has_roles\",\"password_resets\",\"permissions\",\"roles\",\"role_has_permissions\",\"users\"],\"table_data[]\":[\"migrations\",\"model_has_permissions\",\"model_has_roles\",\"password_resets\",\"permissions\",\"roles\",\"role_has_permissions\",\"users\"],\"aliases_new\":\"\",\"output_format\":\"sendit\",\"filename_template\":\"@DATABASE@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_structure_or_data\":\"data\",\"excel_null\":\"NULL\",\"excel_columns\":\"something\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"json_structure_or_data\":\"data\",\"json_unicode\":\"something\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"Structure of table @TABLE@\",\"latex_structure_continued_caption\":\"Structure of table @TABLE@ (continued)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"Content of table @TABLE@\",\"latex_data_continued_caption\":\"Content of table @TABLE@ (continued)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"mediawiki_structure_or_data\":\"structure_and_data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"pdf_report_title\":\"\",\"pdf_structure_or_data\":\"structure_and_data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_use_transaction\":\"something\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_procedure_function\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"xml_structure_or_data\":\"data\",\"xml_export_events\":\"something\",\"xml_export_functions\":\"something\",\"xml_export_procedures\":\"something\",\"xml_export_tables\":\"something\",\"xml_export_triggers\":\"something\",\"xml_export_views\":\"something\",\"xml_export_contents\":\"something\",\"yaml_structure_or_data\":\"data\",\"\":null,\"lock_tables\":null,\"as_separate_files\":null,\"csv_removeCRLF\":null,\"csv_columns\":null,\"excel_removeCRLF\":null,\"json_pretty_print\":null,\"htmlword_columns\":null,\"ods_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_create_database\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"texytext_columns\":null}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"jeme\",\"table\":\"users\"},{\"db\":\"best_ecom\",\"table\":\"users\"},{\"db\":\"ecommerce\",\"table\":\"migrations\"},{\"db\":\"ecommerce\",\"table\":\"users\"},{\"db\":\"best_ecom\",\"table\":\"coupons\"},{\"db\":\"best_ecom\",\"table\":\"cart\"},{\"db\":\"best_ecom\",\"table\":\"countries\"},{\"db\":\"jeme\",\"table\":\"service_orders\"},{\"db\":\"jeme\",\"table\":\"role_has_permissions\"},{\"db\":\"jeme\",\"table\":\"locations\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT '0',
  `x` float UNSIGNED NOT NULL DEFAULT '0',
  `y` float UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin,
  `data_sql` longtext COLLATE utf8_bin,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2019-08-28 03:37:49', '{\"Console\\/Mode\":\"collapse\",\"NavigationWidth\":222}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `supermarket`
--
CREATE DATABASE IF NOT EXISTS `supermarket` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `supermarket`;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `body` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `commentable_id` int(11) NOT NULL,
  `commentable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` int(10) UNSIGNED NOT NULL,
  `expenses_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `party_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `totalamount` double NOT NULL,
  `paidamount` double NOT NULL,
  `dueamount` double NOT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `modified_by` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expenses`
--

INSERT INTO `expenses` (`id`, `expenses_name`, `party_name`, `totalamount`, `paidamount`, `dueamount`, `product_name`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(1, 'Rent Expenses', 'House Owner', 50000, 5000, 45000, 'home', 'admin', 'admin', '2017-07-20 14:01:44', '2017-07-20 14:01:57'),
(2, 'Bill payment', 'Subusu', 4000, 4000, 0, 'Internet', 'admin', 'admin', '2017-10-28 19:52:48', '2017-10-28 20:43:32');

-- --------------------------------------------------------

--
-- Table structure for table `expensestitles`
--

CREATE TABLE `expensestitles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expensestitles`
--

INSERT INTO `expensestitles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Consumable Expenses', '2017-07-20 14:00:46', '2017-07-20 14:00:46'),
(2, 'Rent Expenses', '2017-07-20 14:00:58', '2017-07-20 14:00:58'),
(3, 'Bill payment', '2017-10-28 19:52:16', '2017-10-28 19:52:16');

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `likable_id` int(11) NOT NULL,
  `likable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 2),
(3, '2017_05_28_124228_create_roles_table', 3),
(4, '2017_05_28_124417_create_user_roles_table', 4),
(5, '2017_05_28_124654_create_permissions_table', 5),
(6, '2017_05_28_124806_create_role_permissions_table', 6),
(7, '2017_05_28_125406_create_modules_table', 7),
(8, '2017_05_28_125428_create_role_modules_table', 8),
(9, '2017_06_07_103849_create_productcategories_table', 9),
(10, '2017_06_07_103917_create_products_table', 10),
(11, '2017_06_09_071114_create_sales_table', 11),
(12, '2017_06_26_093722_create_expenses_table', 12),
(13, '2017_07_06_132245_create_salescarts_table', 13),
(14, '2017_07_06_141913_create_expensestitles_table', 14),
(15, '2017_07_07_125933_create_purchases_table', 15),
(17, '2017_07_17_084213_create_transactions_table', 16),
(18, '2017_04_13_012507_create_threads_table', 17),
(19, '2017_04_17_080216_add_user_id_to_threads', 17),
(20, '2017_04_22_123222_create_comments_table', 17),
(21, '2017_05_06_161732_add_solution_column_in_threads_table', 17),
(22, '2017_05_08_032932_create_likes_table', 17),
(23, '2017_05_20_132643_create_notifications_table', 17),
(24, '2017_07_03_004159_create_tags_table', 17),
(25, '2017_07_03_004815_create_tags_thread_table', 17);

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE `modules` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `module_key` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `module_url` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `module_icon` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `module_rank` int(11) NOT NULL,
  `view_sidebar` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`id`, `name`, `module_key`, `module_url`, `module_icon`, `module_rank`, `view_sidebar`, `created_at`, `updated_at`) VALUES
(1, 'Dashboard', 'dashboard', 'dashboard-panel', 'fa fa-home', 1, 1, '2017-06-21 17:30:00', NULL),
(2, 'User Management', 'user_management', 'user-register', 'fa fa-user', 2, 1, '2017-06-06 03:44:05', '2017-06-06 03:44:05'),
(3, 'Module Management', 'module_management', 'module-list', 'fa fa-signal', 3, 1, '2017-06-07 00:38:48', '2017-06-07 00:38:48'),
(4, 'Role Management', 'role_management', 'role-list', 'fa fa-eye', 5, 1, '2017-06-07 00:55:09', '2017-06-07 00:55:09'),
(5, 'Permission Management', 'permission_management', 'permission-list', 'fa fa-refresh', 4, 1, '2017-06-07 03:27:01', '2017-06-07 03:27:01'),
(6, 'Productcategory MGMT', 'productcategory_mgmt', 'productcategory-list', 'fa fa-flag', 6, 1, '2017-06-07 23:09:49', '2017-06-07 23:09:49'),
(7, 'Product Management', 'product_management', 'product-list', 'fa fa-product-hunt', 7, 1, '2017-06-07 23:11:25', '2017-06-07 23:11:25'),
(8, 'Sales Management', 'sales_management', 'sales-create', 'fa fa-shopping-cart', 8, 1, '2017-06-09 00:37:53', '2017-06-09 00:37:53'),
(10, 'Expenses Management', 'expenses_management', 'expenses-list', 'fa fa-usd', 10, 1, '2017-06-22 23:52:09', '2017-06-22 23:52:09'),
(14, 'Purchase Management', 'purchase_management', 'purchase-list', 'fa fa-list', 15, 1, '2017-07-07 06:23:47', '2017-07-07 06:23:47'),
(15, 'Bank Transaction', 'bank_transaction', 'transaction-list', 'fa fa-list', 17, 1, '2017-07-16 04:41:04', '2017-07-16 04:41:04');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` int(10) UNSIGNED NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permission_key` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `permission_key`, `created_at`, `updated_at`) VALUES
(1, 'Create New User', 'user-register', '2017-06-07 02:12:20', '2017-06-07 02:12:20'),
(2, 'Module Create', 'module-create', '2017-06-08 04:18:50', '2017-06-08 04:18:50'),
(3, 'Module View', 'module-list', '2017-06-08 04:19:11', '2017-06-08 04:19:11'),
(4, 'Module Delete', 'module-delete', '2017-06-08 04:19:26', '2017-06-08 04:19:26'),
(5, 'Module Edit', 'module-edit', '2017-06-08 04:19:43', '2017-06-08 04:19:43'),
(6, 'Role View', 'role-list', '2017-06-08 04:20:39', '2017-06-08 04:20:39'),
(7, 'Role Create', 'role-create', '2017-06-08 04:20:52', '2017-06-08 04:20:52'),
(8, 'Permission Asign', 'permission-asign', '2017-06-08 04:21:16', '2017-06-08 04:32:14'),
(9, 'Permission Create', 'permission-create', '2017-06-08 04:21:48', '2017-06-08 04:21:48'),
(10, 'Permission Views', 'permission-list', '2017-06-08 04:22:07', '2017-06-08 04:22:07'),
(11, 'Permission Edit', 'permission-edit', '2017-06-08 04:22:46', '2017-06-08 04:22:46'),
(12, 'Permission Delete', 'permission-delete', '2017-06-08 04:23:18', '2017-06-08 04:23:18'),
(13, 'Productcategory View', 'productcategory-list', '2017-06-08 04:33:40', '2017-06-08 04:33:40'),
(14, 'Product Category Create', 'productcategory-create', '2017-06-08 04:34:38', '2017-06-08 04:34:38'),
(15, 'Product Category Edit', 'productcategory-edit', '2017-06-08 04:35:00', '2017-06-08 04:35:00'),
(16, 'Product Category Delete', 'productcategory-delete', '2017-06-08 04:35:21', '2017-06-08 04:35:21'),
(17, 'Product View', 'product-list', '2017-06-08 04:39:33', '2017-06-08 04:39:33'),
(18, 'Product Create', 'product-create', '2017-06-08 04:39:50', '2017-06-08 04:39:50'),
(19, 'Product Edit', 'product-edit', '2017-06-08 04:40:06', '2017-06-08 04:40:06'),
(20, 'Product Delete', 'product-delete', '2017-06-08 04:40:45', '2017-06-08 04:40:45'),
(25, 'Sales view', 'sales-list', '2017-07-17 04:57:39', '2017-07-17 04:57:39'),
(26, 'Make/Create Sales', 'sales-create', '2017-07-17 04:59:43', '2017-07-17 04:59:43'),
(30, 'Purchase view', 'purchase-list', '2017-07-17 05:24:38', '2017-07-17 05:24:38'),
(31, 'Make new Purchase', 'purchase-create', '2017-07-17 05:25:03', '2017-07-17 05:25:03'),
(32, 'purchase Update/Confirm Dueamount', 'purchase-update', '2017-07-17 05:25:41', '2017-07-17 05:25:41'),
(33, 'Expenses View', 'expenses-list', '2017-07-17 05:30:32', '2017-07-17 05:30:32'),
(34, 'Expenses Create', 'expenses-create', '2017-07-17 05:31:24', '2017-07-17 05:31:24'),
(35, 'Expenses Edit', 'expenses-edit', '2017-07-17 05:31:43', '2017-07-17 05:31:43'),
(36, 'Expenses Delete', 'expenses-delete', '2017-07-17 05:32:04', '2017-07-17 05:32:04'),
(37, 'Expenses Heading Create', 'expenses-heading', '2017-07-17 05:33:34', '2017-07-17 05:33:34'),
(45, 'User Password Change', 'password-change', '2017-07-17 05:54:08', '2017-07-17 05:54:08'),
(46, 'Transcation/Bank view', 'transaction-list', '2017-07-18 03:30:39', '2017-07-18 03:30:39'),
(47, 'Transaction remaining Deposite update', 'transaction-update', '2017-07-18 03:31:56', '2017-07-18 03:31:56'),
(48, 'Transaction Entry', 'transaction-create', '2017-07-18 03:32:23', '2017-07-18 03:32:23');

-- --------------------------------------------------------

--
-- Table structure for table `productcategories`
--

CREATE TABLE `productcategories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `modified_by` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `productcategories`
--

INSERT INTO `productcategories` (`id`, `name`, `slug`, `status`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(3, 'Food Items', 'food-items', 1, 'admin', 'admin', '2017-10-28 17:15:46', '2019-05-29 11:50:34'),
(4, 'Beverages', 'beverages', 1, 'user', 'admin', '2017-10-28 20:06:02', '2019-06-01 01:19:13'),
(5, 'Personal Care', 'personal-care', 1, 'admin', 'admin', '2017-10-28 20:25:40', '2017-10-28 20:32:48'),
(6, 'Bread and Bakery', 'bread-and-bakery', 1, 'admin', NULL, '2017-10-28 20:25:54', '2017-10-28 20:25:54'),
(7, 'Baby Product', 'baby-product', 1, 'admin', NULL, '2017-10-28 20:26:52', '2017-10-28 20:26:52'),
(8, 'cvsdfsdf', 'cvsdfsdf', 1, 'admin', NULL, '2017-12-21 21:38:54', '2017-12-21 21:38:54');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `productcategory_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `stock` int(11) DEFAULT NULL,
  `price` double NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `modified_by` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `productcategory_id`, `name`, `code`, `quantity`, `stock`, `price`, `status`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(1, 3, 'Rice 50 kg', 'R50', 60, 58, 2500, 1, 'admin', NULL, '2017-10-28 20:27:48', '2017-10-29 05:35:37'),
(2, 3, 'Rice 10 kg', 'R10', 50, 49, 500, 1, 'admin', NULL, '2017-10-28 20:28:24', '2017-10-29 05:36:04'),
(3, 4, 'Apple Juce 1 Litter', 'AJ', 50, 49, 600, 1, 'admin', NULL, '2017-10-28 20:29:32', '2017-10-29 08:45:08'),
(4, 4, 'Hard Soda 1 Litter', 'HS1', 70, 70, 300, 1, 'admin', NULL, '2017-10-28 20:31:10', '2017-10-28 20:31:10'),
(5, 5, 'Gillette Razor Blade', 'GRB', 50, 50, 300, 1, 'admin', NULL, '2017-10-28 20:34:01', '2017-10-28 20:34:01'),
(6, 5, 'Toothpaste', 'TP', 70, 69, 50, 1, 'admin', NULL, '2017-10-28 20:34:41', '2017-10-29 08:47:21'),
(7, 5, 'Coconut Oil', 'CO', 70, 70, 100, 1, 'admin', NULL, '2017-10-28 20:36:13', '2017-10-28 20:36:13'),
(8, 6, 'Black Forest Full', 'BFF', 50, 50, 50, 1, 'admin', NULL, '2017-10-28 20:36:46', '2017-10-28 20:36:46'),
(9, 6, 'Black Forest Half', 'BFH', 40, 40, 30, 1, 'admin', NULL, '2017-10-28 20:37:14', '2017-10-28 20:37:14'),
(10, 6, 'French Bread', 'FB', 60, 60, 60, 1, 'admin', NULL, '2017-10-28 20:37:54', '2017-10-28 20:37:54'),
(11, 7, 'Johndon Powder', 'JP', 100, 100, 600, 1, 'admin', NULL, '2017-10-28 20:39:19', '2017-10-28 20:39:19'),
(12, 5, 'Pampers', 'PMRS', 35, 35, 500, 1, 'admin', NULL, '2017-10-28 20:40:13', '2017-10-28 20:40:13');

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `id` int(10) UNSIGNED NOT NULL,
  `goods_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `party_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `totalamount` double NOT NULL,
  `paidamount` double NOT NULL,
  `dueamount` double NOT NULL,
  `status` enum('vat','pan','normal') COLLATE utf8mb4_unicode_ci NOT NULL,
  `purchase_date` date NOT NULL,
  `created_by` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `modified_by` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchases`
--

INSERT INTO `purchases` (`id`, `goods_name`, `party_name`, `totalamount`, `paidamount`, `dueamount`, `status`, `purchase_date`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(1, 'Software', 'Cheetahwebtech', 500000, 500000, 0, 'vat', '2017-07-20', 'admin', NULL, '2017-07-20 14:03:02', '2017-07-20 14:03:02'),
(2, 'Other Purchase', 'Some Other', 50000, 50000, 0, 'pan', '2017-07-20', 'admin', NULL, '2017-07-20 14:03:41', '2017-10-28 19:46:18'),
(3, 'Furniture', 'Thapa furniture', 4000, 30000, -26000, 'pan', '2017-10-28', 'admin', NULL, '2017-10-28 19:50:57', '2017-10-28 19:50:57'),
(4, 'Baby Product 1 Bundel', 'Gupta wholeSell', 5000, 5000, 0, 'pan', '2017-10-28', 'admin', NULL, '2017-10-28 20:46:07', '2017-10-28 20:46:07');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', '2017-07-19 23:15:00', '2017-07-20 23:15:00'),
(2, 'Admin', '2017-07-19 23:15:00', '2017-07-20 23:15:00');

-- --------------------------------------------------------

--
-- Table structure for table `role_modules`
--

CREATE TABLE `role_modules` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `module_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_modules`
--

INSERT INTO `role_modules` (`id`, `role_id`, `module_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2017-06-06 17:30:00', NULL),
(2, 2, 1, '2017-06-20 17:30:00', NULL),
(3, 1, 2, '2017-06-06 03:44:05', '2017-06-06 03:44:05'),
(4, 1, 3, '2017-06-07 00:38:48', '2017-06-07 00:38:48'),
(5, 1, 4, '2017-06-07 00:55:09', '2017-06-07 00:55:09'),
(6, 1, 5, '2017-06-07 03:27:01', '2017-06-07 03:27:01'),
(7, 1, 6, '2017-06-07 23:09:49', '2017-06-07 23:09:49'),
(8, 2, 6, '2017-06-07 23:09:49', '2017-06-07 23:09:49'),
(9, 1, 7, '2017-06-07 23:11:25', '2017-06-07 23:11:25'),
(10, 2, 7, '2017-06-07 23:11:25', '2017-06-07 23:11:25'),
(11, 1, 8, '2017-06-09 00:37:53', '2017-06-09 00:37:53'),
(12, 2, 8, '2017-06-09 00:37:53', '2017-06-09 00:37:53'),
(15, 1, 10, '2017-06-22 23:52:09', '2017-06-22 23:52:09'),
(16, 2, 10, '2017-06-22 23:52:09', '2017-06-22 23:52:09'),
(21, 1, 14, '2017-07-07 06:23:47', '2017-07-07 06:23:47'),
(22, 2, 14, '2017-07-07 06:23:47', '2017-07-07 06:23:47'),
(23, 1, 15, '2017-07-16 04:41:04', '2017-07-16 04:41:04'),
(24, 2, 15, '2017-07-16 04:41:04', '2017-07-16 04:41:04');

-- --------------------------------------------------------

--
-- Table structure for table `role_permissions`
--

CREATE TABLE `role_permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `permission_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_permissions`
--

INSERT INTO `role_permissions` (`id`, `role_id`, `permission_id`, `created_at`, `updated_at`) VALUES
(817, 1, 1, '2017-07-18 03:32:41', '2017-07-18 03:32:41'),
(818, 1, 2, '2017-07-18 03:32:41', '2017-07-18 03:32:41'),
(819, 1, 3, '2017-07-18 03:32:41', '2017-07-18 03:32:41'),
(820, 1, 4, '2017-07-18 03:32:41', '2017-07-18 03:32:41'),
(821, 1, 5, '2017-07-18 03:32:41', '2017-07-18 03:32:41'),
(822, 1, 6, '2017-07-18 03:32:41', '2017-07-18 03:32:41'),
(823, 1, 7, '2017-07-18 03:32:41', '2017-07-18 03:32:41'),
(824, 1, 8, '2017-07-18 03:32:41', '2017-07-18 03:32:41'),
(825, 1, 9, '2017-07-18 03:32:41', '2017-07-18 03:32:41'),
(826, 1, 10, '2017-07-18 03:32:41', '2017-07-18 03:32:41'),
(827, 1, 11, '2017-07-18 03:32:41', '2017-07-18 03:32:41'),
(828, 1, 12, '2017-07-18 03:32:41', '2017-07-18 03:32:41'),
(829, 1, 13, '2017-07-18 03:32:42', '2017-07-18 03:32:42'),
(830, 1, 14, '2017-07-18 03:32:42', '2017-07-18 03:32:42'),
(831, 1, 15, '2017-07-18 03:32:42', '2017-07-18 03:32:42'),
(832, 1, 16, '2017-07-18 03:32:42', '2017-07-18 03:32:42'),
(833, 1, 17, '2017-07-18 03:32:42', '2017-07-18 03:32:42'),
(834, 1, 18, '2017-07-18 03:32:42', '2017-07-18 03:32:42'),
(835, 1, 19, '2017-07-18 03:32:42', '2017-07-18 03:32:42'),
(836, 1, 20, '2017-07-18 03:32:42', '2017-07-18 03:32:42'),
(841, 1, 25, '2017-07-18 03:32:42', '2017-07-18 03:32:42'),
(842, 1, 26, '2017-07-18 03:32:42', '2017-07-18 03:32:42'),
(846, 1, 30, '2017-07-18 03:32:42', '2017-07-18 03:32:42'),
(847, 1, 31, '2017-07-18 03:32:42', '2017-07-18 03:32:42'),
(848, 1, 32, '2017-07-18 03:32:42', '2017-07-18 03:32:42'),
(849, 1, 33, '2017-07-18 03:32:42', '2017-07-18 03:32:42'),
(850, 1, 34, '2017-07-18 03:32:42', '2017-07-18 03:32:42'),
(851, 1, 35, '2017-07-18 03:32:42', '2017-07-18 03:32:42'),
(852, 1, 36, '2017-07-18 03:32:42', '2017-07-18 03:32:42'),
(853, 1, 37, '2017-07-18 03:32:42', '2017-07-18 03:32:42'),
(861, 1, 45, '2017-07-18 03:32:42', '2017-07-18 03:32:42'),
(862, 1, 46, '2017-07-18 03:32:42', '2017-07-18 03:32:42'),
(863, 1, 47, '2017-07-18 03:32:42', '2017-07-18 03:32:42'),
(864, 1, 48, '2017-07-18 03:32:42', '2017-07-18 03:32:42'),
(875, 2, 13, '2017-10-28 19:45:43', '2017-10-28 19:45:43'),
(876, 2, 14, '2017-10-28 19:45:43', '2017-10-28 19:45:43'),
(877, 2, 15, '2017-10-28 19:45:43', '2017-10-28 19:45:43'),
(878, 2, 16, '2017-10-28 19:45:43', '2017-10-28 19:45:43'),
(879, 2, 17, '2017-10-28 19:45:43', '2017-10-28 19:45:43'),
(880, 2, 18, '2017-10-28 19:45:43', '2017-10-28 19:45:43'),
(881, 2, 19, '2017-10-28 19:45:43', '2017-10-28 19:45:43'),
(882, 2, 20, '2017-10-28 19:45:43', '2017-10-28 19:45:43'),
(883, 2, 25, '2017-10-28 19:45:43', '2017-10-28 19:45:43'),
(884, 2, 26, '2017-10-28 19:45:43', '2017-10-28 19:45:43'),
(885, 2, 30, '2017-10-28 19:45:43', '2017-10-28 19:45:43'),
(886, 2, 31, '2017-10-28 19:45:43', '2017-10-28 19:45:43'),
(887, 2, 32, '2017-10-28 19:45:43', '2017-10-28 19:45:43'),
(888, 2, 33, '2017-10-28 19:45:43', '2017-10-28 19:45:43'),
(889, 2, 34, '2017-10-28 19:45:43', '2017-10-28 19:45:43'),
(890, 2, 35, '2017-10-28 19:45:43', '2017-10-28 19:45:43'),
(891, 2, 36, '2017-10-28 19:45:43', '2017-10-28 19:45:43'),
(892, 2, 37, '2017-10-28 19:45:43', '2017-10-28 19:45:43'),
(893, 2, 45, '2017-10-28 19:45:43', '2017-10-28 19:45:43');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` double NOT NULL,
  `saller_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sales_status` tinyint(1) NOT NULL DEFAULT '1',
  `sales_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `product_id`, `quantity`, `price`, `saller_name`, `sales_status`, `sales_date`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 5000, 'grocerysystem', 1, '2017-10-29', '2017-10-29 05:36:10', '2017-10-29 05:36:10'),
(2, 2, 1, 500, 'grocerysystem', 1, '2017-10-29', '2017-10-29 05:36:10', '2017-10-29 05:36:10'),
(3, 3, 1, 600, 'grocerysystem1', 1, '2017-10-29', '2017-10-29 08:54:31', '2017-10-29 08:54:31'),
(4, 6, 1, 50, 'grocerysystem1', 1, '2017-10-29', '2017-10-29 08:54:31', '2017-10-29 08:54:31'),
(1, 1, 2, 5000, 'grocerysystem', 1, '2017-10-29', '2017-10-29 05:36:10', '2017-10-29 05:36:10'),
(2, 2, 1, 500, 'grocerysystem', 1, '2017-10-29', '2017-10-29 05:36:10', '2017-10-29 05:36:10'),
(3, 3, 1, 600, 'grocerysystem1', 1, '2017-10-29', '2017-10-29 08:54:31', '2017-10-29 08:54:31'),
(4, 6, 1, 50, 'grocerysystem1', 1, '2017-10-29', '2017-10-29 08:54:31', '2017-10-29 08:54:31');

-- --------------------------------------------------------

--
-- Table structure for table `salescarts`
--

CREATE TABLE `salescarts` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` double NOT NULL,
  `saller_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sales_status` tinyint(1) NOT NULL DEFAULT '1',
  `sales_date` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tag_thread`
--

CREATE TABLE `tag_thread` (
  `id` int(10) UNSIGNED NOT NULL,
  `thread_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `threads`
--

CREATE TABLE `threads` (
  `id` int(10) UNSIGNED NOT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thread` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `solution` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `totalamount` double NOT NULL,
  `depositeamount` double NOT NULL,
  `remainingamount` double NOT NULL,
  `deposite_by` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deposite_date` date NOT NULL,
  `bank_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `modified_by` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `email`, `password`, `last_login`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Grocery System', 'admin', 'nagarikbazar@gmail.com', '$2y$12$wIxUEy9VIrJFTmjMLGVGAeKTJSXrDQGXMQgxH3lKryTx.7rLVAxA2', '2019-08-27 20:29:00', 1, 'nlfNKLfSF2g1pggHld8DsUutLQZ8y7U3F9flRJzCm94F7ocNnp3lqTAq9Y6n', '2017-06-06 02:35:29', '2019-08-28 01:29:00'),
(2, 'User Admin', 'user', 'nagarikbazar1@testtest.com', '$2y$12$wIxUEy9VIrJFTmjMLGVGAeKTJSXrDQGXMQgxH3lKryTx.7rLVAxA2', '2019-05-29 06:59:59', 1, '', '2017-06-07 00:47:19', '2019-05-29 11:59:59'),
(3, 'Grace Banks', 'grace', 'grace@gmail.com', '$2y$10$gtfEO9brSyMeF5SQhrWNH.YEegig2oTZMfqaVOlpVwZzZDQht.KQC', NULL, 1, NULL, '2019-06-01 01:17:00', '2019-06-01 01:17:00');

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_roles`
--

INSERT INTO `user_roles` (`id`, `role_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2017-06-06 02:35:29', '2017-06-06 02:35:29'),
(2, 2, 2, '2017-06-07 00:47:19', '2017-06-07 00:47:19');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expenses_created_by_foreign` (`created_by`),
  ADD KEY `expenses_modified_by_foreign` (`modified_by`);

--
-- Indexes for table `expensestitles`
--
ALTER TABLE `expensestitles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_id_notifiable_type_index` (`notifiable_id`,`notifiable_type`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tag_thread`
--
ALTER TABLE `tag_thread`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `threads`
--
ALTER TABLE `threads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tag_thread`
--
ALTER TABLE `tag_thread`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `threads`
--
ALTER TABLE `threads`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Database: `web_forum`
--
CREATE DATABASE IF NOT EXISTS `web_forum` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `web_forum`;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `body` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `commentable_id` int(11) NOT NULL,
  `commentable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `likable_id` int(11) NOT NULL,
  `likable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2017_04_13_012507_create_threads_table', 1),
(4, '2017_04_17_080216_add_user_id_to_threads', 1),
(5, '2017_04_22_123222_create_comments_table', 1),
(6, '2017_05_06_161732_add_solution_column_in_threads_table', 1),
(7, '2017_05_08_032932_create_likes_table', 1),
(8, '2017_05_20_132643_create_notifications_table', 1),
(9, '2017_07_03_004159_create_tags_table', 1),
(10, '2017_07_03_004815_create_tags_thread_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` int(10) UNSIGNED NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Fisrt', NULL, NULL),
(2, 'Second', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tag_thread`
--

CREATE TABLE `tag_thread` (
  `id` int(10) UNSIGNED NOT NULL,
  `thread_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tag_thread`
--

INSERT INTO `tag_thread` (`id`, `thread_id`, `tag_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL),
(2, 2, 1, NULL, NULL),
(3, 3, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `threads`
--

CREATE TABLE `threads` (
  `id` int(10) UNSIGNED NOT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thread` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `solution` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `threads`
--

INSERT INTO `threads` (`id`, `subject`, `thread`, `type`, `created_at`, `updated_at`, `user_id`, `solution`) VALUES
(1, 'Tonight', 'Tonight is going well.', NULL, '2019-06-26 06:11:07', '2019-06-26 06:11:07', 1, NULL),
(2, 'Tonig is good', 'I don\'t know what is next but I\'m grateful.', NULL, '2019-07-18 05:19:36', '2019-07-18 05:19:36', 1, NULL),
(3, 'Just typing now', 'What are you writing now?', NULL, '2019-07-18 05:21:35', '2019-07-18 05:21:35', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Web user', 'user@umail.com', '$2y$10$xHpMt9ccC0HMHjFOQ8NLyOXGjpCCMO9tPu2kjBJTxtTfPnN6mzu1S', 'tyJHxCIGfZhn3wTPzTwjNSA5owPzjeWQKcNgQnHlbXattfeEQ7CXFi3Jz65b', '2019-06-26 06:02:40', '2019-06-26 06:02:40');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_id_notifiable_type_index` (`notifiable_id`,`notifiable_type`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tag_thread`
--
ALTER TABLE `tag_thread`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `threads`
--
ALTER TABLE `threads`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tag_thread`
--
ALTER TABLE `tag_thread`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `threads`
--
ALTER TABLE `threads`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
