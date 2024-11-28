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
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `proveedor_id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `rfc` varchar(20) DEFAULT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  `contacto` varchar(100) DEFAULT NULL,
  `especialidad` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`proveedor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (1,'Proveedor Uno','RFC001','Fertilizante','contacto1@mail.com','Fertilizantes químicos','2024-11-28 02:53:05','2024-11-28 02:53:05'),(2,'Proveedor Dos','RFC002','Semilla','contacto2@mail.com','Semillas certificadas','2024-11-28 02:53:05','2024-11-28 02:53:05'),(3,'Proveedor Tres','RFC003','Agroquímicos','contacto3@mail.com','Plaguicidas','2024-11-28 02:53:05','2024-11-28 02:53:05'),(4,'Proveedor Cuatro','RFC004','Maquinaria','contacto4@mail.com','Tractores y arados','2024-11-28 02:53:05','2024-11-28 02:53:05'),(5,'Proveedor Cinco','RFC005','Irrigación','contacto5@mail.com','Sistemas de riego','2024-11-28 02:53:05','2024-11-28 02:53:05'),(6,'Proveedor Seis','RFC006','Servicios','contacto6@mail.com','Asesoría agronómica','2024-11-28 02:53:05','2024-11-28 02:53:05'),(7,'Proveedor Siete','RFC007','Fertilizante','contacto7@mail.com','Fertilizantes orgánicos','2024-11-28 02:53:05','2024-11-28 02:53:05'),(8,'Proveedor Ocho','RFC008','Semilla','contacto8@mail.com','Semillas de hortalizas','2024-11-28 02:53:05','2024-11-28 02:53:05'),(9,'Proveedor Nueve','RFC009','Agroquímicos','contacto9@mail.com','Herbicidas','2024-11-28 02:53:05','2024-11-28 02:53:05'),(10,'Proveedor Diez','RFC010','Maquinaria','contacto10@mail.com','Cultivadoras','2024-11-28 02:53:05','2024-11-28 02:53:05'),(11,'Proveedor Once','RFC011','Irrigación','contacto11@mail.com','Bombas de agua','2024-11-28 02:53:05','2024-11-28 02:53:05'),(12,'Proveedor Doce','RFC012','Servicios','contacto12@mail.com','Mantenimiento de maquinaria','2024-11-28 02:53:05','2024-11-28 02:53:05'),(13,'Proveedor Trece','RFC013','Fertilizante','contacto13@mail.com','Fertilizantes líquidos','2024-11-28 02:53:05','2024-11-28 02:53:05'),(14,'Proveedor Catorce','RFC014','Semilla','contacto14@mail.com','Semillas de maíz','2024-11-28 02:53:05','2024-11-28 02:53:05'),(15,'Proveedor Quince','RFC015','Agroquímicos','contacto15@mail.com','Insecticidas','2024-11-28 02:53:05','2024-11-28 02:53:05'),(16,'Proveedor Dieciséis','RFC016','Maquinaria','contacto16@mail.com','Cepillos agrícolas','2024-11-28 02:53:05','2024-11-28 02:53:05'),(17,'Proveedor Diecisiete','RFC017','Irrigación','contacto17@mail.com','Tubos de riego','2024-11-28 02:53:05','2024-11-28 02:53:05'),(18,'Proveedor Dieciocho','RFC018','Servicios','contacto18@mail.com','Consultora en cultivos','2024-11-28 02:53:05','2024-11-28 02:53:05'),(19,'Proveedor Diecinueve','RFC019','Fertilizante','contacto19@mail.com','Fertilizantes de liberación controlada','2024-11-28 02:53:05','2024-11-28 02:53:05'),(20,'Proveedor Veinte','RFC020','Semilla','contacto20@mail.com','Semillas de girasol','2024-11-28 02:53:05','2024-11-28 02:53:05'),(21,'Proveedor Veintiuno','RFC021','Agroquímicos','contacto21@mail.com','Fitosanitarios','2024-11-28 02:53:05','2024-11-28 02:53:05'),(22,'Proveedor Veintidós','RFC022','Maquinaria','contacto22@mail.com','Herramientas manuales','2024-11-28 02:53:05','2024-11-28 02:53:05'),(23,'Proveedor Veintitres','RFC023','Irrigación','contacto23@mail.com','Cisternas','2024-11-28 02:53:05','2024-11-28 02:53:05'),(24,'Proveedor Veinticuatro','RFC024','Servicios','contacto24@mail.com','Instalación de sistemas de riego','2024-11-28 02:53:05','2024-11-28 02:53:05'),(25,'Proveedor Veinticinco','RFC025','Fertilizante','contacto25@mail.com','Fertilizantes de pasto','2024-11-28 02:53:05','2024-11-28 02:53:05'),(26,'Proveedor Veintiseis','RFC026','Semilla','contacto26@mail.com','Semillas de tomate','2024-11-28 02:53:05','2024-11-28 02:53:05'),(27,'Proveedor Veintisiete','RFC027','Agroquímicos','contacto27@mail.com','Fumigantes','2024-11-28 02:53:05','2024-11-28 02:53:05'),(28,'Proveedor Veintiocho','RFC028','Maquinaria','contacto28@mail.com','Cosechadoras','2024-11-28 02:53:05','2024-11-28 02:53:05'),(29,'Proveedor Veintinueve','RFC029','Irrigación','contacto29@mail.com','Filtros de riego','2024-11-28 02:53:05','2024-11-28 02:53:05'),(30,'Proveedor Treinta','RFC030','Servicios','contacto30@mail.com','Capacitación en cultivos','2024-11-28 02:53:05','2024-11-28 02:53:05'),(31,'Proveedor Treinta y Uno','RFC031','Fertilizante','contacto31@mail.com','Fertilizantes foliares','2024-11-28 02:53:05','2024-11-28 02:53:05'),(32,'Proveedor Treinta y Dos','RFC032','Semilla','contacto32@mail.com','Semillas de papa','2024-11-28 02:53:05','2024-11-28 02:53:05'),(33,'Proveedor Treinta y Tres','RFC033','Agroquímicos','contacto33@mail.com','Acaricidas','2024-11-28 02:53:05','2024-11-28 02:53:05'),(34,'Proveedor Treinta y Cuatro','RFC034','Maquinaria','contacto34@mail.com','Remolques agrícolas','2024-11-28 02:53:05','2024-11-28 02:53:05'),(35,'Proveedor Treinta y Cinco','RFC035','Irrigación','contacto35@mail.com','Sistemas de goteo','2024-11-28 02:53:05','2024-11-28 02:53:05'),(36,'Proveedor Treinta y Seis','RFC036','Servicios','contacto36@mail.com','Cultivo hidropónico','2024-11-28 02:53:05','2024-11-28 02:53:05'),(37,'Proveedor Treinta y Siete','RFC037','Fertilizante','contacto37@mail.com','Fertilizantes nitrogenados','2024-11-28 02:53:05','2024-11-28 02:53:05'),(38,'Proveedor Treinta y Ocho','RFC038','Semilla','contacto38@mail.com','Semillas de cebolla','2024-11-28 02:53:05','2024-11-28 02:53:05'),(39,'Proveedor Treinta y Nueve','RFC039','Agroquímicos','contacto39@mail.com','Fungicidas','2024-11-28 02:53:05','2024-11-28 02:53:05'),(40,'Proveedor Cuarenta','RFC040','Maquinaria','contacto40@mail.com','Tractores de arrastre','2024-11-28 02:53:05','2024-11-28 02:53:05'),(41,'Proveedor Cuarenta y Uno','RFC041','Irrigación','contacto41@mail.com','Aspersores','2024-11-28 02:53:05','2024-11-28 02:53:05'),(42,'Proveedor Cuarenta y Dos','RFC042','Servicios','contacto42@mail.com','Cosecha de frutas','2024-11-28 02:53:05','2024-11-28 02:53:05'),(43,'Proveedor Cuarenta y Tres','RFC043','Fertilizante','contacto43@mail.com','Abonos orgánicos','2024-11-28 02:53:05','2024-11-28 02:53:05'),(44,'Proveedor Cuarenta y Cuatro','RFC044','Semilla','contacto44@mail.com','Semillas de chícharo','2024-11-28 02:53:05','2024-11-28 02:53:05'),(45,'Proveedor Cuarenta y Cinco','RFC045','Agroquímicos','contacto45@mail.com','Rodenticidas','2024-11-28 02:53:05','2024-11-28 02:53:05'),(46,'Proveedor Cuarenta y Seis','RFC046','Maquinaria','contacto46@mail.com','Líneas de riego','2024-11-28 02:53:05','2024-11-28 02:53:05'),(47,'Proveedor Cuarenta y Siete','RFC047','Irrigación','contacto47@mail.com','Tuberías de pvc','2024-11-28 02:53:05','2024-11-28 02:53:05'),(48,'Proveedor Cuarenta y Ocho','RFC048','Servicios','contacto48@mail.com','Asesoramiento técnico','2024-11-28 02:53:05','2024-11-28 02:53:05'),(49,'Proveedor Cuarenta y Nueve','RFC049','Fertilizante','contacto49@mail.com','Fertilizantes líquidos','2024-11-28 02:53:05','2024-11-28 02:53:05'),(50,'Proveedor Cincuenta','RFC050','Semilla','contacto50@mail.com','Semillas de chiles','2024-11-28 02:53:05','2024-11-28 02:53:05'),(51,'Proveedor Cincuenta y Uno','RFC051','Agroquímicos','contacto51@mail.com','Abonos de liberación controlada','2024-11-28 02:53:05','2024-11-28 02:53:05'),(52,'Proveedor Cincuenta y Dos','RFC052','Maquinaria','contacto52@mail.com','Equipos de cultivo','2024-11-28 02:53:05','2024-11-28 02:53:05'),(53,'Proveedor Cincuenta y Tres','RFC053','Irrigación','contacto53@mail.com','Mangueras de riego','2024-11-28 02:53:05','2024-11-28 02:53:05'),(54,'Proveedor Cincuenta y Cuatro','RFC054','Servicios','contacto54@mail.com','Operación de maquinaria','2024-11-28 02:53:05','2024-11-28 02:53:05'),(55,'Proveedor Cincuenta y Cinco','RFC055','Fertilizante','contacto55@mail.com','Fertilizantes para hortalizas','2024-11-28 02:53:05','2024-11-28 02:53:05'),(56,'Proveedor Cincuenta y Seis','RFC056','Semilla','contacto56@mail.com','Semillas de frutas','2024-11-28 02:53:05','2024-11-28 02:53:05'),(57,'Proveedor Cincuenta y Siete','RFC057','Agroquímicos','contacto57@mail.com','Reguladores de crecimiento','2024-11-28 02:53:05','2024-11-28 02:53:05'),(58,'Proveedor Cincuenta y Ocho','RFC058','Maquinaria','contacto58@mail.com','Equipos de fumigación','2024-11-28 02:53:05','2024-11-28 02:53:05'),(59,'Proveedor Cincuenta y Nueve','RFC059','Irrigación','contacto59@mail.com','Sistemas de automatización','2024-11-28 02:53:05','2024-11-28 02:53:05'),(60,'Proveedor Sesenta','RFC060','Servicios','contacto60@mail.com','Transporte agrícola','2024-11-28 02:53:05','2024-11-28 02:53:05'),(61,'Proveedor Sesenta y Uno','RFC061','Fertilizante','contacto61@mail.com','Fertilizantes granulados','2024-11-28 02:53:05','2024-11-28 02:53:05'),(62,'Proveedor Sesenta y Dos','RFC062','Semilla','contacto62@mail.com','Semillas de gramíneas','2024-11-28 02:53:05','2024-11-28 02:53:05'),(63,'Proveedor Sesenta y Tres','RFC063','Agroquímicos','contacto63@mail.com','Antibacterianos','2024-11-28 02:53:05','2024-11-28 02:53:05'),(64,'Proveedor Sesenta y Cuatro','RFC064','Maquinaria','contacto64@mail.com','Sistemas de siembra','2024-11-28 02:53:05','2024-11-28 02:53:05'),(65,'Proveedor Sesenta y Cinco','RFC065','Irrigación','contacto65@mail.com','Drenajes','2024-11-28 02:53:05','2024-11-28 02:53:05'),(66,'Proveedor Sesenta y Seis','RFC066','Servicios','contacto66@mail.com','Cultivos de floración','2024-11-28 02:53:05','2024-11-28 02:53:05'),(67,'Proveedor Sesenta y Siete','RFC067','Fertilizante','contacto67@mail.com','Compuestos NPK','2024-11-28 02:53:05','2024-11-28 02:53:05'),(68,'Proveedor Sesenta y Ocho','RFC068','Semilla','contacto68@mail.com','Semillas de especies nativas','2024-11-28 02:53:05','2024-11-28 02:53:05'),(69,'Proveedor Sesenta y Nueve','RFC069','Agroquímicos','contacto69@mail.com','Desinfectantes','2024-11-28 02:53:05','2024-11-28 02:53:05'),(70,'Proveedor Setenta','RFC070','Maquinaria','contacto70@mail.com','Máquinas de recolección','2024-11-28 02:53:05','2024-11-28 02:53:05');
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-27 23:54:26