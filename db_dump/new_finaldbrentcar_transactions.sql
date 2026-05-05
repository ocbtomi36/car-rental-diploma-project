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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES (1,'sold','2026-04-28 09:48:30',1,18);
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-30 10:39:11
