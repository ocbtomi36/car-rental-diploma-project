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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'From json Insert','Signup','PP111121','admin','bal@bal.hu','sélfkjsdaflksadjfélsak','2026-03-21 20:41:22','2026-04-16 20:34:36',NULL,'yes',1,'06303645122'),(3,'Nagy','Béla','BC123456','admin','tamas.lecza@example.com','$2b$13$c9LUt4O/a.vQoS8yJe8RaO4.WGq2ANa/iGye0nxXmomcs7Hgr9hba','2026-03-24 09:25:38','2026-03-24 09:25:38',NULL,'yes',6,'0612301392'),(4,'From json','Signup','PP111112','customer',NULL,NULL,'2026-03-24 10:05:03','2026-04-16 13:11:29',NULL,NULL,1,'06303645122'),(6,'d','Béla','BD123457','manager','customer@example.com','$2b$13$VnOMSQ5eJHAPExqFdScCQO1f1uCn.wXp4oIL24/nxmuyG6T/05ZMO','2026-03-24 12:37:22','2026-03-24 12:37:22',NULL,'yes',6,'0612301394'),(7,'Updated Beszur','Customer','BD123410','customer',NULL,NULL,'2026-03-29 09:17:59','2026-04-01 16:12:47',NULL,NULL,6,'0612301394'),(8,'Trigger ','Update','BA222222','employee','triger@trigger.com','nincs','2026-04-07 22:04:40','2026-04-07 22:37:16',NULL,'yes',1,'06303655122'),(9,'Insert ','Before Trigger','AA111111','customer',NULL,NULL,'2026-04-07 22:17:00','2026-04-07 22:17:00',NULL,NULL,1,'36301111111'),(10,'Insert triger','teszt','SS111111','employee','tesztinsertbeforetr@teszt.hu','yella','2026-04-07 22:39:43','2026-04-07 22:39:43',NULL,'yes',1,'11111111111111'),(11,'asdfasdfasd','asdfsadfasd','BB222222','customer',NULL,NULL,'2026-04-08 11:47:23','2026-04-08 11:47:23',NULL,NULL,1,'2301321111111'),(14,'From json','Signup','PP111111','manager','insert@valami.com','$2b$13$hkuwTo4R7r4kCfh1KqyfuOblOa/WxVxguJgBkcxj1FsEjii3Er56a','2026-04-09 09:51:30','2026-04-16 11:46:50',NULL,'yes',1,'06303645122'),(17,'From json Insert','Signup','PP111114','customer',NULL,NULL,'2026-04-16 13:21:42','2026-04-16 13:21:42',NULL,NULL,1,'06303645122'),(18,'From json Insert','Signup','PP111115','customer',NULL,NULL,'2026-04-16 13:35:06','2026-04-16 13:35:06',NULL,NULL,1,'06303645122'),(19,'From json Insert','Signup','PP111120','admin','vali@vali.com','$2b$13$IvMMXepjbkTuOpg1N9W35ubNFye2PB2Cl4xCsHbLF/ui7VAUFpjGm','2026-04-16 13:37:12','2026-04-16 13:37:12',NULL,'yes',1,'06303645122'),(20,'Login','Béla','PP111141','admin','login@login.hu','$2b$13$qjoEKCSYDG6GMhIq.p7IIeKDZRlNbfWxNnMHYYkM2OuWyMhiJP/P6','2026-04-16 20:09:02','2026-04-16 20:12:12',NULL,'yes',1,'06303645122');
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-30 10:39:13
