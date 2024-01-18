-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 04, 2019 at 12:05 PM
-- Server version: 10.1.40-MariaDB
-- PHP Version: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project_vaseis`
--

-- --------------------------------------------------------

--
-- Table structure for table `author`
--

CREATE TABLE `author` (
  `AuthorID` int(11) NOT NULL,
  `AFirst` text NOT NULL,
  `ALast` text NOT NULL,
  `ABirthDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `author`
--

INSERT INTO `author` (`AuthorID`, `AFirst`, `ALast`, `ABirthDate`) VALUES
(1, 'Jeanie', 'Hodkiewicz', '1978-04-25'),
(2, 'Kari', 'Flatley', '1985-12-11'),
(3, 'Emory', 'Donnelly', '2009-11-05'),
(4, 'Selena', 'Gleason', '2003-11-13'),
(5, 'Dorcas', 'Reinger', '1995-05-16'),
(6, 'Glennie', 'Rowe', '1984-09-08'),
(7, 'Ashly', 'Luettgen', '2001-10-08'),
(8, 'Jo', 'Gleason', '1979-04-10'),
(9, 'Abdul', 'Hamill', '2008-11-25'),
(10, 'Annabelle', 'Wyman', '1974-07-07'),
(11, 'Samara', 'Bednar', '1970-10-23'),
(12, 'Wyman', 'Welch', '1998-12-17');

-- --------------------------------------------------------

--
-- Table structure for table `belongs_to`
--

CREATE TABLE `belongs_to` (
  `ISBN` int(11) NOT NULL,
  `CatName` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `belongs_to`
--

INSERT INTO `belongs_to` (`ISBN`, `CatName`) VALUES
(1, 'Differential Equations'),
(2, 'Functions'),
(3, 'Circuits'),
(4, 'Electrical Engineering'),
(5, 'physics'),
(6, 'Circuits'),
(7, 'Maths'),
(8, 'Programming'),
(9, 'Programming'),
(10, 'Electrical Engineering'),
(11, 'Maths'),
(12, 'Circuits'),
(13, 'Electrical Engineering'),
(14, 'Automatic Control Systems'),
(15, 'Automatic Control Systems'),
(16, 'Astronomy'),
(17, 'thermodynamics');

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `ISBN` int(11) NOT NULL,
  `Title` varchar(200) NOT NULL,
  `PubYear` year(4) NOT NULL,
  `Numpages` int(11) NOT NULL,
  `PubName` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`ISBN`, `Title`, `PubYear`, `Numpages`, `PubName`) VALUES
(1, 'Differentials', 2005, 965, 'Fountas'),
(2, 'Mathematical Analysis\r\n', 2016, 485, 'Kedros'),
(3, 'Digital Design', 2002, 885, 'Summetria'),
(4, 'Signals and Systems', 2000, 667, 'Symewn'),
(5, 'Electromagnetic Fields', 1989, 742, 'Tsotras'),
(6, 'Circuit theory', 2003, 491, 'Symewn'),
(7, 'Linear Algebra', 2008, 722, 'Giourdas'),
(8, 'C Programming', 2007, 647, 'Kritis'),
(9, 'C++ Programming', 2009, 693, 'Kritis'),
(10, 'Communication Systems\r\n', 2011, 617, 'Scribner'),
(11, 'Statistical Analysis', 2006, 345, 'Kleidarithmos'),
(12, 'Linear Circuit Analysis', 2015, 584, 'Tziolas'),
(13, 'Computer Networks', 2004, 357, 'Summetria'),
(14, 'Basic Automated Control Systems', 2001, 548, 'Giourdas'),
(15, 'Advanced Automatic Control Systems', 2002, 634, 'Giourdas'),
(16, 'Solar Systems', 2014, 468, 'Summetria'),
(17, 'Thermodynamics ', 2006, 304, 'Tsotras');

-- --------------------------------------------------------

--
-- Table structure for table `borrows`
--

