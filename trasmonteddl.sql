-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 15, 2024 at 04:34 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `trasmonteddl`
--

-- --------------------------------------------------------

--
-- Table structure for table `orderdetails`
--

CREATE TABLE `orderdetails` (
  `OrderID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `UnitPrice` decimal(10,2) DEFAULT NULL,
  `Discount` decimal(5,2) DEFAULT NULL,
  `StatusID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orderdetails`
--

INSERT INTO `orderdetails` (`OrderID`, `ProductID`, `Quantity`, `UnitPrice`, `Discount`, `StatusID`) VALUES
(1, 1, 5, 100.00, 10.00, 1),
(2, 2, 10, 120.00, 5.00, 2),
(3, 3, 15, 110.00, 7.00, 3),
(4, 4, 20, 90.00, 2.00, 1),
(5, 5, 25, 80.00, 1.00, 2);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `OrderID` int(11) NOT NULL,
  `EmployeeID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `OrderDate` date DEFAULT NULL,
  `ShippedDate` date DEFAULT NULL,
  `ShipperID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`OrderID`, `EmployeeID`, `CustomerID`, `OrderDate`, `ShippedDate`, `ShipperID`) VALUES
(1, 1, 1001, '2024-10-01', '2024-10-05', 1),
(2, 2, 1002, '2024-10-02', '2024-10-06', 2),
(3, 3, 1003, '2024-10-03', '2024-10-07', 3),
(4, 4, 1004, '2024-10-04', '2024-10-08', 4),
(5, 5, 1005, '2024-10-05', '2024-10-09', 5);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `ID` int(11) NOT NULL,
  `ProductCode` varchar(50) NOT NULL,
  `ProductName` varchar(100) NOT NULL,
  `Description` varchar(100) DEFAULT NULL,
  `StandardCost` decimal(10,2) DEFAULT NULL,
  `ListPrice` decimal(10,2) DEFAULT NULL,
  `TargetLevel` int(11) DEFAULT NULL,
  `QuantityPerUnit` varchar(50) DEFAULT NULL,
  `Discountinued` tinyint(1) DEFAULT NULL,
  `MinimumReorderLevel` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`ID`, `ProductCode`, `ProductName`, `Description`, `StandardCost`, `ListPrice`, `TargetLevel`, `QuantityPerUnit`, `Discountinued`, `MinimumReorderLevel`) VALUES
(1, 'P001', 'Product 1', 'Description 1', 50.00, 100.00, 10, '10 pcs', 0, 5),
(2, 'P002', 'Product 2', 'Description 2', 60.00, 120.00, 20, '12 pcs', 0, 10),
(3, 'P003', 'Product 3', 'Description 3', 55.00, 110.00, 15, '15 pcs', 1, 7),
(4, 'P004', 'Product 4', 'Description 4', 45.00, 90.00, 25, '25 pcs', 0, 6),
(5, 'P005', 'Product 5', 'Description 5', 40.00, 80.00, 30, '30 pcs', 1, 8);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD PRIMARY KEY (`OrderID`,`ProductID`),
  ADD KEY `ProductID` (`ProductID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`OrderID`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `OrderID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD CONSTRAINT `orderdetails_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orderdetails_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `products` (`ID`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
