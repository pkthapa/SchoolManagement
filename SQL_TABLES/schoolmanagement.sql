-- phpMyAdmin SQL Dump
	-- version 4.2.11
	-- http://www.phpmyadmin.net
	--
	-- Host: 127.0.0.1
	-- Generation Time: Feb 28, 2017 at 03:19 AM
	-- Server version: 5.6.21
-- PHP Version: 5.6.3


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
	-- Database: `schooldb`
--

-- --------------------------------------------------------

--
	-- Table structure for table `academic_history`
--

CREATE TABLE IF NOT EXISTS `academic_history` (
	`acad_ID` int(11) NOT NULL,
	`student_ID` int(11) NOT NULL,
	`subject` varchar(20) NOT NULL,
	`fullmarks` int(11) NOT NULL,
	`passmarks` int(11) NOT NULL,
	`scoredmarks` int(11) NOT NULL,
	`result` int(11) NOT NULL
);

-- --------------------------------------------------------

--
	-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
	`admin_ID` int(11) NOT NULL,
	`admin_UID` varchar(20) NOT NULL,
	`username` varchar(20) NOT NULL,
	`password` varchar(20) NOT NULL,
	`firstname` varchar(20) NOT NULL,
	`middlename` varchar(20) DEFAULT NULL,
	`lastname` varchar(20) NOT NULL,
	`dob` date NOT NULL,
	`gender` varchar(10) NOT NULL,
	`email` varchar(30) DEFAULT NULL,
	`phone` varchar(15) DEFAULT NULL
);

-- --------------------------------------------------------

--
	-- Table structure for table `fee_management`
--

CREATE TABLE IF NOT EXISTS `fee_management` (
	`fee_ID` int(11) NOT NULL,
	`student_ID` int(11) NOT NULL,
	`date` date NOT NULL,
	`amount` int(11) NOT NULL,
	`fine` int(11) DEFAULT NULL
);

-- --------------------------------------------------------

--
	-- Table structure for table `payroll`
--

CREATE TABLE IF NOT EXISTS `payroll` (
	`payroll_ID` int(11) NOT NULL,
	`staff_ID` int(11) NOT NULL,
	`salarypermonth` float NOT NULL,
	`paymentstatus` tinyint(1) NOT NULL,
	`salaryincrement` int(11) NOT NULL
);

-- --------------------------------------------------------

--
	-- Table structure for table `report`
--

CREATE TABLE IF NOT EXISTS `report` (
	`report_ID` int(11) NOT NULL,
	`student_ID` int(11) NOT NULL
);

-- --------------------------------------------------------

--
	-- Table structure for table `staff`
--

CREATE TABLE IF NOT EXISTS `staff` (
	`staff_ID` int(11) NOT NULL,
	`staff_UID` varchar(20) NOT NULL,
	`firstname` varchar(20) NOT NULL,
	`middlename` varchar(20) NOT NULL,
	`lastname` varchar(20) NOT NULL,
	`age` int(11) DEFAULT NULL,
	`gender` varchar(10) DEFAULT NULL,
	`address` varchar(200) DEFAULT NULL,
	`dob` date NOT NULL,
	`doj` date NOT NULL,
	`designation` varchar(20) NOT NULL,
	`phone` varchar(15) DEFAULT NULL,
	`email` varchar(30) DEFAULT NULL,
	`photo` blob
);

-- --------------------------------------------------------

--
	-- Table structure for table `student`
--

CREATE TABLE IF NOT EXISTS `student` (
	`student_ID` int(11) NOT NULL,
	`student_UID` varchar(20) NOT NULL,
	`firstname` varchar(20) NOT NULL,
	`middlename` varchar(20) DEFAULT NULL,
	`lastname` varchar(20) NOT NULL,
	`rollnumber` varchar(10) NOT NULL,
	`regdnumber` varchar(15) NOT NULL,
	`class` int(11) NOT NULL,
	`gender` varchar(10) DEFAULT NULL,
	`dob` date NOT NULL,
	`doa` date NOT NULL,
	`address` varchar(200) DEFAULT NULL,
	`phone` varchar(15) DEFAULT NULL,
	`email` varchar(30) DEFAULT NULL,
	`photo` blob,
	`username` varchar(20) DEFAULT NULL,
	`password` varchar(20) DEFAULT NULL
);

