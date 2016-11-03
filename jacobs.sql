-- MySQL dump 10.13  Distrib 5.7.16, for Linux (x86_64)
--
-- Host: localhost    Database: jacobs
-- ------------------------------------------------------
-- Server version	5.7.16-0ubuntu0.16.04.1

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
-- Table structure for table `Admin`
--

DROP TABLE IF EXISTS `Admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Admin` (
  `Member_ID` int(14) NOT NULL AUTO_INCREMENT,
  `Admin_ID` int(14) NOT NULL,
  `Admin_Role` enum('Super_administrator','Club_representative','Member') NOT NULL,
  PRIMARY KEY (`Admin_ID`),
  KEY `Member_ID` (`Member_ID`),
  CONSTRAINT `ISA_MemberAdmin` FOREIGN KEY (`Member_ID`) REFERENCES `Member` (`Member_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Admin`
--

LOCK TABLES `Admin` WRITE;
/*!40000 ALTER TABLE `Admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `Admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Belongs_to`
--

DROP TABLE IF EXISTS `Belongs_to`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Belongs_to` (
  `Club_ID` int(14) NOT NULL,
  `Member_ID` int(14) NOT NULL,
  `Join_Date` date NOT NULL,
  PRIMARY KEY (`Club_ID`,`Member_ID`),
  CONSTRAINT `Bt_WES` FOREIGN KEY (`Club_ID`) REFERENCES `Club` (`Club_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Belongs_to`
--

LOCK TABLES `Belongs_to` WRITE;
/*!40000 ALTER TABLE `Belongs_to` DISABLE KEYS */;
/*!40000 ALTER TABLE `Belongs_to` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Books`
--

DROP TABLE IF EXISTS `Books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Books` (
  `Books_ID` int(14) NOT NULL AUTO_INCREMENT,
  `Venue_ID` int(14) NOT NULL,
  `Club_ID` int(14) NOT NULL,
  `Member_ID` int(14) NOT NULL,
  PRIMARY KEY (`Books_ID`),
  KEY `Venue_ID` (`Venue_ID`),
  KEY `Club_ID` (`Club_ID`),
  KEY `Member_ID` (`Member_ID`),
  CONSTRAINT `Club_Books_Constr` FOREIGN KEY (`Club_ID`) REFERENCES `Club` (`Club_ID`),
  CONSTRAINT `Member_Books_Constr` FOREIGN KEY (`Member_ID`) REFERENCES `Member` (`Member_ID`),
  CONSTRAINT `Venue_Books_Constr` FOREIGN KEY (`Venue_ID`) REFERENCES `Venue` (`Venue_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Books`
--

LOCK TABLES `Books` WRITE;
/*!40000 ALTER TABLE `Books` DISABLE KEYS */;
/*!40000 ALTER TABLE `Books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Club`
--

DROP TABLE IF EXISTS `Club`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Club` (
  `Club_ID` int(14) NOT NULL AUTO_INCREMENT,
  `Club_Rep` varchar(30) NOT NULL,
  `Club_Name` varchar(50) NOT NULL,
  `Club_Contact` varchar(14) DEFAULT NULL,
  `Club_Email` varchar(60) NOT NULL,
  `Club_Description` text,
  PRIMARY KEY (`Club_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10100 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Club`
--

LOCK TABLES `Club` WRITE;
/*!40000 ALTER TABLE `Club` DISABLE KEYS */;
INSERT INTO `Club` VALUES (10000,'Axel Rutledge','Choir','12758854392','euismod.et@adipiscing.org','nec metus facilisis'),(10001,'Daphne Todd','Dolor Fusce Feugiat Consulting','15064671978','est.mollis.non@augueeutellus.com','aliquet molestie tellus. Aenean'),(10002,'Zelenia Lopez','Fusce Diam Nunc Company','9863574','montes.nascetur@variusultricesmauris.org','auctor'),(10003,'Kasper Vasquez','Fringilla Mi Lacinia Corporation','9479470','Suspendisse.dui@dignissim.com','et risus. Quisque libero lacus, varius et, euismod et,'),(10004,'Robin Battle','Vestibulum Massa Foundation','8220463','turpis.vitae.purus@dolornonummy.edu','sem ut cursus luctus,'),(10005,'James Cruz','Sit Amet Associates','6030558','pede.Praesent.eu@enim.ca','eu dolor egestas rhoncus. Proin nisl sem,'),(10006,'Kiona Trevino','Porttitor Scelerisque Foundation','6174101','lacus.Nulla.tincidunt@inconsequat.com','Nullam enim. Sed nulla'),(10007,'Blossom Keller','Vitae Semper Ltd','1046735','enim.condimentum@estMauriseu.com','molestie'),(10008,'Kim Irwin','Dapibus Id Blandit Inc.','14961790366','magna.et.ipsum@Nuncsollicitudincommodo.co.uk','montes, nascetur ridiculus mus. Proin vel arcu eu odio'),(10009,'Dai Gould','Dui Ltd','5373920','Fusce.mollis@ipsumsodalespurus.com','eget ipsum. Suspendisse sagittis. Nullam vitae diam. Proin dolor.'),(10010,'Daria Hebert','In Scelerisque Scelerisque Consulting','17019313894','quam.Curabitur@tellus.edu','erat. Etiam vestibulum massa rutrum magna. Cras convallis convallis dolor.'),(10011,'Kendall Cash','Sed Corp.','15632053900','ante@Suspendisse.edu','id, ante. Nunc mauris sapien, cursus in,'),(10012,'Audra Richardson','Vulputate Eu Odio Inc.','4272342','congue.turpis.In@etnetus.org','nascetur ridiculus mus. Proin'),(10013,'Maggie Cortez','Malesuada Augue Ut Associates','1961035','Etiam.bibendum@tincidunt.org','bibendum'),(10014,'Halee Cantrell','Mi Pede LLC','8455389','arcu@maurisutmi.net','sodales elit erat vitae risus. Duis a mi'),(10015,'Sarah Rivas','Fringilla Cursus Purus Corp.','19697012226','molestie.dapibus@arcuVivamussit.com','rhoncus id, mollis nec, cursus a, enim.'),(10016,'Cheyenne Reid','Euismod Mauris Associates','11261539182','dignissim@eratneque.edu','enim. Mauris quis turpis vitae purus'),(10017,'Sara Hurley','Vitae Risus Company','19859774216','eu.tellus@infaucibusorci.com','In condimentum. Donec at'),(10018,'Noelani Hartman','Enim Foundation','1409872','amet@diamDuismi.com','at fringilla purus mauris a nunc.'),(10019,'Emery Thornton','Gravida Aliquam Tincidunt Consulting','1605480','iaculis.quis@turpisnecmauris.ca','ultrices sit amet, risus. Donec nibh enim, gravida sit'),(10020,'Blake Hartman','Tempus Non Consulting','4013647','felis.ullamcorper.viverra@magnaPraesentinterdum.net','mollis nec, cursus a, enim. Suspendisse'),(10021,'Derek Patton','Ut Pharetra Sed Corp.','5350074','ipsum.Curabitur.consequat@luctus.com','sed orci'),(10022,'Norman Mathis','Et Rutrum Corporation','11396229159','magna.sed@metusIn.org','fermentum'),(10023,'Harper Cook','Interdum Sed Limited','15601063082','Mauris.ut@ultriciesligula.co.uk','egestas ligula. Nullam feugiat placerat velit. Quisque varius. Nam'),(10024,'Gay Kidd','Nisi Aenean Eget Corporation','7341873','urna.Nullam.lobortis@uteros.org','dui. Fusce diam nunc, ullamcorper'),(10025,'Victor Palmer','Pellentesque Ut Ipsum Foundation','9353458','tortor@nislarcu.net','gravida. Praesent eu nulla at sem'),(10026,'Erasmus Whitney','Porttitor Interdum Sed Corp.','14228267298','libero@odioAliquamvulputate.com','eleifend nec, malesuada ut, sem. Nulla interdum. Curabitur dictum. Phasellus'),(10027,'Elaine Ferrell','Massa Non Ante Institute','5063778','facilisis.lorem.tristique@lobortis.co.uk','sociosqu ad litora torquent per'),(10028,'Ryder Parrish','Euismod Company','7714628','Integer.id.magna@nisiAenean.co.uk','metus. In nec orci. Donec nibh.'),(10029,'Jada Pugh','Mauris Inc.','16655576153','In.condimentum@Integer.ca','placerat, orci lacus vestibulum lorem,'),(10030,'Kirby Mckee','Sit Amet Diam Limited','1743732','nisi@Suspendisse.net','fermentum fermentum arcu. Vestibulum ante ipsum primis in'),(10031,'Lenore Velazquez','Erat Associates','19431822492','amet@arcuVestibulumante.com','mauris. Suspendisse aliquet molestie tellus. Aenean egestas hendrerit neque. In'),(10032,'Whitney Cooke','Sed Congue Elit Incorporated','9891951','ultricies@lacus.net','Donec egestas. Duis ac arcu. Nunc mauris.'),(10033,'Chadwick Snow','Tincidunt Pede Ac Associates','3216891','et.nunc@eleifend.net','Maecenas iaculis aliquet diam.'),(10034,'Maris Beasley','Posuere LLP','2318948','eu@lectusantedictum.edu','enim nisl elementum purus, accumsan interdum'),(10035,'August Langley','Imperdiet Ornare LLP','1092011','Nunc@et.edu','id enim. Curabitur massa. Vestibulum accumsan neque et'),(10036,'Alexis Sharpe','Sem Consequat Nec Industries','17446671999','libero.Proin.sed@Nunclectus.com','eleifend egestas.'),(10037,'Rogan Reyes','Cras Institute','6895089','non@vitae.co.uk','In nec orci.'),(10038,'Cara Bishop','Nibh Donec Associates','12282650640','Vivamus.molestie@elit.org','nonummy'),(10039,'Adele Bradford','Diam Associates','17048191552','vitae.aliquet@volutpatnuncsit.com','Duis cursus,'),(10040,'Cynthia Suarez','Felis Adipiscing Fringilla Industries','14331391218','velit.Aliquam.nisl@vulputaterisus.edu','eget, venenatis a,'),(10041,'Driscoll Roy','Mattis Ltd','12016535041','Aenean@Maurisvestibulum.net','cursus in, hendrerit consectetuer,'),(10042,'Kim Gibson','Est Mollis Foundation','3172730','nunc.risus@neccursus.com','tristique senectus et netus et malesuada fames ac'),(10043,'Talon Wilson','Donec Tempor Incorporated','7038447','Pellentesque@Nam.ca','commodo'),(10044,'Abbot Rich','Sodales Limited','4110602','mi@natoquepenatibuset.ca','Donec egestas. Aliquam nec enim. Nunc ut erat. Sed nunc'),(10045,'Gwendolyn Delaney','Sit Amet Limited','18029837055','dictum@Suspendisse.co.uk','Fusce dolor quam, elementum at, egestas'),(10046,'Dillon Villarreal','Ornare Elit PC','16132451969','enim.condimentum@aliquetdiam.com','Vivamus non lorem vitae'),(10047,'Price Finley','Cras Eget Nisi Institute','14343987547','arcu.Vestibulum.ut@atortor.org','Maecenas malesuada fringilla est. Mauris eu turpis. Nulla'),(10048,'Thane Barlow','Venenatis Vel Institute','12004677869','dui@dolorsitamet.com','primis in faucibus orci luctus et ultrices posuere cubilia Curae;'),(10049,'Mari Thomas','Sem Pellentesque Ut Industries','8641315','dictum@Fusce.com','Proin'),(10050,'Ferris Herman','Scelerisque Sed Ltd','12435782765','ligula.tortor.dictum@libero.co.uk','est. Mauris eu turpis. Nulla'),(10051,'Akeem Parker','Donec Fringilla Incorporated','18815598277','quam.Pellentesque@tempus.co.uk','Integer id magna et ipsum cursus'),(10052,'Orli Munoz','Mollis Non Cursus LLP','2762503','molestie.tortor@Donec.org','mollis non, cursus non, egestas a, dui.'),(10053,'Mannix Taylor','Aliquam Ornare Corporation','15208752263','sit@Namnullamagna.org','lacus.'),(10054,'Craig Michael','Eu Incorporated','4446902','Cras.vulputate@pretium.org','ut ipsum ac mi eleifend egestas. Sed pharetra,'),(10055,'Evelyn Kinney','Ut Dolor Dapibus Consulting','13269712504','gravida.mauris@Quisqueimperdieterat.net','nisi. Cum sociis natoque penatibus et magnis'),(10056,'Cairo Fowler','Curabitur Ut Odio Incorporated','5793513','molestie@egestaslacinia.com','Ut tincidunt vehicula'),(10057,'Rhoda Cervantes','Quisque Company','15052273633','eu.dolor.egestas@sagittis.edu','risus. Donec egestas.'),(10058,'Yuli Goodwin','Massa Ltd','5656606','Integer.in@venenatisvel.net','lobortis augue scelerisque mollis. Phasellus libero mauris, aliquam'),(10059,'Kermit Ruiz','Augue Ac Corp.','19159776555','elit.pharetra@ornaretortorat.edu','urna suscipit nonummy. Fusce'),(10060,'Blaze Little','Erat Neque LLC','7093444','quis@scelerisqueneque.co.uk','egestas hendrerit neque.'),(10061,'Thomas David','Adipiscing Lobortis Industries','7829385','eget.volutpat@purusNullam.com','molestie sodales. Mauris blandit enim consequat purus. Maecenas libero'),(10062,'Aristotle Ellison','Ante Dictum Mi Limited','2398792','nisl.Nulla@eleifendvitae.co.uk','lobortis'),(10063,'Fuller Alford','Ullamcorper Corp.','5387071','non@neccursus.edu','nibh vulputate mauris sagittis placerat. Cras'),(10064,'Dora Barber','Consectetuer LLP','7246634','felis.eget@rhoncusid.net','augue ac ipsum. Phasellus vitae'),(10065,'Ralph Christian','Leo Ltd','13502087944','Fusce.aliquet@faucibus.com','arcu. Aliquam ultrices iaculis odio. Nam interdum'),(10066,'Amanda Washington','Tortor At Risus Foundation','2109843','enim.nisl@scelerisqueloremipsum.net','Nulla tincidunt, neque'),(10067,'Zenaida Ferguson','Ipsum Company','14859063021','mauris@Aliquamerat.org','vitae semper egestas, urna justo faucibus lectus,'),(10068,'Devin Sanders','Mauris Magna Duis Limited','2016843','nulla.vulputate.dui@fermentumrisus.edu','cursus,'),(10069,'Ian Battle','Nunc Ac Sem Consulting','12652074067','eleifend.vitae.erat@mauris.edu','consequat enim diam vel arcu.'),(10070,'Gil Trevino','Eget Ipsum Corp.','5749168','In.nec@arcu.org','arcu.'),(10071,'Wyoming Alvarez','Aliquam Nec Limited','2906310','Donec.porttitor@cursusNuncmauris.edu','eu odio tristique'),(10072,'Hammett French','Elit Company','19918938334','ipsum.sodales.purus@sodales.net','primis in faucibus orci luctus et ultrices posuere cubilia Curae;'),(10073,'Wyoming Garrison','Posuere Cubilia Curae; LLP','6545873','Quisque@Pellentesqueutipsum.ca','Morbi metus. Vivamus'),(10074,'Raven Roth','Lorem Donec Elementum Company','9946249','auctor.quis@enim.net','egestas a,'),(10075,'Damian York','Arcu Ltd','12382441253','ac@a.edu','augue'),(10076,'Silas Hampton','A Magna Lorem Corp.','5324881','massa@VivamusnisiMauris.edu','sed libero. Proin sed turpis'),(10077,'Bell Clements','Posuere Cubilia Curae; LLC','16162352711','mi@mauris.co.uk','erat semper rutrum. Fusce dolor quam,'),(10078,'Emmanuel Pratt','Velit Sed Malesuada Limited','19429590546','amet.consectetuer@Etiamlaoreet.net','pharetra sed, hendrerit'),(10079,'Zachery Baxter','Lobortis Incorporated','3817556','ipsum@Duisa.edu','sed, hendrerit a, arcu. Sed et'),(10080,'Randall Robles','Eu Industries','17568532706','eu@ornare.net','vitae nibh. Donec est mauris, rhoncus id, mollis nec,'),(10081,'Rajah Mcgowan','Elit Industries','16223226645','eu.odio@ametdapibus.ca','posuere vulputate, lacus. Cras interdum. Nunc sollicitudin commodo ipsum.'),(10082,'Kendall Ellison','Sodales Industries','14113209935','sem@Quisqueimperdiet.org','quis arcu vel quam dignissim pharetra. Nam ac nulla.'),(10083,'Boris Ballard','Vulputate Corporation','19014187150','vel.nisl@dignissimpharetra.ca','laoreet lectus quis massa. Mauris vestibulum, neque sed dictum'),(10084,'Boris Cochran','Mauris Ipsum Porta Institute','3887376','vitae@felisegetvarius.co.uk','facilisi. Sed'),(10085,'Ariel Mcintyre','Ante Dictum Limited','5883556','mi.fringilla.mi@sapienmolestie.co.uk','iaculis aliquet'),(10086,'Freya Estes','Tincidunt Nunc LLC','16883686774','turpis@placeratorcilacus.edu','congue. In scelerisque scelerisque dui.'),(10087,'Remedios Ball','Dui Fusce Aliquam Associates','15129468445','ligula@eratvolutpatNulla.net','pharetra ut, pharetra sed, hendrerit'),(10088,'Edan Mckee','Primis In Faucibus Corp.','7905916','sociis.natoque.penatibus@metus.org','vehicula risus. Nulla'),(10089,'Dara Mclaughlin','Faucibus Ltd','17812779031','Sed@auctorMaurisvel.co.uk','arcu. Morbi sit amet massa. Quisque porttitor eros'),(10090,'Brandon Kidd','Purus Gravida Incorporated','19986664847','consequat.nec.mollis@commodoauctor.edu','tristique pellentesque, tellus sem'),(10091,'Bo Ware','Elit Elit Inc.','2415817','Pellentesque.ut.ipsum@purussapien.org','eu dui. Cum sociis'),(10092,'Denton Salas','Purus Corporation','12549717290','Sed.eu@sociisnatoquepenatibus.net','eget nisi dictum augue malesuada malesuada. Integer id'),(10093,'Octavius Sullivan','Cursus Nunc Mauris Ltd','14188346715','eget@nibhAliquam.net','in felis. Nulla tempor'),(10094,'Kaitlin Norton','Arcu Foundation','6743864','ullamcorper.magna.Sed@dictum.co.uk','Duis a'),(10095,'Cade Schultz','Tellus Limited','1258150','Fusce.fermentum@feugiatSed.edu','ultricies ligula. Nullam enim. Sed'),(10096,'Lisandra Benton','At PC','14945804313','fringilla@duiFusce.com','dolor'),(10097,'Deanna Boyle','Porta Elit A Company','3247539','arcu@magnisdisparturient.com','Nullam vitae diam.'),(10098,'Karleigh Craft','Pharetra Industries','17392315946','amet.massa.Quisque@Donecfeugiat.edu','enim non nisi. Aenean eget'),(10099,'Uriel Alford','Ipsum Corporation','11838779674','cubilia.Curae.Donec@penatibusetmagnis.co.uk','convallis, ante lectus convallis est, vitae sodales nisi magna sed');
/*!40000 ALTER TABLE `Club` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Enquiry`
--

DROP TABLE IF EXISTS `Enquiry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Enquiry` (
  `Enquiry_ID` int(14) NOT NULL,
  `Responding_Club_ID` int(14) NOT NULL,
  `Request_ID` int(14) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Enquiry`
--

LOCK TABLES `Enquiry` WRITE;
/*!40000 ALTER TABLE `Enquiry` DISABLE KEYS */;
/*!40000 ALTER TABLE `Enquiry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Event`
--

DROP TABLE IF EXISTS `Event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Event` (
  `Event_ID` int(14) NOT NULL AUTO_INCREMENT,
  `Event_Title` varchar(50) NOT NULL,
  `Venue_ID` int(14) NOT NULL,
  `Event_Date` date NOT NULL,
  `Event_Starttime` time NOT NULL,
  `Event_Endtime` time NOT NULL,
  `Club_ID` int(14) NOT NULL,
  PRIMARY KEY (`Event_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Event`
--

LOCK TABLES `Event` WRITE;
/*!40000 ALTER TABLE `Event` DISABLE KEYS */;
/*!40000 ALTER TABLE `Event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `External_Request`
--

DROP TABLE IF EXISTS `External_Request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `External_Request` (
  `External_Request_ID` int(14) NOT NULL AUTO_INCREMENT,
  `Club_ID` int(14) NOT NULL,
  `NAMES` varchar(55) NOT NULL,
  `Email` int(11) NOT NULL,
  `Contact_Number` varchar(20) NOT NULL,
  `Description` varchar(300) NOT NULL,
  `Surname` varchar(55) NOT NULL,
  PRIMARY KEY (`External_Request_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `External_Request`
--

LOCK TABLES `External_Request` WRITE;
/*!40000 ALTER TABLE `External_Request` DISABLE KEYS */;
/*!40000 ALTER TABLE `External_Request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Goes_to`
--

DROP TABLE IF EXISTS `Goes_to`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Goes_to` (
  `Request_ID` int(11) NOT NULL,
  `Club_ID` int(11) NOT NULL,
  `Member_ID` int(11) NOT NULL,
  PRIMARY KEY (`Request_ID`,`Club_ID`),
  KEY `Club_ID` (`Club_ID`),
  CONSTRAINT `Club_ID` FOREIGN KEY (`Club_ID`) REFERENCES `Club` (`Club_ID`),
  CONSTRAINT `Request_ID` FOREIGN KEY (`Request_ID`) REFERENCES `Request` (`Request_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Goes_to`
--

LOCK TABLES `Goes_to` WRITE;
/*!40000 ALTER TABLE `Goes_to` DISABLE KEYS */;
/*!40000 ALTER TABLE `Goes_to` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Has`
--

DROP TABLE IF EXISTS `Has`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Has` (
  `ClubID` int(14) NOT NULL,
  `Venue_ID` int(14) NOT NULL,
  `Event_ID` int(14) NOT NULL,
  `HAS_ID` int(14) NOT NULL,
  `Starttime` time NOT NULL,
  `Endtime` time NOT NULL,
  `Dayoftheweek` date NOT NULL,
  PRIMARY KEY (`HAS_ID`),
  KEY `Venue_ID` (`Venue_ID`),
  KEY `Event_ID` (`Event_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Has`
--

LOCK TABLES `Has` WRITE;
/*!40000 ALTER TABLE `Has` DISABLE KEYS */;
/*!40000 ALTER TABLE `Has` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Has_A`
--

DROP TABLE IF EXISTS `Has_A`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Has_A` (
  `Has_A_ID` int(11) NOT NULL AUTO_INCREMENT,
  `EventID` int(11) NOT NULL,
  `Venue_ID` int(11) NOT NULL,
  `Club_ID` int(11) NOT NULL,
  PRIMARY KEY (`Has_A_ID`),
  CONSTRAINT `Has_A_ibfk_1` FOREIGN KEY (`Has_A_ID`) REFERENCES `Event` (`Event_ID`),
  CONSTRAINT `Has_A_ibfk_2` FOREIGN KEY (`Has_A_ID`) REFERENCES `Venue` (`Venue_ID`),
  CONSTRAINT `Has_A_ibfk_3` FOREIGN KEY (`Has_A_ID`) REFERENCES `Club` (`Club_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Has_A`
--

LOCK TABLES `Has_A` WRITE;
/*!40000 ALTER TABLE `Has_A` DISABLE KEYS */;
/*!40000 ALTER TABLE `Has_A` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Holds`
--

DROP TABLE IF EXISTS `Holds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Holds` (
  `Holds_ID` int(14) NOT NULL AUTO_INCREMENT,
  `Club_ID` int(14) NOT NULL,
  `Event_ID` int(14) NOT NULL,
  PRIMARY KEY (`Holds_ID`),
  UNIQUE KEY `Club_ID` (`Club_ID`),
  UNIQUE KEY `Event_ID` (`Event_ID`),
  CONSTRAINT `Holds_ibfk_1` FOREIGN KEY (`Club_ID`) REFERENCES `Club` (`Club_ID`),
  CONSTRAINT `Holds_ibfk_2` FOREIGN KEY (`Event_ID`) REFERENCES `Event` (`Event_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Holds`
--

LOCK TABLES `Holds` WRITE;
/*!40000 ALTER TABLE `Holds` DISABLE KEYS */;
/*!40000 ALTER TABLE `Holds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IsDirectedTo`
--

DROP TABLE IF EXISTS `IsDirectedTo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IsDirectedTo` (
  `isDirectedTo_ID` int(14) NOT NULL AUTO_INCREMENT,
  `Club_ID` int(14) NOT NULL,
  `External_Request_ID` int(14) NOT NULL,
  PRIMARY KEY (`isDirectedTo_ID`),
  KEY `External_Request_ID` (`External_Request_ID`),
  KEY `Club_ID` (`Club_ID`),
  CONSTRAINT `Club_IsDirected_Constr` FOREIGN KEY (`Club_ID`) REFERENCES `Club` (`Club_ID`),
  CONSTRAINT `ExtReq_IsDirected_Constr` FOREIGN KEY (`External_Request_ID`) REFERENCES `External_Request` (`External_Request_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IsDirectedTo`
--

LOCK TABLES `IsDirectedTo` WRITE;
/*!40000 ALTER TABLE `IsDirectedTo` DISABLE KEYS */;
/*!40000 ALTER TABLE `IsDirectedTo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Join_Request`
--

DROP TABLE IF EXISTS `Join_Request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Join_Request` (
  `Join_Requst_ID` int(14) NOT NULL AUTO_INCREMENT,
  `Reason` varchar(55) NOT NULL,
  `Previous_Experience` text NOT NULL,
  `Member_ID` int(14) NOT NULL,
  `Request_ID` int(14) NOT NULL,
  PRIMARY KEY (`Join_Requst_ID`),
  KEY `Request_ID` (`Request_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Join_Request`
--

LOCK TABLES `Join_Request` WRITE;
/*!40000 ALTER TABLE `Join_Request` DISABLE KEYS */;
/*!40000 ALTER TABLE `Join_Request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Leisure_Facility`
--

DROP TABLE IF EXISTS `Leisure_Facility`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Leisure_Facility` (
  `Venue_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Facility_Purpose` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Venue_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Leisure_Facility`
--

LOCK TABLES `Leisure_Facility` WRITE;
/*!40000 ALTER TABLE `Leisure_Facility` DISABLE KEYS */;
/*!40000 ALTER TABLE `Leisure_Facility` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Login`
--

DROP TABLE IF EXISTS `Login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Login` (
  `Login_ID` int(14) NOT NULL AUTO_INCREMENT,
  `Username` varchar(20) NOT NULL,
  `Password` varchar(20) NOT NULL,
  PRIMARY KEY (`Login_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Login`
--

LOCK TABLES `Login` WRITE;
/*!40000 ALTER TABLE `Login` DISABLE KEYS */;
/*!40000 ALTER TABLE `Login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Make`
--

DROP TABLE IF EXISTS `Make`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Make` (
  `Make_ID` int(14) NOT NULL AUTO_INCREMENT,
  `Member_ID` int(14) NOT NULL,
  `Request_ID` int(14) NOT NULL,
  PRIMARY KEY (`Make_ID`),
  KEY `Member_ID` (`Member_ID`),
  KEY `Request_ID` (`Request_ID`),
  CONSTRAINT `RequestMakeConstr` FOREIGN KEY (`Request_ID`) REFERENCES `Request` (`Request_ID`),
  CONSTRAINT `memberMake_Constr` FOREIGN KEY (`Member_ID`) REFERENCES `Member` (`Member_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Make`
--

LOCK TABLES `Make` WRITE;
/*!40000 ALTER TABLE `Make` DISABLE KEYS */;
/*!40000 ALTER TABLE `Make` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Member`
--

DROP TABLE IF EXISTS `Member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Member` (
  `Member_ID` int(14) NOT NULL AUTO_INCREMENT,
  `Member_Lastname` varchar(30) NOT NULL,
  `Member_Firstname` varchar(30) NOT NULL,
  `Member_Email` varchar(50) NOT NULL,
  `Member_Address` varchar(100) NOT NULL,
  `Member_Type` enum('Undergraduate','Graduate','Staff','') NOT NULL,
  `Member_Mobile` varchar(20) NOT NULL,
  PRIMARY KEY (`Member_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Member`
--

LOCK TABLES `Member` WRITE;
/*!40000 ALTER TABLE `Member` DISABLE KEYS */;
INSERT INTO `Member` VALUES (1,'Jael','Myra','aliquet.nec@semvitae.org','3968 Mauris St.','Graduate','16540704-6324'),(2,'Bruce','Isadora','lorem.vitae.odio@cubilia.ca','2522 Elit, Ave','Undergraduate','16320226-2170'),(3,'Drew','Whilemina','gravida@Suspendissealiquet.org','Ap #142-6463 Cras Rd.','Undergraduate','16580519-7364'),(4,'Fletcher','Darius','vulputate.velit.eu@luctussit.ca','P.O. Box 981, 3210 Tortor. Street','Undergraduate','16150428-2532'),(5,'Jared','Jorden','quis@esttempor.co.uk','P.O. Box 452, 5766 Pharetra. Road','Graduate','16970103-1107'),(6,'Aretha','Sylvester','Cras.dolor@infaucibus.ca','489-9958 Tellus Street','Undergraduate','16370716-7288'),(7,'Ann','Jayme','Nunc.pulvinar.arcu@velarcu.edu','153-3852 Luctus Street','Undergraduate','16971122-2258'),(8,'Plato','Freya','hendrerit@lacinia.co.uk','8843 Vulputate Ave','Undergraduate','16610812-2091'),(9,'Clinton','Gavin','vitae.erat.vel@luctus.com','Ap #999-7429 Amet, Rd.','Undergraduate','16260305-6850'),(10,'Amanda','Norman','magna.sed@auctor.net','P.O. Box 593, 3982 Sollicitudin Road','Staff','16720914-9827'),(11,'Madonna','Brian','elit.Nulla.facilisi@lacusvestibulum.com','P.O. Box 749, 4753 Metus Av.','Undergraduate','16550826-2663'),(12,'Marah','Steven','Sed.eu.eros@ligulatortor.com','5245 Accumsan St.','Staff','16340929-5734'),(13,'Sara','Jonah','consequat.lectus.sit@etlacinia.ca','Ap #299-7180 Adipiscing Avenue','Staff','16251107-1553'),(14,'Montana','Hyacinth','dolor.Donec.fringilla@sem.net','P.O. Box 515, 4622 Sit Av.','Graduate','16200611-6103'),(15,'Ria','Nehru','mi.tempor.lorem@lacinia.ca','361-6547 Nonummy. St.','Graduate','16210805-9987'),(16,'Dakota','Caryn','lobortis@tinciduntnunc.org','9423 Magna. Rd.','Staff','16380613-6432'),(17,'Wynne','Melyssa','luctus.aliquet@nec.edu','P.O. Box 962, 4907 Nunc Road','Undergraduate','16441123-8258'),(18,'Gil','Kessie','risus@ametrisus.net','P.O. Box 745, 3317 Molestie Rd.','Staff','16880115-0528'),(19,'Igor','Sylvia','molestie.pharetra@ultricies.ca','396-3302 Rutrum Rd.','Graduate','16180801-4920'),(20,'Dawn','Zachary','Donec@ullamcorpervelit.co.uk','Ap #865-7485 Sit Rd.','Undergraduate','16131026-6752'),(21,'Summer','Denise','elit@aliquetodioEtiam.net','P.O. Box 599, 3490 Sem Rd.','Graduate','16211121-7895'),(22,'Bree','Rina','Aliquam.nec.enim@urnaNunc.net','450-2930 Laoreet Avenue','Undergraduate','16671123-2477'),(23,'Nell','Cadman','dis.parturient@consectetuer.org','989-7077 Eu St.','Graduate','16110904-8304'),(24,'Benedict','Logan','ac@scelerisque.com','229-8677 Non, St.','Graduate','16640701-1417'),(25,'Fleur','Jaden','Donec.tempor.est@neceleifend.com','7650 Eget Av.','Staff','16010328-4683'),(26,'Serina','Dieter','est.arcu.ac@DonecfringillaDonec.net','Ap #833-7573 A, Avenue','Staff','16100315-7623'),(27,'Justina','Barry','Morbi@molestietortornibh.ca','P.O. Box 145, 8543 Est. Avenue','Undergraduate','16881111-6378'),(28,'Mariam','Vanna','nibh.Aliquam.ornare@dui.edu','P.O. Box 892, 293 Hendrerit Street','Undergraduate','16270327-0195'),(29,'Stacey','Shelby','eleifend@condimentumegetvolutpat.net','P.O. Box 924, 739 Magna. St.','Staff','16310119-1553'),(30,'Elmo','Levi','cursus.a@vehicula.org','P.O. Box 648, 8324 Magna Ave','Staff','16970505-0707'),(31,'Kylynn','Renee','porttitor.interdum.Sed@nequevitae.com','Ap #960-7976 Auctor. Road','Staff','16690207-5396'),(32,'Olivia','Connor','placerat.orci.lacus@ipsumPhasellus.edu','515-3488 Sit Rd.','Undergraduate','16531002-0697'),(33,'Beatrice','Dorian','eu.turpis@consectetuer.edu','916-2334 Nunc. Av.','Graduate','16920916-5613'),(34,'Aileen','Xena','Vestibulum.accumsan@risus.ca','5952 Faucibus Rd.','Undergraduate','16921227-3990'),(35,'Fritz','Hashim','Phasellus.at@nonluctussit.com','P.O. Box 749, 3154 Nonummy Av.','Graduate','16780402-3468'),(36,'Ronan','Ferdinand','semper@odioEtiamligula.ca','Ap #723-1563 Porta Street','Undergraduate','16530127-1218'),(37,'Stephanie','Blair','Nunc.ullamcorper@sem.org','794-9471 Vitae Rd.','Undergraduate','16580321-6521'),(38,'Imani','Tad','volutpat.Nulla.facilisis@nectempusmauris.edu','Ap #302-8074 Justo. St.','Graduate','16021005-5711'),(39,'Kirestin','Lenore','gravida.molestie@eratvitae.org','270-396 Quis Av.','Undergraduate','16830821-0569'),(40,'Cleo','Holmes','sed.dui@commodoauctorvelit.org','2358 Blandit. Road','Undergraduate','16571225-7384'),(41,'Karina','Roary','vitae@nibhDonecest.com','Ap #186-4491 Nam St.','Staff','16210922-2733'),(42,'Rooney','Natalie','a.purus@nec.com','8327 Fermentum St.','Undergraduate','16990622-2493'),(43,'Austin','Mariko','Etiam.imperdiet.dictum@aliquet.co.uk','902 Nec St.','Undergraduate','16831121-8013'),(44,'Beck','Belle','gravida@adipiscing.org','373-1892 Tellus. Avenue','Graduate','16940418-9806'),(45,'Vivien','Roanna','Vestibulum.ante.ipsum@quismassaMauris.edu','P.O. Box 769, 1715 Eleifend. Street','Staff','16401102-0627'),(46,'Lewis','Owen','Maecenas@Quisque.net','669-5700 Commodo Av.','Staff','16791210-4879'),(47,'Dominic','Halla','sagittis@idnuncinterdum.com','756-4263 Urna, St.','Graduate','16560105-3951'),(48,'Nevada','Rosalyn','egestas.hendrerit.neque@elementumduiquis.edu','1468 Orci Rd.','Staff','16800914-8472'),(49,'Portia','Rhoda','elit.pede.malesuada@nonenimMauris.com','562-4092 Ut St.','Undergraduate','16180112-9576'),(50,'Kimberley','Adrienne','tristique.ac.eleifend@semmollis.edu','P.O. Box 441, 4803 Sed Rd.','Staff','16930516-2506'),(51,'Rebekah','Noble','non@condimentumDonec.net','2232 Lacinia Rd.','Graduate','16920612-1783'),(52,'Lance','Georgia','penatibus.et.magnis@egestas.ca','Ap #610-1673 Aenean Road','Undergraduate','16350607-4628'),(53,'Carolyn','Aphrodite','magna@Etiamvestibulum.com','Ap #687-292 Pretium Ave','Undergraduate','16900408-6170'),(54,'Christopher','Uta','senectus@at.ca','Ap #325-6272 Ipsum Ave','Undergraduate','16260323-4960'),(55,'Tallulah','Britanney','ornare.placerat@aliquet.org','P.O. Box 780, 9667 Phasellus St.','Graduate','16291018-7752'),(56,'Hayden','Carl','lacinia.vitae.sodales@adui.co.uk','Ap #530-7710 Tempor Rd.','Undergraduate','16390120-4036'),(57,'Penelope','Nash','ullamcorper.nisl@necanteblandit.com','Ap #806-2561 Phasellus Ave','Undergraduate','16961218-2767'),(58,'Joelle','Phelan','dolor.dapibus@nequesed.edu','8435 Sem. Ave','Graduate','16941126-1051'),(59,'Dorothy','Piper','pede.Suspendisse@egettinciduntdui.net','862-1002 Quisque Avenue','Graduate','16810130-7240'),(60,'Carl','Aurelia','nec.malesuada@MaurismagnaDuis.net','Ap #699-4466 Fusce Av.','Graduate','16660228-6178'),(61,'Curran','Alisa','accumsan@iaculis.org','3229 Consectetuer, Road','Staff','16581126-2145'),(62,'Molly','Flavia','Maecenas.iaculis.aliquet@egestas.com','1746 Diam Rd.','Staff','16660107-2389'),(63,'Gannon','Teagan','vel.venenatis.vel@Suspendissetristiqueneque.net','P.O. Box 711, 272 Consequat Avenue','Graduate','16271024-5743'),(64,'Amanda','Cassandra','Curae.Phasellus.ornare@infaucibusorci.edu','Ap #742-1112 Posuere St.','Graduate','16350127-5980'),(65,'Maggy','Odessa','quam.Pellentesque@idmollis.com','Ap #285-8628 Quisque Avenue','Undergraduate','16201104-9463'),(66,'Jessica','Ocean','nec.euismod@eu.org','P.O. Box 578, 7214 Integer Avenue','Undergraduate','16380105-1933'),(67,'Skyler','Malachi','auctor.vitae.aliquet@velitSedmalesuada.org','P.O. Box 965, 2829 Aliquet, Av.','Undergraduate','16410602-2025'),(68,'Abdul','Reagan','vehicula.Pellentesque@lacus.co.uk','P.O. Box 848, 1952 Nisi Ave','Undergraduate','16840429-1646'),(69,'Chloe','Amal','Donec.feugiat@pharetrafeliseget.edu','1180 Faucibus Rd.','Undergraduate','16351011-0376'),(70,'Lucius','Kelly','nec@euultricessit.net','P.O. Box 972, 1110 Proin St.','Staff','16961014-5873'),(71,'Yoko','Vernon','luctus.Curabitur.egestas@tellus.net','644 Risus. Street','Undergraduate','16200416-3925'),(72,'Eve','Doris','Mauris@lobortisrisus.co.uk','P.O. Box 762, 8115 Eros. Street','Graduate','16061002-5140'),(73,'Porter','Zelenia','metus@venenatislacusEtiam.edu','P.O. Box 481, 3388 Porttitor Street','Staff','16890130-3662'),(74,'Jaquelyn','Denise','dictum@sodales.edu','Ap #949-8435 Ut Ave','Staff','16040615-5556'),(75,'Tiger','Noah','taciti@dolorsit.org','Ap #811-5589 Pellentesque St.','Undergraduate','16950729-3067'),(76,'Ori','Burke','Suspendisse@Integersemelit.net','Ap #948-8123 Neque Avenue','Undergraduate','16621104-5395'),(77,'Leilani','Jin','feugiat.placerat@dignissimlacus.com','Ap #711-9644 Sed Ave','Graduate','16991228-5856'),(78,'Brynn','Thaddeus','Quisque.purus@quisdiam.com','110-3755 Eget Street','Undergraduate','16131002-3591'),(79,'Hillary','Bertha','gravida.Praesent.eu@Suspendisse.com','415-3999 Pede. Avenue','Staff','16530426-0440'),(80,'Yuri','Charity','Lorem.ipsum@pede.org','3982 Vulputate St.','Graduate','16430724-1002'),(81,'Candace','Chaney','Nullam.vitae@orciconsectetuer.org','842-2106 Ipsum Ave','Undergraduate','16151206-7537'),(82,'TaShya','Morgan','imperdiet@Sedidrisus.edu','988-1782 Et, Avenue','Undergraduate','16180606-6773'),(83,'Zeph','Wendy','interdum.feugiat@atlibero.edu','P.O. Box 823, 710 Euismod Rd.','Graduate','16470816-8242'),(84,'Hilary','Whitney','est.tempor@Cras.edu','P.O. Box 754, 2680 Nam Rd.','Staff','16900513-9671'),(85,'Ethan','Brittany','lacus@ridiculusmusAenean.edu','4513 Adipiscing St.','Graduate','16341118-8182'),(86,'Mira','Henry','dignissim.Maecenas.ornare@tortornibh.net','P.O. Box 202, 6200 Risus. Ave','Staff','16131206-3512'),(87,'Flavia','Buffy','faucibus.leo@non.edu','8720 Enim, Avenue','Graduate','16030316-6755'),(88,'Lucas','Micah','amet.diam@molestietellusAenean.org','P.O. Box 307, 1731 Pede. St.','Staff','16971224-1208'),(89,'Gisela','Rana','lorem.tristique@tellussem.ca','9813 Vestibulum Av.','Graduate','16300723-1131'),(90,'Alden','James','scelerisque.lorem.ipsum@pede.org','Ap #924-8838 Ipsum Ave','Undergraduate','16331110-5856'),(91,'Karly','Curran','libero.dui.nec@eunibh.com','151-7424 Accumsan Av.','Staff','16270609-5391'),(92,'Lavinia','Patrick','venenatis.lacus@cursusin.net','1174 In Rd.','Graduate','16460922-7998'),(93,'Reed','Calista','faucibus.orci.luctus@a.edu','631-9813 Amet St.','Graduate','16370604-8851'),(94,'Montana','Ainsley','Pellentesque@molestie.edu','P.O. Box 626, 9596 Dui, Road','Undergraduate','16110312-3020'),(95,'Sade','Asher','urna.Nullam.lobortis@leo.net','P.O. Box 823, 5963 Cras St.','Graduate','16511127-8809'),(96,'Rogan','Larissa','nibh.sit.amet@liberoMorbi.net','P.O. Box 535, 3151 Amet Rd.','Graduate','16521025-7027'),(97,'Jerome','James','mus.Donec.dignissim@eratvitae.edu','3563 Tellus Road','Graduate','16230907-1898'),(98,'Aileen','Lucian','sed@anteblandit.com','Ap #926-1107 Amet Road','Graduate','16671004-7462'),(99,'Hunter','Inez','congue@tempuslorem.edu','982-8642 Enim, Avenue','Undergraduate','16420824-9161'),(100,'Hanae','Keith','porttitor@sedlibero.edu','4783 Lobortis Road','Staff','16390502-9926');
/*!40000 ALTER TABLE `Member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Pays`
--

DROP TABLE IF EXISTS `Pays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Pays` (
  `Pays_ID` int(14) NOT NULL AUTO_INCREMENT,
  `Member_ID` int(14) NOT NULL,
  `Club_ID` int(14) NOT NULL,
  `Subscription_ID` int(14) NOT NULL,
  PRIMARY KEY (`Pays_ID`),
  KEY `Subscription_ID` (`Subscription_ID`),
  KEY `Club_ID` (`Club_ID`),
  KEY `Member_ID` (`Member_ID`),
  CONSTRAINT `Club_Pays_Constr` FOREIGN KEY (`Club_ID`) REFERENCES `Club` (`Club_ID`),
  CONSTRAINT `Member_Pays_Constr` FOREIGN KEY (`Member_ID`) REFERENCES `Member` (`Member_ID`),
  CONSTRAINT `Sub_Pays_Constr` FOREIGN KEY (`Subscription_ID`) REFERENCES `Subscription` (`Subscription_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pays`
--

LOCK TABLES `Pays` WRITE;
/*!40000 ALTER TABLE `Pays` DISABLE KEYS */;
/*!40000 ALTER TABLE `Pays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Request`
--

DROP TABLE IF EXISTS `Request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Request` (
  `Request_ID` int(14) NOT NULL AUTO_INCREMENT,
  `Member_ID` int(14) NOT NULL,
  `Club_ID` int(14) NOT NULL,
  `Description` varchar(300) NOT NULL,
  `Request_Date` date NOT NULL,
  PRIMARY KEY (`Request_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Request`
--

LOCK TABLES `Request` WRITE;
/*!40000 ALTER TABLE `Request` DISABLE KEYS */;
/*!40000 ALTER TABLE `Request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Retrieves`
--

DROP TABLE IF EXISTS `Retrieves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Retrieves` (
  `Login_ID` int(30) NOT NULL,
  `Member_ID` int(14) NOT NULL,
  PRIMARY KEY (`Login_ID`,`Member_ID`),
  CONSTRAINT `R_WES` FOREIGN KEY (`Login_ID`) REFERENCES `Login` (`Login_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Retrieves`
--

LOCK TABLES `Retrieves` WRITE;
/*!40000 ALTER TABLE `Retrieves` DISABLE KEYS */;
/*!40000 ALTER TABLE `Retrieves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Subscription`
--

DROP TABLE IF EXISTS `Subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Subscription` (
  `Subscription_ID` int(14) NOT NULL AUTO_INCREMENT,
  `Member_ID` int(14) NOT NULL,
  `Club_ID` int(11) NOT NULL,
  `Amount` int(10) NOT NULL,
  `Academic_Year` int(11) NOT NULL,
  `Semester` enum('Fall','Spring') NOT NULL,
  `Last_Payment_Date` datetime NOT NULL,
  PRIMARY KEY (`Subscription_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=65861 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Subscription`
--

LOCK TABLES `Subscription` WRITE;
/*!40000 ALTER TABLE `Subscription` DISABLE KEYS */;
INSERT INTO `Subscription` VALUES (65761,40390,426214,4872,2016,'Fall','2011-11-07 01:02:56'),(65762,767797,458100,6867,2011,'Spring','2012-06-06 04:39:04'),(65763,564561,661749,4365,2011,'Fall','2009-02-01 19:49:06'),(65764,38103,382871,2278,2008,'Spring','2015-01-08 07:59:31'),(65765,220965,101571,5811,2010,'Spring','2015-03-19 18:18:16'),(65766,770415,599756,3777,2011,'Spring','2014-04-12 02:19:25'),(65767,466277,549057,5957,2014,'Spring','2013-11-08 12:21:15'),(65768,670771,293361,4293,2015,'Fall','2014-09-21 04:24:40'),(65769,500136,84386,470,2011,'Fall','2011-10-23 03:57:40'),(65770,90516,652170,1632,2010,'Spring','2017-02-27 11:08:48'),(65771,480633,667704,1792,2006,'Fall','2016-11-17 13:36:31'),(65772,508089,987911,5789,2015,'Fall','2010-10-06 08:14:10'),(65773,844973,323776,4102,2017,'Fall','2016-05-21 08:48:39'),(65774,350837,24949,1198,2019,'Spring','2017-07-29 20:02:33'),(65775,219565,565103,3725,2009,'Fall','2010-01-05 19:40:50'),(65776,651179,979514,2536,2008,'Fall','2016-09-11 18:31:08'),(65777,149767,553585,6542,2016,'Spring','2009-12-17 18:29:37'),(65778,594058,422823,8821,2009,'Fall','2013-02-18 08:43:31'),(65779,935891,836319,4472,2008,'Fall','2016-12-24 11:13:35'),(65780,653,737190,5086,2006,'Fall','2012-02-08 06:12:37'),(65781,490740,486177,8769,2007,'Fall','2017-09-10 09:03:55'),(65782,706271,358555,1419,2011,'Spring','2014-01-10 09:09:36'),(65783,937540,227581,2348,2016,'Fall','2017-08-30 13:50:44'),(65784,971953,917682,5310,2011,'Spring','2011-08-12 01:14:51'),(65785,387398,433144,7235,2016,'Spring','2015-07-12 09:23:29'),(65786,416319,359876,2389,2009,'Fall','2013-01-03 00:40:40'),(65787,249941,571916,4636,2011,'Fall','2016-11-10 18:07:34'),(65788,944966,841609,2727,2006,'Fall','2015-03-25 04:18:25'),(65789,881366,190894,6050,2014,'Spring','2010-03-04 18:11:59'),(65790,640735,646053,8251,2012,'Spring','2011-06-25 22:28:52'),(65791,753,316227,785,2008,'Fall','2009-06-18 16:27:19'),(65792,683523,903357,5529,2010,'Fall','2010-07-04 08:52:03'),(65793,153,300622,6027,2015,'Fall','2009-08-14 11:16:35'),(65794,736114,857910,1458,2015,'Fall','2016-12-20 22:26:32'),(65795,13420,497160,4116,2016,'Fall','2014-07-13 19:31:28'),(65796,745466,505266,2649,2008,'Fall','2009-09-02 20:39:21'),(65797,434027,340165,3603,2007,'Fall','2013-02-18 00:20:07'),(65798,940651,145456,1655,2015,'Spring','2017-05-21 16:24:53'),(65799,383590,564240,4197,2015,'Spring','2017-08-06 10:40:22'),(65800,823948,266368,6463,2006,'Fall','2013-04-02 12:05:20'),(65801,611692,590770,423,2007,'Fall','2010-11-04 15:25:15'),(65802,794476,442382,7234,2013,'Fall','2016-12-24 18:47:55'),(65803,272365,314086,2498,2006,'Spring','2016-06-27 05:55:40'),(65804,851839,659937,5305,2006,'Spring','2009-09-09 20:00:48'),(65805,22006,852777,7543,2011,'Spring','2017-04-12 06:34:16'),(65806,19341,819383,6956,2017,'Spring','2016-05-26 15:46:00'),(65807,152640,44782,5604,2013,'Fall','2010-06-04 18:40:28'),(65808,775484,718552,6355,2017,'Fall','2008-10-18 14:00:39'),(65809,400503,683914,5002,2006,'Fall','2017-05-06 22:11:27'),(65810,834226,260048,6653,2008,'Fall','2016-05-29 09:46:12'),(65811,458104,322404,4616,2017,'Spring','2013-01-18 10:14:26'),(65812,903565,615223,7044,2007,'Fall','2015-07-07 01:24:16'),(65813,470486,423666,5565,2007,'Spring','2011-09-05 19:19:18'),(65814,92209,57452,5209,2012,'Spring','2012-12-21 09:43:46'),(65815,28403,152645,1843,2010,'Fall','2017-04-12 04:23:24'),(65816,580960,455830,8749,2013,'Spring','2015-06-10 23:38:03'),(65817,253473,259445,2995,2015,'Spring','2015-11-20 14:09:13'),(65818,301381,75900,6321,2009,'Fall','2017-07-26 02:47:08'),(65819,424920,465296,256,2008,'Spring','2017-07-29 04:15:11'),(65820,471257,6648,3787,2009,'Spring','2010-01-20 08:28:51'),(65821,241347,138224,8674,2010,'Fall','2013-04-25 08:07:22'),(65822,929001,719099,4963,2018,'Spring','2015-04-20 19:23:40'),(65823,79452,493606,3227,2011,'Fall','2009-07-26 00:03:35'),(65824,205285,954376,7622,2014,'Spring','2011-05-31 23:50:53'),(65825,859067,38585,6144,2015,'Fall','2013-10-06 06:16:30'),(65826,61067,87990,2265,2011,'Fall','2010-02-17 17:34:23'),(65827,613755,831293,3929,2007,'Spring','2011-08-16 23:23:23'),(65828,974935,650220,91,2011,'Fall','2010-06-01 16:02:09'),(65829,538458,425638,4212,2015,'Fall','2010-12-04 10:01:02'),(65830,677216,363387,2364,2011,'Fall','2013-08-23 22:47:29'),(65831,811501,537307,9552,2012,'Spring','2012-11-16 02:37:36'),(65832,988828,59008,517,2009,'Fall','2012-11-12 21:01:04'),(65833,312809,764087,1964,2018,'Fall','2012-02-05 23:52:03'),(65834,749819,596926,1877,2014,'Spring','2016-02-19 21:22:58'),(65835,505706,895066,1125,2017,'Fall','2009-09-25 18:27:29'),(65836,250492,951561,2719,2014,'Spring','2011-12-20 00:02:47'),(65837,647629,121763,7880,2013,'Spring','2013-12-08 09:29:10'),(65838,138543,324265,5262,2009,'Fall','2009-12-29 06:15:22'),(65839,981858,246017,3548,2009,'Fall','2015-02-22 11:31:50'),(65840,47906,77486,3389,2018,'Spring','2016-10-11 14:58:44'),(65841,366236,958900,2862,2018,'Fall','2017-06-26 01:12:54'),(65842,831885,129207,7692,2008,'Spring','2010-04-13 09:47:03'),(65843,854692,254321,6471,2010,'Fall','2017-03-26 07:40:15'),(65844,511050,430774,7011,2018,'Fall','2013-06-01 16:36:51'),(65845,612870,947948,1100,2006,'Spring','2016-12-27 04:29:02'),(65846,370244,165859,3546,2008,'Fall','2012-08-27 17:20:45'),(65847,594068,677688,425,2017,'Spring','2012-05-23 02:13:45'),(65848,231550,82386,6735,2015,'Spring','2010-08-16 11:08:46'),(65849,641598,950519,1662,2011,'Spring','2015-05-13 21:24:18'),(65850,87657,794759,59,2011,'Spring','2014-04-08 14:09:16'),(65851,581923,256741,3588,2018,'Spring','2011-05-30 14:19:24'),(65852,258860,635143,9969,2007,'Spring','2012-09-26 17:19:36'),(65853,653142,835133,5487,2007,'Spring','2016-12-05 12:20:49'),(65854,954951,134686,4443,2012,'Spring','2016-05-29 02:18:04'),(65855,846659,380690,5986,2010,'Spring','2016-10-29 17:36:20'),(65856,902006,754242,2328,2019,'Fall','2013-02-05 03:43:32'),(65857,79452,745206,7817,2011,'Fall','2009-02-28 21:50:29'),(65858,637798,562145,9134,2016,'Fall','2017-03-20 15:49:43'),(65859,970299,154572,5245,2008,'Spring','2014-01-03 21:19:48'),(65860,458321,704055,9419,2012,'Fall','2013-12-01 21:50:53');
/*!40000 ALTER TABLE `Subscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Venue`
--

DROP TABLE IF EXISTS `Venue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Venue` (
  `Venue_ID` int(14) NOT NULL AUTO_INCREMENT,
  `Venue_Name` varchar(30) NOT NULL,
  `Club_ID` int(14) NOT NULL,
  `Event_ID` int(14) NOT NULL,
  PRIMARY KEY (`Venue_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Venue`
--

LOCK TABLES `Venue` WRITE;
/*!40000 ALTER TABLE `Venue` DISABLE KEYS */;
/*!40000 ALTER TABLE `Venue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add group',4,'add_group'),(11,'Can change group',4,'change_group'),(12,'Can delete group',4,'delete_group'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add admin',7,'add_admin'),(20,'Can change admin',7,'change_admin'),(21,'Can delete admin',7,'delete_admin'),(22,'Can add auth group',8,'add_authgroup'),(23,'Can change auth group',8,'change_authgroup'),(24,'Can delete auth group',8,'delete_authgroup'),(25,'Can add auth group permissions',9,'add_authgrouppermissions'),(26,'Can change auth group permissions',9,'change_authgrouppermissions'),(27,'Can delete auth group permissions',9,'delete_authgrouppermissions'),(28,'Can add auth permission',10,'add_authpermission'),(29,'Can change auth permission',10,'change_authpermission'),(30,'Can delete auth permission',10,'delete_authpermission'),(31,'Can add auth user',11,'add_authuser'),(32,'Can change auth user',11,'change_authuser'),(33,'Can delete auth user',11,'delete_authuser'),(34,'Can add auth user groups',12,'add_authusergroups'),(35,'Can change auth user groups',12,'change_authusergroups'),(36,'Can delete auth user groups',12,'delete_authusergroups'),(37,'Can add auth user user permissions',13,'add_authuseruserpermissions'),(38,'Can change auth user user permissions',13,'change_authuseruserpermissions'),(39,'Can delete auth user user permissions',13,'delete_authuseruserpermissions'),(40,'Can add belongs to',14,'add_belongsto'),(41,'Can change belongs to',14,'change_belongsto'),(42,'Can delete belongs to',14,'delete_belongsto'),(43,'Can add books',15,'add_books'),(44,'Can change books',15,'change_books'),(45,'Can delete books',15,'delete_books'),(46,'Can add django admin log',16,'add_djangoadminlog'),(47,'Can change django admin log',16,'change_djangoadminlog'),(48,'Can delete django admin log',16,'delete_djangoadminlog'),(49,'Can add django content type',17,'add_djangocontenttype'),(50,'Can change django content type',17,'change_djangocontenttype'),(51,'Can delete django content type',17,'delete_djangocontenttype'),(52,'Can add django migrations',18,'add_djangomigrations'),(53,'Can change django migrations',18,'change_djangomigrations'),(54,'Can delete django migrations',18,'delete_djangomigrations'),(55,'Can add django session',19,'add_djangosession'),(56,'Can change django session',19,'change_djangosession'),(57,'Can delete django session',19,'delete_djangosession'),(58,'Can add enquiry',20,'add_enquiry'),(59,'Can change enquiry',20,'change_enquiry'),(60,'Can delete enquiry',20,'delete_enquiry'),(61,'Can add event',21,'add_event'),(62,'Can change event',21,'change_event'),(63,'Can delete event',21,'delete_event'),(64,'Can add external request',22,'add_externalrequest'),(65,'Can change external request',22,'change_externalrequest'),(66,'Can delete external request',22,'delete_externalrequest'),(67,'Can add goes to',23,'add_goesto'),(68,'Can change goes to',23,'change_goesto'),(69,'Can delete goes to',23,'delete_goesto'),(70,'Can add has',24,'add_has'),(71,'Can change has',24,'change_has'),(72,'Can delete has',24,'delete_has'),(73,'Can add holds',25,'add_holds'),(74,'Can change holds',25,'change_holds'),(75,'Can delete holds',25,'delete_holds'),(76,'Can add isdirectedto',26,'add_isdirectedto'),(77,'Can change isdirectedto',26,'change_isdirectedto'),(78,'Can delete isdirectedto',26,'delete_isdirectedto'),(79,'Can add join request',27,'add_joinrequest'),(80,'Can change join request',27,'change_joinrequest'),(81,'Can delete join request',27,'delete_joinrequest'),(82,'Can add leisure facility',28,'add_leisurefacility'),(83,'Can change leisure facility',28,'change_leisurefacility'),(84,'Can delete leisure facility',28,'delete_leisurefacility'),(85,'Can add login',29,'add_login'),(86,'Can change login',29,'change_login'),(87,'Can delete login',29,'delete_login'),(88,'Can add make',30,'add_make'),(89,'Can change make',30,'change_make'),(90,'Can delete make',30,'delete_make'),(91,'Can add member',31,'add_member'),(92,'Can change member',31,'change_member'),(93,'Can delete member',31,'delete_member'),(94,'Can add pays',32,'add_pays'),(95,'Can change pays',32,'change_pays'),(96,'Can delete pays',32,'delete_pays'),(97,'Can add request',33,'add_request'),(98,'Can change request',33,'change_request'),(99,'Can delete request',33,'delete_request'),(100,'Can add retrieves',34,'add_retrieves'),(101,'Can change retrieves',34,'change_retrieves'),(102,'Can delete retrieves',34,'delete_retrieves'),(103,'Can add subscription',35,'add_subscription'),(104,'Can change subscription',35,'change_subscription'),(105,'Can delete subscription',35,'delete_subscription'),(106,'Can add venue',36,'add_venue'),(107,'Can change venue',36,'change_venue'),(108,'Can delete venue',36,'delete_venue'),(109,'Can add has a',37,'add_hasa'),(110,'Can change has a',37,'change_hasa'),(111,'Can delete has a',37,'delete_hasa'),(112,'Can add club',38,'add_club'),(113,'Can change club',38,'change_club'),(114,'Can delete club',38,'delete_club');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$30000$0rNbhjNIcynY$3/vz6uQ/XybnB1mz/1mbyuld35TM+w/4WcgfGkjXhvM=','2016-11-02 22:54:05.319821',1,'shin','','','j.shin@jacobs-university.de',1,1,'2016-11-02 22:53:40.114486'),(2,'pbkdf2_sha256$30000$xqlISfqxWZ45$AB1hcEfiqjzBPxteZqnen19qtOVlqMhjKbxqeclqpDU=','2016-11-03 12:20:17.232788',1,'admin','','','j.shin@jacobs-university.de',1,1,'2016-11-03 12:19:54.780304');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(4,'auth','group'),(2,'auth','permission'),(3,'auth','user'),(5,'contenttypes','contenttype'),(7,'portal','admin'),(8,'portal','authgroup'),(9,'portal','authgrouppermissions'),(10,'portal','authpermission'),(11,'portal','authuser'),(12,'portal','authusergroups'),(13,'portal','authuseruserpermissions'),(14,'portal','belongsto'),(15,'portal','books'),(38,'portal','club'),(16,'portal','djangoadminlog'),(17,'portal','djangocontenttype'),(18,'portal','djangomigrations'),(19,'portal','djangosession'),(20,'portal','enquiry'),(21,'portal','event'),(22,'portal','externalrequest'),(23,'portal','goesto'),(24,'portal','has'),(37,'portal','hasa'),(25,'portal','holds'),(26,'portal','isdirectedto'),(27,'portal','joinrequest'),(28,'portal','leisurefacility'),(29,'portal','login'),(30,'portal','make'),(31,'portal','member'),(32,'portal','pays'),(33,'portal','request'),(34,'portal','retrieves'),(35,'portal','subscription'),(36,'portal','venue'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2016-11-02 22:46:42.360499'),(2,'auth','0001_initial','2016-11-02 22:46:43.015536'),(3,'admin','0001_initial','2016-11-02 22:46:43.149873'),(4,'admin','0002_logentry_remove_auto_add','2016-11-02 22:46:43.178949'),(5,'contenttypes','0002_remove_content_type_name','2016-11-02 22:46:43.324201'),(6,'auth','0002_alter_permission_name_max_length','2016-11-02 22:46:43.373186'),(7,'auth','0003_alter_user_email_max_length','2016-11-02 22:46:43.421611'),(8,'auth','0004_alter_user_username_opts','2016-11-02 22:46:43.455630'),(9,'auth','0005_alter_user_last_login_null','2016-11-02 22:46:43.526618'),(10,'auth','0006_require_contenttypes_0002','2016-11-02 22:46:43.536952'),(11,'auth','0007_alter_validators_add_error_messages','2016-11-02 22:46:43.580932'),(12,'auth','0008_alter_user_username_max_length','2016-11-02 22:46:43.648405'),(13,'sessions','0001_initial','2016-11-02 22:46:43.698499'),(14,'portal','0001_initial','2016-11-03 13:31:28.316949');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('itmakfsfq1wa0s8pnut96ic5dx6qjavv','YjM2MTViZjhiYzBhYzNhNjllOGM4NjEzOWUwZGU3NGQxNjkxNGM2MDp7Il9hdXRoX3VzZXJfaGFzaCI6ImU0MjJkYzdjYzQ5ZTZiMmUzNjczODliOTNhZDZkNDRiYzIyMzhlOGMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2016-11-16 22:54:05.344965'),('twjot40et6mz09nxykbfp34k8symhkr8','Nzk4NWY2MzljNmYxYzljOWZjNTVhMDkyZjBiZGFlM2JkMzY2MzZhMjp7Il9hdXRoX3VzZXJfaGFzaCI6ImZhN2Y5MGYxOTk5Mzc2MDY3ODg0OGQzMDM4NGU1ZWZkYWU2ODVhNDAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2016-11-17 12:20:17.275662');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-03 22:00:09
