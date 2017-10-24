-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: 127.0.0.1    Database: STUDY_SCH
-- ------------------------------------------------------
-- Server version	5.7.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `MULTIPLE_CHOICE_QS`
--

DROP TABLE IF EXISTS `MULTIPLE_CHOICE_QS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MULTIPLE_CHOICE_QS` (
  `MCQ_ID` int(11) NOT NULL,
  `CASE_ID` varchar(45) DEFAULT NULL COMMENT 'This MCQ may or may not belong to a case. \n0  for no case. ',
  `EDU_LVL` int(2) DEFAULT NULL,
  `QUESTION` varchar(450) NOT NULL,
  `OPTION_A` varchar(45) DEFAULT NULL,
  `OPTION_A_TRUE` varchar(45) DEFAULT NULL,
  `OPTION_B` varchar(45) DEFAULT NULL,
  `OPTION_B_TRUE` varchar(45) DEFAULT NULL,
  `OPTION_C` varchar(45) DEFAULT NULL,
  `OPTION_C_TRUE` varchar(45) DEFAULT NULL,
  `OPTION_D` varchar(45) DEFAULT NULL,
  `OPTION_D_TRUE` varchar(45) DEFAULT NULL,
  `FURTHER_DETAIL` varchar(450) DEFAULT NULL,
  `ANATC_REGION_ID` int(11) DEFAULT NULL,
  `CREATED_BY` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`MCQ_ID`),
  KEY `MULTIPLE_CHOICE_QS_FK_ANATC_CATG` (`ANATC_REGION_ID`),
  CONSTRAINT `MULTIPLE_CHOICE_QS_FK_ANATC_CATG` FOREIGN KEY (`ANATC_REGION_ID`) REFERENCES `anatc_catg` (`ANATC_REGION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MULTIPLE_CHOICE_QS`
--

LOCK TABLES `MULTIPLE_CHOICE_QS` WRITE;
/*!40000 ALTER TABLE `MULTIPLE_CHOICE_QS` DISABLE KEYS */;
INSERT INTO `MULTIPLE_CHOICE_QS` VALUES (1,'0',3,'Diffuse idiopathic skeletal hyperostosis ','Occurs in populations under the age of 40','false','is associated with marginal syndesmophytes','false','Ankylosis of the facets is rare','true','Is more common in the left thoracic spine ','false','Diffuse Idiopathic skeletal hyperostosis – common disorder, unknown etiology characterized by back pain and stiffness. Usually over 50 years, white population, most common RIGHT THORACIC spine (T7-11) but can occur anywhere, fusion anteriorly without ankyloses of facets and preservation of disc height.NON MARGINAL syndesmophytes and three successive levels involving 4 contiguous vertebrae.',NULL,'root@localhost'),(2,'0',3,'Which of the following are risk factors for development of diffuse idiopathic skeletal hyperostosis? Select all that are appropriate.','Hypertension','false','Gout','true','Dyslipidemia','true','Type 2 Diabeted Mellitis','true',NULL,NULL,'root@localhost'),(3,NULL,NULL,'testing',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `MULTIPLE_CHOICE_QS` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-10-17 11:07:19
