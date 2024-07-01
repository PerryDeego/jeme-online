-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 24, 2019 at 06:58 PM
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
-- Database: `jeme`
--

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
  `modified_by` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `buildings`
--

INSERT INTO `buildings` (`id`, `user_id`, `service_id`, `location_id`, `name`, `modified_by`, `created_at`, `updated_at`) VALUES
(1, 1, 10, 6, '2 Gavia', 'Dwight Perry', '2019-09-05 16:51:40', '2019-09-05 17:33:25'),
(3, 5, 1, 5, 'GK Head Office', 'Micheal Samuel', '2019-09-05 17:02:47', '2019-09-05 17:02:47'),
(5, 1, 8, 5, 'Ocean Towers', 'Dwight Perry', '2019-09-05 17:19:17', '2019-09-05 17:32:42'),
(7, 7, 9, 5, 'Ministry of Foreign Affairs', 'User2', '2019-09-05 17:21:19', '2019-09-06 11:16:14'),
(8, 1, 7, 2, 'AC Hotels', NULL, '2019-09-05 17:49:48', '2019-09-05 17:49:48'),
(9, 6, 11, 6, 'Pardoi', NULL, '2019-09-26 04:52:49', '2019-09-26 04:52:49');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `event_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `modified_by` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `user_id`, `event_name`, `start_date`, `end_date`, `modified_by`, `status`, `created_at`, `updated_at`) VALUES
(1, 6, 'Service Abbey Court', '2019-10-03', '2019-10-05', 'Perry Deego', 'open', '2019-10-04 07:39:45', '2019-10-04 07:53:02'),
(3, 6, 'Call-Back Grace Head Office', '2019-10-09', '2019-10-17', NULL, 'open', '2019-10-04 07:45:38', '2019-10-04 07:45:38'),
(4, 13, 'Trece Via Appointment', '2019-10-29', '2019-10-31', NULL, 'open', '2019-10-20 02:45:15', '2019-10-20 02:45:15');

-- --------------------------------------------------------

--
-- Table structure for table `faults`
--

CREATE TABLE `faults` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `service_id` int(10) UNSIGNED NOT NULL,
  `building_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `machine_id` int(10) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `issue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `modified_by` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faults`
--

INSERT INTO `faults` (`id`, `user_id`, `service_id`, `building_id`, `location_id`, `machine_id`, `date`, `status`, `issue`, `modified_by`, `created_at`, `updated_at`) VALUES
(8, 1, 1, 3, 5, 4, '2019-10-09', 'Yes', 'GGG', NULL, '2019-10-22 04:11:08', '2019-10-22 04:11:08'),
(9, 1, 11, 9, 6, 9, '2019-10-10', 'Yes', 'Good', NULL, '2019-10-23 18:21:10', '2019-10-23 18:21:10');

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `fault_id` int(11) NOT NULL,
  `image_path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id`, `fault_id`, `image_path`, `created_at`, `updated_at`) VALUES
(1, 6, '2010-Bertone-Alfa-Romeo-Pandion-Concept-side-480.jpg', '2019-10-22 04:04:17', '2019-10-22 04:04:17'),
(2, 6, '2014-maserati-alfieri-concept-4-live-photos.jpg', '2019-10-22 04:04:17', '2019-10-22 04:04:17'),
(3, 7, '2010-Bertone-Alfa-Romeo-Pandion-Concept-side-480.jpg', '2019-10-22 04:05:52', '2019-10-22 04:05:52'),
(4, 7, '2014-maserati-alfieri-concept-4-live-photos.jpg', '2019-10-22 04:05:52', '2019-10-22 04:05:52'),
(5, 7, 'Car1.jpg', '2019-10-22 04:05:53', '2019-10-22 04:05:53'),
(6, 7, 'Car2.jpg', '2019-10-22 04:05:53', '2019-10-22 04:05:53'),
(7, 8, '2010-Bertone-Alfa-Romeo-Pandion-Concept-side-480.jpg', '2019-10-22 04:11:08', '2019-10-22 04:11:08'),
(8, 8, '2014-maserati-alfieri-concept-4-live-photos.jpg', '2019-10-22 04:11:08', '2019-10-22 04:11:08'),
(9, 9, 'Benz.jpg', '2019-10-23 18:21:10', '2019-10-23 18:21:10'),
(10, 9, 'Electric Car.jpg', '2019-10-23 18:21:10', '2019-10-23 18:21:10'),
(11, 9, 'Red Farrari.jpg', '2019-10-23 18:21:10', '2019-10-23 18:21:10');

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
  `modified_by` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`id`, `user_id`, `name`, `modified_by`, `created_at`, `updated_at`) VALUES
