-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 20, 2026 at 11:48 AM
-- Server version: 11.4.10-MariaDB
-- PHP Version: 8.4.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `easyailo_quikborrow`
--

-- --------------------------------------------------------

--
-- Table structure for table `administrations`
--

CREATE TABLE `administrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `rec_date` datetime NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `dob` date DEFAULT NULL,
  `mobile` varchar(255) NOT NULL,
  `emailid` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `staff_code` varchar(99) DEFAULT NULL,
  `position` varchar(299) DEFAULT NULL,
  `role` int(11) NOT NULL DEFAULT 1 COMMENT '0=Admin,1=OfficeStaff, 2=Hire-Support-Staff,3=ItStaff,4=Accounting, 5=Self-Support-Staff, 7=Assistant-Support-Staff\r\n',
  `isActive` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0 = No, 1 = Yes',
  `isDelete` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 = No, 1 = Yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `administrations`
--

INSERT INTO `administrations` (`id`, `rec_date`, `fullname`, `dob`, `mobile`, `emailid`, `password`, `staff_code`, `position`, `role`, `isActive`, `isDelete`) VALUES
(1, '2023-10-12 05:03:22', 'Verloop Web', NULL, '9408881214', 'info@verloopweb.com', '$2y$12$AtHPRdt423jA6LZ5N6HlDOrt1KsygyAhbAHnlbP9ePRV.0a2eFhGe', NULL, NULL, 6, 1, 0),
(2, '2026-03-11 10:10:09', 'Admin', NULL, '9983933307', 'info@quikborrow.com', '$2y$12$ae7HMdoOu6ZigC8qVfZ6qumvdACgxKUixxZVs5O2mtspDf/7elgc6', '7130', NULL, 0, 1, 0),
(3, '2026-03-30 16:52:55', 'Self Apply Staff', NULL, '9983933307', 'staff@quikborrow.com', '$2y$12$kJerJ5pyEJKy4ujqaFWze.LGJw9U956aHGun826WSf56GolvGCj1e', '3721', NULL, 5, 1, 0),
(4, '2026-03-30 16:54:17', 'Loan Agent Staff', NULL, '9983933307', 'support@quikborrow.com', '$2y$12$vahFz2qTqgrGozEmpSktt.6NZwkICwh5Ou7E7BAZ0XszkPCbZHX3G', '1984', NULL, 2, 1, 0),
(5, '2026-04-20 14:29:06', 'indiakarobar', NULL, '9998841926', 'admin@indiakarobar.com', '$2y$12$oDZH3efFN/eRKd7EaAYMWuaai8Sd29qsOyNNukqANBBodYg9lAIYa', '7920', NULL, 0, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `adscontent`
--

CREATE TABLE `adscontent` (
  `id` int(11) NOT NULL,
  `rec_date` datetime NOT NULL DEFAULT current_timestamp(),
  `ad_type` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1=text, 2=image',
  `ad_content` longtext NOT NULL,
  `isDelete` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=no, 1=yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `adscontent`
--

INSERT INTO `adscontent` (`id`, `rec_date`, `ad_type`, `ad_content`, `isDelete`) VALUES
(1, '2025-03-01 19:12:31', 1, '<p>&nbsp;</p>\r\n\r\n<div id=\"gtx-trans\" style=\"left:-173px; position:absolute; top:-6px\">\r\n<div class=\"gtx-trans-icon\">&nbsp;</div>\r\n</div>', 0),
(3, '2025-03-01 19:18:03', 1, '<p>hello</p>', 0),
(4, '2025-03-01 19:28:20', 2, '1740837532.png', 0);

-- --------------------------------------------------------

--
-- Table structure for table `airpay_entry`
--

CREATE TABLE `airpay_entry` (
  `id` int(11) NOT NULL,
  `rec_date` datetime NOT NULL DEFAULT current_timestamp(),
  `entryfor` int(11) NOT NULL DEFAULT 0 COMMENT '1=Customer, 2=Channel, 11=Digital PL, 12=Digital BL',
  `userid` int(11) NOT NULL,
  `orderid` varchar(50) NOT NULL,
  `orderamount` float(11,2) NOT NULL,
  `ordernote` varchar(256) DEFAULT NULL,
  `statuscode` varchar(256) DEFAULT NULL,
  `transactionid` varchar(256) DEFAULT NULL,
  `paymentmode` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `aisensy_settings`
--

CREATE TABLE `aisensy_settings` (
  `id` int(11) NOT NULL,
  `rec_date` datetime NOT NULL DEFAULT current_timestamp(),
  `product` varchar(55) NOT NULL COMMENT 'SA, LA, LAT',
  `type` varchar(99) NOT NULL COMMENT 'remarketing, buy now, pgsuccess, pgfailed',
  `api_key` longtext NOT NULL,
  `campaign_name` varchar(99) NOT NULL,
  `media_url` varchar(255) NOT NULL,
  `media_filename` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `aisensy_settings`
--

INSERT INTO `aisensy_settings` (`id`, `rec_date`, `product`, `type`, `api_key`, `campaign_name`, `media_url`, `media_filename`) VALUES
(1, '2025-08-19 18:13:52', 'SA', 'remarketing', '#', '#', '#', '#'),
(2, '2025-08-19 18:13:52', 'LA', 'remarketing', '#', '#', '#', '#'),
(3, '2025-08-19 18:15:10', 'LAT', 'remarketing', '#', '#', '#', '#'),
(4, '2025-08-19 19:21:03', 'LA', 'getoffer', '#', '#', '#', '#'),
(5, '2025-08-19 19:34:15', 'LAT', 'getoffer', '#', '#', '#', '#');

-- --------------------------------------------------------

--
-- Table structure for table `application_remarks`
--

CREATE TABLE `application_remarks` (
  `id` int(11) NOT NULL,
  `rec_date` datetime NOT NULL DEFAULT current_timestamp(),
  `entry_at` datetime DEFAULT NULL,
  `service` tinyint(4) DEFAULT NULL,
  `subject` varchar(256) NOT NULL,
  `notes` longtext DEFAULT NULL,
  `application_id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `application_remarks`
--

INSERT INTO `application_remarks` (`id`, `rec_date`, `entry_at`, `service`, `subject`, `notes`, `application_id`, `staff_id`) VALUES
(1, '2026-03-27 15:35:59', '2026-03-27 15:35:59', 5, '9', '', 4, 5),
(2, '2026-03-27 15:41:58', '2026-03-27 15:41:58', 5, '9', '', 5, 5),
(3, '2026-03-27 16:31:09', '2026-03-27 16:31:09', 5, '9', '', 6, 5),
(4, '2026-03-27 16:42:29', '2026-03-27 16:42:29', 5, '9', '', 7, 5),
(5, '2026-03-27 16:50:51', '2026-03-27 16:50:51', 5, '9', '', 8, 5),
(6, '2026-03-27 17:02:08', '2026-03-27 17:02:08', 5, '9', '', 9, 5),
(7, '2026-03-27 17:23:35', '2026-03-27 17:23:35', 5, '9', '', 10, 5),
(8, '2026-03-28 11:57:56', '2026-03-28 11:57:56', 5, '9', '', 11, 5),
(9, '2026-03-28 17:42:04', '2026-03-28 17:42:04', 5, '9', '', 12, 5),
(10, '2026-03-31 11:40:53', '2026-03-31 11:40:53', 5, '9', '', 14, 5),
(11, '2026-04-02 17:50:02', '2026-04-02 17:50:02', 5, '9', '', 18, 5),
(12, '2026-04-07 12:04:06', '2026-04-07 12:04:06', 5, '9', '', 20, 5),
(13, '2026-04-07 12:53:30', '2026-04-07 12:53:30', 5, '9', '', 1, 5),
(14, '2026-04-07 12:52:38', '2026-04-07 12:52:38', 5, '9', '', 23, 5),
(15, '2026-04-08 16:34:13', '2026-04-08 16:34:13', 5, '9', '', 24, 5),
(16, '2026-04-13 15:09:02', '2026-04-13 15:09:02', 5, '9', '', 28, 5),
(17, '2026-04-15 14:26:42', '2026-04-15 14:26:42', 5, '9', '', 31, 5),
(18, '2026-04-15 15:51:47', '2026-04-15 15:51:47', 5, '9', '', 34, 5),
(19, '2026-04-16 11:46:46', '2026-04-16 11:46:46', 5, '9', '', 36, 5),
(20, '2026-04-17 13:27:11', '2026-04-17 13:27:11', 5, '9', '', 38, 3),
(21, '2026-04-18 12:39:09', '2026-04-18 12:39:09', 5, '9', '', 40, 3),
(22, '2026-04-18 12:44:17', '2026-04-18 12:44:17', 5, '9', '', 41, 3),
(23, '2026-04-20 15:56:50', '2026-04-20 15:56:50', 5, '9', '', 43, 3);

-- --------------------------------------------------------

--
-- Table structure for table `applylink_criteria`
--

