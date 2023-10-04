-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: recruitment agency
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `employee_id` int unsigned NOT NULL AUTO_INCREMENT,
  `second_name` varchar(45) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `patronymic` varchar(45) DEFAULT NULL,
  `phone_number` varchar(20) NOT NULL,
  `work_experience` int unsigned NOT NULL,
  `education` enum('Начальное','Среднее','Среднее специальное','Среднее полное','Высшее') DEFAULT NULL,
  `salary` int unsigned DEFAULT NULL,
  PRIMARY KEY (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Васильев','Николай','Алексеевич','79171853568',12,'Среднее полное',50000),(2,'Антонов','Владимир','Петрович','79271456133',24,'Высшее',90000),(3,'Гослинг','Райан',NULL,'79148562817',2,'Среднее',20000),(4,'Корнеплод','Виктор','Грибович','79171853568',5,'Среднее специальное',150000),(5,'Осокин','Даниил','Дмитриевич','79876661337',1,'Среднее специальное',40000),(6,'Обоев','Рулон','Штукарович','79694472598',15,'Начальное',30000),(7,'Помоев','Ушат','Аббасович','9991481583485',8,'Начальное',25000),(8,'Иванов','Иван','Иванович','79773251488',4,'Среднее полное',50000),(9,'Шпигель','Спайк',NULL,'815118742060',7,'Среднее специальное',60000),(10,'Уотерс','Роджер',NULL,'446664201488',50,'Высшее',700000);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_application`
--

DROP TABLE IF EXISTS `employee_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_application` (
  `application_id` int unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` int unsigned NOT NULL,
  `vacancy_id` int unsigned NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`application_id`),
  KEY `fk_vacancy_idx` (`vacancy_id`),
  KEY `fk_employee_idx` (`employee_id`),
  CONSTRAINT `fk_employee` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`),
  CONSTRAINT `fk_vacancy` FOREIGN KEY (`vacancy_id`) REFERENCES `vacancy` (`vacancy_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_application`
--

LOCK TABLES `employee_application` WRITE;
/*!40000 ALTER TABLE `employee_application` DISABLE KEYS */;
INSERT INTO `employee_application` VALUES (1,5,7,'2025-09-12'),(2,1,4,'2023-11-01'),(3,10,4,'1983-04-30'),(4,9,1,'2000-05-01'),(5,4,6,'2023-02-28'),(6,3,9,'2021-08-21'),(7,7,5,'2023-06-12'),(8,8,5,'2023-07-04'),(9,2,3,'2022-05-16'),(10,6,2,'2021-10-31');
/*!40000 ALTER TABLE `employee_application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employer`
--

DROP TABLE IF EXISTS `employer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employer` (
  `employer_id` int unsigned NOT NULL AUTO_INCREMENT,
  `employer_name` varchar(45) NOT NULL,
  `contact_second_name` varchar(45) NOT NULL,
  `contact_first_name` varchar(45) NOT NULL,
  `contact_patronymic` varchar(45) DEFAULT NULL,
  `phone_number` varchar(20) NOT NULL,
  PRIMARY KEY (`employer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employer`
--

LOCK TABLES `employer` WRITE;
/*!40000 ALTER TABLE `employer` DISABLE KEYS */;
INSERT INTO `employer` VALUES (1,'Рога и копыта','Пупкин','Василий','Васильевич','74951459736'),(2,'Вектор','Крутой','Крут','Крутович','79171853568'),(3,'Pink Floyd','Гилмор','Дэвид',NULL,'449996661337'),(4,'ФССП России','Важный','Андрей','Взяткович','78461582838'),(5,'Школа №666','Цветущая','Тамара','Эдуардовна','73435881746'),(6,'Хлебзавод №1','Боров','Кабан','Александрович','79995786421'),(7,'Радио Маяк','Круглова','Василиса','Вячеславовна','79271559878'),(8,'Valve','Ньюелл','Гейб',NULL,'15551281337'),(9,'Газпром','Елисеев','Кузьма','Мирославович','78005551514'),(10,'Домашние деньги','Толстый','Пётр','Коллектрович','78005553535');
/*!40000 ALTER TABLE `employer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employer_application`
--

DROP TABLE IF EXISTS `employer_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employer_application` (
  `application_id` int unsigned NOT NULL AUTO_INCREMENT,
  `employer_id` int unsigned NOT NULL,
  `vacancy_id` int unsigned NOT NULL,
  `requirments` text,
  `salary` int unsigned NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`application_id`),
  KEY `fk_vacancy_idx` (`vacancy_id`),
  KEY `fk_employer_idx` (`employer_id`),
  CONSTRAINT `fk_employer` FOREIGN KEY (`employer_id`) REFERENCES `employer` (`employer_id`),
  CONSTRAINT `fk_employer_vacancy` FOREIGN KEY (`vacancy_id`) REFERENCES `vacancy` (`vacancy_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employer_application`
--

LOCK TABLES `employer_application` WRITE;
/*!40000 ALTER TABLE `employer_application` DISABLE KEYS */;
INSERT INTO `employer_application` VALUES (1,6,10,'Не пить',27000,'2023-09-10'),(2,1,2,'Общительность',45000,'2022-08-24'),(3,8,7,'Знание алгоритмов и структур',15000,'2023-11-09'),(4,5,9,'Высшее образование',22000,'2020-05-21'),(5,2,6,'Внимательность и усидчивость',58000,'2023-06-25'),(6,3,4,'Не быть Роджером Уотерсом',200000,'1987-02-01'),(7,10,3,'IQ > 150',120000,'2021-01-08'),(8,9,5,'Выносливость',30000,'2022-12-24'),(9,4,8,'Высшее образование',40000,'2022-04-18'),(10,7,1,'Находчивость',35000,'2018-07-30');
/*!40000 ALTER TABLE `employer_application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sector`
--

DROP TABLE IF EXISTS `sector`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sector` (
  `sector_id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`sector_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sector`
--

LOCK TABLES `sector` WRITE;
/*!40000 ALTER TABLE `sector` DISABLE KEYS */;
INSERT INTO `sector` VALUES (1,'IT'),(2,'Медицина'),(3,'Государственная служба'),(4,'Добыча сырья'),(5,'Образование'),(6,'Искусство'),(7,'СМИ'),(8,'Производство'),(9,'Розничная торговля'),(10,'Финансы, бухгалтерия');
/*!40000 ALTER TABLE `sector` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vacancy`
--

DROP TABLE IF EXISTS `vacancy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vacancy` (
  `vacancy_id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `sector_id` int unsigned NOT NULL,
  PRIMARY KEY (`vacancy_id`),
  KEY `fk_sector_idx` (`sector_id`),
  CONSTRAINT `fk_sector` FOREIGN KEY (`sector_id`) REFERENCES `sector` (`sector_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vacancy`
--

LOCK TABLES `vacancy` WRITE;
/*!40000 ALTER TABLE `vacancy` DISABLE KEYS */;
INSERT INTO `vacancy` VALUES (1,'Ведущий радио',7),(2,'Продавец-консультант',9),(3,'Риск-аналитик',10),(4,'Бас-гитарист',6),(5,'Шахтёр',4),(6,'Фармацевт',2),(7,'C++ разработчик',1),(8,'Судебный пристав',3),(9,'Учитель начальных классов',5),(10,'Контролёр производственной линии',8);
/*!40000 ALTER TABLE `vacancy` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-04 21:13:51
