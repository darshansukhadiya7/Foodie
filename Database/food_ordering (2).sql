-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 08, 2024 at 10:09 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `food_ordering`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `address_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `city` varchar(10) DEFAULT NULL,
  `state` varchar(10) DEFAULT NULL,
  `pincode` varchar(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`address_id`, `customer_id`, `address`, `city`, `state`, `pincode`) VALUES
(1, 1, 'h.105 second bus stop aandnager', 'bhavnager', 'gujarat', '364005');

-- --------------------------------------------------------

--
-- Table structure for table `addtocard`
--

CREATE TABLE `addtocard` (
  `cart_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `restaurant_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `menu_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `username` varchar(15) DEFAULT NULL,
  `password` varchar(15) DEFAULT NULL,
  `email` varchar(70) DEFAULT NULL,
  `phno` varchar(12) DEFAULT NULL,
  `image` varchar(40) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `username`, `password`, `email`, `phno`, `image`, `name`) VALUES
(1, 'darshan@2819', 'darshan@2818', 'darshansukhadiya144@gmail.com', '1234567891', NULL, 'Darshan Sukhadiya'),
(2, 'vatsal@222', 'vatsal@222', 'vatsal222@gmail.com', '9999999999', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `restaurant_id` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `active` varchar(7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `restaurant_id`, `name`, `image`, `description`, `active`) VALUES
(38, 8, 'Farsan Platter', 'farsan.jpg', 'Tangy tomato curry topped with crispy sev (gram flour noodles) and fresh coriander leaves, served with soft phulka or thepla for a comforting and homely dish.', 'yes'),
(39, 8, 'Sweets and Desserts', 'sweet&desert.jpeg', 'Sweet and fragrant cracked wheat pudding cooked with ghee, jaggery, and cardamom, garnished with almonds and raisins for a warm and comforting dessert.', 'yes'),
(40, 8, 'Shaak & Rotla', 'shaak&rotla.jpeg', 'Tangy tomato curry topped with crispy sev (gram flour noodles) and fresh coriander leaves, served with soft phulka or thepla for a comforting and homely dish.', 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `checkout`
--

CREATE TABLE `checkout` (
  `checkout_id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `pno` varchar(12) NOT NULL,
  `email` varchar(70) NOT NULL,
  `address` varchar(70) NOT NULL,
  `city` varchar(20) NOT NULL,
  `state` varchar(20) NOT NULL,
  `pincode` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `checkout`
--

INSERT INTO `checkout` (`checkout_id`, `name`, `pno`, `email`, `address`, `city`, `state`, `pincode`) VALUES
(18632609, 'Darshan Sukhadiya', '1234567890', 'd@gmail.com', 'sg highway', 'ahmedabad', 'gujarat', '364001'),
(20282281, 'Darshan Sukhadiya', '1234567890', 'darshansukhadiya144@gmail.com', 'aandnager', 'bhavnager', 'gujarat', '364005'),
(61652870, 'Darshan Sukhadiya', '7041246617', 'darshan@gmail.com', 'aandnager', 'bhavnager', 'gujarat', '364005');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `username` varchar(15) DEFAULT NULL,
  `pass` varchar(15) DEFAULT NULL,
  `firstname` varchar(10) DEFAULT NULL,
  `lastname` varchar(10) DEFAULT NULL,
  `email` varchar(70) DEFAULT NULL,
  `phno` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `username`, `pass`, `firstname`, `lastname`, `email`, `phno`) VALUES
(1, 'Darshan@7017', 'Darshan@7017', 'Darshan', 'Sukhadiiya', 'darshansukhadiya144@gmail.com', '7041246617'),
(2, 'harsh@123', 'harsh@123', 'harsh', 'sonani', 'harshs@gmail.com', '1234554321'),
(3, 'dharmildon', 'dharmildon', 'dharmil', 'pandya', 'dharmil@gmail.com', '1234567890'),
(4, 'jay@234', 'jay@234', 'jaimin', 'padhiar', 'jaimin@gmail.com', '1234567890'),
(5, 'rajan@123', 'rajan@123', 'rajan1', 'bhatt12', 'rajan@gmail.com', '1234567890'),
(6, 'tanmaysoni', 'tanmaysoni', 'tanmay', 'soniiii', 'tanmay@gmail.com', '1234567890'),
(7, 'riya@123', 'riya@123', 'riyaaaa', 'thakkkarr', 'riya@gmail.com', '1234567890'),
(8, 'niki@123', 'niki@123', 'niki', 'soni', 'nikisoni@gmail.com', '7041246617');

-- --------------------------------------------------------

--
-- Table structure for table `driver`
--

CREATE TABLE `driver` (
  `driver_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `email` varchar(70) DEFAULT NULL,
  `phno` varchar(10) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL,
  `active` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `menu_id` int(11) NOT NULL,
  `restaurant_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `description` varchar(240) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `active` varchar(7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`menu_id`, `restaurant_id`, `category_id`, `name`, `image`, `description`, `price`, `active`) VALUES
(23, 8, 38, 'Gotaaa', 'gotA.jpeg', 'Crispy and crunchy gram flour fritters mixed with spices and herbs, served with green chutney and a sprinkle of chaat masala for a savory snack.', 60, 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `order2`
--

CREATE TABLE `order2` (
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `restaurant_id` int(11) DEFAULT NULL,
  `pname` varchar(100) DEFAULT NULL,
  `checkout_id` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `status1` varchar(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order2`
--

INSERT INTO `order2` (`order_id`, `customer_id`, `restaurant_id`, `pname`, `checkout_id`, `price`, `quantity`, `total`, `status1`) VALUES
(209591884, 1, 8, 'Gotaaa', 18632609, 60, 3, 180, 'Approved');

-- --------------------------------------------------------

--
-- Table structure for table `order_total`
--

CREATE TABLE `order_total` (
  `order_total_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `order_total_price` varchar(30) DEFAULT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_total`
--

INSERT INTO `order_total` (`order_total_id`, `order_id`, `order_total_price`, `date`, `time`, `customer_id`) VALUES
(25, 209591884, '180', '2024-05-08', '23:51:44', 1);

-- --------------------------------------------------------

--
-- Table structure for table `restaurant`
--

CREATE TABLE `restaurant` (
  `restaurant_id` int(11) NOT NULL,
  `username` varchar(15) DEFAULT NULL,
  `pass` varchar(15) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `description` varchar(240) DEFAULT NULL,
  `image` varchar(80) DEFAULT NULL,
  `email` varchar(70) DEFAULT NULL,
  `phno` varchar(12) DEFAULT NULL,
  `address` varchar(150) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL,
  `active` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `restaurant`
--

INSERT INTO `restaurant` (`restaurant_id`, `username`, `pass`, `name`, `description`, `image`, `email`, `phno`, `address`, `city`, `state`, `active`) VALUES
(1, 'dominos', 'dominos234', 'Dominos\'s', 'Domino\'s is a global pizza restaurant chain known for its wide range of pizza offerings, efficient delivery service, and innovative marketing campaigns.', 'dominos_logo.png', 'dominos@gmail.com', '1234567891', 'Vaishnavdevi Circle', 'Ahemdabad', 'Gujarat124', 'yes'),
(8, 'Amrut1231', 'Amrut123', 'Amrut Farsan Mart1', 'amrut farsan mart is most popular shop', 'amrut.png', 'amrut@gmail.com', '9427284780', 'Vraj vihar complex, subhasnager', 'Bhavnager', 'Gujarat', 'yes'),
(9, 'SpiceBistro', 'SpiceBistro', 'Spice Avenue Bistro', 'bistro is defined as a small, casual restaurant with a relatively inexpensive, simple menu. Though often a French restaurant, it doesn\'t have to be, and not every bistro serves French food.', 'SAB_bistro.png', 'SpiceBistro@gmail.com', '1234567890', 'shop no.123, main road, ghogha circle', 'bhavnager', 'gujarat', 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `review_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `restaurant_id` int(11) DEFAULT NULL,
  `menu_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `message` varchar(240) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`address_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `addtocard`
--
ALTER TABLE `addtocard`
  ADD PRIMARY KEY (`cart_id`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`),
  ADD KEY `restaurant_id` (`restaurant_id`);

--
-- Indexes for table `checkout`
--
ALTER TABLE `checkout`
  ADD PRIMARY KEY (`checkout_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `driver`
--
ALTER TABLE `driver`
  ADD PRIMARY KEY (`driver_id`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`menu_id`),
  ADD KEY `restaurant_id` (`restaurant_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `order2`
--
ALTER TABLE `order2`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `order_total`
--
ALTER TABLE `order_total`
  ADD PRIMARY KEY (`order_total_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `restaurant`
--
ALTER TABLE `restaurant`
  ADD PRIMARY KEY (`restaurant_id`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`review_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `addtocard`
--
ALTER TABLE `addtocard`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `checkout`
--
ALTER TABLE `checkout`
  MODIFY `checkout_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97803228;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `driver`
--
ALTER TABLE `driver`
  MODIFY `driver_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `menu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `order2`
--
ALTER TABLE `order2`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=799626534;

--
-- AUTO_INCREMENT for table `order_total`
--
ALTER TABLE `order_total`
  MODIFY `order_total_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `restaurant`
--
ALTER TABLE `restaurant`
  MODIFY `restaurant_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `address_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`);

--
-- Constraints for table `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `category_ibfk_1` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`restaurant_id`);

--
-- Constraints for table `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`restaurant_id`),
  ADD CONSTRAINT `menu_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`);

--
-- Constraints for table `order_total`
--
ALTER TABLE `order_total`
  ADD CONSTRAINT `order_total_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