(1, 6, 'Ochi Rios', NULL, '2019-09-05 16:35:22', '2019-09-05 16:35:22'),
(2, 6, 'New Kingston', NULL, '2019-09-05 16:35:42', '2019-09-05 16:35:42'),
(3, 6, 'Airport', NULL, '2019-09-05 16:37:24', '2019-09-05 16:37:24'),
(4, 6, 'Old Harbour', NULL, '2019-09-05 16:37:46', '2019-09-05 16:37:46'),
(5, 1, 'Down Town', NULL, '2019-09-05 16:38:16', '2019-09-05 16:38:16'),
(6, 6, 'Cherry Hills', NULL, '2019-09-05 16:49:35', '2019-09-05 16:49:35');

-- --------------------------------------------------------

--
-- Table structure for table `machine_numbers`
--

CREATE TABLE `machine_numbers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `building_id` int(10) UNSIGNED NOT NULL,
  `machine_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `modified_by` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `machine_numbers`
--

INSERT INTO `machine_numbers` (`id`, `user_id`, `building_id`, `machine_no`, `modified_by`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '07NRL401', NULL, '2019-09-06 10:17:36', '2019-09-06 10:17:36'),
(2, 1, 1, '07NRL402', NULL, '2019-09-06 10:17:57', '2019-09-06 10:17:57'),
(3, 1, 1, '07NRL403', NULL, '2019-09-06 10:18:14', '2019-09-06 10:18:14'),
(4, 6, 3, '09HER501', NULL, '2019-10-06 22:52:25', '2019-10-06 22:52:25'),
(5, 6, 3, '09HER502', NULL, '2019-10-06 22:53:07', '2019-10-06 22:53:07'),
(6, 6, 7, '08TRN101', NULL, '2019-10-15 07:10:52', '2019-10-15 07:10:52'),
(7, 6, 7, '08TRN102', NULL, '2019-10-15 07:11:27', '2019-10-15 07:11:27'),
(8, 6, 7, '08TRN103', NULL, '2019-10-15 07:12:03', '2019-10-15 07:12:03'),
(9, 6, 9, '02GLM201', NULL, '2019-10-15 09:23:39', '2019-10-15 09:23:39'),
(10, 6, 9, '02GLM202', NULL, '2019-10-15 09:24:10', '2019-10-15 09:24:10'),
(11, 6, 9, '02GLM203', NULL, '2019-10-15 09:24:49', '2019-10-15 09:24:49'),
(12, 6, 9, '02GLM204', NULL, '2019-10-15 09:25:18', '2019-10-15 09:25:18'),
(13, 6, 5, '03PLM201', NULL, '2019-10-15 09:26:37', '2019-10-15 09:26:37');

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
(1, '2019_06_03_223625_create_permission_tables', 1),
(2, '2019_06_08_032011_create_installations_table', 1),
(3, '2019_06_12_100000_create_password_resets_table', 1),
(4, '2019_06_14_134547_create_faults_table', 1),
(5, '2019_07_05_003743_create_service_numbers_table', 1),
(6, '2019_07_14_170834_create_locations_table', 1),
(7, '2019_07_21_033940_create_service_orders_table', 1),
(8, '2019_08_27_012310_create_buildings_table', 1),
(9, '2019_08_30_000000_create_users_table', 1),
(10, '2019_08_30_231132_create_machine_numbers_table', 1),
(11, '2019_08_05_003743_create_service_numbers_table', 2),
(12, '2019_08_30_012310_create_buildings_table', 2),
(13, '2019_09_01_231132_create_machine_numbers_table', 2),
(14, '2019_09_01_170834_create_locations_table', 3),
(15, '2019_09_05_003743_create_service_numbers_table', 4),
(16, '2019_09_11_014000_create_events_table', 5),
(17, '2019_09_12_014000_create_events_table', 6),
(18, '2019_10_12_014000_create_events_table', 7),
(19, '2019_09_22_134547_create_faults_table', 8),
(20, '2019_09_29_035150_create_images_table', 9),
(21, '2019_09_29_134547_create_faults_table', 10),
(22, '2019_09_28_134547_create_faults_table', 11),
(23, '2019_08_28_134547_create_faults_table', 12),
(24, '2019_09_1_134547_create_faults_table', 13),
(25, '2019_10_01_014000_create_events_table', 13),
(26, '2019_10_21_035150_create_images_table', 14),
(27, '2019_10_21_134547_create_faults_table', 14),
(28, '2019_10_20_134547_create_faults_table', 15),
(29, '2019_09_20_134547_create_faults_table', 16),
(30, '2019_08_26_134547_create_faults_table', 17);

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
(1, 'App\\Models\\User', 1),
(1, 'App\\Models\\User', 5),
(1, 'App\\Models\\User', 13),
(4, 'App\\Models\\User', 5);

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
  `created_by` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `modified_by` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `created_by`, `modified_by`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Super-admin roles & permissions', '', 'Dwight Perry', 'web', '2019-08-22 12:47:23', '2019-08-30 23:21:01'),
