-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 07, 2026 at 09:27 AM
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
-- Database: `animalfarmdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `id` int(11) NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `target_date` varchar(50) NOT NULL,
  `time_window` varchar(30) NOT NULL,
  `status` varchar(30) DEFAULT 'Pending Approval',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`id`, `customer_name`, `target_date`, `time_window`, `status`, `created_at`) VALUES
(1, 'b', 'JUNE 11, 2026', '2:00 PM', 'Approved', '2026-06-06 15:35:30'),
(2, 'b', 'OCTOBER 22, 2026', '12:00 PM', 'Rejected', '2026-06-06 15:36:50'),
(3, 'a', 'OCTOBER 22, 2026', '12:00 PM', 'Approved', '2026-06-07 04:44:06'),
(4, 'a', 'DECEMBER 24, 2026', '2:00 PM', 'Approved', '2026-06-07 06:30:49'),
(5, 'w', 'OCTOBER 21, 2026', '4:00 PM', 'Approved', '2026-06-07 06:38:23'),
(6, 'w', 'APRIL 15, 2027', '10:00 AM', 'Rejected', '2026-06-07 06:38:31'),
(7, 'q', 'JUNE 25, 2026', '4:00 PM', 'Rejected', '2026-06-07 06:42:07'),
(8, 'q', 'MARCH 17, 2026', '3:00 PM', 'Approved', '2026-06-07 06:42:13');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `alt_phone` varchar(30) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `full_name`, `email`, `password`, `phone`, `alt_phone`, `city`, `address`, `created_at`) VALUES
(1, 'a', 'a@gmail.com', '$2y$10$cnrCRPeVf.qcDagBCVOsUOb1rEjqjOddz9AD/zr1.gIcDlja/QSQq', '01222456440', '01774555788', 'usa', 'fl', '2026-06-06 12:09:03'),
(2, 'b', 'b@gmail.com', '$2y$10$8phAXNvnSGVPf/edxpaOs.SckLSq/WADja02J9zDTIUaSbvINd/qS', '01778954656', '014457895623', 'FL', '105', '2026-06-06 13:16:56'),
(3, 'w', 'w@gmail.com', '$2y$10$oghRfmibzCYdUp4ifZDbUOeKTZZGgEb0TjSlhmkwKH.J2GhAuD29a', NULL, NULL, NULL, NULL, '2026-06-06 15:26:26'),
(4, 'q', 'q@gmail.com', '$2y$10$uASoms1GL/vWIjjzWfh3Ne2qjd4iIVkEntHF0/1Yesy7nFocRHPwW', '01778956444', '017789555666', 'New York', '105 Baker Street', '2026-06-07 06:27:38');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `order_number` varchar(50) NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `customer_email` varchar(100) NOT NULL,
  `delivery_address` text NOT NULL,
  `delivery_city` varchar(100) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `payment_method` varchar(50) DEFAULT 'Cash On Delivery',
  `status` varchar(30) DEFAULT 'Processing',
  `created_date` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_number`, `customer_name`, `customer_email`, `delivery_address`, `delivery_city`, `subtotal`, `total_amount`, `payment_method`, `status`, `created_date`) VALUES
(1, 'ID-274538950643', 'a', 'a@gmail.com', 'aaaa', 'aaa', 500.00, 475.00, 'Cash On Delivery', 'Completed', '07/06/2026'),
(2, 'ID-297306484861', 'a', 'a@gmail.com', 'fl', 'usa', 250.00, 262.50, 'Cash On Delivery', 'Processing', '07/06/2026'),
(3, 'ID-193757116692', 'a', 'a@gmail.com', '105', 'fl', 21.00, 67.85, 'Cash On Delivery', 'Cancelled', '07/06/2026'),
(4, 'ID-165215469554', 'q', 'q@gmail.com', '105 street', 'New York', 113.00, 146.05, 'Cash On Delivery', 'Completed', '07/06/2026');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_number` varchar(50) NOT NULL,
  `product_name` varchar(150) NOT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_number`, `product_name`, `unit_price`, `quantity`) VALUES
(1, 'ID-274538950643', 'Dorper Sheep', 250.00, 2),
(2, 'ID-297306484861', 'Dorper Sheep', 250.00, 1),
(3, 'ID-193757116692', 'Mozzarella Cheese - 1 kg', 21.00, 1),
(4, 'ID-165215469554', 'Bee Honey - 1 kg', 50.00, 1),
(5, 'ID-165215469554', 'Mozzarella Cheese - 1 kg', 21.00, 3);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `image` varchar(255) NOT NULL,
  `category` varchar(50) NOT NULL,
  `sub_tag` varchar(50) NOT NULL,
  `sex` varchar(20) DEFAULT 'N/A',
  `description` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `image`, `category`, `sub_tag`, `sex`, `description`, `created_at`) VALUES
(1, 'Duck Egg - 12 piece', 25.00, 'images/egg.jpg', 'Produce', 'Egg', 'Female', 'Farm fresh gathered daily.', '2026-06-07 03:58:20'),
(2, 'Cow Milk - 1 liter', 17.00, 'images/images.jpg', 'Produce', 'Milk', 'N/A', 'Rich preservative free milk.', '2026-06-07 03:58:20'),
(3, 'Dorper Sheep', 250.00, 'images/dorpersheep.png', 'Livestock', 'Sheep', 'Male', 'Exceptional health meat sheep breed.', '2026-06-07 03:58:20'),
(4, 'Mozzarella Cheese - 1 kg', 21.00, 'images/mozarella.png', 'Produce', 'Cheese', 'N/A', 'Artisanal cultured cheese recipe.', '2026-06-07 03:58:20'),
(7, 'Bee Honey - 1 kg', 50.00, 'images/honey2.png', 'Produce', 'Honey', 'N/A', 'Honey Extracted from Bee', '2026-06-07 06:26:44');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `order_number` (`order_number`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_number` (`order_number`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_number`) REFERENCES `orders` (`order_number`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
