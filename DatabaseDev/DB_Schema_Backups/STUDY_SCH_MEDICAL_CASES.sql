-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: spineducation.c4pvr7du6l2b.us-east-2.rds.amazonaws.com    Database: STUDY_SCH
-- ------------------------------------------------------
-- Server version	5.6.35-log

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
-- Table structure for table `MEDICAL_CASES`
--

DROP TABLE IF EXISTS `MEDICAL_CASES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MEDICAL_CASES` (
  `CASE_ID` int(11) NOT NULL,
  `CASE_NAME` varchar(45) NOT NULL,
  `HISTORY` varchar(850) DEFAULT NULL,
  `PHYSICAL` varchar(850) DEFAULT NULL,
  `SURGICAL_CATG` varchar(45) DEFAULT NULL,
  `ANATOMICAL_REGION` varchar(45) DEFAULT NULL,
  `CREATE_DATE` datetime DEFAULT NULL,
  `CREATE_USER` varchar(45) DEFAULT NULL,
  `UPDATE_DATE` datetime DEFAULT NULL,
  `UPDATE_USER` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`CASE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MEDICAL_CASES`
--

LOCK TABLES `MEDICAL_CASES` WRITE;
/*!40000 ALTER TABLE `MEDICAL_CASES` DISABLE KEYS */;
INSERT INTO `MEDICAL_CASES` VALUES (0,'case zero','history zero ','physical zero','srugical zero','anatomical region zero',NULL,NULL,NULL,NULL),(1,'Case one','Presenting caption: 65F presents with a 1 day history of lower back pain and new onset incontinence.  While lifting a box in the garage she suffered sudden onset back pain, bilateral leg pain radiating down the posterior thigh.  She complains of new onset urinary incontinence and an inability to sense her bladder.   She denies fevers, chills, constitutional symptoms.','Vitals: Stable Gait: unable to ambulate Tone: normal\nPower: 3/5 throughout bilateral lower extremities\nReflexes 2+ bilateral knee jerk, ankle jerk\nSensation: reduced bilateral posterior thigh, medial lower leg\nSLR positive bilateral lower limb\nDRE: decreased voluntary tone\ndecreased perianal sensation\n','temporary surgical category','temp anatomical region',NULL,NULL,NULL,NULL),(2,'Case two','Presenting caption: 35M high speed MVC, with 45 minute prolonged extrication from vehicle.  The patient was wearing a seat belt and has been awake and cooperative throughout transport to hospital.  His vitals on scene were HR 110 BP 160/110 SaO2 95% on room air, RR 25','Vitals: Stable, Primary survey reveals a protected airway, symmetrical breath sounds bilaterally with good air entry. There is no subcutaneous emphysema. His abdomen is soft and nontender.  There are no long bone deformities.  On log roll, the patient has thoracolumbar pain to palpation with no step deformity.  Digital rectal exam reveals no blood, a palpable prostate and rectal tone is present. \nTertiary Neurological examination Power: 2/5 throughout bilateral lower extremities\nReflexes 4+ bilateral knee jerk, ankle jerk, babinski upward\nSensation: reduced bilateral posterior thigh, anteromedial thigh and lower legs bilaterally\n','temporary2','temp2',NULL,NULL,NULL,NULL),(3,'Case three','Presenting caption: 85M fell in playground playing with grand daughter.  He complains of severe neck pain.  He complains of mild parasthesias to the upper extremities with associated weakness and no symptoms in the legs.  ','Vitals: Stable  Tone: normal\nPower: 3/5 distally upper extremities 4/5 proximally in shoulder abduction, 5/5 lower limbs\nReflexes 2+ bilateral knee jerk, ankle jerk\nSensation: Nondermatomal patchy parasthesias in upper limbs. No sensory changes lower limbs.\n\n','temporary3','temp3',NULL,NULL,NULL,NULL),(4,'Case four','Presenting caption: 25M motorcycle vs car collision with loss of consciousness at scene. GCS 9 withdrawing to painful stimuli both upper extremities and left lower extremities.  Also noted to have a right knee dislocation on the scene.  ','Vitals: Stable  Reflexes difficult to elicit, no examination possible on right knee.  Left leg has normal ++ knee jerk with no clonus.  Rectal tone is normal.  After initial resuscitation pan-scan CT demonstrates subarachnoid and intraventricular bleeding, frontal lobe contusion\rReflexes difficult to elicit, no examination possible on right knee.  Left leg has normal ++ knee jerk with no clonus.  Rectal tone is normal.  After initial resuscitation pan-scan CT demonstrates subarachnoid and intraventricular bleeding, frontal lobe contusion\"','temporary4','temp4',NULL,NULL,NULL,NULL),(45,'Case five','TESTING','COOL STORY','temporasry5','temp5',NULL,NULL,NULL,NULL),(56,'Case six','temporary dec 22','temp december 22','temproary ','TEMP7',NULL,NULL,NULL,NULL),(76,'Case seven','testing on nov 17','testing on nov 17','temporary6','temp6',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `MEDICAL_CASES` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-23  1:43:35