CREATE TABLE `applylink_criteria` (
  `id` int(11) NOT NULL,
  `applylink_id` int(11) NOT NULL,
  `criteria_id` int(11) NOT NULL,
  `rec_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bankapplylink`
--

CREATE TABLE `bankapplylink` (
  `id` int(11) NOT NULL,
  `rec_date` datetime NOT NULL DEFAULT current_timestamp(),
  `bankid` int(11) NOT NULL,
  `roi` float(10,2) DEFAULT NULL,
  `tenures` tinyint(4) DEFAULT NULL,
  `status_type` int(11) DEFAULT NULL,
  `option1` varchar(599) DEFAULT NULL,
  `option2` varchar(599) DEFAULT NULL,
  `option3` varchar(599) DEFAULT NULL,
  `option4` varchar(599) DEFAULT NULL,
  `option5` varchar(599) DEFAULT NULL,
  `title` varchar(256) NOT NULL,
  `applyurl` varchar(256) NOT NULL,
  `is_recommended` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=false,1=true',
  `isDelete` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=No, 1=Yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `bankapplylink`
--

INSERT INTO `bankapplylink` (`id`, `rec_date`, `bankid`, `roi`, `tenures`, `status_type`, `option1`, `option2`, `option3`, `option4`, `option5`, `title`, `applyurl`, `is_recommended`, `isDelete`) VALUES
(1, '2025-05-01 20:23:29', 17, 10.50, 60, NULL, '100% Online Process', 'Low EMI Options', 'Min. Paperwork', NULL, NULL, 'Your Pre-Approved Loan Offer | Quick Process', 'https://www.cholamandalam.com/get-consumer-small-enterprise-loans', 0, 1),
(2, '2025-05-01 20:37:10', 15, 11.00, 60, NULL, '100% Online Process', 'Convenient EMI Options', 'Min. Documentation', NULL, NULL, 'You\'re Eligible For Pre-Approved Offer | Easy Application', 'https://www.dealsofloan.com/personal-loan', 0, 1),
(3, '2025-05-01 20:41:21', 18, 11.50, 60, NULL, '100% Online Process', 'Low EMI Options', 'Min. Paperwork', NULL, NULL, 'Your Profile Matches The Criteria | Easy Digital Process', 'https://www.mymudra.com/loan/personal-loan', 0, 1),
(4, '2025-05-01 21:18:20', 13, 10.50, 60, NULL, '100% Online Process', 'Low EMI Options', 'Min. Paperwork', NULL, NULL, 'Your Pre-Approved Loan Offer | Digital Process', 'https://pq.faircent.com/', 0, 1),
(5, '2025-05-03 15:52:03', 20, 11.00, 48, NULL, '100% Online Process', 'Convenient EMI Options', 'Min. Documentation', NULL, NULL, 'Your Criteria Matched For Pre-Approved Loan Offer | Quick Process', 'https://www.herofincorp.com/personal-loans', 0, 1),
(6, '2025-05-03 15:55:27', 36, 11.50, 48, NULL, '100% Digital Process', 'Low EMI Options', 'Min. Paperwork', NULL, NULL, 'Your Criteria Matched For Pre-Approved Loan Offer | Quick Process', 'https://www.piramalfinance.com/loan', 0, 1),
(7, '2025-05-03 15:57:46', 38, 10.50, 60, NULL, 'Simple Online Process', 'Low EMI Options', 'Min. Documentation', NULL, NULL, 'Your Eligibility Matches The Criteria | Instant Process', 'https://www.incred.com/personal-loan/', 0, 0),
(8, '2025-05-03 16:01:29', 21, 11.50, 36, NULL, '100% Digital Process', 'Convenient EMI Options', 'Min. Paperwork', NULL, NULL, 'Your Eligibility Matches The Criteria | Instant Process', 'https://maximus.axisbank.co.in/external/customer/login?product=personal', 0, 1),
(9, '2025-05-03 16:04:55', 22, 11.00, 60, NULL, '100% Online Process', 'Convenient EMI Options', 'Min. Paperwork', NULL, NULL, 'You’re Eligible For Pre-Approved Loan Offer | Simple Process', 'https://www.bajajfinserv.in/personal-loan', 0, 1),
(10, '2025-05-03 16:08:34', 37, 10.50, 48, NULL, 'Simple Online Process', 'Convenient EMI Options', 'Min. Documentation', NULL, NULL, 'Your Pre-Approved Loan Offer | Quick Process', 'https://www.ujjivansfb.in/individual-loans?type=Personal-Individual-Loan', 0, 1),
(11, '2025-05-03 16:10:24', 23, 11.50, 60, NULL, '100% Digital Process', 'Low EMI Options', 'Min. Documentation', NULL, NULL, 'Your Eligibility Matches The Criteria | Instant Process', 'https://onlineapply.sbi.co.in/personal-banking/personal-loan', 0, 1),
(12, '2025-05-03 16:15:21', 24, 10.50, 48, NULL, '100% Digital Process', 'Low EMI Options', 'Min. Documentation', NULL, NULL, 'You’re Eligible For Pre-Approved Loan Offer | Simple Process', 'https://www.idbibank.in/personal-loan.aspx', 0, 1),
(13, '2025-05-03 16:23:55', 13, 11.00, 60, NULL, '100% Digital Process', 'Convenient EMI Options', 'Min. Paperwork', NULL, NULL, 'Your Criteria Matched For Pre-Approved Loan Offer | Quick Process', 'https://pq.faircent.com/', 0, 1),
(14, '2025-05-03 16:26:05', 14, 10.50, 60, NULL, '100% Digital Process', 'Convenient EMI Options', 'Min. Documentation', NULL, NULL, 'Your Eligibility Matches The Criteria | Instant Process', 'https://apply.finnable.com/login', 0, 1),
(15, '2025-05-03 16:31:00', 27, 10.00, 60, NULL, '100% Digital Process', 'Convenient EMI Options', 'Min. Paperwork', NULL, NULL, 'You’re Eligible For Pre-Approved Loan Offer | Simple Process', 'https://www.lendingkart.com/business-loan/check-eligibility', 0, 1),
(16, '2025-05-03 17:04:30', 11, 10.50, 60, NULL, '100% Digital Process', 'Convenient EMI Options', 'Min. Paperwork', NULL, NULL, 'Your Eligibility Matches The Criteria | Instant Process', 'https://partner.werize.com/MyBusiness/KREDBAZ%20SERVICE%20INDIA%20PRIVATE%20LIMITED/d2266f89-d2b0-4956-ba75-e95eca9cd08a', 1, 0),
(17, '2025-05-03 17:13:29', 28, 11.50, 48, NULL, '100% Digital Process', 'Convenient EMI Options', 'Min. Paperwork', NULL, NULL, 'Your Criteria Matched For Pre-Approved Loan Offer | Quick Process', 'https://app.upwards.in/login', 0, 1),
(18, '2025-05-03 17:15:19', 29, 11.00, 36, NULL, 'Simple Online Process', 'Low EMI Options', 'Min. Paperwork', NULL, NULL, 'You’re Eligible For Pre-Approved Loan Offer | Simple Process', 'https://moneyview.in/personal-loan', 0, 0),
(19, '2025-05-03 17:17:31', 39, 11.50, 48, NULL, 'Simple Online Process', 'Convenient EMI Options', 'Min. Paperwork', NULL, NULL, 'Your Eligibility Matches The Criteria | Instant Process', 'https://www.smfgindiacredit.com/personal-loan.aspx', 0, 1),
(20, '2025-05-03 17:19:02', 40, 10.50, 60, NULL, '100% Digital Process', 'Low EMI Options', 'Min. Paperwork', NULL, NULL, 'Your Eligibility Matches The Criteria | Instant Process', 'https://www.fibe.in/personal-loan/', 0, 0),
(21, '2025-05-03 17:23:18', 30, 11.50, 60, NULL, '100% Digital Process', 'Low EMI Options', 'Min. Paperwork', NULL, NULL, 'Your Eligibility Matches The Criteria | Instant Process', 'https://induseasycredit.indusind.com/customer/personal-loan/new-lead', 0, 1),
(22, '2025-05-03 17:27:31', 31, 10.50, 60, NULL, '100% Digital Process', 'Low EMI Options', 'Min. Documentation', NULL, NULL, 'Your Pre-Approved Loan Offer | Quick Process', 'https://v.hdfcbank.com/personal-business-loan.html', 0, 1),
(23, '2025-05-03 17:29:46', 32, 11.50, 48, NULL, 'Simple Online Process', 'Low EMI Options', 'Min. Documentation', NULL, NULL, 'Your Eligibility Matches The Criteria | Instant Process', 'https://www.tatacapital.com/online/loans/personal-loans/apply-now-personal-loan', 0, 1),
(24, '2025-05-03 17:32:08', 33, 10.50, 60, NULL, '100% Digital Process', 'Low EMI Options', 'Min. Documentation', NULL, NULL, 'Your Eligibility Matches The Criteria | Instant Process', 'https://finance.adityabirlacapital.com/personal-finance/personal-loan', 0, 1),
(25, '2025-05-03 17:34:11', 41, 11.50, 48, NULL, '100% Digital Process', 'Convenient EMI Options', 'Min. Documentation', NULL, NULL, 'Your Pre-Approved Loan Offer | Quick Process', 'https://personalloan.federalbank.co.in/', 0, 1),
(26, '2025-05-03 17:42:28', 34, 11.00, 48, NULL, '100% Digital Process', 'Convenient EMI Options', 'Min. Documentation', NULL, NULL, 'You’re Eligible For Pre-Approved Loan Offer | Simple Process', 'https://www.icicibank.com/personal-banking/loans/personal-loan', 0, 1),
(27, '2025-05-03 17:44:15', 42, 10.50, 48, NULL, 'Simple Online Process', 'Low EMI Options', 'Min. Documentation', NULL, NULL, 'Your Criteria Matched For Pre-Approved Loan Offer | Quick Process', 'https://poonawallafincorp.com/personal-loan/apply-for-loan', 0, 1),
(28, '2025-05-03 17:52:25', 35, 10.50, 60, NULL, '100% Online Process', 'Low EMI Options', 'Min. Documentation', NULL, NULL, 'Your Eligibility Matches The Criteria | Instant Process', 'https://www.yesbank.in/personal-banking/loans/personal-loan', 0, 1),
(29, '2025-06-05 12:49:55', 8, 10.50, 60, NULL, '100% Online Process', 'Convenient EMI Options', 'Min. Paperwork', NULL, NULL, 'You\'re Eligible For Pre-Approved Loan Offer | Quick Process', 'https://www.prefr.com/personal-loan', 1, 0),
(30, '2025-06-07 20:56:34', 45, 10.50, 60, NULL, '100% Digital Process', 'Low EMI Options', 'Min. Paperwork', NULL, NULL, 'You\'re Eligible For Pre-Approved Loan Offer | Simple Process', 'https://web.moneytap.com/', 0, 0),
(31, '2025-06-07 20:58:24', 46, 11.00, 48, NULL, '100% Online Process', 'Low EMI Options', 'Min. Documentation', NULL, NULL, 'Your Eligibility Matches The Criteria | Instant Process', 'https://applyonline.ramfincorp.com/', 0, 0),
(32, '2025-06-28 16:05:55', 13, 10.50, 60, NULL, '100% Online Process', 'Convenient EMI Options', 'Min. Paperwork', NULL, NULL, 'Your Eligibility Matches The Criteria | Easy & Quick Process', 'https://in.faircentpro.com/?utm_source=wl&utm_medium=Mailer&campaign_name=Borrower_Partner&agf=WLA113767', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `banks`
--

CREATE TABLE `banks` (
  `id` int(11) NOT NULL,
  `rec_date` datetime NOT NULL DEFAULT current_timestamp(),
  `bank_name` varchar(100) NOT NULL,
  `bank_image` varchar(255) NOT NULL,
  `order_no` int(11) NOT NULL DEFAULT 0,
  `isActive` int(11) NOT NULL DEFAULT 1,
  `isDelete` int(11) NOT NULL DEFAULT 0 COMMENT '0=No, 1=Yes'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `banks`
--

INSERT INTO `banks` (`id`, `rec_date`, `bank_name`, `bank_image`, `order_no`, `isActive`, `isDelete`) VALUES
(1, '2025-03-30 16:20:24', 'Moneyview', '1706270037.png', 1, 0, 1),
(2, '2024-01-26 09:47:04', 'Cashe', '1706262434.png', 2, 0, 0),
(4, '2024-06-17 10:30:11', 'prayosha', '1718600399.png', 0, 0, 1),
(5, '2024-06-27 18:13:13', 'sef', '1719492202.jpg', 0, 1, 1),
(6, '2025-01-07 14:33:41', 'InvestKraft', '1736240636.jpg', 3, 1, 1),
(7, '2025-01-07 14:34:23', 'InvestKraft', '1736240673.jpg', 3, 1, 1),
(8, '2025-02-04 13:03:49', 'Prfer', '1738654938.png', 0, 1, 0),
(9, '2025-02-04 13:03:49', 'Prfer', '1738654938.png', 0, 1, 1),
(10, '2025-02-04 13:03:49', 'Prfer', '1738654938.png', 0, 1, 1),
(11, '2025-05-02 12:46:54', 'Werize', '1746170219.png', 0, 1, 0),
(12, '2025-02-04 13:14:07', 'Fibe', '1738655067.png', 0, 0, 0),
(13, '2025-05-02 12:46:14', 'Faircent', '1746170179.png', 0, 1, 0),
(14, '2025-02-04 13:15:16', 'Finnable', '1738655142.png', 0, 1, 0),
(15, '2025-05-02 12:46:01', 'Deals Of Loan', '1746170165.png', 0, 0, 1),
(16, '2025-05-02 12:46:46', 'Urbanmoney', '1746170211.png', 0, 1, 0),
(17, '2025-05-02 12:45:31', 'Cholamandalam', '1746170140.png', 0, 1, 0),
(18, '2025-05-02 12:46:26', 'My Mudra', '1746170191.png', 0, 0, 1),
(19, '2025-05-02 13:50:22', 'IIFL', '1746174044.png', 0, 0, 0),
(20, '2025-05-02 17:15:59', 'Hero Fincorp', '1746186387.png', 0, 0, 0),
(21, '2025-05-02 17:16:48', 'Axis Bank', '1746186577.png', 0, 0, 0),
(22, '2025-05-02 17:19:51', 'Bajaj Finserv', '1746186617.png', 0, 0, 0),
(23, '2025-05-02 17:20:45', 'SBI', '1746186746.png', 0, 0, 0),
(24, '2025-05-02 17:22:43', 'IDBI Bank', '1746186780.png', 0, 0, 0),
(25, '2025-05-02 17:23:20', 'Finnable', '1746186824.png', 0, 0, 0),
(26, '2025-05-02 17:24:03', 'PaySense', '1746186861.png', 0, 0, 1),
(27, '2025-05-02 17:33:31', 'LendingKart', '1746187457.png', 0, 0, 0),
(28, '2025-05-02 17:34:40', 'Upwards', '1746187511.png', 0, 0, 0),
(29, '2025-05-02 17:35:25', 'MoneyView', '1746187540.png', 0, 0, 0),
(30, '2025-05-02 17:35:58', 'IndusInd Bank', '1746187764.png', 0, 0, 0),
(31, '2025-05-02 17:39:40', 'HDFC Bank', '1746187798.png', 0, 0, 0),
(32, '2025-05-02 17:49:42', 'Tata Capital', '1746188400.png', 0, 0, 0),
(33, '2025-05-02 17:50:15', 'Aditya Birla Capital', '1746188435.png', 0, 0, 0),
(34, '2025-05-02 17:50:48', 'ICICI Bank', '1746188529.png', 0, 0, 0),
(35, '2025-05-02 17:52:23', 'Yes Bank', '1746188633.png', 0, 0, 0),
(36, '2025-05-02 17:55:06', 'Piramal Finance', '1746188726.png', 0, 0, 0),
(37, '2025-05-02 17:55:27', 'Ujjivan Small Finance', '1746188745.png', 0, 0, 0),
(38, '2025-05-02 18:30:43', 'InCred Finance', '1746190862.png', 0, 0, 0),
(39, '2025-05-02 18:31:26', 'SMFG India Credit', '1746191024.png', 0, 0, 0),
(40, '2025-05-02 18:34:00', 'Fibe', '1746191054.png', 0, 0, 0),
(41, '2025-05-02 18:34:35', 'Federal Bank', '1746191097.png', 0, 0, 0),
(42, '2025-05-02 18:35:15', 'Poonawalla Fincorp', '1746191145.png', 0, 0, 0),
(43, '2025-06-05 12:07:07', 'MoneyTap', '1749105801.png', 0, 0, 0),
(44, '2025-06-05 12:13:24', 'Ram Fincorp', '1749105817.png', 0, 0, 0),
(45, '2025-06-07 18:22:41', 'Freo (by MoneyTap)', '1749300818.png', 0, 0, 0),
(46, '2025-06-07 18:23:51', 'Ram Fincorp', '1749300844.png', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `bulksms`
--

CREATE TABLE `bulksms` (
  `id` int(11) NOT NULL,
  `rec_date` datetime NOT NULL DEFAULT current_timestamp(),
  `fullname` varchar(250) NOT NULL,
  `mobile` varchar(80) NOT NULL,
  `email` varchar(80) DEFAULT NULL,
  `isDnd` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=no dnd, 1 = dnd',
  `isDelete` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=not delete, 1 = delete'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(191) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(191) NOT NULL,
  `owner` varchar(191) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cardoffer`
--

CREATE TABLE `cardoffer` (
  `id` int(11) NOT NULL,
  `rec_date` datetime NOT NULL DEFAULT current_timestamp(),
  `user_id` int(11) NOT NULL DEFAULT 0,
  `offerpage` int(11) NOT NULL DEFAULT 1 COMMENT '1 - la offer 1,\r\n2 - la offer 2,\r\n3 - la offer 3,\r\n4 - sa offer 1,\r\n5 - sa offer 2,\r\n6 - sa offer 3,\r\n7 - sa offer 4,\r\n8 - la offer 4,\r\n9 - sa offer 5,\r\n10 - la offer 5',
  `first_name` varchar(55) NOT NULL,
  `last_name` varchar(55) NOT NULL,
  `mobile` varchar(256) NOT NULL,
  `emailid` varchar(256) NOT NULL,
  `card_number` varchar(256) DEFAULT NULL,
  `registration_date` date DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `amount` float(11,2) NOT NULL,
  `paymentid` varchar(50) DEFAULT NULL,
  `isCustomer` int(11) NOT NULL DEFAULT 0 COMMENT '0=No, 1=Yes',
  `isActive` int(11) NOT NULL DEFAULT 0 COMMENT '0=No, 1=Yes',
  `isDelete` int(11) NOT NULL DEFAULT 0 COMMENT '0=No. 1=Yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `cardoffer`
--

INSERT INTO `cardoffer` (`id`, `rec_date`, `user_id`, `offerpage`, `first_name`, `last_name`, `mobile`, `emailid`, `card_number`, `registration_date`, `expiry_date`, `amount`, `paymentid`, `isCustomer`, `isActive`, `isDelete`) VALUES
(1, '2026-04-17 15:37:28', 0, 2, 'verloop', 'web', '9408881214', 'verloop.dev4@gmail.com', NULL, NULL, NULL, 1.00, NULL, 0, 0, 0),
(2, '2026-04-15 14:37:49', 0, 7, 'EasyAi', 'loan', '7265993958', 'easyailoan@gmail.com', NULL, NULL, NULL, 234.82, NULL, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `careers`
--

CREATE TABLE `careers` (
  `id` int(11) NOT NULL,
  `rec_date` datetime NOT NULL DEFAULT current_timestamp(),
  `slug` varchar(225) NOT NULL,
  `title` varchar(225) NOT NULL,
  `descriptions` longtext NOT NULL,
  `isActive` int(11) NOT NULL DEFAULT 1,
  `isDelete` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `careers`
--

INSERT INTO `careers` (`id`, `rec_date`, `slug`, `title`, `descriptions`, `isActive`, `isDelete`) VALUES
(1, '2024-07-10 14:41:58', 'MF9XQ0', 'We’re Hiring Video Editor | Adajan, Surat', '<p>We&rsquo;re Hiring Video Editor | Adajan, Surat<br />\r\n<br />\r\n✅ Eligibility:<br />\r\n&bull; Min. Qualification &ndash; Graduate<br />\r\n&bull; Experience &ndash; 2 Years<br />\r\n&bull; Should create motion graphic videos<br />\r\n&bull; Create Animation videos<br />\r\n&bull; Should Create and Edit Vectors using video editing software<br />\r\n&bull; Must be proficient in video editing tools: Adobe After Effects, Premiere Pro, Illustrator, and Photoshop.<br />\r\n<br />\r\n✅ Job Role:<br />\r\n&bull; Create motion graphic explainer videos, slideshow videos, presentation videos, informational videos, and animated social media posts and reels.<br />\r\n&bull; Collaborate with the creative team to understand the requirements and present unique concepts.<br />\r\n<br />\r\n✅ Note:<br />\r\n&bull; Final Selection depends on the candidate&rsquo;s skill &ndash; judged by the company once the interview is done.<br />\r\n<br />\r\n&bull; Job Timing &ndash; 9:30 AM to 6:30 PM (Monday to Saturday).<br />\r\n<br />\r\n✅ Company Location:<br />\r\n128, 1st Floor Green Elina Complex, Opp. Varun Circle, Anand Mahal Road, Adajan, Surat, Gujarat - 395009.<br />\r\n<br />\r\nShare your CV at hr@quikborrow.com&nbsp;| +91 97125 63577</p>', 0, 0),
(6, '2024-02-22 11:23:15', 'Es9hV2', 'test', '<p>test test</p>\r\n\r\n<div id=\"gtx-trans\" style=\"left:-201px; position:absolute; top:38px\">\r\n<div class=\"gtx-trans-icon\">&nbsp;</div>\r\n</div>', 1, 1),
(7, '2025-04-04 12:02:42', 'Q805yt', 'We’re Hiring | Telecaller | Dabholi, Surat', '<p>✅ Eligibility:</p>\r\n\r\n<p>&bull; Qualification &ndash;&nbsp;12th Pass</p>\r\n\r\n<p>&bull; Experience &ndash; 6 months to 1 Year</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>✅ Job Role:</p>\r\n\r\n<p>&bull; Calling Customers and Informing them about the Company&#39;s Products/Services.</p>\r\n\r\n<p>&bull; Receive Calls and Solve Queries.</p>\r\n\r\n<p>&bull; Must use clear speech while communicating.</p>\r\n\r\n<p>&bull; Implement good communication skills for effective interactions.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>✅ Note:</p>\r\n\r\n<p>&bull; Final Selection depends on the candidate&rsquo;s skill &ndash; judged by the company once the interview is done.</p>\r\n\r\n<p>&bull; Job Timing &ndash; 9:30 AM To 6:30 PM (Monday to Saturday).</p>\r\n\r\n<p>✅ Company Location:</p>\r\n\r\n<p>&bull;&nbsp;245, Unique Square, Causeway Dabholi Link Road, Singanpore Shubham K Mart, Katargam, Surat, Gujarat, India - 395004</p>\r\n\r\n<p>Share your CV at hr@quikborrow.com | +91&nbsp;99988 43612</p>', 1, 0),
(8, '2024-05-24 16:36:45', 'N4bzu0', 'We\'re Hiring | Video Editor | Adajan Surat', '<p>We&rsquo;re Hiring Video Editor | Adajan Surat</p>\r\n\r\n<p>✅ Eligibility:<br />\r\n&bull; Min. Qualification &ndash; Graduate<br />\r\n&bull; Experience &ndash; 2 Years<br />\r\n&bull; Should create motion graphic videos<br />\r\n&bull; Create Animation videos<br />\r\n&bull; Should Create and Edit Vectors using video editing software<br />\r\n&bull; Must be proficient in video editing tools: Adobe After Effects, Premiere Pro, Illustrator, and Photoshop.</p>\r\n\r\n<p>✅ Job Role:<br />\r\n&bull; Create motion graphic explainer videos, slideshow videos, presentation videos, informational videos, and animated social media posts and reels.<br />\r\n&bull; Collaborate with the creative team to understand the requirements and present unique concepts.</p>\r\n\r\n<p>✅ Note:<br />\r\n&bull; Final Selection depends on the candidate&rsquo;s skill &ndash; judged by the company once the interview is done.<br />\r\n&bull; Job Timing &ndash; 9:30 AM to 6:30 PM (Monday to Saturday).</p>\r\n\r\n<p>✅ Company Location:<br />\r\n128, 1st Floor Green Elina Complex, Opp. Varun Circle, Anand Mahal Road, Adajan, Surat, Gujarat - 395009.<br />\r\nShare your CV at hr@quikborrow.com | +91 97125 63577</p>', 1, 1),
(9, '2024-05-24 16:47:40', 'N4bzu0', 'We\'re Hiring | Video Editor | Adajan Surat', '<p>We&rsquo;re Hiring Video Editor | Adajan Surat</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>✅ Eligibility:<br />\r\n&bull; Min. Qualification &ndash; Graduate<br />\r\n&bull; Experience &ndash; 2 Years<br />\r\n&bull; Should create motion graphic videos<br />\r\n&bull; Create Animation videos<br />\r\n&bull; Should Create and Edit Vectors using video editing software<br />\r\n&bull; Must be proficient in video editing tools: Adobe After Effects, Premiere Pro, Illustrator, and Photoshop.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n\r\n<p>✅ Job Role:<br />\r\n&bull; Create motion graphic explainer videos, slideshow videos, presentation videos, informational videos, and animated social media posts and reels.<br />\r\n&bull; Collaborate with the creative team to understand the requirements and present unique concepts.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n\r\n<p>✅ Note:<br />\r\n&bull; Final Selection depends on the candidate&rsquo;s skill &ndash; judged by the company once the interview is done.<br />\r\n&bull; Job Timing &ndash; 9:30 AM to 6:30 PM (Monday to Saturday).</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>✅ Company Location:<br />\r\n128, 1st Floor Green Elina Complex, Opp. Varun Circle, Anand Mahal Road, Adajan, Surat, Gujarat - 395009.<br />\r\nShare your CV at hr@quikborrow.com | +91 97125 63577</p>\r\n\r\n<p>&nbsp;</p>', 1, 1),
(10, '2024-05-24 16:52:59', '5L84x7', 'We’re Hiring | Content Writer | Adajan Surat', '<p>We&rsquo;re Hiring Content Writer | Adajan, Surat</p>\r\n\r\n<p>✅ Eligibility:<br />\r\n&bull; Qualification &ndash; Graduate<br />\r\n&bull; Experience &ndash; 6 Months To 1 Year</p>\r\n\r\n<p>✅ Job Role:<br />\r\n&bull; Use SEO best practices to generate traffic to our site.<br />\r\n&bull; Regularly produce various content types, including emailers, social media posts, blogs, website content, etc.<br />\r\n&bull; Generate Error-Free Original Content<br />\r\n&bull; Collaborate with other departments to create innovative content ideas.<br />\r\n&bull; Write content as per the company&rsquo;s requirements (under strict deadlines).</p>\r\n\r\n<p>✅ Note:<br />\r\n&bull; Final Selection depends on the candidate&rsquo;s skill &ndash; judged by the company once the interview is done.<br />\r\n&bull; Job Timing &ndash; 9:30 AM To 6:30 PM (Monday to Saturday).</p>\r\n\r\n<p>✅ Company Location:<br />\r\n128, 1st Floor Green Elina Complex, Opp. Varun Circle, Anand Mahal Road, Adajan, Surat, Gujarat - 395009.</p>\r\n\r\n<p>Share your CV at hr@quikborrow.com | +91 97125 63577</p>', 0, 0),
(11, '2024-07-09 11:51:38', '9EWPtu', 'We’re Hiring | SEO Expert | Adajan Surat', '<p>We&rsquo;re Hiring SEO Expert | Adajan, Surat</p>\r\n\r\n<p>✅ Eligibility:<br />\r\n&bull; Qualification &ndash; Graduate<br />\r\n&bull; Experience &ndash; 1 Year</p>\r\n\r\n<p>✅ Job Role:<br />\r\n&bull; Using Google Analytics to conduct performance reports regularly.<br />\r\n&bull; Ensuring high-quality SEO content.<br />\r\n&bull; Creating Backlink, articles and directory posting, press releases, etc.<br />\r\n&bull; Apply knowledge of PPC programs and optimize data gathered from both organic and paid sources.</p>\r\n\r\n<p>✅ Note:<br />\r\n&bull; Final Selection depends on the candidate&rsquo;s skill &ndash; judged by the company once the interview is done.<br />\r\n&bull; Job Timing &ndash; 9:30 AM To 6:30 PM (Monday to Saturday).</p>\r\n\r\n<p>✅ Company Location:<br />\r\n128, 1st Floor Green Elina Complex, Opp. Varun Circle, Anand Mahal Road, Adajan, Surat, Gujarat - 395009.</p>\r\n\r\n<p>Share your CV at hr@quikborrow.com | +91 97125 63577</p>', 1, 1),
(12, '2024-07-09 11:51:38', '9EWPtu', 'We’re Hiring | SEO Expert | Adajan Surat', '<p>We&rsquo;re Hiring SEO Expert | Adajan, Surat</p>\r\n\r\n<p>✅ Eligibility:<br />\r\n&bull; Qualification &ndash; Graduate<br />\r\n&bull; Experience &ndash; 1 Year</p>\r\n\r\n<p>✅ Job Role:<br />\r\n&bull; Using Google Analytics to conduct performance reports regularly.<br />\r\n&bull; Ensuring high-quality SEO content.<br />\r\n&bull; Creating Backlink, articles and directory posting, press releases, etc.<br />\r\n&bull; Apply knowledge of PPC programs and optimize data gathered from both organic and paid sources.</p>\r\n\r\n<p>✅ Note:<br />\r\n&bull; Final Selection depends on the candidate&rsquo;s skill &ndash; judged by the company once the interview is done.<br />\r\n&bull; Job Timing &ndash; 9:30 AM To 6:30 PM (Monday to Saturday).</p>\r\n\r\n<p>✅ Company Location:<br />\r\n128, 1st Floor Green Elina Complex, Opp. Varun Circle, Anand Mahal Road, Adajan, Surat, Gujarat - 395009.</p>\r\n\r\n<p>Share your CV at hr@quikborrow.com | +91 97125 63577</p>', 1, 1),
(13, '2024-07-09 11:51:38', '9EWPtu', 'We’re Hiring | SEO Expert | Adajan Surat', '<p>We&rsquo;re Hiring SEO Expert | Adajan, Surat</p>\r\n\r\n<p>✅ Eligibility:<br />\r\n&bull; Qualification &ndash; Graduate<br />\r\n&bull; Experience &ndash; 1 Year</p>\r\n\r\n<p>✅ Job Role:<br />\r\n&bull; Using Google Analytics to conduct performance reports regularly.<br />\r\n&bull; Ensuring high-quality SEO content.<br />\r\n&bull; Creating Backlink, articles and directory posting, press releases, etc.<br />\r\n&bull; Apply knowledge of PPC programs and optimize data gathered from both organic and paid sources.</p>\r\n\r\n<p>✅ Note:<br />\r\n&bull; Final Selection depends on the candidate&rsquo;s skill &ndash; judged by the company once the interview is done.<br />\r\n&bull; Job Timing &ndash; 9:30 AM To 6:30 PM (Monday to Saturday).</p>\r\n\r\n<p>✅ Company Location:<br />\r\n128, 1st Floor Green Elina Complex, Opp. Varun Circle, Anand Mahal Road, Adajan, Surat, Gujarat - 395009.</p>\r\n\r\n<p>Share your CV at hr@quikborrow.com | +91 97125 63577</p>', 1, 1),
(14, '2024-07-09 11:51:38', '9EWPtu', 'We’re Hiring | SEO Expert | Adajan Surat', '<p>We&rsquo;re Hiring SEO Expert | Adajan, Surat</p>\r\n\r\n<p>✅ Eligibility:<br />\r\n&bull; Qualification &ndash; Graduate<br />\r\n&bull; Experience &ndash; 1 Year</p>\r\n\r\n<p>✅ Job Role:<br />\r\n&bull; Using Google Analytics to conduct performance reports regularly.<br />\r\n&bull; Ensuring high-quality SEO content.<br />\r\n&bull; Creating Backlink, articles and directory posting, press releases, etc.<br />\r\n&bull; Apply knowledge of PPC programs and optimize data gathered from both organic and paid sources.</p>\r\n\r\n<p>✅ Note:<br />\r\n&bull; Final Selection depends on the candidate&rsquo;s skill &ndash; judged by the company once the interview is done.<br />\r\n&bull; Job Timing &ndash; 9:30 AM To 6:30 PM (Monday to Saturday).</p>\r\n\r\n<p>✅ Company Location:<br />\r\n128, 1st Floor Green Elina Complex, Opp. Varun Circle, Anand Mahal Road, Adajan, Surat, Gujarat - 395009.</p>\r\n\r\n<p>Share your CV at hr@quikborrow.com | +91 97125 63577</p>', 0, 0),
(15, '2024-09-10 15:57:17', 'tYN93i', 'We\'re Hiring | Chartered Accountant | Adajan Surat', '<p>We&rsquo;re Hiring Chartered Accountant | Adajan, Surat<br />\r\n<br />\r\n✅ Eligibility:<br />\r\n&bull; Qualified Chartered Accountant<br />\r\n&bull; Experience &ndash; 30-50k per month<br />\r\n<br />\r\n✅ Required Knowledge:<br />\r\n&bull;&nbsp;TDS<br />\r\n&bull;&nbsp;Taxation<br />\r\n&bull;&nbsp;GST<br />\r\n&bull;&nbsp;Accounting<br />\r\n&bull;&nbsp;Management Reporting<br />\r\n<br />\r\n✅ Note:<br />\r\n&bull; Final Selection depends on the candidate&rsquo;s skill &ndash; judged by the company once the interview is done.<br />\r\n&bull; Job Timing &ndash; 9:30 AM To 6:30 PM (Monday to Saturday)..<br />\r\n<br />\r\n✅ Company Location:<br />\r\n128, 1st Floor Green Elina Complex, Opp. Varun Circle, Anand Mahal Road, Adajan, Surat, Gujarat - 395009.<br />\r\nShare your CV at hr@quikborrow.com&nbsp;| +91 97125 63577</p>', 0, 0),
(16, '2024-09-10 16:45:14', 'hDN5K0', 'We’re Hiring | Google Ads | Adajan Surat', '<p>We&rsquo;re Hiring | Google Ads | Adajan Surat</p>\r\n\r\n<p>✅ Eligibility:</p>\r\n\r\n<p>&bull; Min. Qualification &ndash; Graduate.<br />\r\n&bull;&nbsp;Experience &ndash; 2 Years.<br />\r\n&nbsp;</p>\r\n\r\n<p>✅ Job Role:</p>\r\n\r\n<p>&bull; Plan, create and manage PPC campaigns..<br />\r\n&bull; Be involved in keyword selection and audience targeting.<br />\r\n&bull; Generating leads and sales using Google Adwords.<br />\r\n&bull; Manage the strategy and setup of all paid campaigns.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>✅ Note:</p>\r\n\r\n<p>&bull; Final Selection depends on the candidate&rsquo;s skill &ndash; judged by the company once the interview is done.<br />\r\n&bull; Job Timing &ndash; 9:30 AM to 6:30 PM (Monday to Saturday).<br />\r\n&nbsp;</p>\r\n\r\n<p>✅ Company Location:</p>\r\n\r\n<p>&bull; 128, Green Elina, 1st Floor, Anand Mahal Road, Adajan, Surat, Gujarat, India - 395009<br />\r\nShare your CV at hr@quikborrow.com | +91 97125 63577</p>', 0, 0),
(17, '2025-04-10 14:20:45', 'xhdG2a', 'We’re Hiring  Back Office Executive Dabholi, Surat', '<p>✅ Eligibility:</p>\r\n\r\n<p>&bull; Qualification &ndash;&nbsp;12th Pass</p>\r\n\r\n<p>&bull; Experience &ndash; 6 months to 1 Year</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>✅ Job Role:</p>\r\n\r\n<p>&bull; Handle login work by submitting files to the NBFC/Bank.</p>\r\n\r\n<p>&bull; Manage back-office operations.<br />\r\n<br />\r\n&bull; Maintain proper data on the computer</p>\r\n\r\n<p>&bull; Must use clear speech while communicating.</p>\r\n\r\n<p>&bull; Implement good communication skills for effective interactions.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>✅ Note:</p>\r\n\r\n<p>&bull; Final Selection depends on the candidate&rsquo;s skill &ndash; judged by the company once the interview is done.</p>\r\n\r\n<p>&bull; Job Timing &ndash; 9:30 AM To 6:30 PM (Monday to Saturday).</p>\r\n\r\n<p>✅ Company Location:</p>\r\n\r\n<p>&bull;&nbsp;245, Unique Square, Causeway Dabholi Link Road, Singanpore Shubham K Mart, Katargam, Surat, Gujarat, India - 395004</p>\r\n\r\n<p>Share your CV at hr@quikborrow.com | +91&nbsp;99988 43612</p>', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `career_enquiries`
--

CREATE TABLE `career_enquiries` (
  `id` int(11) NOT NULL,
  `rec_date` datetime NOT NULL DEFAULT current_timestamp(),
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mobile` varchar(50) NOT NULL,
  `applyfor` varchar(255) NOT NULL,
  `resume` varchar(255) NOT NULL,
  `qualifications` varchar(255) NOT NULL,
  `experience` varchar(255) NOT NULL,
  `keyskills` longtext NOT NULL,
  `city` varchar(256) DEFAULT NULL,
  `server_ip` varchar(256) DEFAULT NULL,
  `isDelete` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cashfree_entry`
--

CREATE TABLE `cashfree_entry` (
  `id` int(11) NOT NULL,
  `rec_date` datetime NOT NULL DEFAULT current_timestamp(),
  `entryfor` int(11) NOT NULL DEFAULT 0 COMMENT '1=Customer,2=Channel,11=SelfApply,12=Loan Agent, 3=LA_Offer_1,4=LA_Offer_2,5=LA_Offer_3,6=SA_Offer_1,7=SA_Offer_2,8=SA_Offer_3,9=SA_Offer_4,10=LA_Offer_4,21=SA_Offer_5,22=LA_Offer_5,31=SA_OFFER_6,32=LA_OFFER_6,41=SA_OFFER_7,42=LA_OFFER_7	',
  `userid` int(11) NOT NULL,
  `orderid` varchar(50) NOT NULL,
  `orderamount` float(11,2) NOT NULL,
  `ordernote` varchar(256) DEFAULT NULL,
  `referenceid` varchar(256) DEFAULT NULL,
  `txstatus` varchar(256) DEFAULT NULL,
  `paymentmode` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `channel_partners`
--

CREATE TABLE `channel_partners` (
  `id` int(11) NOT NULL,
  `rec_date` datetime DEFAULT NULL,
  `first_name` varchar(155) NOT NULL,
  `last_name` varchar(155) NOT NULL,
  `mobile` varchar(99) NOT NULL,
  `email` varchar(99) NOT NULL,
  `password` text NOT NULL,
  `company_code` varchar(99) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `vat_gst_no` varchar(99) DEFAULT NULL,
  `phone` varchar(99) NOT NULL,
  `website` varchar(155) NOT NULL,
  `address` longtext DEFAULT NULL,
  `city` varchar(99) DEFAULT NULL,
  `state` varchar(99) DEFAULT NULL,
  `pincode` varchar(99) DEFAULT NULL,
  `country` varchar(99) NOT NULL DEFAULT 'IN',
  `isActive` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1=active,0=deactive',
  `isDelete` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=no, 1=yes'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cipherpayentry`
--

CREATE TABLE `cipherpayentry` (
  `id` int(11) NOT NULL,
  `rec_date` datetime NOT NULL DEFAULT current_timestamp(),
  `entryfor` int(11) NOT NULL COMMENT '1=Customer,2=Channel,11=SelfApply,12=Loan Agent, 3=LA_Offer_1,4=LA_Offer_2,5=LA_Offer_3,6=SA_Offer_1,7=SA_Offer_2,8=SA_Offer_3,9=SA_Offer_4,10=LA_Offer_4',
  `userid` int(11) NOT NULL,
  `orderid` varchar(99) NOT NULL,
  `orderamount` float(11,2) NOT NULL,
  `ordernote` varchar(256) DEFAULT NULL,
  `referenceid` varchar(256) DEFAULT NULL,
  `txstatus` varchar(99) DEFAULT NULL,
  `paymentmode` varchar(99) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `click_counts`
--

CREATE TABLE `click_counts` (
  `id` int(11) NOT NULL,
  `rec_date` datetime NOT NULL DEFAULT current_timestamp(),
  `user_id` int(11) NOT NULL,
  `applylink_id` int(11) NOT NULL,
  `counts` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `click_counts`
--

INSERT INTO `click_counts` (`id`, `rec_date`, `user_id`, `applylink_id`, `counts`) VALUES
(1, '2026-04-13 15:09:58', 28, 16, 1),
(2, '2026-04-16 11:48:56', 36, 32, 1),
(3, '2026-04-16 12:05:45', 36, 32, 1);

-- --------------------------------------------------------

--
-- Table structure for table `contact_enquiry`
--

CREATE TABLE `contact_enquiry` (
  `id` int(11) NOT NULL,
  `rec_date` datetime NOT NULL DEFAULT current_timestamp(),
  `fullname` varchar(225) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mobile` varchar(100) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` longtext NOT NULL,
  `server_ip` varchar(256) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `contact_enquiry`
--

INSERT INTO `contact_enquiry` (`id`, `rec_date`, `fullname`, `email`, `mobile`, `subject`, `message`, `server_ip`) VALUES
(1, '2026-03-12 10:14:15', 'santosh', 'santosh123@gmailcom', '9898345467', 'Ok', 'hii', '171.61.165.233'),
(2, '2026-04-07 10:19:58', 'EasyAi loan', 'easyailoan@gmail.com', '6358141826', 'Payent Issue', 'testing kfkjvmcvndnvfvnv', '171.61.161.161'),
(3, '2026-04-08 10:57:29', 'Anita', 'easyailoan@gmail.com', '6358141826', 'Payent Issue', 'testing test', '171.61.161.161');

-- --------------------------------------------------------

--
-- Table structure for table `criteria_list`
--

CREATE TABLE `criteria_list` (
  `id` int(11) NOT NULL,
  `rec_date` datetime NOT NULL DEFAULT current_timestamp(),
  `criteria` varchar(99) NOT NULL,
  `isDelete` tinyint(4) NOT NULL DEFAULT 0,
  `isActive` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `criteria_list`
--

INSERT INTO `criteria_list` (`id`, `rec_date`, `criteria`, `isDelete`, `isActive`) VALUES
(1, '2025-04-05 14:14:35', '0-15k (Salaried)', 0, 1),
(2, '2025-04-05 14:14:35', '0-15k (Self Employed)', 0, 1),
(3, '2025-04-05 14:15:41', '15-25k (Salaried)', 0, 1),
(4, '2025-04-05 14:15:41', '15-25k (Self Employed)', 0, 1),
(5, '2025-04-05 14:15:41', '25k Above (Salaried)', 0, 1),
(6, '2025-04-05 14:15:41', '25k Above (Self Employed)', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `enroll_services`
--

CREATE TABLE `enroll_services` (
  `id` int(11) NOT NULL,
  `rec_date` datetime NOT NULL,
  `serviceid` int(11) NOT NULL,
  `purchase_date` date NOT NULL,
  `valid_upto` date NOT NULL,
  `amount` double NOT NULL DEFAULT 0,
  `paymentid` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fb_ads_entry`
--

CREATE TABLE `fb_ads_entry` (
  `id` int(11) NOT NULL,
  `rec_date` datetime NOT NULL DEFAULT current_timestamp(),
  `userid` int(11) DEFAULT NULL,
  `fbclid` varchar(299) DEFAULT NULL,
  `send_data` longtext DEFAULT NULL,
  `received_data` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fb_ads_entry`
--

INSERT INTO `fb_ads_entry` (`id`, `rec_date`, `userid`, `fbclid`, `send_data`, `received_data`) VALUES
(1, '2026-04-07 12:53:30', 1, NULL, '{\"type\":\"self-apply\",\"firstname\":\"verloop\",\"lastname\":\"web\",\"mobile\":\"919408881214\",\"email\":\"verloop.dev4@gmail.com\",\"city\":\"surat\",\"state\":\"gj\",\"zip\":\"395004\",\"orderid\":\"order_SaW9xutBuGVrPx\",\"odamount\":1,\"sourceurl\":\"https:\\/\\/quikborrow.com\\/cipher-payment-success\",\"fbclid\":\"\"}', '{\"events_received\":1,\"messages\":[],\"fbtrace_id\":\"AK7_J_1EPoklrzNbhkKx3-M\"}'),
(2, '2026-03-24 11:03:10', 2, NULL, NULL, NULL),
(3, '2026-03-24 14:00:31', 3, NULL, NULL, NULL),
(4, '2026-03-27 15:35:59', 4, NULL, '{\"type\":\"self-apply\",\"firstname\":\"verloop\",\"lastname\":\"web\",\"mobile\":\"919409665995\",\"email\":\"verloop.dev4@gmail.com\",\"city\":\"surat\",\"state\":\"gj\",\"zip\":\"395004\",\"orderid\":\"order_SWCtc42Qvr6lha\",\"odamount\":1,\"sourceurl\":\"https:\\/\\/quikborrow.com\\/cipher-payment-success\",\"fbclid\":\"\"}', '{\"error\":{\"message\":\"Invalid OAuth access token - Cannot parse access token\",\"type\":\"OAuthException\",\"code\":190,\"fbtrace_id\":\"ANUDQD-jLxQO0zqd1fs_Q97\"}}'),
(5, '2026-03-27 15:48:35', 5, NULL, '{\"type\":\"hire-agent\",\"firstname\":\"verloop\",\"lastname\":\"web\",\"mobile\":\"919974360572\",\"email\":\"verloop.dev4@gmail.com\",\"city\":\"surat\",\"state\":\"gj\",\"zip\":\"395004\",\"orderid\":\"order_SWDCfNzvnrboYD\",\"odamount\":1,\"sourceurl\":\"https:\\/\\/QuikBorrow.com\\/loan-agent\\/paymentSuccess\",\"fbclid\":\"\"}', '{\"error\":{\"message\":\"Invalid OAuth access token - Cannot parse access token\",\"type\":\"OAuthException\",\"code\":190,\"fbtrace_id\":\"A0DFCuVdcnb_SY7FobF_K5E\"}}'),
(6, '2026-03-27 16:29:55', 6, NULL, NULL, NULL),
(7, '2026-03-27 16:41:37', 7, NULL, NULL, NULL),
(8, '2026-03-27 16:49:54', 8, NULL, NULL, NULL),
(9, '2026-03-27 16:56:45', 9, NULL, NULL, NULL),
(10, '2026-03-30 17:19:13', 10, NULL, '{\"type\":\"hire-agent\",\"firstname\":\"verloop\",\"lastname\":\"web\",\"mobile\":\"919974360572\",\"email\":\"verloop.dev4@gmail.com\",\"city\":\"surat\",\"state\":\"gj\",\"zip\":\"395004\",\"orderid\":\"order_SXQUBkC95T5zqn\",\"odamount\":1,\"sourceurl\":\"https:\\/\\/QuikBorrow.com\\/loan-agent\\/paymentSuccess\",\"fbclid\":\"\"}', '{\"error\":{\"message\":\"Invalid OAuth access token - Cannot parse access token\",\"type\":\"OAuthException\",\"code\":190,\"fbtrace_id\":\"AuohB6XlojezaQux_d6wP0t\"}}'),
(11, '2026-03-28 11:57:56', 11, NULL, '{\"type\":\"self-apply\",\"firstname\":\"sufiya\",\"lastname\":\"praveen\",\"mobile\":\"919983933314\",\"email\":\"sufiyapraveen71@gmail.com\",\"city\":\"jodhpur\",\"state\":\"rj\",\"zip\":\"342001\",\"orderid\":\"order_SWXqIPv9oGqxYU\",\"odamount\":234.81999999999999317878973670303821563720703125,\"sourceurl\":\"https:\\/\\/quikborrow.com\\/cipher-payment-success\",\"fbclid\":\"\"}', '{\"error\":{\"message\":\"Invalid OAuth access token - Cannot parse access token\",\"type\":\"OAuthException\",\"code\":190,\"fbtrace_id\":\"A82tRLehosqm__wlerukVZR\"}}'),
(12, '2026-03-28 17:42:04', 12, NULL, '{\"type\":\"self-apply\",\"firstname\":\"easyai\",\"lastname\":\"loan\",\"mobile\":\"918099111111\",\"email\":\"easyailoan@gmail.com\",\"city\":\"jodhpur\",\"state\":\"rj\",\"zip\":\"342008\",\"orderid\":\"order_SWdSF0xN5doRv1\",\"odamount\":234.81999999999999317878973670303821563720703125,\"sourceurl\":\"https:\\/\\/quikborrow.com\\/cipher-payment-success\",\"fbclid\":\"\"}', '{\"events_received\":1,\"messages\":[],\"fbtrace_id\":\"AjrpMBId5CozTW9pm0cx0aq\"}'),
(13, '2026-03-30 16:17:02', 13, NULL, NULL, NULL),
(14, '2026-03-31 11:40:53', 14, NULL, '{\"type\":\"hire-agent\",\"firstname\":\"parth\",\"lastname\":\"s\",\"mobile\":\"919904466599\",\"email\":\"psurti07@gmail.com\",\"city\":\"surat\",\"state\":\"gj\",\"zip\":\"395001\",\"orderid\":\"order_SXjFXlXbRLRI6S\",\"odamount\":1,\"sourceurl\":\"https:\\/\\/QuikBorrow.com\\/loan-agent\\/paymentSuccess\",\"fbclid\":\"\"}', '{\"error\":{\"message\":\"Invalid OAuth access token - Cannot parse access token\",\"type\":\"OAuthException\",\"code\":190,\"fbtrace_id\":\"AbbAdJ2s-0qpE7rAfqIc75y\"}}'),
(15, '2026-03-30 17:28:44', 15, NULL, NULL, NULL),
(16, '2026-03-30 17:31:49', 16, NULL, NULL, NULL),
(17, '2026-03-31 11:49:29', 17, NULL, NULL, NULL),
(18, '2026-04-02 17:53:14', 18, NULL, '{\"type\":\"hire-agent\",\"firstname\":\"easyai\",\"lastname\":\"loan\",\"mobile\":\"919011100000\",\"email\":\"easyailoan@gmail.com\",\"city\":\"jodhpur\",\"state\":\"rj\",\"zip\":\"342008\",\"orderid\":\"order_SYcY2Sr4PL7ixX\",\"odamount\":588,\"sourceurl\":\"https:\\/\\/QuikBorrow.com\\/loan-agent\\/paymentSuccess\",\"fbclid\":\"\"}', '{\"events_received\":1,\"messages\":[],\"fbtrace_id\":\"AvU7FhCHtGe5Rmo1GkAjvXS\"}'),
(19, '2026-04-06 15:30:34', 19, NULL, NULL, NULL),
(20, '2026-04-07 12:04:07', 20, NULL, '{\"type\":\"self-apply\",\"firstname\":\"anita\",\"lastname\":\"parmar\",\"mobile\":\"919983933307\",\"email\":\"easyailoan@gmail.com\",\"city\":\"jodhpur\",\"state\":\"rj\",\"zip\":\"342008\",\"orderid\":\"order_SaV7Se3s503CQH\",\"odamount\":1,\"sourceurl\":\"https:\\/\\/quikborrow.com\\/cipher-payment-success\",\"fbclid\":\"\"}', '{\"events_received\":1,\"messages\":[],\"fbtrace_id\":\"ABgniH8M9qno6PQSzYYROns\"}'),
(21, '2026-04-07 12:24:59', 21, NULL, NULL, NULL),
(22, '2026-04-07 12:47:45', 22, NULL, NULL, NULL),
(23, '2026-04-07 12:52:38', 23, NULL, '{\"type\":\"hire-agent\",\"firstname\":\"rutvi\",\"lastname\":\"gohel\",\"mobile\":\"916358141826\",\"email\":\"indiakarobarofficial@gmail.com\",\"city\":\"surat\",\"state\":\"gj\",\"zip\":\"395005\",\"orderid\":\"order_SaWBiLp6CPcLay\",\"odamount\":1,\"sourceurl\":\"https:\\/\\/QuikBorrow.com\\/loan-agent\\/paymentSuccess\",\"fbclid\":\"\"}', '{\"events_received\":1,\"messages\":[],\"fbtrace_id\":\"AHJMzSo0TcE03usuKCY_OG-\"}'),
(24, '2026-04-08 16:34:13', 24, NULL, '{\"type\":\"self-apply\",\"firstname\":\"anita\",\"lastname\":\"parmar\",\"mobile\":\"916358141826\",\"email\":\"easyailoan@gmail.com\",\"city\":\"jodhpur\",\"state\":\"rj\",\"zip\":\"342008\",\"orderid\":\"order_SayUpzLBZCz2U3\",\"odamount\":1,\"sourceurl\":\"https:\\/\\/quikborrow.com\\/cipher-payment-success\",\"fbclid\":\"\"}', '{\"events_received\":1,\"messages\":[],\"fbtrace_id\":\"Ajc9lTb4114ph4kdoKkiTRd\"}'),
(25, '2026-04-09 16:39:19', 25, NULL, NULL, NULL),
(26, '2026-04-10 14:29:27', 26, NULL, NULL, NULL),
(27, '2026-04-10 15:14:05', 27, NULL, NULL, NULL),
(28, '2026-04-13 15:09:03', 28, NULL, '{\"type\":\"self-apply\",\"firstname\":\"kavita\",\"lastname\":\"nayk\",\"mobile\":\"917340237079\",\"email\":\"shramakavita31@gmail.com\",\"city\":\"jodhpur\",\"state\":\"rj\",\"zip\":\"342001\",\"orderid\":\"order_ScvjomRUDASk4c\",\"odamount\":234,\"sourceurl\":\"https:\\/\\/quikborrow.com\\/cipher-payment-success\",\"fbclid\":\"\"}', '{\"events_received\":1,\"messages\":[],\"fbtrace_id\":\"AqmZFYr2X4uleMuvV4FOK93\"}'),
(29, '2026-04-13 15:54:47', 29, NULL, NULL, NULL),
(30, '2026-04-13 18:17:04', 30, NULL, NULL, NULL),
(31, '2026-04-15 14:26:43', 31, NULL, '{\"type\":\"self-apply\",\"firstname\":\"anita\",\"lastname\":\"parmar\",\"mobile\":\"916358141826\",\"email\":\"indiakarobarofficial@gmail.com\",\"city\":\"surat\",\"state\":\"gj\",\"zip\":\"395005\",\"orderid\":\"order_Sdi0cDGgPav5yo\",\"odamount\":1,\"sourceurl\":\"https:\\/\\/quikborrow.com\\/cipher-payment-success\",\"fbclid\":\"\"}', '{\"events_received\":1,\"messages\":[],\"fbtrace_id\":\"Av2YaD1Gma8R_zdOnRoNbRd\"}'),
(32, '2026-04-15 14:36:46', 32, NULL, NULL, NULL),
(33, '2026-04-15 14:57:49', 33, NULL, NULL, NULL),
(34, '2026-04-15 15:51:48', 34, NULL, '{\"type\":\"hire-agent\",\"firstname\":\"anita\",\"lastname\":\"parmar\",\"mobile\":\"919983933307\",\"email\":\"easyailoan@gmail.com\",\"city\":\"jodhpur\",\"state\":\"rj\",\"zip\":\"342008\",\"orderid\":\"order_SdjUBLywY9EaF8\",\"odamount\":1,\"sourceurl\":\"https:\\/\\/QuikBorrow.com\\/loan-agent\\/paymentSuccess\",\"fbclid\":\"\"}', '{\"events_received\":1,\"messages\":[],\"fbtrace_id\":\"AxNdW-MmJofB81w2ylsUbkY\"}'),
(35, '2026-04-15 18:22:54', 35, NULL, NULL, NULL),
(36, '2026-04-16 11:46:47', 36, NULL, '{\"type\":\"self-apply\",\"firstname\":\"dileep\",\"lastname\":\"singh\",\"mobile\":\"919772068028\",\"email\":\"dileeprathore1999@gmail.com\",\"city\":\"phalodi\",\"state\":\"rj\",\"zip\":\"342025\",\"orderid\":\"order_Se3trM3yUuN3p4\",\"odamount\":234,\"sourceurl\":\"https:\\/\\/www.quikborrow.com\\/cipher-payment-success\",\"fbclid\":\"\"}', '{\"events_received\":1,\"messages\":[],\"fbtrace_id\":\"AQK6x46vF1IpkvV-ue0pb3B\"}'),
(37, '2026-04-17 13:15:22', 37, NULL, NULL, NULL),
(38, '2026-04-17 13:27:12', 38, NULL, '{\"type\":\"self-apply\",\"firstname\":\"pratap singh\",\"lastname\":\"rathore\",\"mobile\":\"919829222317\",\"email\":\"pratapsingh0502@gmail.com\",\"city\":\"barmer\",\"state\":\"rj\",\"zip\":\"344035\",\"orderid\":\"order_SeU6CTh8hljKdH\",\"odamount\":234,\"sourceurl\":\"https:\\/\\/www.quikborrow.com\\/cipher-payment-success\",\"fbclid\":\"\"}', '{\"events_received\":1,\"messages\":[],\"fbtrace_id\":\"A8umVkKX9RYFDuNlv--_GEy\"}'),
(39, '2026-04-18 12:17:06', 39, NULL, NULL, NULL),
(40, '2026-04-18 12:39:10', 40, NULL, '{\"type\":\"self-apply\",\"firstname\":\"anita\",\"lastname\":\"parmar\",\"mobile\":\"916358141826\",\"email\":\"easyailoan@gmail.com\",\"city\":\"jodhpur\",\"state\":\"rj\",\"zip\":\"342008\",\"orderid\":\"order_SerpoIni9z7uuh\",\"odamount\":1,\"sourceurl\":\"https:\\/\\/quikborrow.com\\/cipher-payment-success\",\"fbclid\":\"\"}', '{\"events_received\":1,\"messages\":[],\"fbtrace_id\":\"AnXNGSGKpVKBb9YrXeNGnzm\"}'),
(41, '2026-04-18 12:44:17', 41, NULL, '{\"type\":\"hire-agent\",\"firstname\":\"anita\",\"lastname\":\"parmar\",\"mobile\":\"916358141826\",\"email\":\"easyailoan@gmail.com\",\"city\":\"jodhpur\",\"state\":\"rj\",\"zip\":\"342008\",\"orderid\":\"order_ServotqDzArKdF\",\"odamount\":1,\"sourceurl\":\"https:\\/\\/QuikBorrow.com\\/loan-agent\\/paymentSuccess\",\"fbclid\":\"\"}', '{\"events_received\":1,\"messages\":[],\"fbtrace_id\":\"Alum7ghezbSy7cqStTj1TVE\"}'),
(42, '2026-04-18 15:44:38', 42, NULL, NULL, NULL),
(43, '2026-04-20 15:56:50', 43, NULL, '{\"type\":\"self-apply\",\"firstname\":\"akash\",\"lastname\":\".\",\"mobile\":\"919485887525\",\"email\":\"akashpratapsingh345@gmail.com\",\"city\":\"mahendragarh\",\"state\":\"hr\",\"zip\":\"123027\",\"orderid\":\"order_SfiGiEJJeNCWe9\",\"odamount\":234,\"sourceurl\":\"https:\\/\\/www.quikborrow.com\\/cipher-payment-success\",\"fbclid\":\"\"}', '{\"events_received\":1,\"messages\":[],\"fbtrace_id\":\"AYZeu-N_7Es3UdunHjtrNWp\"}');

-- --------------------------------------------------------

--
-- Table structure for table `important_update`
--

CREATE TABLE `important_update` (
  `id` int(11) NOT NULL,
  `rec_date` datetime NOT NULL DEFAULT current_timestamp(),
  `tags` varchar(256) NOT NULL,
  `descriptions` longtext NOT NULL,
  `isActive` int(11) NOT NULL DEFAULT 0 COMMENT '0=No, 1=Yes',
  `isDelete` int(11) NOT NULL DEFAULT 0 COMMENT '0=No, 1=Yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `important_update`
--

INSERT INTO `important_update` (`id`, `rec_date`, `tags`, `descriptions`, `isActive`, `isDelete`) VALUES
(1, '2025-02-28 15:58:45', 'hello', '<p><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:22px\"><strong>Hello Worlds</strong></span></span></p>', 0, 1),
(2, '2025-02-28 17:02:52', 'hello', '<p><span style=\"font-size:22px\"><strong>Hello World</strong></span></p>', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `info_pages`
--

CREATE TABLE `info_pages` (
  `id` int(11) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `content` longtext DEFAULT NULL,
  `rec_date` datetime NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `info_pages`
--

INSERT INTO `info_pages` (`id`, `slug`, `content`, `rec_date`, `status`) VALUES
(1, 'privacy-policy', '<p dir=\"ltr\">The privacy of every user of QuikBorrow.com is extremely important to us. This Privacy Policy explains what data and information we collect, how we process and use it, with whom it may be shared, and how we protect and maintain it.</p>\r\n\r\n<p dir=\"ltr\">In the normal course of operating QuikBorrow.com, personal information may be collected through various sources, including:</p>\r\n\r\n<hr />\r\n<h3 dir=\"ltr\"><strong><span style=\"font-size:20px\">1.Information Provided by You</span></strong><br />\r\n&nbsp;</h3>\r\n\r\n<p>This includes details provided when filling out forms or interacting with the website, such as:</p>\r\n\r\n<ol>\r\n	<li>Name</li>\r\n	<li>Address</li>\r\n	<li>Marital status</li>\r\n	<li>Employment information</li>\r\n	<li>Income details</li>\r\n	<li>Asset information</li>\r\n	<li>Contact details<br />\r\n	&nbsp;</li>\r\n</ol>\r\n\r\n<hr />\r\n<h3 dir=\"ltr\"><span style=\"font-size:18px\"><strong>2.Information Received from Other Sources</strong></span><br />\r\n&nbsp;</h3>\r\n\r\n<p dir=\"ltr\">We may also receive information about you, your accounts, and transactions from third parties such as:</p>\r\n\r\n<ol>\r\n	<li dir=\"ltr\">\r\n	<p dir=\"ltr\">Financial institutions</p>\r\n	</li>\r\n	<li dir=\"ltr\">\r\n	<p dir=\"ltr\">Banks or lending partners</p>\r\n	</li>\r\n	<li dir=\"ltr\">\r\n	<p dir=\"ltr\">Account custodians</p>\r\n	</li>\r\n	<li dir=\"ltr\">\r\n	<p dir=\"ltr\">Brokers or other financial service providers<br />\r\n	&nbsp;</p>\r\n	</li>\r\n</ol>\r\n\r\n<p dir=\"ltr\">We are committed to protecting all users of QuikBorrow.com by addressing potential privacy concerns and maintaining appropriate data protection standards.</p>\r\n\r\n<p dir=\"ltr\">This Privacy Policy applies to all information relating to the operations of QuikBorrow.com, and to any information handled by us in connection with organizations or service providers working with us. It also applies to the use of IT systems, email, internet services, and communication technologies used to operate the platform.</p>\r\n\r\n<p dir=\"ltr\">This policy applies to all users, clients, and employees associated with QuikBorrow.com (collectively referred to as &ldquo;individuals&rdquo;).</p>\r\n\r\n<hr />\r\n<h1 dir=\"ltr\"><span style=\"font-size:18px\"><strong>3.Jurisdiction</strong></span><br />\r\n&nbsp;</h1>\r\n\r\n<p dir=\"ltr\">Subject to arbitration, the courts and tribunals of Jodhpur shall have exclusive jurisdiction over any disputes, claims, or legal proceedings arising out of the use of QuikBorrow.com or related services.</p>\r\n\r\n<p dir=\"ltr\">Nothing contained in this clause restricts the right of any lending partner or service provider to initiate legal proceedings in any other competent jurisdiction if required under applicable laws.</p>\r\n\r\n<hr />\r\n<h1 dir=\"ltr\"><span style=\"font-size:18px\"><strong>4.How QuikBorrow.com Protects Your Personal Information</strong></span></h1>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p dir=\"ltr\">QuikBorrow.com does not sell or trade personal information of its users.</p>\r\n\r\n<p dir=\"ltr\">However, personal information may be shared when necessary to:</p>\r\n\r\n<ol>\r\n	<li dir=\"ltr\">\r\n	<p dir=\"ltr\">Process or facilitate services requested by the user</p>\r\n	</li>\r\n	<li dir=\"ltr\">\r\n	<p dir=\"ltr\">Assist in evaluating or processing financial service applications</p>\r\n	</li>\r\n	<li dir=\"ltr\">\r\n	<p dir=\"ltr\">Maintain or manage user accounts</p>\r\n	</li>\r\n	<li dir=\"ltr\">\r\n	<p dir=\"ltr\">Enforce agreements or platform policies<br />\r\n	&nbsp;</p>\r\n	</li>\r\n</ol>\r\n\r\n<p dir=\"ltr\">Personal information may also be disclosed to:</p>\r\n\r\n<ol>\r\n	<li dir=\"ltr\">\r\n	<p dir=\"ltr\">Technology or consulting service providers working with us</p>\r\n	</li>\r\n	<li dir=\"ltr\">\r\n	<p dir=\"ltr\">Authorized representatives such as legal advisors or trustees</p>\r\n	</li>\r\n	<li dir=\"ltr\">\r\n	<p dir=\"ltr\">Regulatory authorities or government bodies when required by law</p>\r\n	</li>\r\n	<li dir=\"ltr\">\r\n	<p dir=\"ltr\">Service partners involved in providing requested services</p>\r\n	</li>\r\n</ol>\r\n\r\n<p dir=\"ltr\">&nbsp;</p>\r\n\r\n<p dir=\"ltr\">Access to personal information is restricted only to authorized personnel or permitted third parties who require the information to perform their duties.</p>\r\n\r\n<p dir=\"ltr\">To safeguard personal information, we maintain administrative, technical, and physical security measures consistent with applicable laws in India. These include secured systems, controlled access protocols, and internal confidentiality procedures.</p>\r\n\r\n<hr />\r\n<h1 dir=\"ltr\"><span style=\"font-size:18px\"><strong>5.How We Use Your Personal Information</strong></span></h1>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p dir=\"ltr\">The personal information collected through QuikBorrow.com may be used for purposes including:</p>\r\n\r\n<ol>\r\n	<li dir=\"ltr\">\r\n	<p dir=\"ltr\">Reviewing applications for services or accounts</p>\r\n	</li>\r\n	<li dir=\"ltr\">\r\n	<p dir=\"ltr\">Providing and administering services requested by users</p>\r\n	</li>\r\n	<li dir=\"ltr\">\r\n	<p dir=\"ltr\">Carrying out internal business operations</p>\r\n	</li>\r\n	<li dir=\"ltr\">\r\n	<p dir=\"ltr\">Enforcing agreements and collecting outstanding dues</p>\r\n	</li>\r\n	<li dir=\"ltr\">\r\n	<p dir=\"ltr\">Complying with applicable laws and regulatory requirements</p>\r\n	</li>\r\n	<li dir=\"ltr\">\r\n	<p dir=\"ltr\">Preventing fraud, financial crime, or misuse of services</p>\r\n	</li>\r\n	<li dir=\"ltr\">\r\n	<p dir=\"ltr\">Managing sanctions or regulatory compliance obligations</p>\r\n	</li>\r\n	<li dir=\"ltr\">\r\n	<p dir=\"ltr\">Monitoring and improving services offered through the platform</p>\r\n	</li>\r\n	<li dir=\"ltr\">\r\n	<p dir=\"ltr\">Providing information about services that may be relevant to you<br />\r\n	&nbsp;</p>\r\n	</li>\r\n</ol>\r\n\r\n<p dir=\"ltr\">Users may opt out of receiving promotional communications by contacting us in writing at info@quikborrow.com.</p>\r\n\r\n<hr />\r\n<h1 dir=\"ltr\"><span style=\"font-size:18px\"><strong>6.Sharing Information with Third Parties</strong></span></h1>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p dir=\"ltr\">QuikBorrow.com does not sell, rent, or trade personally identifiable information to third parties.</p>\r\n\r\n<p dir=\"ltr\">However, information may be shared with trusted third-party partners who assist in:</p>\r\n\r\n<ol>\r\n	<li dir=\"ltr\">\r\n	<p dir=\"ltr\">Operating the website</p>\r\n	</li>\r\n	<li dir=\"ltr\">\r\n	<p dir=\"ltr\">Processing service requests</p>\r\n	</li>\r\n	<li dir=\"ltr\">\r\n	<p dir=\"ltr\">Supporting business operations<br />\r\n	&nbsp;</p>\r\n	</li>\r\n</ol>\r\n\r\n<p dir=\"ltr\">These third parties are required to maintain the confidentiality of such information.</p>\r\n\r\n<p dir=\"ltr\">Information may also be disclosed when necessary to:</p>\r\n\r\n<ol>\r\n	<li dir=\"ltr\">\r\n	<p dir=\"ltr\">Comply with legal obligations</p>\r\n	</li>\r\n	<li dir=\"ltr\">\r\n	<p dir=\"ltr\">Enforce platform policies</p>\r\n	</li>\r\n	<li dir=\"ltr\">\r\n	<p dir=\"ltr\">Protect the rights, safety, or property of users or the company<br />\r\n	&nbsp;</p>\r\n	</li>\r\n</ol>\r\n\r\n<p dir=\"ltr\">Non-personally identifiable information may be used for marketing analytics, advertising insights, or general platform improvements.</p>\r\n\r\n<hr />\r\n<h1 dir=\"ltr\"><span style=\"font-size:18px\"><strong>7.Security and Confidentiality</strong></span></h1>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p dir=\"ltr\">Protecting personal information is a priority for QuikBorrow.com. We use industry-standard security tools and internal processes to prevent unauthorized access, misuse, or data leakage.</p>\r\n\r\n<p dir=\"ltr\">However, no transmission method over the internet or electronic storage system can guarantee absolute security. While we implement commercially reasonable safeguards, we cannot ensure complete protection against every possible risk.</p>\r\n\r\n<p dir=\"ltr\">If you identify any security vulnerability or suspected data breach, please notify us immediately at: info@quikborrow.com.&nbsp;</p>\r\n\r\n<p dir=\"ltr\">Our team will review and take appropriate action to address the issue.</p>\r\n\r\n<p dir=\"ltr\">Access to user information within the organization is granted strictly on a need-to-know basis, and employees are bound by confidentiality obligations.</p>\r\n\r\n<hr />\r\n<h1 dir=\"ltr\"><span style=\"font-size:18px\"><strong>8.Data Accuracy</strong></span></h1>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p dir=\"ltr\">Personal data must remain accurate and up to date. Users are encouraged to verify and update their information periodically.</p>\r\n\r\n<p dir=\"ltr\">If any personal information is incorrect or outdated, reasonable steps should be taken to correct or remove it.</p>\r\n\r\n<hr />\r\n<h1 dir=\"ltr\"><span style=\"font-size:18px\"><strong>9.Limitation of Liability</strong></span></h1>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p dir=\"ltr\">QuikBorrow.com shall not be liable for any confusion or loss resulting from actions taken by users based on information available on the platform.</p>\r\n\r\n<p dir=\"ltr\">While efforts are made to maintain uninterrupted website access, we are not responsible for interruptions, delays, or technical issues beyond our control.</p>\r\n\r\n<p dir=\"ltr\">In any event, the total liability related to the use of services shall not exceed the amount paid by the user for the specific service associated with the claim.</p>\r\n\r\n<hr />\r\n<h1 dir=\"ltr\"><span style=\"font-size:18px\"><strong>10.Usage of Advertising Identifiers</strong></span></h1>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p dir=\"ltr\">When accessing services through mobile applications or integrated services, certain anonymous advertising identifiers may be collected for analytics or advertising purposes. These may include:</p>\r\n\r\n<ol>\r\n	<li dir=\"ltr\">\r\n	<p dir=\"ltr\">Google Advertising ID (Android devices)</p>\r\n	</li>\r\n	<li dir=\"ltr\">\r\n	<p dir=\"ltr\">Apple Advertising Identifier (IDFA for iOS devices)</p>\r\n	</li>\r\n</ol>\r\n\r\n<p dir=\"ltr\">&nbsp;</p>\r\n\r\n<p dir=\"ltr\">These identifiers help improve advertising performance and user analytics.</p>\r\n\r\n<p dir=\"ltr\">Users may reset or disable advertising identifiers through their device settings if they prefer not to receive targeted advertisements.</p>\r\n\r\n<hr />\r\n<h1 dir=\"ltr\"><span style=\"font-size:18px\"><strong>11.Compliance with Regulations</strong></span></h1>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p dir=\"ltr\">We periodically review this Privacy Policy to ensure compliance with applicable laws and data protection regulations in India.</p>\r\n\r\n<p dir=\"ltr\">We remain committed to cooperating with regulatory authorities and adhering to legal requirements related to data protection and data transfer.</p>\r\n\r\n<hr />\r\n<h1 dir=\"ltr\"><span style=\"font-size:18px\"><strong>12.User Consent</strong></span></h1>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p dir=\"ltr\">By using QuikBorrow.com, users acknowledge that they have read, understood, and agreed to the terms outlined in this Privacy Policy.</p>\r\n\r\n<p dir=\"ltr\">Continued use of the website constitutes acceptance of the policy.</p>\r\n\r\n<hr />\r\n<h1 dir=\"ltr\"><span style=\"font-size:18px\"><strong>13.Grievances</strong></span></h1>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p dir=\"ltr\">For any complaints, questions, or concerns regarding this Privacy Policy, users may contact us at: info@quikborrow.com</p>\r\n\r\n<p dir=\"ltr\">All grievances will be reviewed, and reasonable efforts will be made to resolve them promptly.</p>\r\n\r\n<hr />\r\n<h1 dir=\"ltr\"><span style=\"font-size:18px\"><strong>14.Policy Modifications</strong></span></h1>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p dir=\"ltr\">QuikBorrow.com reserves the right to modify or update this Privacy Policy at any time.</p>\r\n\r\n<p dir=\"ltr\">If significant changes are made, reasonable efforts will be taken to notify users through the website or via communication channels where applicable.</p>\r\n\r\n<p dir=\"ltr\">Users are encouraged to review the policy periodically.</p>\r\n\r\n<hr />\r\n<h1 dir=\"ltr\"><span style=\"font-size:18px\"><strong>15.Cookies Policy</strong></span></h1>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p dir=\"ltr\">Cookies are small files placed on a user&#39;s device through their web browser with permission. These cookies help recognize browsers and remember certain preferences.</p>\r\n\r\n<p dir=\"ltr\">We use cookies to:</p>\r\n\r\n<ol>\r\n	<li dir=\"ltr\">\r\n	<p dir=\"ltr\">Understand user preferences</p>\r\n	</li>\r\n	<li dir=\"ltr\">\r\n	<p dir=\"ltr\">Improve website functionality</p>\r\n	</li>\r\n	<li dir=\"ltr\">\r\n	<p dir=\"ltr\">Track advertising performance</p>\r\n	</li>\r\n	<li dir=\"ltr\">\r\n	<p dir=\"ltr\">Analyze website traffic and interaction<br />\r\n	&nbsp;</p>\r\n	</li>\r\n</ol>\r\n\r\n<p dir=\"ltr\">Cookies help us enhance the overall experience and improve services offered on QuikBorrow.com.</p>', '2024-01-26 12:27:05', 1),
(2, 'terms-conditions', '<p dir=\"ltr\">In these Terms &amp; Conditions, the words &ldquo;we&rdquo;, &ldquo;our&rdquo;, &ldquo;us&rdquo;, or &ldquo;company&rdquo; refer to QuikBorrow and its systems, platforms, and services.<br />\r\nThe words &ldquo;you&rdquo;, &ldquo;your&rdquo;, or &ldquo;user&rdquo; refer to any individual accessing, registering, or using the website QuikBorrow.com.</p>\r\n\r\n<p dir=\"ltr\">These Terms &amp; Conditions apply to customers, users, referral partners, employees, and visitors accessing the website QuikBorrow.com. By accessing or using this website, you agree to comply with these Terms &amp; Conditions.</p>\r\n\r\n<hr />\r\n<h1 dir=\"ltr\"><span style=\"font-size:18px\"><strong>1. Acceptance of Terms</strong></span></h1>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p dir=\"ltr\">By accessing or using QuikBorrow.com, you confirm that:</p>\r\n\r\n<ol>\r\n	<li dir=\"ltr\">\r\n	<p dir=\"ltr\">You have read and understood these Terms &amp; Conditions.</p>\r\n	</li>\r\n	<li dir=\"ltr\">\r\n	<p dir=\"ltr\">You agree to comply with all policies mentioned on the website.</p>\r\n	</li>\r\n	<li dir=\"ltr\">\r\n	<p dir=\"ltr\">You accept that the company may update or modify these terms at any time.</p>\r\n	</li>\r\n</ol>\r\n\r\n<p dir=\"ltr\">Continued use of the website will be considered acceptance of updated terms.</p>\r\n\r\n<hr />\r\n<h1 dir=\"ltr\"><span style=\"font-size:18px\"><strong>2. Information Provided by Users</strong></span></h1>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p dir=\"ltr\">Users may provide personal and financial information, including but not limited to:</p>\r\n\r\n<ol>\r\n	<li dir=\"ltr\">\r\n	<p dir=\"ltr\">Name</p>\r\n	</li>\r\n	<li dir=\"ltr\">\r\n	<p dir=\"ltr\">Address</p>\r\n	</li>\r\n	<li dir=\"ltr\">\r\n	<p dir=\"ltr\">Contact details</p>\r\n	</li>\r\n	<li dir=\"ltr\">\r\n	<p dir=\"ltr\">Employment information</p>\r\n	</li>\r\n	<li dir=\"ltr\">\r\n	<p dir=\"ltr\">Income details</p>\r\n	</li>\r\n	<li dir=\"ltr\">\r\n	<p dir=\"ltr\">Financial and banking information<br />\r\n	&nbsp;</p>\r\n	</li>\r\n</ol>\r\n\r\n<p dir=\"ltr\">This information may be used for:</p>\r\n\r\n<ol>\r\n	<li dir=\"ltr\">\r\n	<p dir=\"ltr\">Evaluating eligibility</p>\r\n	</li>\r\n	<li dir=\"ltr\">\r\n	<p dir=\"ltr\">Processing loan-related services</p>\r\n	</li>\r\n	<li dir=\"ltr\">\r\n	<p dir=\"ltr\">Communication regarding services</p>\r\n	</li>\r\n	<li dir=\"ltr\">\r\n	<p dir=\"ltr\">Compliance and verification purposes<br />\r\n	&nbsp;</p>\r\n	</li>\r\n</ol>\r\n\r\n<p dir=\"ltr\">Users must ensure that all information provided is accurate and authentic.</p>\r\n\r\n<p dir=\"ltr\">Providing false or misleading information may lead to service rejection or legal action.</p>\r\n\r\n<hr />\r\n<h1 dir=\"ltr\"><span style=\"font-size:18px\"><strong>3. Loan Services Disclaimer</strong></span></h1>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p dir=\"ltr\">QuikBorrow is a digital financial services platform that assists users in applying for loans through partnered financial institutions or NBFCs.</p>\r\n\r\n<p dir=\"ltr\">Important points:</p>\r\n\r\n<ol>\r\n	<li dir=\"ltr\">\r\n	<p dir=\"ltr\">QuikBorrow does not guarantee loan approval.<br />\r\n	&nbsp;</p>\r\n	</li>\r\n</ol>\r\n\r\n<p dir=\"ltr\">Loan approval depends entirely on:</p>\r\n\r\n<ol>\r\n	<li dir=\"ltr\">\r\n	<p dir=\"ltr\">Customer profile</p>\r\n	</li>\r\n	<li dir=\"ltr\">\r\n	<p dir=\"ltr\">Documents submitted</p>\r\n	</li>\r\n	<li dir=\"ltr\">\r\n	<p dir=\"ltr\">Credit score</p>\r\n	</li>\r\n	<li dir=\"ltr\">\r\n	<p dir=\"ltr\">Bank/NBFC policies<br />\r\n	&nbsp;</p>\r\n	</li>\r\n</ol>\r\n\r\n<p dir=\"ltr\">The company only facilitates the loan application and consultation process.</p>\r\n\r\n<p dir=\"ltr\">Final decisions regarding loan sanction, approval, interest rate, tenure, and disbursement are made solely by the bank or NBFC.</p>\r\n\r\n<hr />\r\n<h1 dir=\"ltr\"><span style=\"font-size:18px\"><strong>4. Pre-Approved Loan Offers</strong></span></h1>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p dir=\"ltr\">The Pre-Approved Loan Offers displayed on QuikBorrow.com are tentative and system-generated based on information entered by the user.</p>\r\n\r\n<p dir=\"ltr\">These offers are:</p>\r\n\r\n<ol>\r\n	<li dir=\"ltr\">\r\n	<p dir=\"ltr\">Indicative only</p>\r\n	</li>\r\n	<li dir=\"ltr\">\r\n	<p dir=\"ltr\">Not a final loan approval</p>\r\n	</li>\r\n	<li dir=\"ltr\">\r\n	<p dir=\"ltr\">Subject to verification by financial institutions<br />\r\n	&nbsp;</p>\r\n	</li>\r\n</ol>\r\n\r\n<p dir=\"ltr\">Final loan approval depends on:</p>\r\n\r\n<ol>\r\n	<li dir=\"ltr\">\r\n	<p dir=\"ltr\">Customer documentation</p>\r\n	</li>\r\n	<li dir=\"ltr\">\r\n	<p dir=\"ltr\">Credit evaluation</p>\r\n	</li>\r\n	<li dir=\"ltr\">\r\n	<p dir=\"ltr\">Bank or NBFC policies<br />\r\n	&nbsp;</p>\r\n	</li>\r\n</ol>\r\n\r\n<p dir=\"ltr\">Example:</p>\r\n\r\n<p dir=\"ltr\">If a user enters:</p>\r\n\r\n<p dir=\"ltr\">Monthly Income: ₹1,00,000<br />\r\nExisting EMI: ₹35,000</p>\r\n\r\n<p dir=\"ltr\">The system may estimate a tentative loan eligibility based on financial ratios used by lenders.</p>\r\n\r\n<p dir=\"ltr\">However, the final loan amount and approval may differ after lender verification.</p>\r\n\r\n<hr />\r\n<h1 dir=\"ltr\"><span style=\"font-size:18px\"><strong>5. Service Scope</strong></span></h1>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p dir=\"ltr\">QuikBorrow provides services including but not limited to:</p>\r\n\r\n<ol>\r\n	<li dir=\"ltr\">\r\n	<p dir=\"ltr\">Loan eligibility assessment</p>\r\n	</li>\r\n	<li dir=\"ltr\">\r\n	<p dir=\"ltr\">Loan consultation support</p>\r\n	</li>\r\n	<li dir=\"ltr\">\r\n	<p dir=\"ltr\">Online loan application facilitation</p>\r\n	</li>\r\n	<li dir=\"ltr\">\r\n	<p dir=\"ltr\">Communication with financial partners</p>\r\n	</li>\r\n	<li dir=\"ltr\">\r\n	<p dir=\"ltr\">Process updates via portal or communication channels<br />\r\n	&nbsp;</p>\r\n	</li>\r\n</ol>\r\n\r\n<p dir=\"ltr\">The company may submit loan applications to multiple financial institutions where the user profile meets eligibility criteria.</p>\r\n\r\n<hr />\r\n<h1 dir=\"ltr\"><span style=\"font-size:18px\"><strong>6. Responsibilities of the User</strong></span></h1>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p dir=\"ltr\">Users agree to:</p>\r\n\r\n<ol>\r\n	<li dir=\"ltr\">\r\n	<p dir=\"ltr\">Provide correct and genuine information</p>\r\n	</li>\r\n	<li dir=\"ltr\">\r\n	<p dir=\"ltr\">Submit authentic documents</p>\r\n	</li>\r\n	<li dir=\"ltr\">\r\n	<p dir=\"ltr\">Respond to verification calls or requests</p>\r\n	</li>\r\n	<li dir=\"ltr\">\r\n	<p dir=\"ltr\">Follow lender requirements and procedures<br />\r\n	&nbsp;</p>\r\n	</li>\r\n</ol>\r\n\r\n<p dir=\"ltr\">Failure to comply may result in:</p>\r\n\r\n<ol>\r\n	<li dir=\"ltr\">\r\n	<p dir=\"ltr\">Application rejection</p>\r\n	</li>\r\n	<li dir=\"ltr\">\r\n	<p dir=\"ltr\">Account suspension</p>\r\n	</li>\r\n	<li dir=\"ltr\">\r\n	<p dir=\"ltr\">Service termination</p>\r\n	</li>\r\n</ol>\r\n\r\n<hr />\r\n<h1 dir=\"ltr\"><span style=\"font-size:18px\"><strong>7. Fraudulent Documents</strong></span></h1>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p dir=\"ltr\">If any user submits:</p>\r\n\r\n<ol>\r\n	<li dir=\"ltr\">\r\n	<p dir=\"ltr\">Fake documents</p>\r\n	</li>\r\n	<li dir=\"ltr\">\r\n	<p dir=\"ltr\">Misleading information</p>\r\n	</li>\r\n	<li dir=\"ltr\">\r\n	<p dir=\"ltr\">Fraudulent financial details<br />\r\n	&nbsp;</p>\r\n	</li>\r\n</ol>\r\n\r\n<p dir=\"ltr\">The company reserves the right to:</p>\r\n\r\n<ol>\r\n	<li dir=\"ltr\">\r\n	<p dir=\"ltr\">Terminate the service</p>\r\n	</li>\r\n	<li dir=\"ltr\">\r\n	<p dir=\"ltr\">Report the issue to financial institutions</p>\r\n	</li>\r\n	<li dir=\"ltr\">\r\n	<p dir=\"ltr\">Initiate legal action if required</p>\r\n	</li>\r\n</ol>\r\n\r\n<hr />\r\n<h1 dir=\"ltr\"><span style=\"font-size:18px\"><strong>8. Third-Party Payment and Services</strong></span></h1>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p dir=\"ltr\">Payments made through the website may be processed using third-party payment gateways.</p>\r\n\r\n<p dir=\"ltr\">The company will activate services only after successful payment confirmation.</p>\r\n\r\n<p dir=\"ltr\">If payment is:</p>\r\n\r\n<ol>\r\n	<li dir=\"ltr\">\r\n	<p dir=\"ltr\">Deducted but not received by the company due to gateway issues</p>\r\n	</li>\r\n	<li dir=\"ltr\">\r\n	<p dir=\"ltr\">Delayed due to bank processing<br />\r\n	&nbsp;</p>\r\n	</li>\r\n</ol>\r\n\r\n<p dir=\"ltr\">Then resolution will depend on payment gateway or bank rules and timelines.</p>\r\n\r\n<hr />\r\n<h1 dir=\"ltr\"><span style=\"font-size:18px\"><strong>9. Communication and Support</strong></span></h1>\r\n\r\n<p dir=\"ltr\">Users may contact the company for support via:</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; ● Email: info@quikborrow.com</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; ● Contact Number: +91-9983933307</p>\r\n\r\n<p dir=\"ltr\">Customer support is available during business hours.</p>\r\n\r\n<hr />\r\n<h1 dir=\"ltr\"><span style=\"font-size:18px\"><strong>10. Marketing and Promotional Content</strong></span></h1>\r\n\r\n<p dir=\"ltr\">&nbsp;</p>\r\n\r\n<p dir=\"ltr\">Promotional messages, advertisements, and website content may include statements such as:</p>\r\n\r\n<ol>\r\n	<li dir=\"ltr\">\r\n	<p dir=\"ltr\">Fast loan processing</p>\r\n	</li>\r\n	<li dir=\"ltr\">\r\n	<p dir=\"ltr\">Instant loan eligibility</p>\r\n	</li>\r\n	<li dir=\"ltr\">\r\n	<p dir=\"ltr\">Quick approvals<br />\r\n	&nbsp;</p>\r\n	</li>\r\n</ol>\r\n\r\n<p dir=\"ltr\">These messages are promotional in nature.</p>\r\n\r\n<p dir=\"ltr\">Actual loan processing time and approval depend on:</p>\r\n\r\n<ol>\r\n	<li dir=\"ltr\">\r\n	<p dir=\"ltr\">Lender policies</p>\r\n	</li>\r\n	<li dir=\"ltr\">\r\n	<p dir=\"ltr\">Document verification</p>\r\n	</li>\r\n	<li dir=\"ltr\">\r\n	<p dir=\"ltr\">Customer profile</p>\r\n	</li>\r\n</ol>\r\n\r\n<hr />\r\n<h1 dir=\"ltr\"><span style=\"font-size:18px\"><strong>11. Intellectual Property</strong></span></h1>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p dir=\"ltr\">All content on QuikBorrow.com, including:</p>\r\n\r\n<ol>\r\n	<li dir=\"ltr\">\r\n	<p dir=\"ltr\">Website design</p>\r\n	</li>\r\n	<li dir=\"ltr\">\r\n	<p dir=\"ltr\">Business processes</p>\r\n	</li>\r\n	<li dir=\"ltr\">\r\n	<p dir=\"ltr\">Logos</p>\r\n	</li>\r\n	<li dir=\"ltr\">\r\n	<p dir=\"ltr\">Content</p>\r\n	</li>\r\n	<li dir=\"ltr\">\r\n	<p dir=\"ltr\">Software systems<br />\r\n	&nbsp;</p>\r\n	</li>\r\n</ol>\r\n\r\n<p dir=\"ltr\">are the intellectual property of the company.</p>\r\n\r\n<p dir=\"ltr\">Unauthorized copying, reproduction, or misuse may result in legal action.</p>\r\n\r\n<hr />\r\n<h1 dir=\"ltr\"><span style=\"font-size:18px\"><strong>12. Limitation of Liability</strong></span></h1>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p dir=\"ltr\">QuikBorrow shall not be responsible for:</p>\r\n\r\n<ol>\r\n	<li dir=\"ltr\">\r\n	<p dir=\"ltr\">Loan rejection by lenders</p>\r\n	</li>\r\n	<li dir=\"ltr\">\r\n	<p dir=\"ltr\">Misuse of information by third parties</p>\r\n	</li>\r\n	<li dir=\"ltr\">\r\n	<p dir=\"ltr\">Fraud conducted outside the platform</p>\r\n	</li>\r\n	<li dir=\"ltr\">\r\n	<p dir=\"ltr\">Delays caused by banks or financial institutions</p>\r\n	</li>\r\n	<li dir=\"ltr\">\r\n	<p dir=\"ltr\">Technical interruptions or website downtime<br />\r\n	&nbsp;</p>\r\n	</li>\r\n</ol>\r\n\r\n<p dir=\"ltr\">Users access and use the website at their own discretion and risk.</p>\r\n\r\n<hr />\r\n<h1 dir=\"ltr\"><span style=\"font-size:18px\"><strong>13. Jurisdiction</strong></span></h1>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p dir=\"ltr\">Any legal disputes related to the services or website shall fall under the exclusive jurisdiction of courts located in Jodhpur.</p>\r\n\r\n<hr />\r\n<h1 dir=\"ltr\"><span style=\"font-size:18px\"><strong>14. Eligibility</strong></span></h1>\r\n\r\n<p dir=\"ltr\">&nbsp;</p>\r\n\r\n<p dir=\"ltr\">Users must be 18 years or older to access and use the services offered on <a href=\"http://quikborrow.com\">QuikBorrow.com</a>.</p>\r\n\r\n<p dir=\"ltr\">By using the website, you confirm that you meet this requirement.</p>\r\n\r\n<p dir=\"ltr\">&nbsp;</p>\r\n\r\n<hr />\r\n<h1 dir=\"ltr\"><span style=\"font-size:18px\"><strong>15. Changes to Terms</strong></span></h1>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p dir=\"ltr\">The company reserves the right to:</p>\r\n\r\n<ol>\r\n	<li dir=\"ltr\">\r\n	<p dir=\"ltr\">Modify</p>\r\n	</li>\r\n	<li dir=\"ltr\">\r\n	<p dir=\"ltr\">Update</p>\r\n	</li>\r\n	<li dir=\"ltr\">\r\n	<p dir=\"ltr\">Revise<br />\r\n	&nbsp;</p>\r\n	</li>\r\n</ol>\r\n\r\n<p dir=\"ltr\">these Terms &amp; Conditions at any time.</p>\r\n\r\n<p dir=\"ltr\">Users are responsible for reviewing the latest version available on the website.</p>\r\n\r\n<hr />\r\n<h1 dir=\"ltr\"><span style=\"font-size:18px\"><strong>16. Final Agreement</strong></span></h1>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p dir=\"ltr\">By accessing, registering, or using QuikBorrow.com, you confirm that:</p>\r\n\r\n<ol>\r\n	<li dir=\"ltr\">\r\n	<p dir=\"ltr\">You have read and understood the Terms &amp; Conditions</p>\r\n	</li>\r\n	<li dir=\"ltr\">\r\n	<p dir=\"ltr\">You accept them without limitation</p>\r\n	</li>\r\n</ol>\r\n\r\n<p>You agree to comply with all policies mentioned on the website</p>', '2024-01-26 12:27:05', 1),
(3, 'disclaimer', '<p dir=\"ltr\">The website <strong>QuikBorrow </strong>available at <a href=\"http://quikborrow.com\">quikborrow.com</a>&nbsp;is operated and presented for<strong> general informational and service facilitation purposes only</strong>. By accessing or using the Website, users acknowledge and agree to the terms outlined in this disclaimer.</p>\r\n\r\n<p dir=\"ltr\"><strong>QuikBorrow </strong>does not provide any guarantee or representation, whether express or implied, regarding the <strong>accuracy, reliability, completeness, suitability, or timeliness</strong> of the information, services, or content displayed on the Website. All information and materials are provided on an<strong> &ldquo;as available&rdquo; </strong>basis and may be modified or updated without prior notice.</p>\r\n\r\n<p dir=\"ltr\">Nothing on the <strong>QuikBorrow </strong>Website should be interpreted as<strong> legal, financial, tax, investment, or professional advice.</strong> Users are encouraged to independently assess the information provided and exercise their own judgment before making any financial or transactional decisions.</p>\r\n\r\n<p dir=\"ltr\">By using the <strong>QuikBorrow </strong>Website, you acknowledge that you are accessing and utilizing the services <strong>at your own discretion and risk</strong>. QuikBorrow shall not be responsible for any outcomes, losses, or decisions made based on the information available on the Website.</p>\r\n\r\n<p dir=\"ltr\">The content available on the Website must <strong>not be interpreted as a solicitation, recommendation, endorsement, or offer</strong> by <strong>QuikBorrow </strong>to purchase, sell, or deal in any financial product or instrument in any jurisdiction where such activity may be restricted or unlawful.</p>\r\n\r\n<p dir=\"ltr\"><strong>QuikBorrow </strong>operates as a <strong>service facilitation platform</strong> and does not assume ownership, responsibility, or liability for any transactions, agreements, or arrangements that may occur between users and third-party financial institutions or lenders.</p>\r\n\r\n<p dir=\"ltr\">Users further acknowledge that after submitting their details on the <strong>QuikBorrow </strong>Website for any purpose, the company will <strong>not be responsible for any misuse of such information caused by external or unauthorized factors beyond its control</strong>.</p>\r\n\r\n<p>Users are advised to review the<strong> Terms &amp; Conditions, Privacy Policy, and other applicable policies </strong>available on the Website before using the services offered by <strong>QuikBorrow</strong>.</p>', '2024-01-26 12:27:54', 1),
(4, 'refund-policy', '<h3 dir=\"ltr\"><span style=\"font-size:18px\"><strong>Eligibility for Refund Requests</strong></span></h3>\r\n\r\n<p>Customers may request a refund under the following conditions:<br />\r\n&nbsp;</p>\r\n\r\n<p dir=\"ltr\"><strong>1. Refund Request Within 48 Hours</strong><br />\r\nA refund request must be submitted within 48 hours of purchasing the subscription plan by sending an email from the registered email address to <a href=\"mailto:info@quikborrow.com?subject=Refund%20Regarding\">info@quikborrow.com</a>.</p>\r\n\r\n<p dir=\"ltr\">Once the request is verified and approved, the refund will be initiated using the same payment method used during the original transaction. Depending on the banking network or payment gateway timelines, the refunded amount may take 7&ndash;8 working days to reflect in the customer&rsquo;s account.</p>\r\n\r\n<hr />\r\n<p dir=\"ltr\"><strong>2. Language Communication Limitation</strong><br />\r\nIf a customer is unable to communicate with the company in English, Hindi, or Gujarati, they may request cancellation and apply for a refund within 48 hours of purchasing the subscription plan.</p>\r\n\r\n<hr />\r\n<p dir=\"ltr\"><strong>3. Service Availability Limitation</strong><br />\r\nIn certain regions or locations, the company&rsquo;s services may not be operational. If a customer from such a location has purchased a subscription plan, they may submit a refund request within 48 hours of the purchase.</p>\r\n\r\n<hr />\r\n<h3 dir=\"ltr\"><span style=\"font-size:18px\"><strong>Need Assistance?</strong></span></h3>\r\n\r\n<p dir=\"ltr\">For any questions or clarification regarding this policy, customers may reach out to our support team:</p>\r\n\r\n<p>● By email: <a href=\"mailto:info@quikborrow.com?subject=Refund%20Regarding\">info@quikborrow.com</a><br />\r\n● By call: <a href=\"tel:+919983933304\">+91 99839 33304</a><br />\r\n● Support Hours<strong>: </strong>10:00 AM &ndash; 5:00 PM (Business Days Only)</p>', '2024-01-26 12:27:54', 1),
(5, 'welcome-message', '<h1 dir=\"ltr\">&nbsp;</h1>\r\n\r\n<h4 dir=\"ltr\" style=\"text-align:center\"><span style=\"font-size:16px\"><strong>Happy Ganesh Visarjan</strong></span></h4>\r\n\r\n<h4 dir=\"ltr\" style=\"text-align:center\"><br />\r\n<span style=\"font-size:14px\">Hello, Our Office will Remain closed on 06/09/2025 due to Ganesh Visarjan&nbsp;Thanks, quikborrow</span></h4>', '2024-02-23 06:00:52', 2),
(6, 'account-message', '<p style=\"text-align:center\"><strong>Happy Holi</strong><strong> </strong><br />\r\nHello, our Office will remain closed on 14/03/2025 due to Holi Thanks,quikborrow</p>', '2024-02-23 06:50:30', 1),
(7, 'sa_facebookdomain', 'ya5n0hp38hmckrlkgodtdir7km303m', '2024-02-23 07:10:20', 1),
(8, 'sa_facebookpixelkey', '907301655475900', '2024-02-23 07:10:20', 1),
(9, 'sa_facebookaccesstoken', 'EAANFgKZAA9EMBRIFDcBHk2O9mX4iss3mWIjPxqbI1cqzAhgH4BEicX2yo5Rc1CAdQWLy1CvXg4ZAAU0gWL4wBK0On6E1uKksDJ4wCjaBdgBIqqmnT9P2ZCLIkRfQM7SZBBkUmSAguZCqKxwzitjRhlcYMsYaVu2nDx2MaP2asvFlpMhUpH8SFJcVLZCHXgSdz8RgZDZD', '2024-02-23 07:10:45', 1),
(10, 'sa_facebookeventname', 'Purchas', '2024-02-23 07:11:04', 1),
(11, 'sa_facebookeventid', '1424387935501060', '2024-02-23 07:11:19', 1),
(12, 'la_facebookdomain', '#', '2024-11-21 08:37:01', 1),
(13, 'la_facebookpixelkey', '3677960612345437', '2024-11-21 08:37:01', 1),
(14, 'la_facebookaccesstoken', 'EAANFgKZAA9EMBRLbQigiJL3CgCT3srj4NiEl5dZBs3VTcOSLDEy1gEPUSnSfYZCYmo0a18oGXXKOYCCJKCT37v4AYPlsNCZC8afSvtMxfQ42XV7W9a39xTrqAWZAW3OXLA9Xiut3yfS0T3Y7K6NZAXgjtEo53q6YkkEtZCLssZBUn5ieVRJ1mgZAE9lNOp0akJh91jQZDZD', '2024-11-21 08:37:01', 1),
(15, 'la_facebookeventname', 'Purchas', '2024-11-21 08:37:01', 1),
(16, 'la_facebookeventid', '1087235641135047', '2024-11-21 08:37:01', 1),
(17, 'sa-wp-remarketing', '#', '2025-02-27 20:11:42', 1),
(18, 'sa-wp-getoffer', '#', '2025-02-27 20:11:42', 1),
(19, 'sa-wp-payment-success', '#', '2025-02-27 20:11:42', 1),
(20, 'sa-wp-username-password', '#', '2025-02-27 20:11:42', 1),
(21, 'la-wp-remarketing', '#', '2025-02-27 20:11:42', 1),
(22, 'la-wp-getoffer', '#', '2025-02-27 20:11:42', 1),
(23, 'la-wp-payment-success', '#', '2025-02-27 20:11:42', 1),
(24, 'la-wp-username-password', '#', '2025-02-27 20:11:42', 1),
(25, 'self-apply', NULL, '2025-03-13 22:20:08', 1),
(26, 'loan-agent', NULL, '2025-03-13 22:20:08', 1),
(27, 'sa-senderid', 'EASYAI', '2025-05-21 20:29:37', 1),
(28, 'la-senderid', 'EASYAI', '2025-05-21 20:29:37', 1),
(29, 'common-senderid', 'EASYAI', '2025-05-21 20:31:39', 1),
(30, 'sa-senderid-otp', 'EASYAI', '2025-05-21 20:29:37', 1),
(31, 'la-senderid-otp', 'EASYAI', '2025-05-21 20:29:37', 1),
(32, 'lat-senderid', '#', '2025-07-24 09:49:41', 1),
(33, 'lat-senderid-otp', '#', '2025-07-24 09:49:41', 1),
(34, 'lat_facebookdomain', '#', '2025-08-02 10:51:01', 1),
(35, 'lat_facebookpixelkey', '#', '2025-08-02 10:50:51', 1),
(36, 'lat_facebookaccesstoken', '#', '2025-08-02 10:51:50', 1),
(37, 'lat_facebookeventname', '#', '2025-08-02 10:52:00', 1),
(38, 'lat_facebookeventid', '#', '2025-08-02 10:53:20', 1);

-- --------------------------------------------------------

--
-- Table structure for table `interakt_settings`
--

CREATE TABLE `interakt_settings` (
  `id` int(11) NOT NULL,
  `rec_date` datetime NOT NULL DEFAULT current_timestamp(),
  `product` varchar(255) NOT NULL COMMENT 'SA, LA',
  `type` varchar(199) NOT NULL COMMENT 'remarketing, getoffer, pgsuccess,pgfailed',
  `template_name` varchar(255) DEFAULT NULL,
  `img_url` text DEFAULT NULL,
  `api_key` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `interakt_settings`
--

INSERT INTO `interakt_settings` (`id`, `rec_date`, `product`, `type`, `template_name`, `img_url`, `api_key`) VALUES
(1, '2025-06-24 18:09:01', 'SA', 'remarketing', 'self_31mar_rm_1', 'https://interaktprodmediastorage.blob.core.windows.net/mediaprodstoragecontainer/ff53580f-071d-4569-b1aa-87dead6c1541/message_template_sample/eOUzQBC2ywEX/quikborrow.jpeg?se=2031-03-25T11%3A14%3A16Z&sp=rt&sv=2019-12-12&sr=b&sig=/dn/NrGO0YWjlONkCihbFSYVJKgR7STMPrFUsRvNW5k%3D', 'cEx0M2RBcUdUckpJVnR2aER0MUVrOFUzUnh0N1dBQ0VZU2FxbUptamh1TTo='),
(2, '2025-06-24 18:09:01', 'LA', 'remarketing', 'hire_3april_rm_1', 'https://interaktprodmediastorage.blob.core.windows.net/mediaprodstoragecontainer/ff53580f-071d-4569-b1aa-87dead6c1541/message_template_sample/kJZPpNrn1d1V/quikborrow_hire.jpeg?se=2031-03-28T05%3A22%3A56Z&sp=rt&sv=2019-12-12&sr=b&sig=oiIdvm5ntkC/ZspwUYbntuVY1NvYhCa%2B%2BaHlgm2TloA%3D', 'cEx0M2RBcUdUckpJVnR2aER0MUVrOFUzUnh0N1dBQ0VZU2FxbUptamh1TTo='),
(3, '2025-06-24 18:13:32', 'SA', 'getoffer', '#', '#', '#'),
(4, '2025-06-24 18:14:15', 'LA', 'getoffer', '#', '#', '#'),
(5, '2025-07-18 20:59:04', 'SA', 'blog', '#', '#', '#'),
(6, '2025-07-24 18:24:58', 'LAT', 'getoffer', '#', '#', '#'),
(7, '2025-08-07 18:28:24', 'LAT', 'remarketing', '#', '#', '#');

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` int(11) NOT NULL,
  `rec_date` datetime NOT NULL,
  `userid` int(11) NOT NULL,
  `cardid` int(11) NOT NULL,
  `inv_prefix` varchar(55) DEFAULT NULL,
  `inv_number` int(11) DEFAULT NULL,
  `inv_date` date NOT NULL,
  `inv_price` double NOT NULL DEFAULT 0,
  `inv_cgst` double NOT NULL DEFAULT 0,
  `inv_sgst` double NOT NULL DEFAULT 0,
  `inv_igst` double NOT NULL DEFAULT 0,
  `inv_grandtotal` double NOT NULL DEFAULT 0,
  `remarks` longtext DEFAULT NULL,
  `is_refund` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=not, 1=refund',
  `isdelete` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=active,1=delete'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `rec_date`, `userid`, `cardid`, `inv_prefix`, `inv_number`, `inv_date`, `inv_price`, `inv_cgst`, `inv_sgst`, `inv_igst`, `inv_grandtotal`, `remarks`, `is_refund`, `isdelete`) VALUES
(1, '2026-03-11 10:34:08', 1, 1, 'SA_', 0, '2026-03-11', 5000, 0, 0, 900, 5900, NULL, 0, 1),
(2, '2026-03-27 15:22:45', 4, 2, 'SA_', 1, '2026-03-27', 199, 17.91, 17.91, 0, 234.82, NULL, 0, 0),
(3, '2026-03-27 15:40:43', 5, 3, 'LA_', 2, '2026-03-27', 499, 44.91, 44.91, 0, 588.82, NULL, 0, 0),
(4, '2026-03-27 16:31:07', 6, 4, 'SA_', 3, '2026-03-27', 199, 17.91, 17.91, 0, 234.82, NULL, 0, 0),
(5, '2026-03-27 16:42:28', 7, 5, 'SA_', 4, '2026-03-27', 199, 17.91, 17.91, 0, 234.82, NULL, 0, 0),
(6, '2026-03-27 16:50:50', 8, 6, 'SA_', 5, '2026-03-27', 199, 17.91, 17.91, 0, 234.82, NULL, 0, 0),
(7, '2026-03-27 16:57:51', 9, 7, 'SA_', 6, '2026-03-27', 199, 17.91, 17.91, 0, 234.82, NULL, 0, 0),
(8, '2026-03-27 17:11:46', 10, 8, 'SA_', 7, '2026-03-27', 199, 17.91, 17.91, 0, 234.82, NULL, 0, 1),
(9, '2026-03-28 11:57:55', 11, 9, 'SA_', 8, '2026-03-28', 199, 0, 0, 35.82, 234.82, NULL, 0, 0),
(10, '2026-03-28 17:32:51', 12, 10, 'SA_', 9, '2026-03-28', 199, 0, 0, 35.82, 234.82, NULL, 0, 0),
(11, '2026-03-30 16:27:31', 4, 11, 'LA_', 10, '2026-03-30', 499, 44.91, 44.91, 0, 588.82, NULL, 0, 0),
(12, '2026-03-30 17:03:50', 4, 12, 'LA_', 11, '2026-03-30', 499, 44.91, 44.91, 0, 588.82, NULL, 0, 0),
(13, '2026-03-30 17:10:22', 10, 13, 'LA_', 12, '2026-03-30', 499, 44.91, 44.91, 0, 588.82, NULL, 0, 1),
(14, '2026-03-30 17:19:11', 10, 14, 'LA_', 13, '2026-03-30', 499, 44.91, 44.91, 0, 588.82, NULL, 0, 1),
(15, '2026-03-31 11:40:51', 14, 15, 'LA_', 14, '2026-03-31', 499, 44.91, 44.91, 0, 588, NULL, 0, 0),
(16, '2026-04-02 17:50:00', 18, 16, 'LA_', 15, '2026-04-02', 499, 0, 0, 89.82, 588, NULL, 0, 0),
(17, '2026-04-07 12:04:05', 20, 17, 'SA_', 16, '2026-04-07', 199, 0, 0, 35.82, 234, NULL, 0, 1),
(18, '2026-04-07 12:52:36', 23, 18, 'LA_', 17, '2026-04-07', 499, 44.91, 44.91, 0, 588, NULL, 0, 1),
(19, '2026-04-08 16:34:11', 24, 19, 'SA_', 18, '2026-04-08', 199, 0, 0, 35.82, 234, NULL, 0, 1),
(20, '2026-04-10 12:48:14', 25, 20, 'SA_', 19, '2026-04-10', 0, 0, 0, 0, 0, NULL, 0, 0),
(21, '2026-04-13 15:09:00', 28, 21, 'SA_', 20, '2026-04-13', 199, 0, 0, 35.82, 234, NULL, 0, 0),
(22, '2026-04-15 14:26:41', 31, 22, 'SA_', 21, '2026-04-15', 199, 17.91, 17.91, 0, 234, NULL, 0, 1),
(23, '2026-04-15 15:51:45', 34, 23, 'LA_', 22, '2026-04-15', 499, 0, 0, 89.82, 588, NULL, 0, 0),
(24, '2026-04-16 11:46:44', 36, 24, 'SA_', 23, '2026-04-16', 199, 0, 0, 35.82, 234, NULL, 0, 0),
(25, '2026-04-17 13:27:09', 38, 25, 'SA_', 24, '2026-04-17', 199, 0, 0, 35.82, 234, NULL, 0, 0),
(26, '2026-04-18 12:39:08', 40, 26, 'SA_', 25, '2026-04-18', 199, 0, 0, 35.82, 234, NULL, 0, 1),
(27, '2026-04-18 12:44:16', 41, 27, 'LA_', 26, '2026-04-18', 499, 0, 0, 89.82, 588, NULL, 0, 0),
(28, '2026-04-20 15:55:12', 43, 28, 'SA_', 27, '2026-04-20', 199, 0, 0, 35, 234, NULL, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(191) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `loanstatus`
--

CREATE TABLE `loanstatus` (
  `id` int(11) NOT NULL,
  `rec_date` datetime NOT NULL DEFAULT current_timestamp(),
  `statusname` varchar(256) NOT NULL,
  `priorityno` int(11) NOT NULL DEFAULT 1,
  `colorclass` varchar(50) NOT NULL,
  `isDelete` int(11) NOT NULL DEFAULT 0 COMMENT '0=No, 1=Yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `loanstatus`
--

INSERT INTO `loanstatus` (`id`, `rec_date`, `statusname`, `priorityno`, `colorclass`, `isDelete`) VALUES
(1, '2020-10-13 19:30:40', 'Approved', 2, 'success', 0),
(2, '2020-10-13 19:30:40', 'Rejected', 3, 'danger', 0),
(3, '2020-10-13 19:30:40', 'In Process', 1, 'info', 0),
(4, '2021-08-28 08:03:33', 'Query Process', 4, 'warning', 0),
(5, '2021-10-29 05:37:03', 'File Reopen', 5, 'info', 0),
(6, '2022-06-03 09:50:19', 'Verification', 1, 'success', 0),
(7, '2025-05-19 14:00:40', 'Service Calls', 1, 'info', 0),
(8, '2025-05-19 14:00:40', 'Initiated Calls', 1, 'primary', 0),
(9, '2025-05-19 14:00:51', 'Other Calls', 1, 'warning', 0),
(10, '2025-05-19 14:01:49', 'Closed', 1, 'danger', 0),
(11, '2025-07-18 15:04:21', 'Account Closed', 1, 'danger', 0);

-- --------------------------------------------------------

--
-- Table structure for table `loanstatus_remarks`
--

CREATE TABLE `loanstatus_remarks` (
  `id` int(11) NOT NULL,
  `rec_date` datetime NOT NULL DEFAULT current_timestamp(),
  `title` varchar(256) NOT NULL,
  `remarks` longtext NOT NULL,
  `statusid` int(11) NOT NULL DEFAULT 0,
  `isDelete` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `loanstatus_remarks`
--

INSERT INTO `loanstatus_remarks` (`id`, `rec_date`, `title`, `remarks`, `statusid`, `isDelete`) VALUES
(1, '2025-05-19 14:04:13', 'Other Calls', '<p>Dear Customer,&nbsp;</p>\r\n\r\n<p>We deeply thank you for calling us and letting us offer our services to you!&nbsp;</p>\r\n\r\n<p>We hope you will follow the guidance offered by our Loan Agent and apply for a personal loan seamlessly!&nbsp;</p>\r\n\r\n<p>In case you need any further assistance, please reach out to your Consultant by calling on {var_consultant_number} from Monday-Saturday (between 10 am to 5 pm &ndash; only business days).&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Thanks,&nbsp;<br />\r\nquikborrow</p>\r\n', 0, 0),
(2, '2026-03-26 15:29:18', 'Customer Initiated Call', 'Dear Customer,\r\n\r\nThank you for contacting QuikBorrow and giving us the opportunity to assist you.\r\n\r\nWe hope the information and guidance provided by our consultant will help you move forward smoothly with your loan application.\r\n\r\nIf you have any further questions, please contact your consultant at +91-9983933307 between 10:00 AM and 5:00 PM (Monday to Saturday – Business Days Only).\r\n\r\nThank you,\r\n QuikBorrow', 8, 0),
(3, '2026-03-26 15:42:15', 'Consultation Provided', 'Dear Customer,\r\n\r\nThank you for taking the time to speak with our loan consultant.\r\n\r\nWe hope the guidance shared during the conversation will assist you in proceeding smoothly with your loan application process.\r\n\r\nIf you require any additional assistance, please feel free to contact your consultant at +91-9983933307 between 10:00 AM and 5:00 PM (Monday to Saturday – Business Days Only).\r\n\r\nThank you,\r\n QuikBorrow', 7, 0),
(4, '2026-03-26 15:30:42', 'Call Back Later', 'Dear Customer,\r\n\r\nOur loan consultant attempted to connect with you today as part of the service process. As you mentioned that you were unavailable at the time and requested a callback, we have scheduled a follow-up call as per your preferred availability.\r\n\r\nWe look forward to assisting you further.\r\n\r\nIf you have any questions in the meantime, you may contact your consultant at +91-9983933307 between 10:00 AM and 5:00 PM (Monday to Saturday – Business Days Only).\r\n\r\nThank you,\r\n QuikBorrow', 9, 0),
(5, '2026-03-26 15:30:58', 'Language Issue', 'Dear Customer,\r\n\r\nOur loan consultant attempted to contact you as part of the service process; however, the discussion could not continue due to communication or language difficulties.\r\n\r\nWe request that a trusted person or representative contact us on your behalf within 24–48 hours at +91-9983933307, between 10:00 AM and 5:00 PM (Monday to Saturday – Business Days Only).', 9, 0),
(6, '2025-05-19 14:11:14', 'Not Interested / Do Not Disturb', '<p>Dear Customer,&nbsp;</p>\r\n\r\n<p>Greetings from quikborrow!&nbsp;</p>\r\n\r\n<p>As part of our service, our Loan Agent called you today, but you conveyed to us that you are not very much interested in taking our services and don&rsquo;t want us to disturb you.&nbsp;</p>\r\n\r\n<p>Though we acknowledge that you don&rsquo;t want us to call you to offer our services, it would have been great for us if we were given the opportunity to serve you!&nbsp;</p>\r\n\r\n<p>Nevertheless, in case you have a query, you can easily reach out to your Consultant by calling on {var_consultant_number} from Monday-Saturday (between 10 am to 5 pm &ndash; only business days).&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Thanks,&nbsp;<br />\r\nquikborrow</p>\r\n', 7, 0),
(7, '2025-05-19 14:11:14', 'Login Process Done (by customer)', '<p>Dear Customer,&nbsp;</p>\r\n\r\n<p>It was amazing conversing with you!&nbsp;</p>\r\n\r\n<p>We always take pride in offering effective services to our customers! Hence, we&rsquo;re super-glad today that with the help of our consultation and guidance, you were able to apply for a loan in our affiliated NBFC(s)!&nbsp;</p>\r\n\r\n<p>We look forward to serving you even further.&nbsp;</p>\r\n\r\n<p>In case you have a query, you can easily reach out to your Consultant by calling on {var_consultant_number} from Monday-Saturday (between 10 am to 5 pm &ndash; only business days).&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Thanks,<br />\r\nquikborrow</p>', 7, 0),
(8, '2026-03-26 15:36:50', 'No Reply / Not Reachable', 'Dear Customer,\r\n\r\nOur loan consultant attempted to reach you; however, your phone number was either switched off or not reachable at the time.\r\n\r\nKindly contact your consultant at +91-9983933307 between 10:00 AM and 5:00 PM (Monday to Saturday – Business Days Only) so that we can continue assisting you.\r\n\r\nThank you,\r\n QuikBorrow', 9, 0),
(9, '2025-05-20 13:16:04', 'Creditworthiness Improvement Guidelines pdf sent.', '<p>Creditworthiness Improvement Guidelines pdf sent.</p>', 0, 0),
(10, '2026-03-26 15:41:50', 'Pleasure Serving You!', '<p>Dear Customer, We hope our services guided you well. If you\'ve any queries, kindly call on 9983933307 Monday-Saturday between 10 am - 5 pm on business days. Thanks, quikborrow</p>', 10, 0),
(11, '2026-03-26 15:42:35', 'Looking forward to serving you!', '<p>Dear Customer, it would have been great if you would have given us the opportunity to serve you. Nevertheless, we really hope you will avail our services in future. If you\'ve any queries, kindly call on 9983933307Monday-Saturday between 10 am - 5 pm on business days. Thanks, quikborrow</p>', 10, 0),
(12, '2025-07-18 15:09:04', 'Successful Customer Verification', '<p>Dear Customer,\nIt was great speaking with you!\n\nWe’re glad to inform you that you’ve successfully inched closer towards making the most of our services!\n\nWe really wish our services help you abundantly!\n\nThanks,\nquikborrow</p>', 6, 0),
(13, '2026-03-26 15:43:48', 'Login Process Done (by customer)', 'Dear Customer,\r\n\r\nIt was a pleasure speaking with you.\r\n\r\nWe are glad to have assisted you with the consultation and application process through our partnered lending institutions. Thank you for choosing our platform.\r\n\r\nIf you require any further assistance, please feel free to contact your consultant at +91-{#VAR#} between 10:00 AM and 5:00 PM (Monday to Saturday – Business Days Only).\r\n\r\nThank you,\r\n QuikBorrow', 6, 0),
(14, '2026-03-26 15:41:07', 'Customer Initiated Call', '<p>Dear Customer,\r\nThanks for calling us and allowing us to serve you!\r\n\r\nWe hope you will follow the guidance offered by our Loan Expert and apply for a personal loan seamlessly!\r\n\r\nIn case you need any further assistance, please reach out to our Loan Expert by calling on +91 9983933307 from Monday-Saturday (between 10 am to 5 pm – only business days).\r\n\r\nThanks,\r\nquikborrow</p>', 6, 0),
(15, '2025-07-18 16:25:25', 'Documents Pending. Kindly Submit.', '<p>Dear Customer,</p>\n<p>Hope you’re doing well.</p>\n \n<p>As per our previous conversation, you requested us to login your file to apply for a loan – for which you were to share the required documents with us.</p>\n \n<p>We request you to share the required documents at the earliest (preferably within 3 days) so that we can take your loan application forward.</p>\n \n<p>Please share the documents through WhatsApp on {var_consultant_number}.</p>\n \n<p>Thanks,\nquikborrow</p>', 9, 0),
(16, '2025-07-18 16:35:30', 'Service Provision Period Ends', '<p>Dear Customer,\r\n\r\nIt would have been great if you had given us the opportunity to serve you.\r\n\r\nNevertheless, we really hope you will avail our services in future.\r\n\r\nIf you\'ve any queries, kindly call on 9724206519 Monday-Saturday between 10 am - 5 pm on business days.\r\n\r\nThanks,\r\nquikborrow</p>', 11, 0),
(17, '2025-07-18 16:38:39', 'Consultation Provided To Customer', '<p>Dear Customer,\r\nIt was great speaking to you!\r\n\r\nWe hope you will follow the guidance offered by our Loan Expert and apply for a personal loan seamlessly!\r\n\r\nIn case you need any further assistance, please reach out to our Loan Expert by calling on +91 97242 06519 from Monday-Saturday (between 10 am to 5 pm – only business days).\r\n\r\nThanks,\r\nquikborrow</p>', 11, 0),
(18, '2026-03-26 15:25:40', 'Customer Not Interested / Do Not Disturb Conveyed by Customer', 'Dear Customer,\r\n\r\nGreetings from QuikBorrow.\r\n\r\nOur loan consultant contacted you as part of our service process, and we understand that you are currently not interested in proceeding or receiving further communication.\r\n\r\nWe respect your preference. However, if you require assistance or wish to explore our services in the future, you may contact your consultant at +91-9983933307 between 10:00 AM and 5:00 PM (Monday to Saturday – Business Days Only).\r\n\r\nThank you,\r\n QuikBorrow', 11, 0),
(19, '2025-07-18 16:42:07', 'Customer Requested Call Back Later', '<p>Dear Customer,\r\nIt was so good to connect with you!\r\n\r\nOur Loan Expert called you today as part of our service. As you conveyed to us that you were busy/not able to talk at that moment, and wanted us to call you later; we would like to inform you that we have scheduled a call at your preferred time.\r\n\r\nLooking forward to assisting you very soon!\r\n\r\nIn case you have a query, you can easily reach out to our Loan Expert by calling on +91 97242 06519 from Monday-Saturday (between 10 am to 5 pm – only business days).\r\n\r\nThanks,\r\nquikborrow</p>', 11, 0),
(20, '2026-03-26 15:40:46', 'Customer Language Barrier', '<p>Dear Customer,\r\nGreetings from quikborrow!\r\n\r\nAs part of our service, our Loan Expert called you today, but things couldn’t go further as there was unclear or non-understandable communication/language from your end.\r\n\r\nNo worries! We kindly suggest you make a trusted person/third-party call on your behalf and communicate in an understandable language/manner. The call can be made on +91 9983933307 from Monday-Saturday (between 10 am to 5 pm – only business days).\r\n\r\nThanks,\r\nquikborrow</p>', 11, 0),
(21, '2026-03-26 15:40:00', 'Customer Not Answering / Customer Not Reachable', '<p>Dear Customer,\r\n\r\nOur Loan Expert tried calling you today, but it seems either you were not reachable or were not able to answer our call.\r\n\r\nDon’t worry! You can easily reach out to our Loan Expert by calling on +91 9983933307 from Monday-Saturday (between 10 am to 5 pm – only business days).\r\n\r\nThanks,\r\nquikborrow</p>', 11, 0),
(22, '2025-08-22 19:25:25', 'It’s Great To Help You!', '<p>Dear Customer,\nGreetings from quikborrow!\nWhen our valuable customers benefit from our services, we truly feel the best!\nIt was amazing serving you and we hope that in the future, you will give us the opportunity to serve you again.\nThanks,\nquikborrow</p>', 10, 0),
(23, '2025-08-22 19:25:25', 'It’s Great To Help You!', '<p>\nDear Customer,\nGreetings from quikborrow!\n \nWhen our valuable customers benefit from our services, we truly feel the best!\n \nIt was amazing serving you and we hope that in the future, you will give us the opportunity to serve you again.\n \nThanks,\nquikborrow\n</p>', 11, 0),
(24, '2026-03-26 15:31:43', 'Not Interested/Do Not Disturb', 'Dear Customer,\r\n\r\nGreetings from QuikBorrow.\r\n\r\nOur loan consultant contacted you as part of our service process, and we understand that you are currently not interested in proceeding or receiving further communication.\r\n\r\nWe respect your preference. However, if you require assistance or wish to explore our services in the future, you may contact your consultant at +91-9983933307 between 10:00 AM and 5:00 PM (Monday to Saturday – Business Days Only).\r\n\r\nThank you,\r\n QuikBorrow', 10, 0),
(25, '2026-03-26 15:31:27', 'Miss call', 'Dear Customer,\r\n\r\nWe noticed that you attempted to contact us. Thank you for reaching out to QuikBorrow.\r\n\r\nIf you still require assistance or wish to proceed with the application process, please contact your consultant at +91-9983933307 between 10:00 AM and 5:00 PM (Monday to Saturday – Business Days Only).\r\n\r\nThank you,\r\n QuikBorrow', 3, 0),
(26, '2026-03-26 15:34:00', 'Login process', 'Dear Customer,\r\n\r\nIt was a pleasure speaking with you.\r\n\r\nWe are glad to have assisted you with the consultation and application process through our partnered lending institutions. Thank you for choosing our platform.\r\n\r\nIf you require any further assistance, please feel free to contact your consultant at +91-9983933307 between 10:00 AM and 5:00 PM (Monday to Saturday – Business Days Only).\r\n\r\nThank you,\r\n QuikBorrow', 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `loan_applications`
--

CREATE TABLE `loan_applications` (
  `id` int(11) NOT NULL,
  `rec_date` datetime NOT NULL,
  `userid` int(11) NOT NULL DEFAULT 0,
  `loan_amount` bigint(20) NOT NULL DEFAULT 0,
  `user_type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=none, 1=salaried, 2=selfemployed',
  `loan_type` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 = personal loan, 2 = business loan',
  `monthly_income` varchar(255) NOT NULL DEFAULT '0',
  `cibilscore` int(11) NOT NULL DEFAULT 0,
  `loan_purpose` varchar(255) NOT NULL DEFAULT 'Personal Use',
  `currentemi` bigint(20) NOT NULL DEFAULT 0,
  `emibounce` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=no, 1=yes',
  `application_number` varchar(99) DEFAULT NULL,
  `loantenure` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1=New, 2=Approve, 3=Reject',
  `isDelete` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=active, 1=delete'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `loan_applications`
--

INSERT INTO `loan_applications` (`id`, `rec_date`, `userid`, `loan_amount`, `user_type`, `loan_type`, `monthly_income`, `cibilscore`, `loan_purpose`, `currentemi`, `emibounce`, `application_number`, `loantenure`, `status`, `isDelete`) VALUES
(1, '2026-04-07 12:48:44', 1, 1500000, 2, 1, '50000', 0, 'Personal Use', 5000, 0, 'iMo3glIx', 0, 1, 1),
(2, '2026-03-28 11:32:29', 2, 500000, 1, 1, '30000', 0, 'Personal Use', 1500, 0, 'F4gqLRdM', 0, 1, 0),
(3, '2026-03-24 14:01:16', 3, 500000, 1, 1, '500000', 0, 'Personal Use', 8000, 0, '0XK6GTLv', 0, 1, 1),
(4, '2026-03-30 17:03:17', 4, 500000, 1, 1, '100000', 0, 'Personal Use', 10000, 0, 'WCgZjs4N', 0, 1, 0),
(5, '2026-03-27 15:40:07', 5, 500000, 2, 1, '50000', 0, 'Personal Use', 5000, 0, 'cP91BsXN', 0, 1, 0),
(6, '2026-03-27 16:30:31', 6, 500000, 2, 1, '50000', 0, 'Personal Use', 5000, 0, 'ulyxc4aI', 0, 1, 0),
(7, '2026-03-27 16:47:07', 7, 500000, 1, 1, '50000', 0, 'Personal Use', 5000, 0, 'N6sLiYn9', 0, 1, 0),
(8, '2026-03-27 16:50:19', 8, 500000, 2, 1, '50000', 0, 'Personal Use', 5000, 0, 'a4b2tM0n', 0, 1, 0),
(9, '2026-03-27 17:01:36', 9, 500000, 2, 1, '50000', 0, 'Personal Use', 5000, 0, 'WVctN941', 0, 1, 0),
(10, '2026-03-30 17:18:43', 10, 500000, 1, 1, '50000', 0, 'Personal Use', 5000, 0, 'tYoz54G0', 0, 1, 1),
(11, '2026-03-28 11:51:30', 11, 500000, 1, 1, '100000', 0, 'Personal Use', 0, 0, 'o2d9x5Sr', 0, 1, 0),
(12, '2026-03-28 17:46:58', 12, 500000, 1, 1, '12344', 0, 'Personal Use', 123, 0, '8lMvI0js', 0, 1, 0),
(13, '2026-03-30 17:25:38', 13, 500000, 1, 1, '7890', 0, 'Personal Use', 1000, 0, 'bYkTQAfw', 0, 1, 0),
(14, '2026-03-31 11:40:02', 14, 1000000, 1, 1, '50000', 0, 'Personal Use', 5000, 0, '2vKXfMwW', 0, 1, 0),
(15, '2026-03-30 17:53:54', 15, 500000, 2, 1, '50000', 0, 'Personal Use', 5000, 0, '36REv7U2', 0, 1, 1),
(16, '2026-03-30 17:32:06', 16, 500000, 1, 1, '12345', 0, 'Personal Use', 1234, 0, 'Vw8XsGrj', 0, 1, 0),
(17, '2026-03-31 11:49:29', 17, 500000, 1, 1, '20000', 0, 'Personal Use', 2000, 0, 'f83jOTg0', 0, 1, 0),
(18, '2026-04-02 17:45:41', 18, 500000, 1, 1, '123456', 0, 'Personal Use', 1234, 0, 'ndIguS1w', 0, 1, 0),
(19, '2026-04-06 15:30:34', 19, 500000, 2, 1, '5000', 0, 'Personal Use', 100, 0, 'SGgy3wqj', 0, 1, 1),
(20, '2026-04-07 11:47:40', 20, 500000, 2, 1, '500000', 0, 'Personal Use', 3444, 0, 'v9qs5baW', 0, 1, 1),
(21, '2026-04-07 12:27:13', 21, 500000, 2, 1, '25000', 0, 'Personal Use', 5323, 0, '7Fp9n4Ny', 0, 1, 1),
(22, '2026-04-07 12:48:36', 22, 500000, 2, 1, '30000', 0, 'Personal Use', 6000, 0, 'Ju43obqw', 0, 1, 1),
(23, '2026-04-07 12:50:24', 23, 500000, 1, 1, '3000000', 0, 'Personal Use', 38888, 0, 'lA8950xE', 0, 1, 1),
(24, '2026-04-08 16:31:55', 24, 500000, 1, 1, '750000', 0, 'Personal Use', 7000, 0, 'hNHwov4L', 0, 1, 1),
(25, '2026-04-09 12:48:14', 25, 500000, 1, 1, '20000', 0, 'Personal Use', 5000, 0, 'Z01I6T7W', 0, 1, 0),
(26, '2026-04-13 11:47:20', 26, 330000, 2, 1, '40000', 0, 'Personal Use', 15000, 0, 'uQ1Wx2LA', 0, 1, 0),
(27, '2026-04-10 15:16:13', 27, 500000, 2, 1, '10000', 0, 'Personal Use', 1000, 0, 'eW5kcb4V', 0, 1, 1),
(28, '2026-04-13 15:08:01', 28, 510000, 1, 1, '35500', 0, 'Personal Use', 10000, 0, '1BwsYCnR', 0, 1, 0),
(29, '2026-04-13 15:54:47', 29, 500000, 1, 1, '15000', 0, 'Personal Use', 0, 0, 'z9r5xN2m', 0, 1, 0),
(30, '2026-04-18 08:28:25', 30, 320000, 1, 1, '8000', 0, 'Personal Use', 0, 0, 'lL1eo320', 0, 1, 0),
(31, '2026-04-15 14:21:13', 31, 620000, 1, 1, '7000', 0, 'Personal Use', 89999, 0, 'KOfHIPpm', 0, 1, 1),
(32, '2026-04-15 14:37:00', 32, 500000, 3, 2, '40000', 0, 'Personal Use', 5000, 0, '7KB26I80', 0, 1, 0),
(33, '2026-04-17 11:35:12', 33, 500000, 1, 1, '5000', 0, 'Personal Use', 4000, 0, 'BAC07wnO', 0, 1, 1),
(34, '2026-04-15 15:47:54', 34, 500000, 1, 1, '4000000', 0, 'Personal Use', 2000, 0, 'Gk9KyZNA', 0, 1, 0),
(35, '2026-04-15 18:22:54', 35, 140000, 1, 1, '100000', 0, 'Personal Use', 8000, 0, 'Hkn3E989', 0, 1, 0),
(36, '2026-04-16 11:46:05', 36, 500000, 2, 1, '25000', 0, 'Personal Use', 10000, 0, '2kYToPzb', 0, 1, 0),
(37, '2026-04-17 13:18:46', 37, 600000, 2, 1, '40000', 0, 'Personal Use', 10000, 0, 'Nx98Q4iL', 0, 1, 0),
(38, '2026-04-17 13:23:48', 38, 500000, 1, 1, '40000', 0, 'Personal Use', 12000, 0, 'juh9OYmM', 0, 1, 0),
(39, '2026-04-18 12:17:06', 39, 500000, 1, 1, '1000', 0, 'Personal Use', 10000, 0, 'MrVGkbWj', 0, 1, 1),
(40, '2026-04-18 12:36:55', 40, 500000, 1, 1, '500000', 0, 'Personal Use', 4000, 0, 'OlD427uc', 0, 1, 1),
(41, '2026-04-18 12:42:37', 41, 500000, 1, 1, '500000', 0, 'Personal Use', 20000, 0, 'c65bYwL2', 0, 1, 0),
(42, '2026-04-18 15:46:12', 42, 500000, 1, 1, '11000', 0, 'Personal Use', 0, 0, '46besYPC', 0, 1, 1),
(43, '2026-04-20 15:54:27', 43, 300000, 1, 1, '15500', 0, 'Personal Use', 0, 0, 'dPNazgKU', 0, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `loan_application_status`
--

CREATE TABLE `loan_application_status` (
  `id` int(11) NOT NULL,
  `rec_date` datetime NOT NULL DEFAULT current_timestamp(),
  `applicationid` int(11) NOT NULL,
  `statusid` int(11) NOT NULL,
  `statusdate` date DEFAULT NULL,
  `bankid` int(11) NOT NULL,
  `loanamount` int(11) DEFAULT NULL,
  `loanroi` varchar(256) DEFAULT NULL,
  `loanterms` varchar(256) DEFAULT NULL,
  `processfees` int(11) DEFAULT NULL,
  `insurance` varchar(256) DEFAULT NULL,
  `monthlyemi` int(11) DEFAULT NULL,
  `remarks` longtext NOT NULL,
  `sanction_letter` longtext DEFAULT NULL,
  `staffid` int(11) NOT NULL,
  `isDelete` int(11) NOT NULL DEFAULT 0 COMMENT '0=No, 1=Yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `loan_applied_history`
--

CREATE TABLE `loan_applied_history` (
  `id` int(11) NOT NULL,
  `rec_date` datetime NOT NULL,
  `userid` int(11) NOT NULL,
  `bankid` int(11) NOT NULL,
  `loan_amount` varchar(299) NOT NULL,
  `loan_tenure` varchar(255) NOT NULL,
  `loan_rate` varchar(255) NOT NULL,
  `loan_emi` varchar(255) NOT NULL,
  `isDelete` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lyra_entry`
--

CREATE TABLE `lyra_entry` (
  `id` int(11) NOT NULL,
  `rec_date` datetime NOT NULL DEFAULT current_timestamp(),
  `entryfor` int(11) NOT NULL DEFAULT 0 COMMENT '1=Customer,2=Channel,11=SelfApply,12=Loan Agent, 3=LA_Offer_1,4=LA_Offer_2,5=LA_Offer_3,6=SA_Offer_1,7=SA_Offer_2,8=SA_Offer_3,9=SA_Offer_4,10=LA_Offer_4',
  `userid` int(11) NOT NULL,
  `orderid` varchar(50) NOT NULL,
  `orderamount` float(11,2) NOT NULL,
  `ordernote` varchar(256) DEFAULT NULL,
  `transactionid` varchar(256) DEFAULT NULL,
  `statuscode` varchar(256) DEFAULT NULL,
  `paymentmode` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `membership_orders`
--

CREATE TABLE `membership_orders` (
  `id` int(11) NOT NULL,
  `rec_date` datetime NOT NULL DEFAULT current_timestamp(),
  `userid` int(11) NOT NULL,
  `registration_date` date DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `card_number` varchar(256) NOT NULL,
  `amount` float(11,2) NOT NULL,
  `paymentid` varchar(256) NOT NULL,
  `isActive` int(11) NOT NULL DEFAULT 1,
  `isDelete` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `membership_orders`
--

INSERT INTO `membership_orders` (`id`, `rec_date`, `userid`, `registration_date`, `expiry_date`, `card_number`, `amount`, `paymentid`, `isActive`, `isDelete`) VALUES
(1, '2026-03-11 10:34:08', 1, '2026-03-11', '2026-04-11', '0249683907576121', 5900.00, 'cash_265AnoNj6Ru7E', 1, 1),
(2, '2026-03-27 15:22:45', 4, '2026-03-27', '2026-04-27', '4671940953520823', 1.00, 'pay_SWCu1zxLCZcjvc', 1, 0),
(3, '2026-03-27 15:40:43', 5, '2026-03-27', '2026-12-27', '5032623871019749', 1.00, 'pay_SWDD249v5Vs6qm', 1, 0),
(4, '2026-03-27 16:31:07', 6, '2026-03-27', '2026-04-27', '6038234986510915', 1.00, 'pay_SWE4HRoUWTYCZr', 1, 0),
(5, '2026-03-27 16:42:28', 7, '2026-03-27', '2026-04-27', '3294647585902687', 1.00, 'pay_SWEGFtGQyMRnAV', 1, 0),
(6, '2026-03-27 16:50:50', 8, '2026-03-27', '2026-04-27', '8243970255169078', 1.00, 'pay_SWEP6V2ygufatC', 1, 0),
(7, '2026-03-27 16:57:51', 9, '2026-03-27', '2026-04-27', '1356977846040221', 1.00, 'pay_SWEWXFqKi7CGAB', 1, 0),
(8, '2026-03-27 17:11:46', 10, '2026-03-27', '2026-04-27', '1985679703844015', 1.00, 'pay_SWElEFuHdEtkbD', 1, 1),
(9, '2026-03-28 11:57:55', 11, '2026-03-28', '2026-04-28', '5385931278040264', 234.82, 'pay_SWXwmBFlHl4yqF', 1, 0),
(10, '2026-03-28 17:32:51', 12, '2026-03-28', '2026-04-28', '0837490162535129', 234.82, 'pay_SWdeJyKVX6v3bg', 1, 0),
(11, '2026-03-30 16:27:31', 4, '2026-03-30', '2026-12-30', '4241759033809675', 1.00, 'pay_SXPbpqr8ArNd2G', 1, 0),
(12, '2026-03-30 17:03:50', 4, '2026-03-30', '2026-12-30', '6463150957029827', 1.00, 'pay_SXQEB4SobH6TY5', 1, 0),
(13, '2026-03-30 17:10:22', 10, '2026-03-30', '2026-12-30', '3662145857087491', 1.00, 'pay_SXQL6ifKnOI8ho', 1, 1),
(14, '2026-03-30 17:19:11', 10, '2026-03-30', '2026-12-30', '6440985361223078', 1.00, 'pay_SXQUP7x2TPhy93', 1, 1),
(15, '2026-03-31 11:40:51', 14, '2026-03-31', '2026-12-31', '1627795335402064', 1.00, 'pay_SXjFx1n7ql8WeL', 1, 0),
(16, '2026-04-02 17:50:00', 18, '2026-04-02', '2027-01-02', '9684517429063830', 588.00, 'pay_SYccIUiDJujVhO', 1, 0),
(17, '2026-04-07 12:04:05', 20, '2026-04-07', '2026-05-07', '9702596814830741', 1.00, 'pay_SaVOV2w5KFm3z4', 1, 1),
(18, '2026-04-07 12:52:36', 23, '2026-04-07', '2027-01-07', '5708183912647064', 1.00, 'pay_SaWDluKXAJ3AN3', 1, 1),
(19, '2026-04-08 16:34:11', 24, '2026-04-08', '2026-05-08', '2794703356814015', 1.00, 'pay_SayWw1TuiJcyki', 1, 1),
(20, '2026-04-09 12:48:14', 25, '2026-04-09', '2026-05-09', '8364164300971987', 0.00, 'cash_dsJCN4LQ5nGM7', 1, 0),
(21, '2026-04-13 15:09:00', 28, '2026-04-13', '2026-05-13', '6035219249485301', 234.00, 'pay_Scvk4eCIH5kRZ6', 1, 0),
(22, '2026-04-15 14:26:40', 31, '2026-04-15', '2026-05-15', '9635740041982687', 1.00, 'pay_Sdi67zrspNY6bZ', 1, 1),
(23, '2026-04-15 15:51:45', 34, '2026-04-15', '2026-10-15', '2856874136492501', 1.00, 'pay_SdjXycdyum9ZAx', 1, 0),
(24, '2026-04-16 11:46:44', 36, '2026-04-16', '2026-05-16', '6740232741615358', 234.00, 'pay_Se3u0mgtmhroOi', 1, 0),
(25, '2026-04-17 13:27:09', 38, '2026-04-17', '2026-05-17', '1587246643871092', 234.00, 'pay_SeU6kO5E9OKWTh', 1, 0),
(26, '2026-04-18 12:39:08', 40, '2026-04-18', '2026-05-18', '5893269460415073', 1.00, 'pay_SerrjMjfA95mzF', 1, 1),
(27, '2026-04-18 12:44:16', 41, '2026-04-18', '2026-10-18', '2906963110534877', 1.00, 'pay_Serx9sgIcjBidZ', 1, 0),
(28, '2026-04-20 15:55:12', 43, '2026-04-20', '2026-05-20', '9712163824064953', 234.00, 'pay_SfiGtTS6cwxhQr', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `otp_verifications`
--

CREATE TABLE `otp_verifications` (
  `id` int(11) NOT NULL,
  `rec_date` date NOT NULL,
  `mobile` varchar(99) NOT NULL,
  `email` varchar(99) DEFAULT NULL,
  `otp` mediumint(9) NOT NULL,
  `acc_type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=none, 1=selfapply, 2=loanagent\r\n'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `otp_verifications`
--

INSERT INTO `otp_verifications` (`id`, `rec_date`, `mobile`, `email`, `otp`, `acc_type`) VALUES
(1, '2026-03-11', '9408881214', '', 7595, 2),
(2, '2026-03-12', '6358141826', '', 5609, 1),
(3, '2026-03-14', '9000000000', '', 9133, 1),
(4, '2026-03-21', '6358141826', '', 4606, 1),
(5, '2026-03-23', '9409665995', '', 4331, 2),
(6, '2026-03-23', '9409665995', '', 6757, 2),
(7, '2026-03-24', '9033149430', '', 1502, 1),
(8, '2026-03-24', '6358141826', '', 4577, 1),
(9, '2026-03-27', '9409665995', '', 9461, 2),
(10, '2026-03-27', '9974360572', '', 1030, 2),
(11, '2026-03-27', '9974360572', '', 2518, 2),
(12, '2026-03-27', '9974360572', '', 6572, 2),
(13, '2026-03-27', '9974360572', '', 3356, 2),
(15, '2026-03-27', '9974360572', '', 2301, 2),
(16, '2026-03-28', '9983933314', '', 5870, 1),
(17, '2026-03-28', '9000000001', '', 8070, 1),
(18, '2026-03-28', '8099111111', '', 7017, 1),
(19, '2026-03-30', '8810011100', '', 1818, 2),
(20, '2026-03-30', '9904466599', '', 3087, 2),
(21, '2026-03-30', '7283934596', '', 1445, 1),
(22, '2026-03-30', '9801010000', '', 3336, 2),
(23, '2026-03-31', '8909090909', '', 8713, 2),
(24, '2026-04-02', '9011100000', '', 5595, 2),
(25, '2026-04-06', '9999999999', '', 3320, 1),
(26, '2026-04-06', '9999999999', '', 7666, 1),
(27, '2026-04-07', '9983933307', '', 8727, 1),
(28, '2026-04-07', '8511127147', '', 2989, 2),
(29, '2026-04-07', '6358265226', '', 7754, 2),
(30, '2026-04-07', '6358265226', '', 7791, 2),
(31, '2026-04-07', '6358141826', '', 9995, 1),
(32, '2026-04-08', '6358141826', '', 3717, 1),
(33, '2026-04-09', '9408881214', '', 6472, 2),
(34, '2026-04-10', '6358362869', '', 9419, 1),
(35, '2026-04-10', '9974360572', '', 9233, 1),
(36, '2026-04-10', '9974360572', '', 9894, 1),
(37, '2026-04-11', '9887979131', '', 2397, 1),
(38, '2026-04-11', '9887979131', '', 9307, 1),
(39, '2026-04-11', '7340237079', '', 7272, 1),
(40, '2026-04-13', '9983933306', '', 8864, 1),
(41, '2026-04-13', '9928182860', '', 4132, 1),
(42, '2026-04-14', '9887979131', '', 9294, 1),
(43, '2026-04-14', '9887979131', '', 3692, 1),
(44, '2026-04-14', '9928102860', '', 4680, 1),
(45, '2026-04-14', '9928102860', '', 7560, 1),
(46, '2026-04-15', '9887979131', '', 1785, 1),
(47, '2026-04-15', '6358141826', '', 4005, 1),
(48, '2026-04-15', '7265993958', '', 8537, 1),
(49, '2026-04-15', '9998892746', '', 4715, 1),
(50, '2026-04-15', '6358141826', '', 6682, 1),
(51, '2026-04-15', '9983933307', '', 1024, 2),
(52, '2026-04-15', '9887979131', '', 1430, 1),
(53, '2026-04-15', '9887979131', '', 4063, 2),
(54, '2026-04-15', '8279260122', '', 1520, 2),
(55, '2026-04-15', '6202396342', '', 1646, 1),
(56, '2026-04-16', '9772068028', '', 4118, 1),
(57, '2026-04-16', '9887979131', '', 8732, 1),
(58, '2026-04-16', '8279260122', '', 9320, 1),
(59, '2026-04-16', '9829222317', '', 8949, 1),
(60, '2026-04-16', '9485887525', '', 1324, 1),
(61, '2026-04-16', '9829222317', '', 2491, 1),
(62, '2026-04-16', '9485887525', '', 9792, 1),
(63, '2026-04-17', '9829222317', '', 6604, 1),
(64, '2026-04-17', '6375723886', '', 8868, 1),
(65, '2026-04-17', '9116925310', '', 3695, 1),
(66, '2026-04-18', '7046134946', '', 2211, 2),
(67, '2026-04-18', '6358141826', '', 7642, 1),
(68, '2026-04-18', '6358141826', '', 9822, 2),
(69, '2026-04-18', '8128858228', '', 3111, 2),
(70, '2026-04-20', '9485887525', '', 4330, 1);

-- --------------------------------------------------------

--
-- Table structure for table `partner_tasks`
--

CREATE TABLE `partner_tasks` (
  `id` int(11) NOT NULL,
  `rec_date` datetime NOT NULL DEFAULT current_timestamp(),
  `assignees` int(11) NOT NULL,
  `assign_to` varchar(199) NOT NULL,
  `task_title` varchar(199) NOT NULL,
  `task_desc` longtext NOT NULL,
  `attachment` varchar(199) DEFAULT NULL,
  `priority` varchar(99) NOT NULL DEFAULT 'Low',
  `task_module` varchar(255) NOT NULL,
  `task_status` varchar(55) NOT NULL DEFAULT 'Open',
  `completion_date` datetime DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `project_name` varchar(255) NOT NULL,
  `isActive` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1=active,0=deactive',
  `isDelete` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=no,1=yes'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `paygic_entry`
--

CREATE TABLE `paygic_entry` (
  `id` int(11) NOT NULL,
  `rec_date` datetime NOT NULL DEFAULT current_timestamp(),
  `entryfor` int(11) NOT NULL DEFAULT 0 COMMENT '3 - la offer 1\r\n4 - la offer 2\r\n5 - la offer 3\r\n6 - sa offer 1\r\n7 - sa offer 2\r\n8 - sa offer 3\r\n9 - sa offer 4\r\n10 - la offer 4',
  `userid` int(11) NOT NULL,
  `orderid` varchar(50) NOT NULL,
  `orderamount` float(11,2) NOT NULL,
  `ordernote` varchar(256) DEFAULT NULL,
  `referenceid` varchar(256) DEFAULT NULL,
  `txstatus` varchar(256) DEFAULT NULL,
  `paymentmode` varchar(256) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phonepe_entry`
--

CREATE TABLE `phonepe_entry` (
  `id` int(11) NOT NULL,
  `rec_date` datetime NOT NULL DEFAULT current_timestamp(),
  `entryfor` int(11) NOT NULL DEFAULT 0 COMMENT '3 - la offer 1\r\n4 - la offer 2\r\n5 - la offer 3\r\n6 - sa offer 1\r\n7 - sa offer 2\r\n8 - sa offer 3\r\n9 - sa offer 4\r\n10 - la offer 4',
  `userid` int(11) NOT NULL,
  `orderid` varchar(50) NOT NULL,
  `orderamount` float(11,2) NOT NULL,
  `ordernote` varchar(256) DEFAULT NULL,
  `referenceid` varchar(256) DEFAULT NULL,
  `txstatus` varchar(256) DEFAULT NULL,
  `paymentmode` varchar(256) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `rec_date` datetime NOT NULL DEFAULT current_timestamp(),
  `productname` varchar(256) NOT NULL,
  `productslug` varchar(256) NOT NULL,
  `amount` float(11,2) NOT NULL,
  `offeramount` float(11,2) NOT NULL,
  `inOffer` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=No, 1=Yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `rec_date`, `productname`, `productslug`, `amount`, `offeramount`, `inOffer`) VALUES
(1, '2025-07-05 11:11:29', 'Self Apply', 'self-apply', 999.00, 199.00, 1),
(2, '2025-07-02 11:11:29', 'Hire Loan Agent', 'hire-loan-agent', 1999.00, 499.00, 1),
(3, '2025-07-02 11:11:29', 'LA Offer 1', 'la-offer-1', 1999.00, 499.00, 1),
(4, '2025-07-02 11:11:29', 'LA Offer 2', 'la-offer-2', 1999.00, 499.00, 1),
(5, '2025-07-02 11:11:29', 'LA Offer 3', 'la-offer-3', 1999.00, 499.00, 1),
(6, '2025-07-05 11:11:29', 'SA Offer 3', 'sa-offer-3', 999.00, 199.00, 1),
(7, '2025-07-05 11:11:29', 'SA Offer 2', 'sa-offer-2', 999.00, 199.00, 1),
(8, '2025-07-05 11:11:29', 'SA Offer 1', 'sa-offer-1', 999.00, 199.00, 1),
(9, '2025-07-05 11:11:29', 'SA Offer 4', 'sa-offer-4', 999.00, 199.00, 1),
(10, '2025-07-02 11:11:29', 'LA OFFER 4', 'la-offer-4', 1999.00, 499.00, 1),
(11, '2025-07-05 11:11:29', 'SA OFFER 5', 'sa-offer-5', 999.00, 199.00, 1),
(12, '2025-07-02 11:11:29', 'LA OFFER 5', 'la-offer-5', 1999.00, 499.00, 1),
(13, '2025-07-05 11:11:29', 'SA OFFER 6', 'sa-offer-6', 999.00, 199.00, 1),
(14, '2025-07-02 11:11:29', 'LA OFFER 6', 'la-offer-6', 1999.00, 499.00, 1),
(15, '2025-07-05 11:11:29', 'SA Offer 7', 'sa-offer-7', 999.00, 199.00, 1),
(16, '2025-07-31 14:42:50', 'Loan Assistant', 'loan-assistant', 1299.00, 299.00, 1),
(17, '2025-08-07 13:09:05', 'Top Offer', 'top-offer', 1299.00, 299.00, 1),
(18, '2025-08-07 13:09:44', 'Excel Offer', 'excel-offer', 1299.00, 299.00, 1),
(19, '2025-08-07 13:09:44', 'Special Offer', 'special-offer', 1299.00, 299.00, 1);

-- --------------------------------------------------------

--
-- Table structure for table `razorpayentry`
--

CREATE TABLE `razorpayentry` (
  `id` int(11) NOT NULL,
  `rec_date` datetime NOT NULL DEFAULT current_timestamp(),
  `entryfor` int(11) NOT NULL DEFAULT 0,
  `userid` int(11) NOT NULL,
  `orderid` varchar(50) NOT NULL,
  `orderamount` float(11,2) NOT NULL,
  `ordernote` varchar(256) DEFAULT NULL,
  `referenceid` varchar(256) DEFAULT NULL,
  `txstatus` varchar(256) DEFAULT NULL,
  `paymentmode` varchar(256) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `razorpayentry`
--

INSERT INTO `razorpayentry` (`id`, `rec_date`, `entryfor`, `userid`, `orderid`, `orderamount`, `ordernote`, `referenceid`, `txstatus`, `paymentmode`) VALUES
(1, '2026-03-27 15:22:45', 11, 4, 'order_SWCtc42Qvr6lha', 1.00, 'Self Apply', 'pay_SWCu1zxLCZcjvc', '100', 'razorpay'),
(2, '2026-03-27 15:36:59', 11, 4, 'order_SWD9M6Q6D0BQ9A', 1.00, 'Self Apply', NULL, NULL, NULL),
(3, '2026-03-27 15:37:03', 11, 4, 'order_SWD9R695b6TsqX', 1.00, 'Self Apply', NULL, NULL, NULL),
(4, '2026-03-27 15:40:43', 12, 5, 'order_SWDCfNzvnrboYD', 1.00, 'Hire Loan Agent', 'pay_SWDD249v5Vs6qm', '100', 'razorpay'),
(5, '2026-03-27 16:30:23', 11, 6, 'order_SWE3eLYBhxsy84', 1.00, 'Self Apply', NULL, '400', 'razorpay'),
(6, '2026-03-27 16:31:07', 11, 6, 'order_SWE3v7CHhfCX4A', 1.00, 'Self Apply', 'pay_SWE4HRoUWTYCZr', '100', 'razorpay'),
(7, '2026-03-27 16:42:28', 11, 7, 'order_SWEFxK3BY6VozD', 1.00, 'Self Apply', 'pay_SWEGFtGQyMRnAV', '100', 'razorpay'),
(8, '2026-03-27 16:47:10', 11, 7, 'order_SWELRbznKn6ScI', 1.00, 'Self Apply', NULL, '400', 'razorpay'),
(9, '2026-03-27 16:50:50', 11, 8, 'order_SWEOporaAqAhhm', 1.00, 'Self Apply', 'pay_SWEP6V2ygufatC', '100', 'razorpay'),
(10, '2026-03-27 16:57:51', 11, 9, 'order_SWEWAfMCUnpNDS', 1.00, 'Self Apply', 'pay_SWEWXFqKi7CGAB', '100', 'razorpay'),
(11, '2026-03-27 17:02:07', 11, 9, 'order_SWEakhELiy6Ygw', 1.00, 'Self Apply', 'pay_SWEb2556BcOUcY', '100', 'razorpay'),
(12, '2026-03-27 17:11:46', 11, 10, 'order_SWEkzLwOTYoM1Q', 1.00, 'Self Apply', 'pay_SWElEFuHdEtkbD', '100', 'razorpay'),
(13, '2026-03-27 17:14:58', 11, 10, 'order_SWEoK3dME1wLpU', 1.00, 'Self Apply', 'pay_SWEoaI05Ya8JT7', '100', 'razorpay'),
(14, '2026-03-27 17:18:47', 11, 10, 'order_SWEsOyPxMQ0LCz', 1.00, 'Self Apply', 'pay_SWEsbJQEhOlOy9', '100', 'razorpay'),
(15, '2026-03-27 17:23:34', 11, 10, 'order_SWExXG5lRJ70qs', 1.00, 'Self Apply', 'pay_SWExh1Gazhm515', '100', 'razorpay'),
(16, '2026-03-28 10:50:34', 11, 2, 'order_SWWnwC770nCl6c', 234.82, 'Self Apply', NULL, NULL, NULL),
(17, '2026-03-28 11:32:29', 11, 2, 'order_SWXWCwGqFbEC7L', 234.82, 'Self Apply', NULL, NULL, NULL),
(18, '2026-03-28 11:57:55', 11, 11, 'order_SWXqIPv9oGqxYU', 234.82, 'Self Apply', 'pay_SWXwmBFlHl4yqF', '100', 'razorpay'),
(19, '2026-03-28 16:42:28', 11, 12, 'order_SWcbQFeOUEIAnR', 234.82, 'Self Apply', NULL, '400', 'razorpay'),
(20, '2026-03-28 17:32:51', 11, 12, 'order_SWdSF0xN5doRv1', 234.82, 'Self Apply', 'pay_SWdeJyKVX6v3bg', '100', 'razorpay'),
(21, '2026-03-28 17:47:03', 11, 12, 'order_SWdtn9AbH2bxLh', 234.82, 'Self Apply', NULL, '400', 'razorpay'),
(22, '2026-03-30 16:27:31', 12, 4, 'order_SXPb9eoQvFSdHe', 1.00, 'Hire Loan Agent', 'pay_SXPbpqr8ArNd2G', '100', 'razorpay'),
(23, '2026-03-30 16:28:44', 11, 14, 'order_SXPdJmtGTtaPfJ', 1.00, 'Self Apply', NULL, '400', 'razorpay'),
(24, '2026-03-30 16:29:17', 12, 14, 'order_SXPdu98gX8yXJd', 1.00, 'Hire Loan Agent', NULL, '400', 'razorpay'),
(25, '2026-03-30 17:03:50', 12, 4, 'order_SXQDtBhSueoFdS', 1.00, 'Hire Loan Agent', 'pay_SXQEB4SobH6TY5', '100', 'razorpay'),
(26, '2026-03-30 17:10:22', 12, 10, 'order_SXQKuJAzbn9PDi', 1.00, 'Hire Loan Agent', 'pay_SXQL6ifKnOI8ho', '100', 'razorpay'),
(27, '2026-03-30 17:19:11', 12, 10, 'order_SXQUBkC95T5zqn', 1.00, 'Hire Loan Agent', 'pay_SXQUP7x2TPhy93', '100', 'razorpay'),
(28, '2026-03-30 17:48:29', 12, 15, 'order_SXQzSWbYPKgSwZ', 588.00, 'Hire Loan Agent', NULL, '400', 'razorpay'),
(29, '2026-03-30 17:53:59', 12, 15, 'order_SXR5MQ4n2zSiVk', 588.00, 'Hire Loan Agent', NULL, '400', 'razorpay'),
(30, '2026-03-31 11:40:51', 12, 14, 'order_SXjFXlXbRLRI6S', 1.00, 'Hire Loan Agent', 'pay_SXjFx1n7ql8WeL', '100', 'razorpay'),
(31, '2026-04-02 17:50:00', 12, 18, 'order_SYcY2Sr4PL7ixX', 588.00, 'Hire Loan Agent', 'pay_SYccIUiDJujVhO', '100', 'razorpay'),
(32, '2026-04-07 12:04:05', 11, 20, 'order_SaV7Se3s503CQH', 1.00, 'Self Apply', 'pay_SaVOV2w5KFm3z4', '100', 'razorpay'),
(33, '2026-04-07 12:27:34', 11, 21, 'order_SaVnEYtFOgBIby', 234.00, 'Self Apply', NULL, '400', 'razorpay'),
(34, '2026-04-07 12:33:37', 11, 1, 'order_SaVtI041tf8edd', 1.00, 'Self Apply', 'pay_SaVtjVye5Jkycc', '100', 'razorpay'),
(35, '2026-04-07 12:49:29', 12, 22, 'order_SaW9pGON6kMALl', 588.00, 'Hire Loan Agent', NULL, '400', 'razorpay'),
(36, '2026-04-07 12:49:22', 11, 1, 'order_SaW9xutBuGVrPx', 1.00, 'Self Apply', 'pay_SaWANm7BaNeuBS', '100', 'razorpay'),
(37, '2026-04-07 12:52:36', 12, 23, 'order_SaWBiLp6CPcLay', 1.00, 'Hire Loan Agent', 'pay_SaWDluKXAJ3AN3', '100', 'razorpay'),
(38, '2026-04-08 16:34:11', 11, 24, 'order_SayUpzLBZCz2U3', 1.00, 'Self Apply', 'pay_SayWw1TuiJcyki', '100', 'razorpay'),
(39, '2026-04-09 16:40:49', 11, 25, 'order_SbNBAFhqERhGpi', 1.00, 'Self Apply', NULL, '400', 'razorpay'),
(40, '2026-04-09 16:42:51', 12, 25, 'order_SbNDEEepn8LHop', 1.00, 'Hire Loan Agent', NULL, '400', 'razorpay'),
(41, '2026-04-10 14:31:41', 11, 26, 'order_SbjW42Tmsa0hUt', 234.00, 'Self Apply', NULL, NULL, NULL),
(42, '2026-04-10 15:14:33', 11, 27, 'order_SbkFLYn2FXQod0', 1.00, 'Self Apply', NULL, NULL, NULL),
(43, '2026-04-10 15:16:13', 11, 27, 'order_SbkH7D5uZEU92J', 1.00, 'Self Apply', NULL, NULL, NULL),
(44, '2026-04-10 15:21:24', 11, 26, 'order_SbkJ5sVeYu3VmX', 234.00, 'Self Apply', NULL, '400', 'razorpay'),
(45, '2026-04-13 11:48:05', 11, 26, 'order_ScsJpPkNXdRsqd', 234.00, 'Self Apply', NULL, '400', 'razorpay'),
(46, '2026-04-13 15:08:01', 11, 28, 'order_Scvjo5re0EWOsE', 234.00, 'Self Apply', NULL, NULL, NULL),
(47, '2026-04-13 15:09:00', 11, 28, 'order_ScvjomRUDASk4c', 234.00, 'Self Apply', 'pay_Scvk4eCIH5kRZ6', '100', 'razorpay'),
(48, '2026-04-13 20:31:33', 11, 30, 'order_Sd1FYt2Oa2kEns', 234.00, 'Self Apply', NULL, NULL, NULL),
(49, '2026-04-14 17:55:56', 11, 30, 'order_SdN8Iu2OiLuACA', 234.00, 'Self Apply', NULL, NULL, NULL),
(50, '2026-04-15 00:10:05', 11, 30, 'order_SdTVWvoFZE3lDN', 234.00, 'Self Apply', NULL, NULL, NULL),
(51, '2026-04-15 11:52:25', 12, 30, 'order_SdfTRJERSKbwdd', 588.00, 'Hire Loan Agent', NULL, NULL, NULL),
(52, '2026-04-15 13:04:06', 11, 30, 'order_SdghA7fqin41Lf', 234.00, 'Self Apply', NULL, NULL, NULL),
(53, '2026-04-15 14:26:40', 11, 31, 'order_Sdi0cDGgPav5yo', 1.00, 'Self Apply', 'pay_Sdi67zrspNY6bZ', '100', 'razorpay'),
(54, '2026-04-15 14:37:26', 11, 32, 'order_SdiHI6KtWjrDuh', 234.00, 'Self Apply', NULL, '400', 'razorpay'),
(55, '2026-04-15 15:51:45', 12, 34, 'order_SdjUBLywY9EaF8', 1.00, 'Hire Loan Agent', 'pay_SdjXycdyum9ZAx', '100', 'razorpay'),
(56, '2026-04-15 16:34:55', 11, 30, 'order_SdkHqCweNqkwzq', 234.00, 'Self Apply', NULL, NULL, NULL),
(57, '2026-04-15 17:01:22', 11, 33, 'order_SdkjO7dFa9nV7V', 1.00, 'Self Apply', NULL, '400', 'razorpay'),
(58, '2026-04-15 17:13:54', 11, 30, 'order_Sdkx1nMmaF2yZb', 234.00, 'Self Apply', NULL, NULL, NULL),
(59, '2026-04-15 18:31:08', 11, 30, 'order_SdmGc7sWeG37Ih', 234.00, 'Self Apply', NULL, NULL, NULL),
(60, '2026-04-16 09:30:01', 12, 30, 'order_Se1a8hGsmr3QzZ', 588.00, 'Hire Loan Agent', NULL, NULL, NULL),
(61, '2026-04-16 11:46:44', 11, 36, 'order_Se3trM3yUuN3p4', 234.00, 'Self Apply', 'pay_Se3u0mgtmhroOi', '100', 'razorpay'),
(62, '2026-04-17 11:35:12', 11, 33, 'order_SeSFUY7oCvzSJK', 1.00, 'Self Apply', NULL, NULL, NULL),
(63, '2026-04-17 13:19:32', 11, 37, 'order_SeU0u2hc1W4I73', 234.00, 'Self Apply', NULL, '400', 'razorpay'),
(64, '2026-04-17 13:27:09', 11, 38, 'order_SeU6CTh8hljKdH', 234.00, 'Self Apply', 'pay_SeU6kO5E9OKWTh', '100', 'razorpay'),
(65, '2026-04-18 08:28:25', 11, 30, 'order_SenbIitgZxbjmN', 234.00, 'Self Apply', NULL, NULL, NULL),
(66, '2026-04-18 12:39:08', 11, 40, 'order_SerpoIni9z7uuh', 1.00, 'Self Apply', 'pay_SerrjMjfA95mzF', '100', 'razorpay'),
(67, '2026-04-18 12:44:16', 12, 41, 'order_ServotqDzArKdF', 1.00, 'Hire Loan Agent', 'pay_Serx9sgIcjBidZ', '100', 'razorpay'),
(68, '2026-04-18 15:45:00', 11, 42, 'order_Sev2TKwDfSzb3z', 234.00, 'Self Apply', NULL, NULL, NULL),
(69, '2026-04-18 15:46:12', 12, 42, 'order_Sev3ke9WwaCRQZ', 588.00, 'Hire Loan Agent', NULL, NULL, NULL),
(70, '2026-04-20 15:55:12', 11, 43, 'order_SfiGiEJJeNCWe9', 234.00, 'Self Apply', 'pay_SfiGtTS6cwxhQr', '100', 'razorpay');

-- --------------------------------------------------------

--
-- Table structure for table `refunds`
--

CREATE TABLE `refunds` (
  `id` int(11) NOT NULL,
  `rec_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `userid` int(11) NOT NULL,
  `invoiceid` int(11) NOT NULL,
  `ref_date` date DEFAULT NULL,
  `ref_number` varchar(256) NOT NULL,
  `ref_price` float(11,2) NOT NULL,
  `ref_cgst` float(11,2) NOT NULL,
  `ref_sgst` float(11,2) NOT NULL,
  `ref_igst` float(11,2) NOT NULL,
  `ref_grandtotal` float(11,2) NOT NULL,
  `paymentid` varchar(256) DEFAULT NULL,
  `remarks` varchar(256) DEFAULT NULL,
  `isDelete` int(11) NOT NULL DEFAULT 0 COMMENT '0=No, 1=Yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roipackages`
--

CREATE TABLE `roipackages` (
  `id` int(11) NOT NULL,
  `rec_date` datetime NOT NULL DEFAULT current_timestamp(),
  `bankid` int(11) NOT NULL,
  `roi` float(11,2) NOT NULL,
  `termsyears` float(11,2) NOT NULL,
  `termsmonths` int(11) NOT NULL,
  `isDelete` int(11) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `roipackages`
--

INSERT INTO `roipackages` (`id`, `rec_date`, `bankid`, `roi`, `termsyears`, `termsmonths`, `isDelete`, `created_at`, `updated_at`) VALUES
(1, '2024-02-23 17:40:12', 1, 10.00, 4.00, 48, 0, '2024-02-23 12:10:12', '2024-02-23 12:48:56'),
(2, '2024-02-23 17:48:17', 2, 11.15, 3.00, 36, 0, '2024-02-23 12:18:17', '2024-02-23 12:48:34');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `rec_date` datetime NOT NULL,
  `services_name` varchar(255) NOT NULL,
  `isActive` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 = active, 0 = no active',
  `isDelete` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 = active, 1 = delete'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(191) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('eg0FbQZ9uCtsgm3Mii0UHTNkfrIq4RNSdPztLyST', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiSzJGekphTmVJd014Y1RKbUFTS0Z6SnRQNnBpWklEQkVpNW5mNEZzMiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9kYXNoYm9hcmQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO3M6MzoidXJsIjthOjE6e3M6ODoiaW50ZW5kZWQiO3M6MzU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9zdGFmZi1hY2NvdW50Ijt9fQ==', 1771328009);

-- --------------------------------------------------------

--
-- Table structure for table `site_options`
--

CREATE TABLE `site_options` (
  `id` int(11) NOT NULL,
  `rec_date` datetime NOT NULL,
  `option_key` varchar(255) NOT NULL,
  `option_value` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `site_options`
--

INSERT INTO `site_options` (`id`, `rec_date`, `option_key`, `option_value`) VALUES
(1, '2026-04-20 15:55:12', 'newinvoiceno', '28'),
(2, '2024-04-18 11:05:19', 'account-msg-customer', 'For the Customers who have given other customer referrals to the company, it would be compulsory for them to submit their kyc Documents to the company within 30 days. If not submitted, all the payouts of the Customer will be automatically cancelled To  get the cancelled payout, you can contact the company and discuss it.'),
(3, '2025-02-27 20:11:42', 'sa-wp-remarketing', '#'),
(4, '2025-02-27 20:11:42', 'sa-wp-getoffer', '#'),
(5, '2025-02-27 20:11:42', 'sa-wp-payment-success', '#'),
(6, '2025-02-27 20:11:42', 'sa-wp-username-password', '#'),
(7, '2025-02-27 20:11:42', 'la-wp-remarketing', '#'),
(8, '2025-02-27 20:11:42', 'la-wp-getoffer', '#'),
(9, '2025-02-27 20:11:42', 'la-wp-payment-success', '#'),
(10, '2025-02-27 20:11:42', 'la-wp-username-password', '#'),
(11, '2025-06-03 14:46:05', 'last_agent_id', '4'),
(12, '2025-07-07 13:16:51', 'last_self_agent_id', '3'),
(13, '2025-07-31 09:03:19', 'last_assistant_id', '0');

-- --------------------------------------------------------

--
-- Table structure for table `sms_list`
--

CREATE TABLE `sms_list` (
  `id` int(11) NOT NULL,
  `rec_date` datetime NOT NULL DEFAULT current_timestamp(),
  `type` tinyint(4) NOT NULL,
  `slug` varchar(55) DEFAULT NULL,
  `title` varchar(256) NOT NULL,
  `message` mediumtext NOT NULL,
  `isActive` tinyint(4) NOT NULL COMMENT '1=active, 0=not active'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `sms_list`
--

INSERT INTO `sms_list` (`id`, `rec_date`, `type`, `slug`, `title`, `message`, `isActive`) VALUES
(1, '2026-04-04 14:32:06', 1, 'get_offer', 'Get Offer', 'You\'re eligible for a pre-approved loan of Rs.{#varamount#}. Get funds in just 30 minutes. Limited-time offer. Apply now: https://kbzp.in/EASYAI/hxjaq QuikBorrow', 1),
(2, '2026-04-04 12:38:30', 1, 'remarketing_sms', 'Remarketing SMS', 'You\'re eligible for a pre-approved loan of Rs.{#varamount#}. Get funds in just 30 minutes. Limited-time offer. Apply now: https://kbzp.in/EASYAI/hxjaq QuikBorrow', 1),
(3, '2026-04-08 14:18:39', 1, 'payment_unsuccessful', 'Payment Unsuccessful', 'Sorry, your payment for QuikBorrow Subscription was not successful. Try Another Payment Method here https://kbzp.in/EASYAI/cswck QuikBorrow', 1),
(4, '2026-04-04 11:22:41', 1, 'payment_successful', 'Payment Successful', 'Dear Customer, Your Payment for Self-Apply has been successful! Check your reg. email and login to customer portal to proceed ahead. Thanks, QuikBorrow', 1),
(6, '2026-04-04 14:32:39', 2, 'get_offer', 'Get Offer', 'You\'re eligible for a pre-approved loan of Rs.{#varamount#}. Get funds in just 30 minutes. Limited-time offer. Apply now: https://kbzp.in/EASYAI/hxjaq QuikBorrow', 1),
(5, '2026-04-18 15:59:58', 1, 'forgot_password', 'Forgot Password', 'Hello{#varamount#} Your QuikBorrow account\'s new password is {#varamount#}. Do not share it with anyone. Thanks, QuikBorrow', 1),
(7, '2026-04-04 14:26:33', 2, 'remarketing_sms', 'Remarketing SMS', 'Congrats! Your Rs.{#varamount#} pre-approved loan is processed. Get money in your bank A/C within 30 mins. Apply now: https://kbzp.in/EASYAI/waacr QuikBorrow', 1),
(8, '2026-04-08 14:17:55', 2, 'payment_unsuccessful', 'Payment Unsuccessful', 'Sorry, your payment for QuikBorrow Subscription was not successful. Try Another Payment Method here https://kbzp.in/EASYAI/fzyhi QuikBorrow', 1),
(9, '2026-04-04 11:21:33', 2, 'payment_successful', 'Payment Successful', 'Dear Customer, Your Payment for Hire Agent has been successful! Check your reg. email and login to customer portal to proceed ahead. Thanks, QuikBorrow', 1),
(10, '2026-04-18 15:56:48', 2, 'forgot_password', 'Forgot Password', 'Hello{#varamount#} Your QuikBorrow account\'s new password is {#varamount#}. Do not share it with anyone. Thanks, QuikBorrow', 1),
(11, '2026-04-07 15:35:03', 3, 'ticket_raised', 'Support Request  – Ticket Raised', 'Your request ticket has been raised in our system with the Ticket Id: {#varamount#}. We will contact you within 24-48 hours for a follow-up. QuikBorrow', 1),
(12, '2026-04-07 15:35:17', 3, 'ticket_underprocess', 'Support Request – Under Process', 'Hello, Your request with Ticket ID: {#varamount#} is under process. The query will be solved soon and it will be informed to you shortly. Thanks, QuikBorrow', 1),
(13, '2026-04-07 15:35:46', 3, 'ticket_noresponse', 'Support Request – No-response Closed', 'Hello, Your request with Ticket Id: {#varamount#} is closed as the company tried calling you for the last 3 days but got no response. Thanks, QuikBorrow', 1),
(14, '2026-04-07 15:36:12', 3, 'ticket_solved', 'Support Request – Solved', 'Hello, Your request with Ticket Id: {#varamount#} is Solved. We thank you for the opportunity to serve you. Thanks, QuikBorrow', 1),
(15, '2026-04-07 15:34:48', 3, 'ticket_closed', 'Support Request – Closed', 'Hello, Your request with Ticket Id: {#varamount#} is closed as the company tried calling you for the last 3 days but got no response. Thanks, QuikBorrow', 1),
(16, '2026-03-31 16:44:52', 1, 'sales_cycle_days', 'After Sales Cycle - 1,2,3,5 days', 'Dear Customer, We Hope You\'ve Utilised Loan Self Login links. If not, click https://kbzp.in/EASYAI/owpzx and check Pre-Approved Loan section. Thanks! QuikBorrow', 1),
(17, '2026-03-25 13:37:58', 1, 'sales_cycle_closed', 'After Sales Cycle - Closed', 'Dear Customer, We hope our services guided you well. If you\'ve any queries, kindly call on 9983933307 Mon-Sat 10am-5pm on business days. Thanks, QuikBorrow', 1),
(18, '2026-03-25 12:36:27', 2, 'sales_cycle_closed', 'After Sales Cycle - Closed', 'Dear Customer, We hope our services guided you well. If you\'ve any queries, kindly call on 9983933307 Mon-Sat 10am-5pm on business days. Thanks, QuikBorrow', 1),
(19, '2026-04-07 17:19:36', 2, 'app_remarks_add', 'Application Remarks Add', 'Dear Customer, the latest update of your loan file is displayed on your customer portal & sent to your email id. Check here https://kbzp.in/EASYAI/owpzx QuikBorrow', 1),
(20, '2026-04-04 12:58:01', 1, 'verified_customer', 'Verified Customer', 'Dear Customer, We hope you will make the most of the guidance provided by our Company Executive. For any further assistance, please call on 9983933307from Monday-Saturday between (10:00 AM to 5:00 PM) only business days. Thanks, QuikBorrow', 1),
(21, '2026-04-07 15:37:32', 4, 'get_offer_', 'Get Offer', 'Congrats! Your Rs.{#varamount#}/- Pre-Approved Loan Processed Successfully. Get Money in Your Bank A/C 30 minutes. Apply Now {#varamount#} QuikBorrow', 1),
(23, '2026-04-07 15:36:51', 4, 'get_offer', 'Get Offer', 'Congrats! Your Rs.{#varamount#}/- Pre-Approved Loan Processed Successfully. Get Money in Your Bank A/C 30 minutes. Apply Now {#varamount#} QuikBorrow', 1),
(24, '2026-03-24 14:07:29', 4, 'payment_unsuccessful', 'Payment Unsucessful', 'Sorry, your payment for QuikBorrow Subscription was not successful. Try Another Payment Method here {#var#} QuikBorrow', 1),
(25, '2026-03-23 16:20:55', 4, 'payment_successful', 'Payment Successful', 'Dear Customer, Your Payment for Loan Assistant Plan has been successful! Check your reg. email and login to customer portal to proceed ahead. Thanks,QuikBorrow', 1),
(26, '2026-04-07 16:54:37', 4, 'forgot_password', 'Forget Password', '#', 1),
(27, '2026-03-23 16:20:22', 4, 'pre_approved', 'Pre Approved', '#', 1),
(28, '2026-04-07 15:38:00', 4, 'remarketing_sms', 'Remarketing SMS', 'You\'re Eligible For Rs.{#varamount#}/- Pre-Approved Loan Offer. Disbursement in Just 30 minutes. Limited Time Offer Only. Apply Now {#varamount#} QuikBorrow', 1),
(29, '2026-03-23 15:59:13', 4, 'sales_cycle_closed', 'After Sales Cycle - Closed', '#', 1),
(30, '2026-03-31 15:59:53', 2, 'sales_cycle_days', 'After Sales Cycle - 1,2,3,5 days', 'Dear Customer, We Hope You\'ve Utilised Loan Self Login links. If not, click https://kbzp.in/EASYAI/owpzx and check Pre-Approved Loan section. Thanks! QuikBorrow', 1),
(31, '2026-03-23 16:28:19', 4, 'sales_cycle_days', 'After Sales Cycle - 1,2,3,5 days', '#', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sms_log`
--

CREATE TABLE `sms_log` (
  `id` int(11) NOT NULL,
  `rec_date` datetime NOT NULL DEFAULT current_timestamp(),
  `crontype` varchar(50) NOT NULL,
  `parentid` int(11) NOT NULL,
  `cronname` varchar(255) NOT NULL,
  `msgcount` int(11) NOT NULL,
  `msgresponse` longtext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `sms_log`
--

INSERT INTO `sms_log` (`id`, `rec_date`, `crontype`, `parentid`, `cronname`, `msgcount`, `msgresponse`) VALUES
(1, '2026-04-06 15:45:03', 'Hire Agent Lead Whatsapp', 12, 'Whatsapp Day - 0', 3, '9408881214-[\"Your wallet doesn\'t have sufficient balance. Please recharge your Interakt wallet immediately to continue sending more campaign notifications.\"]|9974360572-[\"Your wallet doesn\'t have sufficient balance. Please recharge your Interakt wallet immediately to continue sending more campaign notifications.\"]|7283934596-[\"Your wallet doesn\'t have sufficient balance. Please recharge your Interakt wallet immediately to continue sending more campaign notifications.\"]|'),
(2, '2026-04-06 15:45:05', 'Self Apply Lead Whatsapp', 11, 'Whatsapp Day - 0', 3, '9408881214-[\"Your wallet doesn\'t have sufficient balance. Please recharge your Interakt wallet immediately to continue sending more campaign notifications.\"]|9974360572-[\"Your wallet doesn\'t have sufficient balance. Please recharge your Interakt wallet immediately to continue sending more campaign notifications.\"]|9999999999-[\"Your wallet doesn\'t have sufficient balance. Please recharge your Interakt wallet immediately to continue sending more campaign notifications.\"]|'),
(3, '2026-04-06 23:00:04', 'Hire Agent Lead Whatsapp', 12, 'Whatsapp Day - 0', 3, '9408881214-{\"result\":true,\"message\":\"Message queued for sending. Check webhook for delivery status\",\"id\":\"6cce32bd-58ef-40c7-adc7-57b760094eca\"}|9974360572-{\"result\":true,\"message\":\"Message queued for sending. Check webhook for delivery status\",\"id\":\"ee185ebf-4fd7-4b52-91d1-4179556237c1\"}|7283934596-{\"result\":true,\"message\":\"Message queued for sending. Check webhook for delivery status\",\"id\":\"f8cdbf37-5ce2-4a03-9303-3c178180dcf8\"}|'),
(4, '2026-04-06 23:15:04', 'Self Apply Lead Whatsapp', 11, 'Whatsapp Day - 0', 3, '9408881214-{\"result\":true,\"message\":\"Message queued for sending. Check webhook for delivery status\",\"id\":\"0c64b1fe-bd61-444f-af5d-26365e958d03\"}|9974360572-{\"result\":true,\"message\":\"Message queued for sending. Check webhook for delivery status\",\"id\":\"46c0567f-1e1b-428f-9518-1b870311238c\"}|9999999999-{\"result\":true,\"message\":\"Message queued for sending. Check webhook for delivery status\",\"id\":\"2fb962e5-6d6d-4f3d-97e8-34ad67c4c59b\"}|'),
(5, '2026-04-07 09:00:05', 'Hire Agent Lead Whatsapp', 12, 'Whatsapp Day - 1', 3, '9408881214-{\"result\":true,\"message\":\"Message queued for sending. Check webhook for delivery status\",\"id\":\"c1b82125-2960-4593-8728-deefb9ca4c3e\"}|9974360572-{\"result\":true,\"message\":\"Message queued for sending. Check webhook for delivery status\",\"id\":\"a9d33e16-4d9f-4343-ac3e-a03aa7d8bb6a\"}|7283934596-{\"result\":true,\"message\":\"Message queued for sending. Check webhook for delivery status\",\"id\":\"39b01a56-8722-4b1e-a60d-570356591662\"}|'),
(6, '2026-04-07 09:15:05', 'Self Apply Lead Whatsapp', 11, 'Whatsapp Day - 1', 3, '9408881214-{\"result\":true,\"message\":\"Message queued for sending. Check webhook for delivery status\",\"id\":\"ba7de7db-1b3e-4443-a1b7-2c92304a571e\"}|9974360572-{\"result\":true,\"message\":\"Message queued for sending. Check webhook for delivery status\",\"id\":\"5efdbf7b-d5df-46a7-817a-000e82677fa7\"}|9999999999-{\"result\":true,\"message\":\"Message queued for sending. Check webhook for delivery status\",\"id\":\"1f8e00b8-d39b-45f7-ab9b-2a9880f09807\"}|'),
(7, '2026-04-07 13:15:04', 'Self Apply Lead Whatsapp', 11, 'Whatsapp Day - 10', 3, '9408881214-{\"result\":true,\"message\":\"Message queued for sending. Check webhook for delivery status\",\"id\":\"463da693-9152-4630-aa83-b07825d12bbc\"}|9974360572-{\"result\":true,\"message\":\"Message queued for sending. Check webhook for delivery status\",\"id\":\"e1ecd391-a2d0-41ca-a32b-ac58614331fe\"}|9033149430-{\"result\":true,\"message\":\"Message queued for sending. Check webhook for delivery status\",\"id\":\"4016660e-c89f-44ba-99b0-d66c6e4a19b6\"}|'),
(8, '2026-04-07 18:15:05', 'Self Apply Lead Whatsapp', 11, 'Whatsapp Day - 10', 3, '9408881214-{\"result\":true,\"message\":\"Message queued for sending. Check webhook for delivery status\",\"id\":\"1cabe35e-fb35-4207-8607-a433770383d8\"}|9974360572-{\"result\":true,\"message\":\"Message queued for sending. Check webhook for delivery status\",\"id\":\"9c188b2b-76bc-4152-8578-fa7a209235d5\"}|9033149430-{\"result\":true,\"message\":\"Message queued for sending. Check webhook for delivery status\",\"id\":\"818519a6-e16e-4c22-a635-3491da7d1936\"}|'),
(9, '2026-04-07 22:00:04', 'Hire Agent Lead Whatsapp', 12, 'Whatsapp Day - 1', 3, '9408881214-{\"result\":true,\"message\":\"Message queued for sending. Check webhook for delivery status\",\"id\":\"d75ca379-e28c-4c44-a323-806c2c5b1f2e\"}|9974360572-{\"result\":true,\"message\":\"Message queued for sending. Check webhook for delivery status\",\"id\":\"de5174b4-3322-49fa-90b7-e3fbac0e6bdd\"}|7283934596-{\"result\":true,\"message\":\"Message queued for sending. Check webhook for delivery status\",\"id\":\"12c179f3-b25c-484c-b99b-f545c512121b\"}|'),
(10, '2026-04-07 23:00:04', 'Hire Agent Lead Whatsapp', 12, 'Whatsapp Day - 0', 3, '9408881214-{\"result\":true,\"message\":\"Message queued for sending. Check webhook for delivery status\",\"id\":\"d9c335f3-d7ec-4b88-becc-9ade41bce133\"}|9974360572-{\"result\":true,\"message\":\"Message queued for sending. Check webhook for delivery status\",\"id\":\"a1c2cea8-79d7-4f3f-969d-91162baebf3d\"}|6358265226-{\"result\":true,\"message\":\"Message queued for sending. Check webhook for delivery status\",\"id\":\"0fddf4b3-6fe4-4d94-b780-f6eca868084a\"}|'),
(11, '2026-04-08 09:00:06', 'Hire Agent Lead Whatsapp', 12, 'Whatsapp Day - 1', 3, '9408881214-{\"result\":true,\"message\":\"Message queued for sending. Check webhook for delivery status\",\"id\":\"b3f86dab-2ec8-402c-94d0-afbfa751af45\"}|9974360572-{\"result\":true,\"message\":\"Message queued for sending. Check webhook for delivery status\",\"id\":\"3dac9501-d0b6-4659-8cd1-4455d962b733\"}|6358265226-{\"result\":true,\"message\":\"Message queued for sending. Check webhook for delivery status\",\"id\":\"3d869625-0fee-42dd-a6d3-08d6fcdddece\"}|'),
(12, '2026-04-08 10:00:05', 'Hire Agent Lead Whatsapp', 12, 'Whatsapp Day - 2', 3, '9408881214-{\"result\":true,\"message\":\"Message queued for sending. Check webhook for delivery status\",\"id\":\"467dbe7f-4ebc-437f-b251-0a21064b5cad\"}|9974360572-{\"result\":true,\"message\":\"Message queued for sending. Check webhook for delivery status\",\"id\":\"deb2325b-0a2f-4541-adb5-772bd37ac265\"}|7283934596-{\"result\":true,\"message\":\"Message queued for sending. Check webhook for delivery status\",\"id\":\"b6859313-6554-4e28-947e-caf610cec17d\"}|'),
(13, '2026-04-08 21:00:14', 'Hire Agent Lead Whatsapp', 12, 'Whatsapp Day - 2', 3, '9408881214-{\"result\":true,\"message\":\"Message queued for sending. Check webhook for delivery status\",\"id\":\"5e40fc2a-b752-4238-a619-eedd06c5ae38\"}|9974360572-{\"result\":true,\"message\":\"Message queued for sending. Check webhook for delivery status\",\"id\":\"b0559a49-e2d1-4753-895c-55b5a292dc77\"}|7283934596-{\"result\":true,\"message\":\"Message queued for sending. Check webhook for delivery status\",\"id\":\"395e8739-888f-4375-a246-1e3109ad611f\"}|'),
(14, '2026-04-08 22:00:11', 'Hire Agent Lead Whatsapp', 12, 'Whatsapp Day - 1', 3, '9408881214-{\"result\":true,\"message\":\"Message queued for sending. Check webhook for delivery status\",\"id\":\"9c361d99-1a75-4a3a-ba02-f576ed8d15e0\"}|9974360572-{\"result\":true,\"message\":\"Message queued for sending. Check webhook for delivery status\",\"id\":\"c15990d4-703a-4cce-934d-33bef40e9841\"}|6358265226-{\"result\":true,\"message\":\"Message queued for sending. Check webhook for delivery status\",\"id\":\"af2db5e4-be3c-4a5f-837d-1d34908f7b48\"}|'),
(15, '2026-04-09 10:00:07', 'Hire Agent Lead Whatsapp', 12, 'Whatsapp Day - 2', 1, '6358265226-{\"result\":true,\"message\":\"Message queued for sending. Check webhook for delivery status\",\"id\":\"d1c8b04c-ea78-4442-a725-ef70269c3907\"}|'),
(16, '2026-04-09 11:00:17', 'Hire Agent Lead Whatsapp', 12, 'Whatsapp Day - 3', 1, '7283934596-{\"result\":true,\"message\":\"Message queued for sending. Check webhook for delivery status\",\"id\":\"bba92356-c9f3-49a3-b3d5-dc6a845b538e\"}|'),
(17, '2026-04-09 13:00:07', 'Hire Agent Lead Whatsapp', 12, 'Whatsapp Day - 10', 2, '8810011100-{\"result\":true,\"message\":\"Message queued for sending. Check webhook for delivery status\",\"id\":\"7c596c02-8250-4007-9540-5cf537376098\"}|9801010000-{\"result\":true,\"message\":\"Message queued for sending. Check webhook for delivery status\",\"id\":\"7c80d4db-68c1-4bc4-8a79-b75ce7324963\"}|'),
(18, '2026-04-09 18:00:04', 'Hire Agent Lead Whatsapp', 12, 'Whatsapp Day - 10', 2, '8810011100-{\"result\":true,\"message\":\"Message queued for sending. Check webhook for delivery status\",\"id\":\"f644c4ad-ed06-4a0d-ae36-48f6d2860475\"}|9801010000-{\"result\":true,\"message\":\"Message queued for sending. Check webhook for delivery status\",\"id\":\"5b1d232b-b80a-4106-916a-08d161c0554c\"}|'),
(19, '2026-04-09 20:00:06', 'Hire Agent Lead Whatsapp', 12, 'Whatsapp Day - 3', 1, '7283934596-{\"result\":true,\"message\":\"Message queued for sending. Check webhook for delivery status\",\"id\":\"e728c91d-e3e6-45cd-9d30-e8c108dc35c3\"}|'),
(20, '2026-04-09 21:00:05', 'Hire Agent Lead Whatsapp', 12, 'Whatsapp Day - 2', 1, '6358265226-{\"result\":true,\"message\":\"Message queued for sending. Check webhook for delivery status\",\"id\":\"1a47d54e-73a8-4a8a-840b-2b7545e88522\"}|'),
(21, '2026-04-09 23:15:05', 'Self Apply Lead Whatsapp', 11, 'Whatsapp Day - 0', 1, '9408881214-{\"result\":true,\"message\":\"Message queued for sending. Check webhook for delivery status\",\"id\":\"de65ccf7-846e-4e1c-b0dc-b0c95a9ef93f\"}|'),
(22, '2026-04-10 09:15:04', 'Self Apply Lead Whatsapp', 11, 'Whatsapp Day - 1', 1, '9408881214-{\"result\":true,\"message\":\"Message queued for sending. Check webhook for delivery status\",\"id\":\"f2f4aa1a-7484-49b4-beb9-0b82555c7b2f\"}|'),
(23, '2026-04-10 11:00:06', 'Hire Agent Lead Whatsapp', 12, 'Whatsapp Day - 3', 1, '6358265226-{\"result\":true,\"message\":\"Message queued for sending. Check webhook for delivery status\",\"id\":\"35e494eb-04e8-47ef-8831-ca04d41c886a\"}|'),
(24, '2026-04-10 13:00:05', 'Hire Agent Lead Whatsapp', 12, 'Whatsapp Day - 10', 1, '8909090909-{\"result\":true,\"message\":\"Message queued for sending. Check webhook for delivery status\",\"id\":\"a13367d9-f8bc-4a32-b751-3f3b39ed9226\"}|'),
(25, '2026-04-10 18:00:04', 'Hire Agent Lead Whatsapp', 12, 'Whatsapp Day - 10', 1, '8909090909-{\"result\":true,\"message\":\"Message queued for sending. Check webhook for delivery status\",\"id\":\"188d5502-d49c-4257-b56a-f967308fe36d\"}|'),
(26, '2026-04-10 20:00:05', 'Hire Agent Lead Whatsapp', 12, 'Whatsapp Day - 3', 1, '6358265226-{\"result\":true,\"message\":\"Message queued for sending. Check webhook for delivery status\",\"id\":\"8b1d2364-853d-41c6-beff-03e10a9c8163\"}|'),
(27, '2026-04-10 23:15:05', 'Self Apply Lead Whatsapp', 11, 'Whatsapp Day - 0', 1, '6358362869-{\"result\":true,\"message\":\"Message queued for sending. Check webhook for delivery status\",\"id\":\"485466e3-b86d-477b-96be-4bae39b05224\"}|'),
(28, '2026-04-13 10:15:04', 'Self Apply Lead Whatsapp', 11, 'Whatsapp Day - 2', 1, '7340237079-{\"result\":true,\"message\":\"Message queued for sending. Check webhook for delivery status\",\"id\":\"833b3aa6-1f3c-45f6-9bca-c258e12e95bd\"}|'),
(29, '2026-04-13 11:15:04', 'Self Apply Lead Whatsapp', 11, 'Whatsapp Day - 3', 1, '6358362869-{\"result\":true,\"message\":\"Message queued for sending. Check webhook for delivery status\",\"id\":\"3e33bf0e-d717-47e3-977d-69a2044916ef\"}|'),
(30, '2026-04-13 23:15:04', 'Self Apply Lead Whatsapp', 11, 'Whatsapp Day - 0', 3, '6358362869-{\"result\":true,\"message\":\"Message queued for sending. Check webhook for delivery status\",\"id\":\"9e738c89-d9da-404c-abb5-2f6c558ce746\"}|9983933306-{\"result\":true,\"message\":\"Message queued for sending. Check webhook for delivery status\",\"id\":\"3154fdb7-02ef-4b85-a4b3-121960eb0cf0\"}|9928182860-{\"result\":true,\"message\":\"Message queued for sending. Check webhook for delivery status\",\"id\":\"19bd38bf-1d00-4d75-b222-e22df068ad3d\"}|'),
(31, '2026-04-14 09:15:04', 'Self Apply Lead Whatsapp', 11, 'Whatsapp Day - 1', 3, '6358362869-{\"result\":true,\"message\":\"Message queued for sending. Check webhook for delivery status\",\"id\":\"f57b0d59-97fe-4a74-a062-74a1a59a17fa\"}|9983933306-{\"result\":true,\"message\":\"Message queued for sending. Check webhook for delivery status\",\"id\":\"da391d87-0ab3-4f8a-9bd5-d0a6d5e65e72\"}|9928182860-{\"result\":true,\"message\":\"Message queued for sending. Check webhook for delivery status\",\"id\":\"a06285cd-45e8-492c-bdd0-400a713f04ab\"}|'),
(32, '2026-04-14 22:15:03', 'Self Apply Lead Whatsapp', 11, 'Whatsapp Day - 1', 2, '6358362869-{\"result\":true,\"message\":\"Message queued for sending. Check webhook for delivery status\",\"id\":\"ec6d8630-ac40-463b-a413-8effc466e880\"}|9983933306-{\"result\":true,\"message\":\"Message queued for sending. Check webhook for delivery status\",\"id\":\"26bc39d5-6090-4a06-b213-92b4ac0d616a\"}|'),
(33, '2026-04-14 23:15:04', 'Self Apply Lead Whatsapp', 11, 'Whatsapp Day - 0', 1, '9928182860-{\"result\":true,\"message\":\"Message queued for sending. Check webhook for delivery status\",\"id\":\"9a319041-f362-47cc-81f5-e06330bb5fb7\"}|'),
(34, '2026-04-15 08:15:04', 'Self Apply Lead Whatsapp', 11, 'Whatsapp Day - 0', 1, '9928182860-{\"result\":true,\"message\":\"Message queued for sending. Check webhook for delivery status\",\"id\":\"c19d322c-ce4b-4c74-974b-4b9b3175582f\"}|'),
(35, '2026-04-15 10:15:04', 'Self Apply Lead Whatsapp', 11, 'Whatsapp Day - 2', 2, '6358362869-{\"result\":true,\"message\":\"Message queued for sending. Check webhook for delivery status\",\"id\":\"e1632862-95de-4aaf-a26d-a3747c8067b6\"}|9983933306-{\"result\":true,\"message\":\"Message queued for sending. Check webhook for delivery status\",\"id\":\"f6f43595-1655-437d-8129-b272233ffb14\"}|'),
(36, '2026-04-15 21:15:04', 'Self Apply Lead Whatsapp', 11, 'Whatsapp Day - 2', 2, '6358362869-{\"result\":true,\"message\":\"Message queued for sending. Check webhook for delivery status\",\"id\":\"12e3a34f-79d3-4e3b-b7ce-ba9054d6a3aa\"}|9983933306-{\"result\":true,\"message\":\"Message queued for sending. Check webhook for delivery status\",\"id\":\"9b5b6688-0287-48fb-afc3-1ac446ff3f57\"}|'),
(37, '2026-04-15 23:00:04', 'Hire Agent Lead Whatsapp', 12, 'Whatsapp Day - 0', 1, '6358141826-{\"result\":true,\"message\":\"Message queued for sending. Check webhook for delivery status\",\"id\":\"f3d2001c-893b-4eeb-8901-11d7e9b4330f\"}|'),
(38, '2026-04-15 23:15:05', 'Self Apply Lead Whatsapp', 11, 'Whatsapp Day - 0', 3, '9928182860-{\"result\":true,\"message\":\"Message queued for sending. Check webhook for delivery status\",\"id\":\"53b70e01-2947-4d6b-9812-f39fa36b86c9\"}|9998892746-{\"result\":true,\"message\":\"Message queued for sending. Check webhook for delivery status\",\"id\":\"13239e67-dbd2-4d0f-9b1c-0a1188fc6214\"}|6202396342-{\"result\":true,\"message\":\"Message queued for sending. Check webhook for delivery status\",\"id\":\"ac6898dd-dea2-4c26-8e70-c0bb9054a71f\"}|'),
(39, '2026-04-16 09:00:04', 'Hire Agent Lead Whatsapp', 12, 'Whatsapp Day - 1', 1, '6358141826-{\"result\":true,\"message\":\"Message queued for sending. Check webhook for delivery status\",\"id\":\"4629e4f2-8cdd-4926-9c32-24979b3d2046\"}|'),
(40, '2026-04-16 09:15:03', 'Self Apply Lead Whatsapp', 11, 'Whatsapp Day - 1', 3, '9928182860-{\"result\":true,\"message\":\"Message queued for sending. Check webhook for delivery status\",\"id\":\"6877f6f9-37ce-452d-b8f4-a5a044c316cb\"}|9998892746-{\"result\":true,\"message\":\"Message queued for sending. Check webhook for delivery status\",\"id\":\"d25e6b65-9b6e-4670-ae8d-05797c74597a\"}|6202396342-{\"result\":true,\"message\":\"Message queued for sending. Check webhook for delivery status\",\"id\":\"65cecfac-44ec-4a56-9f2c-2b2e7f7bf4e5\"}|'),
(41, '2026-04-16 11:15:04', 'Self Apply Lead Whatsapp', 11, 'Whatsapp Day - 3', 2, '6358362869-{\"result\":true,\"message\":\"Message queued for sending. Check webhook for delivery status\",\"id\":\"d3d7ce81-7eba-4cd6-ace5-9ea14d8f4a95\"}|9983933306-{\"result\":true,\"message\":\"Message queued for sending. Check webhook for delivery status\",\"id\":\"3c462b62-f1c6-4389-9520-02e17a22edbd\"}|'),
(42, '2026-04-16 20:15:03', 'Self Apply Lead Whatsapp', 11, 'Whatsapp Day - 3', 2, '6358362869-{\"result\":true,\"message\":\"Message queued for sending. Check webhook for delivery status\",\"id\":\"05142052-f754-45b1-b148-14bcaf3c7f65\"}|9983933306-{\"result\":true,\"message\":\"Message queued for sending. Check webhook for delivery status\",\"id\":\"3a125969-fcf8-4678-bb6c-63516c8ff1de\"}|'),
(43, '2026-04-16 22:00:03', 'Hire Agent Lead Whatsapp', 12, 'Whatsapp Day - 1', 1, '6358141826-{\"result\":true,\"message\":\"Message queued for sending. Check webhook for delivery status\",\"id\":\"203857e8-8b5b-4e7a-bb74-4848f74fe32d\"}|'),
(44, '2026-04-16 22:15:04', 'Self Apply Lead Whatsapp', 11, 'Whatsapp Day - 1', 2, '9998892746-{\"result\":true,\"message\":\"Message queued for sending. Check webhook for delivery status\",\"id\":\"18e587b9-b446-450e-9783-5354c343034d\"}|6202396342-{\"result\":true,\"message\":\"Message queued for sending. Check webhook for delivery status\",\"id\":\"e61476e9-5050-415e-9100-e7b91b63bc0e\"}|'),
(45, '2026-04-16 23:15:04', 'Self Apply Lead Whatsapp', 11, 'Whatsapp Day - 0', 1, '9928182860-{\"result\":true,\"message\":\"Message queued for sending. Check webhook for delivery status\",\"id\":\"3836232d-9629-4889-ac16-a8f17b918c0c\"}|'),
(46, '2026-04-17 09:15:04', 'Self Apply Lead Whatsapp', 11, 'Whatsapp Day - 1', 1, '9928182860-{\"result\":true,\"message\":\"Message queued for sending. Check webhook for delivery status\",\"id\":\"7c14938d-1b8c-4e00-bdb7-5c12329ec8be\"}|'),
(47, '2026-04-17 10:00:05', 'Hire Agent Lead Whatsapp', 12, 'Whatsapp Day - 2', 1, '6358141826-{\"result\":true,\"message\":\"Message queued for sending. Check webhook for delivery status\",\"id\":\"b9b5d309-9c8b-4ab8-8260-2f57ef9c1526\"}|'),
(48, '2026-04-17 10:15:04', 'Self Apply Lead Whatsapp', 11, 'Whatsapp Day - 2', 2, '9998892746-{\"result\":true,\"message\":\"Message queued for sending. Check webhook for delivery status\",\"id\":\"896421ce-13e1-4794-b113-a50ec1c83f53\"}|6202396342-{\"result\":true,\"message\":\"Message queued for sending. Check webhook for delivery status\",\"id\":\"9a45aa9e-2677-4c23-9336-48cb08df0f73\"}|'),
(49, '2026-04-17 13:00:03', 'Hire Agent Lead Whatsapp', 12, 'Whatsapp Day - 10', 1, '6358265226-{\"result\":true,\"message\":\"Message queued for sending. Check webhook for delivery status\",\"id\":\"11b55fbf-1fa6-415d-bda1-ed4d3e5c8925\"}|'),
(50, '2026-04-17 14:15:04', 'Self Apply Lead Whatsapp', 11, 'Whatsapp Day - 20', 1, '9033149430-{\"result\":true,\"message\":\"Message queued for sending. Check webhook for delivery status\",\"id\":\"ab1421d8-3674-46cc-becb-d0eb4617115b\"}|'),
(51, '2026-04-17 17:15:04', 'Self Apply Lead Whatsapp', 11, 'Whatsapp Day - 20', 1, '9033149430-{\"result\":true,\"message\":\"Message queued for sending. Check webhook for delivery status\",\"id\":\"5c11107c-74ab-4c94-8128-15fd4283a63a\"}|'),
(52, '2026-04-17 18:00:04', 'Hire Agent Lead Whatsapp', 12, 'Whatsapp Day - 10', 1, '6358265226-{\"result\":true,\"message\":\"Message queued for sending. Check webhook for delivery status\",\"id\":\"16b76288-fdde-4a68-a3c9-f2b5d3ca3402\"}|'),
(53, '2026-04-17 21:15:05', 'Self Apply Lead Whatsapp', 11, 'Whatsapp Day - 2', 2, '9998892746-{\"result\":true,\"message\":\"Message queued for sending. Check webhook for delivery status\",\"id\":\"1d034c23-8023-495c-9c83-d7ac7d5bbb65\"}|6202396342-{\"result\":true,\"message\":\"Message queued for sending. Check webhook for delivery status\",\"id\":\"beafa636-e93e-4056-8f51-64d77c38c58b\"}|'),
(54, '2026-04-17 22:15:04', 'Self Apply Lead Whatsapp', 11, 'Whatsapp Day - 1', 1, '9928182860-{\"result\":true,\"message\":\"Message queued for sending. Check webhook for delivery status\",\"id\":\"e5666bcd-f1a5-44b3-91b0-1d4fc46005df\"}|'),
(55, '2026-04-17 23:00:04', 'Hire Agent Lead Whatsapp', 12, 'Whatsapp Day - 0', 1, '6358141826-{\"result\":true,\"message\":\"Message queued for sending. Check webhook for delivery status\",\"id\":\"60b9add6-c831-4a99-bdab-72202bacd174\"}|'),
(56, '2026-04-17 23:15:04', 'Self Apply Lead Whatsapp', 11, 'Whatsapp Day - 0', 1, '6375723886-{\"result\":true,\"message\":\"Message queued for sending. Check webhook for delivery status\",\"id\":\"242ce821-03ab-44b1-b85c-a5e35e4fb304\"}|'),
(57, '2026-04-20 10:15:04', 'Self Apply Lead Whatsapp', 11, 'Whatsapp Day - 2', 1, '9928182860-{\"result\":true,\"message\":\"Message queued for sending. Check webhook for delivery status\",\"id\":\"ebfe0be0-52b7-4c79-8f0e-e9003d5ec89c\"}|'),
(58, '2026-04-20 11:15:05', 'Self Apply Lead Whatsapp', 11, 'Whatsapp Day - 3', 1, '6375723886-{\"result\":true,\"message\":\"Message queued for sending. Check webhook for delivery status\",\"id\":\"0f264321-9c8f-49ff-b30a-b5e0a9ab4355\"}|'),
(59, '2026-04-20 12:15:04', 'Self Apply Lead Whatsapp', 11, 'Whatsapp Day - 5', 2, '9998892746-{\"result\":true,\"message\":\"Message queued for sending. Check webhook for delivery status\",\"id\":\"ff50e761-c6a4-44b3-b5f6-100820d5b50f\"}|6202396342-{\"result\":true,\"message\":\"Message queued for sending. Check webhook for delivery status\",\"id\":\"556c1880-955f-43ea-aced-c5ac37b36beb\"}|'),
(60, '2026-04-20 14:00:12', 'Hire Agent Lead Whatsapp', 12, 'Whatsapp Day - 20', 1, '8909090909-{\"result\":true,\"message\":\"Message queued for sending. Check webhook for delivery status\",\"id\":\"17343c09-08d4-46f0-a707-00b5777238b9\"}|'),
(61, '2026-04-20 17:00:12', 'Hire Agent Lead Whatsapp', 12, 'Whatsapp Day - 20', 1, '8909090909-{\"result\":true,\"message\":\"Message queued for sending. Check webhook for delivery status\",\"id\":\"911d3b6e-df05-4330-bd05-1680cff312c2\"}|');

-- --------------------------------------------------------

--
-- Table structure for table `source_entry`
--

CREATE TABLE `source_entry` (
  `id` int(11) NOT NULL,
  `rec_date` datetime NOT NULL DEFAULT current_timestamp(),
  `user_id` int(11) DEFAULT NULL,
  `utm_source` varchar(125) DEFAULT NULL,
  `utm_campaign` varchar(255) DEFAULT NULL,
  `utm_medium` varchar(125) DEFAULT NULL,
  `source_id` varchar(299) DEFAULT NULL,
  `utm_referral` varchar(99) DEFAULT NULL,
  `client_ip` varchar(55) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `source_entry`
--

INSERT INTO `source_entry` (`id`, `rec_date`, `user_id`, `utm_source`, `utm_campaign`, `utm_medium`, `source_id`, `utm_referral`, `client_ip`) VALUES
(1, '2025-12-28 15:11:28', 1, 'web', '', 'direct', NULL, NULL, '127.0.0.1'),
(2, '2026-02-09 11:21:02', 1, 'web', '', 'direct', NULL, NULL, '127.0.0.1'),
(3, '2026-02-09 12:06:41', 2, 'web', '', 'direct', '', '', '127.0.0.1'),
(4, '2026-02-09 12:20:59', 2, 'web', '', 'direct', '', '', '127.0.0.1'),
(5, '2026-02-09 12:23:15', 3, 'web', '', 'direct', NULL, NULL, '127.0.0.1'),
(6, '2026-02-13 10:36:52', 4, 'web', '', 'direct', NULL, NULL, '127.0.0.1'),
(7, '2026-03-11 05:02:00', 1, 'web', '', 'direct', NULL, NULL, '116.73.198.183'),
(8, '2026-03-24 05:33:10', 2, 'web', '', 'direct', NULL, NULL, '171.61.164.215'),
(9, '2026-03-24 08:30:31', 3, 'web', '', 'direct', NULL, NULL, '171.61.164.215'),
(10, '2026-03-27 09:44:12', 4, 'web', '', 'direct', NULL, NULL, '116.72.35.17'),
(11, '2026-03-27 10:09:00', 5, 'web', '', 'direct', NULL, NULL, '116.72.35.17'),
(12, '2026-03-27 10:59:55', 6, 'web', '', 'direct', NULL, NULL, '116.72.35.17'),
(13, '2026-03-27 11:11:37', 7, 'web', '', 'direct', NULL, NULL, '116.72.35.17'),
(14, '2026-03-27 11:19:54', 8, 'web', '', 'direct', NULL, NULL, '116.72.35.17'),
(15, '2026-03-27 11:26:45', 9, 'web', '', 'direct', NULL, NULL, '116.72.35.17'),
(16, '2026-03-27 11:41:00', 10, 'web', '', 'direct', NULL, NULL, '116.72.35.17'),
(17, '2026-03-28 05:20:22', 2, 'web', '', 'direct', '', '', '171.61.163.130'),
(18, '2026-03-28 06:02:20', 2, 'web', '', 'direct', '', '', '122.168.83.211'),
(19, '2026-03-28 06:06:10', 11, 'web', '', 'direct', NULL, NULL, '122.168.83.211'),
(20, '2026-03-28 10:59:38', 12, 'web', '', 'direct', NULL, NULL, '43.251.72.72'),
(21, '2026-03-30 10:47:02', 13, 'web', '', 'direct', NULL, NULL, '43.251.72.72'),
(22, '2026-03-30 10:56:31', 4, 'web', '', 'direct', '', '', '116.72.153.165'),
(23, '2026-03-30 10:58:22', 14, 'web', '', 'direct', NULL, NULL, '202.179.159.194'),
(24, '2026-03-30 10:59:08', 14, 'web', '', 'direct', '', '', '202.179.159.194'),
(25, '2026-03-30 11:39:49', 10, 'web', '', 'direct', '', '', '116.72.153.165'),
(26, '2026-03-30 11:48:37', 10, 'web', '', 'direct', '', '', '116.72.153.165'),
(27, '2026-03-30 11:58:44', 15, 'web', '', 'direct', NULL, NULL, '116.72.153.165'),
(28, '2026-03-30 12:01:49', 16, 'web', '', 'direct', NULL, NULL, '43.251.72.72'),
(29, '2026-03-31 06:09:54', 14, 'web', '', 'direct', '', '', '171.61.163.66'),
(30, '2026-03-31 06:19:29', 17, 'web', '', 'direct', NULL, NULL, '43.251.72.72'),
(31, '2026-04-02 11:48:37', 18, 'web', '', 'direct', NULL, NULL, '43.251.72.72'),
(32, '2026-04-06 09:57:00', 15, 'web', '', 'direct', '', '', '116.74.92.105'),
(33, '2026-04-06 10:00:34', 19, 'web', '', 'direct', NULL, NULL, '116.74.92.105'),
(34, '2026-04-07 06:17:18', 20, 'web', '', 'direct', NULL, NULL, '171.61.161.161'),
(35, '2026-04-07 06:54:59', 21, 'web', '', 'direct', NULL, NULL, '27.61.192.226'),
(36, '2026-04-07 07:02:47', 1, 'web', '', 'direct', '', '', '116.74.92.105'),
(37, '2026-04-07 07:13:54', 21, 'web', '', 'direct', '', '', '27.61.192.226'),
(38, '2026-04-07 07:17:45', 22, 'web', '', 'direct', NULL, NULL, '27.61.192.226'),
(39, '2026-04-07 07:18:27', 23, 'web', '', 'direct', NULL, NULL, '171.61.161.161'),
(40, '2026-04-07 07:18:33', 1, 'web', '', 'direct', '', '', '116.74.92.105'),
(41, '2026-04-08 11:01:12', 24, 'web', '', 'direct', NULL, NULL, '171.61.161.161'),
(42, '2026-04-09 11:09:19', 25, 'web', '', 'direct', NULL, NULL, '116.72.52.82'),
(43, '2026-04-09 11:12:29', 25, 'web', '', 'direct', '', '', '116.72.52.82'),
(44, '2026-04-10 08:59:27', 26, 'web', '', 'direct', NULL, NULL, '171.61.163.23'),
(45, '2026-04-10 09:44:05', 27, 'web', '', 'direct', NULL, NULL, '116.72.33.197'),
(46, '2026-04-10 09:47:58', 26, 'web', '', 'direct', '', '', '171.61.163.23'),
(47, '2026-04-11 10:09:08', 28, 'web', '', 'direct', NULL, NULL, '122.168.85.200'),
(48, '2026-04-13 06:17:02', 26, 'web', '', 'direct', '', '', '171.61.167.201'),
(49, '2026-04-13 09:36:39', 28, 'web', '', 'direct', '', '', '223.184.252.123'),
(50, '2026-04-13 09:37:45', 28, 'web', '', 'direct', '', '', '223.184.252.123'),
(51, '2026-04-13 10:24:47', 29, 'web', '', 'direct', NULL, NULL, '122.168.85.200'),
(52, '2026-04-13 10:26:00', 29, 'web', '', 'direct', '', '', '122.168.85.200'),
(53, '2026-04-13 12:47:04', 30, 'web', '', 'direct', NULL, NULL, '117.99.103.122'),
(54, '2026-04-13 15:00:55', 30, 'web', '', 'direct', '', '', '223.188.58.46'),
(55, '2026-04-14 12:25:12', 30, 'web', '', 'direct', '', '', '223.188.56.197'),
(56, '2026-04-14 18:39:47', 30, 'web', '', 'direct', '', '', '223.188.62.96'),
(57, '2026-04-15 06:21:43', 30, 'web', '', 'direct', '', '', '223.188.63.91'),
(58, '2026-04-15 07:33:32', 30, 'web', '', 'direct', '', '', '223.188.63.91'),
(59, '2026-04-15 08:50:07', 31, 'web', '', 'direct', NULL, NULL, '171.61.167.201'),
(60, '2026-04-15 09:06:46', 32, 'web', '', 'direct', NULL, NULL, '171.61.167.201'),
(61, '2026-04-15 09:27:49', 33, 'web', '', 'direct', NULL, NULL, '171.61.167.201'),
(62, '2026-04-15 09:55:00', 34, 'web', '', 'direct', NULL, NULL, '171.61.167.201'),
(63, '2026-04-15 11:04:40', 30, 'web', '', 'direct', NULL, NULL, '117.99.99.55'),
(64, '2026-04-15 11:30:51', 33, 'web', '', 'direct', '', '', '171.61.167.201'),
(65, '2026-04-15 11:43:17', 30, 'web', '', 'direct', '', '', '117.99.99.55'),
(66, '2026-04-15 12:52:54', 35, 'web', '', 'direct', NULL, NULL, '223.184.130.213'),
(67, '2026-04-15 13:00:36', 30, 'web', '', 'direct', '', '', '117.99.99.55'),
(68, '2026-04-16 03:59:25', 30, 'web', '', 'direct', '', '', '106.205.200.157'),
(69, '2026-04-16 06:05:19', 36, 'web', '', 'direct', NULL, NULL, '106.219.203.218'),
(70, '2026-04-17 06:04:25', 33, 'web', '', 'direct', '', '', '171.61.166.199'),
(71, '2026-04-17 07:45:22', 37, 'web', '', 'direct', NULL, NULL, '157.48.250.31'),
(72, '2026-04-17 07:45:32', 38, 'web', '', 'direct', NULL, NULL, '157.38.148.45'),
(73, '2026-04-18 02:58:08', 30, 'web', '', 'direct', NULL, NULL, '223.238.197.107'),
(74, '2026-04-18 06:47:06', 39, 'web', '', 'direct', NULL, NULL, '171.61.166.199'),
(75, '2026-04-18 07:04:10', 33, 'web', '', 'direct', '', '', '171.61.166.199'),
(76, '2026-04-18 07:06:22', 40, 'web', '', 'direct', NULL, NULL, '171.61.166.199'),
(77, '2026-04-18 07:12:05', 41, 'web', '', 'direct', NULL, NULL, '171.61.166.199'),
(78, '2026-04-18 07:18:02', 39, 'web', '', 'direct', '', '', '171.61.166.199'),
(79, '2026-04-18 10:14:38', 42, 'web', '', 'direct', NULL, NULL, '43.251.72.72'),
(80, '2026-04-18 10:16:04', 42, 'web', '', 'direct', '', '', '43.251.72.72'),
(81, '2026-04-20 10:23:05', 43, 'web', '', 'direct', NULL, NULL, '157.48.240.0');

-- --------------------------------------------------------

--
-- Table structure for table `staff_tasks`
--

CREATE TABLE `staff_tasks` (
  `id` int(11) NOT NULL,
  `rec_date` datetime NOT NULL DEFAULT current_timestamp(),
  `assignee_id` int(11) NOT NULL,
  `follower_id` int(11) NOT NULL,
  `task_title` varchar(299) NOT NULL,
  `task_desc` longtext NOT NULL,
  `attachment` varchar(299) DEFAULT NULL,
  `priority` varchar(55) NOT NULL,
  `task_module` varchar(199) NOT NULL,
  `task_status` varchar(55) NOT NULL,
  `completion_date` datetime DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `projects` varchar(299) NOT NULL,
  `task_goal` varchar(55) NOT NULL,
  `isActive` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 = active, 0= deactive',
  `isDelete` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0= no, 1= yes'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subpaisa_entry`
--

CREATE TABLE `subpaisa_entry` (
  `id` int(11) NOT NULL,
  `rec_date` datetime NOT NULL DEFAULT current_timestamp(),
  `entryfor` int(11) NOT NULL DEFAULT 0 COMMENT '1=Customer,2=Channel,11=SelfApply,12=Loan Agent, 3=LA_Offer_1,4=LA_Offer_2,5=LA_Offer_3,6=SA_Offer_1,7=SA_Offer_2,8=SA_Offer_3,9=SA_Offer_4,10=LA_Offer_4',
  `userid` int(11) NOT NULL,
  `orderid` varchar(50) NOT NULL,
  `orderamount` float(11,2) NOT NULL,
  `ordernote` varchar(256) DEFAULT NULL,
  `referenceid` varchar(256) DEFAULT NULL,
  `txstatus` varchar(256) DEFAULT NULL,
  `paymentmode` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_requests`
--

CREATE TABLE `support_requests` (
  `id` int(11) NOT NULL,
  `rec_date` datetime NOT NULL,
  `ticketno` varchar(50) NOT NULL,
  `usertype` int(11) NOT NULL DEFAULT 1 COMMENT '1 = selfapply, 2 = guest user, 3 = loan agent',
  `firstname` varchar(125) NOT NULL,
  `lastname` varchar(125) NOT NULL,
  `mobile` varchar(99) NOT NULL,
  `email` varchar(99) NOT NULL,
  `issuetype` varchar(255) NOT NULL,
  `cardnumber` varchar(255) DEFAULT NULL,
  `message` longtext NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '0=No,1=Yes',
  `serverip` varchar(99) DEFAULT NULL,
  `isDelete` int(11) NOT NULL DEFAULT 0 COMMENT '0=No,1=Yes'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `support_requests`
--

INSERT INTO `support_requests` (`id`, `rec_date`, `ticketno`, `usertype`, `firstname`, `lastname`, `mobile`, `email`, `issuetype`, `cardnumber`, `message`, `status`, `serverip`, `isDelete`) VALUES
(1, '2026-03-12 15:45:46', '0312033627', 2, 'Santosh', 'P', '9898345467', 'santosh123@gmailcom', 'Other', NULL, 'hi', 1, '171.61.165.233', 0),
(2, '2026-04-13 11:45:48', '0413117895', 1, 'Tamanna', 'Vegada', '6358362869', 'indiakarobartrainner@gmail.com', 'Service Problem', NULL, 'Test', 1, '171.61.167.201', 0);

-- --------------------------------------------------------

--
-- Table structure for table `support_request_chat`
--

CREATE TABLE `support_request_chat` (
  `id` int(11) NOT NULL,
  `rec_date` datetime NOT NULL DEFAULT current_timestamp(),
  `requestid` int(11) NOT NULL,
  `remarks` longtext NOT NULL,
  `staffid` int(11) NOT NULL,
  `isDelete` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_documents`
--

CREATE TABLE `user_documents` (
  `id` int(11) NOT NULL,
  `rec_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `userid` int(11) NOT NULL,
  `profilephoto` varchar(256) DEFAULT NULL,
  `aadharcard` varchar(256) DEFAULT NULL,
  `aadharcard_number` varchar(256) DEFAULT NULL,
  `pancard` varchar(256) DEFAULT NULL,
  `pancard_number` varchar(256) DEFAULT NULL,
  `cancelcheque` varchar(256) DEFAULT NULL,
  `lightbill` varchar(256) DEFAULT NULL,
  `bankstatement` varchar(256) DEFAULT NULL,
  `formsixteen` varchar(256) DEFAULT NULL,
  `salaryslip` varchar(256) DEFAULT NULL,
  `businessproof` varchar(256) DEFAULT NULL,
  `itreturn` varchar(256) DEFAULT NULL,
  `remarks` varchar(256) DEFAULT NULL,
  `isVerified` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=No, 1=Yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_offers`
--

CREATE TABLE `user_offers` (
  `id` int(11) NOT NULL,
  `rec_date` datetime NOT NULL DEFAULT current_timestamp(),
  `userid` int(11) NOT NULL,
  `offerdata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user_offers`
--

INSERT INTO `user_offers` (`id`, `rec_date`, `userid`, `offerdata`) VALUES
(1, '2025-12-28 15:11:45', 1, '[{\"apply_id\":32,\"rec_date\":\"2025-06-28 16:05:55\",\"bankid\":13,\"roi\":10.5,\"bank_name\":\"Faircent\",\"bank_image\":\"1746170179.png\",\"tenures\":60,\"option1\":\"100% Online Process\",\"option2\":\"Convenient EMI Options\",\"option3\":\"Min. Paperwork\",\"option4\":null,\"option5\":null,\"title\":\"Your Eligibility Matches The Criteria | Easy & Quick Process\",\"applyurl\":\"https:\\/\\/in.faircentpro.com\\/?utm_source=wl&utm_medium=Mailer&campaign_name=Borrower_Partner&agf=WLA113767\",\"loanAmount\":205716,\"is_recommended\":1},{\"apply_id\":7,\"rec_date\":\"2025-05-03 15:57:46\",\"bankid\":38,\"roi\":10.5,\"bank_name\":\"InCred Finance\",\"bank_image\":\"1746190862.png\",\"tenures\":60,\"option1\":\"Simple Online Process\",\"option2\":\"Low EMI Options\",\"option3\":\"Min. Documentation\",\"option4\":null,\"option5\":null,\"title\":\"Your Eligibility Matches The Criteria | Instant Process\",\"applyurl\":\"https:\\/\\/www.incred.com\\/personal-loan\\/\",\"loanAmount\":205716,\"is_recommended\":0},{\"apply_id\":18,\"rec_date\":\"2025-05-03 17:15:19\",\"bankid\":29,\"roi\":11,\"bank_name\":\"MoneyView\",\"bank_image\":\"1746187540.png\",\"tenures\":36,\"option1\":\"Simple Online Process\",\"option2\":\"Low EMI Options\",\"option3\":\"Min. Paperwork\",\"option4\":null,\"option5\":null,\"title\":\"You\\u2019re Eligible For Pre-Approved Loan Offer | Simple Process\",\"applyurl\":\"https:\\/\\/moneyview.in\\/personal-loan\",\"loanAmount\":205716,\"is_recommended\":0},{\"apply_id\":20,\"rec_date\":\"2025-05-03 17:19:02\",\"bankid\":40,\"roi\":10.5,\"bank_name\":\"Fibe\",\"bank_image\":\"1746191054.png\",\"tenures\":60,\"option1\":\"100% Digital Process\",\"option2\":\"Low EMI Options\",\"option3\":\"Min. Paperwork\",\"option4\":null,\"option5\":null,\"title\":\"Your Eligibility Matches The Criteria | Instant Process\",\"applyurl\":\"https:\\/\\/www.fibe.in\\/personal-loan\\/\",\"loanAmount\":205716,\"is_recommended\":0},{\"apply_id\":30,\"rec_date\":\"2025-06-07 20:56:34\",\"bankid\":45,\"roi\":10.5,\"bank_name\":\"Freo (by MoneyTap)\",\"bank_image\":\"1749300818.png\",\"tenures\":60,\"option1\":\"100% Digital Process\",\"option2\":\"Low EMI Options\",\"option3\":\"Min. Paperwork\",\"option4\":null,\"option5\":null,\"title\":\"You\'re Eligible For Pre-Approved Loan Offer | Simple Process\",\"applyurl\":\"https:\\/\\/web.moneytap.com\\/\",\"loanAmount\":205716,\"is_recommended\":0}]'),
(2, '2026-02-09 12:10:07', 2, '[{\"apply_id\":29,\"rec_date\":\"2025-06-05 12:49:55\",\"bankid\":8,\"roi\":10.5,\"bank_name\":\"Prfer\",\"bank_image\":\"1738654938.png\",\"tenures\":60,\"option1\":\"100% Online Process\",\"option2\":\"Convenient EMI Options\",\"option3\":\"Min. Paperwork\",\"option4\":null,\"option5\":null,\"title\":\"You\'re Eligible For Pre-Approved Loan Offer | Quick Process\",\"applyurl\":\"https:\\/\\/www.prefr.com\\/personal-loan\",\"loanAmount\":875000,\"is_recommended\":1}]'),
(3, '2026-02-09 12:23:52', 3, '[{\"apply_id\":16,\"rec_date\":\"2025-05-03 17:04:30\",\"bankid\":11,\"roi\":10.5,\"bank_name\":\"Werize\",\"bank_image\":\"1746170219.png\",\"tenures\":60,\"option1\":\"100% Digital Process\",\"option2\":\"Convenient EMI Options\",\"option3\":\"Min. Paperwork\",\"option4\":null,\"option5\":null,\"title\":\"Your Eligibility Matches The Criteria | Instant Process\",\"applyurl\":\"https:\\/\\/partner.werize.com\\/MyBusiness\\/KREDBAZ%20SERVICE%20INDIA%20PRIVATE%20LIMITED\\/d2266f89-d2b0-4956-ba75-e95eca9cd08a\",\"loanAmount\":875000,\"is_recommended\":1}]'),
(4, '2026-02-13 10:40:05', 4, '[{\"apply_id\":16,\"rec_date\":\"2025-05-03 17:04:30\",\"bankid\":11,\"roi\":10.5,\"bank_name\":\"Werize\",\"bank_image\":\"1746170219.png\",\"tenures\":60,\"option1\":\"100% Digital Process\",\"option2\":\"Convenient EMI Options\",\"option3\":\"Min. Paperwork\",\"option4\":null,\"option5\":null,\"title\":\"Your Eligibility Matches The Criteria | Instant Process\",\"applyurl\":\"https:\\/\\/partner.werize.com\\/MyBusiness\\/KREDBAZ%20SERVICE%20INDIA%20PRIVATE%20LIMITED\\/d2266f89-d2b0-4956-ba75-e95eca9cd08a\",\"loanAmount\":822909,\"is_recommended\":1}]'),
(5, '2026-03-27 15:39:26', 5, '[{\"apply_id\":32,\"rec_date\":\"2025-06-28 16:05:55\",\"bankid\":13,\"roi\":10.5,\"bank_name\":\"Faircent\",\"bank_image\":\"1746170179.png\",\"tenures\":60,\"option1\":\"100% Online Process\",\"option2\":\"Convenient EMI Options\",\"option3\":\"Min. Paperwork\",\"option4\":null,\"option5\":null,\"title\":\"Your Eligibility Matches The Criteria | Easy & Quick Process\",\"applyurl\":\"https:\\/\\/in.faircentpro.com\\/?utm_source=wl&utm_medium=Mailer&campaign_name=Borrower_Partner&agf=WLA113767\",\"loanAmount\":617182,\"is_recommended\":1}]'),
(6, '2026-03-27 16:30:09', 6, '[{\"apply_id\":32,\"rec_date\":\"2025-06-28 16:05:55\",\"bankid\":13,\"roi\":10.5,\"bank_name\":\"Faircent\",\"bank_image\":\"1746170179.png\",\"tenures\":60,\"option1\":\"100% Online Process\",\"option2\":\"Convenient EMI Options\",\"option3\":\"Min. Paperwork\",\"option4\":null,\"option5\":null,\"title\":\"Your Eligibility Matches The Criteria | Easy & Quick Process\",\"applyurl\":\"https:\\/\\/in.faircentpro.com\\/?utm_source=wl&utm_medium=Mailer&campaign_name=Borrower_Partner&agf=WLA113767\",\"loanAmount\":617182,\"is_recommended\":1}]'),
(7, '2026-03-27 16:41:48', 7, '[{\"apply_id\":16,\"rec_date\":\"2025-05-03 17:04:30\",\"bankid\":11,\"roi\":10.5,\"bank_name\":\"Werize\",\"bank_image\":\"1746170219.png\",\"tenures\":60,\"option1\":\"100% Digital Process\",\"option2\":\"Convenient EMI Options\",\"option3\":\"Min. Paperwork\",\"option4\":null,\"option5\":null,\"title\":\"Your Eligibility Matches The Criteria | Instant Process\",\"applyurl\":\"https:\\/\\/partner.werize.com\\/MyBusiness\\/KREDBAZ%20SERVICE%20INDIA%20PRIVATE%20LIMITED\\/d2266f89-d2b0-4956-ba75-e95eca9cd08a\",\"loanAmount\":617182,\"is_recommended\":1}]'),
(8, '2026-03-27 16:50:06', 8, '[{\"apply_id\":32,\"rec_date\":\"2025-06-28 16:05:55\",\"bankid\":13,\"roi\":10.5,\"bank_name\":\"Faircent\",\"bank_image\":\"1746170179.png\",\"tenures\":60,\"option1\":\"100% Online Process\",\"option2\":\"Convenient EMI Options\",\"option3\":\"Min. Paperwork\",\"option4\":null,\"option5\":null,\"title\":\"Your Eligibility Matches The Criteria | Easy & Quick Process\",\"applyurl\":\"https:\\/\\/in.faircentpro.com\\/?utm_source=wl&utm_medium=Mailer&campaign_name=Borrower_Partner&agf=WLA113767\",\"loanAmount\":617182,\"is_recommended\":1}]'),
(9, '2026-03-27 16:56:56', 9, '[{\"apply_id\":16,\"rec_date\":\"2025-05-03 17:04:30\",\"bankid\":11,\"roi\":10.5,\"bank_name\":\"Werize\",\"bank_image\":\"1746170219.png\",\"tenures\":60,\"option1\":\"100% Digital Process\",\"option2\":\"Convenient EMI Options\",\"option3\":\"Min. Paperwork\",\"option4\":null,\"option5\":null,\"title\":\"Your Eligibility Matches The Criteria | Instant Process\",\"applyurl\":\"https:\\/\\/partner.werize.com\\/MyBusiness\\/KREDBAZ%20SERVICE%20INDIA%20PRIVATE%20LIMITED\\/d2266f89-d2b0-4956-ba75-e95eca9cd08a\",\"loanAmount\":617182,\"is_recommended\":1}]'),
(10, '2026-03-27 17:11:11', 10, '[{\"apply_id\":16,\"rec_date\":\"2025-05-03 17:04:30\",\"bankid\":11,\"roi\":10.5,\"bank_name\":\"Werize\",\"bank_image\":\"1746170219.png\",\"tenures\":60,\"option1\":\"100% Digital Process\",\"option2\":\"Convenient EMI Options\",\"option3\":\"Min. Paperwork\",\"option4\":null,\"option5\":null,\"title\":\"Your Eligibility Matches The Criteria | Instant Process\",\"applyurl\":\"https:\\/\\/partner.werize.com\\/MyBusiness\\/KREDBAZ%20SERVICE%20INDIA%20PRIVATE%20LIMITED\\/d2266f89-d2b0-4956-ba75-e95eca9cd08a\",\"loanAmount\":617182,\"is_recommended\":1}]'),
(11, '2026-03-28 11:37:00', 11, '[{\"apply_id\":16,\"rec_date\":\"2025-05-03 17:04:30\",\"bankid\":11,\"roi\":10.5,\"bank_name\":\"Werize\",\"bank_image\":\"1746170219.png\",\"tenures\":60,\"option1\":\"100% Digital Process\",\"option2\":\"Convenient EMI Options\",\"option3\":\"Min. Paperwork\",\"option4\":null,\"option5\":null,\"title\":\"Your Eligibility Matches The Criteria | Instant Process\",\"applyurl\":\"https:\\/\\/partner.werize.com\\/MyBusiness\\/KREDBAZ%20SERVICE%20INDIA%20PRIVATE%20LIMITED\\/d2266f89-d2b0-4956-ba75-e95eca9cd08a\",\"loanAmount\":875000,\"is_recommended\":1}]'),
(12, '2026-03-28 16:29:58', 12, '[{\"apply_id\":32,\"rec_date\":\"2025-06-28 16:05:55\",\"bankid\":13,\"roi\":10.5,\"bank_name\":\"Faircent\",\"bank_image\":\"1746170179.png\",\"tenures\":60,\"option1\":\"100% Online Process\",\"option2\":\"Convenient EMI Options\",\"option3\":\"Min. Paperwork\",\"option4\":null,\"option5\":null,\"title\":\"Your Eligibility Matches The Criteria | Easy & Quick Process\",\"applyurl\":\"https:\\/\\/in.faircentpro.com\\/?utm_source=wl&utm_medium=Mailer&campaign_name=Borrower_Partner&agf=WLA113767\",\"loanAmount\":195000,\"is_recommended\":1}]'),
(13, '2026-03-30 16:17:15', 13, '[{\"apply_id\":29,\"rec_date\":\"2025-06-05 12:49:55\",\"bankid\":8,\"roi\":10.5,\"bank_name\":\"Prfer\",\"bank_image\":\"1738654938.png\",\"tenures\":60,\"option1\":\"100% Online Process\",\"option2\":\"Convenient EMI Options\",\"option3\":\"Min. Paperwork\",\"option4\":null,\"option5\":null,\"title\":\"You\'re Eligible For Pre-Approved Loan Offer | Quick Process\",\"applyurl\":\"https:\\/\\/www.prefr.com\\/personal-loan\",\"loanAmount\":195000,\"is_recommended\":1}]'),
(14, '2026-03-30 16:28:30', 14, '[{\"apply_id\":16,\"rec_date\":\"2025-05-03 17:04:30\",\"bankid\":11,\"roi\":10.5,\"bank_name\":\"Werize\",\"bank_image\":\"1746170219.png\",\"tenures\":60,\"option1\":\"100% Digital Process\",\"option2\":\"Convenient EMI Options\",\"option3\":\"Min. Paperwork\",\"option4\":null,\"option5\":null,\"title\":\"Your Eligibility Matches The Criteria | Instant Process\",\"applyurl\":\"https:\\/\\/partner.werize.com\\/MyBusiness\\/KREDBAZ%20SERVICE%20INDIA%20PRIVATE%20LIMITED\\/d2266f89-d2b0-4956-ba75-e95eca9cd08a\",\"loanAmount\":617156,\"is_recommended\":1}]'),
(15, '2026-03-30 17:28:55', 15, '[{\"apply_id\":29,\"rec_date\":\"2025-06-05 12:49:55\",\"bankid\":8,\"roi\":10.5,\"bank_name\":\"Prfer\",\"bank_image\":\"1738654938.png\",\"tenures\":60,\"option1\":\"100% Online Process\",\"option2\":\"Convenient EMI Options\",\"option3\":\"Min. Paperwork\",\"option4\":null,\"option5\":null,\"title\":\"You\'re Eligible For Pre-Approved Loan Offer | Quick Process\",\"applyurl\":\"https:\\/\\/www.prefr.com\\/personal-loan\",\"loanAmount\":617182,\"is_recommended\":1}]'),
(16, '2026-03-30 17:31:53', 16, '[{\"apply_id\":29,\"rec_date\":\"2025-06-05 12:49:55\",\"bankid\":8,\"roi\":10.5,\"bank_name\":\"Prfer\",\"bank_image\":\"1738654938.png\",\"tenures\":60,\"option1\":\"100% Online Process\",\"option2\":\"Convenient EMI Options\",\"option3\":\"Min. Paperwork\",\"option4\":null,\"option5\":null,\"title\":\"You\'re Eligible For Pre-Approved Loan Offer | Quick Process\",\"applyurl\":\"https:\\/\\/www.prefr.com\\/personal-loan\",\"loanAmount\":195000,\"is_recommended\":1}]'),
(17, '2026-04-02 17:18:45', 18, '[{\"apply_id\":29,\"rec_date\":\"2025-06-05 12:49:55\",\"bankid\":8,\"roi\":10.5,\"bank_name\":\"Prfer\",\"bank_image\":\"1738654938.png\",\"tenures\":60,\"option1\":\"100% Online Process\",\"option2\":\"Convenient EMI Options\",\"option3\":\"Min. Paperwork\",\"option4\":null,\"option5\":null,\"title\":\"You\'re Eligible For Pre-Approved Loan Offer | Quick Process\",\"applyurl\":\"https:\\/\\/www.prefr.com\\/personal-loan\",\"loanAmount\":875000,\"is_recommended\":1}]'),
(18, '2026-04-06 15:30:49', 19, '[{\"apply_id\":29,\"rec_date\":\"2025-06-05 12:49:55\",\"bankid\":8,\"roi\":10.5,\"bank_name\":\"Prfer\",\"bank_image\":\"1738654938.png\",\"tenures\":60,\"option1\":\"100% Online Process\",\"option2\":\"Convenient EMI Options\",\"option3\":\"Min. Paperwork\",\"option4\":null,\"option5\":null,\"title\":\"You\'re Eligible For Pre-Approved Loan Offer | Quick Process\",\"applyurl\":\"https:\\/\\/www.prefr.com\\/personal-loan\",\"loanAmount\":195000,\"is_recommended\":1}]'),
(19, '2026-04-07 11:47:30', 20, '[{\"apply_id\":32,\"rec_date\":\"2025-06-28 16:05:55\",\"bankid\":13,\"roi\":10.5,\"bank_name\":\"Faircent\",\"bank_image\":\"1746170179.png\",\"tenures\":60,\"option1\":\"100% Online Process\",\"option2\":\"Convenient EMI Options\",\"option3\":\"Min. Paperwork\",\"option4\":null,\"option5\":null,\"title\":\"Your Eligibility Matches The Criteria | Easy & Quick Process\",\"applyurl\":\"https:\\/\\/in.faircentpro.com\\/?utm_source=wl&utm_medium=Mailer&campaign_name=Borrower_Partner&agf=WLA113767\",\"loanAmount\":875000,\"is_recommended\":1}]'),
(20, '2026-04-07 12:26:40', 21, '[{\"apply_id\":32,\"rec_date\":\"2025-06-28 16:05:55\",\"bankid\":13,\"roi\":10.5,\"bank_name\":\"Faircent\",\"bank_image\":\"1746170179.png\",\"tenures\":60,\"option1\":\"100% Online Process\",\"option2\":\"Convenient EMI Options\",\"option3\":\"Min. Paperwork\",\"option4\":null,\"option5\":null,\"title\":\"Your Eligibility Matches The Criteria | Easy & Quick Process\",\"applyurl\":\"https:\\/\\/in.faircentpro.com\\/?utm_source=wl&utm_medium=Mailer&campaign_name=Borrower_Partner&agf=WLA113767\",\"loanAmount\":195000,\"is_recommended\":1}]'),
(21, '2026-04-07 12:48:25', 22, '[{\"apply_id\":16,\"rec_date\":\"2025-05-03 17:04:30\",\"bankid\":11,\"roi\":10.5,\"bank_name\":\"Werize\",\"bank_image\":\"1746170219.png\",\"tenures\":60,\"option1\":\"100% Digital Process\",\"option2\":\"Convenient EMI Options\",\"option3\":\"Min. Paperwork\",\"option4\":null,\"option5\":null,\"title\":\"Your Eligibility Matches The Criteria | Instant Process\",\"applyurl\":\"https:\\/\\/partner.werize.com\\/MyBusiness\\/KREDBAZ%20SERVICE%20INDIA%20PRIVATE%20LIMITED\\/d2266f89-d2b0-4956-ba75-e95eca9cd08a\",\"loanAmount\":246872,\"is_recommended\":1}]'),
(22, '2026-04-07 12:49:03', 23, '[{\"apply_id\":29,\"rec_date\":\"2025-06-05 12:49:55\",\"bankid\":8,\"roi\":10.5,\"bank_name\":\"Prfer\",\"bank_image\":\"1738654938.png\",\"tenures\":60,\"option1\":\"100% Online Process\",\"option2\":\"Convenient EMI Options\",\"option3\":\"Min. Paperwork\",\"option4\":null,\"option5\":null,\"title\":\"You\'re Eligible For Pre-Approved Loan Offer | Quick Process\",\"applyurl\":\"https:\\/\\/www.prefr.com\\/personal-loan\",\"loanAmount\":875000,\"is_recommended\":1}]'),
(23, '2026-04-08 16:31:33', 24, '[{\"apply_id\":32,\"rec_date\":\"2025-06-28 16:05:55\",\"bankid\":13,\"roi\":10.5,\"bank_name\":\"Faircent\",\"bank_image\":\"1746170179.png\",\"tenures\":60,\"option1\":\"100% Online Process\",\"option2\":\"Convenient EMI Options\",\"option3\":\"Min. Paperwork\",\"option4\":null,\"option5\":null,\"title\":\"Your Eligibility Matches The Criteria | Easy & Quick Process\",\"applyurl\":\"https:\\/\\/in.faircentpro.com\\/?utm_source=wl&utm_medium=Mailer&campaign_name=Borrower_Partner&agf=WLA113767\",\"loanAmount\":875000,\"is_recommended\":1}]'),
(24, '2026-04-09 16:40:07', 25, '[{\"apply_id\":29,\"rec_date\":\"2025-06-05 12:49:55\",\"bankid\":8,\"roi\":10.5,\"bank_name\":\"Prfer\",\"bank_image\":\"1738654938.png\",\"tenures\":60,\"option1\":\"100% Online Process\",\"option2\":\"Convenient EMI Options\",\"option3\":\"Min. Paperwork\",\"option4\":null,\"option5\":null,\"title\":\"You\'re Eligible For Pre-Approved Loan Offer | Quick Process\",\"applyurl\":\"https:\\/\\/www.prefr.com\\/personal-loan\",\"loanAmount\":195000,\"is_recommended\":1}]'),
(25, '2026-04-10 14:29:51', 26, '[{\"apply_id\":16,\"rec_date\":\"2025-05-03 17:04:30\",\"bankid\":11,\"roi\":10.5,\"bank_name\":\"Werize\",\"bank_image\":\"1746170219.png\",\"tenures\":60,\"option1\":\"100% Digital Process\",\"option2\":\"Convenient EMI Options\",\"option3\":\"Min. Paperwork\",\"option4\":null,\"option5\":null,\"title\":\"Your Eligibility Matches The Criteria | Instant Process\",\"applyurl\":\"https:\\/\\/partner.werize.com\\/MyBusiness\\/KREDBAZ%20SERVICE%20INDIA%20PRIVATE%20LIMITED\\/d2266f89-d2b0-4956-ba75-e95eca9cd08a\",\"loanAmount\":195000,\"is_recommended\":1}]'),
(26, '2026-04-10 15:14:17', 27, '[{\"apply_id\":16,\"rec_date\":\"2025-05-03 17:04:30\",\"bankid\":11,\"roi\":10.5,\"bank_name\":\"Werize\",\"bank_image\":\"1746170219.png\",\"tenures\":60,\"option1\":\"100% Digital Process\",\"option2\":\"Convenient EMI Options\",\"option3\":\"Min. Paperwork\",\"option4\":null,\"option5\":null,\"title\":\"Your Eligibility Matches The Criteria | Instant Process\",\"applyurl\":\"https:\\/\\/partner.werize.com\\/MyBusiness\\/KREDBAZ%20SERVICE%20INDIA%20PRIVATE%20LIMITED\\/d2266f89-d2b0-4956-ba75-e95eca9cd08a\",\"loanAmount\":195000,\"is_recommended\":1}]'),
(27, '2026-04-11 15:39:31', 28, '[{\"apply_id\":16,\"rec_date\":\"2025-05-03 17:04:30\",\"bankid\":11,\"roi\":10.5,\"bank_name\":\"Werize\",\"bank_image\":\"1746170219.png\",\"tenures\":60,\"option1\":\"100% Digital Process\",\"option2\":\"Convenient EMI Options\",\"option3\":\"Min. Paperwork\",\"option4\":null,\"option5\":null,\"title\":\"Your Eligibility Matches The Criteria | Instant Process\",\"applyurl\":\"https:\\/\\/partner.werize.com\\/MyBusiness\\/KREDBAZ%20SERVICE%20INDIA%20PRIVATE%20LIMITED\\/d2266f89-d2b0-4956-ba75-e95eca9cd08a\",\"loanAmount\":195000,\"is_recommended\":1}]'),
(28, '2026-04-13 18:17:51', 30, '[{\"apply_id\":32,\"rec_date\":\"2025-06-28 16:05:55\",\"bankid\":13,\"roi\":10.5,\"bank_name\":\"Faircent\",\"bank_image\":\"1746170179.png\",\"tenures\":60,\"option1\":\"100% Online Process\",\"option2\":\"Convenient EMI Options\",\"option3\":\"Min. Paperwork\",\"option4\":null,\"option5\":null,\"title\":\"Your Eligibility Matches The Criteria | Easy & Quick Process\",\"applyurl\":\"https:\\/\\/in.faircentpro.com\\/?utm_source=wl&utm_medium=Mailer&campaign_name=Borrower_Partner&agf=WLA113767\",\"loanAmount\":195000,\"is_recommended\":1}]'),
(29, '2026-04-15 14:20:28', 31, '[{\"apply_id\":16,\"rec_date\":\"2025-05-03 17:04:30\",\"bankid\":11,\"roi\":10.5,\"bank_name\":\"Werize\",\"bank_image\":\"1746170219.png\",\"tenures\":60,\"option1\":\"100% Digital Process\",\"option2\":\"Convenient EMI Options\",\"option3\":\"Min. Paperwork\",\"option4\":null,\"option5\":null,\"title\":\"Your Eligibility Matches The Criteria | Instant Process\",\"applyurl\":\"https:\\/\\/partner.werize.com\\/MyBusiness\\/KREDBAZ%20SERVICE%20INDIA%20PRIVATE%20LIMITED\\/d2266f89-d2b0-4956-ba75-e95eca9cd08a\",\"loanAmount\":195000,\"is_recommended\":1}]'),
(30, '2026-04-15 14:36:51', 32, '[{\"apply_id\":32,\"rec_date\":\"2025-06-28 16:05:55\",\"bankid\":13,\"roi\":10.5,\"bank_name\":\"Faircent\",\"bank_image\":\"1746170179.png\",\"tenures\":60,\"option1\":\"100% Online Process\",\"option2\":\"Convenient EMI Options\",\"option3\":\"Min. Paperwork\",\"option4\":null,\"option5\":null,\"title\":\"Your Eligibility Matches The Criteria | Easy & Quick Process\",\"applyurl\":\"https:\\/\\/in.faircentpro.com\\/?utm_source=wl&utm_medium=Mailer&campaign_name=Borrower_Partner&agf=WLA113767\",\"loanAmount\":468643,\"is_recommended\":1}]'),
(31, '2026-04-15 14:57:54', 33, '[{\"apply_id\":32,\"rec_date\":\"2025-06-28 16:05:55\",\"bankid\":13,\"roi\":10.5,\"bank_name\":\"Faircent\",\"bank_image\":\"1746170179.png\",\"tenures\":60,\"option1\":\"100% Online Process\",\"option2\":\"Convenient EMI Options\",\"option3\":\"Min. Paperwork\",\"option4\":null,\"option5\":null,\"title\":\"Your Eligibility Matches The Criteria | Easy & Quick Process\",\"applyurl\":\"https:\\/\\/in.faircentpro.com\\/?utm_source=wl&utm_medium=Mailer&campaign_name=Borrower_Partner&agf=WLA113767\",\"loanAmount\":195000,\"is_recommended\":1}]'),
(32, '2026-04-15 15:25:14', 34, '[{\"apply_id\":16,\"rec_date\":\"2025-05-03 17:04:30\",\"bankid\":11,\"roi\":10.5,\"bank_name\":\"Werize\",\"bank_image\":\"1746170219.png\",\"tenures\":60,\"option1\":\"100% Digital Process\",\"option2\":\"Convenient EMI Options\",\"option3\":\"Min. Paperwork\",\"option4\":null,\"option5\":null,\"title\":\"Your Eligibility Matches The Criteria | Instant Process\",\"applyurl\":\"https:\\/\\/partner.werize.com\\/MyBusiness\\/KREDBAZ%20SERVICE%20INDIA%20PRIVATE%20LIMITED\\/d2266f89-d2b0-4956-ba75-e95eca9cd08a\",\"loanAmount\":875000,\"is_recommended\":1}]'),
(33, '2026-04-15 18:24:51', 35, '[{\"apply_id\":32,\"rec_date\":\"2025-06-28 16:05:55\",\"bankid\":13,\"roi\":10.5,\"bank_name\":\"Faircent\",\"bank_image\":\"1746170179.png\",\"tenures\":60,\"option1\":\"100% Online Process\",\"option2\":\"Convenient EMI Options\",\"option3\":\"Min. Paperwork\",\"option4\":null,\"option5\":null,\"title\":\"Your Eligibility Matches The Criteria | Easy & Quick Process\",\"applyurl\":\"https:\\/\\/in.faircentpro.com\\/?utm_source=wl&utm_medium=Mailer&campaign_name=Borrower_Partner&agf=WLA113767\",\"loanAmount\":875000,\"is_recommended\":1}]'),
(34, '2026-04-16 11:35:52', 36, '[{\"apply_id\":32,\"rec_date\":\"2025-06-28 16:05:55\",\"bankid\":13,\"roi\":10.5,\"bank_name\":\"Faircent\",\"bank_image\":\"1746170179.png\",\"tenures\":60,\"option1\":\"100% Online Process\",\"option2\":\"Convenient EMI Options\",\"option3\":\"Min. Paperwork\",\"option4\":null,\"option5\":null,\"title\":\"Your Eligibility Matches The Criteria | Easy & Quick Process\",\"applyurl\":\"https:\\/\\/in.faircentpro.com\\/?utm_source=wl&utm_medium=Mailer&campaign_name=Borrower_Partner&agf=WLA113767\",\"loanAmount\":195000,\"is_recommended\":1}]'),
(35, '2026-04-17 13:16:04', 37, '[{\"apply_id\":32,\"rec_date\":\"2025-06-28 16:05:55\",\"bankid\":13,\"roi\":10.5,\"bank_name\":\"Faircent\",\"bank_image\":\"1746170179.png\",\"tenures\":60,\"option1\":\"100% Online Process\",\"option2\":\"Convenient EMI Options\",\"option3\":\"Min. Paperwork\",\"option4\":null,\"option5\":null,\"title\":\"Your Eligibility Matches The Criteria | Easy & Quick Process\",\"applyurl\":\"https:\\/\\/in.faircentpro.com\\/?utm_source=wl&utm_medium=Mailer&campaign_name=Borrower_Partner&agf=WLA113767\",\"loanAmount\":246862,\"is_recommended\":1}]'),
(36, '2026-04-17 13:17:53', 38, '[{\"apply_id\":32,\"rec_date\":\"2025-06-28 16:05:55\",\"bankid\":13,\"roi\":10.5,\"bank_name\":\"Faircent\",\"bank_image\":\"1746170179.png\",\"tenures\":60,\"option1\":\"100% Online Process\",\"option2\":\"Convenient EMI Options\",\"option3\":\"Min. Paperwork\",\"option4\":null,\"option5\":null,\"title\":\"Your Eligibility Matches The Criteria | Easy & Quick Process\",\"applyurl\":\"https:\\/\\/in.faircentpro.com\\/?utm_source=wl&utm_medium=Mailer&campaign_name=Borrower_Partner&agf=WLA113767\",\"loanAmount\":195000,\"is_recommended\":1}]'),
(37, '2026-04-18 12:17:39', 39, '[{\"apply_id\":32,\"rec_date\":\"2025-06-28 16:05:55\",\"bankid\":13,\"roi\":10.5,\"bank_name\":\"Faircent\",\"bank_image\":\"1746170179.png\",\"tenures\":60,\"option1\":\"100% Online Process\",\"option2\":\"Convenient EMI Options\",\"option3\":\"Min. Paperwork\",\"option4\":null,\"option5\":null,\"title\":\"Your Eligibility Matches The Criteria | Easy & Quick Process\",\"applyurl\":\"https:\\/\\/in.faircentpro.com\\/?utm_source=wl&utm_medium=Mailer&campaign_name=Borrower_Partner&agf=WLA113767\",\"loanAmount\":195000,\"is_recommended\":1}]'),
(38, '2026-04-18 12:36:42', 40, '[{\"apply_id\":32,\"rec_date\":\"2025-06-28 16:05:55\",\"bankid\":13,\"roi\":10.5,\"bank_name\":\"Faircent\",\"bank_image\":\"1746170179.png\",\"tenures\":60,\"option1\":\"100% Online Process\",\"option2\":\"Convenient EMI Options\",\"option3\":\"Min. Paperwork\",\"option4\":null,\"option5\":null,\"title\":\"Your Eligibility Matches The Criteria | Easy & Quick Process\",\"applyurl\":\"https:\\/\\/in.faircentpro.com\\/?utm_source=wl&utm_medium=Mailer&campaign_name=Borrower_Partner&agf=WLA113767\",\"loanAmount\":875000,\"is_recommended\":1}]'),
(39, '2026-04-18 12:42:20', 41, '[{\"apply_id\":32,\"rec_date\":\"2025-06-28 16:05:55\",\"bankid\":13,\"roi\":10.5,\"bank_name\":\"Faircent\",\"bank_image\":\"1746170179.png\",\"tenures\":60,\"option1\":\"100% Online Process\",\"option2\":\"Convenient EMI Options\",\"option3\":\"Min. Paperwork\",\"option4\":null,\"option5\":null,\"title\":\"Your Eligibility Matches The Criteria | Easy & Quick Process\",\"applyurl\":\"https:\\/\\/in.faircentpro.com\\/?utm_source=wl&utm_medium=Mailer&campaign_name=Borrower_Partner&agf=WLA113767\",\"loanAmount\":875000,\"is_recommended\":1}]'),
(40, '2026-04-18 15:44:48', 42, '[{\"apply_id\":32,\"rec_date\":\"2025-06-28 16:05:55\",\"bankid\":13,\"roi\":10.5,\"bank_name\":\"Faircent\",\"bank_image\":\"1746170179.png\",\"tenures\":60,\"option1\":\"100% Online Process\",\"option2\":\"Convenient EMI Options\",\"option3\":\"Min. Paperwork\",\"option4\":null,\"option5\":null,\"title\":\"Your Eligibility Matches The Criteria | Easy & Quick Process\",\"applyurl\":\"https:\\/\\/in.faircentpro.com\\/?utm_source=wl&utm_medium=Mailer&campaign_name=Borrower_Partner&agf=WLA113767\",\"loanAmount\":195000,\"is_recommended\":1}]'),
(41, '2026-04-20 15:53:27', 43, '[{\"apply_id\":32,\"rec_date\":\"2025-06-28 16:05:55\",\"bankid\":13,\"roi\":10.5,\"bank_name\":\"Faircent\",\"bank_image\":\"1746170179.png\",\"tenures\":60,\"option1\":\"100% Online Process\",\"option2\":\"Convenient EMI Options\",\"option3\":\"Min. Paperwork\",\"option4\":null,\"option5\":null,\"title\":\"Your Eligibility Matches The Criteria | Easy & Quick Process\",\"applyurl\":\"https:\\/\\/in.faircentpro.com\\/?utm_source=wl&utm_medium=Mailer&campaign_name=Borrower_Partner&agf=WLA113767\",\"loanAmount\":255109,\"is_recommended\":1}]');

-- --------------------------------------------------------

--
-- Table structure for table `user_payout_documents`
--

CREATE TABLE `user_payout_documents` (
  `id` int(11) NOT NULL,
  `rec_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `userid` int(11) NOT NULL,
  `gstdoc` varchar(256) DEFAULT NULL,
  `gstdoc_number` varchar(256) DEFAULT NULL,
  `aadharcard` varchar(256) DEFAULT NULL,
  `aadharcard_number` varchar(256) DEFAULT NULL,
  `pancard` varchar(256) DEFAULT NULL,
  `pancard_number` varchar(256) DEFAULT NULL,
  `cancelcheque` varchar(256) DEFAULT NULL,
  `remarks` varchar(256) NOT NULL,
  `isVerified` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=No, 1=Yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_registrations`
--

CREATE TABLE `user_registrations` (
  `id` int(11) NOT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `offerpage` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 = none, 1 = la offer 1, 2 = la offer 2, 3 = la offer 3, 4 = sa offer 1, 5 = sa offer 2, 6 = sa offer 3, 7 = sa offer 4, 8 = la offer 4, 9 = sa offer 5, 10 = la offer 5',
  `rec_date` datetime NOT NULL,
  `update_date` datetime NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `mobile` varchar(55) NOT NULL,
  `email` varchar(55) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `pancard` varchar(55) DEFAULT NULL,
  `pincode` varchar(55) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(115) DEFAULT NULL,
  `process_step` tinyint(4) NOT NULL DEFAULT 0,
  `refcode` varchar(55) DEFAULT NULL,
  `acc_type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=none, 1=selfapply, 2=loan-agent, 3=loan assistant',
  `company_name` varchar(99) DEFAULT NULL,
  `company_gst` varchar(99) DEFAULT NULL,
  `isUser` tinyint(4) NOT NULL DEFAULT 1 COMMENT '\r\n1=steps,2=register',
  `iAgree` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0=checked,1=unchecked',
  `isDnd` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=no, 1=yes',
  `isVerified` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=no, 1=yes',
  `isDelete` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=active, 1=delete',
  `isActive` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1= active, 0=noactive'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user_registrations`
--

INSERT INTO `user_registrations` (`id`, `staff_id`, `offerpage`, `rec_date`, `update_date`, `first_name`, `last_name`, `mobile`, `email`, `password`, `dob`, `pancard`, `pincode`, `city`, `state`, `process_step`, `refcode`, `acc_type`, `company_name`, `company_gst`, `isUser`, `iAgree`, `isDnd`, `isVerified`, `isDelete`, `isActive`) VALUES
(1, 3, 0, '2026-04-07 12:49:22', '2026-04-07 12:49:22', 'Verloop', 'Web', '9408881214', 'verloop.dev4@gmail.com', '$2y$12$dEyfTNsCpUCxnsZBvR4U3uhKOGdZma7XirDTI/n0MvaBnUdBa2NPi', '2005-05-09', NULL, '395004', 'Surat', 'Gujarat', 5, '1214', 1, NULL, NULL, 2, 1, 0, 0, 1, 1),
(2, NULL, 0, '2026-03-24 11:03:10', '2026-03-28 11:32:23', 'Era', 'Patel', '9033149430', 'era@gmail.com', NULL, NULL, NULL, '395002', 'Surat', 'Gujarat', 4, NULL, 1, NULL, NULL, 1, 1, 0, 0, 0, 1),
(3, NULL, 0, '2026-03-24 14:00:31', '2026-03-24 14:00:44', 'EasyAi', 'Loan', '6358141826', 'easyailoan@gmail.com', '$2y$12$Yzr4VzqkBAf.P27xX959TescFQYSmovNMzybnBFS9kUueEiJqcvim', NULL, NULL, '342008', 'Jodhpur', 'Rajasthan', 4, NULL, 1, NULL, NULL, 1, 1, 0, 0, 1, 1),
(4, 4, 0, '2026-03-30 17:03:50', '2026-03-30 17:03:50', 'Verloop', 'Web', '9409665995', 'verloop.dev4@gmail.com', '$2y$12$mGqCXjSwlBAjSspcarNFG.hESrw8jKugK.utOrahNhFOkuV4FFYg2', NULL, NULL, '395004', 'Surat', 'Gujarat', 5, 'ver5995', 2, NULL, NULL, 2, 1, 0, 0, 0, 1),
(10, 4, 0, '2026-03-30 17:19:11', '2026-03-30 17:19:11', 'Verloop', 'Web', '9974360572', 'verloop.dev4@gmail.com', '$2y$12$g1GmNh454UOf2k/gQ/T4XuVQg.Y31JcCLKhJqWBKu3bYvP2e6HmP6', NULL, NULL, '395004', 'Surat', 'Gujarat', 5, 'ver0572', 2, NULL, NULL, 2, 1, 0, 0, 1, 1),
(11, 1, 0, '2026-03-28 11:57:55', '2026-03-28 11:57:55', 'Sufiya', 'Praveen', '9983933314', 'sufiyapraveen71@gmail.com', '$2y$12$NIpi8xDfu8xLNABHr0KYL.JZ73wsb2/D2hq0RQkNyG2pT2fbzCNvq', NULL, NULL, '342001', 'Jodhpur', 'Rajasthan', 5, '3314', 1, NULL, NULL, 2, 1, 0, 0, 0, 1),
(12, 1, 0, '2026-03-28 17:32:51', '2026-03-28 17:46:55', 'EasyAi', 'Loan', '8099111111', 'easyailoan@gmail.com', '$2y$12$NLKTpTkoYV6Bs661erumf.lkEQgoDL2i1nQRVyA6xs8K4xQ0VUxsO', NULL, NULL, '342008', 'Jodhpur', 'Rajasthan', 4, '1111', 1, NULL, NULL, 2, 1, 0, 0, 0, 1),
(13, NULL, 0, '2026-03-30 16:17:02', '2026-03-30 17:25:32', 'EasyAi', 'Loan', '8810011100', 'easyailoan@gmail.com', NULL, NULL, NULL, '342008', 'Jodhpur', 'Rajasthan', 4, NULL, 2, NULL, NULL, 1, 1, 0, 0, 0, 1),
(14, 4, 0, '2026-03-31 11:40:51', '2026-03-31 11:40:51', 'Parth', 'S', '9904466599', 'psurti07@gmail.com', '$2y$12$iEMegdvCjNkXMttFZi9GyOVcL.MkF.TrRF3SIAWtfWRhW2tRZI79K', NULL, NULL, '395001', 'Surat', 'Gujarat', 5, 'par6599', 2, NULL, NULL, 2, 1, 0, 0, 0, 1),
(15, NULL, 0, '2026-03-30 17:28:44', '2026-04-06 15:27:11', 'Verloop', 'Web', '7283934596', 'verloop.dev4@gmail.com', NULL, NULL, NULL, '395004', 'Surat', 'Gujarat', 4, NULL, 2, NULL, NULL, 1, 1, 0, 0, 1, 1),
(16, NULL, 0, '2026-03-30 17:31:49', '2026-03-30 17:31:58', 'EasyAi', 'Loan', '9801010000', 'easyailoan@gmail.com', NULL, NULL, NULL, '342008', 'Jodhpur', 'Rajasthan', 4, NULL, 2, NULL, NULL, 1, 1, 0, 0, 0, 1),
(17, NULL, 0, '2026-03-31 11:49:29', '2026-03-31 11:49:29', NULL, NULL, '8909090909', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, 2, NULL, NULL, 1, 1, 0, 0, 0, 1),
(18, 4, 0, '2026-04-02 17:50:00', '2026-04-02 17:50:00', 'EasyAi', 'Loan', '9011100000', 'easyailoan@gmail.com', '$2y$12$AwiNOaGlbmPRKPJp3B9LKuYdYlwPy3judM3bFe0FmDW6NQcJk7OD6', NULL, NULL, '342008', 'Jodhpur', 'Rajasthan', 5, 'eas0000', 2, NULL, NULL, 2, 1, 0, 0, 0, 1),
(19, NULL, 0, '2026-04-06 15:30:34', '2026-04-06 17:14:26', 'Verloop', 'Web', '9999999999', 'verloop.dev4@gmail.com', NULL, NULL, NULL, '395004', 'Surat', 'Gujarat', 4, NULL, 1, NULL, NULL, 1, 1, 0, 0, 1, 1),
(20, 3, 0, '2026-04-07 12:04:05', '2026-04-07 12:04:05', 'Anita', 'Parmar', '9983933307', 'easyailoan@gmail.com', '$2y$12$LGAY35aBD1F0HPQg8IxQsOVPZdEWDfXhor29Hqnk6OzmkTUHK5KR2', NULL, NULL, '342008', 'Jodhpur', 'Rajasthan', 5, '3307', 1, NULL, NULL, 2, 1, 0, 0, 1, 1),
(21, NULL, 0, '2026-04-07 12:24:59', '2026-04-07 12:43:58', 'Test', 'Test', '6358265226', 'rutikavyas@123.com', NULL, NULL, NULL, '395005', 'Surat', 'Gujarat', 4, NULL, 1, NULL, NULL, 1, 1, 0, 0, 1, 1),
(22, NULL, 0, '2026-04-07 12:47:45', '2026-04-07 12:48:31', 'Test', 'Test', '6358265226', 'prajaptirutika@1301gmail.com', NULL, NULL, NULL, '395007', 'Surat', 'Gujarat', 4, NULL, 2, NULL, NULL, 1, 1, 0, 0, 1, 1),
(23, 4, 0, '2026-04-07 12:52:36', '2026-04-07 12:52:36', 'Rutvi', 'Gohel', '6358141826', 'indiakarobarofficial@gmail.com', '$2y$12$Yzr4VzqkBAf.P27xX959TescFQYSmovNMzybnBFS9kUueEiJqcvim', NULL, NULL, '395005', 'Surat', 'Gujarat', 5, 'rut1826', 2, NULL, NULL, 2, 1, 0, 0, 1, 1),
(24, 3, 0, '2026-04-08 16:34:11', '2026-04-08 16:34:11', 'Anita', 'Parmar', '6358141826', 'easyailoan@gmail.com', '$2y$12$Yzr4VzqkBAf.P27xX959TescFQYSmovNMzybnBFS9kUueEiJqcvim', NULL, NULL, '342008', 'Jodhpur', 'Rajasthan', 5, '1826', 1, NULL, NULL, 2, 1, 0, 0, 1, 1),
(25, NULL, 0, '2026-04-09 12:48:14', '2026-04-09 12:48:14', 'Parth', 'Surti', '9408881214', 'verloop.dev4@gmail.com', '$2y$12$j9/nwY0l26Ieeb6pRXl67eubOxZUMgBskllvFuGQukLbWmMSTn7yS', NULL, NULL, '342008', 'Jodhpur', 'Rajasthan', 5, 'par1214', 1, NULL, NULL, 2, 1, 0, 0, 0, 1),
(26, NULL, 0, '2026-04-10 14:29:27', '2026-04-13 11:47:06', 'Tamanna', 'Vegada', '6358362869', 'indiakarobartrainner@gmail.com', NULL, NULL, NULL, '395004', 'Surat', 'Gujarat', 4, NULL, 1, NULL, NULL, 1, 1, 0, 0, 0, 1),
(27, NULL, 0, '2026-04-10 15:14:05', '2026-04-10 15:14:26', 'Verloop', 'Web', '9974360572', 'verloop.dev4@gmail.com', NULL, NULL, NULL, '395004', 'Surat', 'Gujarat', 4, NULL, 1, NULL, NULL, 1, 1, 0, 0, 1, 1),
(28, 3, 0, '2026-04-13 15:09:00', '2026-04-13 15:09:00', 'Kavita', 'Nayk', '7340237079', 'shramakavita31@gmail.com', '$2y$12$VvGZLwbvH859ckDXewgnS.cidbnShkU3rFEUGvT8SeMC7t5bblv26', NULL, NULL, '342001', 'Jodhpur', 'Rajasthan', 5, '7079', 1, NULL, NULL, 2, 1, 0, 0, 0, 1),
(29, NULL, 0, '2026-04-13 15:54:47', '2026-04-13 15:54:47', NULL, NULL, '9983933306', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, 1, NULL, NULL, 1, 1, 0, 0, 0, 1),
(30, NULL, 0, '2026-04-13 18:17:04', '2026-04-18 08:28:12', 'KANHAIYA', 'PRASAD', '9928182860', 'prasadkanhaiya726@gmail.com', NULL, NULL, NULL, '342005', 'Jodhpur', 'Rajasthan', 4, NULL, 1, NULL, NULL, 1, 1, 0, 0, 0, 1),
(31, 3, 0, '2026-04-15 14:26:41', '2026-04-15 14:26:41', 'Anita', 'Parmar', '6358141826', 'indiakarobarofficial@gmail.com', '$2y$12$Yzr4VzqkBAf.P27xX959TescFQYSmovNMzybnBFS9kUueEiJqcvim', NULL, NULL, '395005', 'Surat', 'Gujarat', 5, '1826', 1, NULL, NULL, 2, 1, 0, 0, 1, 1),
(32, NULL, 0, '2026-04-15 14:36:46', '2026-04-15 14:36:57', 'EasyAi', 'Loan', '9998892746', 'easyailoan@gmail.com', NULL, NULL, NULL, '342008', 'Jodhpur', 'Rajasthan', 4, NULL, 1, NULL, NULL, 1, 1, 0, 0, 0, 1),
(33, NULL, 0, '2026-04-15 14:57:49', '2026-04-18 12:35:33', 'EasyAi', 'Loan', '6358141826', 'easyailoan@gmail.com', '$2y$12$Yzr4VzqkBAf.P27xX959TescFQYSmovNMzybnBFS9kUueEiJqcvim', NULL, NULL, '342008', 'Jodhpur', 'Rajasthan', 4, NULL, 2, NULL, NULL, 1, 1, 0, 0, 1, 1),
(34, 4, 0, '2026-04-15 15:51:45', '2026-04-15 15:51:45', 'Anita', 'Parmar', '9983933307', 'easyailoan@gmail.com', '$2y$12$yEXmKXPKgP7he1Kkc0AZFunOns2VqYpC8DVJP3ZvDNxvoi1HoqnGi', NULL, NULL, '342008', 'Jodhpur', 'Rajasthan', 5, 'ani3307', 2, NULL, NULL, 2, 1, 0, 0, 0, 1),
(35, NULL, 0, '2026-04-15 18:22:54', '2026-04-15 18:25:18', 'Ranjit', 'Kumar', '6202396342', 'choudhariiir@gmail.com', NULL, NULL, NULL, '342012', 'Jodhpur', 'Rajasthan', 4, NULL, 1, NULL, NULL, 1, 1, 0, 0, 0, 1),
(36, 3, 0, '2026-04-16 11:46:44', '2026-04-16 11:46:44', 'DILEEP', 'SINGH', '9772068028', 'dileeprathore1999@gmail.com', '$2y$12$zJcqC50OSAk7qKu3orTLkuclq4PNN4IZg9qK3X8.iJ/JpF5U5mcJW', NULL, NULL, '342025', 'Phalodi', 'Rajasthan', 5, '8028', 1, NULL, NULL, 2, 1, 0, 0, 0, 1),
(37, NULL, 0, '2026-04-17 13:15:22', '2026-04-17 13:17:30', 'Teekma Ram', 'Jani', '6375723886', 'janiteekmaram@gmail.com', NULL, NULL, NULL, '343027', 'Chitalwana', 'Rajasthan', 4, NULL, 1, NULL, NULL, 1, 1, 0, 0, 0, 1),
(38, 3, 0, '2026-04-17 13:27:09', '2026-04-17 13:27:09', 'Pratap Singh', 'Rathore', '9829222317', 'pratapsingh0502@gmail.com', '$2y$12$fq1Ijw8PTHFcuYsyM38w7uR2NiHWP0XEQ9OelkwOVi7Pj1xg4BDWa', NULL, NULL, '344035', 'Barmer', 'Rajasthan', 5, '2317', 1, NULL, NULL, 2, 1, 0, 0, 0, 1),
(39, NULL, 0, '2026-04-18 12:17:06', '2026-04-18 12:48:06', 'Isha', 'Parmar', '7046134946', 'ishaparmar@gmail.com', NULL, NULL, NULL, '395004', 'Surat', 'Gujarat', 4, NULL, 1, NULL, NULL, 1, 1, 0, 0, 1, 1),
(40, 3, 0, '2026-04-18 12:39:08', '2026-04-18 12:39:08', 'Anita', 'Parmar', '6358141826', 'easyailoan@gmail.com', '$2y$12$Yzr4VzqkBAf.P27xX959TescFQYSmovNMzybnBFS9kUueEiJqcvim', NULL, NULL, '342008', 'Jodhpur', 'Rajasthan', 5, '1826', 1, NULL, NULL, 2, 1, 0, 0, 1, 1),
(41, 4, 0, '2026-04-18 12:44:16', '2026-04-18 12:44:16', 'Anita', 'Parmar', '6358141826', 'easyailoan@gmail.com', '$2y$12$Yzr4VzqkBAf.P27xX959TescFQYSmovNMzybnBFS9kUueEiJqcvim', NULL, NULL, '342008', 'Jodhpur', 'Rajasthan', 5, 'ani1826', 2, NULL, NULL, 2, 1, 0, 0, 0, 1),
(42, NULL, 0, '2026-04-18 15:44:38', '2026-04-18 15:46:08', 'EasyAi', 'Loan', '8128858228', 'easyailoan@gmail.com', NULL, NULL, NULL, '342008', 'Jodhpur', 'Rajasthan', 4, NULL, 1, NULL, NULL, 1, 1, 0, 0, 1, 1),
(43, 3, 0, '2026-04-20 15:55:12', '2026-04-20 15:55:12', 'Akash', '.', '9485887525', 'akashpratapsingh345@gmail.com', '$2y$12$VJNYmilAxzdQFI2akGqjkONOrrHf1Jlxt9tIeRS9gR/6uX31S9tFS', NULL, NULL, '123027', 'Mahendragarh', 'Haryana', 5, '7525', 1, NULL, NULL, 2, 1, 0, 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_tree`
--

CREATE TABLE `user_tree` (
  `id` int(11) NOT NULL,
  `rec_date` datetime NOT NULL DEFAULT current_timestamp(),
  `refferaltype` int(11) NOT NULL DEFAULT 1 COMMENT '1=Customer, 2=Channel',
  `refferaluserid` int(11) NOT NULL,
  `subuserid` int(11) NOT NULL,
  `payout` int(11) NOT NULL DEFAULT 0 COMMENT '0=No, 1=Yes',
  `payout_date` date DEFAULT NULL,
  `payout_amount` float(11,2) NOT NULL DEFAULT 0.00,
  `order_amount` float(11,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user_tree`
--

INSERT INTO `user_tree` (`id`, `rec_date`, `refferaltype`, `refferaluserid`, `subuserid`, `payout`, `payout_date`, `payout_amount`, `order_amount`) VALUES
(1, '2026-02-09 12:06:41', 1, 1, 2, 0, NULL, 0.00, 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `vegaah_entry`
--

CREATE TABLE `vegaah_entry` (
  `id` int(11) NOT NULL,
  `rec_date` datetime NOT NULL DEFAULT current_timestamp(),
  `entryfor` int(11) NOT NULL DEFAULT 0 COMMENT '11=SelfApply,12=Loan Agent,3=LA_Offer_1,4=LA_Offer_2,5=LA_Offer_3,6=SA_Offer_1,7=SA_Offer_2,8=SA_Offer_3,9=SA_Offer_4,10=LA_Offer_4	',
  `userid` int(11) NOT NULL,
  `orderid` varchar(50) NOT NULL,
  `orderamount` float(11,2) NOT NULL,
  `ordernote` varchar(256) DEFAULT NULL,
  `referenceid` varchar(256) DEFAULT NULL,
  `txstatus` varchar(256) DEFAULT NULL,
  `paymentmode` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `zaakpay_entry`
--

CREATE TABLE `zaakpay_entry` (
  `id` int(11) NOT NULL,
  `rec_date` datetime NOT NULL DEFAULT current_timestamp(),
  `entryfor` int(11) NOT NULL DEFAULT 0 COMMENT '11=SelfApply,12=Loan Agent,3=LA_Offer_1,4=LA_Offer_2,5=LA_Offer_3,6=SA_Offer_1,7=SA_Offer_2,8=SA_Offer_3,9=SA_Offer_4,10=LA_Offer_4',
  `userid` int(11) NOT NULL,
  `orderid` varchar(50) NOT NULL,
  `orderamount` float(11,2) NOT NULL,
  `ordernote` varchar(256) DEFAULT NULL,
  `statuscode` varchar(256) DEFAULT NULL,
  `transactionid` varchar(256) DEFAULT NULL,
  `paymentmode` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `zaakpay_entry`
--

INSERT INTO `zaakpay_entry` (`id`, `rec_date`, `entryfor`, `userid`, `orderid`, `orderamount`, `ordernote`, `statuscode`, `transactionid`, `paymentmode`) VALUES
(1, '2026-02-09 12:13:52', 11, 2, 'ZPLive1770619432849', 1.00, 'Self Apply', NULL, NULL, NULL),
(2, '2026-02-13 10:51:05', 11, 4, 'ZPLive1770960065812', 234.82, 'Self Apply', NULL, NULL, NULL),
(3, '2026-03-11 10:32:35', 11, 1, 'ZPLive1773205355290', 1.00, 'Self Apply', NULL, NULL, NULL),
(4, '2026-03-24 11:04:06', 11, 2, 'ZPLive1774330446098', 234.82, 'Self Apply', NULL, NULL, NULL),
(5, '2026-03-24 14:01:16', 11, 3, 'ZPLive1774341076283', 234.82, 'Self Apply', NULL, NULL, NULL),
(6, '2026-04-17 21:19:46', 11, 36, 'ZPLAT1776440986663', 234.82, 'Self Apply', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `zwitch_entry`
--

CREATE TABLE `zwitch_entry` (
  `id` int(11) NOT NULL,
  `rec_date` datetime NOT NULL,
  `entryfor` int(11) NOT NULL DEFAULT 0,
  `userid` int(11) NOT NULL,
  `orderid` varchar(50) NOT NULL,
  `orderamount` float(11,2) NOT NULL,
  `ordernote` varchar(256) DEFAULT NULL,
  `referenceid` varchar(256) DEFAULT NULL,
  `txstatus` varchar(256) DEFAULT NULL,
  `paymentmode` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `administrations`
--
ALTER TABLE `administrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `adscontent`
--
ALTER TABLE `adscontent`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `airpay_entry`
--
ALTER TABLE `airpay_entry`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `aisensy_settings`
--
ALTER TABLE `aisensy_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `application_remarks`
--
ALTER TABLE `application_remarks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `loan_application_id` (`application_id`),
  ADD KEY `administration_id` (`staff_id`);

--
-- Indexes for table `applylink_criteria`
--
ALTER TABLE `applylink_criteria`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bankapplylink`
--
ALTER TABLE `bankapplylink`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banks`
--
ALTER TABLE `banks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bulksms`
--
ALTER TABLE `bulksms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cardoffer`
--
ALTER TABLE `cardoffer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `careers`
--
ALTER TABLE `careers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `career_enquiries`
--
ALTER TABLE `career_enquiries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cashfree_entry`
--
ALTER TABLE `cashfree_entry`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `channel_partners`
--
ALTER TABLE `channel_partners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cipherpayentry`
--
ALTER TABLE `cipherpayentry`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `click_counts`
--
ALTER TABLE `click_counts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_enquiry`
--
ALTER TABLE `contact_enquiry`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `criteria_list`
--
ALTER TABLE `criteria_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `enroll_services`
--
ALTER TABLE `enroll_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `serviceid` (`serviceid`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `fb_ads_entry`
--
ALTER TABLE `fb_ads_entry`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userid` (`userid`);

--
-- Indexes for table `important_update`
--
ALTER TABLE `important_update`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `info_pages`
--
ALTER TABLE `info_pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `interakt_settings`
--
ALTER TABLE `interakt_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `loanstatus`
--
ALTER TABLE `loanstatus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loanstatus_remarks`
--
ALTER TABLE `loanstatus_remarks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loan_applications`
--
ALTER TABLE `loan_applications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userid` (`userid`);

--
-- Indexes for table `loan_application_status`
--
ALTER TABLE `loan_application_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loan_applied_history`
--
ALTER TABLE `loan_applied_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lyra_entry`
--
ALTER TABLE `lyra_entry`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `membership_orders`
--
ALTER TABLE `membership_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `otp_verifications`
--
ALTER TABLE `otp_verifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `partner_tasks`
--
ALTER TABLE `partner_tasks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `paygic_entry`
--
ALTER TABLE `paygic_entry`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `phonepe_entry`
--
ALTER TABLE `phonepe_entry`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `razorpayentry`
--
ALTER TABLE `razorpayentry`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `refunds`
--
ALTER TABLE `refunds`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roipackages`
--
ALTER TABLE `roipackages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `site_options`
--
ALTER TABLE `site_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_list`
--
ALTER TABLE `sms_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_log`
--
ALTER TABLE `sms_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `source_entry`
--
ALTER TABLE `source_entry`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff_tasks`
--
ALTER TABLE `staff_tasks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subpaisa_entry`
--
ALTER TABLE `subpaisa_entry`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_requests`
--
ALTER TABLE `support_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_request_chat`
--
ALTER TABLE `support_request_chat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_documents`
--
ALTER TABLE `user_documents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_offers`
--
ALTER TABLE `user_offers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_payout_documents`
--
ALTER TABLE `user_payout_documents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_registrations`
--
ALTER TABLE `user_registrations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mobile` (`mobile`);

--
-- Indexes for table `user_tree`
--
ALTER TABLE `user_tree`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vegaah_entry`
--
ALTER TABLE `vegaah_entry`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zaakpay_entry`
--
ALTER TABLE `zaakpay_entry`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zwitch_entry`
--
ALTER TABLE `zwitch_entry`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `administrations`
--
ALTER TABLE `administrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `adscontent`
--
ALTER TABLE `adscontent`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `airpay_entry`
--
ALTER TABLE `airpay_entry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `aisensy_settings`
--
ALTER TABLE `aisensy_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `application_remarks`
--
ALTER TABLE `application_remarks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `applylink_criteria`
--
ALTER TABLE `applylink_criteria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bankapplylink`
--
ALTER TABLE `bankapplylink`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `banks`
--
ALTER TABLE `banks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `bulksms`
--
ALTER TABLE `bulksms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cardoffer`
--
ALTER TABLE `cardoffer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `careers`
--
ALTER TABLE `careers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `career_enquiries`
--
ALTER TABLE `career_enquiries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cashfree_entry`
--
ALTER TABLE `cashfree_entry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `channel_partners`
--
ALTER TABLE `channel_partners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cipherpayentry`
--
ALTER TABLE `cipherpayentry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `click_counts`
--
ALTER TABLE `click_counts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `contact_enquiry`
--
ALTER TABLE `contact_enquiry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `criteria_list`
--
ALTER TABLE `criteria_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `enroll_services`
--
ALTER TABLE `enroll_services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fb_ads_entry`
--
ALTER TABLE `fb_ads_entry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `important_update`
--
ALTER TABLE `important_update`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `info_pages`
--
ALTER TABLE `info_pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `interakt_settings`
--
ALTER TABLE `interakt_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loanstatus`
--
ALTER TABLE `loanstatus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `loanstatus_remarks`
--
ALTER TABLE `loanstatus_remarks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `loan_applications`
--
ALTER TABLE `loan_applications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `loan_application_status`
--
ALTER TABLE `loan_application_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loan_applied_history`
--
ALTER TABLE `loan_applied_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lyra_entry`
--
ALTER TABLE `lyra_entry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `membership_orders`
--
ALTER TABLE `membership_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `otp_verifications`
--
ALTER TABLE `otp_verifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `partner_tasks`
--
ALTER TABLE `partner_tasks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `paygic_entry`
--
ALTER TABLE `paygic_entry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phonepe_entry`
--
ALTER TABLE `phonepe_entry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `razorpayentry`
--
ALTER TABLE `razorpayentry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `refunds`
--
ALTER TABLE `refunds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roipackages`
--
ALTER TABLE `roipackages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `site_options`
--
ALTER TABLE `site_options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `sms_list`
--
ALTER TABLE `sms_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `sms_log`
--
ALTER TABLE `sms_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `source_entry`
--
ALTER TABLE `source_entry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `staff_tasks`
--
ALTER TABLE `staff_tasks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subpaisa_entry`
--
ALTER TABLE `subpaisa_entry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_requests`
--
ALTER TABLE `support_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `support_request_chat`
--
ALTER TABLE `support_request_chat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_documents`
--
ALTER TABLE `user_documents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_offers`
--
ALTER TABLE `user_offers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `user_payout_documents`
--
ALTER TABLE `user_payout_documents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_registrations`
--
ALTER TABLE `user_registrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `user_tree`
--
ALTER TABLE `user_tree`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `vegaah_entry`
--
ALTER TABLE `vegaah_entry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zaakpay_entry`
--
ALTER TABLE `zaakpay_entry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `zwitch_entry`
--
ALTER TABLE `zwitch_entry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
