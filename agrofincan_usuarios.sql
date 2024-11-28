-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: agrofincan
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `usuario_id` int NOT NULL AUTO_INCREMENT,
  `nombre_usuario` varchar(50) NOT NULL,
  `contrasena` varchar(255) NOT NULL,
  `rol_id` int DEFAULT NULL,
  `estado` varchar(20) DEFAULT 'activo',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`usuario_id`),
  UNIQUE KEY `nombre_usuario` (`nombre_usuario`),
  KEY `rol_id` (`rol_id`),
  CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`rol_id`) REFERENCES `roles` (`rol_id`)
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (101,'usuario1','hashed_password_1',1,'activo','2024-11-28 04:31:19','2024-11-28 04:31:19'),(102,'usuario2','hashed_password_2',1,'activo','2024-11-28 04:31:19','2024-11-28 04:31:19'),(103,'usuario3','hashed_password_3',2,'activo','2024-11-28 04:31:19','2024-11-28 04:31:19'),(104,'usuario4','hashed_password_4',2,'activo','2024-11-28 04:31:19','2024-11-28 04:31:19'),(105,'usuario5','hashed_password_5',3,'activo','2024-11-28 04:31:19','2024-11-28 04:31:19'),(106,'usuario6','hashed_password_6',3,'activo','2024-11-28 04:31:19','2024-11-28 04:31:19'),(107,'usuario7','hashed_password_7',1,'activo','2024-11-28 04:31:19','2024-11-28 04:31:19'),(108,'usuario8','hashed_password_8',1,'activo','2024-11-28 04:31:19','2024-11-28 04:31:19'),(109,'usuario9','hashed_password_9',2,'activo','2024-11-28 04:31:19','2024-11-28 04:31:19'),(110,'usuario10','hashed_password_10',2,'activo','2024-11-28 04:31:19','2024-11-28 04:31:19'),(111,'usuario11','hashed_password_11',3,'activo','2024-11-28 04:31:19','2024-11-28 04:31:19'),(112,'usuario12','hashed_password_12',3,'activo','2024-11-28 04:31:19','2024-11-28 04:31:19'),(113,'usuario13','hashed_password_13',1,'activo','2024-11-28 04:31:19','2024-11-28 04:31:19'),(114,'usuario14','hashed_password_14',1,'activo','2024-11-28 04:31:19','2024-11-28 04:31:19'),(115,'usuario15','hashed_password_15',2,'activo','2024-11-28 04:31:19','2024-11-28 04:31:19'),(116,'usuario16','hashed_password_16',2,'activo','2024-11-28 04:31:19','2024-11-28 04:31:19'),(117,'usuario17','hashed_password_17',3,'activo','2024-11-28 04:31:19','2024-11-28 04:31:19'),(118,'usuario18','hashed_password_18',3,'activo','2024-11-28 04:31:19','2024-11-28 04:31:19'),(119,'usuario19','hashed_password_19',1,'activo','2024-11-28 04:31:19','2024-11-28 04:31:19'),(120,'usuario20','hashed_password_20',1,'activo','2024-11-28 04:31:19','2024-11-28 04:31:19'),(121,'usuario21','hashed_password_21',2,'activo','2024-11-28 04:31:19','2024-11-28 04:31:19'),(122,'usuario22','hashed_password_22',2,'activo','2024-11-28 04:31:19','2024-11-28 04:31:19'),(123,'usuario23','hashed_password_23',3,'activo','2024-11-28 04:31:19','2024-11-28 04:31:19'),(124,'usuario24','hashed_password_24',3,'activo','2024-11-28 04:31:19','2024-11-28 04:31:19'),(125,'usuario25','hashed_password_25',1,'activo','2024-11-28 04:31:19','2024-11-28 04:31:19'),(126,'usuario26','hashed_password_26',1,'activo','2024-11-28 04:31:19','2024-11-28 04:31:19'),(127,'usuario27','hashed_password_27',2,'activo','2024-11-28 04:31:19','2024-11-28 04:31:19'),(128,'usuario28','hashed_password_28',2,'activo','2024-11-28 04:31:19','2024-11-28 04:31:19'),(129,'usuario29','hashed_password_29',3,'activo','2024-11-28 04:31:19','2024-11-28 04:31:19'),(130,'usuario30','hashed_password_30',3,'activo','2024-11-28 04:31:19','2024-11-28 04:31:19'),(131,'usuario31','hashed_password_31',1,'activo','2024-11-28 04:31:19','2024-11-28 04:31:19'),(132,'usuario32','hashed_password_32',1,'activo','2024-11-28 04:31:19','2024-11-28 04:31:19'),(133,'usuario33','hashed_password_33',2,'activo','2024-11-28 04:31:19','2024-11-28 04:31:19'),(134,'usuario34','hashed_password_34',2,'activo','2024-11-28 04:31:19','2024-11-28 04:31:19'),(135,'usuario35','hashed_password_35',3,'activo','2024-11-28 04:31:19','2024-11-28 04:31:19'),(136,'usuario36','hashed_password_36',3,'activo','2024-11-28 04:31:19','2024-11-28 04:31:19'),(137,'usuario37','hashed_password_37',1,'activo','2024-11-28 04:31:19','2024-11-28 04:31:19'),(138,'usuario38','hashed_password_38',1,'activo','2024-11-28 04:31:19','2024-11-28 04:31:19'),(139,'usuario39','hashed_password_39',2,'activo','2024-11-28 04:31:19','2024-11-28 04:31:19'),(140,'usuario40','hashed_password_40',2,'activo','2024-11-28 04:31:19','2024-11-28 04:31:19'),(141,'usuario41','hashed_password_41',3,'activo','2024-11-28 04:31:19','2024-11-28 04:31:19'),(142,'usuario42','hashed_password_42',3,'activo','2024-11-28 04:31:19','2024-11-28 04:31:19'),(143,'usuario43','hashed_password_43',1,'activo','2024-11-28 04:31:19','2024-11-28 04:31:19'),(144,'usuario44','hashed_password_44',1,'activo','2024-11-28 04:31:19','2024-11-28 04:31:19'),(145,'usuario45','hashed_password_45',2,'activo','2024-11-28 04:31:19','2024-11-28 04:31:19'),(146,'usuario46','hashed_password_46',2,'activo','2024-11-28 04:31:19','2024-11-28 04:31:19'),(147,'usuario47','hashed_password_47',3,'activo','2024-11-28 04:31:19','2024-11-28 04:31:19'),(148,'usuario48','hashed_password_48',3,'activo','2024-11-28 04:31:19','2024-11-28 04:31:19'),(149,'usuario49','hashed_password_49',1,'activo','2024-11-28 04:31:19','2024-11-28 04:31:19'),(150,'usuario50','hashed_password_50',1,'activo','2024-11-28 04:31:21','2024-11-28 04:31:21');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-27 23:54:25