CREATE TABLE `borrows` (
  `MemberID` int(11) NOT NULL,
  `ISBN` int(11) NOT NULL,
  `CopyNr` int(11) NOT NULL,
  `Date_of_borrowing` date NOT NULL,
  `Date_of_return` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `borrows`
--

INSERT INTO `borrows` (`MemberID`, `ISBN`, `CopyNr`, `Date_of_borrowing`, `Date_of_return`) VALUES
(2, 8, 1, '2019-04-30', NULL),
(3, 17, 1, '2019-03-16', '2019-04-16'),
(5, 15, 1, '2019-03-21', NULL),
(7, 2, 1, '2019-05-01', NULL),
(8, 3, 1, '2019-03-10', '2019-04-10'),
(9, 4, 1, '2019-03-28', '2019-04-28'),
(9, 5, 1, '2019-03-18', '2019-04-18'),
(9, 12, 1, '2019-04-03', NULL),
(10, 16, 1, '2019-04-01', '2019-05-01'),
(15, 6, 1, '2019-03-29', '2019-04-29'),
(16, 1, 1, '2019-03-14', NULL);

--
-- Triggers `borrows`
--
DELIMITER $$
CREATE TRIGGER `Book_Borrowed` AFTER INSERT ON `borrows` FOR EACH ROW UPDATE copies	
SET copies.Availability = 0
WHERE copies.CopyNr=new.CopyNr AND copies.ISBN = new.ISBN
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `Book_Returned` AFTER UPDATE ON `borrows` FOR EACH ROW UPDATE copies
SET copies.Availability = 1
WHERE copies.CopyNr=new.CopyNr AND copies.ISBN=new.ISBN
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `CatName` varchar(40) NOT NULL,
  `SuperCatName` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`CatName`, `SuperCatName`) VALUES
('Electrical Engineering', NULL),
('Maths', NULL),
('physics', NULL),
('Automatic Control Systems', 'Electrical Engineering'),
('Circuits', 'Electrical Engineering'),
('Programming', 'Electrical Engineering'),
('Differential Equations', 'Maths'),
('Functions', 'Maths'),
('Astronomy', 'physics'),
('thermodynamics', 'physics');

-- --------------------------------------------------------

--
-- Table structure for table `copies`
--

CREATE TABLE `copies` (
  `ISBN` int(11) NOT NULL,
  `CopyNr` int(11) NOT NULL,
  `Shelf` int(11) NOT NULL,
  `Availability` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `copies`
--

INSERT INTO `copies` (`ISBN`, `CopyNr`, `Shelf`, `Availability`) VALUES
(1, 1, 24, 0),
(1, 2, 25, 1),
(2, 1, 96, 0),
(3, 1, 374, 1),
(3, 2, 373, 1),
(4, 1, 62, 1),
(4, 2, 63, 1),
(5, 1, 287, 1),
(5, 2, 288, 1),
(6, 1, 120, 1),
(6, 2, 121, 1),
(7, 1, 104, 1),
(8, 1, 153, 0),
(8, 2, 154, 1),
(9, 1, 155, 1),
(10, 1, 177, 1),
(11, 1, 243, 1),
(12, 1, 100, 0),
(13, 1, 194, 1),
(13, 2, 193, 1),
(14, 1, 132, 1),
(14, 2, 133, 1),
(14, 3, 134, 1),
(15, 1, 135, 0),
(16, 1, 367, 1),
(17, 1, 267, 1),
(17, 2, 268, 1);

-- --------------------------------------------------------

--
-- Stand-in structure for view `copies available`
-- (See below for the actual view)
--
CREATE TABLE `copies available` (
`Title` varchar(200)
,`ISBN` int(11)
,`Available_Number` bigint(21)
);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `EmpID` int(11) NOT NULL,
  `EFirst` text NOT NULL,
  `ELast` text NOT NULL,
  `Salary` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`EmpID`, `EFirst`, `ELast`, `Salary`) VALUES
