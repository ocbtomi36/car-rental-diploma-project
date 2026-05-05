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
 1 AS `postal_code`,
 1 AS `locality_name`,
 1 AS `street_name`,
 1 AS `street_type`,
 1 AS `house_number`*/;
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
 1 AS `user_role`,
 1 AS `postal_code`,
 1 AS `locality_name`,
 1 AS `street_name`,
 1 AS `street_type`,
 1 AS `house_number`*/;
SET character_set_client = @saved_cs_client;

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
/*!50001 VIEW `vw_employee` AS select `users`.`iduser` AS `iduser`,`users`.`given_name` AS `given_name`,`users`.`family_name` AS `family_name`,`users`.`pin_number` AS `pin_number`,`users`.`user_role` AS `user_role`,`users`.`email` AS `email`,`users`.`is_employed` AS `is_employed`,`addresses`.`postal_code` AS `postal_code`,`locality_names`.`locality_name` AS `locality_name`,`addresses`.`street_name` AS `street_name`,`street_types`.`street_type` AS `street_type`,`addresses`.`house_number` AS `house_number` from (((`users` join `addresses` on((`users`.`addresses_idaddress` = `addresses`.`idaddress`))) join `locality_names` on((`addresses`.`locality_names_idlocality_name` = `locality_names`.`idlocality_name`))) join `street_types` on((`addresses`.`street_types_idstreet_type` = `street_types`.`idstreet_type`))) where (`users`.`user_role` <> 'customer') */;
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
/*!50001 VIEW `vw_customer` AS select `users`.`iduser` AS `iduser`,`users`.`given_name` AS `given_name`,`users`.`family_name` AS `family_name`,`users`.`pin_number` AS `pin_number`,`users`.`user_role` AS `user_role`,`addresses`.`postal_code` AS `postal_code`,`locality_names`.`locality_name` AS `locality_name`,`addresses`.`street_name` AS `street_name`,`street_types`.`street_type` AS `street_type`,`addresses`.`house_number` AS `house_number` from (((`users` join `addresses` on((`users`.`addresses_idaddress` = `addresses`.`idaddress`))) join `locality_names` on((`addresses`.`locality_names_idlocality_name` = `locality_names`.`idlocality_name`))) join `street_types` on((`addresses`.`street_types_idstreet_type` = `street_types`.`idstreet_type`))) where (`users`.`user_role` = 'customer') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Dumping events for database 'new_finaldbrentcar'
--

--
-- Dumping routines for database 'new_finaldbrentcar'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-30 10:39:13
