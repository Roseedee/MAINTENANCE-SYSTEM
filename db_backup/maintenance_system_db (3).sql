-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 13, 2024 at 07:27 PM
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
  `fname_lname` varchar(128) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `national_ID` varchar(15) DEFAULT NULL,
  `local_address` varchar(255) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `fname_lname`, `email`, `national_ID`, `local_address`, `phone`) VALUES
(1, 'รอซีดี เจ๊ะแล๊ะ', 'roseedee2002@gmail.com', NULL, 'Yala Meang Thailand', '0630742165'),
(2, 'ซอลาฮุดีน เจ๊ะแล๊ะ', 'solahudeen Cehlaeh', NULL, 'Songklan Sabayoi Thailand', '0825468454');

-- --------------------------------------------------------

--
-- Table structure for table `machine`
--

CREATE TABLE `machine` (
  `machine_id` int(10) NOT NULL,
  `machine_number` varchar(255) DEFAULT NULL,
  `sn` varchar(255) NOT NULL,
  `machine_color` varchar(50) DEFAULT NULL,
  `machine_faults` varchar(50) DEFAULT NULL,
  `brand_id` int(10) NOT NULL,
  `model_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `machine`
--

INSERT INTO `machine` (`machine_id`, `machine_number`, `sn`, `machine_color`, `machine_faults`, `brand_id`, `model_id`) VALUES
(1, NULL, '123456789', NULL, NULL, 3, 3),
(2, NULL, '123456789', NULL, NULL, 1, 2);

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
(7, 'HP', '2024-10-20 16:00:11');

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
(4, 'tuf 14', '2024-11-15 14:07:55');

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `status_id` int(10) NOT NULL,
  `status` varchar(20) NOT NULL,
  `date_add` timestamp NOT NULL DEFAULT current_timestamp(),
  `status_note` text NOT NULL,
  `status_type` varchar(20) NOT NULL DEFAULT 'custom',
  `status_color` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`status_id`, `status`, `date_add`, `status_note`, `status_type`, `status_color`) VALUES
(1, 'กำลังซ่อม', '2024-11-15 14:57:42', 'คือสถานะที่บ่งบอกว่างานซ่อมนี้กำลังดำเนินการซ๋อมอยู่', 'default', '#FEAB0C'),
(2, 'ซ่อมเสร็จแล้ว', '2024-11-15 14:57:42', 'คือสถานะที่บ่งบอกว่างานซ่อมนั่นๆได้ทำการซ่อมเสร็จแล้ว และมีผลกับสรุปยอดงานซ่อมด้วย', 'default', '#25BEA0'),
(3, 'รับเครื่องแล้ว', '2024-11-15 14:57:42', 'คือสถานะที่ลูกค้ามารับเครื่องกลับไปแล้วพร้อมกับได้รับเงินเข้าระบบ และมีผลกับสรุปยอดงานซ่อมด้วย', 'default', '#3D9CDC'),
(4, 'ยกเลิก', '2024-11-15 14:57:42', 'คือสถานะที่ลูกค้าขอยกเลิกการซ่อม หรือทำการซ่อมไม่ผ่าน จะสมารถใส่เหตุผลและคำอธิบายว่าทำไมซ่อมไม่ได้', 'default', '#E75445'),
(18, 'รออะไหล่', '2024-12-13 17:49:57', '', 'custom', '#000000'),
(19, 'ส่งเคลม', '2024-12-13 17:50:01', '', 'custom', '#000000'),
(20, 'รอลูกค้าอนุมัติ', '2024-12-13 17:50:08', '', 'custom', '#5c3838');

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
  `customer_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `task`
--

INSERT INTO `task` (`task_id`, `customer_report`, `note`, `days`, `estimated_price`, `deposit`, `machine_id`, `customer_id`) VALUES
(2, 'จอแตก', NULL, 1, 0.00, 0.00, 1, 1),
(3, 'วินโดว์เข้าไม่ได้', NULL, 1, 0.00, 0.00, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `task_status`
--

CREATE TABLE `task_status` (
  `user_id` int(10) NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `task_id` int(10) NOT NULL,
  `status_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `task_status`
--

INSERT INTO `task_status` (`user_id`, `last_update`, `task_id`, `status_id`) VALUES
(1, '2024-12-13 18:23:52', 2, 1),
(1, '2024-12-13 18:23:52', 2, 2),
(2, '2024-12-13 18:24:27', 2, 4);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(10) NOT NULL,
  `user_fname_lname` varchar(128) NOT NULL,
  `role_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `user_fname_lname`, `role_id`) VALUES
(1, 'Roseedee Cehlaeh', 1),
(2, 'Solahudeen Cehlaeh', 1);

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
  ADD PRIMARY KEY (`task_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `machine_id` (`machine_id`);

--
-- Indexes for table `task_status`
--
ALTER TABLE `task_status`
  ADD UNIQUE KEY `task_id` (`task_id`,`status_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `status_id` (`status_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `machine`
--
ALTER TABLE `machine`
  MODIFY `machine_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `machine_brand`
--
ALTER TABLE `machine_brand`
  MODIFY `brand_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `machine_model`
--
ALTER TABLE `machine_model`
  MODIFY `model_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `status_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `task`
--
ALTER TABLE `task`
  MODIFY `task_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `machine`
--
ALTER TABLE `machine`
  ADD CONSTRAINT `machine_ibfk_1` FOREIGN KEY (`brand_id`) REFERENCES `machine_brand` (`brand_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `machine_ibfk_2` FOREIGN KEY (`model_id`) REFERENCES `machine_model` (`model_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `task`
--
ALTER TABLE `task`
  ADD CONSTRAINT `task_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `task_ibfk_2` FOREIGN KEY (`machine_id`) REFERENCES `machine` (`machine_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `task_status`
--
ALTER TABLE `task_status`
  ADD CONSTRAINT `task_status_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `task_status_ibfk_2` FOREIGN KEY (`task_id`) REFERENCES `task` (`task_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `task_status_ibfk_3` FOREIGN KEY (`status_id`) REFERENCES `status` (`status_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
