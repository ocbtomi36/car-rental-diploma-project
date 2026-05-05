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
  CONSTRAINT `ch_reg_licence_plate` CHECK ((regexp_like(`licence_plate`,_utf8mb4'^([A-Z]{3}[0-9]{3}|[A-Z]{2}[A-Z]{2}[0-9]{3})$') or (`licence_plate` is null))),
  CONSTRAINT `ch_status` CHECK ((`status` in (_utf8mb4'available',_utf8mb4'rented',_utf8mb4'inservice',_utf8mb4'sold',_utf8mb4'suspended'))),
  CONSTRAINT `ck_engine_size` CHECK (((`engine_size` >= 250) and (`engine_size` <= 10000)))
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cars`
--

LOCK TABLES `cars` WRITE;
/*!40000 ALTER TABLE `cars` DISABLE KEYS */;
INSERT INTO `cars` VALUES (18,'1HGCM82633A004361',100,1000,'AAA111','2010-01-01','sold','2026-04-28 09:47:16','2026-04-28 09:48:30',8,3,3,3,6,7);
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-30 10:39:12
