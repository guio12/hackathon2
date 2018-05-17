-- MySQL dump 10.13  Distrib 5.6.38, for osx10.9 (x86_64)
--
-- Host: localhost    Database: OW_World_Cup
-- ------------------------------------------------------
-- Server version	5.6.38

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
-- Table structure for table `map`
--

DROP TABLE IF EXISTS `map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `map` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_93ADAABBC54C8C93` (`type_id`),
  CONSTRAINT `FK_93ADAABBC54C8C93` FOREIGN KEY (`type_id`) REFERENCES `map_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `map`
--

LOCK TABLES `map` WRITE;
/*!40000 ALTER TABLE `map` DISABLE KEYS */;
INSERT INTO `map` VALUES (1,'Dorado',1),(2,'Gibraltar',1),(3,'Junkertown',1),(4,'Rialto',1),(5,'Route 66',1),(6,'Hanamura',2),(7,'Anubis Temple',2),(8,'Horizon Lunar Colony',2),(9,'Volskaya Industries',2),(10,'Ilios',3),(11,'Lijiang Tower',3),(12,'Nepal',3),(13,'Oasis',3),(14,'Blizzard World',4),(15,'Eichenwalde',4),(16,'Hollywood',4),(17,'King\'s Row',4),(18,'Numbani',4);
/*!40000 ALTER TABLE `map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `map_type`
--

DROP TABLE IF EXISTS `map_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `map_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `map_type`
--

