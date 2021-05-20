CREATE DATABASE  IF NOT EXISTS `stationary` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `stationary`;
-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: stationary
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `admin_ID` varchar(20) NOT NULL,
  `admin_password` varchar(20) NOT NULL,
  PRIMARY KEY (`admin_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('JethalalGada','Jethiyo123');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `billing`
--

DROP TABLE IF EXISTS `billing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `billing` (
  `Bill_No` varchar(20) NOT NULL,
  `Prod_ID` varchar(20) NOT NULL,
  `Unit` int NOT NULL,
  `Tax` float DEFAULT NULL,
  `Tot_Price` float NOT NULL,
  `Cust_Name` varchar(20) NOT NULL,
  `Date` date NOT NULL,
  `Pay_Method` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Bill_No`),
  KEY `Cust_Name` (`Cust_Name`),
  CONSTRAINT `billing_ibfk_1` FOREIGN KEY (`Cust_Name`) REFERENCES `customer` (`Cust_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billing`
--

LOCK TABLES `billing` WRITE;
/*!40000 ALTER TABLE `billing` DISABLE KEYS */;
INSERT INTO `billing` VALUES ('1287987219','6776726367676',1,12,56,'DenishKalariya','2020-08-12','cash'),('1287988488','8782638761212',5,12,112,'FrodoBaggins','2020-07-12','cash'),('2322511472','9789381626818',3,12,336,'WalterWhite','2020-01-23','Paytm'),('4262879888','2487246481677',2,12,168,'JessyPinkman','2020-02-11','Gpay');
/*!40000 ALTER TABLE `billing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `Cust_Name` varchar(20) NOT NULL,
  `Cust_Address` varchar(50) DEFAULT NULL,
  `Cust_email` varchar(100) DEFAULT NULL,
  `Order_ID` varchar(20) NOT NULL,
  PRIMARY KEY (`Cust_Name`),
  KEY `Order_ID` (`Order_ID`),
  CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`Order_ID`) REFERENCES `order` (`Order_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES ('DenishKalariya','vadodara','denishkalariya@gmail.com','100-1223424-1276768'),('FrodoBaggins','Bag-end, the hobbit of the shire','myprecious@gmail.com','302-8648557-4247857'),('JessyPinkman','3828, pirmont, Albuquerque, New Mexico','pinkman@gmail.com','402-1223424-1233669'),('WalterWhite','308,Negra Arroyo lane, Albuquerque, New Mexico','heisenberg@gmail.com','402-6050134-8058720');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `Empl_ID` varchar(20) NOT NULL,
  `Empl_password` varchar(20) NOT NULL,
  `Empl_name` varchar(20) NOT NULL,
  `Empl_Salary` varchar(10) NOT NULL,
  `Date_join` date NOT NULL,
  `Empl_Contact` decimal(10,0) NOT NULL,
  `Empl_Address` varchar(50) NOT NULL,
  `Empl_ID_name_proof` varchar(20) NOT NULL,
  `Empl_ID_proof_No` varchar(20) NOT NULL,
  PRIMARY KEY (`Empl_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES ('Bagha','Bagha@Bavari','Bagheshrvar','5,000','2010-07-05',9428762738,'Near Padmavati Bhojnalaya, Mumbai ','Addhar Card','8638 8266 8227'),('Nattukaka','Pagar@Badhavo','NatavarlalUdhaivala','10,000','2004-03-13',9156286378,'Near Padmavati Bhojnalaya, Mumbai ','Addhar Card','1234 4567 8901');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login` (
  `admin_ID` varchar(20) NOT NULL,
  `Empl_ID` varchar(20) NOT NULL,
  `Login_history` varchar(20) NOT NULL,
  PRIMARY KEY (`Login_history`),
  KEY `admin_ID_idx` (`admin_ID`),
  KEY `Empl_ID` (`Empl_ID`),
  CONSTRAINT `login_ibfk_1` FOREIGN KEY (`admin_ID`) REFERENCES `admin` (`admin_ID`),
  CONSTRAINT `login_ibfk_2` FOREIGN KEY (`Empl_ID`) REFERENCES `employee` (`Empl_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES ('JethalalGada','Nattukaka',' Nattukaka9:29am'),('JethalalGada','Bagha','JethalalGada10:38am');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `Order_ID` varchar(20) NOT NULL,
  `Prod_ID` varchar(20) NOT NULL,
  `Order_Date` date NOT NULL,
  `Order_history` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Order_ID`),
  KEY `Prod_ID` (`Prod_ID`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`Prod_ID`) REFERENCES `product` (`Prod_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES ('100-1223424-1276768','2727182881728','2020-06-15',''),('142-2436516-6646273','9.98788E+12','2029-08-20','-'),('156-2522634-6646373','7.23659E+12','2029-08-20','-'),('230-5239526-3542836','9.71239E+12','2024-02-20','-'),('234-7368756-8283682','2.35294E+12','2007-03-20','-'),('265-3845815-4826365','7.26339E+12','2011-02-20','5'),('273-5092803-7523650','8.57629E+12','2001-01-20','-'),('273-6598273-5723359','7.23659E+12','2011-02-20','-'),('278-3846253-4234873','2.37563E+12','2029-08-20','-'),('287-3469283-9482344','9.98788E+12','2029-08-20','-'),('287-3523650-2375788','8.73556E+12','2001-01-20','-'),('287-5929358-0287268','8.72864E+12','2001-01-20','-'),('293-0982038-5972655','8.97359E+12','2007-03-20','-'),('302-8648557-4247857','2487246481677','2020-07-13','-'),('321-2412762-5414232','7.36486E+12','2011-06-20','6'),('347-6586239-8527355','6.7988E+12','2011-02-20','-'),('347-7877865-3541434','9.92876E+12','2021-05-20','-'),('355-6225361-8216762','9.71239E+12','2029-08-20','-'),('361-2638125-4146524','6.77673E+12','2011-06-20','-'),('365-4276734-2436833','7.36876E+12','2021-05-20','-'),('365-7387263-8756254','5.67574E+12','2012-07-20','1'),('366-5236579-7525455','7.32654E+12','2011-02-20','-'),('366-7236451-6241624','9.87929E+12','2021-05-20','5'),('374-6587398-5793597','6.65588E+12','2011-02-20','-'),('378-8465982-0983525','8.82573E+12','2007-03-20','-'),('402-1223424-1233669','6776726367676','2020-07-12',''),('402-6050134-8058720','9789381626818','2020-02-11',''),('452-3346578-9884567','9.86279E+12','2024-02-20','3'),('453-6463477-9934627','9.82357E+12','2024-02-20','-'),('457-6562374-9234534','9.78938E+12','2024-02-20','-'),('465-7635645-3238933','2.7376E+12','2015-06-20','-'),('485-7628765-8825232','2.36587E+12','2024-02-20','-'),('514-2312361-6235653','9.89763E+12','2011-06-20','-'),('541-2636125-3126563','8.82573E+12','2011-06-20','-'),('567-3546526-3542354','2.72718E+12','2015-06-20','-'),('624-7632374-9892384','2.33873E+12','2001-01-20','2'),('625-4238447-1654367','7.23659E+12','2029-08-20','-'),('627-5347634-7263434','9.89087E+12','2021-05-20','-'),('645-6375472-8349878','2.84654E+12','2013-07-20','-'),('645-7653642-3656263','2.76518E+12','2015-06-20','-'),('653-2248988-7865667','9.86687E+12','2024-02-20','4'),('653-3209305-2369255','8.79665E+12','2007-03-20','-'),('654-6757374-8273644','9.71239E+12','2011-06-20','-'),('662-3236253-4534613','9.89763E+12','2021-05-20','-'),('667-8233426-7328683','4.97358E+12','2012-07-20','-'),('736-5923587-2935505','6.77673E+12','2011-02-20','-'),('736-5925728-5982094','8.79927E+12','2007-03-20','-'),('743-6583498-5725754','5.87263E+12','2012-07-20','-'),('744-6556635-5575632','2.48725E+12','2015-06-20','-'),('747-5645736-8276329','2.65274E+12','2015-06-20','-'),('765-4725386-2983235','3.56538E+12','2013-07-20','-'),('768-5738465-8736465','2.36592E+12','2021-05-20','-'),('786-5828937-5987954','6.57357E+12','2012-07-20','-'),('827-6398235-9023557','8.76636E+12','2007-03-20','-'),('873-4656237-8623553','3.58424E+12','2012-07-20','-'),('875-6573657-8236582','3.95264E+12','2012-07-20','-'),('876-5754633-6564297','9.98788E+12','2021-05-20','-'),('878-3645687-6522355','2.36877E+12','2011-06-20','-'),('898-0345374-8650447','7.36876E+12','2001-01-20','-'),('982-7342372-3654783','7.36486E+12','2029-08-20','-'),('983-7456376-4565364','2.37627E+12','2015-06-20','3'),('983-7485626-3582354','2.97987E+12','2013-07-20','-'),('983-9803645-7309365','7.34658E+12','2001-01-20','-'),('984-7635862-6358623','3.56876E+12','2013-07-20','-'),('985-2739580-2335628','7.36486E+12','2001-01-20','-'),('987-3498758-6352836','2.86379E+12','2013-07-20','-'),('997-8762805-2359355','8.76562E+12','2007-03-20','-'),('998-7453674-5635254','2.37563E+12','2029-08-20','-'),('998-8776623-4263543','2.37563E+12','2011-06-20','-');
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order(1)`
--

DROP TABLE IF EXISTS `order(1)`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order(1)` (
  `Order_ID` text,
  `Prod_ID` double DEFAULT NULL,
  `Order_Date` text,
  `Order_history` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order(1)`
--

LOCK TABLES `order(1)` WRITE;
/*!40000 ALTER TABLE `order(1)` DISABLE KEYS */;
INSERT INTO `order(1)` VALUES ('100-1223424-1276768',2727180000000,'15-06-20','-'),('142-2436516-6646273',9987880000000,'29-08-20','-'),('156-2522634-6646373',7236590000000,'29-08-20','-'),('230-5239526-3542836',9712390000000,'24-02-20','-'),('234-7368756-8283682',2352940000000,'07-03-20','-'),('265-3845815-4826365',7263390000000,'11-02-20','5'),('273-5092803-7523650',8576290000000,'01-01-20','-'),('273-6598273-5723359',7236590000000,'11-02-20','-'),('278-3846253-4234873',2375630000000,'29-08-20','-'),('287-3469283-9482344',9987880000000,'29-08-20','-'),('287-3523650-2375788',8735560000000,'01-01-20','-'),('287-5929358-0287268',8728640000000,'01-01-20','-'),('293-0982038-5972655',8973590000000,'07-03-20','-'),('302-8648557-4247857',2487250000000,'13-07-20','-'),('321-2412762-5414232',7364860000000,'11-06-20','6'),('347-6586239-8527355',6798800000000,'11-02-20','-'),('347-7877865-3541434',9928760000000,'21-05-20','-'),('355-6225361-8216762',9712390000000,'29-08-20','-'),('361-2638125-4146524',6776730000000,'11-06-20','-'),('365-4276734-2436833',7368760000000,'21-05-20','-'),('365-7387263-8756254',5675740000000,'12-07-20','1'),('366-5236579-7525455',7326540000000,'11-02-20','-'),('366-7236451-6241624',9879290000000,'21-05-20','5'),('374-6587398-5793597',6655880000000,'11-02-20','-'),('378-8465982-0983525',8825730000000,'07-03-20','-'),('402-1223424-1233669',6776730000000,'12-07-20','-'),('402-6050134-8058720',9789380000000,'11-02-20','-'),('452-3346578-9884567',9862790000000,'24-02-20','3'),('453-6463477-9934627',9823570000000,'24-02-20','-'),('457-6562374-9234534',9789380000000,'24-02-20','-'),('465-7635645-3238933',2737600000000,'15-06-20','-'),('485-7628765-8825232',2365870000000,'24-02-20','-'),('514-2312361-6235653',9897630000000,'11-06-20','-'),('541-2636125-3126563',8825730000000,'11-06-20','-'),('567-3546526-3542354',2727180000000,'15-06-20','-'),('624-7632374-9892384',2338730000000,'01-01-20','2'),('625-4238447-1654367',7236590000000,'29-08-20','-'),('627-5347634-7263434',9890870000000,'21-05-20','-'),('645-6375472-8349878',2846540000000,'13-07-20','-'),('645-7653642-3656263',2765180000000,'15-06-20','-'),('653-2248988-7865667',9866870000000,'24-02-20','4'),('653-3209305-2369255',8796650000000,'07-03-20','-'),('654-6757374-8273644',9712390000000,'11-06-20','-'),('662-3236253-4534613',9897630000000,'21-05-20','-'),('667-8233426-7328683',4973580000000,'12-07-20','-'),('736-5923587-2935505',6776730000000,'11-02-20','-'),('736-5925728-5982094',8799270000000,'07-03-20','-'),('743-6583498-5725754',5872630000000,'12-07-20','-'),('744-6556635-5575632',2487250000000,'15-06-20','-'),('747-5645736-8276329',2652740000000,'15-06-20','-'),('765-4725386-2983235',3565380000000,'13-07-20','-'),('768-5738465-8736465',2365920000000,'21-05-20','-'),('786-5828937-5987954',6573570000000,'12-07-20','-'),('827-6398235-9023557',8766360000000,'07-03-20','-'),('873-4656237-8623553',3584240000000,'12-07-20','-'),('875-6573657-8236582',3952640000000,'12-07-20','-'),('876-5754633-6564297',9987880000000,'21-05-20','-'),('878-3645687-6522355',2368770000000,'11-06-20','-'),('898-0345374-8650447',7368760000000,'01-01-20','-'),('982-7342372-3654783',7364860000000,'29-08-20','-'),('983-7456376-4565364',2376270000000,'15-06-20','3'),('983-7485626-3582354',2979870000000,'13-07-20','-'),('983-9803645-7309365',7346580000000,'01-01-20','-'),('984-7635862-6358623',3568760000000,'13-07-20','-'),('985-2739580-2335628',7364860000000,'01-01-20','-'),('987-3498758-6352836',2863790000000,'13-07-20','-'),('997-8762805-2359355',8765620000000,'07-03-20','-'),('998-7453674-5635254',2375630000000,'29-08-20','-'),('998-8776623-4263543',2375630000000,'11-06-20','-');
/*!40000 ALTER TABLE `order(1)` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `Prod_ID` varchar(20) NOT NULL,
  `Prod_Type` varchar(20) NOT NULL,
  `Prod_Name` varchar(20) NOT NULL,
  `Prod_Price` int NOT NULL,
  PRIMARY KEY (`Prod_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES ('2.33873E+12','Water Bottle','Water Bottle',80),('2.35294E+12','Filing trays','Filing trays',15),('2.36587E+12','purple pen box','purple pen box',50),('2.36592E+12','pink pen box','pink pen box',50),('2.36877E+12','scissors','scissors',40),('2.37563E+12','calendar','calendar',40),('2.37627E+12','green pen box','green pen box',50),('2.48725E+12','Lab Journal','Chemistry Journal ',75),('2.65274E+12','spare leads','spare leads',10),('2.72718E+12','Drawing Book','Navneet Drawing Book',70),('2.7376E+12','plain  paper','plain  paper',10),('2.76518E+12','pen refill','pen refill',20),('2.84654E+12','notebook','notebook',20),('2.86379E+12','binder books','binder books',20),('2.97987E+12','highlighter','highlighter',20),('2487246481677','Lab Journal','Chemistry Journal ',75),('2727182881728','Drawing Book','Navneet Drawing Book',70),('3.56538E+12','colored pen','colored pen',60),('3.56876E+12','pencil box','pencil box',3),('3.58424E+12','Wall hooks','Wall hooks',50),('3.95264E+12','4 hole punch','4 hole punch',70),('4.97358E+12','stapler','stapler',60),('5.67574E+12','rubber bands','rubber bands',20),('5.87263E+12','3 ring Arch folders','3 ring Arch folders',30),('6.35765E+12','sharpener','sharpener',5),('6.57357E+12','File','File',10),('6.65588E+12','lable marker','lable marker',10),('6.77673E+12','Pen Box','Saino Softek',50),('6.7988E+12','paper clips','paper clips',30),('6.85284E+12','storage pockets','storage pockets',40),('6776726367676','Pen Box','Saino Softek',50),('7.23659E+12','ruled paper','ruled paper',30),('7.26339E+12','stamps','stamps',100),('7.32654E+12','eraser','eraser',5),('7.34658E+12','manila folders','manila folders',20),('7.36486E+12','red pen box','red pen box',50),('7.36876E+12','Envelopes','Envelopes',30),('7.46667E+12','drawing pins','drawing pins',20),('7.63673E+12','black pen box','black pen box',50),('7.65872E+12','plastic pockets','plastic pockets',30),('7.66592E+12','mechanical pencil','mechanical pencil',5),('7.67865E+12','Folder dividers','Folder dividers',10),('7.68756E+12','colored paper','colored paper',10),('7.69467E+12','2 hole punch ','2 hole punch ',50),('7.69879E+12','permanent marker','permanent marker',10),('7.76737E+12','stickey tap','stickey tap',10),('7.86235E+12','whiteboard marker','whiteboard marker',30),('7.8837E+12','blue pen box','blue pen box',50),('8.57629E+12','hanging files','hanging files',25),('8.7265E+12','scrapbook','scrapbook',40),('8.72864E+12','marker','marker',10),('8.73556E+12','Sticky lables','Sticky lables',10),('8.73985E+12','staples','staples',20),('8.76457E+12','art book','art book',40),('8.76562E+12','3 hole punch ','3 hole punch ',60),('8.76636E+12','2 ring Arch folders','2 ring Arch folders',20),('8.77667E+12','calulator','calulator',100),('8.79665E+12','glue','glue',10),('8.79927E+12','fluid','fluid',20),('8.82573E+12','yellow stickies','yellow stickies',15),('8.97359E+12','4 ring Arch folders','4 ring Arch folders',40),('9.71239E+12','liquid paper','liquid paper',10),('9.78938E+12','Reference Book','Computer Science ',100),('9.82357E+12','Index card','Index card',15),('9.86279E+12','Box cutter','Box cutter',40),('9.86687E+12','fold back clips','fold back clips',10),('9.87929E+12','packing tap','packing tap',20),('9.89087E+12','Colored pencils','Colored pencils',60),('9.89763E+12','dispencer','dispencer',10),('9.92876E+12','correction tape','correction tape',10),('9.98788E+12','ruler','ruler',20),('9789381626818','Reference Book','Computer Science ',100);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase`
--

DROP TABLE IF EXISTS `purchase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchase` (
  `Date_pur` date NOT NULL,
  `Supp_Name` varchar(100) NOT NULL,
  `Pur_history` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Date_pur`),
  KEY `Supp_Name` (`Supp_Name`),
  CONSTRAINT `purchase_ibfk_1` FOREIGN KEY (`Supp_Name`) REFERENCES `supplier` (`Supp_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase`
--

LOCK TABLES `purchase` WRITE;
/*!40000 ALTER TABLE `purchase` DISABLE KEYS */;
INSERT INTO `purchase` VALUES ('2020-01-02','Navneet Pvt. Ltd.','23 times '),('2020-01-10','Vishwas notebook Manufacturing','7 times '),('2020-01-28','All India Stationary Mart','9 times '),('2020-03-14','Classmate notebooks','21 times '),('2020-06-25','Navneet Pvt. Ltd.','24 times'),('2020-09-01','All India Stationary Mart','10 times');
/*!40000 ALTER TABLE `purchase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rack`
--

DROP TABLE IF EXISTS `rack`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rack` (
  `Rack_ID` varchar(20) NOT NULL,
  `Prod_ID` varchar(20) NOT NULL,
  PRIMARY KEY (`Rack_ID`),
  KEY `Prod_ID` (`Prod_ID`),
  CONSTRAINT `rack_ibfk_1` FOREIGN KEY (`Prod_ID`) REFERENCES `product` (`Prod_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rack`
--

LOCK TABLES `rack` WRITE;
/*!40000 ALTER TABLE `rack` DISABLE KEYS */;
INSERT INTO `rack` VALUES ('24872464','2487246481677'),('67767263','6776726367676'),('97893816','9789381626818');
/*!40000 ALTER TABLE `rack` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `selling`
--

DROP TABLE IF EXISTS `selling`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `selling` (
  `Sell_Date` date NOT NULL,
  `Prod_ID` varchar(20) NOT NULL,
  `Sell_history` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Sell_Date`),
  KEY `Prod_ID` (`Prod_ID`),
  CONSTRAINT `selling_ibfk_1` FOREIGN KEY (`Prod_ID`) REFERENCES `product` (`Prod_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `selling`
--

LOCK TABLES `selling` WRITE;
/*!40000 ALTER TABLE `selling` DISABLE KEYS */;
INSERT INTO `selling` VALUES ('2020-01-23','9789381626818','2nd time'),('2020-02-11','2487246481677','3rd time'),('2020-08-12','6776726367676','5th time');
/*!40000 ALTER TABLE `selling` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock` (
  `Stock_ID` varchar(20) NOT NULL,
  `Prod_ID` varchar(20) NOT NULL,
  `Avail_Prod` int NOT NULL,
  PRIMARY KEY (`Stock_ID`),
  KEY `Prod_ID` (`Prod_ID`),
  CONSTRAINT `stock_ibfk_1` FOREIGN KEY (`Prod_ID`) REFERENCES `product` (`Prod_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
INSERT INTO `stock` VALUES ('02001222','9789381626818',79),('11892001','6776726367676',101),('4020C187','2487246481677',20);
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier` (
  `Supp_Name` varchar(100) NOT NULL,
  `Prod_ID` varchar(20) NOT NULL,
  `Quantity_Prod` int NOT NULL,
  `Tot_Amount` int NOT NULL,
  `Date_Supp` date NOT NULL,
  PRIMARY KEY (`Supp_Name`),
  KEY `Prod_ID` (`Prod_ID`),
  CONSTRAINT `supplier_ibfk_1` FOREIGN KEY (`Prod_ID`) REFERENCES `product` (`Prod_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES ('All India Stationary Mart','6776726367676',15,600,'2020-02-05'),('Classmate notebooks','2727182881728',90,2250,'2020-08-14'),('Navneet Pvt. Ltd.','9789381626818',40,4000,'2020-01-06'),('Vishwas notebook Manufacturing','2487246481677',45,900,'2020-01-15');
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `website`
--

DROP TABLE IF EXISTS `website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `website` (
  `Seller_ID` varchar(20) NOT NULL,
  `Seller_password` varchar(20) NOT NULL,
  `web_name` varchar(20) NOT NULL,
  `admin_ID` varchar(20) NOT NULL,
  `Stock_ID` varchar(20) NOT NULL,
  PRIMARY KEY (`Seller_ID`),
  KEY `admin_ID` (`admin_ID`),
  KEY `Stock_ID` (`Stock_ID`),
  CONSTRAINT `website_ibfk_1` FOREIGN KEY (`admin_ID`) REFERENCES `admin` (`admin_ID`),
  CONSTRAINT `website_ibfk_2` FOREIGN KEY (`Stock_ID`) REFERENCES `stock` (`Stock_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `website`
--

LOCK TABLES `website` WRITE;
/*!40000 ALTER TABLE `website` DISABLE KEYS */;
INSERT INTO `website` VALUES ('JethalalGadaSeller','JethalalGada@seller','Amazon','JethalalGada','02001222');
/*!40000 ALTER TABLE `website` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'stationary'
--

--
-- Dumping routines for database 'stationary'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-20 12:26:55
