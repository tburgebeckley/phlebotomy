-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 17, 2017 at 02:14 AM
-- Server version: 5.5.57-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `phlebotomy`
--
CREATE DATABASE IF NOT EXISTS `phlebotomy` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `phlebotomy`;

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE IF NOT EXISTS `address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `street` varchar(25) NOT NULL,
  `city` varchar(25) NOT NULL,
  `state` varchar(2) NOT NULL,
  `zip` varchar(9) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Truncate table before insert `address`
--

TRUNCATE TABLE `address`;
--
-- Dumping data for table `address`
--

INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`) VALUES
(1, '25 Posey Ln', 'Schenectady', 'NY', '12309'),
(2, '274 Rose Ave', 'Chicago', 'IL', '60007'),
(3, '3021 N Gold Star Dr', 'Long Beach', 'CA', '90810'),
(4, '32 N 4th St', 'Columbus', 'OH', '43215'),
(5, '3901 NW 28th St', 'Miami', 'FL', '33142'),
(6, '550 S Tyron St', 'Charleston', 'NC', '28202'),
(7, '899 Oakland Ave', 'Ann Arbor', 'MI', '48104'),
(8, '800 Washington St', 'Boston', 'MA', '02111'),
(9, '1701 Trinity St', 'Austin', 'TX', '78705'),
(10, '900 E 11th Ave', 'Denver', 'CO', '80218'),
(11, '34800 Bob Wilson Dr', 'San Diego', 'CA', '92134'),
(12, '298 E Arikara Ave', 'Bismarck', 'ND', '58501'),
(13, '350 W Thomas Rd', 'Phoenix', 'AZ', '85013'),
(14, '269 1300 S', 'Salt Lake City', 'UT', '84115'),
(15, 'S 42nd St', 'Omaha', 'NE', '68198'),
(16, '701 10th St SE', 'Cedar Rapids', 'IA', '52403'),
(17, '216 S Kingshighway Blvd', 'St. Louis', 'MO', '63110');

-- --------------------------------------------------------

--
-- Table structure for table `billedTo`
--

