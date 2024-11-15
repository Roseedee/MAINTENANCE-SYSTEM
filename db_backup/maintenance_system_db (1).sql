-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 15, 2024 at 04:22 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `maintenance_system_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(10) NOT NULL,
  `fname_lname` varchar(255) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `national_ID` varchar(15) DEFAULT NULL,
  `local_address` varchar(255) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `machine`
--

CREATE TABLE `machine` (
  `machine_id` int(10) NOT NULL,
  `machine_number` varchar(50) NOT NULL,
  `sn` varchar(50) NOT NULL,
  `machine_color` varchar(50) NOT NULL,
  `machine_faults` varchar(50) NOT NULL,
  `brand_id` int(10) NOT NULL,
  `model_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `machine_brand`
--

CREATE TABLE `machine_brand` (
  `brand_id` int(10) NOT NULL,
  `brand` varchar(255) NOT NULL,
  `add_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `machine_brand`
--

INSERT INTO `machine_brand` (`brand_id`, `brand`, `add_date`) VALUES
(1, 'Lenovo', '2024-10-20 15:35:05'),
(3, 'Asus', '2024-10-20 15:35:05'),
(4, 'MSI', '2024-10-20 15:35:05'),
(5, 'Samsung', '2024-10-20 15:35:05'),
(6, 'Toshiba', '2024-10-20 16:00:11'),
(7, 'HP', '2024-10-20 16:00:11'),
(8, 'Brother', '2024-10-20 16:00:36'),
(9, 'Canon', '2024-10-20 16:00:36'),
(10, 'SVG', '2024-10-23 17:33:09');

-- --------------------------------------------------------

--
-- Table structure for table `machine_model`
--

CREATE TABLE `machine_model` (
  `model_id` int(10) NOT NULL,
  `model` varchar(30) NOT NULL,
  `add_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `machine_model`
--

INSERT INTO `machine_model` (`model_id`, `model`, `add_date`) VALUES
(1, 'ideapad 3', '2024-11-15 14:07:55'),
(2, 'ideapad 5', '2024-11-15 14:07:55'),
(3, 'tuf 15', '2024-11-15 14:07:55'),
(4, 'tuf 14', '2024-11-15 14:07:55'),
(5, 'tuf 3', '2024-11-15 14:07:55');

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `status_id` int(10) NOT NULL,
  `status` varchar(20) NOT NULL,
  `date_add` timestamp NOT NULL DEFAULT current_timestamp(),
  `status_note` text NOT NULL,
  `status_type` varchar(20) NOT NULL,
  `status_color` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`status_id`, `status`, `date_add`, `status_note`, `status_type`, `status_color`) VALUES
(1, 'กำลังซ่อม', '2024-11-15 14:57:42', 'คือสถานะที่บ่งบอกว่างานซ่อมนี้กำลังดำเนินการซ๋อมอยู่', 'default', '#FEAB0C'),
(2, 'ซ่อมเสร็จแล้ว', '2024-11-15 14:57:42', 'คือสถานะที่บ่งบอกว่างานซ่อมนั่นๆได้ทำการซ่อมเสร็จแล้ว และมีผลกับสรุปยอดงานซ่อมด้วย', 'default', '#25BEA0'),
(3, 'รับเครื่องแล้ว', '2024-11-15 14:57:42', 'คือสถานะที่ลูกค้ามารับเครื่องกลับไปแล้วพร้อมกับได้รับเงินเข้าระบบ และมีผลกับสรุปยอดงานซ่อมด้วย', 'default', '#3D9CDC'),
(4, 'ยกเลิก', '2024-11-15 14:57:42', 'คือสถานะที่ลูกค้าขอยกเลิกการซ่อม หรือทำการซ่อมไม่ผ่าน จะสมารถใส่เหตุผลและคำอธิบายว่าทำไมซ่อมไม่ได้', 'default', '#E75445');

-- --------------------------------------------------------

--
-- Table structure for table `task`
--

CREATE TABLE `task` (
  `task_id` int(10) NOT NULL,
  `customer_report` varchar(255) NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  `days` int(3) NOT NULL DEFAULT 1,
  `estimated_price` decimal(8,2) NOT NULL DEFAULT 0.00,
  `deposit` decimal(8,2) NOT NULL DEFAULT 0.00,
  `machine_id` int(10) NOT NULL,
  `task_status_id` int(10) NOT NULL,
  `customer_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `task`
--

INSERT INTO `task` (`task_id`, `customer_report`, `note`, `days`, `estimated_price`, `deposit`, `machine_id`, `task_status_id`, `customer_id`) VALUES
(1, 'asdf', 'asdf', 1, 0.00, 0.00, 1, 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `machine`
--
ALTER TABLE `machine`
  ADD PRIMARY KEY (`machine_id`),
  ADD KEY `brand_id` (`brand_id`),
  ADD KEY `model_id` (`model_id`);

--
-- Indexes for table `machine_brand`
--
ALTER TABLE `machine_brand`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `machine_model`
--
ALTER TABLE `machine_model`
  ADD PRIMARY KEY (`model_id`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`status_id`);

--
-- Indexes for table `task`
--
ALTER TABLE `task`
  ADD PRIMARY KEY (`task_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `machine`
--
ALTER TABLE `machine`
  MODIFY `machine_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `machine_brand`
--
ALTER TABLE `machine_brand`
  MODIFY `brand_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `machine_model`
--
ALTER TABLE `machine_model`
  MODIFY `model_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `status_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `task`
--
ALTER TABLE `task`
  MODIFY `task_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `machine`
--
ALTER TABLE `machine`
  ADD CONSTRAINT `machine_ibfk_1` FOREIGN KEY (`brand_id`) REFERENCES `machine_brand` (`brand_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `machine_ibfk_2` FOREIGN KEY (`model_id`) REFERENCES `machine_model` (`model_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
