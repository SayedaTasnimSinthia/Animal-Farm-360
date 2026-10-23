CREATE DATABASE IF NOT EXISTS `animalfarmdb`;
USE `animalfarmdb`;

CREATE TABLE `appointments` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `customer_name` VARCHAR(100) NOT NULL,
    `target_date` VARCHAR(50) NOT NULL,
    `time_window` VARCHAR(30) NOT NULL,
    `status` VARCHAR(30) DEFAULT 'Pending Approval',
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


CREATE TABLE `customers` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `full_name` VARCHAR(100) NOT NULL,
    `email` VARCHAR(100) NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `phone` VARCHAR(30) DEFAULT NULL,
    `alt_phone` VARCHAR(30) DEFAULT NULL,
    `city` VARCHAR(50) DEFAULT NULL,
    `address` TEXT DEFAULT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


CREATE TABLE `orders` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `order_number` VARCHAR(50) NOT NULL,
    `customer_name` VARCHAR(100) NOT NULL,
    `customer_email` VARCHAR(100) NOT NULL,
    `delivery_address` TEXT NOT NULL,
    `delivery_city` VARCHAR(100) NOT NULL,
    `subtotal` DECIMAL(10,2) NOT NULL,
    `total_amount` DECIMAL(10,2) NOT NULL,
    `payment_method` VARCHAR(50) DEFAULT 'Cash On Delivery',
    `status` VARCHAR(30) DEFAULT 'Processing',
    `created_date` VARCHAR(30) NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `order_number` (`order_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


CREATE TABLE `order_items` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `order_number` VARCHAR(50) NOT NULL,
    `product_name` VARCHAR(150) NOT NULL,
    `unit_price` DECIMAL(10,2) NOT NULL,
    `quantity` INT(11) NOT NULL,
    PRIMARY KEY (`id`),
    KEY `order_number` (`order_number`),
    CONSTRAINT `order_items_ibfk_1`
        FOREIGN KEY (`order_number`)
        REFERENCES `orders` (`order_number`)
        ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


CREATE TABLE `products` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(150) NOT NULL,
    `price` DECIMAL(10,2) NOT NULL,
    `image` VARCHAR(255) NOT NULL,
    `category` VARCHAR(50) NOT NULL,
    `sub_tag` VARCHAR(50) NOT NULL,
    `sex` VARCHAR(20) DEFAULT 'N/A',
    `description` TEXT NOT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