(1, 'Muriel', 'Larkin', 8000),
(2, 'Noelia', 'Mills', 8000),
(3, 'Kirstin', 'Cummings', 8000),
(4, 'Myriam', 'Larson', 8000),
(5, 'Vladimir', 'Morissette', 8000),
(6, 'Vilma', 'Kilback', 12000),
(7, 'Vergie', 'Christiansen', 12000);

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `MemberID` int(11) NOT NULL,
  `Mfirst` text NOT NULL,
  `Mlast` text NOT NULL,
  `MBirthDate` date NOT NULL,
  `Street` text NOT NULL,
  `StreetNumber` int(11) NOT NULL,
  `PostalCode` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`MemberID`, `Mfirst`, `Mlast`, `MBirthDate`, `Street`, `StreetNumber`, `PostalCode`) VALUES
(1, 'Everardo', 'Romaguera', '1971-07-18', 'Points', 952, 32132),
(2, 'Caitlyn', 'Murray', '1978-04-24', 'Field', 542, 64586),
(3, 'Trudie', 'Gislason', '1987-04-07', 'Walks', 615, 21118),
(4, 'Sam', 'Mertz', '1991-09-04', 'Lakes', 59141, 65468),
(5, 'Aditya', 'Price', '1996-09-02', 'Gardens', 3183, 27746),
(6, 'Christa', 'Hudson', '1979-10-27', 'Estate', 3090, 62213),
(7, 'Gertrude', 'Braun', '2007-03-29', 'Fields', 5738, 75584),
(8, 'Austen', 'Watsica', '2006-07-21', 'Plaza', 5656, 98860),
(9, 'Johnson', 'Johns', '2000-09-24', 'Villages', 56794, 94110),
(10, 'Rasheed', 'McKenzie', '1995-02-23', 'Hills', 68629, 30728),
(11, 'Rosemary', 'Ryan', '2000-10-19', 'Manors', 4834, 53666),
(12, 'Judy', 'Baumbach', '2006-06-20', 'Center', 512, 18901),
(13, 'Frank', 'O\'Keefe', '1971-09-02', 'Crest', 6879, 76856),
(14, 'Sigurd', 'West', '1992-07-12', 'Extensions', 2269, 49424),
(15, 'Justice', 'Crist', '1983-06-12', 'Cliffs', 37592, 96017),
(16, 'Ettie', 'Hudson', '1999-01-05', 'Passage', 5045, 79188);

-- --------------------------------------------------------

--
-- Table structure for table `perm_employee`
--