CREATE TABLE IF NOT EXISTS `billedTo` (
  `insuranceCompany$name` varchar(50) NOT NULL,
  `invoice$id` int(11) NOT NULL,
  KEY `insuranceCompany$name` (`insuranceCompany$name`),
  KEY `invoice$id` (`invoice$id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `billedTo`:
--   `insuranceCompany$name`
--       `insuranceCompany` -> `name`
--   `invoice$id`
--       `invoice` -> `id`
--

--
-- Truncate table before insert `billedTo`
--

TRUNCATE TABLE `billedTo`;
--
-- Dumping data for table `billedTo`
--

INSERT INTO `billedTo` (`insuranceCompany$name`, `invoice$id`) VALUES
('Aetna', 1),
('Blue Cross', 2),
('Green Square', 3),
('Orange Triangle', 4),
('Purple Heart', 5);

-- --------------------------------------------------------

--
-- Table structure for table `consults`
--

CREATE TABLE IF NOT EXISTS `consults` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patient$id` int(11) NOT NULL,
  `doctor$name` varchar(50) NOT NULL,
  `doctor$practiceName` varchar(50) NOT NULL,
  `cDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `patient$id` (`patient$id`),
  KEY `doctor$name` (`doctor$name`,`doctor$practiceName`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- RELATIONS FOR TABLE `consults`:
--   `patient$id`
--       `patient` -> `id`
--

--
-- Truncate table before insert `consults`
--

TRUNCATE TABLE `consults`;
--
-- Dumping data for table `consults`
--

INSERT INTO `consults` (`id`, `patient$id`, `doctor$name`, `doctor$practiceName`, `cDate`) VALUES
(1, 1, 'John Watson, M.D.', 'Doctors Plus', NULL),
(2, 2, 'Ronald Burns, M.D.', 'Family Medicine', NULL),
(3, 3, 'Steve Simons, M.D.', 'Doctors Plus', NULL),
(4, 4, 'Sheryl Reames, M.D.', 'Diverse Health Care', NULL),
(5, 5, 'Frank Oswaldt, M.D.', 'Family Care Group', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE IF NOT EXISTS `doctor` (
  `name` varchar(50) NOT NULL,
  `practiceName` varchar(50) NOT NULL,
  PRIMARY KEY (`name`,`practiceName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `doctor`
--

TRUNCATE TABLE `doctor`;
--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`name`, `practiceName`) VALUES
('Frank Oswaldt, M.D.', 'Family Care Group'),
('John Watson, M.D.', 'Doctors Plus'),
('Ronald Burns, M.D.', 'Family Medicine'),
('Sheryl Reames, M.D.', 'Diverse Health Care'),
('Steve Simons, M.D.', 'Doctors Plus');

-- --------------------------------------------------------

--
-- Table structure for table `insuranceCompany`
--

CREATE TABLE IF NOT EXISTS `insuranceCompany` (
  `name` varchar(50) NOT NULL,
  `network` varchar(50) NOT NULL,
  `address$id` int(11) NOT NULL,
  PRIMARY KEY (`name`,`network`),
  KEY `address$id` (`address$id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `insuranceCompany`:
--   `address$id`
--       `address` -> `id`
--

--
-- Truncate table before insert `insuranceCompany`
--

TRUNCATE TABLE `insuranceCompany`;
--
-- Dumping data for table `insuranceCompany`
--

INSERT INTO `insuranceCompany` (`name`, `network`, `address$id`) VALUES
('Aetna', 'BJC', 1),
('Blue Cross', 'Blue Sheild', 2),
('Green Square', 'Green Oval', 3),
('Orange Triangle', 'Red Circle', 4),
('Purple Heart', 'Peach Cube', 5);

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE IF NOT EXISTS `invoice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `visit$id` int(11) NOT NULL,
  `billedDate` datetime DEFAULT NULL,
  `billedAmt` float DEFAULT NULL,
  `message` varchar(100) DEFAULT NULL,
  `mileage` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`,`visit$id`),
  KEY `visit$id` (`visit$id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- RELATIONS FOR TABLE `invoice`:
--   `visit$id`
--       `visit` -> `id`
--

--
-- Truncate table before insert `invoice`
--

TRUNCATE TABLE `invoice`;
--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`id`, `visit$id`, `billedDate`, `billedAmt`, `message`, `mileage`) VALUES
(1, 1, '2012-06-18 10:34:09', 125.45, '', 18),
(2, 2, '2012-06-18 10:34:11', 248.28, '', 12),
(3, 3, '2012-06-18 10:34:13', 12.25, '', 2),
(4, 4, '2012-06-18 10:34:15', 35.12, '', 14),
(5, 5, '2012-06-18 10:34:17', 18.27, '', 12);

-- --------------------------------------------------------

--
-- Table structure for table `livesAt`
--

CREATE TABLE IF NOT EXISTS `livesAt` (
  `patient$id` int(11) NOT NULL,
  `address$id` int(11) NOT NULL,
  PRIMARY KEY (`patient$id`,`address$id`),
  KEY `address$id` (`address$id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `livesAt`:
--   `patient$id`
--       `patient` -> `id`
--   `address$id`
--       `address` -> `id`
--

--
-- Truncate table before insert `livesAt`
--

TRUNCATE TABLE `livesAt`;
--
-- Dumping data for table `livesAt`
--

INSERT INTO `livesAt` (`patient$id`, `address$id`) VALUES
(1, 6),
(2, 7),
(3, 8),
(4, 9),
(5, 10);

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE IF NOT EXISTS `patient` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `bloodType` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Truncate table before insert `patient`
--

TRUNCATE TABLE `patient`;
--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`id`, `name`, `DOB`, `bloodType`) VALUES
(1, 'Maggie Smith', '1993-12-15', 'O+'),
(2, 'Jon Stone', '1987-04-16', 'A+'),
(3, 'Josie Rifter', '1972-02-13', 'AB+'),
(4, 'Edgar Knowles', '1989-05-30', 'A-'),
(5, 'Susan Colburn', '1958-02-28', 'B+');

-- --------------------------------------------------------

--
-- Table structure for table `performs`
--

CREATE TABLE IF NOT EXISTS `performs` (
  `phlebotomist$name` varchar(50) NOT NULL,
  `phlebotomist$clinic` varchar(50) NOT NULL,
  `visit$id` int(11) NOT NULL,
  PRIMARY KEY (`phlebotomist$name`,`phlebotomist$clinic`,`visit$id`),
  KEY `visit$id` (`visit$id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `performs`:
--   `visit$id`
--       `visit` -> `id`
--

--
-- Truncate table before insert `performs`
--

TRUNCATE TABLE `performs`;
--
-- Dumping data for table `performs`
--

INSERT INTO `performs` (`phlebotomist$name`, `phlebotomist$clinic`, `visit$id`) VALUES
('Doogie Howser', 'WellnessClinic', 1),
('Bert Macklin', 'HappyClinic', 2),
('Sheryl Banks', 'GetWellClinic', 3),
('Allan Beck', 'WellnessClinic', 4),
('Manuel Murphy', 'HappyClinic', 5);

-- --------------------------------------------------------

--
-- Table structure for table `phlebotomist`
--

CREATE TABLE IF NOT EXISTS `phlebotomist` (
  `name` varchar(50) NOT NULL,
  `clinic` varchar(50) NOT NULL,
  PRIMARY KEY (`name`,`clinic`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `phlebotomist`
--

TRUNCATE TABLE `phlebotomist`;
--
-- Dumping data for table `phlebotomist`
--

INSERT INTO `phlebotomist` (`name`, `clinic`) VALUES
('Allan Beck', 'WellnessClinic'),
('Bert Macklin', 'HappyClinic'),
('Doogie Howser', 'WellnessClinic'),
('Manuel Murphy', 'HappyClinic'),
('Sheryl Banks', 'GetWellClinic');

-- --------------------------------------------------------

--
-- Table structure for table `practicesAt`
--

CREATE TABLE IF NOT EXISTS `practicesAt` (
  `doctor$name` varchar(50) NOT NULL,
  `doctor$practiceName` varchar(50) NOT NULL,
  `address$id` int(11) NOT NULL,
  PRIMARY KEY (`doctor$name`,`doctor$practiceName`,`address$id`),
  KEY `address$id` (`address$id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `practicesAt`:
--   `address$id`
--       `address` -> `id`
--

--
-- Truncate table before insert `practicesAt`
--

TRUNCATE TABLE `practicesAt`;
--
-- Dumping data for table `practicesAt`
--

INSERT INTO `practicesAt` (`doctor$name`, `doctor$practiceName`, `address$id`) VALUES
('John Watson, M.D.', 'Doctors Plus', 1),
('Ronald Burns, M.D.', 'Family Medicine', 2),
('Steve Simons, M.D.', 'Doctors Plus', 3),
('Sheryl Reames, M.D.', 'Diverse Health Care', 4),
('Frank Oswaldt, M.D.', 'Family Care Group', 5);

-- --------------------------------------------------------

--
-- Table structure for table `specialist`
--

CREATE TABLE IF NOT EXISTS `specialist` (
  `doctor$name` varchar(50) NOT NULL,
  `doctor$practiceName` varchar(50) NOT NULL,
  `specialty` varchar(50) NOT NULL,
  PRIMARY KEY (`doctor$name`,`doctor$practiceName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `specialist`
--

TRUNCATE TABLE `specialist`;
--
-- Dumping data for table `specialist`
--

INSERT INTO `specialist` (`doctor$name`, `doctor$practiceName`, `specialty`) VALUES
('Frank Oswaldt, M.D.', 'Family Care Group', 'Gastroenterologist'),
('John Watson, M.D.', 'Doctors Plus', 'Cardiologist'),
('Ronald Burns, M.D.', 'Family Medicine', 'Urologist'),
('Sheryl Reames, M.D.', 'Diverse Health Care', 'Oncologist'),
('Steve Simons, M.D.', 'Doctors Plus', 'Neurologist');

-- --------------------------------------------------------

--
-- Table structure for table `visit`
--

CREATE TABLE IF NOT EXISTS `visit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `network` varchar(50) NOT NULL,
  `visitDate` datetime NOT NULL,
  `testType` varchar(50) NOT NULL,
  `patient$id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `patient$id` (`patient$id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- RELATIONS FOR TABLE `visit`:
--   `patient$id`
--       `patient` -> `id`
--

--
-- Truncate table before insert `visit`
--

TRUNCATE TABLE `visit`;
--
-- Dumping data for table `visit`
--

INSERT INTO `visit` (`id`, `network`, `visitDate`, `testType`, `patient$id`) VALUES
(1, 'Southwest', '2014-02-19 09:30:00', 'hemoglobin', 1),
(2, 'Northwest', '2017-01-18 11:45:00', 'hemoglobin', 2),
(3, 'Northeast', '2013-06-18 02:30:00', 'iron', 3),
(4, 'Midwest', '2015-04-21 10:34:09', 'glucose', 4),
(5, 'Southeast', '2016-05-22 10:34:09', 'infection', 5);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `billedTo`
--
ALTER TABLE `billedTo`
  ADD CONSTRAINT `billedTo_ibfk_1` FOREIGN KEY (`insuranceCompany$name`) REFERENCES `insuranceCompany` (`name`),
  ADD CONSTRAINT `billedTo_ibfk_2` FOREIGN KEY (`invoice$id`) REFERENCES `invoice` (`id`);

--
-- Constraints for table `consults`
--
ALTER TABLE `consults`
  ADD CONSTRAINT `consults_ibfk_1` FOREIGN KEY (`patient$id`) REFERENCES `patient` (`id`),
  ADD CONSTRAINT `consults_ibfk_2` FOREIGN KEY (`doctor$name`, `doctor$practiceName`) REFERENCES `doctor` (`name`, `practiceName`);

--
-- Constraints for table `insuranceCompany`
--
ALTER TABLE `insuranceCompany`
  ADD CONSTRAINT `insuranceCompany_ibfk_1` FOREIGN KEY (`address$id`) REFERENCES `address` (`id`);

--
-- Constraints for table `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`visit$id`) REFERENCES `visit` (`id`);

--
-- Constraints for table `livesAt`
--
ALTER TABLE `livesAt`
  ADD CONSTRAINT `livesAt_ibfk_1` FOREIGN KEY (`patient$id`) REFERENCES `patient` (`id`),
  ADD CONSTRAINT `livesAt_ibfk_2` FOREIGN KEY (`address$id`) REFERENCES `address` (`id`);

--
-- Constraints for table `performs`
--
ALTER TABLE `performs`
  ADD CONSTRAINT `performs_ibfk_1` FOREIGN KEY (`phlebotomist$name`, `phlebotomist$clinic`) REFERENCES `phlebotomist` (`name`, `clinic`),
  ADD CONSTRAINT `performs_ibfk_2` FOREIGN KEY (`visit$id`) REFERENCES `visit` (`id`);

--
-- Constraints for table `practicesAt`
--
ALTER TABLE `practicesAt`
  ADD CONSTRAINT `practicesAt_ibfk_1` FOREIGN KEY (`doctor$name`, `doctor$practiceName`) REFERENCES `doctor` (`name`, `practiceName`),
  ADD CONSTRAINT `practicesAt_ibfk_2` FOREIGN KEY (`address$id`) REFERENCES `address` (`id`);

--
-- Constraints for table `specialist`
--
ALTER TABLE `specialist`
  ADD CONSTRAINT `specialist_ibfk_1` FOREIGN KEY (`doctor$name`, `doctor$practiceName`) REFERENCES `doctor` (`name`, `practiceName`);

--
-- Constraints for table `visit`
--
ALTER TABLE `visit`
  ADD CONSTRAINT `visit_ibfk_1` FOREIGN KEY (`patient$id`) REFERENCES `patient` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
