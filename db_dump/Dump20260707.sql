CREATE DATABASE  IF NOT EXISTS `new_finaldbrentcar` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `new_finaldbrentcar`;
-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: new_finaldbrentcar
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addresses` (
  `idaddress` int NOT NULL AUTO_INCREMENT,
  `postal_code` varchar(4) NOT NULL,
  `street_name` varchar(30) NOT NULL,
  `house_number` varchar(8) NOT NULL,
  `locality_names_idlocality_name` int NOT NULL,
  `street_types_idstreet_type` int NOT NULL,
  PRIMARY KEY (`idaddress`),
  UNIQUE KEY `idaddress_UNIQUE` (`idaddress`),
  UNIQUE KEY `unique_full_address` (`postal_code`,`street_name`,`house_number`,`locality_names_idlocality_name`,`street_types_idstreet_type`),
  KEY `fk_addresses_locality_names1_idx` (`locality_names_idlocality_name`),
  KEY `fk_addresses_street_types1_idx` (`street_types_idstreet_type`),
  CONSTRAINT `fk_addresses_locality_names1` FOREIGN KEY (`locality_names_idlocality_name`) REFERENCES `locality_names` (`idlocality_name`),
  CONSTRAINT `fk_addresses_street_types1` FOREIGN KEY (`street_types_idstreet_type`) REFERENCES `street_types` (`idstreet_type`),
  CONSTRAINT `ck_postal_code_format` CHECK (regexp_like(`postal_code`,_utf8mb4'^[0-9]{4}$')),
  CONSTRAINT `ck_postal_code_len` CHECK ((char_length(`postal_code`) = 4))
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses` VALUES (7,'1048','Json','34',1,1),(1,'1048','Nádasdy','32',1,1),(14,'1051','Kossuth Lajos','12A',1,1),(9,'1111','Kossuth','12',1,1),(11,'1111','Nadas','34',1,3),(16,'1111','sdfsdafsdafasfsd','33',1,1),(13,'1234','Van','22',1,1),(10,'1234','Van','33',1,1),(12,'1234','Van','44',1,1),(6,'3300','Dobó István','11',2,1),(3,'3321','Fő','1',1,1),(4,'3321','Fő','1',3,2),(15,'4444','Van','22',1,1);
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_insert_addresses` BEFORE INSERT ON `addresses` FOR EACH ROW BEGIN

	IF TRIM(NEW.street_name) = '' then
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Street name cannot be empty';
    end if;
    
    IF TRIM(NEW.house_number) = '' then 
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'House number cannot be empty';
    end if;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_update_addresses` BEFORE UPDATE ON `addresses` FOR EACH ROW BEGIN
	
	IF TRIM(NEW.street_name) = '' then
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Street name cannot be empty';
    end if;
    
    IF TRIM(NEW.house_number) = '' then 
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'House number cannot be empty';
    end if;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `bodytypes`
--