CREATE TABLE `perm_employee` (
  `EmpID` int(11) NOT NULL,
  `HiringDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `perm_employee`
--

INSERT INTO `perm_employee` (`EmpID`, `HiringDate`) VALUES
(1, '2012-06-04'),
(2, '2014-09-07'),
(3, '2019-01-05'),
(6, '2018-12-12'),
(7, '2016-11-04');

-- --------------------------------------------------------

--
-- Table structure for table `publisher`
--

CREATE TABLE `publisher` (
  `PubName` varchar(200) NOT NULL,
  `EstYear` year(4) NOT NULL,
  `Street` text NOT NULL,
  `Number` int(11) NOT NULL,
  `PostalCode` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `publisher`
--

INSERT INTO `publisher` (`PubName`, `EstYear`, `Street`, `Number`, `PostalCode`) VALUES
('Fountas', 2012, 'Suggrou', 84, 18542),
('Giourdas', 2008, 'Maxis Analatou', 3, 14562),
('Kedros', 2003, 'Solomou', 63, 16533),
('Kleidarithmos', 1966, 'Oikonomou', 14, 18542),
('Kritis', 1984, 'Poseidwnos', 163, 13888),
('Scribner', 1937, 'Thiseos', 1, 18347),
('Summetria', 1947, 'Davaki', 62, 13546),
('Symewn', 2008, 'Charokopou', 88, 16542),
('Tsotras', 1977, 'Metamorfwsews', 61, 19546),
('Tziolas', 1988, 'Akadimias', 4, 13988);

-- --------------------------------------------------------

--
-- Table structure for table `reminder`
--

CREATE TABLE `reminder` (
  `EmpID` int(11) NOT NULL,
  `ISBN` int(11) NOT NULL,
  `memberID` int(11) NOT NULL,
  `CopyNr` int(11) NOT NULL,
  `Date_of_borrowing` date NOT NULL,
  `Date_of_reminder` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reminder`
--

INSERT INTO `reminder` (`EmpID`, `ISBN`, `memberID`, `CopyNr`, `Date_of_borrowing`, `Date_of_reminder`) VALUES
(1, 3, 8, 1, '2019-03-10', '2019-03-17'),
(1, 8, 2, 1, '2019-04-30', '2019-05-10'),
(1, 15, 5, 1, '2019-03-21', '2019-03-28'),
(1, 17, 3, 1, '2019-03-16', '2019-04-10'),
(2, 4, 9, 1, '2019-03-28', '2019-04-04'),
(2, 5, 9, 1, '2019-03-18', '2019-03-28'),
(2, 12, 9, 1, '2019-04-03', '2019-04-10'),
(3, 1, 16, 1, '2019-03-14', '2019-03-28'),
(3, 6, 15, 1, '2019-03-29', '2019-04-10'),
(3, 16, 10, 1, '2019-04-01', '2019-04-10');

-- --------------------------------------------------------

--
-- Stand-in structure for view `see all books`
-- (See below for the actual view)
--
CREATE TABLE `see all books` (
`Title` varchar(200)
,`PubName` varchar(200)
,`PubYear` year(4)
,`Afirst` text
,`Alast` text
);

-- --------------------------------------------------------

--
-- Table structure for table `temp_employee`
--

CREATE TABLE `temp_employee` (
  `EmpID` int(11) NOT NULL,
  `ContractNr` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `temp_employee`
--

INSERT INTO `temp_employee` (`EmpID`, `ContractNr`) VALUES
(4, 120915602),
(5, 156811209);

-- --------------------------------------------------------

--
-- Table structure for table `written_by`
--

CREATE TABLE `written_by` (
  `ISBN` int(11) NOT NULL,
  `AuthorID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `written_by`
--

INSERT INTO `written_by` (`ISBN`, `AuthorID`) VALUES
(1, 4),
(2, 10),
(3, 9),
(4, 10),
(5, 7),
(6, 3),
(7, 5),
(8, 8),
(9, 8),
(10, 11),
(11, 6),
(12, 11),
(13, 2),
(14, 1),
(15, 1),
(16, 2),
(17, 7);

-- --------------------------------------------------------

--
-- Structure for view `copies available`
--
DROP TABLE IF EXISTS `copies available`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `copies available`  AS  select `b`.`Title` AS `Title`,`b`.`ISBN` AS `ISBN`,(select count(0) from `copies` `c` where ((`c`.`ISBN` = `b`.`ISBN`) and (`c`.`Availability` = 1))) AS `Available_Number` from `book` `b` ;

-- --------------------------------------------------------

--
-- Structure for view `see all books`
--
DROP TABLE IF EXISTS `see all books`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `see all books`  AS  select `b`.`Title` AS `Title`,`b`.`PubName` AS `PubName`,`b`.`PubYear` AS `PubYear`,`a`.`AFirst` AS `Afirst`,`a`.`ALast` AS `Alast` from ((`book` `b` join `author` `a`) join `written_by`) where ((`b`.`ISBN` = `written_by`.`ISBN`) and (`a`.`AuthorID` = `written_by`.`AuthorID`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`AuthorID`);

--
-- Indexes for table `belongs_to`
--
ALTER TABLE `belongs_to`
  ADD PRIMARY KEY (`ISBN`,`CatName`),
  ADD KEY `CatName` (`CatName`);

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`ISBN`),
  ADD KEY `PubName` (`PubName`);

--
-- Indexes for table `borrows`
--
ALTER TABLE `borrows`
  ADD PRIMARY KEY (`MemberID`,`ISBN`,`CopyNr`,`Date_of_borrowing`),
  ADD KEY `ISBN` (`ISBN`,`CopyNr`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`CatName`),
  ADD KEY `SuperCatName` (`SuperCatName`);

--
-- Indexes for table `copies`
--
ALTER TABLE `copies`
  ADD PRIMARY KEY (`ISBN`,`CopyNr`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`EmpID`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`MemberID`);

--
-- Indexes for table `perm_employee`
--
ALTER TABLE `perm_employee`
  ADD PRIMARY KEY (`EmpID`);

--
-- Indexes for table `publisher`
--
ALTER TABLE `publisher`
  ADD PRIMARY KEY (`PubName`);

--
-- Indexes for table `reminder`
--
ALTER TABLE `reminder`
  ADD PRIMARY KEY (`EmpID`,`ISBN`,`memberID`,`CopyNr`,`Date_of_borrowing`,`Date_of_reminder`),
  ADD KEY `memberID` (`memberID`,`ISBN`,`CopyNr`,`Date_of_borrowing`),
  ADD KEY `ISBN` (`ISBN`,`CopyNr`);

--
-- Indexes for table `temp_employee`
--
ALTER TABLE `temp_employee`
  ADD PRIMARY KEY (`EmpID`);

--
-- Indexes for table `written_by`
--
ALTER TABLE `written_by`
  ADD PRIMARY KEY (`ISBN`,`AuthorID`),
  ADD KEY `AuthorID` (`AuthorID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `author`
--
ALTER TABLE `author`
  MODIFY `AuthorID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `book`
--
ALTER TABLE `book`
  MODIFY `ISBN` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `EmpID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `member`
--
ALTER TABLE `member`
  MODIFY `MemberID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `perm_employee`
--
ALTER TABLE `perm_employee`
  MODIFY `EmpID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `temp_employee`
--
ALTER TABLE `temp_employee`
  MODIFY `EmpID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `belongs_to`
--
ALTER TABLE `belongs_to`
  ADD CONSTRAINT `belongs_to_ibfk_1` FOREIGN KEY (`ISBN`) REFERENCES `book` (`ISBN`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `belongs_to_ibfk_2` FOREIGN KEY (`CatName`) REFERENCES `category` (`CatName`);

--
-- Constraints for table `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `book_ibfk_1` FOREIGN KEY (`PubName`) REFERENCES `publisher` (`PubName`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `borrows`
--
ALTER TABLE `borrows`
  ADD CONSTRAINT `borrows_ibfk_1` FOREIGN KEY (`MemberID`) REFERENCES `member` (`MemberID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `borrows_ibfk_2` FOREIGN KEY (`ISBN`) REFERENCES `book` (`ISBN`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `borrows_ibfk_3` FOREIGN KEY (`ISBN`,`CopyNr`) REFERENCES `copies` (`ISBN`, `CopyNr`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `category_ibfk_1` FOREIGN KEY (`SuperCatName`) REFERENCES `category` (`CatName`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `copies`
--
ALTER TABLE `copies`
  ADD CONSTRAINT `copies_ibfk_1` FOREIGN KEY (`ISBN`) REFERENCES `book` (`ISBN`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `perm_employee`
--
ALTER TABLE `perm_employee`
  ADD CONSTRAINT `perm_employee_ibfk_1` FOREIGN KEY (`EmpID`) REFERENCES `employee` (`EmpID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reminder`
--
ALTER TABLE `reminder`
  ADD CONSTRAINT `reminder_ibfk_1` FOREIGN KEY (`EmpID`) REFERENCES `employee` (`EmpID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reminder_ibfk_2` FOREIGN KEY (`memberID`) REFERENCES `member` (`MemberID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reminder_ibfk_3` FOREIGN KEY (`ISBN`) REFERENCES `book` (`ISBN`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reminder_ibfk_4` FOREIGN KEY (`memberID`,`ISBN`,`CopyNr`,`Date_of_borrowing`) REFERENCES `borrows` (`MemberID`, `ISBN`, `CopyNr`, `Date_of_borrowing`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reminder_ibfk_5` FOREIGN KEY (`ISBN`,`CopyNr`) REFERENCES `copies` (`ISBN`, `CopyNr`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `temp_employee`
--
ALTER TABLE `temp_employee`
  ADD CONSTRAINT `temp_employee_ibfk_1` FOREIGN KEY (`EmpID`) REFERENCES `employee` (`EmpID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `written_by`
--
ALTER TABLE `written_by`
  ADD CONSTRAINT `written_by_ibfk_1` FOREIGN KEY (`AuthorID`) REFERENCES `author` (`AuthorID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `written_by_ibfk_2` FOREIGN KEY (`ISBN`) REFERENCES `book` (`ISBN`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
