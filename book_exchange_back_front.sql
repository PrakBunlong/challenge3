-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jul 02, 2023 at 08:51 PM
-- Server version: 8.0.31
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `book_exchange_back_front`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `api_token` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `status`, `api_token`) VALUES
(1, 'Bunlong', 'blong@gmail.com', NULL, '$2y$10$jrdaqqdGFej/LUnpAk6ZreMwly8gS.XOP4knuiaIy9W2bO6nyfOPK', NULL, '2023-06-14 19:19:09', '2023-07-01 22:19:40', 0, 'oggG4cY4s5u1Nb379TTc06rd5mgCYwMqwQGLxeLQvXCLDHgCmk8WX87UR97JiG367NiPjVCuC1twSKPO'),
(2, 'www', 'ww@gmail.com', NULL, '$2y$10$6GopxEFsMcyk5885.TSQ.OVunNodlnOGBTXRlB2uk/MVJmfMDFkVK', NULL, '2023-06-20 21:22:52', '2023-06-20 21:22:52', 0, NULL),
(3, 'sssss', 'wssw@gmail.com', NULL, '$2y$10$SAmmk6kYbgvfmTq7dFLLcetGXSEOz3Gls4QmmqLBGIX0NlPf.L5.W', NULL, '2023-06-20 21:26:03', '2023-06-20 21:26:03', 0, NULL),
(4, 'jj', 'jj@gmail.com', NULL, '$2y$10$/WA8..bufx1IrHDh5.uNwOq/yINHTy2sB.gbGyHGmGXGKJ1tWKpxC', NULL, '2023-06-22 20:35:50', '2023-06-22 20:35:50', 1, NULL),
(5, 'nak', 'nak@gmail.com', NULL, '$2y$10$5ZAu6OUU2fxrEMDIQlf0GOToYwDCOh0rcz.pQj0jmNXxEbF/8Mw9C', NULL, '2023-06-22 20:47:30', '2023-06-22 20:47:30', 0, NULL),
(6, 'jj1', 'jj1@gmail.com', NULL, '$2y$10$Jl/acePbzmRUXZmF/IbXHOq3fOwghEuyKFQx5WMNzlJA/4BXNFU96', NULL, '2023-06-22 20:50:56', '2023-06-22 20:50:56', 0, NULL),
(7, '11', '11@amil.com', NULL, '$2y$10$srW8I2Q7bjobPXMbAECs1umwKrZ31QrL.88CElvO6wrM07DeEV0R.', NULL, '2023-06-22 20:53:24', '2023-06-22 20:53:24', 0, NULL),
(8, 'jj3', 'ju@gmail.com', NULL, '$2y$10$fpzoUm..rAOkqID.gpiN6eH6SEMBeij3K.OnTI1/xVpXC9WLHymwq', NULL, '2023-06-22 21:06:30', '2023-06-22 21:06:30', 0, NULL),
(9, 'BunLong', 'bunlong@gmail.com', NULL, '$2y$10$pEBprNdZJhyZAoSnTGI96uG1gvPwOJx4HDYDKIMECFgdGc/9uYXda', NULL, '2023-06-25 23:46:15', '2023-06-25 23:46:15', 0, NULL),
(10, 'Sovandara', 'dara@gmail.com', NULL, '$2y$10$hfOtQSJvyxVoaKJzRlmhQO6qLQFfw5Ginsh6wJuAZCLv41LPZXzdi', NULL, '2023-06-26 18:25:11', '2023-06-26 18:25:11', 0, NULL),
(12, 'dara', 'sara@gmail.com', NULL, '$2y$10$crHC0famhBSezPxkk8VgquGX38eVtITkOfT4EuzozyEYYzbGihoJS', NULL, '2023-06-27 11:56:34', '2023-06-27 11:56:34', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
CREATE TABLE IF NOT EXISTS `books` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `cover_img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `cover_img`, `title`, `author`, `location`, `description`, `user_id`, `created_at`, `updated_at`) VALUES
(3, 'https://i.imgur.com/DfLRqzu.jpg', 'Barack Obama', 'Oumkanal', 'Paragon International University', 'Barack Obama is as fine a writer as they come. It is not merely that this book avoids being ponderous, as might be expected, even forgiven, of a hefty memoir, but that it is nearly always pleasurable to read, sentence by sentence, the prose gorgeous in places, the detail granular and vivid. From Southeast Asia to a forgotten school in South Carolina, he evokes the sense of place with a light but sure hand. This is the first of two volumes, and it starts early in his life, charting his initial political campaigns, and ends with a meeting in Kentucky where he is introduced to the SEAL team involved in the Abbottabad raid that killed Osama bin Laden.', 2, '2023-06-24 08:14:25', '2023-06-25 09:08:45'),
(5, 'https://i.imgur.com/fmCUIXj.jpg', 'Deadpool', 'James Cameron', 'Paragon International University', 'Spider-Man faces the strongest super-powered foes and most dangerous gauntlets the Multiverse can throw his way, and every time Miles Morales falls, he rises again — stronger than before. Until now. There are some punches you don’t get up from and a new villain isn’t pulling a single one as they threaten everyone and everything Miles loves.', 2, '2023-06-25 01:54:15', '2023-06-25 01:54:15'),
(6, 'https://i.imgur.com/ybKD0OM.jpg', 'Netflix movie', 'Johnson', 'Paragon International University', 'Barack Obama is as fine a writer as they come. It is not merely that this book avoids being ponderous, as might be expected, even forgiven, of a hefty memoir, but that it is nearly always pleasurable to read, sentence by sentence, the prose gorgeous in places, the detail granular and vivid. From Southeast Asia to a forgotten school in South Carolina, he evokes the sense of place with a light but sure hand. This is the first of two volumes, and it starts early in his life, charting his initial political campaigns, and ends with a meeting in Kentucky where he is introduced to the SEAL team involved in the Abbottabad raid that killed Osama bin Laden.', 3, '2023-06-25 01:56:22', '2023-06-25 01:56:22'),
(7, 'https://i.imgur.com/nFGmhO1.jpg', 'The Art of Not Giving a F', 'Mark Monson', 'Paragon International University', 'The Subtle Art of Not Giving a F*ck: A Counterintuitive Approach to Living a Good Life is a 2016 nonfiction self-help book by American blogger and author Mark Manson.[1] The book covers Manson\'s belief that life\'s struggles give it meaning and argues that typical self-help books offer meaningless positivity which is neither practical nor helpful, thus improperly approaching the problems many individuals face. It was a New York Times and Globe and Mail bestseller.', 2, '2023-06-25 09:04:18', '2023-06-25 09:04:18'),
(8, 'https://i.imgur.com/1evu5oB.jpg', 'Make It Easy', 'Gordon Ramsay', 'Paragon International University', 'Gordon James Ramsay, OBE, is a British chef, television personality and restaurateur. He has been awarded a total of 16 Michelin Stars, and in 2001 became one of only three chefs in the United Kingdom to hold three Michelin stars at one time. Ramsay currently ranks 3rd in the world in terms of Michelin Stars behind Joël Robuchon and Alain Ducasse.', 2, '2023-06-25 09:18:46', '2023-06-25 09:18:46'),
(9, 'https://i.imgur.com/T390JCu.jpg', 'Vagabond', 'Masashi', 'Block 11', 'This is a Vagabond manga volume 7.Vagabond (Japanese: バガボンド, Hepburn: Bagabondo) is a Japanese epic martial arts manga series written and illustrated by Takehiko Inoue.', 4, '2023-06-26 09:17:17', '2023-06-26 09:17:17'),
(10, 'https://i.imgur.com/yszN0IN.jpg', 'The tale of Jiraiya the Gallant', 'Kashimoto Kisuke', 'Block 11', '“Preoccupied with a single leaf, you won\'t see the tree. Preoccupied with a single tree, you\'ll miss the entire forest.”', 4, '2023-06-27 08:41:42', '2023-06-27 08:41:42');

-- --------------------------------------------------------

--
-- Table structure for table `books_genres`
--

DROP TABLE IF EXISTS `books_genres`;
CREATE TABLE IF NOT EXISTS `books_genres` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `book_id` int NOT NULL,
  `genre_id` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `books_genres`
--

INSERT INTO `books_genres` (`id`, `book_id`, `genre_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2023-06-24 05:18:15', '2023-06-24 05:18:15'),
(2, 1, 2, '2023-06-24 05:18:15', '2023-06-24 05:18:15'),
(3, 1, 3, '2023-06-24 05:18:15', '2023-06-24 05:18:15'),
(4, 1, 11, '2023-06-24 05:18:15', '2023-06-24 05:18:15'),
(5, 2, 1, '2023-06-24 06:02:10', '2023-06-24 06:02:10'),
(6, 2, 2, '2023-06-24 06:02:10', '2023-06-24 06:02:10'),
(7, 2, 12, '2023-06-24 06:02:10', '2023-06-24 06:02:10'),
(8, 2, 13, '2023-06-24 06:02:10', '2023-06-24 06:02:10'),
(9, 2, 14, '2023-06-24 06:02:10', '2023-06-24 06:02:10'),
(10, 2, 15, '2023-06-24 06:02:10', '2023-06-24 06:02:10'),
(11, 3, 2, '2023-06-24 08:14:25', '2023-06-24 08:14:25'),
(12, 4, 1, '2023-06-24 08:30:54', '2023-06-24 08:30:54'),
(13, 4, 13, '2023-06-24 08:30:54', '2023-06-24 08:30:54'),
(14, 5, 1, '2023-06-25 01:54:15', '2023-06-25 01:54:15'),
(15, 5, 4, '2023-06-25 01:54:15', '2023-06-25 01:54:15'),
(16, 6, 2, '2023-06-25 01:56:22', '2023-06-25 01:56:22'),
(17, 6, 7, '2023-06-25 01:56:22', '2023-06-25 01:56:22'),
(18, 3, 4, '2023-06-25 13:05:06', '2023-06-25 13:05:06'),
(19, 7, 7, '2023-06-25 09:04:18', '2023-06-25 09:04:18'),
(20, 7, 15, '2023-06-25 09:04:18', '2023-06-25 09:04:18'),
(21, 8, 7, '2023-06-25 09:18:46', '2023-06-25 09:18:46'),
(22, 8, 15, '2023-06-25 09:18:46', '2023-06-25 09:18:46'),
(23, 9, 1, '2023-06-26 09:17:17', '2023-06-26 09:17:17'),
(24, 9, 2, '2023-06-26 09:17:17', '2023-06-26 09:17:17'),
(25, 9, 3, '2023-06-26 09:17:17', '2023-06-26 09:17:17'),
(26, 9, 5, '2023-06-26 09:17:17', '2023-06-26 09:17:17'),
(27, 9, 11, '2023-06-26 09:17:17', '2023-06-26 09:17:17'),
(28, 9, 12, '2023-06-26 09:17:17', '2023-06-26 09:17:17'),
(29, 10, 1, '2023-06-27 08:41:42', '2023-06-27 08:41:42'),
(30, 10, 2, '2023-06-27 08:41:42', '2023-06-27 08:41:42'),
(31, 10, 3, '2023-06-27 08:41:42', '2023-06-27 08:41:42'),
(32, 10, 5, '2023-06-27 08:41:42', '2023-06-27 08:41:42'),
(33, 10, 6, '2023-06-27 08:41:42', '2023-06-27 08:41:42'),
(34, 10, 11, '2023-06-27 08:41:42', '2023-06-27 08:41:42'),
(35, 10, 14, '2023-06-27 08:41:42', '2023-06-27 08:41:42'),
(36, 10, 15, '2023-06-27 08:41:42', '2023-06-27 08:41:42');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
CREATE TABLE IF NOT EXISTS `comments` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `book_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `comment`, `created_at`, `updated_at`, `book_id`, `user_id`) VALUES
(1, 'i want to exchange the book', '2023-06-27 04:51:27', '2023-06-27 04:51:27', 3, 1),
(2, 'i want to exchange this book', '2023-06-27 05:15:35', '2023-06-27 05:15:35', 2, 2),
(3, 'This book is awesome', '2023-06-27 06:19:19', '2023-06-27 06:19:19', 3, 4),
(4, 'this book is awesome(2)', '2023-06-27 06:20:29', '2023-06-27 06:20:29', 3, 4),
(5, 'who?', '2023-06-27 06:20:51', '2023-06-27 06:20:51', 5, 4),
(6, '“Sometimes, you must hurt to know, fall to grow, and lose in order to gain. Life’s greatest lessons are learned through the pain.” Pain understands that hardships and suffering are necessary for growth, as it aligns with his personal experiences of growing up isolated during his childhood and losing his loved ones repeatedly over time.', '2023-06-27 08:44:21', '2023-06-27 08:44:21', 10, 5);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
CREATE TABLE IF NOT EXISTS `genres` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `genres`
--

INSERT INTO `genres` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Action', '2023-06-24 12:02:23', '2023-06-24 12:02:23'),
(2, 'Adventure', '2023-06-24 12:02:23', '2023-06-24 12:02:23'),
(3, 'Animation', '2023-06-24 12:02:23', '2023-06-24 12:02:23'),
(4, 'Comedy', '2023-06-24 12:02:23', '2023-06-24 12:02:23'),
(5, 'Crime', '2023-06-24 12:02:23', '2023-06-24 12:02:23'),
(6, 'Drama', '2023-06-24 12:02:23', '2023-06-24 12:02:23'),
(7, 'Family', '2023-06-24 12:02:23', '2023-06-24 12:02:23'),
(8, 'Fantasy', '2023-06-24 12:02:23', '2023-06-24 12:02:23'),
(9, 'Horror', '2023-06-24 12:02:23', '2023-06-24 12:02:23'),
(10, 'Musical', '2023-06-24 12:02:23', '2023-06-24 12:02:23'),
(11, 'Mystery', '2023-06-24 12:02:23', '2023-06-24 12:02:23'),
(12, 'Romance', '2023-06-24 12:02:23', '2023-06-24 12:02:23'),
(13, 'Sci-Fi', '2023-06-24 12:02:23', '2023-06-24 12:02:23'),
(14, 'Thriller', '2023-06-24 12:02:23', '2023-06-24 12:02:23'),
(15, 'Western', '2023-06-24 12:02:23', '2023-06-24 12:02:23');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
CREATE TABLE IF NOT EXISTS `post` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `cover_img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_banned` tinyint(1) NOT NULL DEFAULT '0',
  `api_token` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `phone`, `created_at`, `updated_at`, `is_banned`, `api_token`) VALUES
(1, 'bob', 'bob@gmail.com', '$2y$10$d7kwXCJRNuqH.cT/kNHppe63H38ytVbolbnwEbMeoQZORx8z0jNFe', '012334555', '2023-06-23 21:54:16', '2023-06-28 10:08:26', 0, NULL),
(2, 'Kimlux', 'Kimlux35@gmail.com', '$2y$10$ALWdthiFyPuLWFHsszWJreFOpCmyA1qjZbpZ8xhXSLj5hqIkCKm9i', '069340692', '2023-06-24 01:12:41', '2023-06-28 10:08:28', 0, NULL),
(3, 'Boris', 'bunseng62@gmail.com', '$2y$10$kvc94Yr3QeTw.NV1cR5GB.ZcXaM2XBrbhDJgFcDfLisCnQo5uiO3q', '023880880', '2023-06-24 18:55:24', '2023-06-28 10:08:27', 0, NULL),
(4, 'Nate', 'bprak@paragoniu.edu.kh', '$2y$10$RhGL1YtZ56jYLXXy7io8IO6omBfqOFIFa1TBUoo42UQrxkHfRP4qK', '015954356', '2023-06-26 02:13:58', '2023-07-01 22:08:02', 0, 'vM3ZqCpy1Bm8GnbFH2KGuN8NL1qy50lL2KzQqtGajV0tIBpCMT6ol7f7Iicl2edgLdy7werFuogK4VFS'),
(5, 'Prak@gmail.com', 'prakbunlong53@gmail.com', '$2y$10$jrdaqqdGFej/LUnpAk6ZreMwly8gS.XOP4knuiaIy9W2bO6nyfOPK', '015999910', '2023-06-27 01:43:11', '2023-06-28 10:07:38', 1, NULL),
(7, 'bob1', 'bob1@gmail.com', '$2y$10$PC.TwwJ3E.NIaeqmF/Qf9ezrWMvr2UVeOFjwrdBbgbYIjKZZOQ18e', '1', '2023-07-02 13:42:58', '2023-07-02 13:49:55', 0, 'kmBfgg3nc1klsIa8IAgainZ155JHHGMT9GCHW17TGqUCaZhyy38d14IobShWzFDGGfIDjWKHmVXvaRkF');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
