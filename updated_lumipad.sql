CREATE DATABASE  IF NOT EXISTS `lumipad` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `lumipad`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: lumipad
-- ------------------------------------------------------
-- Server version	8.0.34

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `aircraft`
--

DROP TABLE IF EXISTS `aircraft`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aircraft` (
  `Code` varchar(3) NOT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `Company` varchar(45) DEFAULT NULL,
  `Size` int DEFAULT NULL,
  PRIMARY KEY (`Code`),
  KEY `Size_idx` (`Size`),
  CONSTRAINT `Size` FOREIGN KEY (`Size`) REFERENCES `aircraft size` (`SizeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aircraft`
--

LOCK TABLES `aircraft` WRITE;
/*!40000 ALTER TABLE `aircraft` DISABLE KEYS */;
INSERT INTO `aircraft` VALUES ('319','A319','Airbus',2),('320','A320','Airbus',2),('321','A321','Airbus',2),('32N','A321neo','Airbus',2),('38M','737-800MAX','Boeing',2),('39M','737-900MAX','Boeing',2),('737','737-700','Boeing',2),('738','737-800','Boeing',2),('772','777-200','Boeing',3),('773','777-300','Boeing',3),('788','787-8','Boeing',3),('789','787-9','Boeing',3),('CR2','CRJ-200','Bombardier',1),('CR7','CRJ-700','Bombardier',1),('CR9','CRJ-900','Bombardier',1);
/*!40000 ALTER TABLE `aircraft` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aircraft size`
--

DROP TABLE IF EXISTS `aircraft size`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aircraft size` (
  `SizeID` int NOT NULL,
  `Size Description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`SizeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aircraft size`
--

