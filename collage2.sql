-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: collage2
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- GTID state at the beginning of the backup 
--


CREATE DATABASE /*!32312 IF NOT EXISTS*/ `collage2` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `collage2`;



--
-- Table structure for table `acteur`
--

DROP TABLE IF EXISTS `acteur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acteur` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) NOT NULL,
  `pwd` varchar(45) NOT NULL,
  `login` varchar(45) NOT NULL,
  `start` varchar(100) DEFAULT NULL,
  `stop` varchar(100) DEFAULT NULL,
  `route` mediumtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acteur`
--

LOCK TABLES `acteur` WRITE;
/*!40000 ALTER TABLE `acteur` DISABLE KEYS */;
INSERT INTO `acteur` VALUES (12,'Eliot','123456','Eliot',NULL,NULL,''),(13,'Voiture 1','v1','v1',NULL,NULL,NULL),(14,'Voiture 2','v2','v2',NULL,NULL,NULL),(15,'Voiture 3','v3','v3',NULL,NULL,NULL),(16,'Voiture 4','v4','v4',NULL,NULL,NULL);
/*!40000 ALTER TABLE `acteur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `circuit`
--

DROP TABLE IF EXISTS `circuit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `circuit` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `circuit`
--

LOCK TABLES `circuit` WRITE;
/*!40000 ALTER TABLE `circuit` DISABLE KEYS */;
/*!40000 ALTER TABLE `circuit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `journal`
--

DROP TABLE IF EXISTS `journal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `journal` (
  `panneau_id` int unsigned NOT NULL,
  `acteur_id` int unsigned NOT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `info` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journal`
--

LOCK TABLES `journal` WRITE;
/*!40000 ALTER TABLE `journal` DISABLE KEYS */;
/*!40000 ALTER TABLE `journal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `panneau`
--

DROP TABLE IF EXISTS `panneau`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `panneau` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `adresse` varchar(150) DEFAULT NULL,
  `nom` varchar(100) DEFAULT NULL,
  `nb` varchar(5) DEFAULT NULL,
  `last` datetime DEFAULT NULL,
  `decolle` varchar(5) DEFAULT NULL,
  `iti` varchar(100) DEFAULT NULL,
  `pos` varchar(5) DEFAULT NULL,
  `coord` varchar(100) DEFAULT NULL,
  `officiel` varchar(45) DEFAULT NULL,
  `id_ville` int unsigned NOT NULL,
  `statuscode` int unsigned NOT NULL DEFAULT '1',
  `coord_init` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=968 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `panneau`
--

LOCK TABLES `panneau` WRITE;
/*!40000 ALTER TABLE `panneau` DISABLE KEYS */;
INSERT INTO `panneau` VALUES (954,'Rue Basse Fontaine','Rue Basse Fontaine',NULL,NULL,NULL,NULL,NULL,'46.5334548,0.2557975','FALSE',1,1,NULL),(955,'68 route de Béruges','68 route de Béruges',NULL,NULL,NULL,NULL,NULL,'46.5387492,0.2539028','FALSE',1,1,NULL),(956,'Rue Saint Exupéry','Rue Saint Exupéry',NULL,NULL,NULL,NULL,NULL,'46.5399162,0.2640412','FALSE',1,1,NULL),(957,'N147','N147',NULL,NULL,NULL,NULL,NULL,'46.5440526,0.4147437','FALSE',2,1,NULL),(958,'Mairie','Mairie',NULL,NULL,NULL,NULL,NULL,'46.5409419,0.4141913','FALSE',2,1,NULL),(959,'Fac de Droit','Fac de Droit',NULL,NULL,NULL,NULL,NULL,'46.5708083,0.3789908','FALSE',3,1,NULL),(960,'Avenue Jacques Coeur','Avenue Jacques Coeur',NULL,NULL,NULL,NULL,NULL,'46.5634286,0.3819331','FALSE',3,1,NULL),(961,'Lycée Bois d\'Amour','Lycée Bois d\'Amour',NULL,NULL,NULL,NULL,NULL,'46.5512465,0.309121','FALSE',3,1,NULL),(962,'Castorama','Castorama',NULL,NULL,NULL,NULL,NULL,'46.5553948,0.3082143','FALSE',3,1,NULL),(963,'Stade de la Madeleine','Stade de la Madeleine',NULL,NULL,NULL,NULL,NULL,'46.5724799,0.3274236','FALSE',3,1,NULL),(964,'Place de France','Place de France',NULL,NULL,NULL,NULL,NULL,'46.5657377,0.3494821','FALSE',3,1,NULL),(965,'Del Arte','Del Arte',NULL,NULL,NULL,NULL,NULL,'46.563569,0.3562024','FALSE',4,1,NULL),(966,'Ecole Irma Jouenne','Ecole Irma Jouenne',NULL,NULL,NULL,NULL,NULL,'46.5531695,0.3419771','FALSE',4,1,NULL),(967,'CFA','CFA',NULL,NULL,NULL,NULL,NULL,'46.5500358,0.3210491','FALSE',4,1,NULL);
/*!40000 ALTER TABLE `panneau` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `panneau_acteur`
--

DROP TABLE IF EXISTS `panneau_acteur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `panneau_acteur` (
  `acteur_id` int unsigned NOT NULL,
  `panneau_id` varchar(45) NOT NULL,
  `ordre` int unsigned NOT NULL,
  `statut` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`acteur_id`,`panneau_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `panneau_acteur`
--

LOCK TABLES `panneau_acteur` WRITE;
/*!40000 ALTER TABLE `panneau_acteur` DISABLE KEYS */;
INSERT INTO `panneau_acteur` VALUES (12,'954',1,0),(12,'955',2,0),(12,'956',3,0),(12,'957',4,0),(12,'958',5,0),(12,'959',6,0),(12,'960',7,0),(12,'961',8,0),(12,'962',9,0),(12,'963',10,0),(12,'964',11,0),(12,'965',12,0),(12,'966',13,0),(12,'967',14,0);
/*!40000 ALTER TABLE `panneau_acteur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `panneau_circuit`
--

DROP TABLE IF EXISTS `panneau_circuit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `panneau_circuit` (
  `id_panneau` int unsigned NOT NULL AUTO_INCREMENT,
  `id_circuit` int unsigned NOT NULL,
  PRIMARY KEY (`id_panneau`,`id_circuit`)
) ENGINE=InnoDB AUTO_INCREMENT=940 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `panneau_circuit`
--

LOCK TABLES `panneau_circuit` WRITE;
/*!40000 ALTER TABLE `panneau_circuit` DISABLE KEYS */;
/*!40000 ALTER TABLE `panneau_circuit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ville`
--

DROP TABLE IF EXISTS `ville`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ville` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ville`
--

LOCK TABLES `ville` WRITE;
/*!40000 ALTER TABLE `ville` DISABLE KEYS */;
INSERT INTO `ville` VALUES (1,'Fontaine-le-Comte'),(2,'Mignaloux-Beauvoir'),(3,'Poitiers'),(4,'Saint-Benoît');
/*!40000 ALTER TABLE `ville` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'collage2'
--

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-11 11:56:05
