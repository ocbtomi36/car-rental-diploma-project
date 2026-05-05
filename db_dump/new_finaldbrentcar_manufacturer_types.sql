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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufacturer_types`
--

LOCK TABLES `manufacturer_types` WRITE;
/*!40000 ALTER TABLE `manufacturer_types` DISABLE KEYS */;
INSERT INTO `manufacturer_types` VALUES (7,3,3);
/*!40000 ALTER TABLE `manufacturer_types` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-30 10:39:11
