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
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `rol_id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `descripcion` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`rol_id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Administrador','Acceso total al sistema','2024-11-28 04:28:59','2024-11-28 04:28:59'),(2,'Vendedor','Manejo de ventas e inventario','2024-11-28 04:28:59','2024-11-28 04:28:59'),(3,'Contador','Manejo de reportes financieros','2024-11-28 04:28:59','2024-11-28 04:28:59'),(4,'Agro-Técnico','Control de actividades agrícolas y plagas','2024-11-28 04:28:59','2024-11-28 04:28:59'),(5,'Almacenista','Control sobre insumos y almacenes','2024-11-28 04:28:59','2024-11-28 04:28:59'),(6,'Supervisor','Supervisión de actividades en finca','2024-11-28 04:28:59','2024-11-28 04:28:59'),(7,'Técnico Agrícola','Asesoramiento sobre cultivos y plagas','2024-11-28 04:28:59','2024-11-28 04:28:59'),(8,'Jefe de Operaciones','Gestión de operaciones diarias','2024-11-28 04:28:59','2024-11-28 04:28:59'),(9,'Coordinador de Ventas','Planificación de ventas y promociones','2024-11-28 04:28:59','2024-11-28 04:28:59'),(10,'Auxiliar Contable','Apoyo en tareas contables','2024-11-28 04:28:59','2024-11-28 04:28:59'),(11,'Responsable de Recursos Humanos','Gestión del personal','2024-11-28 04:28:59','2024-11-28 04:28:59'),(12,'Analista de Finanzas','Análisis de datos financieros','2024-11-28 04:28:59','2024-11-28 04:28:59'),(13,'Asistente de Ventas','Apoyo a las ventas diarias','2024-11-28 04:28:59','2024-11-28 04:28:59'),(14,'Gestor de Compras','Manejo de compras y proveedores','2024-11-28 04:28:59','2024-11-28 04:28:59'),(15,'Técnico de Almacén','Manejo de inventario en almacen','2024-11-28 04:28:59','2024-11-28 04:28:59'),(16,'Gestor de Proyectos','Planificación y seguimiento de proyectos','2024-11-28 04:28:59','2024-11-28 04:28:59'),(17,'Investigador Agrícola','Investigación en nuevas prácticas agrícolas','2024-11-28 04:28:59','2024-11-28 04:28:59'),(18,'Técnico de Riego','Especialista en sistemas de riego','2024-11-28 04:28:59','2024-11-28 04:28:59'),(19,'Asistente Administrativo','Apoyo administrativo general','2024-11-28 04:28:59','2024-11-28 04:28:59'),(20,'Gerente de Planta','Supervisión de procesos de producción','2024-11-28 04:28:59','2024-11-28 04:28:59'),(21,'Coordinador de Logística','Manejo de la logística y distribución','2024-11-28 04:28:59','2024-11-28 04:28:59'),(22,'Operador de Maquinaria','Operación de maquinaria agrícola','2024-11-28 04:28:59','2024-11-28 04:28:59'),(23,'Asesor de Cultivos','Asesoramiento en variedades de cultivos','2024-11-28 04:28:59','2024-11-28 04:28:59'),(24,'Controlador de Calidad','Verificación de calidad de productos','2024-11-28 04:28:59','2024-11-28 04:28:59'),(25,'Encargado de Fertilizantes','Gestión de fertilizantes y productos químicos','2024-11-28 04:28:59','2024-11-28 04:28:59'),(26,'Cajero','Manejo de caja y atención al cliente','2024-11-28 04:28:59','2024-11-28 04:28:59'),(27,'Encargado de Seguridad','Supervisión de seguridad en la finca','2024-11-28 04:28:59','2024-11-28 04:28:59'),(28,'Responsable de Mantenimiento','Mantenimiento de instalaciones','2024-11-28 04:28:59','2024-11-28 04:28:59'),(29,'Atención al Cliente','Gestión de relaciones con clientes','2024-11-28 04:28:59','2024-11-28 04:28:59'),(30,'Actuario','Estadísticas y auditoría de procesos','2024-11-28 04:28:59','2024-11-28 04:28:59'),(31,'Investigador de Plagas','Investigación sobre plagas y control','2024-11-28 04:28:59','2024-11-28 04:28:59'),(32,'Analista de Datos','Análisis de información y métricas','2024-11-28 04:28:59','2024-11-28 04:28:59'),(33,'Asistente en Campo','Apoyo en actividades de campo','2024-11-28 04:28:59','2024-11-28 04:28:59'),(34,'Coordinador de Capacitación','Gestión de capacitación de personal','2024-11-28 04:28:59','2024-11-28 04:28:59'),(35,'Asesor en Sustentabilidad','Asesoría en prácticas agrícolas sustentables','2024-11-28 04:28:59','2024-11-28 04:28:59'),(36,'Encargado de Inversiones','Gestión de inversiones agrícolas','2024-11-28 04:28:59','2024-11-28 04:28:59'),(37,'Responsable de Calidad','Mantenimiento de estándares de calidad','2024-11-28 04:28:59','2024-11-28 04:28:59'),(38,'Auxiliar de Oficina','Apoyo en tareas administrativas','2024-11-28 04:28:59','2024-11-28 04:28:59'),(39,'Gestor de Relaciones Públicas','Manejo de relaciones públicas','2024-11-28 04:28:59','2024-11-28 04:28:59'),(40,'Coordinador de Benificios','Gestión de beneficios para empleados','2024-11-28 04:28:59','2024-11-28 04:28:59'),(41,'Ingeniero Agrónomo','Diseño de procesos agrícolas','2024-11-28 04:28:59','2024-11-28 04:28:59'),(42,'Encargado de Demostración','Demostración de productos','2024-11-28 04:28:59','2024-11-28 04:28:59'),(43,'Gestor de Experiencia del Cliente','Optimización de la experiencia del cliente','2024-11-28 04:28:59','2024-11-28 04:28:59'),(44,'Conserje','Mantenimiento y limpieza general','2024-11-28 04:28:59','2024-11-28 04:28:59'),(45,'Promotor de Ventas','Promoción de productos y ventas','2024-11-28 04:28:59','2024-11-28 04:28:59'),(46,'Operador de Camiones','Manejo de transporte y logística','2024-11-28 04:28:59','2024-11-28 04:28:59');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
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