--
	-- Indexes for dumped tables
--

--
	-- Indexes for table `academic_history`
--
ALTER TABLE `academic_history`
ADD PRIMARY KEY (`acad_ID`), ADD KEY `student_ID` (`student_ID`), ADD KEY `student_ID_2` (`student_ID`);

--
	-- Indexes for table `admin`
--
ALTER TABLE `admin`
ADD PRIMARY KEY (`admin_ID`), ADD UNIQUE KEY `admin_UID` (`admin_UID`);

--
	-- Indexes for table `fee_management`
--
ALTER TABLE `fee_management`
ADD PRIMARY KEY (`fee_ID`), ADD KEY `student_ID` (`student_ID`);

--
	-- Indexes for table `payroll`
--
ALTER TABLE `payroll`
ADD PRIMARY KEY (`payroll_ID`), ADD KEY `staff_ID` (`staff_ID`), ADD KEY `staff_ID_2` (`staff_ID`);

--
	-- Indexes for table `report`
--
ALTER TABLE `report`
ADD PRIMARY KEY (`report_ID`), ADD KEY `student_ID` (`student_ID`);

--
	-- Indexes for table `staff`
--
ALTER TABLE `staff`
ADD PRIMARY KEY (`staff_ID`);

--
	-- Indexes for table `student`
--
ALTER TABLE `student`
ADD PRIMARY KEY (`student_ID`);

--
	-- AUTO_INCREMENT for dumped tables
--

--
	-- AUTO_INCREMENT for table `academic_history`
--
ALTER TABLE `academic_history`
MODIFY `acad_ID` int(11) NOT NULL AUTO_INCREMENT;
--
	-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
MODIFY `admin_ID` int(11) NOT NULL AUTO_INCREMENT;
--
	-- AUTO_INCREMENT for table `fee_management`
--
ALTER TABLE `fee_management`
MODIFY `fee_ID` int(11) NOT NULL AUTO_INCREMENT;
--
	-- AUTO_INCREMENT for table `payroll`
--
ALTER TABLE `payroll`
MODIFY `payroll_ID` int(11) NOT NULL AUTO_INCREMENT;
--
	-- AUTO_INCREMENT for table `report`
--
ALTER TABLE `report`
MODIFY `report_ID` int(11) NOT NULL AUTO_INCREMENT;
--
	-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
MODIFY `staff_ID` int(11) NOT NULL AUTO_INCREMENT;
--
	-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
MODIFY `student_ID` int(11) NOT NULL AUTO_INCREMENT;
--
	-- Constraints for dumped tables
--

--
	-- Constraints for table `academic_history`
--
ALTER TABLE `academic_history`
ADD CONSTRAINT `academic_history_ibfk_1` FOREIGN KEY (`student_ID`) REFERENCES `student` (`student_ID`);

--
	-- Constraints for table `fee_management`
--
ALTER TABLE `fee_management`
ADD CONSTRAINT `fee_management_ibfk_1` FOREIGN KEY (`student_ID`) REFERENCES `student` (`student_ID`);

--
	-- Constraints for table `payroll`
--
ALTER TABLE `payroll`
ADD CONSTRAINT `payroll_ibfk_1` FOREIGN KEY (`staff_ID`) REFERENCES `staff` (`staff_ID`);

--
	-- Constraints for table `report`
--
ALTER TABLE `report`
ADD CONSTRAINT `report_ibfk_1` FOREIGN KEY (`student_ID`) REFERENCES `student` (`student_ID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