DROP TABLE IF EXISTS `bodytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bodytypes` (
  `idbodytype` int NOT NULL AUTO_INCREMENT,
  `bodytype` varchar(15) NOT NULL,
  PRIMARY KEY (`idbodytype`),
  UNIQUE KEY `bodytype_UNIQUE` (`bodytype`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bodytypes`
--

LOCK TABLES `bodytypes` WRITE;
/*!40000 ALTER TABLE `bodytypes` DISABLE KEYS */;
INSERT INTO `bodytypes` VALUES (4,'cabrio'),(3,'sedan');
/*!40000 ALTER TABLE `bodytypes` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_insert_bodytypes` BEFORE INSERT ON `bodytypes` FOR EACH ROW BEGIN

	IF TRIM(NEW.bodytype) = '' then
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Body type field cannot be empty';
    end if;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_update_bodytypes` BEFORE UPDATE ON `bodytypes` FOR EACH ROW BEGIN
	SIGNAL SQLSTATE '45000'
	SET MESSAGE_TEXT = 'Update is not allowed in this table';
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `cars`
--

DROP TABLE IF EXISTS `cars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cars` (
  `idcar` int NOT NULL AUTO_INCREMENT,
  `vin_number` char(17) NOT NULL,
  `car_performance` int NOT NULL,
  `engine_size` int NOT NULL,
  `licence_plate` char(7) DEFAULT NULL,
  `technical_validity` date NOT NULL,
  `status` varchar(20) DEFAULT 'available',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `production_time_idproduction_time` int NOT NULL,
  `colors_idcolor` int NOT NULL,
  `bodytypes_idbodytype` int NOT NULL,
  `fuels_idfuel` int NOT NULL,
  `locations_idlocation` int NOT NULL,
  `manufacturer_type_id` int NOT NULL,
  PRIMARY KEY (`idcar`),
  UNIQUE KEY `vin_number_UNIQUE` (`vin_number`),
  UNIQUE KEY `licence_plate_UNIQUE` (`licence_plate`),
  KEY `fk_cars_production_time1_idx` (`production_time_idproduction_time`),
  KEY `fk_cars_colors1_idx` (`colors_idcolor`),
  KEY `fk_cars_bodytypes1_idx` (`bodytypes_idbodytype`),
  KEY `fk_cars_fuels1_idx` (`fuels_idfuel`),
  KEY `fk_cars_locations1_idx` (`locations_idlocation`),
  KEY `fk_manufacturer_type` (`manufacturer_type_id`),
  CONSTRAINT `fk_cars_bodytypes1` FOREIGN KEY (`bodytypes_idbodytype`) REFERENCES `bodytypes` (`idbodytype`),
  CONSTRAINT `fk_cars_colors1` FOREIGN KEY (`colors_idcolor`) REFERENCES `colors` (`idcolor`),
  CONSTRAINT `fk_cars_fuels1` FOREIGN KEY (`fuels_idfuel`) REFERENCES `fuels` (`idfuel`),
  CONSTRAINT `fk_cars_locations1` FOREIGN KEY (`locations_idlocation`) REFERENCES `locations` (`idlocation`),
  CONSTRAINT `fk_cars_production_time1` FOREIGN KEY (`production_time_idproduction_time`) REFERENCES `production_time` (`idproduction_time`),
  CONSTRAINT `fk_manufacturer_type` FOREIGN KEY (`manufacturer_type_id`) REFERENCES `manufacturer_types` (`idmanufacturer_types`),
  CONSTRAINT `ch_car_perf` CHECK (((`car_performance` >= 20) and (`car_performance` <= 1200))),
  CONSTRAINT `ch_reg_licence_plate` CHECK (((`licence_plate` is null) or regexp_like(`licence_plate`,_utf8mb4'^[A-Z0-9 -]{2,15}$'))),
  CONSTRAINT `ch_status` CHECK ((`status` in (_utf8mb4'available',_utf8mb4'rented',_utf8mb4'inservice',_utf8mb4'sold',_utf8mb4'suspended'))),
  CONSTRAINT `ck_engine_size` CHECK (((`engine_size` >= 250) and (`engine_size` <= 10000)))
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cars`
--

LOCK TABLES `cars` WRITE;
/*!40000 ALTER TABLE `cars` DISABLE KEYS */;
INSERT INTO `cars` VALUES (18,'1HGCM82633A004361',100,1000,'AAA111','2010-01-01','sold','2026-04-28 09:47:16','2026-04-28 09:48:30',8,3,3,3,6,7),(19,'WVWZZZ1JZXW000001',150,1998,'MAB123','2027-05-31','rented','2026-05-01 11:00:21','2026-05-03 09:21:28',9,4,4,3,6,8),(20,'VVWZZZ1JZXW000001',150,1998,'MAB124','2027-07-03','available','2026-05-01 11:01:02','2026-07-03 13:30:51',12,4,4,3,6,18),(21,'VVTZZZ1JZXW000001',150,1998,'MAB127','2027-07-05','available','2026-07-03 15:31:47','2026-07-03 15:31:47',10,4,4,3,6,17),(23,'TTTZZZ1JZXW000001',150,1998,'MAK124','2027-07-05','available','2026-07-04 09:11:19','2026-07-07 11:38:48',10,4,4,3,6,17),(24,'CCCZZZ1JZXW000001',150,1998,'MAI124','2027-07-05','available','2026-07-07 11:42:20','2026-07-07 11:42:20',10,4,4,3,6,17),(25,'ZZZZZZ1JZXW000001',150,1998,'MKK124','2027-07-05','available','2026-07-07 11:42:38','2026-07-07 11:43:12',10,4,4,3,6,17);
/*!40000 ALTER TABLE `cars` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_insert_cars` BEFORE INSERT ON `cars` FOR EACH ROW BEGIN

	set NEW.created_at = Now();
    set NEW.updated_at = Now();

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_update_cars` BEFORE UPDATE ON `cars` FOR EACH ROW BEGIN
	
	SET NEW.created_at = OLD.created_at;
    SET NEW.updated_at = Now();

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `colors`
--

DROP TABLE IF EXISTS `colors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `colors` (
  `idcolor` int NOT NULL AUTO_INCREMENT,
  `color` varchar(15) NOT NULL,
  PRIMARY KEY (`idcolor`),
  UNIQUE KEY `idcolor_UNIQUE` (`idcolor`),
  UNIQUE KEY `color_UNIQUE` (`color`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colors`
--

LOCK TABLES `colors` WRITE;
/*!40000 ALTER TABLE `colors` DISABLE KEYS */;
INSERT INTO `colors` VALUES (3,'blue'),(4,'red');
/*!40000 ALTER TABLE `colors` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_insert_color` BEFORE INSERT ON `colors` FOR EACH ROW BEGIN

	IF TRIM(NEW.color) = '' then
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Color field cannot be empty';
    end if;
    
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_update_colors` BEFORE UPDATE ON `colors` FOR EACH ROW BEGIN
	SIGNAL SQLSTATE '45000'
	SET MESSAGE_TEXT = 'Update is not allowed in this table';
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `fuels`
--

DROP TABLE IF EXISTS `fuels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fuels` (
  `idfuel` int NOT NULL AUTO_INCREMENT,
  `fuel` varchar(15) NOT NULL,
  PRIMARY KEY (`idfuel`),
  UNIQUE KEY `fuel_UNIQUE` (`fuel`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fuels`
--

LOCK TABLES `fuels` WRITE;
/*!40000 ALTER TABLE `fuels` DISABLE KEYS */;
INSERT INTO `fuels` VALUES (3,'benzin');
/*!40000 ALTER TABLE `fuels` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_insert_fuels` BEFORE INSERT ON `fuels` FOR EACH ROW BEGIN

	IF TRIM(NEW.fuel) = '' then
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Fuel field cannot be empty';
    end if;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_update_fuels` BEFORE UPDATE ON `fuels` FOR EACH ROW BEGIN
	SIGNAL SQLSTATE '45000'
	SET MESSAGE_TEXT = 'Update is not allowed in this table';
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `locality_names`
--

DROP TABLE IF EXISTS `locality_names`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locality_names` (
  `idlocality_name` int NOT NULL AUTO_INCREMENT,
  `locality_name` varchar(45) NOT NULL,
  PRIMARY KEY (`idlocality_name`),
  UNIQUE KEY `locality_name_UNIQUE` (`locality_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locality_names`
--

LOCK TABLES `locality_names` WRITE;
/*!40000 ALTER TABLE `locality_names` DISABLE KEYS */;
INSERT INTO `locality_names` VALUES (1,'Budapest'),(2,'Eger'),(3,'Gacsály');
/*!40000 ALTER TABLE `locality_names` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_insert_locality_names` BEFORE INSERT ON `locality_names` FOR EACH ROW BEGIN

	IF TRIM(NEW.locality_name) = '' then
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Locality name field cannot be empty';
    end if;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_update_locality_names` BEFORE UPDATE ON `locality_names` FOR EACH ROW BEGIN
	SIGNAL SQLSTATE '45000'
	SET MESSAGE_TEXT = 'Update is not allowed in this table';
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locations` (
  `idlocation` int NOT NULL AUTO_INCREMENT,
  `location_name` varchar(30) NOT NULL,
  `phone_number` varchar(12) NOT NULL,
  `addresses_idaddress` int NOT NULL,
  PRIMARY KEY (`idlocation`),
  UNIQUE KEY `idlocation_UNIQUE` (`idlocation`),
  UNIQUE KEY `location_name_UNIQUE` (`location_name`),
  UNIQUE KEY `phone_number_UNIQUE` (`phone_number`),
  KEY `fk_locations_addresses1_idx` (`addresses_idaddress`),
  CONSTRAINT `fk_locations_addresses1` FOREIGN KEY (`addresses_idaddress`) REFERENCES `addresses` (`idaddress`),
  CONSTRAINT `ch_loc_name` CHECK (((length(`location_name`) > 7) and (length(`location_name`) < 31))),
  CONSTRAINT `ch_reg_phone_number` CHECK (regexp_like(`phone_number`,_utf8mb4'^(\\+36[0-9]{8,9}|06[0-9]{8,9})$'))
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (6,'New Final Rent Car Office','06302301392',4),(9,'New Final Rent Car Office1','06302222222',3),(11,'Json Car','06703645122',7);
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_insert_locations` BEFORE INSERT ON `locations` FOR EACH ROW BEGIN

	IF TRIM(NEW.location_name) = '' then
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Location name field cannot be empty';
    end if;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `manufacturer_types`
--

DROP TABLE IF EXISTS `manufacturer_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manufacturer_types` (
  `idmanufacturer_types` int NOT NULL AUTO_INCREMENT,
  `types_idtype` int NOT NULL,
  `manufacturers_idmanufacturer` int NOT NULL,
  PRIMARY KEY (`idmanufacturer_types`),
  UNIQUE KEY `uq_man_id_type_id` (`types_idtype`,`manufacturers_idmanufacturer`),
  KEY `fk_manufacturer_types_types1_idx` (`types_idtype`),
  KEY `fk_manufacturer_types_manufacturers1_idx` (`manufacturers_idmanufacturer`),
  CONSTRAINT `fk_manufacturer_types_manufacturers1` FOREIGN KEY (`manufacturers_idmanufacturer`) REFERENCES `manufacturers` (`idmanufacturer`),
  CONSTRAINT `fk_manufacturer_types_types1` FOREIGN KEY (`types_idtype`) REFERENCES `types` (`idtype`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufacturer_types`
--

LOCK TABLES `manufacturer_types` WRITE;
/*!40000 ALTER TABLE `manufacturer_types` DISABLE KEYS */;
INSERT INTO `manufacturer_types` VALUES (7,3,3),(8,4,4),(16,4,5),(17,5,6),(18,6,3),(19,7,5),(21,8,6),(20,8,7);
/*!40000 ALTER TABLE `manufacturer_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manufacturers`
--

DROP TABLE IF EXISTS `manufacturers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manufacturers` (
  `idmanufacturer` int NOT NULL AUTO_INCREMENT,
  `manufacturer` varchar(20) NOT NULL,
  PRIMARY KEY (`idmanufacturer`),
  UNIQUE KEY `idmanufacturer_UNIQUE` (`idmanufacturer`),
  UNIQUE KEY `manufacturer_UNIQUE` (`manufacturer`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufacturers`
--

LOCK TABLES `manufacturers` WRITE;
/*!40000 ALTER TABLE `manufacturers` DISABLE KEYS */;
INSERT INTO `manufacturers` VALUES (4,'BMW'),(6,'Ford'),(3,'Mazda'),(7,'Mercedes'),(5,'Toyota');
/*!40000 ALTER TABLE `manufacturers` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_insert_manufacturers` BEFORE INSERT ON `manufacturers` FOR EACH ROW BEGIN

	IF TRIM(NEW.manufacturer) = '' then
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Manufacturers name field cannot be empty';
    end if;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_update_manufacturers` BEFORE UPDATE ON `manufacturers` FOR EACH ROW BEGIN
	SIGNAL SQLSTATE '45000'
	SET MESSAGE_TEXT = 'Update is not allowed in this table';
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `production_time`
--

DROP TABLE IF EXISTS `production_time`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `production_time` (
  `idproduction_time` int NOT NULL AUTO_INCREMENT,
  `production_time` date NOT NULL,
  PRIMARY KEY (`idproduction_time`),
  UNIQUE KEY `idproduction_time_UNIQUE` (`idproduction_time`),
  UNIQUE KEY `production_time_UNIQUE` (`production_time`),
  CONSTRAINT `ck_production_time` CHECK ((`production_time` > _utf8mb4'1949-12-31'))
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `production_time`
--

LOCK TABLES `production_time` WRITE;
/*!40000 ALTER TABLE `production_time` DISABLE KEYS */;
INSERT INTO `production_time` VALUES (12,'1970-01-31'),(11,'1970-02-01'),(10,'1970-02-02'),(9,'1990-02-02'),(8,'1998-01-01');
/*!40000 ALTER TABLE `production_time` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_update_production_time` BEFORE UPDATE ON `production_time` FOR EACH ROW BEGIN
	SIGNAL SQLSTATE '45000'
	SET MESSAGE_TEXT = 'Update is not allowed in this table';
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `street_types`
--

DROP TABLE IF EXISTS `street_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `street_types` (
  `idstreet_type` int NOT NULL AUTO_INCREMENT,
  `street_type` varchar(45) NOT NULL,
  PRIMARY KEY (`idstreet_type`),
  UNIQUE KEY `street_type_UNIQUE` (`street_type`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `street_types`
--

LOCK TABLES `street_types` WRITE;
/*!40000 ALTER TABLE `street_types` DISABLE KEYS */;
INSERT INTO `street_types` VALUES (2,'Köz'),(3,'tér'),(1,'utca');
/*!40000 ALTER TABLE `street_types` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_insert_street_types` BEFORE INSERT ON `street_types` FOR EACH ROW BEGIN

	IF TRIM(NEW.street_type) = '' then
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Street type field cannot be empty';
    end if;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_update_street_types` BEFORE UPDATE ON `street_types` FOR EACH ROW BEGIN
	SIGNAL SQLSTATE '45000'
	SET MESSAGE_TEXT = 'Update is not allowed in this table';
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `idtransaction` int NOT NULL AUTO_INCREMENT,
  `transaction_name` varchar(30) NOT NULL,
  `created_at` timestamp NOT NULL,
  `users_iduser` int NOT NULL,
  `cars_idcar` int NOT NULL,
  PRIMARY KEY (`idtransaction`),
  KEY `fk_transactions_cars1_idx` (`cars_idcar`),
  KEY `fk_transactions_users1_idx` (`users_iduser`),
  CONSTRAINT `fk_transactions_cars1` FOREIGN KEY (`cars_idcar`) REFERENCES `cars` (`idcar`),
  CONSTRAINT `fk_transactions_users1` FOREIGN KEY (`users_iduser`) REFERENCES `users` (`iduser`),
  CONSTRAINT `ck_transactions_name` CHECK ((`transaction_name` in (_utf8mb4'rent',_utf8mb4'rented-back',_utf8mb4'sold',_utf8mb4'buyback',_utf8mb4'inservice',_utf8mb4'service-back',_utf8mb4'suspended',_utf8mb4'activated')))
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_insert_transaction` BEFORE INSERT ON `transactions` FOR EACH ROW BEGIN
DECLARE v_licence_plate char(7);
DECLARE v_status varchar(20);
DECLARE v_technical_validity date;
DECLARE v_last_transaction_name varchar(30);

SELECT licence_plate, status, technical_validity into v_licence_plate, v_status, v_technical_validity
FROM cars 
WHERE idcar = NEW.cars_idcar; 

	SELECT transaction_name into v_last_transaction_name from transactions where cars_idcar = NEW.cars_idcar ORDER BY idtransaction DESC LIMIT 1; 

	IF NEW.transaction_name = v_last_transaction_name AND v_last_transaction_name IS NOT NULL THEN 
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Transaction already exists, this transaction is not allowed';
	END IF;
    IF v_status = 'available' AND NEW.transaction_name = 'rent' THEN 
		IF v_technical_validity < CURDATE() THEN
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Technical validity is expired';
		END IF;
		IF v_licence_plate is null THEN
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Without licence plate car cannot rented';
		END IF;
	ELSEIF v_status = 'rent' AND NEW.transaction_name <> 'rented-back' THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Allowed transaction by rented car is rented-back';
    ELSEIF v_status = 'inservice' AND NEW.transaction_name <> 'service-back' THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Allowed transaction by inservice car is service-back';
    ELSEIF v_status = 'sold' AND NEW.transaction_name <> 'buyback' THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Allowed transaction by sold car is buyback';
    ELSEIF v_status = 'suspended' AND NEW.transaction_name <> 'activated' THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Allowed transaction by sold car is buyback';
    END IF;
    SET NEW.created_at = NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_insert_transaction` AFTER INSERT ON `transactions` FOR EACH ROW BEGIN
	IF NEW.transaction_name = 'rent' THEN 
		UPDATE cars set status = 'rented' WHERE idcar = NEW.cars_idcar;
	ELSEIF NEW.transaction_name = 'sold' THEN
		UPDATE cars set status = 'sold' WHERE idcar = NEW.cars_idcar;
	ELSEIF NEW.transaction_name = 'inservice' THEN
		UPDATE cars set status = 'inservice' WHERE idcar = NEW.cars_idcar;
	ELSEIF NEW.transaction_name = 'suspended' THEN
		UPDATE cars set status = 'suspended' WHERE idcar = NEW.cars_idcar;
	ELSEIF NEW.transaction_name = 'borrow-back' THEN
		UPDATE cars set status = 'available' WHERE idcar = NEW.cars_idcar;
	ELSEIF NEW.transaction_name = 'buyback' THEN
		UPDATE cars set status = 'available' WHERE idcar = NEW.cars_idcar;
	ELSEIF NEW.transaction_name = 'service-back' THEN
		UPDATE cars set status = 'available' WHERE idcar = NEW.cars_idcar;
	ELSEIF NEW.transaction_name = 'activated' THEN
		UPDATE cars set status = 'available' WHERE idcar = NEW.cars_idcar;
	END IF;
    
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_update_transaction` BEFORE UPDATE ON `transactions` FOR EACH ROW BEGIN
	SIGNAL SQLSTATE '45000'
	SET MESSAGE_TEXT = 'Update is not allowed in transaction table';
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `types`
--

DROP TABLE IF EXISTS `types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `types` (
  `idtype` int NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL,
  PRIMARY KEY (`idtype`),
  UNIQUE KEY `idtype_UNIQUE` (`idtype`),
  UNIQUE KEY `type_UNIQUE` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `types`
--

LOCK TABLES `types` WRITE;
/*!40000 ALTER TABLE `types` DISABLE KEYS */;
INSERT INTO `types` VALUES (8,'Benz'),(7,'Corolla'),(5,'Focus'),(3,'Mx'),(6,'Mx3'),(4,'X5');
/*!40000 ALTER TABLE `types` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_insert_types` BEFORE INSERT ON `types` FOR EACH ROW BEGIN

	IF TRIM(NEW.type) = '' then
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Type field cannot be empty';
    end if;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_update_types` BEFORE UPDATE ON `types` FOR EACH ROW BEGIN
	SIGNAL SQLSTATE '45000'
	SET MESSAGE_TEXT = 'Update is not allowed in this table';
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `iduser` int NOT NULL AUTO_INCREMENT,
  `given_name` varchar(50) NOT NULL,
  `family_name` varchar(50) NOT NULL,
  `pin_number` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `user_role` varchar(45) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `fired_at` timestamp NULL DEFAULT NULL,
  `is_employed` varchar(3) DEFAULT NULL,
  `addresses_idaddress` int NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  PRIMARY KEY (`iduser`),
  UNIQUE KEY `pin_number_UNIQUE` (`pin_number`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `fk_users_addresses_idx` (`addresses_idaddress`),
  CONSTRAINT `fk_users_addresses` FOREIGN KEY (`addresses_idaddress`) REFERENCES `addresses` (`idaddress`),
  CONSTRAINT `chk_pin_number_length` CHECK ((length(`pin_number`) = 8)),
  CONSTRAINT `ck_customer_role` CHECK (((`user_role` <> _utf8mb4'customer') or ((`email` is null) and (`password` is null) and (`fired_at` is null) and (`is_employed` is null)))),
  CONSTRAINT `ck_email_format` CHECK (regexp_like(`email`,_utf8mb4'^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$')),
  CONSTRAINT `ck_is_employed` CHECK (((`is_employed` in (_utf8mb4'yes',_utf8mb4'no')) or (`is_employed` is null))),
  CONSTRAINT `ck_password_emp_str` CHECK ((trim(`password`) <> _utf8mb4'')),
  CONSTRAINT `ck_phone_number` CHECK (regexp_like(`phone_number`,_utf8mb4'^\\+?[0-9]+$')),
  CONSTRAINT `ck_phone_number_length` CHECK ((length(`phone_number`) between 10 and 16)),
  CONSTRAINT `ck_pin_number_format` CHECK (regexp_like(`pin_number`,_utf8mb4'^[A-Z]{2}[0-9]{6}$')),
  CONSTRAINT `ck_user_role` CHECK ((`user_role` in (_utf8mb4'admin',_utf8mb4'manager',_utf8mb4'employee',_utf8mb4'customer')))
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (22,'Tamáska','Lecza','BA123456','admin','teszt@teszt.com','$2b$13$JqvmoSFUr4CNg4Bm9MOIRODG0AZtN/9e0ooJ60.CW23FkH9.WKmT2','2026-06-22 15:41:13','2026-07-01 09:46:09',NULL,'yes',9,'+36301234567'),(23,'React3','Frontend','BB111111','admin','van@van.hu','$2b$13$iHXZpEtgb4qaxV7Bue1vf.6kj5kdqq7Mf/0Rj3jVPUlmkLPCDRg22','2026-06-26 08:18:31','2026-06-26 12:54:03',NULL,'yes',12,'+36301234567'),(24,'React','Leveskeke','BB111112','admin','lskjflk@flskdf.hu','$2b$13$6gwCre417UOuO0Lz6uyyFOLwdD2tW1VfV4yLFfyDWN5ooUy1PKQ/C','2026-06-26 11:12:25','2026-06-27 08:18:08','2026-06-27 08:18:08','no',11,'06302222222'),(25,'Teszt','User','CC123456','customer',NULL,NULL,'2026-06-28 09:39:46','2026-07-01 09:33:04',NULL,NULL,1,'06303445522'),(26,'Kovács','János','CC345678','customer',NULL,NULL,'2026-07-01 08:58:24','2026-07-01 09:44:30',NULL,NULL,14,'+36301234567'),(27,'React','Frontend','BB111113','customer',NULL,NULL,'2026-07-01 09:27:27','2026-07-01 09:27:27',NULL,NULL,13,'06302222222'),(28,'Babb','Leveskeke','BB111114','customer',NULL,NULL,'2026-07-01 09:30:13','2026-07-01 09:30:13',NULL,NULL,15,'06302222222'),(29,'Kovács','János','CD345678','customer',NULL,NULL,'2026-07-01 09:31:22','2026-07-01 09:31:22',NULL,NULL,14,'+36301234567'),(30,'Gyuláné','Frontend','BB111118','customer',NULL,NULL,'2026-07-01 09:45:15','2026-07-01 09:45:15',NULL,NULL,16,'06302222222');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_insert_users` BEFORE INSERT ON `users` FOR EACH ROW BEGIN
	-- Ellenőrizzük az is_employed mezőt
    IF NEW.user_role <> 'customer' AND (NEW.is_employed IS NULL OR NEW.is_employed = 'no')THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "is_employed field must have 'yes'value"; 
    END IF;
    IF NEW.user_role <> 'customer' AND NEW.email IS NULL THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "e-mail field must have a value for non-customer users"; 
    END IF;
    IF NEW.user_role <> 'customer' AND (NEW.password IS NULL OR LENGTH(NEW.password) < 1) THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "password field must have a value for non-customer users"; 
    END IF;
	IF NEW.created_at IS NOT NULL OR NEW.updated_at IS NOT NULL OR NEW.fired_at IS NOT NULL THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Created_at and updated_at and fired_at fields may not contains any data';
    end if;
	SET NEW.created_at = now();
    SET NEW.updated_at = now();
    
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_update_users` BEFORE UPDATE ON `users` FOR EACH ROW BEGIN
	IF OLD.user_role <> 'customer' AND NEW.user_role = 'customer' THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "from employee or manager or admin cannot be customer";
    END IF;
    IF NOT (OLD.created_at <=> NEW.created_at) THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'created at field set by database';
    END IF;
	IF NEW.user_role <> 'customer' THEN
		IF NEW.is_employed IS NULL THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "is_employed field must have 'yes' or 'no' value"; 
		END IF; 
		-- in case of employee update
		IF OLD.is_employed = NEW.is_employed THEN
			-- in case of if somebody is active
			IF NEW.is_employed = 'yes' THEN 
				IF NEW.email IS NULL or new.password IS NULL THEN 
					SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "E-mail and Password fields doesn't meet the requierments."; 
				END IF;
            END IF;
            -- in case of if somebody is inactive
			IF NEW.is_employed = 'no' THEN 
				IF NEW.email IS NOT NULL or new.password IS NOT NULL THEN 
					SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "E-mail and Password fields must be null when somebody inactiv"; 
				END IF;
            END IF;
		END IF;
        IF OLD.is_employed <> NEW.is_employed THEN
			IF OLD.email <> NEW.email OR OLD.password <> NEW.password THEN 
				SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "E-mail and Password fields cannot be changed"; 
            END IF;
			-- deactivation
			IF NEW.is_employed = 'no' THEN 
				SET NEW.fired_at = NOW();
            END IF; 
            -- reactivaton
            IF NEW.is_employed = 'yes' THEN 
				SET NEW.fired_at = null;
            END IF;
        END IF;
	END IF;
    SET NEW.updated_at = Now();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `vw_cars`
--

DROP TABLE IF EXISTS `vw_cars`;
/*!50001 DROP VIEW IF EXISTS `vw_cars`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_cars` AS SELECT 
 1 AS `idcar`,
 1 AS `manufacturer`,
 1 AS `type`,
 1 AS `vin_number`,
 1 AS `car_performance`,
 1 AS `engine_size`,
 1 AS `licence_plate`,
 1 AS `technical_validity`,
 1 AS `status`,
 1 AS `production_time`,
 1 AS `color`,
 1 AS `bodytype`,
 1 AS `fuel`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_customer`
--

DROP TABLE IF EXISTS `vw_customer`;
/*!50001 DROP VIEW IF EXISTS `vw_customer`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_customer` AS SELECT 
 1 AS `iduser`,
 1 AS `given_name`,
 1 AS `family_name`,
 1 AS `pin_number`,
 1 AS `phone_number`,
 1 AS `postal_code`,
 1 AS `street_name`,
 1 AS `house_number`,
 1 AS `locality_name`,
 1 AS `street_type`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_employee`
--

DROP TABLE IF EXISTS `vw_employee`;
/*!50001 DROP VIEW IF EXISTS `vw_employee`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_employee` AS SELECT 
 1 AS `iduser`,
 1 AS `given_name`,
 1 AS `family_name`,
 1 AS `pin_number`,
 1 AS `user_role`,
 1 AS `email`,
 1 AS `is_employed`,
 1 AS `phone_number`,
 1 AS `postal_code`,
 1 AS `street_name`,
 1 AS `house_number`,
 1 AS `locality_name`,
 1 AS `street_type`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_location`
--

DROP TABLE IF EXISTS `vw_location`;
/*!50001 DROP VIEW IF EXISTS `vw_location`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_location` AS SELECT 
 1 AS `idlocation`,
 1 AS `location_name`,
 1 AS `phone_number`,
 1 AS `postal_code`,
 1 AS `locality_name`,
 1 AS `street_name`,
 1 AS `street_type`,
 1 AS `house_number`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_model`
--

DROP TABLE IF EXISTS `vw_model`;
/*!50001 DROP VIEW IF EXISTS `vw_model`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_model` AS SELECT 
 1 AS `manufacturer`,
 1 AS `type`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_transactions`
--

DROP TABLE IF EXISTS `vw_transactions`;
/*!50001 DROP VIEW IF EXISTS `vw_transactions`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_transactions` AS SELECT 
 1 AS `idtransaction`,
 1 AS `transaction_name`,
 1 AS `created_at`,
 1 AS `users_iduser`,
 1 AS `cars_idcar`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_user`
--

DROP TABLE IF EXISTS `vw_user`;
/*!50001 DROP VIEW IF EXISTS `vw_user`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_user` AS SELECT 
 1 AS `iduser`,
 1 AS `given_name`,
 1 AS `family_name`,
 1 AS `pin_number`,
 1 AS `user_role`,
 1 AS `email`,
 1 AS `postal_code`,
 1 AS `locality_name`,
 1 AS `street_name`,
 1 AS `street_type`,
 1 AS `house_number`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vw_cars`
--

/*!50001 DROP VIEW IF EXISTS `vw_cars`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_cars` AS select `cars`.`idcar` AS `idcar`,`manufacturers`.`manufacturer` AS `manufacturer`,`types`.`type` AS `type`,`cars`.`vin_number` AS `vin_number`,`cars`.`car_performance` AS `car_performance`,`cars`.`engine_size` AS `engine_size`,`cars`.`licence_plate` AS `licence_plate`,`cars`.`technical_validity` AS `technical_validity`,`cars`.`status` AS `status`,`production_time`.`production_time` AS `production_time`,`colors`.`color` AS `color`,`bodytypes`.`bodytype` AS `bodytype`,`fuels`.`fuel` AS `fuel` from (((((((`cars` join `colors` on((`cars`.`colors_idcolor` = `colors`.`idcolor`))) join `production_time` on((`cars`.`production_time_idproduction_time` = `production_time`.`idproduction_time`))) join `bodytypes` on((`cars`.`bodytypes_idbodytype` = `bodytypes`.`idbodytype`))) join `fuels` on((`cars`.`fuels_idfuel` = `fuels`.`idfuel`))) join `manufacturer_types` on((`cars`.`manufacturer_type_id` = `manufacturer_types`.`idmanufacturer_types`))) join `manufacturers` on((`manufacturer_types`.`manufacturers_idmanufacturer` = `manufacturers`.`idmanufacturer`))) join `types` on((`manufacturer_types`.`types_idtype` = `types`.`idtype`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_customer`
--

/*!50001 DROP VIEW IF EXISTS `vw_customer`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_customer` AS select `users`.`iduser` AS `iduser`,`users`.`given_name` AS `given_name`,`users`.`family_name` AS `family_name`,`users`.`pin_number` AS `pin_number`,`users`.`phone_number` AS `phone_number`,`addresses`.`postal_code` AS `postal_code`,`addresses`.`street_name` AS `street_name`,`addresses`.`house_number` AS `house_number`,`locality_names`.`locality_name` AS `locality_name`,`street_types`.`street_type` AS `street_type` from (((`users` join `addresses` on((`users`.`addresses_idaddress` = `addresses`.`idaddress`))) join `locality_names` on((`addresses`.`locality_names_idlocality_name` = `locality_names`.`idlocality_name`))) join `street_types` on((`addresses`.`street_types_idstreet_type` = `street_types`.`idstreet_type`))) where (`users`.`user_role` = 'customer') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_employee`
--

/*!50001 DROP VIEW IF EXISTS `vw_employee`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_employee` AS select `users`.`iduser` AS `iduser`,`users`.`given_name` AS `given_name`,`users`.`family_name` AS `family_name`,`users`.`pin_number` AS `pin_number`,`users`.`user_role` AS `user_role`,`users`.`email` AS `email`,`users`.`is_employed` AS `is_employed`,`users`.`phone_number` AS `phone_number`,`addresses`.`postal_code` AS `postal_code`,`addresses`.`street_name` AS `street_name`,`addresses`.`house_number` AS `house_number`,`locality_names`.`locality_name` AS `locality_name`,`street_types`.`street_type` AS `street_type` from (((`users` join `addresses` on((`users`.`addresses_idaddress` = `addresses`.`idaddress`))) join `locality_names` on((`addresses`.`locality_names_idlocality_name` = `locality_names`.`idlocality_name`))) join `street_types` on((`street_types`.`idstreet_type` = `addresses`.`street_types_idstreet_type`))) where (`users`.`user_role` <> 'customer') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_location`
--

/*!50001 DROP VIEW IF EXISTS `vw_location`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_location` AS select `locations`.`idlocation` AS `idlocation`,`locations`.`location_name` AS `location_name`,`locations`.`phone_number` AS `phone_number`,`addresses`.`postal_code` AS `postal_code`,`locality_names`.`locality_name` AS `locality_name`,`addresses`.`street_name` AS `street_name`,`street_types`.`street_type` AS `street_type`,`addresses`.`house_number` AS `house_number` from (((`locations` join `addresses` on((`locations`.`addresses_idaddress` = `addresses`.`idaddress`))) join `locality_names` on((`addresses`.`locality_names_idlocality_name` = `locality_names`.`idlocality_name`))) join `street_types` on((`addresses`.`street_types_idstreet_type` = `street_types`.`idstreet_type`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_model`
--

/*!50001 DROP VIEW IF EXISTS `vw_model`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_model` AS select `manufacturers`.`manufacturer` AS `manufacturer`,`types`.`type` AS `type` from ((`manufacturer_types` join `manufacturers` on((`manufacturer_types`.`idmanufacturer_types` = `manufacturer_types`.`idmanufacturer_types`))) join `types` on((`manufacturer_types`.`types_idtype` = `manufacturer_types`.`types_idtype`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_transactions`
--

/*!50001 DROP VIEW IF EXISTS `vw_transactions`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_transactions` AS select `transactions`.`idtransaction` AS `idtransaction`,`transactions`.`transaction_name` AS `transaction_name`,`transactions`.`created_at` AS `created_at`,`transactions`.`users_iduser` AS `users_iduser`,`transactions`.`cars_idcar` AS `cars_idcar` from `transactions` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_user`
--

/*!50001 DROP VIEW IF EXISTS `vw_user`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_user` AS select `users`.`iduser` AS `iduser`,`users`.`given_name` AS `given_name`,`users`.`family_name` AS `family_name`,`users`.`pin_number` AS `pin_number`,`users`.`user_role` AS `user_role`,`users`.`email` AS `email`,`addresses`.`postal_code` AS `postal_code`,`locality_names`.`locality_name` AS `locality_name`,`addresses`.`street_name` AS `street_name`,`street_types`.`street_type` AS `street_type`,`addresses`.`house_number` AS `house_number` from (((`users` join `addresses` on((`users`.`addresses_idaddress` = `addresses`.`idaddress`))) join `locality_names` on((`addresses`.`locality_names_idlocality_name` = `locality_names`.`idlocality_name`))) join `street_types` on((`addresses`.`street_types_idstreet_type` = `street_types`.`idstreet_type`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-07-07 14:00:16