LOCK TABLES `aircraft size` WRITE;
/*!40000 ALTER TABLE `aircraft size` DISABLE KEYS */;
INSERT INTO `aircraft size` VALUES (1,'Regional Jet'),(2,'Commercial Narrow Body'),(3,'Commercial Wide Body');
/*!40000 ALTER TABLE `aircraft size` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `airline`
--

DROP TABLE IF EXISTS `airline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airline` (
  `Airline Code` char(2) NOT NULL,
  `ICAO Code` char(3) NOT NULL,
  `Airline Name` varchar(50) NOT NULL,
  `Callsign` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`Airline Code`),
  UNIQUE KEY `ICAO Code_UNIQUE` (`ICAO Code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airline`
--

LOCK TABLES `airline` WRITE;
/*!40000 ALTER TABLE `airline` DISABLE KEYS */;
INSERT INTO `airline` VALUES ('AA','AAL','American Airlines','American'),('AF','AFR','Air France','Airfrans'),('AS','ASA','Alaska Airlines','Alaska'),('B6','JBU','jetBlue','Jetblue'),('BA','BAW','British Airways','Speedbird'),('DL','DAL','Delta Air Lines','Delta'),('F9','FFT','Frontier Airlines','Frontier Flight'),('HA','HAL','Hawaiian Airlines','Hawaiian'),('LH','DLH','Lufthansa','Lufthansa'),('NK','NKS','Spirit Airlines','Spirit Wings'),('SY','SCX','Sun Country Airlines','Sun Country'),('UA','UAL','United Airlines','United'),('WN','SWA','Southwest Airlines','Southwest');
/*!40000 ALTER TABLE `airline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `airplanes`
--

DROP TABLE IF EXISTS `airplanes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airplanes` (
  `Registration ID` char(6) NOT NULL,
  `Number of Seats` int DEFAULT NULL,
  PRIMARY KEY (`Registration ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airplanes`
--

LOCK TABLES `airplanes` WRITE;
/*!40000 ALTER TABLE `airplanes` DISABLE KEYS */;
INSERT INTO `airplanes` VALUES ('N105DX',142),('N108NN',102),('N177AN',102),('N314DN',142),('N542JB',159),('N661DL',142),('N718JB',200),('N77576',96),('N8768Q',175);
/*!40000 ALTER TABLE `airplanes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `airports`
--

DROP TABLE IF EXISTS `airports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airports` (
  `Airport Code` char(3) NOT NULL,
  `Airport Name` varchar(45) NOT NULL,
  `City` varchar(45) NOT NULL,
  `State` char(2) NOT NULL,
  `Display Name` varchar(45) NOT NULL,
  `Time Zone` char(3) NOT NULL,
  PRIMARY KEY (`Airport Code`),
  KEY `State_idx` (`State`),
  CONSTRAINT `StateLink` FOREIGN KEY (`State`) REFERENCES `us states` (`Abbreviation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airports`
--

LOCK TABLES `airports` WRITE;
/*!40000 ALTER TABLE `airports` DISABLE KEYS */;
INSERT INTO `airports` VALUES ('ABQ','Albuquerque International Sunport','Albuquerque','NM','Albuquerque, NM','MST'),('ATL','Hartsfield Jackson International Airport','Atlanta','GA','Atlanta, GA','EST'),('BNA','Nashville International Airport','Nashville','TN','Nashville, TN','CST'),('BOS','Logan International Airport','Boston','MA','Boston, MA','EST'),('CLT','Charlotte Douglas International Airport','Charlotte','NC','Charlotte, NC','EST'),('DAL','Dallas Love Field Airport','Dallas','TX','Dallas-Love, TX','CST'),('DEN','Denver International Airport','Denver','CO','Denver, CO','MST'),('DFW','Dallas Fort Worth International Airport','Grapevine','TX','Dallas-Fort Worth, TX','CST'),('DTW','Detroit Metropolitan Wayne County Airport','Romulus','MI','Detroit, MI','EST'),('EWR','Newark Liberty International Airport','Newark','NJ','Newark, NJ','EST'),('HNL','Daniel K. Inouye International Airport','Honolulu','HI','Honolulu, HI','HST'),('HOU','William P. Hobby Airport','Houston','TX','Houston–Hobby, TX','MST'),('IAH','George Bush Intercontinental Airport','Houston','TX','Houston–Intercontinental, TX','MST'),('JFK','John F. Kennedy International Airport','New York','NY','New York-JFK, NY','EST'),('LAS','Harry Reid International Airport','Paradise','NV','Las Vegas, NV','PST'),('LAX','Los Angeles International Airport','Los Angeles','CA','Los Angeles, CA','PST'),('LGA','LaGuardia Airport','New York','NY','New York-Laguardia, NY','EST'),('MDW','Chicago Midway International Airport','Chicago','IL','Chicago-Midway, IL','CST'),('MSP','Minneapolis–St. Paul International Airport','Fort Snelling','MN','Minneapolis–St. Paul, MN','CST'),('OAK','Oakland International Airport','Oakland','CA','Oakland, CA','PST'),('OGG','Kahului Airport','Kahului','HI','Kahului, HI','HST'),('ORD','Chicago O\'Hare International Airport','Chicago','IL','Chicago-O\' Hare, IL','CST'),('PHX','Phoenix Sky Harbor International Airport','Phoenix','AZ','Phoenix, AZ','AZT'),('RNO','Reno/Tahoe International Airport','Reno','NV','Reno, NV','PST'),('SAN','San Diego International Airport','San Diego','CA','San Diego, CA','PST'),('SEA','Seattle–Tacoma International Airport','SeaTac','WA','Seattle–Tacoma, WA','PST'),('SFO','San Francisco International Airport','Millbrae','CA','San Francisco, CA','PST'),('SJC','San Jose International Airport','San Jose','CA','San Jose, CA','PST'),('SLC','Salt Lake City International Airport','Salt Lake City','UT','Salt Lake City, UT','MST');
/*!40000 ALTER TABLE `airports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `arrival airport`
--

DROP TABLE IF EXISTS `arrival airport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `arrival airport` (
  `Airline Code` char(2) NOT NULL,
  `Flight Number` int NOT NULL,
  `Origin` char(3) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Scheduled Arrival` time DEFAULT NULL,
  `Estimated Arrival` time DEFAULT NULL,
  `Gate` varchar(3) DEFAULT NULL,
  `Baggage Claim` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`Airline Code`,`Flight Number`),
  CONSTRAINT `DestinationFlightFK` FOREIGN KEY (`Airline Code`, `Flight Number`) REFERENCES `flights` (`Airline Code`, `Flight Number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arrival airport`
--

LOCK TABLES `arrival airport` WRITE;
/*!40000 ALTER TABLE `arrival airport` DISABLE KEYS */;
INSERT INTO `arrival airport` VALUES ('AA',1,'LAX','2023-10-09','12:18:00','12:18:00','48A','4'),('AA',3,'LAX','2023-10-09','14:08:00','14:08:00','46C','3'),('B6',15,'SFO','2023-10-09','09:42:00','09:45:00','B7','6'),('B6',416,'JFK','2023-10-09','17:42:00','17:42:00','10','2'),('DL',661,'BOS','2023-10-09','20:58:00','20:58:00','A19','1'),('DL',947,'SAN','2023-10-09','18:27:00','18:27:00','35','7'),('UA',574,'SFO','2023-10-09','13:23:00','13:30:00','F17','10'),('UA',1435,'IAH','2023-10-09','18:44:00','19:00:00','C36','3'),('WN',673,'RNO','2023-10-09','16:13:00','16:17:00','B3','5'),('WN',1231,'OGG','2023-10-09','12:20:00','12:26:00','5','1');
/*!40000 ALTER TABLE `arrival airport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `board`
--

DROP TABLE IF EXISTS `board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `board` (
  `Confirmation No` varchar(6) NOT NULL,
  `Airline Code` char(2) NOT NULL,
  `Flight Number` int NOT NULL,
  PRIMARY KEY (`Confirmation No`,`Airline Code`,`Flight Number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` VALUES ('19EVIU','AA',3),('8T6QTK','WN',1231),('DU5I7K','UA',574),('F43OFC','WN',673),('HOOS6V','B6',416),('IM8A41','AA',1),('IMFHZF','B6',15),('IVKTRP','DL',661),('MI6WI9','UA',1435),('MW7R68','DL',947);
/*!40000 ALTER TABLE `board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departure airport`
--

DROP TABLE IF EXISTS `departure airport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departure airport` (
  `Airline Code` char(2) NOT NULL,
  `Flight Number` int NOT NULL,
  `Destination` char(3) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Scheduled Departure` time DEFAULT NULL,
  `Estimated Departure` time DEFAULT NULL,
  `Gate` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`Airline Code`,`Flight Number`),
  CONSTRAINT `OriginFlightFK` FOREIGN KEY (`Airline Code`, `Flight Number`) REFERENCES `flights` (`Airline Code`, `Flight Number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departure airport`
--

LOCK TABLES `departure airport` WRITE;
/*!40000 ALTER TABLE `departure airport` DISABLE KEYS */;
INSERT INTO `departure airport` VALUES ('AA',1,'JFK','2023-10-09','06:00:00','06:00:00','43'),('AA',3,'JFK','2023-10-09','08:00:00','08:00:00','47B'),('B6',15,'JFK','2023-10-09','03:30:00','03:30:00','B7'),('B6',416,'SFO','2023-10-09','12:00:00','12:00:00','10'),('DL',661,'ATL','2023-10-09','18:20:00','18:20:00','B34'),('DL',947,'ATL','2023-10-09','14:00:00','14:00:00','B36'),('UA',574,'LAS','2023-10-09','11:55:00','11:55:00','D56'),('UA',1435,'SFO','2023-10-09','14:49:00','15:00:00','F17'),('WN',673,'LAS','2023-10-09','15:10:00','15:17:00','B12'),('WN',1231,'HNL','2023-10-09','11:44:00','11:45:00','E3');
/*!40000 ALTER TABLE `departure airport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flights`
--

DROP TABLE IF EXISTS `flights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flights` (
  `Airline Code` char(2) NOT NULL,
  `Flight Number` int NOT NULL,
  `Aircraft Code` varchar(3) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Status` varchar(15) DEFAULT NULL,
  `Departure` varchar(45) DEFAULT NULL,
  `Arrival` varchar(45) DEFAULT NULL,
  `Depart_time` varchar(45) DEFAULT NULL,
  `Arrival_time` varchar(45) DEFAULT NULL,
  `Duration` varchar(45) DEFAULT NULL,
  `first_class_seat_booked` int DEFAULT NULL,
  `first_class_seat_aval` int DEFAULT NULL,
  `buss_class_seat_booked` int DEFAULT NULL,
  `buss_class_seat_aval` int DEFAULT NULL,
  `eco_class_seat_booked` int DEFAULT NULL,
  `eco_class_seat_aval` int DEFAULT NULL,
  `first_class_price` int DEFAULT NULL,
  `buss_class_price` int DEFAULT NULL,
  `eco_class_price` int DEFAULT NULL,
  PRIMARY KEY (`Airline Code`,`Flight Number`),
  KEY `AircraftFKRef_idx` (`Aircraft Code`),
  CONSTRAINT `AircraftFKRef` FOREIGN KEY (`Aircraft Code`) REFERENCES `aircraft` (`Code`),
  CONSTRAINT `AirlineFKRef` FOREIGN KEY (`Airline Code`) REFERENCES `airline` (`Airline Code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flights`
--

LOCK TABLES `flights` WRITE;
/*!40000 ALTER TABLE `flights` DISABLE KEYS */;
INSERT INTO `flights` VALUES ('AA',1,'738','2023-10-09','Arrived','JFK','LAX','00:18:00','02:18:00','2',6,4,8,2,6,4,2,10,50),('AA',3,'319','2023-10-09','Canceled','JFK','LAX','00:18:00','04:18:00','4',5,5,5,5,5,5,2,10,50),('B6',15,'321','2023-10-09','Boarding','JFK','SFO','00:18:00','06:18:00','6',5,6,5,5,5,5,2,10,50),('B6',416,'321','2023-10-09','Delayed','SFO','JFK','00:18:00','08:18:00','8',5,5,5,5,5,5,2,10,50),('DL',661,'321','2023-10-09','Canceled','ATL','BOS','00:18:00','10:18:00','10',5,5,5,5,5,5,2,10,50),('DL',947,'321','2023-10-09','Arrived','ATL','SAN','00:18:00','12:18:00','12',5,5,5,5,5,5,2,10,50),('UA',574,'39M','2023-10-09','Boarding','LAS','SFO','00:18:00','14:18:00','14',5,5,5,5,5,5,2,10,50),('UA',1435,'39M','2023-10-09','Boarding','SFO','IAH','00:18:00','16:18:00','16',5,5,5,5,5,5,2,10,50),('WN',673,'738','2023-10-09','Arrived','LAS','RNO','00:18:00','18:18:00','18',5,5,5,5,5,5,2,10,50),('WN',1231,'39M','2023-10-09','Canceled','HNL','OGG','00:18:00','20:18:00','20',5,5,5,5,5,5,2,10,50);
/*!40000 ALTER TABLE `flights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `include`
--

DROP TABLE IF EXISTS `include`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `include` (
  `Registration ID` char(6) NOT NULL,
  `Aircraft` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`Registration ID`),
  CONSTRAINT `includeAirplanes` FOREIGN KEY (`Registration ID`) REFERENCES `airplanes` (`Registration ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `include`
--

LOCK TABLES `include` WRITE;
/*!40000 ALTER TABLE `include` DISABLE KEYS */;
INSERT INTO `include` VALUES ('N105DX','321'),('N108NN','321'),('N177AN','321'),('N314DN','321'),('N542JB','321'),('N661DL','321'),('N718JB','321'),('N77576','37M'),('N8768Q','38M');
/*!40000 ALTER TABLE `include` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passengers`
--

DROP TABLE IF EXISTS `passengers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passengers` (
  `userid` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) DEFAULT NULL,
  `Date_of_Birth` date DEFAULT NULL,
  `Address` varchar(45) DEFAULT NULL,
  `Phone` varchar(45) DEFAULT NULL,
  `Billing_Info` varchar(15) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `Password` varchar(45) NOT NULL,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `Email_UNIQUE` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passengers`
--

LOCK TABLES `passengers` WRITE;
/*!40000 ALTER TABLE `passengers` DISABLE KEYS */;
INSERT INTO `passengers` VALUES (2,'Simon Schmidt','1958-08-15','1811 Oneida St, Lexington, MO, 64067','660-259-2398','Mastercard','sschmidt12@gmail.com','123'),(3,'Kerry Ashley','1989-12-30','22691 SW 55th Ave, Tualatin, OR, 97062','503-638-2817','Amex','kash7184@gmail.com','123'),(4,'Devon Yates','1990-06-16','950 Meyer Rd, Boyd, WI, 54726','715-644-5526','Discover','devonyates@hotmail.com','123'),(5,'Hipolito Salazar','1993-11-18','10761 Sutphin Blvd, Jamaica, NY, 11435','718-658-6525','Visa','hipolito.salazar@yahoo.com','123'),(6,'Bennett Zhang','1970-09-21','10117 Mitchell Hill Rd, Fairdale, KY 40118','562-231-5387','Visa','zhangchimin@qq.com','123'),(7,'Dolores Mathis','1977-08-12','6624 Big Springs Dr, Arlington, TX 76001','817-563-6001','Mastercard','doloresmathis@aol.com','123'),(8,'Mara Erickson','1978-12-11','4280 Victoria St N, Saint Paul, MN 55126','651-484-6562','Discover','marae@att.net','123'),(9,'Terry Mcintyre','1985-10-06','610 Railroad Ave E, Big Stone Gap, VA 24219','276-523-0665','Mastercard','mcintyreterry@pacbell.com','123'),(10,'Ila Arias','1999-02-13','1299 Homestead Dr, Hickory, NC 28602','828-294-1815','Discover','arias1999ila@yahoo.com','123'),(11,'James Smith','1951-03-02','4661 Alsip Av, Chicago, IL 60002','312-203-9441','Visa','jamessmith831@yahoo.com','123'),(14,'Nam D Van','2023-11-09','3408 Valley Vista Dr.','4086033055','VISA','namvan@outlook.com','123'),(15,'1','2023-11-27','1','1','1','1@gmail.com','1');
/*!40000 ALTER TABLE `passengers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_details`
--

DROP TABLE IF EXISTS `payment_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_details` (
  `PNR` varchar(6) NOT NULL,
  `transaction_id` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `payment_id` varchar(45) DEFAULT NULL,
  `fair` int DEFAULT NULL,
  `payment_gateway` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`PNR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_details`
--

LOCK TABLES `payment_details` WRITE;
/*!40000 ALTER TABLE `payment_details` DISABLE KEYS */;
INSERT INTO `payment_details` VALUES ('053705','XXcJyYY28663YjC','NULL','213',50,'Debit Card PAY'),('059339','XXaNpYY18147PnA',NULL,'452',10,'Debit Card PAY'),('064579','XXaNpYY18147PnA',NULL,'432',4,'Debit Card PAY'),('071556','XXaTaYY49634AtA','NULL','421',2,'Debit Card PAY'),('086339','XXaNpYY18147PnA','NULL','452',20,'Debit Card PAY'),('19EVIU','XXaNpYY18147PnA',NULL,'135',2,'Debit Card PAY'),('8T6QTK','XXaNpYY18147PnA',NULL,'424',8,'Debit Card PAY'),('DU5I7K','XXaNpYY18147PnA',NULL,'452',5,'Debit Card PAY'),('HOOS6V','XXaNpYY18147PnA',NULL,'753',6,'Debit Card PAY');
/*!40000 ALTER TABLE `payment_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase`
--

DROP TABLE IF EXISTS `purchase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchase` (
  `Confirmation No` char(6) NOT NULL,
  `User ID` int DEFAULT NULL,
  `Status` varchar(45) DEFAULT NULL,
  `Price` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`Confirmation No`),
  KEY `PurchaseUser_idx` (`User ID`),
  CONSTRAINT `PurchaseTicket` FOREIGN KEY (`Confirmation No`) REFERENCES `tickets` (`PNR`),
  CONSTRAINT `PurchaseUser` FOREIGN KEY (`User ID`) REFERENCES `passengers` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase`
--

LOCK TABLES `purchase` WRITE;
/*!40000 ALTER TABLE `purchase` DISABLE KEYS */;
INSERT INTO `purchase` VALUES ('19EVIU',11,'Paid',150),('8T6QTK',8,'Booked',130),('DU5I7K',6,'Paid',50),('F43OFC',10,'Paid',2013),('HOOS6V',3,'Upgrade',2100),('IM8A41',9,'Upgrade',1201),('IMFHZF',2,'Paid',190),('IVKTRP',4,'Paid',241),('MI6WI9',7,'Paid',876),('MW7R68',5,'Paid',1287);
/*!40000 ALTER TABLE `purchase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tickets` (
  `PNR` char(6) NOT NULL,
  `userid` varchar(45) DEFAULT NULL,
  `Airline Code` varchar(45) DEFAULT NULL,
  `Flight Number` varchar(45) DEFAULT NULL,
  `no_of_seats` varchar(3) DEFAULT NULL,
  `date_of_flight` varchar(45) DEFAULT NULL,
  `Ticket_type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`PNR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets`
--

LOCK TABLES `tickets` WRITE;
/*!40000 ALTER TABLE `tickets` DISABLE KEYS */;
INSERT INTO `tickets` VALUES ('013268','2','AA','1','1','2023-12-04','Business Class'),('053705','2','AA','1','1','2023-12-04','Economic Class'),('059339','2','AA','1','1','2023-12-04','Business Class'),('064579','2','AA','1','1','2023-12-04','Economic Class'),('071556','2','AA','1','1','2023-12-04','First Class'),('086339','2','AA','1','2','2023-12-04','Business Class'),('19EVIU','2','AA','1','2','2023-10-09','Bussiness'),('8T6QTK','2','AA','3','4','2023-10-09','First Class'),('DU5I7K','3','B6','15','1','2023-10-09','Bussiness'),('F43OFC','4','B6','416','6','2023-10-09','Economic'),('HOOS6V','5','DL','661','3','2023-10-09','Economic'),('IM8A41','6','DL','947','5','2023-10-09','Bussiness'),('IMFHZF','7','UA','574','6','2023-10-09','First Class'),('IVKTRP','8','UA','1435','1','2023-10-09','Bussiness'),('MI6WI9','9','WN','673','1','2023-10-09','Economic'),('MW7R68','10','WN','1231','1','2023-10-09','Bussiness');
/*!40000 ALTER TABLE `tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `us states`
--

DROP TABLE IF EXISTS `us states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `us states` (
  `Abbreviation` char(2) NOT NULL,
  `Name` varchar(45) NOT NULL,
  PRIMARY KEY (`Abbreviation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `us states`
--

LOCK TABLES `us states` WRITE;
/*!40000 ALTER TABLE `us states` DISABLE KEYS */;
INSERT INTO `us states` VALUES ('AK','Alaska'),('AL','Alabama'),('AR','Arkansas'),('AZ','Arizona'),('CA','California'),('CO','Colorado'),('CT','Connecticut'),('DC','District of Columbia'),('DE','Delaware'),('FL','Florida'),('GA','Georgia'),('HI','Hawaii'),('IA','Iowa'),('ID','Idaho'),('IL','Illinois'),('IN','Indiana'),('KS','Kansas'),('KY','Kentucky'),('LA','Louisiana'),('MA','Massachusetts'),('MD','Maryland'),('ME','Maine'),('MI','Michigan'),('MN','Minnesota'),('MO','Missouri'),('MS','Mississippi'),('MT','Montana'),('NC','North Carolina'),('ND','North Dakota'),('NE','Nebraska'),('NH','New Hampshire'),('NJ','New Jersey'),('NM','New Mexico'),('NV','Nevada'),('NY','New York'),('OH','Ohio'),('OK','Oklahoma'),('OR','Oregon'),('PA','Pennsylvania'),('RI','Rhode Island'),('SC','South Carolina'),('SD','South Dakota'),('TN','Tennessee'),('TX','Texas'),('UT','Utah'),('VA','Virginia'),('VT','Vermont'),('WA','Washington'),('WI','Wisconsin'),('WV','West Virginia'),('WY','Wyoming');
/*!40000 ALTER TABLE `us states` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-05 16:03:43
