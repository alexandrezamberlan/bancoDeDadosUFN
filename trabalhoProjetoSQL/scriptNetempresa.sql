CREATE DATABASE  IF NOT EXISTS `netempresta_db` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `netempresta_db`;
-- MySQL dump 10.13  Distrib 8.0.21, for macos10.15 (x86_64)
--
-- Host: localhost    Database: netempresta_db
-- ------------------------------------------------------
-- Server version	5.7.16

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
-- Table structure for table `Aluguel`
--

DROP TABLE IF EXISTS `Aluguel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Aluguel` (
  `idCliente` int(11) NOT NULL,
  `idFilme` int(11) NOT NULL,
  `dataHora` datetime NOT NULL,
  PRIMARY KEY (`idCliente`,`idFilme`,`dataHora`),
  KEY `fk_Filme_Aluguel` (`idFilme`),
  CONSTRAINT `fk_Cliente_Aluguel` FOREIGN KEY (`idCliente`) REFERENCES `Cliente` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Filme_Aluguel` FOREIGN KEY (`idFilme`) REFERENCES `Filme` (`idFilme`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Aluguel`
--

LOCK TABLES `Aluguel` WRITE;
/*!40000 ALTER TABLE `Aluguel` DISABLE KEYS */;
INSERT INTO `Aluguel` VALUES (1,100,'2021-05-31 00:00:00'),(1,101,'2021-05-31 00:00:00'),(2,101,'2019-05-31 00:00:00'),(1,102,'2021-05-31 00:00:00'),(2,102,'2021-03-31 00:00:00');
/*!40000 ALTER TABLE `Aluguel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ator`
--

DROP TABLE IF EXISTS `Ator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Ator` (
  `idAtor` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `apelido` varchar(45) DEFAULT NULL,
  `dataNascimento` datetime NOT NULL,
  PRIMARY KEY (`idAtor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ator`
--

LOCK TABLES `Ator` WRITE;
/*!40000 ALTER TABLE `Ator` DISABLE KEYS */;
INSERT INTO `Ator` VALUES (1,'Harison Ford','Harrison Ford','1960-04-05 00:00:00'),(2,'Mark Hamill','Mark Hamill','1965-01-01 00:00:00'),(3,'Carrie Fisher','Carrie Fisher','1955-01-01 00:00:00'),(4,'Tom Hanks','Antony Hanks','1962-09-10 00:00:00');
/*!40000 ALTER TABLE `Ator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Categoria`
--

DROP TABLE IF EXISTS `Categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Categoria` (
  `idCategoria` int(11) NOT NULL,
  `descricao` varchar(45) NOT NULL,
  PRIMARY KEY (`idCategoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Categoria`
--

LOCK TABLES `Categoria` WRITE;
/*!40000 ALTER TABLE `Categoria` DISABLE KEYS */;
INSERT INTO `Categoria` VALUES (10,'Ficção Científica'),(20,'Fantasia'),(30,'Suspense'),(40,'Comédia');
/*!40000 ALTER TABLE `Categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cliente`
--

DROP TABLE IF EXISTS `Cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Cliente` (
  `idCliente` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `telefone` varchar(14) NOT NULL,
  `endereco` varchar(45) NOT NULL,
  PRIMARY KEY (`idCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cliente`
--

LOCK TABLES `Cliente` WRITE;
/*!40000 ALTER TABLE `Cliente` DISABLE KEYS */;
INSERT INTO `Cliente` VALUES (1,'Alexandre Zamberlan','3223593','Santa Maria'),(2,'Augusto Maine','12123456','Caicó'),(3,'Gabriel Rosa','98765432','Santa Maria'),(4,'Lucas Suchorski','99998888','Lagoa Santa');
/*!40000 ALTER TABLE `Cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Filme`
--

DROP TABLE IF EXISTS `Filme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Filme` (
  `idFilme` int(11) NOT NULL,
  `titulo` varchar(45) NOT NULL,
  `idCategoria` int(11) NOT NULL,
  PRIMARY KEY (`idFilme`),
  KEY `fk_Categoria_Filme` (`idCategoria`),
  CONSTRAINT `fk_Categoria_Filme` FOREIGN KEY (`idCategoria`) REFERENCES `Categoria` (`idCategoria`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Filme`
--

LOCK TABLES `Filme` WRITE;
/*!40000 ALTER TABLE `Filme` DISABLE KEYS */;
INSERT INTO `Filme` VALUES (100,'Star Wars: Episódio IV – Uma Nova Esperança',10),(101,'Star Wars: Episódio III – A Vingança dos Sith',10),(102,'Quero Ser Grande ',40);
/*!40000 ALTER TABLE `Filme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Filme_Ator`
--

DROP TABLE IF EXISTS `Filme_Ator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Filme_Ator` (
  `idFilme` int(11) NOT NULL,
  `idAtor` int(11) NOT NULL,
  PRIMARY KEY (`idFilme`,`idAtor`),
  KEY `fk_Ator_idx` (`idAtor`),
  CONSTRAINT `fk_Ator` FOREIGN KEY (`idAtor`) REFERENCES `Ator` (`idAtor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Filme` FOREIGN KEY (`idFilme`) REFERENCES `Filme` (`idFilme`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Filme_Ator`
--

LOCK TABLES `Filme_Ator` WRITE;
/*!40000 ALTER TABLE `Filme_Ator` DISABLE KEYS */;
INSERT INTO `Filme_Ator` VALUES (100,1),(100,2),(100,3);
/*!40000 ALTER TABLE `Filme_Ator` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-31 10:18:23