LOCK TABLES `map_type` WRITE;
/*!40000 ALTER TABLE `map_type` DISABLE KEYS */;
INSERT INTO `map_type` VALUES (1,'Escort'),(2,'Assault'),(3,'Control'),(4,'Hybrid');
/*!40000 ALTER TABLE `map_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ow_match`
--

DROP TABLE IF EXISTS `ow_match`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ow_match` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `team1_id` int(11) DEFAULT NULL,
  `team2_id` int(11) DEFAULT NULL,
  `round` int(11) NOT NULL,
  `match_num` int(11) NOT NULL,
  `score1` int(11) NOT NULL,
  `score2` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_4870BE1E72BCFA4` (`team1_id`),
  KEY `IDX_4870BE1F59E604A` (`team2_id`),
  CONSTRAINT `FK_4870BE1E72BCFA4` FOREIGN KEY (`team1_id`) REFERENCES `team` (`id`),
  CONSTRAINT `FK_4870BE1F59E604A` FOREIGN KEY (`team2_id`) REFERENCES `team` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ow_match`
--

LOCK TABLES `ow_match` WRITE;
/*!40000 ALTER TABLE `ow_match` DISABLE KEYS */;
INSERT INTO `ow_match` VALUES (1,2,3,1,1,0,0),(2,4,5,1,2,0,0),(3,6,7,1,3,0,0),(4,8,9,1,4,0,0),(5,10,11,1,5,0,0),(6,12,13,1,6,0,0),(7,14,15,1,7,0,0),(8,16,17,1,8,0,0),(9,NULL,NULL,2,1,0,0),(10,NULL,NULL,2,2,0,0),(11,NULL,NULL,2,3,0,0),(12,NULL,NULL,2,4,0,0),(13,NULL,NULL,3,1,0,0),(14,NULL,NULL,3,2,0,0),(15,NULL,NULL,4,1,0,0);
/*!40000 ALTER TABLE `ow_match` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `played_map`
--

DROP TABLE IF EXISTS `played_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `played_map` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `map_id` int(11) NOT NULL,
  `ow_match_id` int(11) NOT NULL,
  `score1` int(11) NOT NULL,
  `score2` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_12C89BA53C55F64` (`map_id`),
  KEY `IDX_12C89BA5E49B0EB` (`ow_match_id`),
  CONSTRAINT `FK_12C89BA53C55F64` FOREIGN KEY (`map_id`) REFERENCES `map` (`id`),
  CONSTRAINT `FK_12C89BA5E49B0EB` FOREIGN KEY (`ow_match_id`) REFERENCES `ow_match` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `played_map`
--

LOCK TABLES `played_map` WRITE;
/*!40000 ALTER TABLE `played_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `played_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player`
--

DROP TABLE IF EXISTS `player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `team_id` int(11) NOT NULL,
  `pseudo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `photo_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_98197A65D60322AC` (`role_id`),
  KEY `IDX_98197A65296CD8AE` (`team_id`),
  CONSTRAINT `FK_98197A65296CD8AE` FOREIGN KEY (`team_id`) REFERENCES `team` (`id`),
  CONSTRAINT `FK_98197A65D60322AC` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player`
--

LOCK TABLES `player` WRITE;
/*!40000 ALTER TABLE `player` DISABLE KEYS */;
INSERT INTO `player` VALUES (1,1,2,'KRUISE','https://d1u5p3l4wpay3k.cloudfront.net/overwatch_gamepedia/0/07/PI_Alien.png?version=dfd9144bec2ab243bf328175f2473e35'),(2,1,2,'SMEX','https://d1u5p3l4wpay3k.cloudfront.net/overwatch_gamepedia/9/9f/PI_Anubis.png?version=7dcb674ea977cfdcd2f5205efd81695f'),(3,2,2,'KRUISE','https://d1u5p3l4wpay3k.cloudfront.net/overwatch_gamepedia/7/70/PI_Bao.png?version=4f9fc53a3b21a233147adcb78c0c0d42'),(4,2,2,'CHRISTFER','https://d1u5p3l4wpay3k.cloudfront.net/overwatch_gamepedia/b/b7/PI_Capsule.png?version=6e0f3434eeba16d5af8cfb6bcbcaf678'),(5,3,2,'MIKEYA','https://d1u5p3l4wpay3k.cloudfront.net/overwatch_gamepedia/6/63/PI_Cheers.png?version=00f2075813b8eadb429c9d3767f55fef'),(6,3,2,'REALZX','https://d1u5p3l4wpay3k.cloudfront.net/overwatch_gamepedia/f/f5/PI_Ana_Face.png?version=2700389cf860d53e5e608a06f1c484f2'),(7,1,3,'JONGIE','https://d1u5p3l4wpay3k.cloudfront.net/overwatch_gamepedia/e/ef/PI_Genji_Cute_Genji.png?version=a4f2f14dc6990d0338e1acb6faf84d81'),(8,1,3,'S1NKER','https://d1u5p3l4wpay3k.cloudfront.net/overwatch_gamepedia/thumb/5/55/PI_L%C3%BAcio_Frog.png/200px-PI_L%C3%BAcio_Frog.png?version=f57a50ecffa5b46f07173e31eb3ac4f8'),(9,2,3,'KMOMO','https://d1u5p3l4wpay3k.cloudfront.net/overwatch_gamepedia/thumb/d/d2/PI_Reinhardt_Scar.png/200px-PI_Reinhardt_Scar.png?version=ec47d906781ad6c5cbdaf24cb02edfd6'),(10,2,3,'ZONDA','https://d1u5p3l4wpay3k.cloudfront.net/overwatch_gamepedia/b/b8/PI_S76_Cute_Soldier_76.png?version=184ac3559c4bf1098ef8d3af30ab2a84'),(11,3,3,'BACONJACK','https://d1u5p3l4wpay3k.cloudfront.net/overwatch_gamepedia/thumb/a/a8/PI_Zenyatta_Harmony.png/200px-PI_Zenyatta_Harmony.png?version=e5888681a3eb629aad64a20c954a92c5'),(12,3,3,'REALMENT','https://d1u5p3l4wpay3k.cloudfront.net/overwatch_gamepedia/8/87/PI_Zarya_Cute_Zarya.png?version=13543e6d77e76c20494534d5a657718d'),(13,1,4,'ZEBBOSAI','https://d1u5p3l4wpay3k.cloudfront.net/overwatch_gamepedia/thumb/2/23/PI_Zarya_Particle_Barrier.png/200px-PI_Zarya_Particle_Barrier.png?version=d6ca004a279603aade25f61c4db0225e'),(14,1,4,'CWOOSH','https://d1u5p3l4wpay3k.cloudfront.net/overwatch_gamepedia/2/2f/PI_Ana_Wedjat.png?version=cadc18bbc22983b08681503d01363772'),(15,2,4,'SNILLO','https://d1u5p3l4wpay3k.cloudfront.net/overwatch_gamepedia/8/80/PI_Totem.png?version=309e1146eaa19d456a6743358711b8ad'),(16,2,4,'TVIQ','https://d1u5p3l4wpay3k.cloudfront.net/overwatch_gamepedia/5/5a/PI_Mama_Pig%27s.png?version=a445493176b860701bdaa9be5cabc965'),(17,3,4,'CHIPSHAJEN','https://d1u5p3l4wpay3k.cloudfront.net/overwatch_gamepedia/6/6c/PI_Scooter.png?version=cf1113680d1c52fe66743ddf842ac4e6'),(18,3,4,'MANNETEN','https://d1u5p3l4wpay3k.cloudfront.net/overwatch_gamepedia/e/e3/PI_Junkrat_Tennis.png?version=2118b6b20cdd7dc2841bb6a34c77592a'),(19,1,5,'HARRYHOOK','https://d1u5p3l4wpay3k.cloudfront.net/overwatch_gamepedia/3/3f/PI_Wolf.png?version=08cc4a9c2c5d4613427f96ba68d2a5e4'),(20,1,5,'TOXIKEN','https://d1u5p3l4wpay3k.cloudfront.net/overwatch_gamepedia/b/b5/PI_Candle.png?version=cf27833af6cdfb57ef2c032b9c5f8659'),(21,2,5,'BROMAS','https://d1u5p3l4wpay3k.cloudfront.net/overwatch_gamepedia/3/38/PI_Spider.png?version=1d1bfed95bf6cc965429a51f1b8337f0'),(22,2,5,'DHAK','https://d1u5p3l4wpay3k.cloudfront.net/overwatch_gamepedia/6/68/PI_The_Monster.png?version=602e027c53598b0c0d18b0c6f675caeb'),(23,3,5,'WINGHAVEN','https://d1u5p3l4wpay3k.cloudfront.net/overwatch_gamepedia/6/61/PI_...Never_Die.png?version=df4f9053eed30c93b78a70184033998b'),(24,3,5,'NEPTUNO','https://d1u5p3l4wpay3k.cloudfront.net/overwatch_gamepedia/4/45/PI_Eyeball.png?version=1c657f022b7f2a9b3fcf3e3efb5ee3d1'),(25,1,6,'JOEMEISTER','https://d1u5p3l4wpay3k.cloudfront.net/overwatch_gamepedia/0/0e/PI_Reinhardt_Goldhardt.png?version=109e50740eb3ec0d7045cb803d56002f'),(26,1,6,'SUREFOUR','https://d1u5p3l4wpay3k.cloudfront.net/overwatch_gamepedia/5/5c/PI_Winston_Goldrilla.png?version=31d06d6cf06ebf3b2026dfc9b43a120a'),(27,2,6,'XQC','https://d1u5p3l4wpay3k.cloudfront.net/overwatch_gamepedia/9/94/PI_McCree_GAMF.png?version=8594d808573d48a68a9e0e980e979024'),(28,2,6,'ROOLF','https://d1u5p3l4wpay3k.cloudfront.net/overwatch_gamepedia/3/32/PI_Pharah_Anniversareeha.png?version=0fd2f268ae1635032c1773dae01a3667'),(29,3,6,'AGILITIES','https://d1u5p3l4wpay3k.cloudfront.net/overwatch_gamepedia/b/b2/PI_Mercy_Jahrestag.png?version=4ac027673861a577e904e5bbf9e4796f'),(30,3,6,'MANGACHU','https://d1u5p3l4wpay3k.cloudfront.net/overwatch_gamepedia/a/a9/PI_L%C3%BAcio_L%C3%BAciouro.png?version=4250b78ae8fccdb417d790479cad0881'),(31,1,7,'MORTE','https://d1u5p3l4wpay3k.cloudfront.net/overwatch_gamepedia/thumb/4/4c/PI_Warcraft_Alliance.png/200px-PI_Warcraft_Alliance.png?version=9c044d5eac8692667b9f6c348d141c02'),(32,1,7,'DANTE','https://d1u5p3l4wpay3k.cloudfront.net/overwatch_gamepedia/thumb/0/0d/PI_Warcraft_Horde.png/200px-PI_Warcraft_Horde.png?version=73182af009d7315788c5ea1e6d917ea7'),(33,2,7,'TWOEASY','https://d1u5p3l4wpay3k.cloudfront.net/overwatch_gamepedia/thumb/5/55/PI_Warcraft_Sylvanas_Windrunner.png/200px-PI_Warcraft_Sylvanas_Windrunner.png?version=855fdd1fac99b7101e2397bca8c1110f'),(34,2,7,'JONA','https://d1u5p3l4wpay3k.cloudfront.net/overwatch_gamepedia/thumb/9/9c/PI_Warcraft_Garrosh_Hellscream.png/200px-PI_Warcraft_Garrosh_Hellscream.png?version=9df3e30f592ee0126f8b198cc00533fd'),(35,3,7,'VIZILITY','https://d1u5p3l4wpay3k.cloudfront.net/overwatch_gamepedia/thumb/d/de/PI_Warcraft_Lich_King.png/200px-PI_Warcraft_Lich_King.png?version=12c7e2fbeb3d471bd71222cbabae3833'),(36,3,7,'CRUSADE','https://d1u5p3l4wpay3k.cloudfront.net/overwatch_gamepedia/thumb/d/d6/PI_Warcraft_Jaina_Proudmoore.png/200px-PI_Warcraft_Jaina_Proudmoore.png?version=df73df14a1f70fc40514facf956984c7'),(37,1,8,'AKTM','https://d1u5p3l4wpay3k.cloudfront.net/overwatch_gamepedia/3/39/PI_Diablo_Barbarian.png?version=386e20b24cd741584f4f10076dac22aa'),(38,1,8,'TAIYO','https://d1u5p3l4wpay3k.cloudfront.net/overwatch_gamepedia/b/b1/PI_Diablo_Crusader.png?version=5500799878092955c493ac9178a874d1'),(39,2,8,'CLAIRE','https://d1u5p3l4wpay3k.cloudfront.net/overwatch_gamepedia/f/fa/PI_Diablo_Monk.png?version=1ae99964c6391282e22d3244db34cd15'),(40,2,8,'DEARTN','https://d1u5p3l4wpay3k.cloudfront.net/overwatch_gamepedia/b/b5/PI_Diablo_Witch_Doctor.png?version=e71395f65119a25affcc9322a70c5c09'),(41,3,8,'JASPER','https://d1u5p3l4wpay3k.cloudfront.net/overwatch_gamepedia/5/5a/PI_Diablo_Wizard.png?version=9a5b44722581840fe673d837fa3d80f9'),(42,3,8,'YOZ','https://d1u5p3l4wpay3k.cloudfront.net/overwatch_gamepedia/d/dd/PI_Diablo_Dark_Wanderer.png?version=7bc927da02f0f9a46b5c0314b754e227'),(43,1,9,'KIKI','https://d1u5p3l4wpay3k.cloudfront.net/overwatch_gamepedia/thumb/b/b2/PI_StarCraft_Protoss.png/200px-PI_StarCraft_Protoss.png?version=9d2bac72f38b87bb33959b462ebc1d10'),(44,1,9,'RQT','https://d1u5p3l4wpay3k.cloudfront.net/overwatch_gamepedia/thumb/2/29/PI_StarCraft_Terran.png/200px-PI_StarCraft_Terran.png?version=5a58e835d6902c4bd4eda805c17f315d'),(45,2,9,'AETAR','https://d1u5p3l4wpay3k.cloudfront.net/overwatch_gamepedia/thumb/d/d5/PI_StarCraft_Zerg.png/200px-PI_StarCraft_Zerg.png?version=b1abbf6123b707e2294fda49edcaf875'),(46,2,9,'TRILL','https://d1u5p3l4wpay3k.cloudfront.net/overwatch_gamepedia/thumb/f/f6/PI_StarCraft_Dominion.png/200px-PI_StarCraft_Dominion.png?version=3720b79274f2fb60ec8afa560f2f9d17'),(47,3,9,'IEATUUP','https://d1u5p3l4wpay3k.cloudfront.net/overwatch_gamepedia/f/fd/PI_StarCraft_Hierarch.png?version=37dc32626c5d3d7bfe549d9474c34a6c'),(48,3,9,'GUNBA','https://d1u5p3l4wpay3k.cloudfront.net/overwatch_gamepedia/b/bd/PI_StarCraft_Jim.png?version=d02cc136981a8fdb86376d6f41ddb940'),(49,1,10,'YAOYAO','https://d1u5p3l4wpay3k.cloudfront.net/overwatch_gamepedia/f/f5/PI_Ana_Face.png?version=2700389cf860d53e5e608a06f1c484f2'),(50,1,10,'LEAVE','https://d1u5p3l4wpay3k.cloudfront.net/overwatch_gamepedia/b/b3/PI_Doomfist_Face.png?version=ef130ed2774bd81834c86e2b0a5d3df5'),(51,2,10,'ZHUFANJUN','https://d1u5p3l4wpay3k.cloudfront.net/overwatch_gamepedia/thumb/3/35/PI_Junkrat_Face.png/200px-PI_Junkrat_Face.png?version=ac743182dedb3ee4e18b1cfb22745b9e'),(52,2,10,'TIME','https://d1u5p3l4wpay3k.cloudfront.net/overwatch_gamepedia/thumb/6/63/PI_Mercy_Face.png/200px-PI_Mercy_Face.png?version=fcc124182b5e83d00cb75ab7c090911c'),(53,3,10,'YUANFANG','https://d1u5p3l4wpay3k.cloudfront.net/overwatch_gamepedia/thumb/d/dd/PI_Zarya_Face.png/200px-PI_Zarya_Face.png?version=b0c5d91c4565086a4a06c11021da7deb'),(54,3,10,'EILEEN','https://d1u5p3l4wpay3k.cloudfront.net/overwatch_gamepedia/thumb/0/09/PI_Widowmaker_Face.png/200px-PI_Widowmaker_Face.png?version=d832ea9a2e3644280079e0017455d435'),(55,1,11,'NZNR','https://d1u5p3l4wpay3k.cloudfront.net/overwatch_gamepedia/thumb/c/ca/PI_D.Va_Bunny.png/200px-PI_D.Va_Bunny.png?version=2a134715165fbc01fce4e2e4555ae150'),(56,1,11,'MICKIE','https://d1u5p3l4wpay3k.cloudfront.net/overwatch_gamepedia/thumb/c/c8/PI_Hanzo_Shimada.png/200px-PI_Hanzo_Shimada.png?version=6876c14ba809a6de1f386e1410d116cb'),(57,2,11,'OPUTO','https://d1u5p3l4wpay3k.cloudfront.net/overwatch_gamepedia/3/3d/PI_Moira_Erlenmeyer.png?version=6044269a155311a43d491a21decae80a'),(58,2,11,'PANNYS','https://d1u5p3l4wpay3k.cloudfront.net/overwatch_gamepedia/thumb/2/27/PI_Orisa_Efi.png/200px-PI_Orisa_Efi.png?version=563ff07296e0420994b108ea3f9f1707'),(59,3,11,'KERLOS','https://d1u5p3l4wpay3k.cloudfront.net/overwatch_gamepedia/thumb/9/9d/PI_Roadhog_Hook.png/200px-PI_Roadhog_Hook.png?version=f963e7264a1e936a5ade5c66a7d0e4a7'),(60,3,11,'TEETAWAT','https://d1u5p3l4wpay3k.cloudfront.net/overwatch_gamepedia/thumb/5/5d/PI_Tracer_Patch.png/200px-PI_Tracer_Patch.png?version=7f16df8cca31a1485394fb054bbe23fd'),(61,1,12,'MRLETTRE','https://d1u5p3l4wpay3k.cloudfront.net/overwatch_gamepedia/d/d2/PI_Winston_Volleyball.png?version=dddd9036ebfc8d48fa648220cce1e26d'),(62,1,12,'ILLECTEMN','https://d1u5p3l4wpay3k.cloudfront.net/overwatch_gamepedia/f/fa/PI_Roadhog_Diving.png?version=930c4bcc814b856da0c8905bf03dd4eb'),(63,2,12,'NAASHW','https://d1u5p3l4wpay3k.cloudfront.net/overwatch_gamepedia/c/c1/PI_Reaper_BMX.png?version=8cd0609d8595084526f06d8db2bbda88'),(64,2,12,'SAPHYR','https://d1u5p3l4wpay3k.cloudfront.net/overwatch_gamepedia/f/f2/PI_S76_Golf.png?version=47b197245fc0370e7ba7172ab0c38368'),(65,3,12,'KNOXXX','https://d1u5p3l4wpay3k.cloudfront.net/overwatch_gamepedia/0/02/PI_Ana_Shooting.png?version=ff81c989b2f3821a990ce73014d684b5'),(66,3,12,'CHONCHOU','https://d1u5p3l4wpay3k.cloudfront.net/overwatch_gamepedia/c/c8/PI_Doomfist_Shotput.png?version=2f2803d8ef78cf1c2644ca172b0fd30a'),(67,1,13,'DECOD','https://d1u5p3l4wpay3k.cloudfront.net/overwatch_gamepedia/thumb/f/fc/PI_Winston_Lunar_Ops.png/200px-PI_Winston_Lunar_Ops.png?version=8bb81d8035df94fe2584809c21b5dd65'),(68,1,13,'TROB','https://d1u5p3l4wpay3k.cloudfront.net/overwatch_gamepedia/e/eb/PI_Torbj%C3%B6rn_Forge.png?version=234f88364300ac0e3dd7c3a67328422e'),(69,2,13,'ONIGOD','https://d1u5p3l4wpay3k.cloudfront.net/overwatch_gamepedia/a/a0/PI_Reaper_Emblem.png?version=387e6310ef406595d9fe2ace448c6587'),(70,2,13,'INVISION','https://d1u5p3l4wpay3k.cloudfront.net/overwatch_gamepedia/thumb/f/f7/PI_Junkrat_Ahhhh%21.png/200px-PI_Junkrat_Ahhhh%21.png?version=889bc6f8e25513dc826f1679082bbe95'),(71,3,13,'IKO','https://d1u5p3l4wpay3k.cloudfront.net/overwatch_gamepedia/0/0a/PI_Doomfist_Fist.png?version=b2d26903ecee7926723f5623a3a413f5'),(72,3,13,'IPN','https://d1u5p3l4wpay3k.cloudfront.net/overwatch_gamepedia/thumb/9/92/PI_Bastion_Ganymede.png/200px-PI_Bastion_Ganymede.png?version=a5251ac8c474f7df460262938b1ffa66'),(73,1,14,'MANO','https://d1u5p3l4wpay3k.cloudfront.net/overwatch_gamepedia/5/56/PI_Hanzo_Cute_Hanzo.png?version=99a99133bc9cd7d3d44872a9d741b2fb'),(74,1,14,'ZUNBA','https://d1u5p3l4wpay3k.cloudfront.net/overwatch_gamepedia/7/74/PI_Bastion_Cute_Bastion.png?version=dc0aede6602811a5ba81d1b6308aa325'),(75,2,14,'SAEBYEOLBE','https://d1u5p3l4wpay3k.cloudfront.net/overwatch_gamepedia/b/b6/PI_Mei_Cute_Mei.png?version=2bb6ede789acb81db38bdeb85e93b3d4'),(76,2,14,'TOBI','https://d1u5p3l4wpay3k.cloudfront.net/overwatch_gamepedia/8/8a/PI_Orisa_Cute_Orisa.png?version=e1b69f651a10e2a0787983c8892c7c83'),(77,3,14,'RYUJEHONG','https://d1u5p3l4wpay3k.cloudfront.net/overwatch_gamepedia/e/eb/PI_Sombra_Cute_Sombra.png?version=755d97b47008b36af5800e684fc1600e'),(78,3,14,'FLOW3R','https://d1u5p3l4wpay3k.cloudfront.net/overwatch_gamepedia/2/2a/PI_Widowmaker_Cute_Widowmaker.png?version=a1dca29ba3252fac7e8e401d2cfa1cb7'),(79,1,15,'MISTAKES','https://d1u5p3l4wpay3k.cloudfront.net/overwatch_gamepedia/2/2d/PI_Ice_Fisherman.png?version=ccf36089e3e1cc4197ac37d525fdccc3'),(80,1,15,'SHADOWBURN','https://d1u5p3l4wpay3k.cloudfront.net/overwatch_gamepedia/0/0c/PI_Yeti.png?version=0866cc91740dcd0fa73b535b0c791ea4'),(81,2,15,'SHARYK','https://d1u5p3l4wpay3k.cloudfront.net/overwatch_gamepedia/e/e7/PI_Nutcracker.png?version=572be54814e7fb270651101348a2d89e'),(82,2,15,'RUBIKON','https://d1u5p3l4wpay3k.cloudfront.net/overwatch_gamepedia/9/9d/PI_Peppermint.png?version=318d6ded1348817e65dacef6f5b40e43'),(83,3,15,'FORSAK3N','https://d1u5p3l4wpay3k.cloudfront.net/overwatch_gamepedia/f/ff/PI_Holly.png?version=8fffe8764a0843472ce5cbadff6aebc1'),(84,3,15,'TXAO','https://d1u5p3l4wpay3k.cloudfront.net/overwatch_gamepedia/b/b6/PI_Pachireindeer.png?version=5551c76e3d9ccffeecad4d8736b8b812'),(85,1,16,'RAWKUS','https://d1u5p3l4wpay3k.cloudfront.net/overwatch_gamepedia/5/5b/PI_Year_Of_The_Rooster_2017.png?version=b4fd4e4070c55e8891477b0fd6830f4b'),(86,1,16,'ADAM','https://d1u5p3l4wpay3k.cloudfront.net/overwatch_gamepedia/4/4c/PI_Year_of_the_Dog_2018.png?version=a945aa08d09c2e6177ddfe0662582364'),(87,2,16,'FCTFCTN','https://d1u5p3l4wpay3k.cloudfront.net/overwatch_gamepedia/e/e8/PI_Baihu.png?version=571ea41a87faf0276e173f627ac3e4e2'),(88,2,16,'JAKE','https://d1u5p3l4wpay3k.cloudfront.net/overwatch_gamepedia/9/9b/PI_Dragon_Dance.png?version=54e216e17bc454f476754972de7f1bb0'),(89,3,16,'COOLMATT','https://d1u5p3l4wpay3k.cloudfront.net/overwatch_gamepedia/0/0b/PI_Xuanwu.png?version=f2603375cceaec21d29cb55eb55b9d2e'),(90,3,16,'SINATRAA','https://d1u5p3l4wpay3k.cloudfront.net/overwatch_gamepedia/1/15/PI_Zhuque.png?version=3b3f8faa6ad0ede9f0bd0a7fab08b78c'),(91,1,17,'SKIPJACK','https://d1u5p3l4wpay3k.cloudfront.net/overwatch_gamepedia/thumb/c/cd/PI_Cadet.png/200px-PI_Cadet.png?version=7eecc6ad47f5801efe30bea2e3d2172a'),(92,1,17,'CRNKZ','https://d1u5p3l4wpay3k.cloudfront.net/overwatch_gamepedia/thumb/c/cf/PI_Blackwatch.png/200px-PI_Blackwatch.png?version=cd17686e3c5e2e90ceea04637d1b14ee'),(93,2,17,'NESH','https://d1u5p3l4wpay3k.cloudfront.net/overwatch_gamepedia/thumb/e/ec/PI_Cyborg.png/200px-PI_Cyborg.png?version=ef8fd53a9ecf2fd10b36f3a7acbdb607'),(94,2,17,'INTERNETHULK','https://d1u5p3l4wpay3k.cloudfront.net/overwatch_gamepedia/thumb/0/0a/PI_OR14-NS.png/200px-PI_OR14-NS.png?version=9af2c9aa31723e64a397da75615be516'),(95,3,17,'VEINELESS','https://d1u5p3l4wpay3k.cloudfront.net/overwatch_gamepedia/thumb/a/a6/PI_Lacroix.png/200px-PI_Lacroix.png?version=18d896b6bf60570f7ab91f23d35ac034'),(96,3,17,'EISSFELDT','https://d1u5p3l4wpay3k.cloudfront.net/overwatch_gamepedia/thumb/6/6e/PI_Lieutenant.png/200px-PI_Lieutenant.png?version=e87fcfa70034e1b11883134c591bf6ad');
/*!40000 ALTER TABLE `player` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'Tank'),(2,'Offense'),(3,'Support');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nationality` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `flag_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
INSERT INTO `team` VALUES (2,'United Kingdom','https://upload.wikimedia.org/wikipedia/commons/thumb/a/ae/Flag_of_the_United_Kingdom.svg/1200px-Flag_of_the_United_Kingdom.svg.p'),(3,'Belgique','https://upload.wikimedia.org/wikipedia/commons/thumb/9/92/Flag_of_Belgium_%28civil%29.svg/220px-Flag_of_Belgium_%28civil%29.svg.png'),(4,'Sweden','https://upload.wikimedia.org/wikipedia/commons/thumb/4/4c/Flag_of_Sweden.svg/1600px-Flag_of_Sweden.svg.png'),(5,'Spain','https://upload.wikimedia.org/wikipedia/commons/thumb/9/9a/Flag_of_Spain.svg/750px-Flag_of_Spain.svg.png'),(6,'Canada','https://upload.wikimedia.org/wikipedia/commons/thumb/d/d9/Flag_of_Canada_%28Pantone%29.svg/1200px-Flag_of_Canada_%28Pantone%29.s'),(7,'Nederlands','https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Flag_of_the_Netherlands.svg/900px-Flag_of_the_Netherlands.svg.png'),(8,'Japan','https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Flag_of_Japan.svg/900px-Flag_of_Japan.svg.png'),(9,'Australia','https://upload.wikimedia.org/wikipedia/commons/thumb/b/b9/Flag_of_Australia.svg/1280px-Flag_of_Australia.svg.png'),(10,'China','https://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Flag_of_the_People%27s_Republic_of_China.svg/220px-Flag_of_the_People%27s_Republic_of_China.svg.png'),(11,'Thailand','https://upload.wikimedia.org/wikipedia/commons/thumb/a/a9/Flag_of_Thailand.svg/900px-Flag_of_Thailand.svg.png'),(12,'France','https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Flag_of_France.svg/450px-Flag_of_France.svg.png'),(13,'Norway','https://upload.wikimedia.org/wikipedia/commons/thumb/d/d9/Flag_of_Norway.svg/1100px-Flag_of_Norway.svg.png'),(14,'South Korea','https://upload.wikimedia.org/wikipedia/commons/thumb/0/09/Flag_of_South_Korea.svg/900px-Flag_of_South_Korea.svg.png'),(15,'Russia','https://upload.wikimedia.org/wikipedia/commons/thumb/f/f3/Flag_of_Russia.svg/900px-Flag_of_Russia.svg.png'),(16,'Usa','https://upload.wikimedia.org/wikipedia/commons/thumb/a/a4/Flag_of_the_United_States.svg/1235px-Flag_of_the_United_States.svg.png'),(17,'Germany','https://upload.wikimedia.org/wikipedia/commons/thumb/b/ba/Flag_of_Germany.svg/1000px-Flag_of_Germany.svg.png');
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-17 23:38:10
