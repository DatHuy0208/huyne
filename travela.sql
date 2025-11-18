-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 17, 2025 at 12:00 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `travela`
--

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
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2025_11_11_000000_create_ai_chats_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `adminId` int(10) NOT NULL,
  `fullName` varchar(255) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `address` varchar(255) NOT NULL,
  `createdDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`adminId`, `fullName`, `username`, `password`, `email`, `address`, `createdDate`) VALUES
(1, 'Admin', 'admin', 'e10adc3949ba59abbe56e057f20f883e', 'minhdien.dev@gmail.com', 'Ngũ Hành Sơn, Đà Nẵng', '2025-01-02 16:13:29');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_ai_chats`
--

CREATE TABLE `tbl_ai_chats` (
  `chatId` bigint(20) UNSIGNED NOT NULL,
  `userId` bigint(20) UNSIGNED DEFAULT NULL,
  `message` text NOT NULL,
  `response` text DEFAULT NULL,
  `meta` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`meta`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_ai_chats`
--

INSERT INTO `tbl_ai_chats` (`chatId`, `userId`, `message`, `response`, `meta`, `created_at`, `updated_at`) VALUES
(1, NULL, 'alo', NULL, NULL, '2025-11-11 17:22:02', '2025-11-11 17:22:02'),
(2, NULL, 'nghe k', NULL, NULL, '2025-11-11 17:22:11', '2025-11-11 17:22:11'),
(3, NULL, 'hi', NULL, NULL, '2025-11-12 17:26:56', '2025-11-12 17:26:56');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_booking`
--

CREATE TABLE `tbl_booking` (
  `bookingId` int(11) NOT NULL,
  `tourId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `fullName` varchar(255) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phoneNumber` varchar(50) NOT NULL,
  `address` varchar(255) NOT NULL,
  `bookingDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `numAdults` int(11) NOT NULL,
  `numChildren` int(11) NOT NULL,
  `totalPrice` double NOT NULL,
  `bookingStatus` enum('y','b','c','f') NOT NULL DEFAULT 'b' COMMENT '''y'': ''Confirmed'',\r\n''b'': booked,\r\n''c'':cancel,\r\n''f'': Finish'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_booking`
--

INSERT INTO `tbl_booking` (`bookingId`, `tourId`, `userId`, `fullName`, `email`, `phoneNumber`, `address`, `bookingDate`, `numAdults`, `numChildren`, `totalPrice`, `bookingStatus`) VALUES
(47, 208, 29, 'Đạt Huy Trần', 'huyuy1682@gmail.com', '0942192764', 'Hải Châu', '2025-10-13 14:06:20', 10, 2, 11000000, 'c'),
(48, 208, 29, 'Đạt Huy Trần', 'huyuy1682@gmail.com', '0254634235', 'Hải Châu', '2025-10-30 06:21:03', 10, 2, 11000000, 'y');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_chat`
--

CREATE TABLE `tbl_chat` (
  `chatId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `adminId` int(11) NOT NULL,
  `messages` varchar(255) NOT NULL,
  `readStatus` enum('y','n') DEFAULT 'n' COMMENT 'y: yes\r\nn: no',
  `createdDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ipAdress` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_checkout`
--

CREATE TABLE `tbl_checkout` (
  `checkoutId` int(11) NOT NULL,
  `bookingId` int(11) NOT NULL,
  `paymentMethod` varchar(255) NOT NULL,
  `paymentDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `amount` double NOT NULL,
  `paymentStatus` varchar(255) NOT NULL,
  `transactionId` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_checkout`
--

INSERT INTO `tbl_checkout` (`checkoutId`, `bookingId`, `paymentMethod`, `paymentDate`, `amount`, `paymentStatus`, `transactionId`) VALUES
(34, 47, 'office-payment', '2025-10-13 14:03:24', 11000000, 'n', NULL),
(35, 48, 'momo-payment', '2025-10-30 06:15:10', 11000000, 'y', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_contact`
--

CREATE TABLE `tbl_contact` (
  `contactId` int(11) NOT NULL,
  `fullName` varchar(50) NOT NULL,
  `phoneNumber` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `isReply` enum('y','n') NOT NULL DEFAULT 'n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_history`
--

CREATE TABLE `tbl_history` (
  `historyId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `tourId` int(11) NOT NULL,
  `actionType` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_images`
--

CREATE TABLE `tbl_images` (
  `imageId` int(11) NOT NULL,
  `tourId` int(11) NOT NULL,
  `imageURL` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `uploadDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_images`
--

INSERT INTO `tbl_images` (`imageId`, `tourId`, `imageURL`, `description`, `uploadDate`) VALUES
(338, 208, 'san-pham-lang-gom-bat-trang-3_1758989285.webp', 'TOUR HÀ NỘI – BÁT TRÀNG – VẠN PHÚC', '2025-10-01 15:54:24'),
(339, 208, 'hanoimoi_com_vn-uploads-images-trungtruc-2022-03-27-_bat-trang5_1758989285.jpg', 'TOUR HÀ NỘI – BÁT TRÀNG – VẠN PHÚC', '2025-10-01 15:54:24'),
(340, 208, 'cho-gom-bat-trang2023081205190820230812100259_9483660_1758989285.jpg', 'TOUR HÀ NỘI – BÁT TRÀNG – VẠN PHÚC', '2025-10-01 15:54:24'),
(341, 208, 'lang-gom-bat-trang-3_1758989286.jpg', 'TOUR HÀ NỘI – BÁT TRÀNG – VẠN PHÚC', '2025-10-01 15:54:24'),
(342, 208, 'bat-trang3-1697619236_1758989286.png', 'TOUR HÀ NỘI – BÁT TRÀNG – VẠN PHÚC', '2025-10-01 15:54:24'),
(343, 209, 'Quy-trinh-duc-dong-lang-Dai-Bai-Bac-Ninh_1759335616.jpg', 'Quy-trinh-duc-dong-lang-Dai-Bai-Bac-Ninh', '2025-10-01 16:20:17'),
(344, 209, 'tranhdongho_1759335617.jpg', 'tranhdongho', '2025-10-01 16:20:17'),
(345, 209, 'lang-gom-phu-lang_1753323161_1759335617.jpg', 'lang-gom-phu-lang_1753323161', '2025-10-01 16:20:17'),
(346, 209, 'gom-phu-lang-2-1_1759335617.jpg', 'gom-phu-lang-2-1', '2025-10-01 16:20:17'),
(347, 209, 'tranhdongho1_1759335618.jpg', 'tranhdongho1', '2025-10-01 16:20:18'),
(348, 210, 'coi_1759509218.jpg', 'coi', '2025-10-03 16:33:39'),
(349, 210, 'coi3_1759509219.jpg', 'coi3', '2025-10-03 16:33:39'),
(350, 210, 'coi2_1759509219.jpg', 'coi2', '2025-10-03 16:33:39'),
(351, 210, 'L__ng-ngh___-Chi___u-c__i-Kim-S__n_1759509220.jpg', 'Làng-nghề-Chiếu-cói-Kim-Sơn', '2025-10-03 16:33:40'),
(352, 210, 'coi1_1759509220.jpg', 'coi1', '2025-10-03 16:33:40'),
(353, 211, 'thaibinh5_1759509795.jpg', 'thaibinh5', '2025-10-03 16:43:15'),
(354, 211, 'thaibinh4_1759509795.jpg', 'thaibinh4', '2025-10-03 16:43:15'),
(355, 211, 'thaibinh1_1759509795.jpg', 'thaibinh1', '2025-10-03 16:43:16'),
(356, 211, 'thaibinh2_1759509796.jpg', 'thaibinh2', '2025-10-03 16:43:16'),
(357, 211, 'thaibinh3_1759509796.jpg', 'thaibinh3', '2025-10-03 16:43:16'),
(358, 212, 'nonnuoc5_1759510727.jpg', 'nonnuoc5', '2025-10-03 16:58:47'),
(359, 212, 'nonnuoc3_1759510728.jpg', 'nonnuoc3', '2025-10-03 16:58:48'),
(360, 212, 'non-nuoc_1759510728.jpg', 'non-nuoc', '2025-10-03 16:58:48'),
(361, 212, 'nonnuoc2_1759510728.jpg', 'nonnuoc2', '2025-10-03 16:58:48'),
(362, 212, 'nonnuoc4_1759510729.jpg', 'nonnuoc4', '2025-10-03 16:58:49'),
(363, 213, 'namo1_1759511426.jpg', 'namo1', '2025-10-03 17:10:26'),
(364, 213, 'tuyloan1_1759511426.jpg', 'tuyloan1', '2025-10-03 17:10:26'),
(365, 213, 'tuyloan_1759511426.jpg', 'tuyloan', '2025-10-03 17:10:26'),
(366, 213, 'namo2_1759511426.jpg', 'namo2', '2025-10-03 17:10:27'),
(367, 213, 'tuyloan3_1759511427.jpg', 'tuyloan3', '2025-10-03 17:10:27'),
(368, 214, 'hoian5_1759511869.jpg', 'hoian5', '2025-10-03 17:17:49'),
(369, 214, 'hoian4_1759511870.jpg', 'hoian4', '2025-10-03 17:17:50'),
(370, 214, 'hoian3_1759511870.jpg', 'hoian3', '2025-10-03 17:17:50'),
(371, 214, 'hoian2_1759511870.jpg', 'hoian2', '2025-10-03 17:17:50'),
(372, 214, 'hoian1_1759511870.jpg', 'hoian1', '2025-10-03 17:17:50'),
(373, 215, 'quangnam5_1759512321.jpg', 'quangnam5', '2025-10-03 17:25:22'),
(374, 215, 'quangnam1_1759512322.jpg', 'quangnam1', '2025-10-03 17:25:22'),
(375, 215, 'quangnam2_1759512322.jpg', 'quangnam2', '2025-10-03 17:25:22'),
(376, 215, 'quangnam3_1759512322.jpg', 'quangnam3', '2025-10-03 17:25:22'),
(377, 215, 'quangnam4_1759512323.png', 'quangnam4', '2025-10-03 17:25:23'),
(378, 216, 'thuy-xuan-5_1760407138.jpg', 'thuy-xuan-5', '2025-10-14 01:58:59'),
(379, 216, 'thuy-xuan-2_1760407139.jpg', 'thuy-xuan-2', '2025-10-14 01:59:00'),
(380, 216, 'Thuy-xuan-3_1760407140.jpg', 'Thuy-xuan-3', '2025-10-14 01:59:00'),
(381, 216, 'thuy-xuan-1_1760407140.jpg', 'thuy-xuan-1', '2025-10-14 01:59:01'),
(382, 216, 'thuy-xuan-4_1760407141.jpg', 'thuy-xuan-4', '2025-10-14 01:59:01'),
(383, 217, 'hue3_1760408159.jpg', 'hue3', '2025-10-14 02:16:00'),
(384, 217, 'hue1_1760408161.jpg', 'hue1', '2025-10-14 02:16:01'),
(385, 217, 'hue5_1760408161.jpg', 'hue5', '2025-10-14 02:16:02'),
(386, 217, 'hue2_1760408162.jpg', 'hue2', '2025-10-14 02:16:02'),
(387, 217, 'hue4_1760408162.png', 'hue4', '2025-10-14 02:16:02'),
(388, 218, 'tayninh5_1760409879.jpg', 'tayninh5', '2025-10-14 02:44:39'),
(389, 218, 'tayninh3_1760409879.jpg', 'tayninh3', '2025-10-14 02:44:40'),
(390, 218, 'tayninh2_1760409880.jpg', 'tayninh2', '2025-10-14 02:44:40'),
(391, 218, 'tayninh1_1760409880.jpg', 'tayninh1', '2025-10-14 02:44:40'),
(392, 218, 'tayninh4_1760409880.jpg', 'tayninh4', '2025-10-14 02:44:40'),
(398, 219, 'bentre5_1760410379.jpg', 'TOUR BẾN TRE', '2025-10-14 02:57:05'),
(399, 219, 'bentre4_1760410379.jpg', 'TOUR BẾN TRE', '2025-10-14 02:57:05'),
(400, 219, 'bentre1_1760410380.png', 'TOUR BẾN TRE', '2025-10-14 02:57:05'),
(401, 219, 'bentr3_1760410380.jpg', 'TOUR BẾN TRE', '2025-10-14 02:57:05'),
(402, 219, 'bentre2_1760410381.jpg', 'TOUR BẾN TRE', '2025-10-14 02:57:05');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_invoice`
--

CREATE TABLE `tbl_invoice` (
  `invoiceId` int(11) NOT NULL,
  `bookingId` int(11) NOT NULL,
  `amount` double NOT NULL,
  `dateIssued` date NOT NULL,
  `details` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_promotion`
--

CREATE TABLE `tbl_promotion` (
  `promotionId` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `discount` double NOT NULL,
  `startDate` date NOT NULL,
  `endDate` date NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_reviews`
--

CREATE TABLE `tbl_reviews` (
  `reviewId` int(11) NOT NULL,
  `tourId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `rating` float NOT NULL,
  `comment` text DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_temp_images`
--

CREATE TABLE `tbl_temp_images` (
  `imageTempId` int(11) NOT NULL,
  `tourId` int(11) NOT NULL,
  `imageTempURL` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_timeline`
--

CREATE TABLE `tbl_timeline` (
  `timeLineId` int(11) NOT NULL,
  `tourId` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_timeline`
--

INSERT INTO `tbl_timeline` (`timeLineId`, `tourId`, `title`, `description`) VALUES
(133, 208, 'Hà Nội – Làng gốm Bát Tràng', '<ul>\n	<li>\n	<p>S&aacute;ng: Tập trung tại H&agrave; Nội, xe đưa đo&agrave;n đi B&aacute;t Tr&agrave;ng.</p>\n	</li>\n	<li>\n	<p><strong>Tham quan</strong>: Chợ gốm, xưởng gốm truyền thống.</p>\n	</li>\n	<li>\n	<p><strong>Trải nghiệm</strong>: Nặn gốm, vẽ họa tiết, mang sản phẩm về l&agrave;m kỷ niệm.</p>\n	</li>\n	<li>\n	<p>Gặp gỡ được c&aacute;c nghệ nh&acirc;n giỏi</p>\n	</li>\n	<li>\n	<p>Nhiều nghệ nh&acirc;n đạt danh hiệu &ldquo;B&agrave;n tay v&agrave;ng&quot;</p>\n	</li>\n	<li>\n	<p>Trưa: Ăn đặc sản H&agrave; Nội.</p>\n	</li>\n	<li>\n	<p>Chiều: Tham quan Hồ Gươm &ndash; Phố cổ.</p>\n	</li>\n	<li>\n	<p>Tối: Nghỉ đ&ecirc;m tại kh&aacute;ch sạn 3 sao.</p>\n	</li>\n</ul>'),
(134, 208, 'Lụa Vạn Phúc – Hà Đông – Hà Nội', '<ul>\n	<li>\n	<p>S&aacute;ng: Ăn s&aacute;ng, tham quan phố lụa Vạn Ph&uacute;c.</p>\n	</li>\n	<li>\n	<p><strong>Trải nghiệm</strong>:Tham quan quy tr&igrave;nh ươm tơ,&nbsp;xem dệt lụa tơ tằm , thử mặc &aacute;o d&agrave;i, mua khăn lụa</p>\n	</li>\n	<li>\n	<p>Được gặp gỡ c&aacute;c nghệ nh&acirc;n lụa cao tuổi</p>\n	</li>\n	<li>\n	<p>Trưa: Ăn uống tại H&agrave; Đ&ocirc;ng.</p>\n	</li>\n	<li>\n	<p>Chiều: Đi tham quan Văn Miếu &ndash; Quốc Tử Gi&aacute;m, Hồ T&acirc;y.</p>\n	</li>\n	<li>\n	<p>Tối: Nghỉ đ&ecirc;m tại kh&aacute;ch sạn H&agrave; Nội.</p>\n	</li>\n</ul>'),
(135, 208, 'Điêu khắc gỗ Sơn Đồng', '<p><strong>S&aacute;ng:</strong></p>\n\n<ul>\n	<li>\n	<p>Tập trung tại H&agrave; Nội, xe đưa đo&agrave;n đi <strong>l&agrave;ng nghề Sơn Đồng (Ho&agrave;i Đức)</strong>.</p>\n	</li>\n	<li>\n	<p><strong>Tham quan:</strong> Xưởng đi&ecirc;u khắc tượng gỗ, khu sản xuất đồ thờ v&agrave; mỹ nghệ truyền thống.</p>\n	</li>\n	<li>\n	<p><strong>Trải nghiệm:</strong> Thử đục chạm gỗ đơn giản dưới sự hướng dẫn của thợ, t&igrave;m hiểu qu&aacute; tr&igrave;nh tạo tượng Phật, đồ thờ từ kh&acirc;u chọn gỗ &ndash; tạo d&aacute;ng &ndash; chạm khắc &ndash; sơn son thếp v&agrave;ng.</p>\n	</li>\n	<li>\n	<p><strong>Gặp gỡ:</strong> C&aacute;c nghệ nh&acirc;n nổi tiếng, nhiều người đạt danh hiệu <strong>&ldquo;B&agrave;n tay v&agrave;ng&rdquo;</strong> trong nghề đi&ecirc;u khắc.</p>\n	</li>\n	<li>\n	<p>Chụp ảnh kỷ niệm với những t&aacute;c phẩm gỗ độc đ&aacute;o.</p>\n	</li>\n</ul>\n\n<p><strong>Trưa:</strong></p>\n\n<ul>\n	<li>\n	<p>D&ugrave;ng bữa trưa với <strong>đặc sản H&agrave; Nội</strong> tại nh&agrave; h&agrave;ng địa phương.</p>\n	</li>\n</ul>\n\n<p><strong>Chiều:</strong></p>\n\n<ul>\n	<li>\n	<p>Xe đưa đo&agrave;n về trung t&acirc;m, tham quan <strong>Hồ Gươm &ndash; Đền Ngọc Sơn &ndash; Phố cổ H&agrave; Nội</strong>.</p>\n	</li>\n	<li>\n	<p>Tự do mua sắm qu&agrave; lưu niệm, thưởng thức ẩm thực đường phố như phở, b&uacute;n chả, ch&egrave; cổ truyền.</p>\n	</li>\n</ul>\n\n<p><strong>Tối:</strong></p>\n\n<ul>\n	<li>\n	<p>Nghỉ đ&ecirc;m tại <strong>kh&aacute;ch sạn 3 sao</strong> ở khu vực trung t&acirc;m H&agrave; Nội.</p>\n	</li>\n</ul>'),
(136, 209, 'Bắc Ninh - Tranh dân gian Đông Hồ', '<p><strong>S&aacute;ng:</strong></p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Tập trung tại H&agrave; Nội, xe đưa đo&agrave;n đi <strong>l&agrave;ng tranh Đ&ocirc;ng Hồ</strong> (Thuận Th&agrave;nh &ndash; Bắc Ninh).</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Tham quan:</strong> Nh&agrave; lưu niệm tranh d&acirc;n gian, t&igrave;m hiểu lịch sử d&ograve;ng tranh c&oacute; từ thế kỷ XVI.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Trải nghiệm:</strong> Thử in tranh bằng bản khắc gỗ, t&ocirc; m&agrave;u tranh &ldquo;Đ&aacute;m cưới chuột&rdquo;, &ldquo;Lợn đ&agrave;n&rdquo;, mang về l&agrave;m kỷ niệm.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Gặp gỡ:</strong> Nghệ nh&acirc;n Nguyễn Đăng Chế, Nguyễn Hữu Sam &ndash; những người được c&ocirc;ng nhận l&agrave; Nghệ nh&acirc;n Nh&acirc;n d&acirc;n.</p>\r\n	</li>\r\n</ul>\r\n\r\n<p><strong>Trưa:</strong></p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Ăn trưa tại nh&agrave; h&agrave;ng địa phương với đặc sản Bắc Ninh: b&aacute;nh phu th&ecirc;, nem B&ugrave;i, g&agrave; Hồ.</p>\r\n	</li>\r\n</ul>\r\n\r\n<p><strong>Chiều:</strong></p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Tiếp tục tham quan c&aacute;c xưởng tranh nhỏ trong l&agrave;ng.</p>\r\n	</li>\r\n	<li>\r\n	<p>T&igrave;m hiểu quy tr&igrave;nh l&agrave;m giấy điệp từ vỏ s&ograve;, vỏ điệp.</p>\r\n	</li>\r\n	<li>\r\n	<p>Mua tranh d&acirc;n gian về l&agrave;m qu&agrave;.</p>\r\n	</li>\r\n</ul>\r\n\r\n<p><strong>Tối:</strong></p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Xe đưa đo&agrave;n trở về H&agrave; Nội.</p>\r\n	</li>\r\n	<li>\r\n	<p>Nghỉ đ&ecirc;m tại kh&aacute;ch sạn 3 sao trung t&acirc;m th&agrave;nh phố.</p>\r\n	</li>\r\n</ul>'),
(137, 209, 'Làng gốm Phù Lãng – Bắc Ninh', '<p><strong>S&aacute;ng:</strong></p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Tập trung tại H&agrave; Nội, xe đưa đo&agrave;n đến <strong>l&agrave;ng gốm Ph&ugrave; L&atilde;ng</strong> (Quế V&otilde; &ndash; Bắc Ninh).</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Tham quan:</strong> L&ograve; nung truyền thống, xưởng gốm th&ocirc; hơn 800 năm tuổi.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Trải nghiệm:</strong> Tự tay nặn gốm bằng đất s&eacute;t, trang tr&iacute; hoa văn tr&ecirc;n sản phẩm.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Gặp gỡ:</strong> Nghệ nh&acirc;n trong l&agrave;ng, t&igrave;m hiểu b&iacute; quyết tạo men da lươn, men n&acirc;u đặc trưng.</p>\r\n	</li>\r\n</ul>\r\n\r\n<p><strong>Trưa:</strong></p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Ăn trưa tại l&agrave;ng với c&aacute;c m&oacute;n qu&ecirc;: c&aacute; s&ocirc;ng Cầu nướng, rau rừng, canh cua.</p>\r\n	</li>\r\n</ul>\r\n\r\n<p><strong>Chiều:</strong></p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Tiếp tục tham quan khu trưng b&agrave;y gốm mỹ nghệ.</p>\r\n	</li>\r\n	<li>\r\n	<p>T&ocirc; m&agrave;u men, mang sản phẩm nhỏ về l&agrave;m kỷ niệm.</p>\r\n	</li>\r\n	<li>\r\n	<p>Giao lưu c&ugrave;ng thợ gốm về truyền thống gia tộc giữ nghề.</p>\r\n	</li>\r\n</ul>\r\n\r\n<p><strong>Tối:</strong></p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Xe đưa đo&agrave;n về H&agrave; Nội.</p>\r\n	</li>\r\n	<li>\r\n	<p>Nghỉ đ&ecirc;m tại kh&aacute;ch sạn 3 sao.</p>\r\n	</li>\r\n</ul>'),
(138, 209, 'Làng đúc đồng Đại Bái – Bắc Ninh', '<p><strong>S&aacute;ng:</strong></p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Tập trung tại H&agrave; Nội, xe đưa đo&agrave;n đi <strong>l&agrave;ng đ&uacute;c đồng Đại B&aacute;i</strong> (Gia B&igrave;nh &ndash; Bắc Ninh).</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Tham quan:</strong> Đền thờ &ocirc;ng tổ nghề Nguyễn C&ocirc;ng Truyền.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Trải nghiệm:</strong> Xem quy tr&igrave;nh nấu đồng, r&oacute;t đồng l&agrave;m chu&ocirc;ng, tượng.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Gặp gỡ:</strong> C&aacute;c nghệ nh&acirc;n đạt danh hiệu &ldquo;Nghệ nh&acirc;n ưu t&uacute;&rdquo; trong nghề đ&uacute;c đồng.</p>\r\n	</li>\r\n</ul>\r\n\r\n<p><strong>Trưa:</strong></p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Ăn trưa tại nh&agrave; h&agrave;ng địa phương với c&aacute;c m&oacute;n d&acirc;n d&atilde; Bắc Ninh.</p>\r\n	</li>\r\n</ul>\r\n\r\n<p><strong>Chiều:</strong></p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Tiếp tục tham quan xưởng đ&uacute;c đồng quy m&ocirc; lớn.</p>\r\n	</li>\r\n	<li>\r\n	<p>Ngắm nh&igrave;n sản phẩm đặc sắc: chu&ocirc;ng ch&ugrave;a, ho&agrave;nh phi, c&acirc;u đối.</p>\r\n	</li>\r\n	<li>\r\n	<p>Chụp ảnh lưu niệm c&ugrave;ng tượng đồng khổng lồ.</p>\r\n	</li>\r\n</ul>\r\n\r\n<p><strong>Tối:</strong></p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Xe đưa đo&agrave;n về lại H&agrave; Nội.</p>\r\n	</li>\r\n	<li>\r\n	<p>Nghỉ đ&ecirc;m tại kh&aacute;ch sạn 3 sao.</p>\r\n	</li>\r\n</ul>'),
(139, 210, 'Tour Làng nghề Cói Kim Sơn – Ninh Bình', '<p><strong>S&aacute;ng:</strong></p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Tập trung tại H&agrave; Nội, xe đưa đo&agrave;n đi <strong>l&agrave;ng c&oacute;i Kim Sơn (Ninh B&igrave;nh)</strong>.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Tham quan:</strong> C&aacute;nh đồng c&oacute;i, xưởng đan chiếu, giỏ, thảm.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Trải nghiệm:</strong> Tham quan c&aacute;nh đồng c&oacute;i xanh bạt ng&agrave;n. Tận mắt chứng kiến quy tr&igrave;nh thu hoạch, phơi, nhuộm c&oacute;i. Thử đan chiếu hoặc giỏ nhỏ dưới sự hướng dẫn của nghệ nh&acirc;n. Mua sản phẩm thủ c&ocirc;ng l&agrave;m qu&agrave; lưu niệm.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Gặp gỡ:</strong> Nghệ nh&acirc;n địa phương với b&iacute; quyết nhuộm c&oacute;i, đan hoa văn cổ truyền.</p>\r\n	</li>\r\n</ul>\r\n\r\n<p><strong>Trưa:</strong></p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Ăn trưa đặc sản Ninh B&igrave;nh: d&ecirc; n&uacute;i, cơm ch&aacute;y, canh cua rau r&uacute;t.</p>\r\n	</li>\r\n</ul>\r\n\r\n<p><strong>Chiều:</strong></p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Tiếp tục tham quan hợp t&aacute;c x&atilde; sản xuất c&oacute;i xuất khẩu.</p>\r\n	</li>\r\n	<li>\r\n	<p>Mua chiếu, t&uacute;i, đồ trang tr&iacute; l&agrave;m qu&agrave; lưu niệm.</p>\r\n	</li>\r\n</ul>\r\n\r\n<p><strong>Tối:</strong></p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Xe đưa đo&agrave;n về H&agrave; Nội.</p>\r\n	</li>\r\n	<li>\r\n	<p>Nghỉ đ&ecirc;m tại kh&aacute;ch sạn 3 sao.</p>\r\n	</li>\r\n</ul>'),
(140, 211, 'Tour Làng nghề Chạm bạc Đồng Xâm – Thái Bình', '<p><strong>S&aacute;ng:</strong></p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Tập trung tại H&agrave; Nội, xe đi <strong>l&agrave;ng bạc Đồng X&acirc;m (Kiến Xương &ndash; Th&aacute;i B&igrave;nh)</strong>.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Tham quan:</strong> Xưởng chế t&aacute;c bạc, t&igrave;m hiểu lịch sử hơn 300 năm.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Trải nghiệm:</strong> Thử khắc họa tiết đơn giản tr&ecirc;n tấm bạc. Mua trang sức bạc, đồ lưu niệm thủ c&ocirc;ng.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Gặp gỡ:</strong> C&aacute;c nghệ nh&acirc;n bậc thầy, nổi tiếng về khảm bạc tinh xảo.</p>\r\n	</li>\r\n</ul>\r\n\r\n<p><strong>Trưa:</strong></p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Ăn trưa tại nh&agrave; h&agrave;ng địa phương, đặc sản: canh c&aacute; Quỳnh C&ocirc;i, b&aacute;nh nghệ, b&aacute;nh gai.</p>\r\n	</li>\r\n</ul>\r\n\r\n<p><strong>Chiều:</strong></p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Tiếp tục tham quan chợ đồ bạc, khu trưng b&agrave;y sản phẩm: đồ trang sức, tượng bạc, đồ thờ.</p>\r\n	</li>\r\n	<li>\r\n	<p>Tự do mua qu&agrave; lưu niệm bằng bạc.</p>\r\n	</li>\r\n</ul>\r\n\r\n<p><strong>Tối:</strong></p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Xe đưa đo&agrave;n trở về H&agrave; Nội.</p>\r\n	</li>\r\n	<li>\r\n	<p>Nghỉ đ&ecirc;m tại kh&aacute;ch sạn 3 sao.</p>\r\n	</li>\r\n</ul>'),
(141, 212, 'Tour Làng đá mỹ nghệ Non Nước – Đà Nẵng', '<p><strong>S&aacute;ng:</strong></p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Tập trung tại trung t&acirc;m Đ&agrave; Nẵng, xe đưa đo&agrave;n đến <strong>l&agrave;ng đ&aacute; mỹ nghệ Non Nước</strong> dưới ch&acirc;n Ngũ H&agrave;nh Sơn.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Tham quan:</strong> C&aacute;c xưởng đi&ecirc;u khắc đ&aacute;, khu trưng b&agrave;y tượng Phật, tượng Chăm, ph&ugrave; đi&ecirc;u.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Trải nghiệm:</strong> Xem qu&aacute; tr&igrave;nh tạo h&igrave;nh từ khối đ&aacute; đến tượng ho&agrave;n chỉnh. Thử khắc hoa văn nhỏ l&ecirc;n đ&aacute;. Mua đồ lưu niệm bằng đ&aacute; mỹ nghệ.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Gặp gỡ:</strong> Nhiều nghệ nh&acirc;n được phong tặng danh hiệu Nghệ nh&acirc;n Ưu t&uacute;. Gia tộc Huỳnh B&aacute; nổi tiếng với nhiều thế hệ l&agrave;m nghề.</p>\r\n	</li>\r\n</ul>\r\n\r\n<p><strong>Trưa:</strong></p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Ăn trưa tại nh&agrave; h&agrave;ng gần Ngũ H&agrave;nh Sơn, thưởng thức đặc sản Đ&agrave; Nẵng: m&igrave; Quảng, b&aacute;nh tr&aacute;ng cuốn thịt heo.</p>\r\n	</li>\r\n</ul>\r\n\r\n<p><strong>Chiều:</strong></p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Tham quan chợ đ&aacute; mỹ nghệ, tự do mua đồ trang tr&iacute;, đồ lưu niệm.</p>\r\n	</li>\r\n	<li>\r\n	<p>Gh&eacute; tham quan Ngũ H&agrave;nh Sơn &ndash; danh thắng nổi tiếng kề b&ecirc;n l&agrave;ng nghề.</p>\r\n	</li>\r\n</ul>\r\n\r\n<p><strong>Tối:</strong></p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Xe đưa đo&agrave;n trở về kh&aacute;ch sạn tại Đ&agrave; Nẵng, nghỉ ngơi.</p>\r\n	</li>\r\n</ul>'),
(142, 213, 'Tour Làng bánh tráng Túy Loan – Đà Nẵng', '<p><strong>S&aacute;ng:</strong></p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Tập trung tại trung t&acirc;m Đ&agrave; Nẵng, xe đưa đo&agrave;n đi <strong>l&agrave;ng T&uacute;y Loan</strong> (H&ograve;a Vang).</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Tham quan:</strong> L&ograve; b&aacute;nh tr&aacute;ng truyền thống hơn 500 năm tuổi.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Trải nghiệm:</strong></p>\r\n\r\n	<ul>\r\n		<li>\r\n		<p>Tự tay tr&aacute;ng b&aacute;nh từ bột gạo, phơi b&aacute;nh ngo&agrave;i s&acirc;n.</p>\r\n		</li>\r\n		<li>\r\n		<p>Nướng b&aacute;nh tr&aacute;ng m&egrave; tr&ecirc;n bếp than hồng.</p>\r\n		</li>\r\n		<li>\r\n		<p>Thưởng thức b&aacute;nh tr&aacute;ng vừa nướng gi&ograve;n thơm.</p>\r\n		</li>\r\n	</ul>\r\n	</li>\r\n	<li>\r\n	<p><strong>Gặp gỡ:</strong> Nghệ nh&acirc;n l&agrave;ng T&uacute;y Loan, nghe kể về lịch sử d&ograve;ng b&aacute;nh tr&aacute;ng gắn liền với ng&agrave;y Tết xứ Quảng.</p>\r\n	</li>\r\n</ul>\r\n\r\n<p><strong>Trưa:</strong></p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Ăn trưa tại nh&agrave; d&acirc;n trong l&agrave;ng với c&aacute;c m&oacute;n đặc sản: b&aacute;nh tr&aacute;ng cuốn thịt heo, m&igrave; Quảng, g&agrave; tre nướng l&aacute; chanh.</p>\r\n	</li>\r\n</ul>\r\n\r\n<p><strong>Chiều:</strong></p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Tiếp tục tham quan l&agrave;ng cổ T&uacute;y Loan, đ&igrave;nh l&agrave;ng v&agrave; d&ograve;ng s&ocirc;ng Cẩm Lệ.</p>\r\n	</li>\r\n	<li>\r\n	<p>Mua b&aacute;nh tr&aacute;ng đặc sản về l&agrave;m qu&agrave;.</p>\r\n	</li>\r\n</ul>\r\n\r\n<p><strong>Tối:</strong></p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Xe đưa đo&agrave;n về lại Đ&agrave; Nẵng.</p>\r\n	</li>\r\n	<li>\r\n	<p>Nghỉ đ&ecirc;m tại kh&aacute;ch sạn 3 sao, tự do dạo phố biển.</p>\r\n	</li>\r\n</ul>'),
(143, 213, 'Tour Làng nước mắm Nam Ô - Đà', '<p><strong>S&aacute;ng:</strong></p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Ăn s&aacute;ng tại kh&aacute;ch sạn, xe đưa đo&agrave;n đi <strong>l&agrave;ng Nam &Ocirc;</strong> (Li&ecirc;n Chiểu &ndash; Đ&agrave; Nẵng).</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Tham quan:</strong> C&aacute;c cơ sở ủ chượp nước mắm truyền thống.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Trải nghiệm:</strong></p>\r\n\r\n	<ul>\r\n		<li>\r\n		<p>Nghe nghệ nh&acirc;n chia sẻ b&iacute; quyết chọn c&aacute; cơm than, ủ muối, l&ecirc;n men.</p>\r\n		</li>\r\n		<li>\r\n		<p>Nếm thử nước mắm nguy&ecirc;n chất Nam &Ocirc;.</p>\r\n		</li>\r\n	</ul>\r\n	</li>\r\n	<li>\r\n	<p><strong>Gặp gỡ:</strong> Nghệ nh&acirc;n l&agrave;ng Nam &Ocirc;, gia đ&igrave;nh giữ nghề h&agrave;ng trăm năm.</p>\r\n	</li>\r\n</ul>\r\n\r\n<p><strong>Trưa:</strong></p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Ăn trưa với đặc sản ven biển: gỏi c&aacute; Nam &Ocirc;, c&aacute; nướng, rau rừng.</p>\r\n	</li>\r\n</ul>\r\n\r\n<p><strong>Chiều:</strong></p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Dạo chơi b&atilde;i biển Nam &Ocirc;, chụp ảnh kỷ niệm.</p>\r\n	</li>\r\n	<li>\r\n	<p>Mua nước mắm Nam &Ocirc; ch&iacute;nh hiệu về l&agrave;m qu&agrave;.</p>\r\n	</li>\r\n</ul>\r\n\r\n<p><strong>Tối:</strong></p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Trở lại trung t&acirc;m Đ&agrave; Nẵng.</p>\r\n	</li>\r\n	<li>\r\n	<p>Kết th&uacute;c tour 2 ng&agrave;y 1 đ&ecirc;m.</p>\r\n	</li>\r\n</ul>'),
(144, 214, 'Tour Làng gốm Thanh Hà – Hội An', '<p><strong>S&aacute;ng:</strong></p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Tập trung tại Hội An, xe đưa đo&agrave;n đến <strong>l&agrave;ng gốm Thanh H&agrave;</strong>.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Tham quan:</strong> C&ocirc;ng vi&ecirc;n Đất nung Thanh H&agrave;, l&ograve; gốm cổ.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Trải nghiệm:</strong>Thử nặn gốm, tạo h&igrave;nh sản phẩm nhỏ. Mua đồ gốm lưu niệm.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Gặp gỡ:</strong> Nghệ nh&acirc;n Thanh H&agrave;, nghe chia sẻ về lịch sử hơn 400 năm của l&agrave;ng gốm.</p>\r\n	</li>\r\n</ul>\r\n\r\n<p><strong>Trưa:</strong></p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Ăn trưa đặc sản Hội An: cao lầu, m&igrave; Quảng, b&aacute;nh bao &ndash; b&aacute;nh vạc.</p>\r\n	</li>\r\n</ul>\r\n\r\n<p><strong>Chiều:</strong></p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Tham quan khu trưng b&agrave;y gốm, mua đồ gốm lưu niệm.</p>\r\n	</li>\r\n	<li>\r\n	<p>Đi dạo quanh l&agrave;ng, chụp ảnh cảnh l&agrave;ng qu&ecirc; ven s&ocirc;ng Thu Bồn.</p>\r\n	</li>\r\n</ul>\r\n\r\n<p><strong>Tối:</strong></p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Quay lại phố cổ Hội An, nghỉ đ&ecirc;m tại kh&aacute;ch sạn.</p>\r\n	</li>\r\n</ul>'),
(145, 215, 'Tour Làng mộc Kim Bồng – Hội An', '<p><strong>S&aacute;ng:</strong></p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Đi thuyền từ bến s&ocirc;ng Hội An đến <strong>l&agrave;ng mộc Kim Bồng</strong>.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Tham quan:</strong> C&aacute;c xưởng chạm khắc gỗ, khu đ&oacute;ng thuyền.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Trải nghiệm:</strong> Thử đục chạm gỗ đơn giản.&nbsp;Mua đồ gỗ mỹ nghệ nhỏ.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Gặp gỡ:</strong> Nghệ nh&acirc;n Huỳnh Ri v&agrave; thợ mộc địa phương, nghe kể về nghề mộc từng x&acirc;y dựng cung đ&igrave;nh Huế.</p>\r\n	</li>\r\n</ul>\r\n\r\n<p><strong>Trưa:</strong></p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Ăn trưa tại l&agrave;ng, thưởng thức c&aacute; nướng, rau đồng, m&oacute;n d&acirc;n d&atilde; Quảng Nam.</p>\r\n	</li>\r\n</ul>\r\n\r\n<p><strong>Chiều:</strong></p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Tiếp tục tham quan nh&agrave; cổ, chợ gỗ mỹ nghệ.</p>\r\n	</li>\r\n	<li>\r\n	<p>Mua đồ gỗ nhỏ, đồ trang tr&iacute; thủ c&ocirc;ng.</p>\r\n	</li>\r\n</ul>\r\n\r\n<p><strong>Tối:</strong></p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Quay lại Hội An, tự do tham quan phố cổ về đ&ecirc;m.</p>\r\n	</li>\r\n</ul>'),
(146, 216, 'Tour Làng hương Thủy Xuân – Huế', '<p><strong>S&aacute;ng:</strong></p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Tập trung tại trung t&acirc;m Huế, xe đưa đo&agrave;n đến <strong>l&agrave;ng hương Thủy Xu&acirc;n</strong>.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Tham quan:</strong> Xưởng l&agrave;m hương đầy m&agrave;u sắc.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Trải nghiệm:</strong> Thử cuốn hương, pha chế hương quế, hương trầm.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Gặp gỡ:</strong> Nghệ nh&acirc;n l&acirc;u năm, gia đ&igrave;nh đ&atilde; giữ nghề hơn 100 năm.</p>\r\n	</li>\r\n</ul>\r\n\r\n<p><strong>Trưa:</strong></p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Ăn trưa tại nh&agrave; h&agrave;ng Huế: b&uacute;n b&ograve; Huế, b&aacute;nh b&egrave;o, b&aacute;nh nậm.</p>\r\n	</li>\r\n</ul>\r\n\r\n<p><strong>Chiều:</strong></p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Chụp ảnh với những b&oacute; hương nhiều m&agrave;u sặc sỡ.</p>\r\n	</li>\r\n	<li>\r\n	<p>Mua hương trầm l&agrave;m qu&agrave; lưu niệm.</p>\r\n	</li>\r\n	<li>\r\n	<p>Gh&eacute; thăm lăng Tự Đức hoặc đồi Vọng Cảnh gần l&agrave;ng hương.</p>\r\n	</li>\r\n</ul>\r\n\r\n<p><strong>Tối:</strong></p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Quay về trung t&acirc;m Huế.</p>\r\n	</li>\r\n</ul>'),
(147, 217, 'Tour Làng nón lá Tây Hồ – Huế', '<p><strong>S&aacute;ng:</strong></p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Đo&agrave;n tham quan <strong>l&agrave;ng n&oacute;n T&acirc;y Hồ</strong>.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Tham quan:</strong> Xưởng l&agrave;m n&oacute;n, quy tr&igrave;nh chẻ tre, xếp l&aacute;, kh&acirc;u n&oacute;n.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Trải nghiệm:</strong> Tự tay kh&acirc;u một chiếc n&oacute;n nhỏ.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Gặp gỡ:</strong> C&aacute;c nghệ nh&acirc;n nữ kh&eacute;o l&eacute;o, giữ nghề qua nhiều đời.</p>\r\n	</li>\r\n</ul>\r\n\r\n<p><strong>Trưa:</strong></p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Ăn trưa với cơm chay Huế hoặc cơm hến.</p>\r\n	</li>\r\n</ul>\r\n\r\n<p><strong>Chiều:</strong></p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Ngắm những chiếc &ldquo;n&oacute;n b&agrave;i thơ&rdquo;, soi dưới nắng hiện ra hoa văn, thơ ca.</p>\r\n	</li>\r\n	<li>\r\n	<p>Mua n&oacute;n l&agrave;m qu&agrave; lưu niệm.</p>\r\n	</li>\r\n</ul>\r\n\r\n<p><strong>Tối:</strong></p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Quay lại trung t&acirc;m Huế, kết th&uacute;c chương tr&igrave;nh.</p>\r\n	</li>\r\n</ul>'),
(148, 218, 'Tour Bánh tráng phơi sương – Muối ớt Tây Ninh', '<p><strong>S&aacute;ng:</strong></p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Từ TP.HCM, di chuyển đến <strong>Trảng B&agrave;ng &ndash; T&acirc;y Ninh</strong>.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Tham quan:</strong> Cơ sở sản xuất b&aacute;nh tr&aacute;ng phơi sương truyền thống hơn 100 năm tuổi.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Trải nghiệm:</strong></p>\r\n\r\n	<ul>\r\n		<li>\r\n		<p>Tr&aacute;ng, phơi v&agrave; nướng b&aacute;nh tr&aacute;ng.</p>\r\n		</li>\r\n		<li>\r\n		<p>Thưởng thức b&aacute;nh tr&aacute;ng phơi sương cuốn thịt heo v&agrave; rau rừng.</p>\r\n		</li>\r\n	</ul>\r\n	</li>\r\n	<li>\r\n	<p><strong>Gặp gỡ:</strong> Nghệ nh&acirc;n <strong>Trần Thị Phỉ</strong>, người được mệnh danh &ldquo;B&agrave; tổ b&aacute;nh tr&aacute;ng phơi sương&rdquo;.</p>\r\n	</li>\r\n</ul>\r\n\r\n<p><strong>Trưa:</strong></p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Ăn trưa tại nh&agrave; h&agrave;ng địa phương: <strong>b&aacute;nh canh Trảng B&agrave;ng, thịt heo cuốn b&aacute;nh tr&aacute;ng, rau rừng</strong>.</p>\r\n	</li>\r\n</ul>\r\n\r\n<p><strong>Chiều:</strong></p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Gh&eacute; <strong>cơ sở sản xuất muối ớt T&acirc;y Ninh</strong>, nghe kể về quy tr&igrave;nh chế biến muối đặc sản.</p>\r\n	</li>\r\n	<li>\r\n	<p>Mua b&aacute;nh tr&aacute;ng &amp; muối ớt l&agrave;m qu&agrave;.</p>\r\n	</li>\r\n</ul>\r\n\r\n<p><strong>Tối:</strong></p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Trở về TP.HCM, kết th&uacute;c tour.</p>\r\n	</li>\r\n</ul>'),
(151, 219, 'Tour Làng kẹo dừa – Bến Tre', '<p><strong>S&aacute;ng:</strong></p>\n\n<ul>\n	<li>\n	<p>Khởi h&agrave;nh từ TP.HCM, xe đưa đo&agrave;n đến <strong>l&agrave;ng nghề kẹo dừa Bến Tre</strong>.</p>\n	</li>\n	<li>\n	<p><strong>Tham quan:</strong> Cơ sở sản xuất kẹo dừa truyền thống, t&igrave;m hiểu lịch sử nghề đ&atilde; hơn 100 năm.</p>\n	</li>\n	<li>\n	<p><strong>Trải nghiệm:</strong></p>\n\n	<ul>\n		<li>\n		<p>Tự tay g&oacute;i kẹo, nếm thử kẹo dừa n&oacute;ng mới ra l&ograve;.</p>\n		</li>\n		<li>\n		<p>T&igrave;m hiểu quy tr&igrave;nh nấu đường, quấy kẹo, c&aacute;n dừa.</p>\n		</li>\n	</ul>\n	</li>\n	<li>\n	<p><strong>Gặp gỡ:</strong> Nghệ nh&acirc;n <strong>Nguyễn Thị Ngọc</strong>, người giữ nghề kẹo dừa truyền thống hơn 40 năm.</p>\n	</li>\n</ul>\n\n<p><strong>Trưa:</strong></p>\n\n<ul>\n	<li>\n	<p>Ăn trưa tr&ecirc;n <strong>c&ugrave; lao An B&igrave;nh</strong>, thưởng thức c&aacute;c m&oacute;n đặc sản như <strong>c&aacute; tai tượng chi&ecirc;n x&ugrave;</strong>, <strong>canh chua b&ocirc;ng đi&ecirc;n điển</strong>, <strong>t&eacute;p rang dừa</strong>.</p>\n	</li>\n</ul>\n\n<p><strong>Chiều:</strong></p>\n\n<ul>\n	<li>\n	<p>Đi <strong>xuồng ba l&aacute;</strong> tham quan vườn dừa, nghe <strong>đờn ca t&agrave;i tử Nam Bộ</strong>.</p>\n	</li>\n	<li>\n	<p>Mua đặc sản: kẹo dừa, dừa sấy, đồ thủ c&ocirc;ng mỹ nghệ từ dừa.</p>\n	</li>\n</ul>\n\n<p><strong>Tối:</strong></p>\n\n<ul>\n	<li>\n	<p>Xe đưa đo&agrave;n về kh&aacute;ch sạn , nghỉ ngơi</p>\n	</li>\n</ul>'),
(152, 219, 'Tour Làng bánh tráng Mỹ Lồng – Bánh phồng Sơn Đốc', '<p><strong>S&aacute;ng:</strong></p>\n\n<ul>\n	<li>\n	<p>Tập trung tại trung t&acirc;m Bến Tre, xe đưa đo&agrave;n đến <strong>l&agrave;ng nghề b&aacute;nh tr&aacute;ng Mỹ Lồng</strong>.</p>\n	</li>\n	<li>\n	<p><strong>Tham quan:</strong> L&ograve; b&aacute;nh thủ c&ocirc;ng truyền thống, xem quy tr&igrave;nh <strong>xay gạo &ndash; tr&aacute;ng b&aacute;nh &ndash; phơi nắng &ndash; nướng than</strong>.</p>\n	</li>\n	<li>\n	<p><strong>Trải nghiệm:</strong> Tự tay tr&aacute;ng v&agrave; nướng b&aacute;nh tr&aacute;ng m&egrave; gi&ograve;n rụm.</p>\n	</li>\n	<li>\n	<p><strong>Gặp gỡ:</strong> C&aacute;c nghệ nh&acirc;n địa phương, nghe kể về lịch sử b&aacute;nh tr&aacute;ng hơn 100 năm tuổi.</p>\n	</li>\n</ul>\n\n<p><strong>Trưa:</strong></p>\n\n<ul>\n	<li>\n	<p>Ăn trưa với <strong>c&aacute; kho tộ, canh chua c&aacute; l&oacute;c, rau luộc kho quẹt</strong>.</p>\n	</li>\n</ul>\n\n<p><strong>Chiều:</strong></p>\n\n<ul>\n	<li>\n	<p>Tiếp tục gh&eacute; <strong>l&agrave;ng b&aacute;nh phồng Sơn Đốc</strong>, xem quy tr&igrave;nh l&agrave;m b&aacute;nh phồng Tết truyền thống.</p>\n	</li>\n	<li>\n	<p>Thưởng thức b&aacute;nh phồng nướng thơm lừng, mua b&aacute;nh về l&agrave;m qu&agrave;.</p>\n	</li>\n</ul>\n\n<p><strong>Tối:</strong></p>\n\n<ul>\n	<li>\n	<p>Quay lại trung t&acirc;m TPHCM, kết th&uacute;c tour.</p>\n	</li>\n</ul>');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_tours`
--

CREATE TABLE `tbl_tours` (
  `tourId` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `time` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `quantity` int(11) NOT NULL,
  `priceAdult` double NOT NULL,
  `priceChild` double NOT NULL,
  `destination` varchar(255) NOT NULL,
  `domain` enum('b','t','n') NOT NULL COMMENT '''b'' : Mienbac,\r\n''t'' : MienTrung,\r\n''n'' MienNam',
  `availability` tinyint(1) NOT NULL,
  `startDate` date NOT NULL,
  `endDate` date NOT NULL,
  `reviews` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_tours`
--

INSERT INTO `tbl_tours` (`tourId`, `title`, `time`, `description`, `quantity`, `priceAdult`, `priceChild`, `destination`, `domain`, `availability`, `startDate`, `endDate`, `reviews`) VALUES
(208, 'TOUR HÀ NỘI – BÁT TRÀNG – VẠN PHÚC', '33 ngày 32 đêm', '<h2>1. L&agrave;ng gốm <strong>B&aacute;t Tr&agrave;ng</strong> (Gia L&acirc;m &ndash; H&agrave; Nội)</h2>\n\n<ul>\n	<li>\n	<p><strong>Lịch sử &amp; văn h&oacute;a:</strong></p>\n\n	<ul>\n		<li>\n		<p>C&oacute; lịch sử hơn 500 năm, h&igrave;nh th&agrave;nh từ thời L&ecirc;.</p>\n		</li>\n		<li>\n		<p>Nổi tiếng về nghề gốm sứ truyền thống, từng cung cấp đồ gốm cho triều đ&igrave;nh v&agrave; bu&ocirc;n b&aacute;n quốc tế từ thế kỷ XV.</p>\n		</li>\n		<li>\n		<p>Văn h&oacute;a gắn liền với h&igrave;nh ảnh l&agrave;ng qu&ecirc; ven s&ocirc;ng Hồng, vừa d&acirc;n d&atilde; vừa tinh hoa.</p>\n		</li>\n	</ul>\n	</li>\n	<li>\n	<p><strong>Đặc trưng:</strong></p>\n\n	<ul>\n		<li>\n		<p>Sản phẩm gốm sứ đa dạng: đồ thờ, đồ gia dụng, đồ mỹ nghệ, tượng nghệ thuật.</p>\n		</li>\n		<li>\n		<p>M&agrave;u men đặc biệt (men tro, men ngọc, men lam cổ).</p>\n		</li>\n	</ul>\n	</li>\n</ul>\n\n<h2>2. L&agrave;ng lụa <strong>Vạn Ph&uacute;c</strong> (H&agrave; Đ&ocirc;ng &ndash; H&agrave; Nội)</h2>\n\n<ul>\n	<li>\n	<p><strong>Lịch sử &amp; văn h&oacute;a:</strong></p>\n\n	<ul>\n		<li>\n		<p>Được mệnh danh l&agrave; &ldquo;L&agrave;ng lụa 1.000 năm tuổi&rdquo;.</p>\n		</li>\n		<li>\n		<p>Lụa Vạn Ph&uacute;c từng được chọn may &aacute;o long b&agrave;o cho vua ch&uacute;a thời phong kiến.</p>\n		</li>\n		<li>\n		<p>Từng được mang đi dự hội chợ Paris (1931), g&acirc;y tiếng vang quốc tế.</p>\n		</li>\n	</ul>\n	</li>\n	<li>\n	<p><strong>Đặc trưng:</strong></p>\n\n	<ul>\n		<li>\n		<p>Vải lụa mềm, &oacute;ng &aacute;nh, nhẹ, bền.</p>\n		</li>\n		<li>\n		<p>Họa tiết truyền thống như m&acirc;y, s&oacute;ng, tứ linh, hoa l&aacute;.</p>\n		</li>\n	</ul>\n	</li>\n</ul>\n\n<p>&nbsp;</p>\n\n<h2>3. L&agrave;ng <strong>đi&ecirc;u khắc gỗ Sơn Đồng</strong> (Ho&agrave;i Đức &ndash; H&agrave; Nội)</h2>\n\n<ul>\n	<li>\n	<p><strong>Lịch sử &amp; văn h&oacute;a:</strong></p>\n\n	<ul>\n		<li>\n		<p>L&agrave; trung t&acirc;m đi&ecirc;u khắc tượng gỗ lớn nhất miền Bắc, c&oacute; từ h&agrave;ng trăm năm.</p>\n		</li>\n		<li>\n		<p>Nổi tiếng với tượng Phật, đồ thờ, ho&agrave;nh phi c&acirc;u đối.</p>\n		</li>\n		<li>\n		<p>Gắn liền với văn h&oacute;a t&iacute;n ngưỡng, ch&ugrave;a chiền, đ&igrave;nh đền Bắc Bộ.</p>\n		</li>\n	</ul>\n	</li>\n	<li>\n	<p><strong>Đặc trưng:</strong></p>\n\n	<ul>\n		<li>\n		<p>Sản phẩm: tượng Phật, Quan &Acirc;m, đồ thờ, chạm khắc gỗ mỹ nghệ.</p>\n		</li>\n		<li>\n		<p>Kỹ thuật: tạc gỗ, sơn son thếp v&agrave;ng, d&aacute;t bạc.</p>\n		</li>\n	</ul>\n	</li>\n</ul>', 18, 1000000, 500000, 'Hà Nội', 'b', 1, '2025-11-27', '2025-12-30', NULL),
(209, 'TOUR BẮC NINH - TRANH ĐÔNG HỒ - PHÙ LÃNG - ĐẠI BÁI', '64 ngày 63 đêm', '<h2>1. <strong>Tranh d&acirc;n gian Đ&ocirc;ng Hồ</strong> (Thuận Th&agrave;nh &ndash; Bắc Ninh)</h2>\n\n<ul>\n	<li>\n	<p><strong>Lịch sử &amp; văn h&oacute;a:</strong></p>\n\n	<ul>\n		<li>\n		<p>C&oacute; từ thế kỷ XVI, gắn với đời sống n&ocirc;ng th&ocirc;n Việt Nam.</p>\n		</li>\n		<li>\n		<p>Tranh thường treo v&agrave;o dịp Tết, phản &aacute;nh sinh hoạt d&acirc;n gian, ước mơ no đủ, ch&acirc;m biếm th&oacute;i xấu.</p>\n		</li>\n		<li>\n		<p>Kỹ thuật in tranh tr&ecirc;n giấy điệp (giấy trộn vỏ s&ograve;, tạo độ &oacute;ng &aacute;nh).</p>\n		</li>\n	</ul>\n	</li>\n	<li>\n	<p><strong>Đặc trưng:</strong></p>\n\n	<ul>\n		<li>\n		<p>Chủ đề: &ldquo;Đ&aacute;m cưới chuột&rdquo;, &ldquo;Lợn đ&agrave;n&rdquo;, &ldquo;Thầy đồ c&oacute;c&rdquo;, &ldquo;Vinh hoa &ndash; Ph&uacute; qu&yacute;&rdquo;.</p>\n		</li>\n		<li>\n		<p>M&agrave;u sắc từ chất liệu tự nhi&ecirc;n (l&aacute; ch&agrave;m, than tre, gỗ v&agrave;ng nghệ&hellip;).&nbsp;</p>\n		</li>\n	</ul>\n	</li>\n</ul>\n\n<h2>2. <strong>L&agrave;ng gốm Ph&ugrave; L&atilde;ng</strong> (Quế V&otilde; &ndash; Bắc Ninh)</h2>\n\n<ul>\n	<li>\n	<p><strong>Lịch sử &amp; văn h&oacute;a:</strong></p>\n\n	<ul>\n		<li>\n		<p>Nghề gốm c&oacute; từ thời L&yacute; &ndash; Trần, hơn 800 năm tuổi.</p>\n		</li>\n		<li>\n		<p>Đặc trưng với d&ograve;ng gốm th&ocirc;, men n&acirc;u, men da lươn.</p>\n		</li>\n		<li>\n		<p>Văn h&oacute;a gắn liền với s&ocirc;ng Cầu &ndash; v&ugrave;ng Kinh Bắc.</p>\n		</li>\n	</ul>\n	</li>\n	<li>\n	<p><strong>Đặc trưng:</strong></p>\n\n	<ul>\n		<li>\n		<p>Sản phẩm: chum vại, lọ hoa, gốm trang tr&iacute;, ph&ugrave; đi&ecirc;u.</p>\n		</li>\n		<li>\n		<p>Gốm Ph&ugrave; L&atilde;ng thường c&oacute; họa tiết khắc nổi, chạm khắc thủ c&ocirc;ng.</p>\n		</li>\n	</ul>\n	</li>\n</ul>\n\n<h2>3. <strong>L&agrave;ng đ&uacute;c đồng Đại B&aacute;i</strong> (Gia B&igrave;nh &ndash; Bắc Ninh)</h2>\n\n<ul>\n	<li>\n	<p><strong>Lịch sử &amp; văn h&oacute;a:</strong></p>\n\n	<ul>\n		<li>\n		<p>C&oacute; lịch sử gần 1.000 năm, do &ocirc;ng tổ nghề Nguyễn C&ocirc;ng Truyền (người được t&ocirc;n l&agrave;m Th&agrave;nh ho&agrave;ng).</p>\n		</li>\n		<li>\n		<p>Nổi tiếng với nghề đ&uacute;c đồng: chu&ocirc;ng, tượng, đồ thờ, ho&agrave;nh phi, c&acirc;u đối.</p>\n		</li>\n		<li>\n		<p>Văn h&oacute;a l&agrave;ng nghề gắn với t&iacute;n ngưỡng, đ&igrave;nh đền Bắc Bộ.</p>\n		</li>\n	</ul>\n	</li>\n	<li>\n	<p><strong>Đặc trưng:</strong></p>\n\n	<ul>\n		<li>\n		<p>Sản phẩm đồng đỏ, đồng v&agrave;ng, tinh xảo.</p>\n		</li>\n		<li>\n		<p>Nhiều sản phẩm được đặt l&agrave;m cho ch&ugrave;a, đền lớn.</p>\n		</li>\n	</ul>\n	</li>\n</ul>', 30, 1000000, 500000, 'Bắc Ninh', 'b', 1, '2025-10-27', '2025-12-30', NULL),
(210, 'Tour Kim Sơn – Ninh Bình', '64 ngày 63 đêm', '<p>Kh&aacute;m ph&aacute; Tours</p>\n\n<h2>1. <strong>L&agrave;ng nghề C&oacute;i Kim Sơn</strong> (Ninh B&igrave;nh)</h2>\n\n<ul>\n	<li>\n	<p><strong>Lịch sử &amp; văn h&oacute;a:</strong></p>\n\n	<ul>\n		<li>\n		<p>Xuất hiện từ thế kỷ XIX, do linh mục Trần Lục (c&ograve;n gọi l&agrave; Cụ S&aacute;u) khai hoang v&ugrave;ng b&atilde;i bồi ven biển Kim Sơn.</p>\n		</li>\n		<li>\n		<p>Nghề c&oacute;i trở th&agrave;nh sinh kế của cả v&ugrave;ng, tạo n&ecirc;n bản sắc văn h&oacute;a s&ocirc;ng nước &ndash; đồng bằng ven biển.</p>\n		</li>\n	</ul>\n	</li>\n	<li>\n	<p><strong>Đặc trưng:</strong></p>\n\n	<ul>\n		<li>\n		<p>Nguy&ecirc;n liệu ch&iacute;nh: c&acirc;y c&oacute;i trồng tr&ecirc;n b&atilde;i bồi ven biển.</p>\n		</li>\n		<li>\n		<p>Sản phẩm đa dạng: chiếu c&oacute;i, thảm, giỏ, t&uacute;i x&aacute;ch, đồ decor, h&agrave;ng thủ c&ocirc;ng xuất khẩu.</p>\n		</li>\n	</ul>\n	</li>\n</ul>\n\n<p>&nbsp;</p>', 30, 1000000, 500000, 'Ninh Bình', 'b', 1, '2025-10-27', '2025-12-30', NULL),
(211, 'TOUR Đồng Xâm – Thái Bình', '33 ngày 32 đêm', '<p>Kh&aacute;m ph&aacute; Tours</p>\n\n<h2>1. <strong>L&agrave;ng nghề Chạm bạc Đồng X&acirc;m</strong> (Th&aacute;i B&igrave;nh)</h2>\n\n<ul>\n	<li>\n	<p><strong>Lịch sử &amp; văn h&oacute;a:</strong></p>\n\n	<ul>\n		<li>\n		<p>C&oacute; từ thế kỷ XVII, nổi tiếng với nghề chạm bạc tinh xảo, được coi l&agrave; &ldquo;kinh đ&ocirc; bạc&rdquo; của miền Bắc.</p>\n		</li>\n		<li>\n		<p>Được nh&agrave; Nguyễn chọn l&agrave;m nơi chế t&aacute;c đồ bạc cung đ&igrave;nh.</p>\n		</li>\n	</ul>\n	</li>\n	<li>\n	<p><strong>Đặc trưng:</strong></p>\n\n	<ul>\n		<li>\n		<p>Sản phẩm: đồ thờ bạc, đồ trang sức, tượng bạc, đồ gia dụng.</p>\n		</li>\n		<li>\n		<p>Họa tiết tinh tế: long &ndash; ly &ndash; quy &ndash; phượng, hoa văn d&acirc;n gian, phong cảnh.</p>\n		</li>\n		<li>\n		<p>Kỹ thuật khảm bạc tr&ecirc;n gỗ, đồng cũng rất đặc sắc.</p>\n		</li>\n	</ul>\n	</li>\n</ul>', 30, 1000000, 500000, 'Thái Bình', 'b', 1, '2025-11-27', '2025-12-30', NULL),
(212, 'Tour Non Nước – Đà Nẵng', '33 ngày 32 đêm', '<p>Kh&aacute;m ph&aacute; Tours</p>\n\n<h2>1. <strong>L&agrave;ng đ&aacute; mỹ nghệ Non Nước</strong> (Ngũ H&agrave;nh Sơn &ndash; Đ&agrave; Nẵng)</h2>\n\n<ul>\n	<li>\n	<p><strong>Lịch sử &amp; văn h&oacute;a:</strong></p>\n\n	<ul>\n		<li>\n		<p>H&igrave;nh th&agrave;nh từ thế kỷ XVII dưới triều L&ecirc;.</p>\n		</li>\n		<li>\n		<p>Nằm dưới ch&acirc;n n&uacute;i Ngũ H&agrave;nh Sơn, nơi c&oacute; nguồn đ&aacute; cẩm thạch phong ph&uacute;.</p>\n		</li>\n		<li>\n		<p>Nghề chế t&aacute;c đ&aacute; gắn liền với t&iacute;n ngưỡng, kiến tr&uacute;c ch&ugrave;a chiền v&agrave; lăng tẩm.</p>\n		</li>\n	</ul>\n	</li>\n	<li>\n	<p><strong>Đặc trưng:</strong></p>\n\n	<ul>\n		<li>\n		<p>T&aacute;c phẩm: tượng Phật, tượng Chăm, ph&ugrave; đi&ecirc;u, đồ mỹ nghệ.</p>\n		</li>\n		<li>\n		<p>Kỹ thuật chạm khắc tinh xảo, tạo h&igrave;nh sống động từ đ&aacute; cẩm thạch nhiều m&agrave;u.</p>\n		</li>\n	</ul>\n	</li>\n</ul>', 30, 1000000, 500000, 'Đà Nẵng', 't', 1, '2025-11-27', '2025-12-30', NULL),
(213, 'TOUR HÒA VANG - LIÊN CHIỂU (ĐÀ NĂNG)', '33 ngày 32 đêm', '<p>Kh&aacute;m ph&aacute; Tours</p>\n\n<h2>1. <strong>L&agrave;ng b&aacute;nh tr&aacute;ng T&uacute;y Loan</strong> (H&ograve;a Vang &ndash; Đ&agrave; Nẵng)</h2>\n\n<ul>\n	<li>\n	<p><strong>Lịch sử &amp; văn h&oacute;a:</strong></p>\n\n	<ul>\n		<li>\n		<p>C&oacute; từ hơn 500 năm, gắn liền với l&agrave;ng T&uacute;y Loan &ndash; ng&ocirc;i l&agrave;ng cổ của người Quảng.</p>\n		</li>\n		<li>\n		<p>B&aacute;nh tr&aacute;ng T&uacute;y Loan nổi tiếng trong ẩm thực miền Trung, đặc biệt dịp lễ Tết.</p>\n		</li>\n	</ul>\n	</li>\n	<li>\n	<p><strong>Đặc trưng:</strong></p>\n\n	<ul>\n		<li>\n		<p>L&agrave;m từ gạo ngon địa phương, trộn m&egrave;, tỏi, ti&ecirc;u.</p>\n		</li>\n		<li>\n		<p>B&aacute;nh tr&aacute;ng d&agrave;y, nướng l&ecirc;n gi&ograve;n, thơm.</p>\n		</li>\n	</ul>\n	</li>\n</ul>\n\n<h2>3. <strong>L&agrave;ng nước mắm Nam &Ocirc;</strong> (Li&ecirc;n Chiểu &ndash; Đ&agrave; Nẵng)</h2>\n\n<ul>\n	<li>\n	<p><strong>Lịch sử &amp; văn h&oacute;a:</strong></p>\n\n	<ul>\n		<li>\n		<p>Nghề l&agrave;m mắm c&oacute; từ hơn 400 năm.</p>\n		</li>\n		<li>\n		<p>Sản phẩm gắn liền với đời sống ngư d&acirc;n miền Trung.</p>\n		</li>\n		<li>\n		<p>Nam &Ocirc; nổi tiếng với c&aacute; cơm than &ndash; nguy&ecirc;n liệu l&agrave;m nước mắm ngon nhất.</p>\n		</li>\n	</ul>\n	</li>\n	<li>\n	<p><strong>Đặc trưng:</strong></p>\n\n	<ul>\n		<li>\n		<p>Nước mắm c&oacute; m&agrave;u c&aacute;nh gi&aacute;n, vị mặn m&ograve;i, thơm đặc trưng.</p>\n		</li>\n		<li>\n		<p>Qu&aacute; tr&igrave;nh ủ chượp k&eacute;o d&agrave;i từ 12&ndash;24 th&aacute;ng.</p>\n		</li>\n	</ul>\n	</li>\n</ul>\n\n<p>&nbsp;</p>', 30, 1000000, 500000, 'Đà Nẵng', 't', 1, '2025-11-27', '2025-12-30', NULL),
(214, 'TOUR Thanh Hà (Hội An – Quảng Nam)', '33 ngày 32 đêm', '<p>Kh&aacute;m ph&aacute; Tours</p>\n\n<h2>1. <strong>L&agrave;ng gốm Thanh H&agrave;</strong> (Hội An &ndash; Quảng Nam)</h2>\n\n<ul>\n	<li>\n	<p><strong>Lịch sử &amp; văn h&oacute;a:</strong></p>\n\n	<ul>\n		<li>\n		<p>C&oacute; từ thế kỷ XVI, gắn với thương cảng Hội An.</p>\n		</li>\n		<li>\n		<p>Gốm Thanh H&agrave; từng được bu&ocirc;n b&aacute;n khắp Việt Nam v&agrave; xuất khẩu sang Nhật Bản, Đ&ocirc;ng Nam &Aacute;.</p>\n		</li>\n	</ul>\n	</li>\n	<li>\n	<p><strong>Đặc trưng:</strong></p>\n\n	<ul>\n		<li>\n		<p>Sản phẩm: chum, vại, ấm ch&eacute;n, đồ trang tr&iacute;.</p>\n		</li>\n		<li>\n		<p>Gốm Thanh H&agrave; kh&ocirc;ng tr&aacute;ng men, nung bằng củi n&ecirc;n c&oacute; m&agrave;u đỏ đặc trưng.</p>\n		</li>\n	</ul>\n	</li>\n</ul>', 30, 1000000, 500000, 'Hội An', 't', 1, '2025-11-27', '2025-12-30', NULL),
(215, 'TOUR Kim Bồng (Hội An – Quảng Nam)', '33 ngày 32 đêm', '<p>Kh&aacute;m ph&aacute; Tours</p>\n\n<h2>1. <strong>L&agrave;ng mộc Kim Bồng</strong> (Hội An &ndash; Quảng Nam)</h2>\n\n<ul>\n	<li>\n	<p><strong>Lịch sử &amp; văn h&oacute;a:</strong></p>\n\n	<ul>\n		<li>\n		<p>Xuất hiện từ thế kỷ XV, gắn liền với kiến tr&uacute;c Hội An.</p>\n		</li>\n		<li>\n		<p>Thợ mộc Kim Bồng từng được mời ra kinh th&agrave;nh Huế x&acirc;y dựng cung đ&igrave;nh.</p>\n		</li>\n	</ul>\n	</li>\n	<li>\n	<p><strong>Đặc trưng:</strong></p>\n\n	<ul>\n		<li>\n		<p>Nghề chạm khắc gỗ, l&agrave;m thuyền, nh&agrave; cổ.</p>\n		</li>\n		<li>\n		<p>Sản phẩm: đồ nội thất, đi&ecirc;u khắc gỗ mỹ nghệ, thuyền gỗ.</p>\n		</li>\n	</ul>\n	</li>\n</ul>', 30, 1000000, 500000, 'Hội An', 't', 1, '2025-11-27', '2025-12-30', NULL),
(216, 'TOUR Thủy Xuân (TP. Huế)', '33 ngày 32 đêm', '<h2><strong>L&agrave;ng hương Thủy Xu&acirc;n</strong> (TP. Huế)</h2>\n\n<ul>\n	<li>\n	<p><strong>Lịch sử &amp; văn h&oacute;a:</strong></p>\n\n	<ul>\n		<li>\n		<p>Xuất hiện từ triều Nguyễn, chuy&ecirc;n l&agrave;m hương cung đ&igrave;nh.</p>\n		</li>\n		<li>\n		<p>L&agrave;ng nằm ngay ch&acirc;n đồi Vọng Cảnh, rất gần lăng vua.</p>\n		</li>\n	</ul>\n	</li>\n	<li>\n	<p><strong>Đặc trưng:</strong></p>\n\n	<ul>\n		<li>\n		<p>Hương nhiều m&agrave;u sắc (đỏ, xanh, t&iacute;m, v&agrave;ng).</p>\n		</li>\n		<li>\n		<p>Nguy&ecirc;n liệu tự nhi&ecirc;n: quế, hồi, trầm, sả.</p>\n		</li>\n	</ul>\n	</li>\n</ul>', 30, 1000000, 500000, 'TP.HUẾ', 't', 1, '2025-11-27', '2025-12-30', NULL),
(217, 'TOUR TÂY HỒ - TP HUẾ', '3 ngày 2 đêm', '<h2><strong>L&agrave;ng n&oacute;n l&aacute; T&acirc;y Hồ</strong> (Huế)</h2>\n\n<ul>\n	<li>\n	<p><strong>Lịch sử &amp; văn h&oacute;a:</strong></p>\n\n	<ul>\n		<li>\n		<p>Huế nổi tiếng với h&igrave;nh ảnh &ldquo;n&oacute;n b&agrave;i thơ&rdquo; &ndash; n&oacute;n l&aacute; c&oacute; kẹp b&agrave;i thơ b&ecirc;n trong.</p>\n		</li>\n		<li>\n		<p>N&oacute;n T&acirc;y Hồ l&agrave; nơi l&agrave;m ra những chiếc n&oacute;n tinh xảo nhất.</p>\n		</li>\n	</ul>\n	</li>\n	<li>\n	<p><strong>Đặc trưng:</strong></p>\n\n	<ul>\n		<li>\n		<p>Nguy&ecirc;n liệu: l&aacute; n&oacute;n, tre, chỉ trắng.</p>\n		</li>\n		<li>\n		<p>Đặc biệt: n&oacute;n b&agrave;i thơ khi soi nắng hiện l&ecirc;n h&igrave;nh ảnh hoa văn hoặc c&acirc;u thơ.</p>\n		</li>\n	</ul>\n	</li>\n</ul>', 30, 1000000, 500000, 'TP.HUẾ', 't', 1, '2025-12-27', '2025-12-30', NULL),
(218, 'TOUR TÂY NINH', '2 ngày 1 đêm', '<h2><strong>L&agrave;ng b&aacute;nh tr&aacute;ng phơi sương &ndash; Muối ớt T&acirc;y Ninh</strong></h2>\n\n<ul>\n	<li>\n	<p><strong>B&aacute;nh tr&aacute;ng phơi sương Trảng B&agrave;ng</strong> ra đời hơn 100 năm trước, l&agrave; sự s&aacute;ng tạo của người d&acirc;n v&ugrave;ng bi&ecirc;n trong việc bảo quản b&aacute;nh tr&aacute;ng mềm, dẻo, dễ cuốn.</p>\n	</li>\n	<li>\n	<p>Qu&aacute; tr&igrave;nh &ldquo;phơi sương&rdquo; gi&uacute;p b&aacute;nh thấm hơi ẩm ban đ&ecirc;m, mang lại hương vị tự nhi&ecirc;n, đặc trưng.</p>\n	</li>\n	<li>\n	<p>Nghề l&agrave;m b&aacute;nh tr&aacute;ng gắn liền với ẩm thực T&acirc;y Ninh &ndash; đặc biệt l&agrave; m&oacute;n <strong>b&aacute;nh tr&aacute;ng cuốn thịt heo rau rừng</strong>.</p>\n	</li>\n	<li>\n	<p><strong>Muối ớt T&acirc;y Ninh</strong> lại l&agrave; sự kết hợp kh&eacute;o l&eacute;o giữa muối hột, ớt tươi, tỏi, v&agrave; b&iacute; quyết rang thủ c&ocirc;ng &ndash; trở th&agrave;nh đặc sản nổi tiếng khắp cả nước.</p>\n	</li>\n	<li>\n	<p>Hai nghề n&agrave;y thể hiện tinh thần s&aacute;ng tạo, giản dị v&agrave; đậm đ&agrave; bản sắc ẩm thực Nam Bộ.</p>\n	</li>\n</ul>', 20, 1000000, 500000, 'TÂY NINH', 'n', 1, '2025-12-27', '2025-12-29', NULL),
(219, 'TOUR BẾN TRE', '2 ngày 1 đêm', '<h2><strong>1. L&agrave;ng kẹo dừa Bến Tre</strong></h2>\n\n<ul>\n	<li>\n	<p>Nghề l&agrave;m kẹo dừa xuất hiện v&agrave;o đầu thế kỷ XX, do một số hộ d&acirc;n tại x&atilde; Sơn Đốc v&agrave; Mỏ C&agrave;y khởi xướng.</p>\n	</li>\n	<li>\n	<p>Ban đầu, kẹo dừa chỉ được l&agrave;m v&agrave;o dịp Tết, nhưng dần trở th&agrave;nh sản phẩm đặc trưng của Bến Tre &ndash; &ldquo;xứ dừa&rdquo;.</p>\n	</li>\n	<li>\n	<p>Nguy&ecirc;n liệu ch&iacute;nh l&agrave; dừa xi&ecirc;m, đường, mạch nha &ndash; biểu tượng cho sự giản dị, thuần khiết.</p>\n	</li>\n	<li>\n	<p>Từ nghề thủ c&ocirc;ng nhỏ, nay kẹo dừa đ&atilde; trở th&agrave;nh ng&agrave;nh nghề truyền thống mang t&iacute;nh kinh tế cao, xuất khẩu ra hơn 40 quốc gia.</p>\n	</li>\n	<li>\n	<p>Nghề l&agrave;m kẹo dừa thể hiện tinh thần cần c&ugrave;, s&aacute;ng tạo v&agrave; kh&eacute;o l&eacute;o của người d&acirc;n Nam Bộ.</p>\n	</li>\n</ul>\n\n<h2><strong>2. L&agrave;ng b&aacute;nh tr&aacute;ng Mỹ Lồng &amp; b&aacute;nh phồng Sơn Đốc &ndash; Bến Tre</strong></h2>\n\n<ul>\n	<li>\n	<p>Hai l&agrave;ng nghề n&agrave;y đ&atilde; tồn tại hơn 100 năm, nằm liền kề nhau tại huyện Giồng Tr&ocirc;m &ndash; Bến Tre.</p>\n	</li>\n	<li>\n	<p><strong>B&aacute;nh tr&aacute;ng Mỹ Lồng</strong> c&oacute; nguồn gốc từ nghề truyền thống của người Việt di cư từ miền Trung v&agrave;o Nam, sử dụng gạo địa phương v&agrave; m&egrave; để tạo hương vị ri&ecirc;ng.</p>\n	</li>\n	<li>\n	<p><strong>B&aacute;nh phồng Sơn Đốc</strong> được xem l&agrave; m&oacute;n ăn biểu tượng của ng&agrave;y Tết miền T&acirc;y, mềm, xốp v&agrave; thơm b&eacute;o.</p>\n	</li>\n	<li>\n	<p>Cả hai nghề đều gắn liền với văn h&oacute;a lễ hội, sum vầy của người d&acirc;n Nam Bộ.</p>\n	</li>\n	<li>\n	<p>Đến nay, sản phẩm đ&atilde; được c&ocirc;ng nhận l&agrave; <strong>di sản văn h&oacute;a phi vật thể cấp quốc gia (năm 2017)</strong>.</p>\n	</li>\n</ul>\n\n<p>&nbsp;</p>', 30, 1000000, 500000, 'BẾN TRE', 'n', 1, '2025-12-27', '2025-12-29', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE `tbl_users` (
  `userId` int(11) NOT NULL,
  `google_id` varchar(50) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `phoneNumber` varchar(15) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `ipAdress` varchar(50) DEFAULT NULL,
  `isActive` enum('y','n') NOT NULL DEFAULT 'n' COMMENT 'y: yes\r\nn: no',
  `status` enum('d','b') DEFAULT NULL COMMENT 'd: deleted\r\nb: baned',
  `createdDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `activation_token` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`userId`, `google_id`, `fullName`, `username`, `password`, `email`, `avatar`, `phoneNumber`, `address`, `ipAdress`, `isActive`, `status`, `createdDate`, `updatedDate`, `activation_token`) VALUES
(29, NULL, 'Đạt Huy Trần', 'dathuyaa', 'e10adc3949ba59abbe56e057f20f883e', 'huyuy1682@gmail.com', NULL, '94219276', 'đà nẵng', NULL, 'n', NULL, '2025-09-27 16:10:50', '2025-09-27 16:10:50', 'qPIMLWTNeIzrQhOApaCxhBxRef8m6mHwdweJJ54B2th0HqMRhcr71eT1WCjk'),
(30, NULL, NULL, 'dathuy1', '25f9e794323b453885f5181f1b624d0b', 'huyuy16820@gmail.com', NULL, NULL, NULL, NULL, 'n', NULL, '2025-09-27 16:17:03', '2025-09-27 16:17:03', '9iVBp4TMe2CyPgNMx4ttW7dpmee7yXmmSvlGrNd1Ikm9EEcoVIkRrg9PBAUr'),
(31, NULL, NULL, 'dathuy12', 'e10adc3949ba59abbe56e057f20f883e', 'huyuy16822@gmail.com', NULL, NULL, NULL, NULL, 'n', NULL, '2025-10-08 06:03:46', '2025-10-08 06:03:46', 'Hg8I3d2HnTK6w6R9pJNOHgx4iSs4gfJ03iQ0dRoI9MfA35K3TLIDjOomHDSP'),
(32, NULL, NULL, 'dathuy11231', 'e10adc3949ba59abbe56e057f20f883e', 'huyuy168123122@gmail.com', NULL, NULL, NULL, NULL, 'n', NULL, '2025-10-08 06:04:31', '2025-10-08 06:04:31', 'MZ82aYCSXBovd44g4VB5DDFHiY2W8902LfKtmV0Q3q35JzFl0PwB5TySrJQJ');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`adminId`);

--
-- Indexes for table `tbl_ai_chats`
--
ALTER TABLE `tbl_ai_chats`
  ADD PRIMARY KEY (`chatId`);

--
-- Indexes for table `tbl_booking`
--
ALTER TABLE `tbl_booking`
  ADD PRIMARY KEY (`bookingId`),
  ADD KEY `fk_booking_tour` (`tourId`);

--
-- Indexes for table `tbl_chat`
--
ALTER TABLE `tbl_chat`
  ADD PRIMARY KEY (`chatId`),
  ADD KEY `fk_chat_user` (`userId`),
  ADD KEY `fk_chat_admin` (`adminId`);

--
-- Indexes for table `tbl_checkout`
--
ALTER TABLE `tbl_checkout`
  ADD PRIMARY KEY (`checkoutId`),
  ADD KEY `fk_checkout_booking` (`bookingId`);

--
-- Indexes for table `tbl_contact`
--
ALTER TABLE `tbl_contact`
  ADD PRIMARY KEY (`contactId`);

--
-- Indexes for table `tbl_history`
--
ALTER TABLE `tbl_history`
  ADD PRIMARY KEY (`historyId`),
  ADD KEY `fk_history_user` (`userId`),
  ADD KEY `fk_history_tour` (`tourId`);

--
-- Indexes for table `tbl_images`
--
ALTER TABLE `tbl_images`
  ADD PRIMARY KEY (`imageId`),
  ADD KEY `fk_image_tour` (`tourId`);

--
-- Indexes for table `tbl_invoice`
--
ALTER TABLE `tbl_invoice`
  ADD PRIMARY KEY (`invoiceId`),
  ADD KEY `fk_invoice_booking` (`bookingId`);

--
-- Indexes for table `tbl_promotion`
--
ALTER TABLE `tbl_promotion`
  ADD PRIMARY KEY (`promotionId`);

--
-- Indexes for table `tbl_reviews`
--
ALTER TABLE `tbl_reviews`
  ADD PRIMARY KEY (`reviewId`),
  ADD KEY `fk_review_user` (`userId`),
  ADD KEY `fk_review_tour` (`tourId`);

--
-- Indexes for table `tbl_temp_images`
--
ALTER TABLE `tbl_temp_images`
  ADD PRIMARY KEY (`imageTempId`);

--
-- Indexes for table `tbl_timeline`
--
ALTER TABLE `tbl_timeline`
  ADD PRIMARY KEY (`timeLineId`),
  ADD KEY `fk_tour` (`tourId`);

--
-- Indexes for table `tbl_tours`
--
ALTER TABLE `tbl_tours`
  ADD PRIMARY KEY (`tourId`);

--
-- Indexes for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`userId`);

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
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `adminId` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_ai_chats`
--
ALTER TABLE `tbl_ai_chats`
  MODIFY `chatId` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_booking`
--
ALTER TABLE `tbl_booking`
  MODIFY `bookingId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `tbl_chat`
--
ALTER TABLE `tbl_chat`
  MODIFY `chatId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_checkout`
--
ALTER TABLE `tbl_checkout`
  MODIFY `checkoutId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `tbl_contact`
--
ALTER TABLE `tbl_contact`
  MODIFY `contactId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_history`
--
ALTER TABLE `tbl_history`
  MODIFY `historyId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_images`
--
ALTER TABLE `tbl_images`
  MODIFY `imageId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=403;

--
-- AUTO_INCREMENT for table `tbl_invoice`
--
ALTER TABLE `tbl_invoice`
  MODIFY `invoiceId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_promotion`
--
ALTER TABLE `tbl_promotion`
  MODIFY `promotionId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_reviews`
--
ALTER TABLE `tbl_reviews`
  MODIFY `reviewId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `tbl_temp_images`
--
ALTER TABLE `tbl_temp_images`
  MODIFY `imageTempId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `tbl_timeline`
--
ALTER TABLE `tbl_timeline`
  MODIFY `timeLineId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=153;

--
-- AUTO_INCREMENT for table `tbl_tours`
--
ALTER TABLE `tbl_tours`
  MODIFY `tourId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=220;

--
-- AUTO_INCREMENT for table `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_booking`
--
ALTER TABLE `tbl_booking`
  ADD CONSTRAINT `fk_booking_tour` FOREIGN KEY (`tourId`) REFERENCES `tbl_tours` (`tourId`);

--
-- Constraints for table `tbl_chat`
--
ALTER TABLE `tbl_chat`
  ADD CONSTRAINT `fk_chat_admin` FOREIGN KEY (`adminId`) REFERENCES `tbl_admin` (`adminId`),
  ADD CONSTRAINT `fk_chat_user` FOREIGN KEY (`userId`) REFERENCES `tbl_users` (`userId`);

--
-- Constraints for table `tbl_checkout`
--
ALTER TABLE `tbl_checkout`
  ADD CONSTRAINT `fk_checkout_booking` FOREIGN KEY (`bookingId`) REFERENCES `tbl_booking` (`bookingId`);

--
-- Constraints for table `tbl_history`
--
ALTER TABLE `tbl_history`
  ADD CONSTRAINT `fk_history_tour` FOREIGN KEY (`tourId`) REFERENCES `tbl_tours` (`tourId`),
  ADD CONSTRAINT `fk_history_user` FOREIGN KEY (`userId`) REFERENCES `tbl_users` (`userId`);

--
-- Constraints for table `tbl_images`
--
ALTER TABLE `tbl_images`
  ADD CONSTRAINT `fk_image_tour` FOREIGN KEY (`tourId`) REFERENCES `tbl_tours` (`tourId`);

--
-- Constraints for table `tbl_invoice`
--
ALTER TABLE `tbl_invoice`
  ADD CONSTRAINT `fk_invoice_booking` FOREIGN KEY (`bookingId`) REFERENCES `tbl_booking` (`bookingId`);

--
-- Constraints for table `tbl_reviews`
--
ALTER TABLE `tbl_reviews`
  ADD CONSTRAINT `fk_review_tour` FOREIGN KEY (`tourId`) REFERENCES `tbl_tours` (`tourId`),
  ADD CONSTRAINT `fk_review_user` FOREIGN KEY (`userId`) REFERENCES `tbl_users` (`userId`);

--
-- Constraints for table `tbl_timeline`
--
ALTER TABLE `tbl_timeline`
  ADD CONSTRAINT `fk_tour` FOREIGN KEY (`tourId`) REFERENCES `tbl_tours` (`tourId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
