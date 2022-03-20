-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 20, 2022 at 06:37 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `studentevaluation_2019_ce_34`
--

-- --------------------------------------------------------

--
-- Table structure for table `clo`
--

CREATE TABLE `clo` (
  `ID` int(11) NOT NULL,
  `CID` varchar(30) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `clo`
--

INSERT INTO `clo` (`ID`, `CID`, `Name`, `Description`) VALUES
(1, 'CS-363', 'CLO1', 'Implement abstraction and encapsulation in real-world problems.');

-- --------------------------------------------------------

--
-- Table structure for table `clo_evaluation`
--

CREATE TABLE `clo_evaluation` (
  `SID` varchar(30) NOT NULL,
  `CLO_ID` int(11) NOT NULL,
  `MarksObtained` float NOT NULL,
  `Passed` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `clo_evaluation`
--

INSERT INTO `clo_evaluation` (`SID`, `CLO_ID`, `MarksObtained`, `Passed`) VALUES
('2019-CE-34', 1, 6, 1);

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `ID` varchar(30) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Credit_Hours` int(11) NOT NULL,
  `Marks` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`ID`, `Name`, `Credit_Hours`, `Marks`) VALUES
('CS-363', 'Database Management System', 3, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `course_evaluation`
--

CREATE TABLE `course_evaluation` (
  `SID` varchar(30) NOT NULL,
  `CID` varchar(30) NOT NULL,
  `MarksObtained` float DEFAULT NULL,
  `Grade` varchar(5) DEFAULT NULL,
  `Passed` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `course_evaluation`
--

INSERT INTO `course_evaluation` (`SID`, `CID`, `MarksObtained`, `Grade`, `Passed`) VALUES
('2019-CE-34', 'CS-363', NULL, 'A', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pre_reqs`
--

CREATE TABLE `pre_reqs` (
  `CID` varchar(30) NOT NULL,
  `Pre_Req_CID` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `rubrics`
--

CREATE TABLE `rubrics` (
  `Name` varchar(30) NOT NULL,
  `SubCriteria_ID` int(11) NOT NULL,
  `Level` int(11) NOT NULL,
  `Description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rubrics`
--

INSERT INTO `rubrics` (`Name`, `SubCriteria_ID`, `Level`, `Description`) VALUES
('Unsatisfactory', 1, 1, 'No divisions are visible.'),
('Fair', 1, 2, 'Code has divisions but has no reusability.'),
('Good', 1, 3, 'Functionality is divided but has no coherence.'),
('Excellant', 1, 4, 'Proper division with coherence and cohesion.'),
('Unsatisfactory', 5, 1, 'The program does not compile.'),
('Fair', 5, 2, 'The program has minor errors.'),
('Good', 5, 3, 'Inefficient code.'),
('Excellant', 5, 4, 'No errors and efficient code.'),
('Unsatisfactory', 8, 1, 'No test is passed.'),
('Fair', 8, 2, 'Some tests are passed.'),
('Good', 8, 3, 'All tests are passed but show error behavior.'),
('Excellant', 8, 4, 'All tests are passed.');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `Roll_Number` varchar(30) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Father_Name` varchar(30) NOT NULL,
  `Section` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`Roll_Number`, `Name`, `Father_Name`, `Section`) VALUES
('2019-CE-34', 'Muhammad Usman Tahir', 'Liaquat Ali Tahir', 'A');

-- --------------------------------------------------------

--
-- Table structure for table `sub_criteria`
--

CREATE TABLE `sub_criteria` (
  `ID` int(11) NOT NULL,
  `CLO_ID` int(11) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Marks` int(11) NOT NULL,
  `Max_Rubric_Levels` int(11) NOT NULL,
  `Description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sub_criteria`
--

INSERT INTO `sub_criteria` (`ID`, `CLO_ID`, `Name`, `Marks`, `Max_Rubric_Levels`, `Description`) VALUES
(1, 1, 'Design', 3, 4, 'Programs should be decomposed into reusable components.'),
(5, 1, 'Execution', 4, 4, 'The code should be in a working state.'),
(8, 1, 'Testing', 3, 4, 'The program should fulfill all the tests.');

-- --------------------------------------------------------

--
-- Table structure for table `sub_criteria_evaluation`
--

CREATE TABLE `sub_criteria_evaluation` (
  `SID` varchar(30) NOT NULL,
  `SubCriteria_ID` int(11) NOT NULL,
  `RubricLevel_Achieved` int(11) NOT NULL,
  `Marks_Obtained` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sub_criteria_evaluation`
--

INSERT INTO `sub_criteria_evaluation` (`SID`, `SubCriteria_ID`, `RubricLevel_Achieved`, `Marks_Obtained`) VALUES
('2019-CE-34', 1, 2, 1.5),
('2019-CE-34', 5, 3, 3),
('2019-CE-34', 8, 2, 1.5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `clo`
--
ALTER TABLE `clo`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `CID` (`CID`);

--
-- Indexes for table `clo_evaluation`
--
ALTER TABLE `clo_evaluation`
  ADD KEY `SID` (`SID`) USING BTREE,
  ADD KEY `CLO_ID` (`CLO_ID`) USING BTREE;

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `course_evaluation`
--
ALTER TABLE `course_evaluation`
  ADD UNIQUE KEY `SID` (`SID`),
  ADD UNIQUE KEY `CID` (`CID`);

--
-- Indexes for table `pre_reqs`
--
ALTER TABLE `pre_reqs`
  ADD UNIQUE KEY `CID` (`CID`,`Pre_Req_CID`),
  ADD KEY `Pre_Req_CID` (`Pre_Req_CID`);

--
-- Indexes for table `rubrics`
--
ALTER TABLE `rubrics`
  ADD KEY `SubCriteria_ID` (`SubCriteria_ID`) USING BTREE;

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`Roll_Number`);

--
-- Indexes for table `sub_criteria`
--
ALTER TABLE `sub_criteria`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `CLO_ID` (`CLO_ID`) USING BTREE;

--
-- Indexes for table `sub_criteria_evaluation`
--
ALTER TABLE `sub_criteria_evaluation`
  ADD KEY `SubCriteria_ID` (`SubCriteria_ID`) USING BTREE,
  ADD KEY `SID` (`SID`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `clo`
--
ALTER TABLE `clo`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sub_criteria`
--
ALTER TABLE `sub_criteria`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `clo`
--
ALTER TABLE `clo`
  ADD CONSTRAINT `clo_ibfk_1` FOREIGN KEY (`CID`) REFERENCES `course` (`ID`);

--
-- Constraints for table `clo_evaluation`
--
ALTER TABLE `clo_evaluation`
  ADD CONSTRAINT `clo_evaluation_ibfk_1` FOREIGN KEY (`SID`) REFERENCES `student` (`Roll_Number`),
  ADD CONSTRAINT `clo_evaluation_ibfk_2` FOREIGN KEY (`CLO_ID`) REFERENCES `clo` (`ID`);

--
-- Constraints for table `course_evaluation`
--
ALTER TABLE `course_evaluation`
  ADD CONSTRAINT `course_evaluation_ibfk_1` FOREIGN KEY (`CID`) REFERENCES `course` (`ID`),
  ADD CONSTRAINT `course_evaluation_ibfk_2` FOREIGN KEY (`SID`) REFERENCES `student` (`Roll_Number`);

--
-- Constraints for table `pre_reqs`
--
ALTER TABLE `pre_reqs`
  ADD CONSTRAINT `pre_reqs_ibfk_1` FOREIGN KEY (`CID`) REFERENCES `course` (`ID`),
  ADD CONSTRAINT `pre_reqs_ibfk_2` FOREIGN KEY (`Pre_Req_CID`) REFERENCES `course` (`ID`);

--
-- Constraints for table `rubrics`
--
ALTER TABLE `rubrics`
  ADD CONSTRAINT `rubrics_ibfk_1` FOREIGN KEY (`SubCriteria_ID`) REFERENCES `sub_criteria` (`ID`);

--
-- Constraints for table `sub_criteria`
--
ALTER TABLE `sub_criteria`
  ADD CONSTRAINT `sub_criteria_ibfk_1` FOREIGN KEY (`CLO_ID`) REFERENCES `clo` (`ID`);

--
-- Constraints for table `sub_criteria_evaluation`
--
ALTER TABLE `sub_criteria_evaluation`
  ADD CONSTRAINT `sub_criteria_evaluation_ibfk_1` FOREIGN KEY (`SID`) REFERENCES `student` (`Roll_Number`),
  ADD CONSTRAINT `sub_criteria_evaluation_ibfk_2` FOREIGN KEY (`SubCriteria_ID`) REFERENCES `sub_criteria` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
