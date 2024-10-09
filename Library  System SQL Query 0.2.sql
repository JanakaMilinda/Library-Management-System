create database librarysystem;


CREATE TABLE `Member` (
  `memberID` int,
  `Member_Name` varchar(255),
  `Member_Address` varchar(255),
  `Tel_No` varchar(255),
  PRIMARY KEY (`memberID`)
);


CREATE TABLE `Librarian` (
  `Lib_ID` int,
  `Lib_Name` varchar(255),
  `Lib_Address` varchar(255),
  `Tel_No` varchar(10),
  PRIMARY KEY (`Lib_ID`)
);

CREATE TABLE `Login` (
  `ID` int,
  `role` varchar(255),
  `username` varchar(255),
  `password` varchar(255),
  PRIMARY KEY (`ID`, `role`),
  FOREIGN KEY (`ID`) REFERENCES `Member`(`memberID`),
  FOREIGN KEY (`ID`) REFERENCES `Librarian`(`Lib_ID`)
);

CREATE TABLE `Book` (
  `Book_id` int,
  `ISBN` varchar(255),
  `Title` varchar(255),
  `catogery` varchar(255),
  `Author` varchar(255),
  PRIMARY KEY (`Book_id`)
);


CREATE TABLE `Copy` (
  `copy_no` int,
  `Book_id` int,
  `Edition` varchar(255),
  PRIMARY KEY (`copy_no`),
  FOREIGN KEY (`Book_id`) REFERENCES `Book`(`Book_id`)
);

CREATE TABLE `Purchase` (
  `copy_no` int,
  `Lib_ID` int,
  `Purchase_date` date,
  `Price` double,
  PRIMARY KEY (`copy_no`, `Lib_ID`)
);

CREATE TABLE `Reserve` (
  `copy_no` int,
  `memberID` int,
  `Reserve_Date` datetime,
  `Status` varchar(255),
  PRIMARY KEY (`copy_no`, `memberID`, `Reserve_Date`)
);

																																	
CREATE TABLE `Borrow` (
  `copy_no` int,
  `memberID` int,
  `Borrow_Date` datetime,
  `Due_Date` datetime,
  `returned_Date` datetime,
  `Status` varchar(255),
  `penalty_fee` double,
  PRIMARY KEY (`copy_no`, `memberID`, `Borrow_Date`)
);
