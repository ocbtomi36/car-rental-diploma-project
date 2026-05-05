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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses` VALUES (7,'1048','Json','34',1,1),(1,'1048','Nádasdy','32',1,1),(6,'3300','Dobó István','11',2,1),(3,'3321','Fő','1',1,1),(4,'3321','Fő','1',3,2);
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
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
