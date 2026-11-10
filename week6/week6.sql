-- MySQL dump 10.13  Distrib 8.4.9, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: movie_db
-- ------------------------------------------------------
-- Server version	8.4.9

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
-- Current Database: `movie_db`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `movie_db` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `movie_db`;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries` (
  `country_id` tinyint unsigned NOT NULL,
  `country_name` varchar(20) NOT NULL,
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'USA'),(2,'France'),(3,'Germany'),(4,'Italy'),(5,'Spain'),(6,'UK'),(7,'New Zealand'),(8,'Czech Republic'),(9,'Canada'),(10,'Japan'),(11,'Australia'),(12,'Lebanon');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directors`
--

DROP TABLE IF EXISTS `directors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directors` (
  `director_id` tinyint unsigned NOT NULL,
  `country_id` tinyint unsigned NOT NULL,
  `director_name` varchar(45) NOT NULL,
  PRIMARY KEY (`director_id`),
  KEY `fk_directors_countries1_idx` (`country_id`),
  CONSTRAINT `fk_directors_countries1` FOREIGN KEY (`country_id`) REFERENCES `countries` (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directors`
--

LOCK TABLES `directors` WRITE;
/*!40000 ALTER TABLE `directors` DISABLE KEYS */;
INSERT INTO `directors` VALUES (1,2,'Frank Darabont'),(2,1,'Francis Ford Coppola'),(3,1,'Quentin Tarantino'),(4,4,'Sergio Leone'),(5,1,'Sidney Lumet'),(6,6,'Christopher Nolan'),(7,1,'Steven Spielberg'),(8,7,'Peter Jackson'),(9,1,'David Fincher'),(10,1,'Irvin Kershner'),(11,8,'Milos Forman'),(12,1,'Martin Scorsese'),(13,1,'George Lucas'),(14,10,'Akira Kurosawa'),(15,1,'Robert Zemeckis'),(16,1,'Andy Wachowski'),(17,1,'Lana Wachowski');
/*!40000 ALTER TABLE `directors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genres` (
  `movie_id` tinyint unsigned NOT NULL,
  `genre_name` varchar(20) NOT NULL,
  PRIMARY KEY (`movie_id`,`genre_name`),
  CONSTRAINT `fk_genres_movies1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`movie_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
INSERT INTO `genres` VALUES (1,'Crime'),(1,'Drama'),(2,'Crime'),(2,'Drama'),(3,'Crime'),(3,'Drama'),(4,'Crime'),(4,'Thriller'),(5,'Adventure'),(5,'Western'),(6,'Drama'),(7,'Action'),(7,'Crime'),(7,'Drama'),(7,'Thriller'),(8,'Biography'),(8,'Drama'),(8,'History'),(8,'War'),(9,'Action'),(9,'Adventure'),(9,'Fantasy'),(10,'Drama'),(11,'Action'),(11,'Adventure'),(11,'Sci-Fi'),(12,'Action'),(12,'Adventure'),(12,'Fantasy'),(13,'Drama'),(14,'Action'),(14,'Adventure'),(14,'Mystery'),(14,'Thriller'),(15,'Biography'),(15,'Crime'),(15,'Drama'),(15,'Thriller'),(16,'Action'),(16,'Adventure'),(16,'Fantasy'),(16,'Sci-Fi'),(17,'Action'),(17,'Drama'),(18,'Drama'),(18,'Romance'),(19,'Action'),(19,'Adventure'),(19,'Sci-Fi'),(20,'Action'),(20,'Adventure'),(20,'Fantasy');
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `languages` (
  `movie_id` tinyint unsigned NOT NULL,
  `language_name` varchar(20) NOT NULL,
  PRIMARY KEY (`movie_id`,`language_name`),
  CONSTRAINT `fk_languages_movies1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`movie_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES (1,'English'),(2,'English'),(2,'Italian'),(2,'Latin'),(3,'English'),(3,'Italian'),(3,'Latin'),(3,'Sicilian'),(3,'Spanish'),(4,'English'),(4,'French'),(4,'Spanish'),(5,'Italian'),(6,'English'),(7,'English'),(7,'Mandarin'),(8,'English'),(8,'German'),(8,'Hebrew'),(8,'Polish'),(9,'English'),(9,'Old English'),(9,'Quenya'),(9,'Sindarin'),(10,'English'),(11,'English'),(12,'English'),(12,'Sindarin'),(13,'English'),(14,'English'),(14,'French'),(14,'Japanese'),(15,'English'),(15,'Italian'),(16,'English'),(17,'Japanese'),(18,'English'),(19,'English'),(20,'English'),(20,'Old English'),(20,'Sindarin');
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_directors`
--

DROP TABLE IF EXISTS `movie_directors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie_directors` (
  `movie_id` tinyint unsigned NOT NULL,
  `director_id` tinyint unsigned NOT NULL,
  PRIMARY KEY (`movie_id`,`director_id`),
  KEY `fk_movie_directors_directors1_idx` (`director_id`),
  CONSTRAINT `fk_movie_directors_directors1` FOREIGN KEY (`director_id`) REFERENCES `directors` (`director_id`),
  CONSTRAINT `fk_movie_directors_movies1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`movie_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_directors`
--

LOCK TABLES `movie_directors` WRITE;
/*!40000 ALTER TABLE `movie_directors` DISABLE KEYS */;
INSERT INTO `movie_directors` VALUES (1,1),(2,2),(3,2),(4,3),(5,4),(6,5),(7,6),(14,6),(8,7),(9,8),(12,8),(20,8),(10,9),(11,10),(13,11),(15,12),(16,13),(17,14),(18,15),(19,16),(19,17);
/*!40000 ALTER TABLE `movie_directors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_stars`
--

DROP TABLE IF EXISTS `movie_stars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie_stars` (
  `movie_id` tinyint unsigned NOT NULL,
  `star_id` smallint unsigned NOT NULL,
  PRIMARY KEY (`movie_id`,`star_id`),
  KEY `fk_movie_stars_stars1_idx` (`star_id`),
  CONSTRAINT `fk_movie_stars_movies1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`movie_id`),
  CONSTRAINT `fk_movie_stars_stars1` FOREIGN KEY (`star_id`) REFERENCES `stars` (`star_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_stars`
--

LOCK TABLES `movie_stars` WRITE;
/*!40000 ALTER TABLE `movie_stars` DISABLE KEYS */;
INSERT INTO `movie_stars` VALUES (1,1),(1,2),(1,3),(2,4),(2,5),(3,5),(2,6),(3,7),(3,8),(4,9),(4,10),(4,11),(5,12),(5,13),(5,14),(6,15),(6,16),(6,17),(7,18),(7,19),(7,20),(8,21),(8,22),(8,23),(9,24),(12,24),(20,24),(9,25),(20,25),(9,26),(20,26),(10,27),(10,28),(10,29),(11,30),(16,30),(11,31),(16,31),(11,32),(16,32),(12,33),(12,34),(13,35),(13,36),(13,37),(14,38),(14,39),(14,40),(15,41),(15,42),(15,43),(17,44),(17,45),(17,46),(18,47),(18,48),(18,49),(19,50),(19,51),(19,52);
/*!40000 ALTER TABLE `movie_stars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movies`
--

DROP TABLE IF EXISTS `movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movies` (
  `movie_id` tinyint unsigned NOT NULL,
  `title` varchar(90) NOT NULL,
  `ranking` tinyint unsigned NOT NULL,
  `rating` float unsigned NOT NULL,
  `year` year NOT NULL,
  `votes` mediumint unsigned NOT NULL,
  `duration` smallint unsigned NOT NULL,
  `oscars` tinyint unsigned DEFAULT NULL,
  `budget` int unsigned NOT NULL,
  PRIMARY KEY (`movie_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies`
--

LOCK TABLES `movies` WRITE;
/*!40000 ALTER TABLE `movies` DISABLE KEYS */;
INSERT INTO `movies` VALUES (1,'The Shawshank Redemption',1,9.3,1994,964026,142,0,25000000),(2,'The Godfather',2,9.2,1972,686665,175,3,6000000),(3,'The Godfather: Part 2',3,9,1974,443397,200,6,13000000),(4,'Pulp Fiction',4,9,1994,749929,154,1,8000000),(5,'Il buono, il brutto, il cattivo.',5,9,1966,292458,161,1,1200000),(6,'12 Angry Men',6,8.9,1957,236958,96,0,350000),(7,'The Dark Knight',7,9,2008,937710,152,2,185000000),(8,'Schindler’s List',8,8.9,1993,494277,195,7,25000000),(9,'The Lord of the Rings: The Return of the King',9,8.9,2003,688334,201,11,94000000),(10,'Fight Club',10,8.9,1999,733668,139,0,63000000),(11,'Star Wars: Episode 5 – The Empire Strikes',11,8.8,1980,472269,124,1,18000000),(12,'The Lord of the Rings: The Fellowship of the Ring',12,8.8,2001,713058,178,4,93000000),(13,'One Flew Over the Cuckoo’s Nest',13,8.8,1975,402804,133,5,4400000),(14,'Inception',14,8.8,2010,752871,148,4,160000000),(15,'Goodfellas',15,8.8,1990,420360,146,1,25000000),(16,'Star Wars',16,8.8,1977,529356,121,6,11000000),(17,'Shichinin no samurai',17,8.8,1954,149094,207,0,2000000),(18,'Forrest Gump',18,8.7,1994,634110,142,6,55000000),(19,'The Matrix',19,8.7,1999,695310,136,4,63000000),(20,'The Lord of the Rings: The Two Towers',20,8.7,2002,617954,179,2,94000000);
/*!40000 ALTER TABLE `movies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producer_countries`
--

DROP TABLE IF EXISTS `producer_countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producer_countries` (
  `movie_id` tinyint unsigned NOT NULL,
  `country_id` tinyint unsigned NOT NULL,
  PRIMARY KEY (`movie_id`,`country_id`),
  KEY `fk_producer_countries_countries1_idx` (`country_id`),
  CONSTRAINT `fk_producer_countries_countries1` FOREIGN KEY (`country_id`) REFERENCES `countries` (`country_id`),
  CONSTRAINT `fk_producer_countries_movies` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`movie_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producer_countries`
--

LOCK TABLES `producer_countries` WRITE;
/*!40000 ALTER TABLE `producer_countries` DISABLE KEYS */;
INSERT INTO `producer_countries` VALUES (1,1),(2,1),(3,1),(4,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(18,1),(19,1),(20,1),(10,3),(5,4),(7,6),(14,6),(9,7),(12,7),(20,7),(17,10),(19,11);
/*!40000 ALTER TABLE `producer_countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stars`
--

DROP TABLE IF EXISTS `stars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stars` (
  `star_id` smallint unsigned NOT NULL,
  `country_id` tinyint unsigned NOT NULL,
  `star_name` varchar(45) NOT NULL,
  PRIMARY KEY (`star_id`),
  KEY `fk_stars_countries1_idx` (`country_id`),
  CONSTRAINT `fk_stars_countries1` FOREIGN KEY (`country_id`) REFERENCES `countries` (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stars`
--

LOCK TABLES `stars` WRITE;
/*!40000 ALTER TABLE `stars` DISABLE KEYS */;
INSERT INTO `stars` VALUES (1,1,'Tim Robbins'),(2,1,'Morgan Freeman'),(3,1,'Bob Gunton'),(4,1,'Marlon Brando'),(5,1,'Al Pacino'),(6,1,'James Caan'),(7,1,'Robert Duvall'),(8,1,'Diane Keaton'),(9,1,'John Travolta'),(10,1,'Samuel L. Jackson'),(11,3,'Bruce Willis'),(12,1,'Eli Wallach'),(13,1,'Clint Eastwood'),(14,1,'Lee Van Cleef'),(15,1,'Martin Balsam'),(16,1,'John Fieldler'),(17,1,'Lee J. Cobb'),(18,6,'Christian Bale'),(19,1,'Heath Ledger'),(20,1,'Aaron Eckhart'),(21,6,'Liam Neeson'),(22,6,'Ben Kingsley'),(23,6,'Ralph Fiennes'),(24,6,'Orlando Bloom'),(25,6,'Ian McKellen'),(26,1,'Viggo Mortensen'),(27,1,'Edward Norton'),(28,1,'Brad Pitt'),(29,6,'Helena Bonham Carter'),(30,1,'Mark Hamill'),(31,1,'Harrison Ford'),(32,1,'Carrie Fisher'),(33,1,'Elijah Wood'),(34,6,'Sean Bean'),(35,1,'Michael Berryman'),(36,1,'Peter Brocco'),(37,1,'Louise Fletcher'),(38,1,'Leonardo DiCaprio'),(39,1,'Joseph Gordon-Levitt'),(40,9,'Ellen Page'),(41,1,'Robert De Niro'),(42,1,'Ray Liotta'),(43,1,'Joe Pesci'),(44,10,'Toshiro Mifune'),(45,10,'Takashi Shimura'),(46,10,'Keiko Tsushima'),(47,1,'Tom Hanks'),(48,1,'Sally Field'),(49,1,'Robin Wright'),(50,12,'Keanu Reeves'),(51,1,'Laurence Fishburne'),(52,9,'Carrie-Anne Moss');
/*!40000 ALTER TABLE `stars` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-11  1:49:22
