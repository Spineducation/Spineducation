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
-- Table structure for table `MULTIPLE_CHOICE_QS`
--

DROP TABLE IF EXISTS `MULTIPLE_CHOICE_QS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MULTIPLE_CHOICE_QS` (
  `MCQ_ID` int(11) NOT NULL,
  `CASE_ID` int(11) NOT NULL COMMENT 'This MCQ may or may not belong to a case. \n0  for no case. ',
  `EDU_LVL` int(2) DEFAULT NULL,
  `QUESTION` varchar(850) NOT NULL,
  `OPTION_A` varchar(450) DEFAULT NULL,
  `OPTION_A_TRUE` varchar(45) DEFAULT NULL,
  `OPTION_B` varchar(450) DEFAULT NULL,
  `OPTION_B_TRUE` varchar(45) DEFAULT NULL,
  `OPTION_C` varchar(450) DEFAULT NULL,
  `OPTION_C_TRUE` varchar(45) DEFAULT NULL,
  `OPTION_D` varchar(450) DEFAULT NULL,
  `OPTION_D_TRUE` varchar(45) DEFAULT NULL,
  `FURTHER_DETAIL` varchar(450) DEFAULT NULL,
  `ANATC_REGION_ID` int(11) DEFAULT NULL,
  `CREATED_BY` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`MCQ_ID`,`CASE_ID`),
  KEY `case_id_fk_idx` (`CASE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MULTIPLE_CHOICE_QS`
--

LOCK TABLES `MULTIPLE_CHOICE_QS` WRITE;
/*!40000 ALTER TABLE `MULTIPLE_CHOICE_QS` DISABLE KEYS */;
INSERT INTO `MULTIPLE_CHOICE_QS` VALUES (1,1,NULL,'Select a diagnosis.','Spinal stenosis',NULL,'Cauda equina','true','Degenerative scoliosis',NULL,'conus medullaris syndrome',NULL,NULL,NULL,NULL),(1,2,NULL,'Select a diagnosis.','L1 Axial compression injury',NULL,' Incomplete burst fracture of L1',NULL,'Complete burst of L1',NULL,'AO type C injury to L1',NULL,NULL,NULL,NULL),(1,3,NULL,'Select a diagnosis','More imaging is needed',NULL,'Hangman fracture',NULL,'Odontoid fracture','true','Unilateral facet jump',NULL,NULL,NULL,NULL),(2,1,NULL,'Select the most appropriate management','L3-5 central decompression and posterolateral fusion',NULL,'L4-5 central decompression, posterolateral instrumented fusion of L4-5','true','L4-5 transforaminal interbody fusion',NULL,'L3-5 central decompression with posterior lumbar interbody fusion',NULL,NULL,NULL,NULL),(2,2,NULL,'The TLIC classification of this injury suggests','Operative stabilization with decompression',NULL,' operative management',NULL,'Percutaneous stabilization',NULL,'Indirect decompression through ligamentotaxis',NULL,NULL,NULL,NULL),(2,3,NULL,'Select a diagnosis.','Type 1 odontoid',NULL,'Type 2 odontoid','true','Type 3 odontoid',NULL,'Os odontoidium',NULL,NULL,NULL,NULL),(3,1,NULL,'During the procedure a CSF leak is encountered. Select the appropriate management.','Water tight closure with 7-0 proline suture fixation, augmented with fibrin sealant','true','Fibrin glue analogue with direct compression until leak stops',NULL,'Water tight closure with 5-0 vicryl suture fixation, augmented with fibrin sealant',NULL,'Fat patch augmented closure using 7-0 proline suture fixation',NULL,NULL,NULL,NULL),(3,2,NULL,'The best approach for direct decompression of the central fragment in this patient is ','Trans-facet, pedicle sparing approach',NULL,'Transpedicular',NULL,'Direct posterior with retraction of the thecal sac',NULL,'Indirectly via ligamentotaxis',NULL,NULL,NULL,NULL),(3,3,NULL,'Fractures involving the superior articular facet of C2 are classified as ','Type 1 odontoid',NULL,'Type 2 odontoid',NULL,'Type 3 odontoid','true','',NULL,NULL,NULL,NULL),(4,1,NULL,'Which nerve root is most likely to be injured during this procedure?','L3 ',NULL,'L4 ',NULL,'L5 ','true','S1',NULL,NULL,NULL,NULL),(4,2,NULL,'Decompression from burst fracture fragments at L1 are treated similarly to those in the lower lumbar spine.','True ',NULL,'False ',NULL,'',NULL,'',NULL,NULL,NULL,NULL),(4,3,NULL,'The transverse ligament in this case is likely','Disrupted',NULL,'Intact','true','',NULL,'',NULL,NULL,NULL,NULL),(5,1,NULL,'Fluoroscopy is used to identify your level intraoperatively.  A penfield 4 is placed in the L4-5 interlaminar space.  This will point to which pedicle?','L3',NULL,'L4','true','L5 ',NULL,'S1',NULL,NULL,NULL,NULL),(5,2,NULL,'This is a common area of the spine to see this fracture morphology.','True ',NULL,'False ',NULL,'',NULL,'',NULL,NULL,NULL,NULL),(5,3,NULL,'Select the best treatment for this patient','Anterior odontoid screw','true','Posterior C1-2 fixation using C1 lateral mass C2 pars screws',NULL,'Occiput to C3 fusion',NULL,'Conservative management',NULL,NULL,NULL,NULL),(6,1,NULL,'A subtotal discectomy is performed and the patient is transported to the PACU safely.  Postoperatively they complain of numbness on the right thigh.  The most likely cause is','Meralgia pasasthetica','true','L2 nerve root tethering',NULL,'Stretch of the femoral nerve during positioning',NULL,'Compression of the lumbosacral plexus',NULL,NULL,NULL,NULL),(6,2,NULL,'Treating this fracture anteriorly','Involves diaphragmatic takedown, because the diaphragm attaches to the T12-L1 disc space',NULL,'Does not involvement diaphragm take down because it attaches at the level of the T12 body',NULL,'Does not involvement taking down the diaphragm because the diaphragm attaches at L1-2 disc space',NULL,'Involves taking down tthe diaphragm because it attaches to the T11-12 disc space',NULL,NULL,NULL,NULL),(6,3,NULL,'Which type of fluoroscopy would you like to call for? ','Flat plate XR',NULL,'Uniplanar fluoroscopy',NULL,'Biplanar fluoroscopy','true','No fluoroscopy',NULL,NULL,NULL,NULL),(7,1,NULL,'The superior facet attaches to the','Lamina',NULL,'Pedicle','true','Pars',NULL,'Spinous Process',NULL,NULL,NULL,NULL),(7,2,NULL,'In this post operative CT, the surgeon should be criticized for','A lateral breech of the left sided screw at T12',NULL,'Medial breech of the right sided screw at L2',NULL,'Incomplete reduction',NULL,'Insufficient bone grafting',NULL,NULL,NULL,NULL),(7,3,NULL,'The approach for C2 odontoid screw is best performed at','At the C2 skin level which is the hyoid superficially',NULL,'At the level of C3 which is the level of the hyoid',NULL,'At the level of C5 which is at the thyroid cartilage','true',' At the level of the C6 which is the cricoid tubercle superficially.',NULL,NULL,NULL,NULL),(8,2,NULL,'As the enters the T12 pedicle on the right side with the pedicle finder, he feels resistance at 30mm with a spongy quality. ','He is likely in the T11-12 disc space and should reorient the pedicle finder caudally',NULL,' He is likely in the T12-L1 disc space and should reorient the pedicle finder cranially',NULL,'He has breeched laterally into soft tissue and should reorient himself with fluoroscopy',NULL,'He has breeched medially into the cord and should rely on fluoroscopy for correction.',NULL,NULL,NULL,NULL),(8,3,NULL,'In the Grauer modification of Anderson and D\'Alonzo\'s classification of type 2 odontoid fractures they separate three types by morphology.  ','Grauer type A are best treated with odontoid screws',NULL,'Grauer type B are best treated with posterior stabilization',NULL,'Grauer type C fractures are best treated with odontoid screws',NULL,'Grauer A are best treated with external immobilization if nondisplaced','true',NULL,NULL,NULL),(9,2,NULL,'The anatomical start point of of a T12 pedicle screw is ','At the mamillary process',NULL,'A line intersecting the lateral pars and inferior transverse process',NULL,'A line intersecting midpoint transverse process at midpoint lamina',NULL,'A line intersecting medial pars at the inferior facet',NULL,NULL,NULL,NULL),(10,2,NULL,'The first lumbarized pars is typically at ','T11',NULL,'T12',NULL,'L1',NULL,'L2',NULL,NULL,NULL,NULL),(11,2,NULL,'The first lumbarized facet joint is at ','T11-T12',NULL,'T12-L1',NULL,'L1-L2',NULL,'L2-L3',NULL,NULL,NULL,NULL),(12,2,NULL,'What is an acceptable screw diameter for a T12 pedicle?','3.5mm',NULL,'4.5mm',NULL,'5.5mm',NULL,'7.5mm',NULL,NULL,NULL,NULL),(13,2,NULL,'Which of the following is not a structure in the posterior ligamentous complex (PLC) in the TLICs classification?','Supraspinous ligament',NULL,'Interspinous ligament',NULL,'Posterior longitudinal ligament',NULL,'Ligamentum flavum',NULL,NULL,NULL,NULL);
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

-- Dump completed on 2017-11-05 13:14:42
