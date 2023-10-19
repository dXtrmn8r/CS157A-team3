-- MySQL dump 10.13  Distrib 8.0.34, for macos13 (arm64)
--
-- Host: localhost    Database: Lumipad
-- ------------------------------------------------------
-- Server version	8.0.34

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Aircraft`
--

DROP TABLE IF EXISTS `Aircraft`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Aircraft` (
  `Code` varchar(3) NOT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `Company` varchar(45) DEFAULT NULL,
  `Size` int DEFAULT NULL,
  PRIMARY KEY (`Code`),
  KEY `Size_idx` (`Size`),
  CONSTRAINT `Size` FOREIGN KEY (`Size`) REFERENCES `Aircraft Size` (`SizeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Aircraft`
--

LOCK TABLES `Aircraft` WRITE;
/*!40000 ALTER TABLE `Aircraft` DISABLE KEYS */;
INSERT INTO `Aircraft` VALUES ('319','A319','Airbus',2),('320','A320','Airbus',2),('321','A321','Airbus',2),('32N','A321neo','Airbus',2),('38M','737-800MAX','Boeing',2),('39M','737-900MAX','Boeing',2),('737','737-700','Boeing',2),('738','737-800','Boeing',2),('772','777-200','Boeing',3),('773','777-300','Boeing',3),('788','787-8','Boeing',3),('789','787-9','Boeing',3),('CR2','CRJ-200','Bombardier',1),('CR7','CRJ-700','Bombardier',1),('CR9','CRJ-900','Bombardier',1);
/*!40000 ALTER TABLE `Aircraft` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Aircraft Size`
--

DROP TABLE IF EXISTS `Aircraft Size`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Aircraft Size` (
  `SizeID` int NOT NULL,
  `Size Description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`SizeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Aircraft Size`
--

LOCK TABLES `Aircraft Size` WRITE;
/*!40000 ALTER TABLE `Aircraft Size` DISABLE KEYS */;
INSERT INTO `Aircraft Size` VALUES (1,'Regional Jet'),(2,'Commercial Narrow Body'),(3,'Commercial Wide Body');
/*!40000 ALTER TABLE `Aircraft Size` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Airline`
--

DROP TABLE IF EXISTS `Airline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Airline` (
  `Airline Code` char(2) NOT NULL,
  `ICAO Code` char(3) NOT NULL,
  `Airline Name` varchar(50) NOT NULL,
  `Callsign` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`Airline Code`),
  UNIQUE KEY `ICAO Code_UNIQUE` (`ICAO Code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Airline`
--

LOCK TABLES `Airline` WRITE;
/*!40000 ALTER TABLE `Airline` DISABLE KEYS */;
INSERT INTO `Airline` VALUES ('AA','AAL','American Airlines','American'),('AF','AFR','Air France','Airfrans'),('AS','ASA','Alaska Airlines','Alaska'),('B6','JBU','jetBlue','Jetblue'),('BA','BAW','British Airways','Speedbird'),('DL','DAL','Delta Air Lines','Delta'),('F9','FFT','Frontier Airlines','Frontier Flight'),('HA','HAL','Hawaiian Airlines','Hawaiian'),('LH','DLH','Lufthansa','Lufthansa'),('NK','NKS','Spirit Airlines','Spirit Wings'),('SY','SCX','Sun Country Airlines','Sun Country'),('UA','UAL','United Airlines','United'),('WN','SWA','Southwest Airlines','Southwest');
/*!40000 ALTER TABLE `Airline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Airplanes`
--

DROP TABLE IF EXISTS `Airplanes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Airplanes` (
  `Registration ID` char(6) NOT NULL,
  `Number of Seats` int DEFAULT NULL,
  PRIMARY KEY (`Registration ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Airplanes`
--

LOCK TABLES `Airplanes` WRITE;
/*!40000 ALTER TABLE `Airplanes` DISABLE KEYS */;
INSERT INTO `Airplanes` VALUES ('N105DX',142),('N108NN',102),('N177AN',102),('N314DN',142),('N542JB',159),('N661DL',142),('N718JB',200),('N77576',96),('N8768Q',175);
/*!40000 ALTER TABLE `Airplanes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Airports`
--

DROP TABLE IF EXISTS `Airports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Airports` (
  `Airport Code` char(3) NOT NULL,
  `Airport Name` varchar(45) NOT NULL,
  `City` varchar(45) NOT NULL,
  `State` char(2) NOT NULL,
  `Display Name` varchar(45) NOT NULL,
  `Time Zone` char(3) NOT NULL,
  PRIMARY KEY (`Airport Code`),
  KEY `State_idx` (`State`),
  CONSTRAINT `StateLink` FOREIGN KEY (`State`) REFERENCES `US States` (`Abbreviation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Airports`
--

LOCK TABLES `Airports` WRITE;
/*!40000 ALTER TABLE `Airports` DISABLE KEYS */;
INSERT INTO `Airports` VALUES ('ATL','Hartsfield Jackson International Airport','Atlanta','GA','Atlanta, GA','EST'),('BNA','Nashville International Airport','Nashville','TN','Nashville, TN','CST'),('BOS','Logan International Airport','Boston','MA','Boston, MA','EST'),('CLT','Charlotte Douglas International Airport','Charlotte','NC','Charlotte, NC','EST'),('DAL','Dallas Love Field Airport','Dallas','TX','Dallas-Love, TX','CST'),('DEN','Denver International Airport','Denver','CO','Denver, CO','MST'),('DFW','Dallas Fort Worth International Airport','Grapevine','TX','Dallas-Fort Worth, TX','CST'),('DTW','Detroit Metropolitan Wayne County Airport','Romulus','MI','Detroit, MI','EST'),('EWR','Newark Liberty International Airport','Newark','NJ','Newark, NJ','EST'),('HNL','Daniel K. Inouye International Airport','Honolulu','HI','Honolulu, HI','HST'),('JFK','John F. Kennedy International Airport','New York','NY','New York-JFK, NY','EST'),('LAS','Harry Reid International Airport','Paradise','NV','Las Vegas, NV','PST'),('LGA','LaGuardia Airport','New York','NY','New York-Laguardia, NY','EST'),('MDW','Chicago Midway International Airport','Chicago','IL','Chicago-Midway, IL','CST'),('MSP','Minneapolis–St. Paul International Airport','Fort Snelling','MN','Minneapolis–St. Paul, MN','CST'),('OAK','Oakland International Airport','Oakland','CA','Oakland, CA','PST'),('OGG','Kahului Airport','Kahului','HI','Kahului, HI','HST'),('ORD','Chicago O\'Hare International Airport','Chicago','IL','Chicago-O\' Hare, IL','CST'),('PHX','Phoenix Sky Harbor International Airport','Phoenix','AZ','Phoenix, AZ','AZT'),('RNO','Reno/Tahoe International Airport','Reno','NV','Reno, NV','PST'),('SAN','San Diego International Airport','San Diego','CA','San Diego, CA','PST'),('SEA','Seattle–Tacoma International Airport','SeaTac','WA','Seattle–Tacoma, WA','PST'),('SFO','San Francisco International Airport','Millbrae','CA','San Francisco, CA','PST'),('SJC','San Jose International Airport','San Jose','CA','San Jose, CA','PST'),('SLC','Salt Lake City International Airport','Salt Lake City','UT','Salt Lake City, UT','MST');
/*!40000 ALTER TABLE `Airports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Arrival Airport`
--

DROP TABLE IF EXISTS `Arrival Airport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Arrival Airport` (
  `Airline Code` char(2) NOT NULL,
  `Flight Number` int NOT NULL,
  `Origin` char(3) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Scheduled Arrival` time DEFAULT NULL,
  `Estimated Arrival` time DEFAULT NULL,
  `Gate` varchar(3) DEFAULT NULL,
  `Baggage Claim` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`Airline Code`,`Flight Number`),
  CONSTRAINT `DestinationFlightFK` FOREIGN KEY (`Airline Code`, `Flight Number`) REFERENCES `Flights` (`Airline Code`, `Flight Number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Arrival Airport`
--

LOCK TABLES `Arrival Airport` WRITE;
/*!40000 ALTER TABLE `Arrival Airport` DISABLE KEYS */;
INSERT INTO `Arrival Airport` VALUES ('AA',1,'LAX','2023-10-09','12:18:00','12:18:00','48A','4'),('AA',3,'LAX','2023-10-09','14:08:00','14:08:00','46C','3'),('B6',15,'SFO','2023-10-09','09:42:00','09:45:00','B7','6'),('B6',416,'JFK','2023-10-09','17:42:00','17:42:00','10','2'),('DL',661,'BOS','2023-10-09','20:58:00','20:58:00','A19','1'),('DL',947,'SAN','2023-10-09','18:27:00','18:27:00','35','7'),('UA',574,'SFO','2023-10-09','13:23:00','13:30:00','F17','10'),('UA',1435,'HOU','2023-10-09','18:44:00','19:00:00','C36','3'),('WN',673,'RNO','2023-10-09','16:13:00','16:17:00','B3','5'),('WN',1231,'OGG','2023-10-09','12:20:00','12:26:00','5','1');
/*!40000 ALTER TABLE `Arrival Airport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Board`
--

DROP TABLE IF EXISTS `Board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Board` (
  `Confirmation No` varchar(6) NOT NULL,
  `Airline Code` char(2) NOT NULL,
  `Flight Number` int NOT NULL,
  PRIMARY KEY (`Confirmation No`,`Airline Code`,`Flight Number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Board`
--

LOCK TABLES `Board` WRITE;
/*!40000 ALTER TABLE `Board` DISABLE KEYS */;
INSERT INTO `Board` VALUES ('19EVIU','AA',3),('8T6QTK','WN',1231),('DU5I7K','UA',574),('F43OFC','WN',673),('HOOS6V','B6',416),('IM8A41','AA',1),('IMFHZF','B6',15),('IVKTRP','DL',661),('MI6WI9','UA',1435),('MW7R68','DL',947);
/*!40000 ALTER TABLE `Board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Departure Airport`
--

DROP TABLE IF EXISTS `Departure Airport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Departure Airport` (
  `Airline Code` char(2) NOT NULL,
  `Flight Number` int NOT NULL,
  `Destination` char(3) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Scheduled Departure` time DEFAULT NULL,
  `Estimated Departure` time DEFAULT NULL,
  `Gate` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`Airline Code`,`Flight Number`),
  CONSTRAINT `OriginFlightFK` FOREIGN KEY (`Airline Code`, `Flight Number`) REFERENCES `Flights` (`Airline Code`, `Flight Number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Departure Airport`
--

LOCK TABLES `Departure Airport` WRITE;
/*!40000 ALTER TABLE `Departure Airport` DISABLE KEYS */;
INSERT INTO `Departure Airport` VALUES ('AA',1,'JFK','2023-10-09','06:00:00','06:00:00','43'),('AA',3,'JFK','2023-10-09','08:00:00','08:00:00','47B'),('B6',15,'JFK','2023-10-09','03:30:00','03:30:00','B7'),('B6',416,'SFO','2023-10-09','12:00:00','12:00:00','10'),('DL',661,'ATL','2023-10-09','18:20:00','18:20:00','B34'),('DL',947,'ATL','2023-10-09','14:00:00','14:00:00','B36'),('UA',574,'LAS','2023-10-09','11:55:00','11:55:00','D56'),('UA',1435,'SFO','2023-10-09','14:49:00','15:00:00','F17'),('WN',673,'LAS','2023-10-09','15:10:00','15:17:00','B12'),('WN',1231,'HNL','2023-10-09','11:44:00','11:45:00','E3');
/*!40000 ALTER TABLE `Departure Airport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Flights`
--

DROP TABLE IF EXISTS `Flights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Flights` (
  `Airline Code` char(2) NOT NULL,
  `Flight Number` int NOT NULL,
  `Aircraft Code` varchar(3) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Status` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`Airline Code`,`Flight Number`),
  KEY `AircraftFKRef_idx` (`Aircraft Code`),
  CONSTRAINT `AircraftFKRef` FOREIGN KEY (`Aircraft Code`) REFERENCES `Aircraft` (`Code`),
  CONSTRAINT `AirlineFKRef` FOREIGN KEY (`Airline Code`) REFERENCES `Airline` (`Airline Code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Flights`
--

LOCK TABLES `Flights` WRITE;
/*!40000 ALTER TABLE `Flights` DISABLE KEYS */;
INSERT INTO `Flights` VALUES ('AA',1,'738','2023-10-09',NULL),('AA',3,'319','2023-10-09',NULL),('B6',15,'321','2023-10-09',NULL),('B6',416,'321','2023-10-09',NULL),('DL',661,'321','2023-10-09',NULL),('DL',947,'321','2023-10-09',NULL),('UA',574,'39M','2023-10-09',NULL),('UA',1435,'39M','2023-10-09',NULL),('WN',673,'738','2023-10-09',NULL),('WN',1231,'39M','2023-10-09',NULL);
/*!40000 ALTER TABLE `Flights` ENABLE KEYS */;
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
  CONSTRAINT `includeAirplanes` FOREIGN KEY (`Registration ID`) REFERENCES `Airplanes` (`Registration ID`)
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
-- Table structure for table `Passengers`
--

DROP TABLE IF EXISTS `Passengers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Passengers` (
  `User ID` int NOT NULL DEFAULT '0',
  `Name` varchar(45) DEFAULT NULL,
  `Date of Birth` date DEFAULT NULL,
  `Sex` varchar(1) DEFAULT NULL,
  `Address` varchar(45) DEFAULT NULL,
  `Phone` varchar(45) DEFAULT NULL,
  `Billing_Info` varchar(15) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`User ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Passengers`
--

LOCK TABLES `Passengers` WRITE;
/*!40000 ALTER TABLE `Passengers` DISABLE KEYS */;
INSERT INTO `Passengers` VALUES (1,'James Smith','1951-03-02','M','4661 Alsip Av, Chicago, IL 60002','312-203-9441','Visa','jamessmith831@yahoo.com'),(2,'Simon Schmidt','1958-08-15','M','1811 Oneida St, Lexington, MO, 64067','660-259-2398','Mastercard','sschmidt12@gmail.com'),(3,'Kerry Ashley','1989-12-30','F','22691 SW 55th Ave, Tualatin, OR, 97062','503-638-2817','Amex','kash7184@gmail.com'),(4,'Devon Yates','1990-06-16','M','950 Meyer Rd, Boyd, WI, 54726','715-644-5526','Discover','devonyates@hotmail.com'),(5,'Hipolito Salazar','1993-11-18','M','10761 Sutphin Blvd, Jamaica, NY, 11435','718-658-6525','Visa','hipolito.salazar@yahoo.com'),(6,'Bennett Zhang','1970-09-21','F','10117 Mitchell Hill Rd, Fairdale, KY 40118','562-231-5387','Visa','zhangchimin@qq.com'),(7,'Dolores Mathis','1977-08-12','F','6624 Big Springs Dr, Arlington, TX 76001','817-563-6001','Mastercard','doloresmathis@aol.com'),(8,'Mara Erickson','1978-12-11','F','4280 Victoria St N, Saint Paul, MN 55126','651-484-6562','Discover','marae@att.net'),(9,'Terry Mcintyre','1985-10-06','F','610 Railroad Ave E, Big Stone Gap, VA 24219','276-523-0665','Mastercard','mcintyreterry@pacbell.com'),(10,'Ila Arias','1999-02-13','F','1299 Homestead Dr, Hickory, NC 28602','828-294-1815','Discover','arias1999ila@yahoo.com');
/*!40000 ALTER TABLE `Passengers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Purchase`
--

DROP TABLE IF EXISTS `Purchase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Purchase` (
  `Confirmation No` char(6) NOT NULL,
  `User ID` int DEFAULT NULL,
  `Status` varchar(45) DEFAULT NULL,
  `Price` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`Confirmation No`),
  KEY `PurchaseUser_idx` (`User ID`),
  CONSTRAINT `PurchaseTicket` FOREIGN KEY (`Confirmation No`) REFERENCES `Tickets` (`Confirmation No`),
  CONSTRAINT `PurchaseUser` FOREIGN KEY (`User ID`) REFERENCES `Passengers` (`User ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Purchase`
--

LOCK TABLES `Purchase` WRITE;
/*!40000 ALTER TABLE `Purchase` DISABLE KEYS */;
INSERT INTO `Purchase` VALUES ('19EVIU',1,'Paid',150),('8T6QTK',8,'Booked',130),('DU5I7K',6,'Paid',50),('F43OFC',10,'Paid',2013),('HOOS6V',3,'Upgrade',2100),('IM8A41',9,'Upgrade',1201),('IMFHZF',2,'Paid',190),('IVKTRP',4,'Paid',241),('MI6WI9',7,'Paid',876),('MW7R68',5,'Paid',1287);
/*!40000 ALTER TABLE `Purchase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tickets`
--

DROP TABLE IF EXISTS `Tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Tickets` (
  `Confirmation No` char(6) NOT NULL,
  `SeatNo` varchar(3) DEFAULT NULL,
  `Class` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`Confirmation No`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tickets`
--

LOCK TABLES `Tickets` WRITE;
/*!40000 ALTER TABLE `Tickets` DISABLE KEYS */;
INSERT INTO `Tickets` VALUES ('19EVIU','21A','Q'),('8T6QTK','43K','R'),('DU5I7K','56C','K'),('F43OFC','1B','Y'),('HOOS6V','1A','F'),('IM8A41','12H','S'),('IMFHZF','45F','P'),('IVKTRP','25B','K'),('MI6WI9','9C','J'),('MW7R68','16E','W');
/*!40000 ALTER TABLE `Tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `US States`
--

DROP TABLE IF EXISTS `US States`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `US States` (
  `Abbreviation` char(2) NOT NULL,
  `Name` varchar(45) NOT NULL,
  PRIMARY KEY (`Abbreviation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `US States`
--

LOCK TABLES `US States` WRITE;
/*!40000 ALTER TABLE `US States` DISABLE KEYS */;
INSERT INTO `US States` VALUES ('AK','Alaska'),('AL','Alabama'),('AR','Arkansas'),('AZ','Arizona'),('CA','California'),('CO','Colorado'),('CT','Connecticut'),('DC','District of Columbia'),('DE','Delaware'),('FL','Florida'),('GA','Georgia'),('HI','Hawaii'),('IA','Iowa'),('ID','Idaho'),('IL','Illinois'),('IN','Indiana'),('KS','Kansas'),('KY','Kentucky'),('LA','Louisiana'),('MA','Massachusetts'),('MD','Maryland'),('ME','Maine'),('MI','Michigan'),('MN','Minnesota'),('MO','Missouri'),('MS','Mississippi'),('MT','Montana'),('NC','North Carolina'),('ND','North Dakota'),('NE','Nebraska'),('NH','New Hampshire'),('NJ','New Jersey'),('NM','New Mexico'),('NV','Nevada'),('NY','New York'),('OH','Ohio'),('OK','Oklahoma'),('OR','Oregon'),('PA','Pennsylvania'),('RI','Rhode Island'),('SC','South Carolina'),('SD','South Dakota'),('TN','Tennessee'),('TX','Texas'),('UT','Utah'),('VA','Virginia'),('VT','Vermont'),('WA','Washington'),('WI','Wisconsin'),('WV','West Virginia'),('WY','Wyoming');
/*!40000 ALTER TABLE `US States` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-18 18:02:03
