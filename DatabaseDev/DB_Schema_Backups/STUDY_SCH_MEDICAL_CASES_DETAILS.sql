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
-- Table structure for table `MEDICAL_CASES_DETAILS`
--

DROP TABLE IF EXISTS `MEDICAL_CASES_DETAILS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MEDICAL_CASES_DETAILS` (
  `CASE_ID` int(11) NOT NULL,
  `SECTION_ID` varchar(45) NOT NULL,
  `SECTION_NAME` varchar(45) NOT NULL,
  `SECTION_TEXT` varchar(850) NOT NULL,
  `IMAGE_FILE_NAMES` varchar(45) DEFAULT NULL,
  `CREATE_USER` varchar(45) DEFAULT NULL,
  `CREATE_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`CASE_ID`,`SECTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MEDICAL_CASES_DETAILS`
--

LOCK TABLES `MEDICAL_CASES_DETAILS` WRITE;
/*!40000 ALTER TABLE `MEDICAL_CASES_DETAILS` DISABLE KEYS */;
INSERT INTO `MEDICAL_CASES_DETAILS` VALUES (1,'1','HISTORY','Presenting caption: 65F presents with a 1 day history of lower back pain and new onset incontinence.  While lifting a box in the garage she suffered sudden onset back pain, bilateral leg pain radiating down the posterior thigh.  She complains of new onset urinary incontinence and an inability to sense her bladder.   She denies fevers, chills, constitutional symptoms.',NULL,NULL,NULL),(1,'2','PHYSICAL','Vitals: Stable Gait: unable to ambulate Tone: normal\rPower: 3/5 throughout bilateral lower extremities\rReflexes 2+ bilateral knee jerk, ankle jerk\rSensation: reduced bilateral posterior thigh, medial lower leg\rSLR positive bilateral lower limb\rDRE: decreased voluntary tone\rdecreased perianal sensation\rVitals: Stable Gait: unable to ambulate Tone: normal\rPower: 3/5 throughout bilateral lower extremities\rReflexes 2+ bilateral knee jerk, ankle jerk\rSensation: reduced bilateral posterior thigh, medial lower leg\rSLR positive bilateral lower limb\rDRE: decreased voluntary tone\rdecreased perianal sensation\r',NULL,NULL,NULL),(1,'3','XR','(C1XR1)',NULL,NULL,NULL),(1,'4','MRI','C1MRI1.jpeg C1MRI2.jpeg C1MRI3.jpeg C1MRI4.jpeg C1MRI5.jpeg C1MRI6.jpeg C1MRI7.jpeg','C1MRI1.jpeg C1MRI2.jpeg C1MRI3.jpeg C1MRI4.jp',NULL,NULL),(2,'1','HISTORY','Presenting caption: 35M high speed MVC, with 45 minute prolonged extrication from vehicle.  The patient was wearing a seat belt and has been awake and cooperative throughout transport to hospital.  His vitals on scene were HR 110 BP 160/110 SaO2 95% on room air, RR 25',NULL,NULL,NULL),(2,'2','PHYSICAL','Vitals: Stable, Primary survey reveals a protected airway, symmetrical breath sounds bilaterally with good air entry. There is no subcutaneous emphysema. His abdomen is soft and nontender.  There are no long bone deformities.  On log roll, the patient has thoracolumbar pain to palpation with no step deformity.  Digital rectal exam reveals no blood, a palpable prostate and rectal tone is present. \rTertiary Neurological examination Power: 2/5 throughout bilateral lower extremities\rReflexes 4+ bilateral knee jerk, ankle jerk, babinski upward\rSensation: reduced bilateral posterior thigh, anteromedial thigh and lower legs bilaterally\rVitals: Stable, Primary survey reveals a protected airway, symmetrical breath sounds bilaterally with good air entry. There is no subcutaneous emphysema. His abdomen is soft and nontender.  There are no long bone ',NULL,NULL,NULL),(2,'3','CT','3 files under L1burst under spine ap folder',NULL,NULL,NULL),(2,'4','POST OP PROMPT','Prompt: The surgeon elects to perform a short segment fusion with direct posterior decompression via transpedicular approach.',NULL,NULL,NULL),(2,'5','POST OP CT','(Under postop folder)',NULL,NULL,NULL),(3,'1','HISTORY','Presenting caption: 85M fell in playground playing with grand daughter.  He complains of severe neck pain.  He complains of mild parasthesias to the upper extremities with associated weakness and no symptoms in the legs.  ',NULL,NULL,NULL),(3,'2','PHYSICAL','\"Vitals: Stable  Tone: normal\rPower: 3/5 distally upper extremities 4/5 proximally in shoulder abduction, 5/5 lower limbs\rReflexes 2+ bilateral knee jerk, ankle jerk\rSensation: Nondermatomal patchy parasthesias in upper limbs. No sensory changes lower limbs.\r\"Vitals: Stable  Tone: normal\rPower: 3/5 distally upper extremities 4/5 proximally in shoulder abduction, 5/5 lower limbs\rReflexes 2+ bilateral knee jerk, ankle jerk\rSensation: Nondermatomal patchy parasthesias in upper limbs. No sensory changes lower limbs.\r\r\"',NULL,NULL,NULL),(3,'3','XR','(Dr kwok to retrieve xr)',NULL,NULL,NULL),(3,'4','CT','(Sample 002 file)',NULL,NULL,NULL),(3,'5','PROMPT','The patient is brought to the operating room for anterior fixation using cannulated odontoid screws',NULL,NULL,NULL),(3,'6','PROMPT','The patient successfully receives 2 cannulated anterior odontoid screws without complication. He is discharged home on post operative day 5 and follows up in clinic the following week','Show  files Week 1, 2,4, 8 etc',NULL,NULL),(4,'1','HISTORY','Presenting caption:  25M motorcycle vs car collision with loss of consciousness at scene. GCS 9 withdrawing to painful stimuli both upper extremities and left lower extremities.  Also noted to have a right knee dislocation on the scene.  ',NULL,NULL,NULL),(4,'2','PHYSICAL','Vitals: Stable - Reflexes difficult to elicit, no examination possible on right knee.  Left leg has normal ++ knee jerk with no clonus.  Rectal tone is normal.  After initial resuscitation pan-scan CT demonstrates subarachnoid and intraventricular bleeding, frontal lobe contusion',NULL,NULL,NULL),(4,'3','CT','coronal, sagital, coronal available under Adelan, Joseph',NULL,NULL,NULL),(4,'4','PROMPT','You decide to take this patient for operative fixation from occiput to C3',NULL,NULL,NULL),(4,'5','POST OP CT','(available)',NULL,NULL,NULL);
/*!40000 ALTER TABLE `MEDICAL_CASES_DETAILS` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-08 22:49:37
