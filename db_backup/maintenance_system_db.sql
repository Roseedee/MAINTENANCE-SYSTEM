-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 15, 2024 at 02:52 PM
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
-- Table structure for table `brand`
--

CREATE TABLE `brand` (
  `brand_id` int(10) NOT NULL,
  `brand` varchar(255) NOT NULL,
  `add_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `brand`
--

INSERT INTO `brand` (`brand_id`, `brand`, `add_date`) VALUES
(1, 'Lenovo', '2024-10-20 15:35:05'),
(2, 'Acer', '2024-10-20 15:35:05'),
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
-- Indexes for table `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `task`
--
ALTER TABLE `task`
  ADD PRIMARY KEY (`task_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brand`
--
ALTER TABLE `brand`
  MODIFY `brand_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `task`
--
ALTER TABLE `task`
  MODIFY `task_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
