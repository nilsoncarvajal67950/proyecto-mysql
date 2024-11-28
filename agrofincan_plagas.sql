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
-- Table structure for table `plagas`
--

DROP TABLE IF EXISTS `plagas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plagas` (
  `plaga_id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  `descripcion` text,
  `tratamiento` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`plaga_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plagas`
--

LOCK TABLES `plagas` WRITE;
/*!40000 ALTER TABLE `plagas` DISABLE KEYS */;
INSERT INTO `plagas` VALUES (1,'Mosca blanca','Insecto','Pequeña mosca que afecta cultivos como tomate y algodón, causando amarillamiento de hojas.','Aplicar insecticidas sistémicos y trampas adhesivas.','2024-11-28 02:53:05','2024-11-28 02:53:05'),(2,'Gusano cogollero','Insecto','Larva que se alimenta de hojas y tallos, especialmente en maíz y sorgo.','Uso de biopesticidas y rotación de cultivos.','2024-11-28 02:53:05','2024-11-28 02:53:05'),(3,'Pulgón verde','Insecto','Insecto que succiona savia y puede transmitir virosis a los cultivos.','Aplicar jabón potásico y eliminar malas hierbas.','2024-11-28 02:53:05','2024-11-28 02:53:05'),(4,'Araña roja','Ácaro','Ácaro que provoca manchas amarillas y desecación de hojas.','Aplicar acaricidas y aumentar la humedad ambiental.','2024-11-28 02:53:05','2024-11-28 02:53:05'),(5,'Picudo del algodón','Insecto','Escarabajo que perfora los capullos del algodón, dañándolos.','Uso de trampas feromonales y limpieza de restos de cultivo.','2024-11-28 02:53:05','2024-11-28 02:53:05'),(6,'Trips','Insecto','Insecto que causa manchas plateadas y deformaciones en hojas y frutos.','Aplicar aceites hortícolas y trampas adhesivas.','2024-11-28 02:53:05','2024-11-28 02:53:05'),(7,'Langosta migratoria','Insecto','Insecto voraz que devora cultivos en grandes cantidades.','Control biológico con hongos y monitoreo constante.','2024-11-28 02:53:05','2024-11-28 02:53:05'),(8,'Nematodos del suelo','Parásito','Gusanos microscópicos que atacan raíces, debilitando las plantas.','Uso de nematicidas y rotación de cultivos.','2024-11-28 02:53:05','2024-11-28 02:53:05'),(9,'Mildiu','Hongo','Enfermedad que genera manchas amarillas en hojas y necrosis progresiva.','Aplicar fungicidas a base de cobre.','2024-11-28 02:53:05','2024-11-28 02:53:05'),(10,'Roya','Hongo','Hongo que produce pústulas anaranjadas en hojas y tallos.','Uso de variedades resistentes y fungicidas específicos.','2024-11-28 02:53:05','2024-11-28 02:53:05'),(11,'Tizón tardío','Hongo','Enfermedad grave que causa pudrición en papa y tomate.','Fungicidas preventivos y eliminación de plantas infectadas.','2024-11-28 02:53:05','2024-11-28 02:53:05'),(12,'Oídio','Hongo','Hongo que cubre hojas y frutos con un polvo blanco.','Aplicar azufre mojable y mejorar la ventilación.','2024-11-28 02:53:05','2024-11-28 02:53:05'),(13,'Caracol africano','Molusco','Caracol invasor que devora hojas y brotes tiernos.','Recolectar manualmente y usar barreras físicas.','2024-11-28 02:53:05','2024-11-28 02:53:05'),(14,'Gorgojo del arroz','Insecto','Insecto que perfora y daña granos almacenados.','Uso de almacenamiento hermético y fumigación.','2024-11-28 02:53:05','2024-11-28 02:53:05'),(15,'Mosca de la fruta','Insecto','Insecto que perfora frutos, causando daños internos.','Trampas con feromonas y control biológico.','2024-11-28 02:53:05','2024-11-28 02:53:05'),(16,'Hormiga cortadora','Insecto','Hormiga que corta hojas para transportar a su nido.','Aplicar cebos específicos y destruir nidos.','2024-11-28 02:53:05','2024-11-28 02:53:05'),(17,'Gusano alambre','Insecto','Larva que daña raíces y tubérculos.','Rotación de cultivos y control del suelo.','2024-11-28 02:53:05','2024-11-28 02:53:05'),(18,'Cochinilla algodonosa','Insecto','Insecto que succiona savia y genera una sustancia algodonosa.','Control biológico con mariquitas y aplicación de jabón potásico.','2024-11-28 02:53:05','2024-11-28 02:53:05'),(19,'Tizón temprano','Hongo','Hongo que provoca manchas negras en hojas de papa y tomate.','Aplicar fungicidas específicos.','2024-11-28 02:53:05','2024-11-28 02:53:05'),(20,'Gallina ciega','Insecto','Larva que daña raíces de maíz y hortalizas.','Uso de nematodos entomopatógenos y rotación de cultivos.','2024-11-28 02:53:05','2024-11-28 02:53:05'),(21,'Ceniza','Hongo','Hongo que cubre las hojas con un polvo gris.','Aplicar fungicidas y reducir la humedad en el cultivo.','2024-11-28 02:53:05','2024-11-28 02:53:05'),(22,'Peronospora','Hongo','Hongo que causa manchas marrones en hojas de viña.','Uso de fungicidas sistémicos.','2024-11-28 02:53:05','2024-11-28 02:53:05'),(23,'Minador de hojas','Insecto','Insecto que forma galerías dentro de las hojas.','Aplicar insecticidas sistémicos y eliminar hojas afectadas.','2024-11-28 02:53:05','2024-11-28 02:53:05'),(24,'Mosca negra','Insecto','Insecto que enrolla hojas y las deforma.','Insecticidas específicos y trampas adhesivas.','2024-11-28 02:53:05','2024-11-28 02:53:05'),(25,'Ácaro blanco','Ácaro','Ácaro que causa amarillamiento y caída prematura de hojas.','Aplicar acaricidas selectivos.','2024-11-28 02:53:05','2024-11-28 02:53:05'),(26,'Gorgojo de la vid','Insecto','Insecto que se alimenta de hojas y brotes tiernos.','Eliminación manual y control biológico.','2024-11-28 02:53:05','2024-11-28 02:53:05'),(27,'Antracnosis','Hongo','Hongo que afecta frutos y hojas con manchas hundidas.','Aplicar fungicidas a base de cobre.','2024-11-28 02:53:05','2024-11-28 02:53:05'),(28,'Escarabajo de las cucurbitáceas','Insecto','Insecto que devora hojas y frutos jóvenes.','Trampas de feromonas y eliminación manual.','2024-11-28 02:53:05','2024-11-28 02:53:05'),(29,'Chinche verde','Insecto','Insecto que succiona savia y genera manchas en frutos.','Uso de piretroides y control biológico.','2024-11-28 02:53:05','2024-11-28 02:53:05'),(30,'Barrenador del tallo','Insecto','Larva que perfora tallos, debilitando la planta.','Aplicar insecticidas sistémicos.','2024-11-28 02:53:05','2024-11-28 02:53:05'),(31,'Heliotis','Insecto','Larva que perfora frutos y flores.','Rotación de cultivos y biopesticidas.','2024-11-28 02:53:05','2024-11-28 02:53:05'),(32,'Escarabajo japonés','Insecto','Insecto que devora hojas y flores.','Aplicar insecticidas y trampas de feromonas.','2024-11-28 02:53:05','2024-11-28 02:53:05'),(33,'Pulgón negro','Insecto','Pulgón que afecta cultivos como frijol y soya.','Aplicar jabón potásico y control biológico.','2024-11-28 02:53:05','2024-11-28 02:53:05'),(34,'Chinche de patas rojas','Insecto','Insecto que succiona savia de semillas.','Uso de insecticidas piretroides.','2024-11-28 02:53:05','2024-11-28 02:53:05'),(35,'Carcoma de la madera','Insecto','Insecto que perfora estructuras de madera.','Fumigación y reemplazo de estructuras afectadas.','2024-11-28 02:53:05','2024-11-28 02:53:05'),(36,'Escarabajo barrenador','Insecto','Insecto que ataca troncos y ramas.','Aplicar insecticidas específicos.','2024-11-28 02:53:05','2024-11-28 02:53:05'),(37,'Caterpillar del maíz','Insecto','Larva que devora hojas de maíz.','Uso de trampas biológicas.','2024-11-28 02:53:05','2024-11-28 02:53:05'),(38,'Polilla del tomate','Insecto','Polilla que pone huevos en frutos y los daña.','Aplicar insecticidas y eliminar frutos infectados.','2024-11-28 02:53:05','2024-11-28 02:53:05'),(39,'Langosta del desierto','Insecto','Insecto que ataca cultivos de cereales.','Monitoreo constante y control biológico.','2024-11-28 02:53:05','2024-11-28 02:53:05'),(40,'Mancha negra','Hongo','Hongo que causa manchas negras en hojas y frutos.','Aplicar fungicidas preventivos.','2024-11-28 02:53:05','2024-11-28 02:53:05');
/*!40000 ALTER TABLE `plagas` ENABLE KEYS */;
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
