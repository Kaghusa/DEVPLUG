-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 20, 2017 at 11:24 PM
-- Server version: 5.7.19-0ubuntu0.16.04.1
-- PHP Version: 7.0.22-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `DevPlug`
--

-- --------------------------------------------------------

--
-- Table structure for table `AdminDeveloper`
--

CREATE TABLE `AdminDeveloper` (
  `NotificationID` int(25) NOT NULL,
  `NotificationContent` varchar(500) DEFAULT NULL,
  `UserID` int(25) DEFAULT NULL,
  `AdminID` int(25) DEFAULT NULL,
  `Date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `AdminDeveloper`
--

INSERT INTO `AdminDeveloper` (`NotificationID`, `NotificationContent`, `UserID`, `AdminID`, `Date`) VALUES
(5, NULL, 1, 1, '2017-11-10 22:00:00'),
(8, 'gpsniyajour', 4, 1, '2017-11-10 22:00:00'),
(9, 'gpsniyajour', 4, 1, '2017-11-10 22:00:00'),
(10, 'Gpsnirfgdgdfgd435jour', 12, 1, '2017-11-14 17:06:39'),
(11, 'Gpsnirfgdgdfgd435jour', 12, 1, '2017-11-14 17:09:02'),
(12, 'Gpsnirfgdgdfgd435jour', 12, 1, '2017-11-14 17:09:59'),
(13, 'Gpsnirfgdgdfgd435jour', 12, 1, '2017-11-14 17:11:21'),
(14, 'Gpsnirfgdgdfgd435jour', 12, 1, '2017-11-14 17:28:34'),
(15, 'Gpsnirfgdgdfgd435jour', 12, 1, '2017-11-14 17:29:20'),
(16, 'Gpsnirfgdgdfgd435jour', 12, 1, '2017-11-14 17:29:51'),
(17, 'Gpsnirfgdgdfgd435jour', 12, 1, '2017-11-14 17:39:28'),
(18, 'Gpsnirfgdgdfgd435jour', 12, 1, '2017-11-14 17:40:55'),
(19, 'Gpsnirfgdgdfgd435jour', 12, 1, '2017-11-14 18:00:18'),
(20, 'Gpsnirfgdgdfgd435jour', 12, 1, '2017-11-14 19:02:48'),
(21, 'Gpsnirfgdgdfgd435jour', 12, 1, '2017-11-14 19:05:53'),
(22, 'Gpsnirfgdgdfgd435jour', 12, 1, '2017-11-14 19:32:09'),
(23, 'Gpsnirfgdgdfgd435jour', 12, 1, '2017-11-14 19:32:43'),
(24, 'Gpsnirfgdgdfgd435jour', 12, 1, '2017-11-14 19:54:49'),
(25, 'Gpsnirfgdgdfgd435jour', 12, 1, '2017-11-14 20:00:48'),
(26, 'Gpsnirfgdgdfgd435jour', 12, 1, '2017-11-14 20:11:29'),
(27, 'Gpsnirfgdgdfgd435jour', 12, 1, '2017-11-14 20:31:34'),
(28, 'Gpsnirfgdgdfgd435jour', 12, 1, '2017-11-14 20:44:52'),
(29, 'Gpsnirfgdgdfgd435jour', 12, 1, '2017-11-14 20:53:08'),
(30, 'Gpsnirfgdgdfgd435jour', 12, 1, '2017-11-14 21:08:59'),
(31, 'Gpsnirfgdgdfgd435jour', 12, 1, '2017-11-14 21:09:59'),
(32, 'Gpsnirfgdgdfgd435jour', 12, 1, '2017-11-14 21:14:11'),
(33, 'Gpsnirfgdgdfgd435jour', 12, 1, '2017-11-14 21:40:40'),
(34, 'Gpsnirfgdgdfgd435jour', 12, 1, '2017-11-14 21:41:55'),
(35, 'Gpsnirfgdgdfgd435jour', 12, 1, '2017-11-14 21:43:01'),
(36, 'Gpsnirfgdgdfgd435jour', 12, 1, '2017-11-14 21:48:37'),
(37, 'Gpsnirfgdgdfgd435jour', 12, 1, '2017-11-14 21:50:43'),
(38, 'Gpsnirfgdgdfgd435jour', 12, 1, '2017-11-14 21:54:10');

-- --------------------------------------------------------

--
-- Table structure for table `AdminMentor`
--

CREATE TABLE `AdminMentor` (
  `NotifFicationID` int(25) NOT NULL,
  `NotifFicationContent` varchar(200) NOT NULL,
  `UserID` int(25) NOT NULL,
  `AdminID` int(25) DEFAULT NULL,
  `Date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Comment`
--

CREATE TABLE `Comment` (
  `CommentID` int(25) NOT NULL,
  `CommentContent` varchar(200) DEFAULT NULL,
  `ConcernedID` int(25) DEFAULT NULL,
  `DateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `UserID` int(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `CommentExp`
--

CREATE TABLE `CommentExp` (
  `CommentID` int(11) NOT NULL,
  `CommentContent` varchar(500) DEFAULT NULL,
  `ConcernedID` int(11) NOT NULL,
  `DateTime` timestamp NULL DEFAULT NULL,
  `UserID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `CommentPat`
--

CREATE TABLE `CommentPat` (
  `CommentContent` varchar(500) DEFAULT NULL,
  `CommentID` int(11) NOT NULL,
  `ConcernedID` int(11) DEFAULT NULL,
  `DateTime` timestamp NULL DEFAULT NULL,
  `UserID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `DevelopperMSG`
--

CREATE TABLE `DevelopperMSG` (
  `MsgID` int(25) NOT NULL,
  `MsgContent` varchar(500) DEFAULT NULL,
  `DateTime` timestamp NULL DEFAULT NULL,
  `SenderID` int(25) DEFAULT NULL,
  `ReceiverID` int(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Domain`
--

CREATE TABLE `Domain` (
  `DomainID` int(25) NOT NULL,
  `DomainName` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Domain`
--

INSERT INTO `Domain` (`DomainID`, `DomainName`) VALUES
(2, 'HEALTH'),
(3, 'EDUCATION'),
(4, 'ENTERTAINMENT'),
(5, 'TECHNOLOGY'),
(6, 'AGRICULTURE'),
(7, 'MUSIC'),
(8, 'ENVIRONMENT '),
(9, 'JUSTICE'),
(10, 'GEOGRAPHY'),
(11, 'TOURISM'),
(12, 'SPORT'),
(13, 'POLITIC'),
(14, 'HUMANITARIA'),
(15, 'FINANCE'),
(16, 'MANAGEMENT'),
(17, 'INFRASTRACTURE'),
(18, 'YOUTH'),
(19, 'TRANSPORT'),
(20, 'E-COMMERCE');

-- --------------------------------------------------------

--
-- Table structure for table `Event`
--

CREATE TABLE `Event` (
  `EventID` int(25) NOT NULL,
  `EventName` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `InstitutionName` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `Description` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `dttime` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Experience`
--

CREATE TABLE `Experience` (
  `ExperienceID` int(25) NOT NULL,
  `ExperienceContent` varchar(500) DEFAULT NULL,
  `DateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `UserID` int(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Favorite`
--

CREATE TABLE `Favorite` (
  `ResourceID` int(25) NOT NULL,
  `UserID` int(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Favorite`
--

INSERT INTO `Favorite` (`ResourceID`, `UserID`) VALUES
(1, 1),
(1, 1),
(1, 1),
(1, 1),
(1, 1),
(1, 1),
(1, 1),
(1, 1),
(1, 1),
(1, 1),
(1, 1),
(1, 1),
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Level`
--

CREATE TABLE `Level` (
  `LevelID` int(25) NOT NULL,
  `LevelName` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Level`
--

INSERT INTO `Level` (`LevelID`, `LevelName`) VALUES
(1, 'Beginner'),
(2, 'Medium'),
(3, 'Expert');

-- --------------------------------------------------------

--
-- Table structure for table `MentorDevMsg`
--

CREATE TABLE `MentorDevMsg` (
  `MsgID` int(25) NOT NULL,
  `MsgContent` varchar(500) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `MentorID` int(25) DEFAULT NULL,
  `DevID` int(25) DEFAULT NULL,
  `Time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `MentorMMsg`
--

CREATE TABLE `MentorMMsg` (
  `MsgID` int(25) NOT NULL,
  `MsgContent` varchar(200) DEFAULT NULL,
  `Date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `SenderID` int(25) DEFAULT NULL,
  `ReceiverID` int(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `MentorRequest`
--

CREATE TABLE `MentorRequest` (
  `MentorID` int(25) NOT NULL,
  `UserID` int(25) DEFAULT NULL,
  `Status` int(2) DEFAULT '0',
  `DateTime` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `MentorRequest`
--

INSERT INTO `MentorRequest` (`MentorID`, `UserID`, `Status`, `DateTime`) VALUES
(347, 346, 1, '2017-11-19 19:42:04'),
(347, 346, 1, '2017-11-19 19:42:16');

-- --------------------------------------------------------

--
-- Table structure for table `Opportunity`
--

CREATE TABLE `Opportunity` (
  `OppID` int(25) NOT NULL,
  `OppContent` varchar(500) DEFAULT NULL,
  `CompanyName` varchar(150) DEFAULT NULL,
  `UserID` int(25) NOT NULL,
  `dttime` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Partner`
--

CREATE TABLE `Partner` (
  `UserID` int(25) NOT NULL,
  `PatReqID` int(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Partner`
--

INSERT INTO `Partner` (`UserID`, `PatReqID`) VALUES
(1, 4),
(1, 4),
(1, 4),
(1, 4),
(1, 4),
(1, 4),
(1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `PartnerRequest`
--

CREATE TABLE `PartnerRequest` (
  `PatReqID` int(25) NOT NULL,
  `PatReqContent` varchar(500) NOT NULL,
  `DateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `DomainID` int(25) NOT NULL,
  `ProgramID` int(25) NOT NULL,
  `UserID` int(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Program`
--

CREATE TABLE `Program` (
  `ProgramID` int(25) NOT NULL,
  `ProgramName` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Program`
--

INSERT INTO `Program` (`ProgramID`, `ProgramName`) VALUES
(1, 'JAVA'),
(2, 'SQL'),
(3, 'JAVASCRIPT'),
(4, 'C'),
(5, 'C++'),
(6, 'PYTHON'),
(7, 'PHP'),
(8, 'RUBY/RAILS'),
(9, 'JAVA ANDROID'),
(10, 'IOS SWIFT'),
(11, 'C# Mobile App');

-- --------------------------------------------------------

--
-- Table structure for table `Project`
--

CREATE TABLE `Project` (
  `ProjectID` int(25) NOT NULL,
  `ProjectName` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `ProjectDescription` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `ProjectDocPDF` varchar(100) DEFAULT NULL,
  `ProjectIcon` varchar(100) DEFAULT NULL,
  `UserID` int(25) NOT NULL,
  `TeamID` int(25) DEFAULT NULL,
  `DomainID` int(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Proposition`
--

CREATE TABLE `Proposition` (
  `PropositionID` int(25) NOT NULL,
  `PropositionContent` varchar(200) DEFAULT NULL,
  `DateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `DomainID` int(25) NOT NULL,
  `UserID` int(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Resources`
--

CREATE TABLE `Resources` (
  `ResourceID` int(25) NOT NULL,
  `ResourceDescription` varchar(200) DEFAULT NULL,
  `ResourcePDF` varchar(100) DEFAULT NULL,
  `ResourceRef1` varchar(100) DEFAULT NULL,
  `ResourceRef2` varchar(100) DEFAULT NULL,
  `ResourceRef3` varchar(100) DEFAULT NULL,
  `ResourceRef4` varchar(100) DEFAULT NULL,
  `ResourceRef5` varchar(100) DEFAULT NULL,
  `Datetime` timestamp NULL DEFAULT NULL,
  `ProgramID` int(25) DEFAULT NULL,
  `Status` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Team`
--

CREATE TABLE `Team` (
  `TeamID` int(25) NOT NULL,
  `DomainName` varchar(25) DEFAULT NULL,
  `DateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `UserID` int(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `TeamChat`
--

CREATE TABLE `TeamChat` (
  `Msgid` int(25) NOT NULL,
  `TeamID` int(25) NOT NULL,
  `UserID` int(25) NOT NULL,
  `MsgContent` varchar(500) DEFAULT NULL,
  `Date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `TeamMembers`
--

CREATE TABLE `TeamMembers` (
  `TeamID` int(25) NOT NULL,
  `UserID` int(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `TeamMembers`
--

INSERT INTO `TeamMembers` (`TeamID`, `UserID`) VALUES
(20, 346),
(20, 347),
(20, 348),
(20, 346),
(21, 347),
(21, 348),
(21, 346),
(22, 346),
(22, 347),
(22, 348),
(22, 346),
(24, 346),
(24, 352),
(24, 352),
(25, 352),
(25, 358),
(25, 358);

-- --------------------------------------------------------

--
-- Table structure for table `Techno`
--

CREATE TABLE `Techno` (
  `TechnID` int(11) NOT NULL,
  `TechName` varchar(5000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Techno`
--

INSERT INTO `Techno` (`TechnID`, `TechName`) VALUES
(1, 'MICROSOFT '),
(2, 'JAVA'),
(3, 'APPLE'),
(4, 'DATABASE'),
(5, 'WEB'),
(6, 'SCRIPTS'),
(7, 'COMPUTER PROGRAMMING'),
(8, 'EMBEDED');

-- --------------------------------------------------------

--
-- Table structure for table `User`
--

CREATE TABLE `User` (
  `UserID` int(25) NOT NULL,
  `LevelID` int(25) DEFAULT NULL,
  `UserName` varchar(25) DEFAULT NULL,
  `Passwd` varchar(250) DEFAULT NULL,
  `Email` varchar(25) DEFAULT NULL,
  `Country` varchar(25) DEFAULT NULL,
  `City` varchar(25) DEFAULT NULL,
  `Tel` varchar(15) DEFAULT NULL,
  `Sex` varchar(6) DEFAULT NULL,
  `DOB` varchar(100) DEFAULT NULL,
  `DateTime` timestamp NULL DEFAULT NULL,
  `Photo` varchar(150) DEFAULT NULL,
  `ProgramID` int(25) DEFAULT NULL,
  `DomainID` int(25) DEFAULT NULL,
  `UserCategoryID` int(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `UserCategory`
--

CREATE TABLE `UserCategory` (
  `UserCategoryID` int(25) NOT NULL,
  `UserCategoryName` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `UserCategory`
--

INSERT INTO `UserCategory` (`UserCategoryID`, `UserCategoryName`) VALUES
(1, 'Developer'),
(2, 'Mentor'),
(3, 'Admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `AdminDeveloper`
--
ALTER TABLE `AdminDeveloper`
  ADD PRIMARY KEY (`NotificationID`),
  ADD KEY `DevelopperID` (`UserID`),
  ADD KEY `AdminID` (`AdminID`),
  ADD KEY `DevelopperID_2` (`UserID`);

--
-- Indexes for table `AdminMentor`
--
ALTER TABLE `AdminMentor`
  ADD PRIMARY KEY (`NotifFicationID`),
  ADD KEY `DevelopperrID` (`UserID`),
  ADD KEY `DevelopperrID_2` (`UserID`),
  ADD KEY `AdminID` (`AdminID`);

--
-- Indexes for table `Comment`
--
ALTER TABLE `Comment`
  ADD PRIMARY KEY (`CommentID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `CommentExp`
--
ALTER TABLE `CommentExp`
  ADD PRIMARY KEY (`CommentID`),
  ADD KEY `ConcernedID` (`ConcernedID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `CommentPat`
--
ALTER TABLE `CommentPat`
  ADD PRIMARY KEY (`CommentID`),
  ADD KEY `ConcernedID` (`ConcernedID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `DevelopperMSG`
--
ALTER TABLE `DevelopperMSG`
  ADD PRIMARY KEY (`MsgID`);

--
-- Indexes for table `Domain`
--
ALTER TABLE `Domain`
  ADD PRIMARY KEY (`DomainID`);

--
-- Indexes for table `Event`
--
ALTER TABLE `Event`
  ADD PRIMARY KEY (`EventID`);

--
-- Indexes for table `Experience`
--
ALTER TABLE `Experience`
  ADD PRIMARY KEY (`ExperienceID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `Favorite`
--
ALTER TABLE `Favorite`
  ADD KEY `ResourceID` (`ResourceID`),
  ADD KEY `UserCategoryName` (`UserID`);

--
-- Indexes for table `Level`
--
ALTER TABLE `Level`
  ADD PRIMARY KEY (`LevelID`);

--
-- Indexes for table `MentorDevMsg`
--
ALTER TABLE `MentorDevMsg`
  ADD PRIMARY KEY (`MsgID`);

--
-- Indexes for table `MentorMMsg`
--
ALTER TABLE `MentorMMsg`
  ADD PRIMARY KEY (`MsgID`),
  ADD KEY `SenderID` (`SenderID`),
  ADD KEY `ReceiverID` (`ReceiverID`);

--
-- Indexes for table `MentorRequest`
--
ALTER TABLE `MentorRequest`
  ADD KEY `UserID` (`UserID`),
  ADD KEY `MentorID` (`MentorID`);

--
-- Indexes for table `Opportunity`
--
ALTER TABLE `Opportunity`
  ADD PRIMARY KEY (`OppID`),
  ADD KEY `FieldID` (`CompanyName`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `Partner`
--
ALTER TABLE `Partner`
  ADD KEY `UserID` (`UserID`),
  ADD KEY `PatReqID` (`PatReqID`);

--
-- Indexes for table `PartnerRequest`
--
ALTER TABLE `PartnerRequest`
  ADD PRIMARY KEY (`PatReqID`),
  ADD KEY `Prog_Language` (`ProgramID`),
  ADD KEY `FieldID` (`DomainID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `Program`
--
ALTER TABLE `Program`
  ADD PRIMARY KEY (`ProgramID`);

--
-- Indexes for table `Project`
--
ALTER TABLE `Project`
  ADD PRIMARY KEY (`ProjectID`),
  ADD KEY `UserID` (`UserID`),
  ADD KEY `TeamID` (`TeamID`),
  ADD KEY `DomainID` (`DomainID`),
  ADD KEY `TeamID_2` (`TeamID`);

--
-- Indexes for table `Proposition`
--
ALTER TABLE `Proposition`
  ADD PRIMARY KEY (`PropositionID`),
  ADD KEY `UserID` (`UserID`),
  ADD KEY `FieldID` (`DomainID`);

--
-- Indexes for table `Resources`
--
ALTER TABLE `Resources`
  ADD PRIMARY KEY (`ResourceID`),
  ADD KEY `ProgramID` (`ProgramID`);

--
-- Indexes for table `Team`
--
ALTER TABLE `Team`
  ADD PRIMARY KEY (`TeamID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `TeamChat`
--
ALTER TABLE `TeamChat`
  ADD PRIMARY KEY (`Msgid`),
  ADD KEY `GroupID` (`TeamID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `TeamMembers`
--
ALTER TABLE `TeamMembers`
  ADD KEY `GroupID` (`TeamID`),
  ADD KEY `USerID` (`UserID`);

--
-- Indexes for table `Techno`
--
ALTER TABLE `Techno`
  ADD PRIMARY KEY (`TechnID`);

--
-- Indexes for table `User`
--
ALTER TABLE `User`
  ADD PRIMARY KEY (`UserID`),
  ADD KEY `Prog_Language` (`ProgramID`),
  ADD KEY `FieldID` (`DomainID`),
  ADD KEY `UserCategory` (`UserCategoryID`),
  ADD KEY `LevelID` (`LevelID`);

--
-- Indexes for table `UserCategory`
--
ALTER TABLE `UserCategory`
  ADD PRIMARY KEY (`UserCategoryID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `AdminDeveloper`
--
ALTER TABLE `AdminDeveloper`
  MODIFY `NotificationID` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
--
-- AUTO_INCREMENT for table `AdminMentor`
--
ALTER TABLE `AdminMentor`
  MODIFY `NotifFicationID` int(25) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Comment`
--
ALTER TABLE `Comment`
  MODIFY `CommentID` int(25) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `CommentExp`
--
ALTER TABLE `CommentExp`
  MODIFY `CommentID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `CommentPat`
--
ALTER TABLE `CommentPat`
  MODIFY `CommentID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Domain`
--
ALTER TABLE `Domain`
  MODIFY `DomainID` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `Event`
--
ALTER TABLE `Event`
  MODIFY `EventID` int(25) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Experience`
--
ALTER TABLE `Experience`
  MODIFY `ExperienceID` int(25) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `MentorMMsg`
--
ALTER TABLE `MentorMMsg`
  MODIFY `MsgID` int(25) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Opportunity`
--
ALTER TABLE `Opportunity`
  MODIFY `OppID` int(25) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `PartnerRequest`
--
ALTER TABLE `PartnerRequest`
  MODIFY `PatReqID` int(25) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Program`
--
ALTER TABLE `Program`
  MODIFY `ProgramID` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `Project`
--
ALTER TABLE `Project`
  MODIFY `ProjectID` int(25) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Proposition`
--
ALTER TABLE `Proposition`
  MODIFY `PropositionID` int(25) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Resources`
--
ALTER TABLE `Resources`
  MODIFY `ResourceID` int(25) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Team`
--
ALTER TABLE `Team`
  MODIFY `TeamID` int(25) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `TeamChat`
--
ALTER TABLE `TeamChat`
  MODIFY `Msgid` int(25) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Techno`
--
ALTER TABLE `Techno`
  MODIFY `TechnID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `User`
--
ALTER TABLE `User`
  MODIFY `UserID` int(25) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `UserCategory`
--
ALTER TABLE `UserCategory`
  MODIFY `UserCategoryID` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `CommentExp`
--
ALTER TABLE `CommentExp`
  ADD CONSTRAINT `CommentExp_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `User` (`UserID`);

--
-- Constraints for table `CommentPat`
--
ALTER TABLE `CommentPat`
  ADD CONSTRAINT `CommentPat_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `User` (`UserID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