(2, 'Create service orders', 'Dwight Perry', 'Perry Deego', 'web', '2019-08-31 11:00:26', '2019-09-10 08:56:40'),
(3, 'Create Installation', 'Perry Deego', NULL, 'web', '2019-09-08 06:12:48', '2019-09-08 06:12:48'),
(5, 'Office Manager', 'Deego', NULL, 'web', '2019-10-20 02:48:44', '2019-10-20 02:48:44');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `modified_by` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_by`, `modified_by`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Super-admin', '', 'Dwight Perry', 'web', '2019-08-22 12:47:23', '2019-08-30 23:14:55'),
(3, 'Construction roles', 'Perry Deego', NULL, 'web', '2019-09-08 06:14:04', '2019-09-08 06:14:04'),
(4, 'Service Tasks', 'Perry Deego', NULL, 'web', '2019-09-10 08:03:47', '2019-09-10 08:03:47');

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
(1, 1),
(3, 3),
(3, 4);

-- --------------------------------------------------------

--
-- Table structure for table `service_numbers`
--

CREATE TABLE `service_numbers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `service_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `modified_by` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `service_numbers`
--

INSERT INTO `service_numbers` (`id`, `user_id`, `service_no`, `modified_by`, `created_at`, `updated_at`) VALUES
(1, 6, 'FML3301', NULL, '2019-09-05 16:32:39', '2019-09-05 16:32:39'),
(2, 6, 'FML3302', NULL, '2019-09-05 16:33:36', '2019-09-05 16:33:36'),
(3, 6, 'FML3303', NULL, '2019-09-05 16:34:00', '2019-09-05 16:34:00'),
(4, 6, 'FML3304', NULL, '2019-09-05 16:34:34', '2019-09-05 16:34:34'),
(5, 1, 'FML4401', NULL, '2019-09-05 16:39:50', '2019-09-05 16:48:33'),
(6, 5, 'FML5501', NULL, '2019-09-05 17:14:19', '2019-09-05 17:14:19'),
(7, 5, 'FML5502', NULL, '2019-09-05 17:14:41', '2019-09-05 17:14:41'),
(8, 5, 'FML5503', NULL, '2019-09-05 17:14:57', '2019-09-05 17:14:57'),
(9, 1, 'FML4402', NULL, '2019-09-05 17:16:37', '2019-09-05 17:16:59'),
(10, 1, 'FML4403', NULL, '2019-09-05 17:17:46', '2019-09-05 17:17:46'),
(11, 6, 'FML6001', NULL, '2019-09-26 04:51:54', '2019-09-26 04:51:54');

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
(1, 6, 5673, 1, 3, 5, 4, '2019-10-15', '33 Harbor Street', 'GK Group Limited', 'Ian Carlyle', '1', 'REPAIR', 'M. Samuel', 'Yes', 'check and adjust faulty 4th floor door lock.', '2019-10-16 04:37:45', '2019-10-16 04:37:45'),
(2, 6, 56703, 11, 9, 6, 9, '2019-10-10', '42 Spanish Town Road', 'Matalon Homes Limited', 'Mr. Matalon', '3', 'EXTRA EXAM', 'M Samuel', 'No', 'Need replacement GECB.', '2019-10-16 04:54:17', '2019-10-16 04:54:17');

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
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `modified_by` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `status`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(1, 'Dwight Perry', 'dd.perry@hotmail.com', NULL, '$2y$10$VaAF1snGwSPkIb3a2VpVEuernGR1KBSwSWaoYsDRdVpULzdBdXJia', NULL, 1, '', NULL, '2019-08-22 12:19:55', '2019-08-22 12:19:55'),
(5, 'Micheal Samuel', 'msamuel@yahoo.com', NULL, '$2y$10$VaAF1snGwSPkIb3a2VpVEuernGR1KBSwSWaoYsDRdVpULzdBdXJia', NULL, 1, '', 'Perry Deego', '2019-08-28 11:02:57', '2019-10-08 06:59:37'),
(11, 'dd', 'dd@hotmail.com', NULL, '$2y$10$1vP79NDf0IslpNxDziZwHOSNYv/BJpjD8WGUeHqwaRVFUtDspssxu', NULL, 0, 'Dwight Perry', NULL, '2019-10-17 18:40:55', '2019-10-17 18:40:55'),
(12, 'perry', 'perry@hotmail.com', NULL, '$2y$10$YFH.goWIzMJmKvdwctC1puXaWsvP/eBXYEw72bl7vCSgdoqX53Z2O', NULL, 0, 'Dwight Perry', NULL, '2019-10-17 20:16:17', '2019-10-17 20:16:17'),
(13, 'Deego', 'deegoblaze@outlook.com', NULL, '$2y$10$6sPJyPH9eWXoJjtBoexDXO2GBkWhUkrboqazHCaQzNIaXGK31cwpG', NULL, 1, 'Dwight Perry', NULL, '2019-10-17 16:21:51', '2019-10-17 16:21:51');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `buildings`
--
ALTER TABLE `buildings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faults`
--
ALTER TABLE `faults`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `faults`
--
ALTER TABLE `faults`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `installations`
--
ALTER TABLE `installations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `machine_numbers`
--
ALTER TABLE `machine_numbers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `service_numbers`
--
ALTER TABLE `service_numbers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `service_orders`
--
ALTER TABLE `service_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
