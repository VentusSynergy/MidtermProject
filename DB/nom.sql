-- MySQL dump 10.13  Distrib 5.7.26, for osx10.9 (x86_64)
--
-- Host: localhost    Database: nom
-- ------------------------------------------------------
-- Server version	5.7.26

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Other'),(2,'Asian'),(3,'American'),(4,'Italian'),(5,'Mediterranean'),(6,'Mexican'),(7,'French'),(8,'Indian');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_list`
--

DROP TABLE IF EXISTS `grocery_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `meal_plan_id` int(11) NOT NULL,
  `purchased` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_grocery_list_meal_plan_idx` (`meal_plan_id`),
  CONSTRAINT `fk_grocery_list_meal_plan` FOREIGN KEY (`meal_plan_id`) REFERENCES `meal_plan` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_list`
--

LOCK TABLES `grocery_list` WRITE;
/*!40000 ALTER TABLE `grocery_list` DISABLE KEYS */;
INSERT INTO `grocery_list` VALUES (1,1,0);
/*!40000 ALTER TABLE `grocery_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredient`
--

DROP TABLE IF EXISTS `ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ingredient` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `brand` varchar(45) DEFAULT NULL,
  `size` varchar(45) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=522 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredient`
--

LOCK TABLES `ingredient` WRITE;
/*!40000 ALTER TABLE `ingredient` DISABLE KEYS */;
INSERT INTO `ingredient` VALUES (1,'Sandwich Bread',NULL,NULL,'Baked Goods'),(2,'Peanut Butter',NULL,NULL,'Canned Goods'),(3,'Strawberry Jelly',NULL,NULL,'Canned Goods'),(4,'Spaghetti Noodles',NULL,NULL,'Pasta'),(5,'Spaghetti Sauce',NULL,NULL,'Canned Goods'),(6,'Butter',NULL,NULL,'Dairy'),(7,'Pizza Crust','Boboli',NULL,NULL),(8,'Pizza Sauce',NULL,NULL,'Canned Goods'),(9,'Mozzerella Cheese',NULL,NULL,'Dairy'),(10,'Ramen Noodles','Top Ramen',NULL,'Pasta'),(11,'shortening',NULL,NULL,NULL),(12,'sugar',NULL,NULL,NULL),(13,'eggs',NULL,NULL,NULL),(14,'Salt',NULL,NULL,NULL),(15,'sour milk',NULL,NULL,NULL),(16,'soda water',NULL,NULL,NULL),(17,'flour',NULL,NULL,NULL),(18,'baking powder',NULL,NULL,NULL),(19,'chopped nuts',NULL,NULL,NULL),(20,'cream cheese',NULL,NULL,NULL),(21,'lemon juice',NULL,NULL,NULL),(22,'vanilla',NULL,NULL,NULL),(23,'butter',NULL,NULL,NULL),(24,'milk',NULL,NULL,NULL),(25,'blueberries',NULL,NULL,NULL),(26,'margarine',NULL,NULL,NULL),(27,'cocoa',NULL,NULL,NULL),(28,'baking soda',NULL,NULL,NULL),(29,'cloves',NULL,NULL,NULL),(30,'lemon cake mix',NULL,NULL,NULL),(31,'water',NULL,NULL,NULL),(32,'lemon jello',NULL,NULL,NULL),(33,'vegetable oil',NULL,NULL,NULL),(34,'powdered sugar',NULL,NULL,NULL),(35,'diced apples',NULL,NULL,NULL),(36,'cinnamon',NULL,NULL,NULL),(37,'cold butter',NULL,NULL,NULL),(38,'brown sugar',NULL,NULL,NULL),(39,'egg',NULL,NULL,NULL),(40,'chocolate chips',NULL,NULL,NULL),(41,'walnuts',NULL,NULL,NULL),(42,'semisweet chocolate chips',NULL,NULL,NULL),(43,'light corn syrup',NULL,NULL,NULL),(44,'bourbon (or light cream)',NULL,NULL,NULL),(45,'crushed vanilla wafers',NULL,NULL,NULL),(46,'finely chopped walnuts',NULL,NULL,NULL),(47,'All-Bran cereal',NULL,NULL,NULL),(48,'crunchy peanut butter',NULL,NULL,NULL),(49,'egg yolk; beaten',NULL,NULL,NULL),(50,'Special K cereal',NULL,NULL,NULL),(51,'sifted flour',NULL,NULL,NULL),(52,'eggs; well beaten',NULL,NULL,NULL),(53,'light brown sugar',NULL,NULL,NULL),(54,'coconut',NULL,NULL,NULL),(55,'broccoli; cut into small pieces',NULL,NULL,NULL),(56,'raisins',NULL,NULL,NULL),(57,'red onion',NULL,NULL,NULL),(58,'sunflower seed',NULL,NULL,NULL),(59,'mayonnaise',NULL,NULL,NULL),(60,'stalks of celery',NULL,NULL,NULL),(61,'red wine vinegar ',NULL,NULL,NULL),(62,'curry; to taste',NULL,NULL,NULL),(63,'broccoli florets; bite size',NULL,NULL,NULL),(64,'mozzarella cheese; shredded',NULL,NULL,NULL),(65,'red onion; chopped',NULL,NULL,NULL),(66,'crisp bacon; crumbled',NULL,NULL,NULL),(67,'vinegar',NULL,NULL,NULL),(68,'pineapple chunks',NULL,NULL,NULL),(69,'mandarin oranges',NULL,NULL,NULL),(70,'marshmallows',NULL,NULL,NULL),(71,'sour cream',NULL,NULL,NULL),(72,'chicken; cooked and chopped',NULL,NULL,NULL),(73,'potato; diced',NULL,NULL,NULL),(74,'carrots; diced',NULL,NULL,NULL),(75,'celery; sliced',NULL,NULL,NULL),(76,'onion; chopped',NULL,NULL,NULL),(77,'chicken bouillion',NULL,NULL,NULL),(78,'poultry seasoning',NULL,NULL,NULL),(79,'salt; to taste',NULL,NULL,NULL),(80,'narrow egg noodles',NULL,NULL,NULL),(81,'bacon; chopped and browned',NULL,NULL,NULL),(82,'onion; suated',NULL,NULL,NULL),(83,'celery; sauted',NULL,NULL,NULL),(84,'potatoes; peeled and diced',NULL,NULL,NULL),(85,'half and half',NULL,NULL,NULL),(86,'salt and pepper',NULL,NULL,NULL),(87,'thyme or basil',NULL,NULL,NULL),(88,'chopped clams with juice',NULL,NULL,NULL),(89,'zucchini; thinly sliced (about 3/4 lb.)',NULL,NULL,NULL),(90,'garlic; minced',NULL,NULL,NULL),(91,'butter or margarine',NULL,NULL,NULL),(92,'cream of mushroom soup; condensed',NULL,NULL,NULL),(93,'fresh oregano; chopped or 1/4 tsp dried',NULL,NULL,NULL),(94,'fresh basil; or 1/4 tsp dried',NULL,NULL,NULL),(95,'pine nuts; toasted',NULL,NULL,NULL),(96,'elephant',NULL,NULL,NULL),(97,'salt and pepper to taste',NULL,NULL,NULL),(98,'brown gravy',NULL,NULL,NULL),(99,'rabbits',NULL,NULL,NULL),(100,'hamburger',NULL,NULL,NULL),(101,'potatoes; cubed',NULL,NULL,NULL),(102,'stalks of celery; chopped',NULL,NULL,NULL),(103,'kidney beans',NULL,NULL,NULL),(104,'frozen spinach',NULL,NULL,NULL),(105,'zucchini; diced',NULL,NULL,NULL),(106,'cabbage; chopped',NULL,NULL,NULL),(107,'stewed tomatoes',NULL,NULL,NULL),(108,'tomato sauce',NULL,NULL,NULL),(109,'spaghetti sauce mix',NULL,NULL,NULL),(110,'broken spaghetti',NULL,NULL,NULL),(111,'diced ham; pork or chicken',NULL,NULL,NULL),(112,'oil',NULL,NULL,NULL),(113,'sliced mushrooms (optional)',NULL,NULL,NULL),(114,'chopped green onions',NULL,NULL,NULL),(115,'cold cooked rice',NULL,NULL,NULL),(116,'soy sauce',NULL,NULL,NULL),(117,'tbsp',NULL,NULL,NULL),(118,'onion; chopped quite large',NULL,NULL,NULL),(119,'celery; cut into large chunks',NULL,NULL,NULL),(120,'cooked pork; cubed',NULL,NULL,NULL),(121,'bean sprouts',NULL,NULL,NULL),(122,'mushroom soup or leftover pork gravy',NULL,NULL,NULL),(123,'water chestnuts; sliced',NULL,NULL,NULL),(124,'pea pods; frozen',NULL,NULL,NULL),(125,'chinese noodles',NULL,NULL,NULL),(126,'precooked rice; cook overnight',NULL,NULL,NULL),(127,'shrimp',NULL,NULL,NULL),(128,'green onions; diced',NULL,NULL,NULL),(129,'pineapple',NULL,NULL,NULL),(130,'pork 10derloin; cut into chunks',NULL,NULL,NULL),(131,'cornstarch',NULL,NULL,NULL),(132,'cold water',NULL,NULL,NULL),(133,'chicken coating mix',NULL,NULL,NULL),(134,'ice water',NULL,NULL,NULL),(135,'eggs: beaten',NULL,NULL,NULL),(136,'green pepper; sliced',NULL,NULL,NULL),(137,'carrot; diagonally sliced',NULL,NULL,NULL),(138,'ketchup',NULL,NULL,NULL),(139,'granulated sugar',NULL,NULL,NULL),(140,'ginger',NULL,NULL,NULL),(141,'lemon',NULL,NULL,NULL),(142,'pinapple chunks',NULL,NULL,NULL),(143,'Chicken breasts: cut in pieces',NULL,NULL,NULL),(144,'dry sherry',NULL,NULL,NULL),(145,'mushrooms; sliced',NULL,NULL,NULL),(146,'onion; minced',NULL,NULL,NULL),(147,'parsley',NULL,NULL,NULL),(148,'chicken breast halves; b1d and skinned',NULL,NULL,NULL),(149,'ground cumin',NULL,NULL,NULL),(150,'garlic salt',NULL,NULL,NULL),(151,'egg: beaten',NULL,NULL,NULL),(152,'cornmeal',NULL,NULL,NULL),(153,'avocado; peeled and sliced',NULL,NULL,NULL),(154,'monteray jack cheese; shredded',NULL,NULL,NULL),(155,'green onion tops; sliced',NULL,NULL,NULL),(156,'red pepper; chopped',NULL,NULL,NULL),(157,'cherry tomatoes',NULL,NULL,NULL),(158,'parsley sprigs',NULL,NULL,NULL),(159,'egg; slightly bea10',NULL,NULL,NULL),(160,'flour; sifted',NULL,NULL,NULL),(161,'seas1d salt',NULL,NULL,NULL),(162,'pepper',NULL,NULL,NULL),(163,'chicken; cut up',NULL,NULL,NULL),(164,'oil; for cooking',NULL,NULL,NULL),(165,'catalina french dressing',NULL,NULL,NULL),(166,'garlic powder',NULL,NULL,NULL),(167,'b1less; skinless chicken breast; cubed',NULL,NULL,NULL),(168,'any frozen mixed vegetable; thawed',NULL,NULL,NULL),(169,'leaf spinach; cut',NULL,NULL,NULL),(170,'butter; melted',NULL,NULL,NULL),(171,'skinless b1less chicken breasts; cut in 1/2',NULL,NULL,NULL),(172,'dry bread crumbs',NULL,NULL,NULL),(173,'basil leaves',NULL,NULL,NULL),(174,'shredded mozzarella cheese',NULL,NULL,NULL),(175,'chicken breasts',NULL,NULL,NULL),(176,'pea pods; fresh or frozen',NULL,NULL,NULL),(177,'green onions; sliced',NULL,NULL,NULL),(178,'bamboo shoots; drained',NULL,NULL,NULL),(179,'chicken boullion',NULL,NULL,NULL),(180,'cashews',NULL,NULL,NULL),(181,'chicken breast; sliced and marinated',NULL,NULL,NULL),(182,'sherry',NULL,NULL,NULL),(183,'green onion; sliced',NULL,NULL,NULL),(184,'mushrooms',NULL,NULL,NULL),(185,'pea pods',NULL,NULL,NULL),(186,'linguini',NULL,NULL,NULL),(187,'paprika',NULL,NULL,NULL),(188,'cayenne',NULL,NULL,NULL),(189,'nutmeg',NULL,NULL,NULL),(190,'basil',NULL,NULL,NULL),(191,'chicken; skinned and b1d',NULL,NULL,NULL),(192,'garlic; large',NULL,NULL,NULL),(193,'chicken broth',NULL,NULL,NULL),(194,'worchestershire sauce',NULL,NULL,NULL),(195,'skinless b1less chicken breasts',NULL,NULL,NULL),(196,'white onions; chopped',NULL,NULL,NULL),(197,'curry powder',NULL,NULL,NULL),(198,'broccoli florets; bite size pieces',NULL,NULL,NULL),(199,'cooking apple; cored and chopped',NULL,NULL,NULL),(200,'chopped peanuts',NULL,NULL,NULL),(201,'chicken parts',NULL,NULL,NULL),(202,'cream of mushroom soup',NULL,NULL,NULL),(203,'parsley; chopped',NULL,NULL,NULL),(204,'crushed stuffing mix',NULL,NULL,NULL),(205,'Italian salad dressing',NULL,NULL,NULL),(206,'parmasen cheese',NULL,NULL,NULL),(207,'bread crumbs',NULL,NULL,NULL),(208,'marinated artichoke hearts',NULL,NULL,NULL),(209,'salt; pepper; flour',NULL,NULL,NULL),(210,'sliced mushrooms',NULL,NULL,NULL),(211,'Uncle Ben\'s Converted Rice',NULL,NULL,NULL),(212,'slivered ham',NULL,NULL,NULL),(213,'sliced onion',NULL,NULL,NULL),(214,'mashed garlic',NULL,NULL,NULL),(215,'can Italian style tomatoes',NULL,NULL,NULL),(216,'red wine',NULL,NULL,NULL),(217,'Italian seasoning',NULL,NULL,NULL),(218,'chicken breasts; skinned and b1d',NULL,NULL,NULL),(219,'wine cooler',NULL,NULL,NULL),(220,'bouillon',NULL,NULL,NULL),(221,'garlic',NULL,NULL,NULL),(222,'cooked rice',NULL,NULL,NULL),(223,'chicken wings or drumettes',NULL,NULL,NULL),(224,'Louisiana-style hot sauce',NULL,NULL,NULL),(225,'melted butter or margarine',NULL,NULL,NULL),(226,'h1y',NULL,NULL,NULL),(227,'ground ginger',NULL,NULL,NULL),(228,'fresh green beans',NULL,NULL,NULL),(229,'dried tarragon',NULL,NULL,NULL),(230,'mushrooms; rinsed',NULL,NULL,NULL),(231,'onion',NULL,NULL,NULL),(232,'zucchini; shredded',NULL,NULL,NULL),(233,'fine dried bread crumbs',NULL,NULL,NULL),(234,'parmasen cheese; grated',NULL,NULL,NULL),(235,'dried oregano',NULL,NULL,NULL),(236,'green onion; minced',NULL,NULL,NULL),(237,'eggs; slightly beaten',NULL,NULL,NULL),(238,'monterey jack cheesed; shredded',NULL,NULL,NULL),(239,'cumin seed; crushed',NULL,NULL,NULL),(240,'dried oregano; crushed',NULL,NULL,NULL),(241,'spinach',NULL,NULL,NULL),(242,'eggs; beaten',NULL,NULL,NULL),(243,'swiss cheese; shredded',NULL,NULL,NULL),(244,'white bread; cubed',NULL,NULL,NULL),(245,'green onion',NULL,NULL,NULL),(246,'parmesan cheese',NULL,NULL,NULL),(247,'red potatoes',NULL,NULL,NULL),(248,'onion; grated',NULL,NULL,NULL),(249,'potatoes; unpeeled',NULL,NULL,NULL),(250,'onions',NULL,NULL,NULL),(251,'garlic; crushed',NULL,NULL,NULL),(252,'celery seed',NULL,NULL,NULL),(253,'salad oil',NULL,NULL,NULL),(254,'package of dry spaghetti sauce mix',NULL,NULL,NULL),(255,'green beans; dried',NULL,NULL,NULL),(256,'shredded lettuce',NULL,NULL,NULL),(257,'bacon; cut up',NULL,NULL,NULL),(258,'fresh mushrooms; sliced',NULL,NULL,NULL),(259,'worcestershire sauce',NULL,NULL,NULL),(260,'toast slices',NULL,NULL,NULL),(261,'sweet potatoes',NULL,NULL,NULL),(262,'oranges; sliced thin',NULL,NULL,NULL),(263,'zucchini',NULL,NULL,NULL),(264,'hamburger or sausage',NULL,NULL,NULL),(265,'croutons',NULL,NULL,NULL),(266,'boullion cube',NULL,NULL,NULL),(267,'thyme',NULL,NULL,NULL),(268,'oregano',NULL,NULL,NULL),(269,'sage',NULL,NULL,NULL),(270,'summer squash',NULL,NULL,NULL),(271,'cracker crumbs',NULL,NULL,NULL),(272,'bacon bits; crisply fried',NULL,NULL,NULL),(273,'red cabbage; shredded',NULL,NULL,NULL),(274,'unparred apple; cubed',NULL,NULL,NULL),(275,'caraway seed',NULL,NULL,NULL),(276,'mushroom stems and pieces; drained',NULL,NULL,NULL),(277,'frozen chopped spinach',NULL,NULL,NULL),(278,'low fat cottage cheese',NULL,NULL,NULL),(279,'grated parmesan cheese',NULL,NULL,NULL),(280,'eggs; lightly beaten',NULL,NULL,NULL),(281,'',NULL,NULL,NULL),(282,'grated swiss cheese',NULL,NULL,NULL),(283,'frozen hashbrown potatoes; thawed',NULL,NULL,NULL),(284,'dried onions or 1/2 cup fresh',NULL,NULL,NULL),(285,'cream of chcken soup',NULL,NULL,NULL),(286,'cheddar cheese; grated',NULL,NULL,NULL),(287,'melted butter',NULL,NULL,NULL),(288,'cornflakes; crushed',NULL,NULL,NULL),(289,'olive oil',NULL,NULL,NULL),(290,'garlic; pressed',NULL,NULL,NULL),(291,'parsley; minced',NULL,NULL,NULL),(292,'leaf oregano',NULL,NULL,NULL),(293,'artichoke hearts; drained; finely chopped',NULL,NULL,NULL),(294,'hot pepper liquid',NULL,NULL,NULL),(295,'Pie shell',NULL,NULL,NULL),(296,'dry mustard',NULL,NULL,NULL),(297,'fresh aparagus spears; washed and trimmed',NULL,NULL,NULL),(298,'tomato; sliced into four 1/4\" slices',NULL,NULL,NULL),(299,'beef',NULL,NULL,NULL),(300,'garlic; chopped',NULL,NULL,NULL),(301,'chili powder',NULL,NULL,NULL),(302,'red kidney beans',NULL,NULL,NULL),(303,'tortillas',NULL,NULL,NULL),(304,'beef bouillon',NULL,NULL,NULL),(305,'boiling water',NULL,NULL,NULL),(306,'minute rice; uncooked',NULL,NULL,NULL),(307,'frozen broccoli; chopped',NULL,NULL,NULL),(308,'celery; chopped',NULL,NULL,NULL),(309,'mushroom soup',NULL,NULL,NULL),(310,'Cheeze Whiz',NULL,NULL,NULL),(311,'cottage cheese',NULL,NULL,NULL),(312,'jack cheese; shredded',NULL,NULL,NULL),(313,'diced green chiles',NULL,NULL,NULL),(314,'oregano or italian seasoning',NULL,NULL,NULL),(315,'ground beef',NULL,NULL,NULL),(316,'taco seasoning mix',NULL,NULL,NULL),(317,'chopped green chiles; drained',NULL,NULL,NULL),(318,'Bisquick baking mix',NULL,NULL,NULL),(319,'tomatoes',NULL,NULL,NULL),(320,'monterey jack or cheddar cheese; shredded',NULL,NULL,NULL),(321,'fresh basil or parsley; crushed',NULL,NULL,NULL),(322,'red or green pepper; cut up',NULL,NULL,NULL),(323,'reduced calorie mayonnaise',NULL,NULL,NULL),(324,'parmesan cheese; grated',NULL,NULL,NULL),(325,'ground red pepper',NULL,NULL,NULL),(326,'ground black pepper',NULL,NULL,NULL),(327,'fettucine or linguine',NULL,NULL,NULL),(328,'carrots; julienned',NULL,NULL,NULL),(329,'cooked chicken or turkey breast; cut into strips',NULL,NULL,NULL),(330,'green onions; chopped',NULL,NULL,NULL),(331,'cumin',NULL,NULL,NULL),(332,'shredded cheese',NULL,NULL,NULL),(333,'corn tortillas',NULL,NULL,NULL),(334,'enchilada sauce',NULL,NULL,NULL),(335,'fresh spinach',NULL,NULL,NULL),(336,'bacon',NULL,NULL,NULL),(337,'green onion; chopped',NULL,NULL,NULL),(338,'clove garlic; minced',NULL,NULL,NULL),(339,'swiss cheese; grated',NULL,NULL,NULL),(340,'fresh ripe tomato',NULL,NULL,NULL),(341,'chopped onion',NULL,NULL,NULL),(342,'spanish seasoning',NULL,NULL,NULL),(343,'cream corn',NULL,NULL,NULL),(344,'pitted olives',NULL,NULL,NULL),(345,'tomato soup',NULL,NULL,NULL),(346,'grated cheese',NULL,NULL,NULL),(347,'frozen hashbrowns; thawed',NULL,NULL,NULL),(348,'teaspoon salt',NULL,NULL,NULL),(349,'dried onion or 1/2 cup fresh',NULL,NULL,NULL),(350,'cream of chicken soup',NULL,NULL,NULL),(351,'lasagna noodles',NULL,NULL,NULL),(352,'garlic; finely chopped',NULL,NULL,NULL),(353,'shallots; finely chopped',NULL,NULL,NULL),(354,'button mushrooms; chopped',NULL,NULL,NULL),(355,'shitake mushrooms; chopped',NULL,NULL,NULL),(356,'gorgonzola; crumbled',NULL,NULL,NULL),(357,'fresh parmesan; grated',NULL,NULL,NULL),(358,'tomato paste',NULL,NULL,NULL),(359,'frozen chopped spinach; thaw and squeeze dry',NULL,NULL,NULL),(360,'ricotta cheese',NULL,NULL,NULL),(361,'dried basil',NULL,NULL,NULL),(362,'grated nutmeg',NULL,NULL,NULL);
/*!40000 ALTER TABLE `ingredient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meal_plan`
--

DROP TABLE IF EXISTS `meal_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meal_plan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `plan_name` varchar(100) DEFAULT NULL,
  `description` text,
  `active` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_meal_plan_user1_idx` (`user_id`),
  CONSTRAINT `fk_meal_plan_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meal_plan`
--

LOCK TABLES `meal_plan` WRITE;
/*!40000 ALTER TABLE `meal_plan` DISABLE KEYS */;
INSERT INTO `meal_plan` VALUES (1,1,'Test Plan','Test Description',1);
/*!40000 ALTER TABLE `meal_plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meal_plan_recipe`
--

DROP TABLE IF EXISTS `meal_plan_recipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meal_plan_recipe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `meal_plan_id` int(11) NOT NULL,
  `recipe_id` int(11) NOT NULL,
  `sequence_number` int(11) NOT NULL,
  `day_name` enum('Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday') DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_week_recipe1_idx` (`recipe_id`),
  KEY `fk_week_meal_plan1_idx` (`meal_plan_id`),
  KEY `fk_meal_plan_recipe_type_idx` (`type_id`),
  CONSTRAINT `fk_meal_plan_recipe_type` FOREIGN KEY (`type_id`) REFERENCES `recipe_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_week_meal_plan1` FOREIGN KEY (`meal_plan_id`) REFERENCES `meal_plan` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_week_recipe1` FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meal_plan_recipe`
--

LOCK TABLES `meal_plan_recipe` WRITE;
/*!40000 ALTER TABLE `meal_plan_recipe` DISABLE KEYS */;
INSERT INTO `meal_plan_recipe` VALUES (1,1,2,1,'Sunday',1);
/*!40000 ALTER TABLE `meal_plan_recipe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipe`
--

DROP TABLE IF EXISTS `recipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `date_created` date NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `creator_id` int(11) NOT NULL DEFAULT '1',
  `is_public` tinyint(4) NOT NULL DEFAULT '1',
  `prep_time` varchar(45) DEFAULT NULL,
  `instructions` text,
  `photo_link` varchar(5000) DEFAULT NULL,
  `cookbook` varchar(100) DEFAULT NULL,
  `cookbook_page_number` varchar(45) DEFAULT NULL,
  `web_link` varchar(5000) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_idx` (`category_id`),
  KEY `fk_recipe_creator_idx` (`creator_id`),
  KEY `fk_recipe_type` (`type_id`),
  CONSTRAINT `fk_recipe_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_recipe_creator` FOREIGN KEY (`creator_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_recipe_type` FOREIGN KEY (`type_id`) REFERENCES `recipe_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe`
--

LOCK TABLES `recipe` WRITE;
/*!40000 ALTER TABLE `recipe` DISABLE KEYS */;
INSERT INTO `recipe` VALUES (1,'Peanut Butter and Jelly Sandwich','2019-11-14',1,1,1,'5','1. Spread peanut butter onto one piece of bread. 2. Spread jelly onto a second piece of bread. 3. Combine and enjoy.','https://tmbidigitalassetsazure.blob.core.windows.net/secure/RMS/attachments/37/1200x1200/Peanut-Butter-and-Jelly-French-Toast_EXPS_BMZ19_526_B12_04_10b.jpg','The Bachelor’s Cookbook','1','',3,2),(2,'Spaghetti ','2019-11-14',1,1,1,'20','1. Boil noodles for 8 minutes and drain. 2. Pour spaghetti sauce into a pot and warm 3. Combine and eat.','https://www.inspiredtaste.net/wp-content/uploads/2019/03/Spaghetti-with-Meat-Sauce-Recipe-3-1200.jpg','The Bachelor’s Cookbook','2','',4,3),(3,'Buttered Toast','2019-11-14',1,1,1,'3','1. Place a slice of bread into the toaster & toast to desired crispness. 2. Remove and spread a layer of butter onto the toast. 3. Eat','https://cdn-image.myrecipes.com/sites/default/files/styles/pronto_crop_large/public/assets%252Fmessage-editor%252F1467176631211-diner-toast-knife-inline_0.jpg','The Bachelor’s Cookbook','3','',3,1),(4,'Pizza','2019-11-14',1,1,1,'20','1. Spread pizza sauce onto pizza crust. 2. Add mozzarella cheese. 3. Cook in the oven at 375 for 20 minutes. 4. Remove and cool for 5 minutes. 5. Slice and chow down.','https://i.iheart.com/v3/re/new_assets/5d710bf67e5b163a524c72b2','The Bachelor’s Cookbook','4','',4,3),(5,'Ramen','2019-11-14',1,1,1,'5','1. Boil ramen in a pot of water for 3-5 minutes. 2. Add seasoning 3. Allow to cool to desired temperature and enjoy.','https://images-na.ssl-images-amazon.com/images/I/915AEp17FaL._SL1500_.jpg','The Bachelor’s Cookbook','5','',2,3),(6,'Banana Cake','2019-11-14',1,1,1,NULL,'Bake in three layer pans at 350 degrees.',NULL,NULL,NULL,NULL,NULL,NULL),(7,'Blueberry Coffee Cake','2019-11-14',1,1,1,NULL,'Mix butter; 1 cup sugar; flour; 2 eggs; 2 tsp vanilla; baking powder; and milk to make cake batter. Blend easily.  Add 3 cups of blueberries.  Put 2 1/2 cups of batter in pan. Mix cream cheese; 1/2 cup sugar; 1 egg; lemon juice and 1 tsp vanilla to make filling.  Put filling on top of batter.  Top with remaining batter. Make streusel topping from flour; butter; brown sugar; ad cinnamon.  Sprinkle on top of cake. Bake at 375 degrees for 1 hour and 5 minutes.  Check after 50 minutes.',NULL,NULL,NULL,NULL,NULL,NULL),(8,'Chocolate Cake','2019-11-14',1,1,1,NULL,'Mix all ingredients together.  Pour in 1 cup boiling water.  Mix well.  Bake about 35 minutes at 375 degrees.',NULL,NULL,NULL,NULL,NULL,NULL),(9,'Crazy Cake','2019-11-14',1,1,1,NULL,'Mix first 5 ingredients well; about 4 minutes.  Bake at 350 degrees in a 9x13 pan for 35 minutes. Poke holes in warm cake and pour on mixture of powdered sugar and lemon juice.',NULL,NULL,NULL,NULL,NULL,NULL),(10,'Fresh Apple Cake','2019-11-14',1,1,1,NULL,'Mix apples and sugar well.  Add oil; nuts; and eggs.  Add vanilla and dry ingredients.  Bake at 350 degrees for 40-45 minutes.  Serve with whipped cream or top with cream cheese frosting.',NULL,NULL,NULL,NULL,NULL,NULL),(11,'Blue Chip Cookies','2019-11-14',1,1,1,NULL,'Mix at low speed.  Add chocolate chips and nuts by hand.  Press into balls in cookie scoop.  Bake at 300 degrees for 15 minutes on middle rack.',NULL,NULL,NULL,NULL,NULL,NULL),(12,'Bourbon Balls','2019-11-14',1,1,1,NULL,'Melt chocolate in double boiler over hot water.  Combine syrup and liquid.  Combine crumbs; sugar; and nuts.  Add chocolate mixture.  Let stand 30 minutes.  Shape in 1\" balls.  Roll in granulated or powdered sugar.  Let ripen i covered container at lest 3 days.',NULL,NULL,NULL,NULL,NULL,NULL),(13,'Chocolate Crisp Bran Cookies','2019-11-14',1,1,1,NULL,'Sift flour; soda; and salt.  Blend butter and sugar.  Add eggs and vanilla; beat well.  Add All-Bran cereal and chocolate chips.  Add dry ingredients; mix well.  Drop by spoonful onto cookie sheet.  Bake at 375 degrees about 12 minutes.',NULL,NULL,NULL,NULL,NULL,NULL),(14,'Chocolate Peanut Brunch Bars','2019-11-14',1,1,1,NULL,'Blend first 5 ingredients until it resembles corn meal.  Add egg and vanilla.  Mix well.  Press firmly into ungreased jelly roll pan.  Bake at 350 degrees for 25 minutes.  Cool slightly.  Melt chocolate over hot water.  Stir in peanut butter and cereal.  Spread on cookie dough.  Let stand until chocolate sets.  Cut into 35 bars.',NULL,NULL,NULL,NULL,NULL,NULL),(15,'Chocolate Trio Squares','2019-11-14',1,1,1,NULL,'Cream butter; mis in four; and salt.  Spread in greased and floured 9\" pan.  Bake 15 minutes at 350 degrees.  Beat eggs and sugar until smooth. Stir in all other ingredients and blend well.  Spread over first layer.  Bake 350 degrees for 15 minutes.  Cool in pan.',NULL,NULL,NULL,NULL,NULL,NULL),(16,'Broccoli Curry Salad','2019-11-14',1,1,1,NULL,'Mix all ingredients and enjoy',NULL,NULL,NULL,NULL,NULL,NULL),(17,'Broccoli Salad','2019-11-14',1,1,1,NULL,'Pour dressing over salad two hours before serving.',NULL,NULL,NULL,NULL,NULL,NULL),(18,'Five Cup Salad','2019-11-14',1,1,1,NULL,'Combine all ingredients.  Chill overnight.',NULL,NULL,NULL,NULL,NULL,NULL),(19,'Chicken Noodle Soup','2019-11-14',1,1,1,NULL,'Boil chicken; remove from bones and chop.  Set aside.  Cook potato; carrots; celery; and onion in water to cover.  When tender add the chicken; bouillon cubes; poultry seasoning; and salt.  Add a large handful of narrow egg noodles.  Add more liquid if necessary and cook until noodles are tender.',NULL,NULL,NULL,NULL,NULL,NULL),(20,'Cleo\'s Clam Chowder','2019-11-14',1,1,1,NULL,'Boil potatoes.  Save water.  When potatoes are tender add bacon; onion; and celery.  Add half and half; milk and seasonings.  Thicken with a cup of flour mixed with water.  Add to boiling soup.  Stir in clams; but not too soon or they will get tough.',NULL,NULL,NULL,NULL,NULL,NULL),(21,'Creamy Zucchini Mushroom Soup','2019-11-14',1,1,1,NULL,'Combine zucchini; onion; garlic and butter in 2 qt. microwave-safe casserole.  Cover and microwave on high setting 5 to 7 minutes; stirring every 3 minutes; until vegetables are tender.  Place zucchini mixture in blender container; blend until smooth.  Return to casserole dish; add all remaining ingredients except sour cream; pepper and pine nuts.  Cover and microwave 5 to 6 minutes; or until heated through.  Stir in sour cream and season to taste with pepper.  Ladle into soup bowls and garnish with sprinkle of pine nuts.  Serve immediately.',NULL,NULL,NULL,NULL,NULL,NULL),(22,'Elephant Stew','2019-11-14',1,1,1,NULL,'Cut elephant into bite-size pieces.  (Allow approximately 12 months.)  Add enough gravy to cover.  Cook over kerosene fire for 4 weeks at 463 degrees.  Makes 3;300 servings.  To extend recipe add rabbits; but only if necessary; as some people do not like to find hare in their stew. Brown the meat; then add all of the ingredients; except the cabbage. Cover with water and simmer for about an hour until veggies are tender.  Then add the chopped cabbage and simmer again for about a half hour.  Add more liquid if necessary.',NULL,NULL,NULL,NULL,NULL,NULL),(23,'Minestrone Soup','2019-11-14',1,1,1,NULL,'Brown hamburger and onions.  Add all other ingredients with enough water to cover.  Simmer two to three hours then add spaghetti and cook until tender.',NULL,NULL,NULL,NULL,NULL,NULL),(24,'Chinese Fried Rice','2019-11-14',1,1,1,NULL,'Saute onion and meat in oil. Add other ingredients except egg. Cook on low heat about 15 to 20 minutes. Beat egg with a tablespoon of milk. Melt butter in skillet; pour in egg and cook until solid. Slice in thin strips to put over the rice as garnish on the platter.',NULL,NULL,NULL,NULL,NULL,NULL),(25,'Pork Fu Man Chow','2019-11-14',1,1,1,NULL,'Saute onion and celery in oil. Add pork; bean sprouts and all other ingredients except peas and noodles. Simmer for 30 minutes. Add peas and simmer for 30 more minutes. Serve over noodles.',NULL,NULL,NULL,NULL,NULL,NULL),(26,'Shrimp Pineapple Fried Rice','2019-11-14',1,1,1,NULL,'Fry cooled rice in oil in a skillet. Add shrimp; onions and pineapple. Add soy sauce to taste.',NULL,NULL,NULL,NULL,NULL,NULL),(27,'Sweet and Sour Pork','2019-11-14',1,1,1,NULL,'Cut pork into chunks. Marinade for 30 minutes in dressing made by combining: salt; soy sauce; cornstarch; and water. Drain pork and dip in a batter of coating mix; ice water; and egg. Brown in a few tablespoons of oil in a wok about 3 minutes or until brown and crisp. Remove with a slotted spoon. Add green pepper; onion; and carrot. Stir fry about 5 minutes. Add sweet and sour sauce made by combining: ketchup; brown sugar; white sugar; cinnamon; ginger; and juice of the large lemon. Stir until sauce thickens. Add pineapple chunks and the pork. Ser with hot steamed rice.',NULL,NULL,NULL,NULL,NULL,NULL),(28,'Albert\'s Chicken','2019-11-14',1,1,1,NULL,'Place chicken in casserole. Heat together remaining ingredients to make sauce. Pour sauce over chicken. Cook in electric skillet or 350 degree oven for about 1 hour.',NULL,NULL,NULL,NULL,NULL,NULL),(29,'Avocado Chicken Melt','2019-11-14',1,1,1,NULL,'Using a meat mallet and a hard surface; pound the chicken to 1/4 inch thickness. Mix together the cornstarch; cumin and garlic salt. Add the chicken 1 piece at a time; dredging to coat. Mix the egg and water in a small bowl. Put the cornmeal in another small bowl. Dip the chicken first in the egg wash and then in the cornmeal; turning to coat. Heat the oil in a large frying pan until hot. Add the chicken and cook for 2 minutes on each side. Remove the chicken to a shallow baking pan. Place avocado slices over the chicken and sprinkle cheese. Bake in a preheated 350 degree oven about 15 minutes; or until a fork can be inserted with ease and the cheese is melted. Top the cheese layer with the sour cream. Sprinkle with green onion and red pepper. Garnish with cherry tomatoes and parsley.',NULL,NULL,NULL,NULL,NULL,NULL),(30,'Batter Fried Chicken','2019-11-14',1,1,1,NULL,'Make better. Dip chicken; drain 5 to 10 minutes on rack. Fill dutch oven 1/3 full of oil; heat to 375 degrees. Cook chicken about 12 minutes. Drain on paper towels.',NULL,NULL,NULL,NULL,NULL,NULL),(31,'Catalina Chicken Stir Fry','2019-11-14',1,1,1,NULL,'Heat dressing; soy sauce and garlic powder in large skillet. Stir in chicken and completely cook; about 8 minutes. Add vegetables and cook; stirring until heated. Serve over cooked rice.',NULL,NULL,NULL,NULL,NULL,NULL),(32,'Chicken Breasts Florentine','2019-11-14',1,1,1,NULL,'Cook spinach as directed on package; squeeze to drain. Stir in butter; set aside. Place 1 chicken breast; half b1d side up; between 2 pieces of plastic wrap or waxed paper. Working from center; gently pound chicken with rolling pin or flat side of meat mallet until about 1/4 inch thick. Repeat with remaining chicken breast. In small bowl; combine bread crumbs and basil. Coat chicken breasts with crumb mixture. Heat oil over medium-high heat in large skillet. Cook chicken breasts 5 to 7 minutes on each side or until lightly browned and no longer pink. Reduce heat. Spoon cooked spinach evenly over each chicken breast half; sprinkle with cheese. Cover; cook until cheese is melted.',NULL,NULL,NULL,NULL,NULL,NULL),(33,'Chicken Cashew','2019-11-14',1,1,1,NULL,'Skin; bone and cut chicken into bit-size pieces. Put chicken in a casserole and cook; covered; until opaque and tender. Stir several times during cooking. Add pea pods (break off ends and remove strings); onions and mushrooms; stir. Cook; covered for 2 minutes. Add bamboo shoots and water chestnuts. Mix chicken bouillon; soy sauce; cornstarch; sugar; pepper; salt. Add to chicken mixture. Stir. Cook covered until the sauce has thickened and the food is well heated. Stir in cashews. Serve with rice. Makes 6 servings.',NULL,NULL,NULL,NULL,NULL,NULL),(34,'Chicken Lo Mein','2019-11-14',1,1,1,NULL,'Marinate chicken in mixture of soy sauce; sherry; and cornstarch. Cook chicken in oil in a wok and remove when done. Cook green onions; mushrooms; pea pods; and pepper. Add the bouillon and stir in chicken. Serve over linguini',NULL,NULL,NULL,NULL,NULL,NULL),(35,'Chicken Paprika','2019-11-14',1,1,1,NULL,'Mix first 8 ingredients in a bag and shake the chicken to coat. Brown the chicken in hot oil. Place in large baking dish. Saute the garlic in oil for 1 minute. Blend in remaining ingredients. Stir and heat. Pour over chicken. Bake uncovered for 1 hour at 325 degrees.',NULL,NULL,NULL,NULL,NULL,NULL),(36,'In a Hurry Chicken Curry','2019-11-14',1,1,1,NULL,'Cut chicken into 1 inch cubes. Heat 2 tablespoons of oil over medium-high heat in a large skillet or wok. Add chicken and saute; stirring for about 5 minutes. Remove to side dish. Place remaining tablespoon of oil in the skillet and cook white onion; garlic and green onion until 10der. Stir in curry; ginger and cornstarch. Slowly add chicken broth; stir until smooth. Add broccoli; apple; raisins and cooked chicken. Cover and simmer for 10 minutes. Serve on a bed of rice and garnish with chopped peanuts. Makes 4 servings.',NULL,NULL,NULL,NULL,NULL,NULL),(37,'Oven Fried Chicken','2019-11-14',1,1,1,NULL,'Mix soup; milk; onion; and parley. Dip chicken in this; then into crumbs. Bake at 400 degrees for 1 hour. Drizzle butter over chicken.',NULL,NULL,NULL,NULL,NULL,NULL),(38,'Parsley and Parmasen Baked Chicken','2019-11-14',1,1,1,NULL,'Marinate chicken for 4 hours in the dressing. Spoon over and turn occasionally. Drain. Reserve dressing. Combine eggs and water. Mix the rest of the ingredients in a plastic bag. Dip chicken in egg; then in crumbs and return to baking dish. Spoon dressing on top. Bake at 350 degrees for 40 to 50 minutes.',NULL,NULL,NULL,NULL,NULL,NULL),(40,'Saute\'d Chicken Breasts','2019-11-14',1,1,1,NULL,'Brown chicken with paprika. Cook 15 minutes. Remove to warm platter. Cook mushrooms in wine. Add bouillon; 4; and seasonings. Put rice on platter with chicken. Pour mushroom sauce over all.',NULL,NULL,NULL,NULL,NULL,NULL),(41,'Spicy Singapore Wings','2019-11-14',1,1,1,NULL,'If using wings; remove and discard tips; cut wings into 2 pieces at the joint. Broil chicken 20 to 25 minutes; or deep fat fry at 375 degrees for 10 to 12 minutes. Combine remaining ingredients. Brush sauce on wings or drummettes to coat evenly. Makes 14 to 20 hot appetizers.',NULL,NULL,NULL,NULL,NULL,NULL),(42,'Baked Zucchini with Mushrooms','2019-11-14',1,1,1,NULL,'Thinly sliced mushrooms and chop onion; combine in a 10 to 12 inch frying pan with half a cup of water. Stir often on high heat until liquid evaporates and browned bits stick to pan. To deglaze pan; add 1 third cup of broth and stir browned bits free. Repeat deglazing step until onion is golden brown; 2 or 3 more times; using 1 third cup broth each time. Beat eggs to blend; stir in zucchini crumbs; cheese; oregano; pepper; and mushroom mixture. Pour into a buttered 10 by 12 inch shallow oval casserole (or a 9 by 13 inch rectangle). Bake in a 325 degree oven until set in center when shaken; about 45 minutes top with green onions.',NULL,NULL,NULL,NULL,NULL,NULL),(43,'Bit O\' Zucchini Bites','2019-11-14',1,1,1,NULL,'In a large skillet cook onion and garlic in butter or margarine until onion is tender but not brown. Add zucchini and stir about 2 minutes or till crisp-tender. Remove from heat. In a bowl mix eggs; cheese; cornmeal; cumin; oregano; and zucchini mixture. Spoon a scant 2 tablespoons of the egg mixture into individual greased 1 and 3 quarter inch muffin pans. Bake at 325 degrees for 15 to eighteen minutes or until set. Remove from pans. Or; pour all the batter into a greased 8 by 8 by 2 inch baking pan. Bake for 20 to 25 minutes or until set. Cut in bite size squares. Serve hot. Makes about 24 appetizers.',NULL,NULL,NULL,NULL,NULL,NULL),(44,'Cheesy Spinach Bake','2019-11-14',1,1,1,NULL,'Combine. Pour into 1 quart dish. Bake at 375 degrees for 25 minutes.',NULL,NULL,NULL,NULL,NULL,NULL),(45,'Crisp Potato Pancakes','2019-11-14',1,1,1,NULL,'Grate potatoes coarsely. Grate onion. Season with slat and pepper. Add bea10 egg. Form in 2 inch patties. Fry in 1/4 inch of hot oil. Serve with poached egg and salsa or sour cream and chives.',NULL,NULL,NULL,NULL,NULL,NULL),(46,'Easy Oven Baked Potatoes','2019-11-14',1,1,1,NULL,'Cut potatoes and onions into 1/4 inch slices. Layer in baking dish. Combine remaining ingredients. Drizzle over top. Bake at 350 degrees for 40 minutes covered. Uncover and bake 20 minutes more. Makes 8 servings.',NULL,NULL,NULL,NULL,NULL,NULL),(47,'Green Beans Salerno','2019-11-14',1,1,1,NULL,'Combine salad oil; vinegar and spaghetti sauce mix. Pour over drained beans. Chill. Before serving; toss beans with shredded lettuce and crumbled bacon.',NULL,NULL,NULL,NULL,NULL,NULL),(48,'Mushrooms in Sour Cream','2019-11-14',1,1,1,NULL,'In skillet; fry bacon until crisp. Drain on paper towel. Add onion and mushrooms. Saute 10 minutes on low heat. Stir in flour. Add cream and worcestershire sauce. Cook on low; stirring constantly. Spoon over toast. Sprinkle bacon on top.',NULL,NULL,NULL,NULL,NULL,NULL),(49,'Orange Sweet Potatoes','2019-11-14',1,1,1,NULL,'Peel and cut potatoes into 1/2 inch slices. Put potatoes in a large pot of water; butter and sugar. Boil to fork tender. Do not overcook. Save liquid. Gently remove potatoes and layer in a 9x13 inch baking dish. Top with orange slices. Cook liquid down until syrupy. Pour over potatoes. Sprinkle with cinnamon. Bake at 350 degrees for 30 to 40 minutes;',NULL,NULL,NULL,NULL,NULL,NULL),(50,'Saute Zucchini','2019-11-14',1,1,1,NULL,'Melt butter in skillet. Slice zucchini thin; Add garlic. Cover and simmer for 5 minutes. Sprinkle with parmesan cheese. Cover and cook 5 minutes longer.',NULL,NULL,NULL,NULL,NULL,NULL),(51,'Stuffed Zucchini','2019-11-14',1,1,1,NULL,'Cook zucchini to fork tender. Slice lengthwise. Remove center pulp to bowl. Brown hambugrer or sausage with chopped onion. Mix with pulp. Add croutons that have been sof10ed in water boullion cube. Add spices to taste. Stir in 2 eggs. Mixture will be quite soft. Spoon into zucchini shells. Sprinkle with parmesan and melted butter or olive oil. Bake 1/2 hour at 350 degrees until filling is set.',NULL,NULL,NULL,NULL,NULL,NULL),(52,'Summer Squash','2019-11-14',1,1,1,NULL,'Boil squash until tender. Mash with butter; salt; pepper; worcestershire sauce; 2 eggs; cracker crumbs; onion and parmesan cheese. Put in casserole; top with paprika and bacon bits. Bake about 30 minutes.',NULL,NULL,NULL,NULL,NULL,NULL),(53,'Sweet and Sour Red Cabbage','2019-11-14',1,1,1,NULL,'Heat oil in skillet. add cabbage and apple. Combine rest of ingredients; pour over cabbage; Cover tightly. Cook over low heat; sit occasionally for 15-20 minutes; until tender.',NULL,NULL,NULL,NULL,NULL,NULL),(54,'Three Cheese Spinach','2019-11-14',1,1,1,NULL,'Combine onions and mushrooms in small microwave-safe bowl. Microwave 1 to 3 minutes or until onions are soft. Place spinach in 1.5 quart microwave-safe casserole. Cover and microwave 6 to 9 minutes; breaking up and rearranging every 3 minutes; until defrosted. Drain well. Add onion mixture to spinach; along with cottage cheese; parmesan cheese; eggs; salt and pepper. Stir well to blend. Microwave; uncovered; 8 to 11 minutes; rotating dish if necessary every 3 minutes; until misture is headted through and set. Sprinkle grated cheese over top and dust lightly with paprika. Microwave about 1 minute longer to melt cheese. Let stand 3 minutes before serving. Yields 6 to 8 servings.',NULL,NULL,NULL,NULL,NULL,NULL),(55,'Tulelake Potato Casserole','2019-11-14',1,1,1,NULL,'Thaw potatoes. Mix first 8 ingredients. Put in 9\" x 13\" casserole dish. Top with cornflakes and melted butter mixture. Bake at 350 degrees for 50 minutes. Can be prepared ahead and frozen.',NULL,NULL,NULL,NULL,NULL,NULL),(56,'Zucchini Patties','2019-11-14',1,1,1,NULL,'Courslet shred zucchini into a bowl. Press out water. Add rest of ingredients; except oil. Heat oil in skillet. Drop mixture by spoonfuls. Brown on both sides. May also be topped with spaghetti sauce.',NULL,NULL,NULL,NULL,NULL,NULL),(57,'Artichoke-Mozzarella Casserole','2019-11-14',1,1,1,NULL,'Heat the olive oil in a small frying pand and saute the onion; garlic; parsley and oregano in it until the onions are soften well. Beat the eggs and stir in the sauteed mixture; the artichoke hearts; bread crumbs; cheese; and salt. Add a dash of hot pepper liquid and stir to mix well. Preheat oven to 350 degrees. Turn into a lightly greased 9-inch square baking dish and bake for about 1/2 hour; or until set. Serves 4 to 6.',NULL,NULL,NULL,NULL,NULL,NULL),(58,'Asparagus Tomato Quiche','2019-11-14',1,1,1,NULL,'Preheat oven to 375 degrees. Beat eggs with next 4 ingredients; stir in cheese. Saving 6 asparagus spears for the top; chop the rest into 1\" lengths; lay on bottom of pie shell; pour in liquid. Bake 20 minutes. Remove and quickly arrange tomato and asparagus on top in a wagon wheel pattern. Bake another 20-30 minutes. Serves 4 to 6.',NULL,NULL,NULL,NULL,NULL,NULL),(59,'Beef Enchiladas','2019-11-14',1,1,1,NULL,'Saute beef with garlic; salt; vinegar; water; and chili powder. Stir in beans. Set aside. In hot oil in skillet saute garlic and onion until golden. Remove from heat; stir in flour; tomato sauce; vinegar; and hot bouillon. Bring to boil. Add chili powder; salt and pepper. Simmer 5 min. Preheat oven to 350 degrees. Place 1/3 cup filling in center of each tortilla which has been dipped in hot oil or sauce. Roll up; arrange seam down in baking dish. Pour sauce over all. Sprinkle with cheese. Bake about 25 minutes.',NULL,NULL,NULL,NULL,NULL,NULL),(60,'Broccoli and Rice Casserole','2019-11-14',1,1,1,NULL,'Cook rice and put in buttered casserole. Boil broccoli according to instructions on the package. Brown onions and celery in butter; add cooked broccoli and soup together. Pour over rice; top with cheese. Can use grated cheddar if you choose. Dot with butter. Put in oven until heated about 10 to 15 minutes at 350 degrees. Can be made ahead of time and frozen. hen frozen; allow to thaw completely then heat about 10 minutes longer.',NULL,NULL,NULL,NULL,NULL,NULL),(61,'Chili Cheese Puff','2019-11-14',1,1,1,NULL,'Preheat oven to 350 degrees. In medium size bowl beat eggs until light and lemon colored. Add flour; baking powder; salt; cottage cheese; and jack cheese. Blend until smooth. Stir in chiles. Pour into buttered 9\" x 13\" baking dish. Bake 35 minutes or until top is brown and firm.',NULL,NULL,NULL,NULL,NULL,NULL),(62,'Crazy Crust Pizza','2019-11-14',1,1,1,NULL,'Mix well. Pour into greased and floured pan. Top with 1.5 pounds browned ground beef or sausage; and pepperoni. Add 1 can drained slice mushrooms over top. Bake at 375 degrees for 10 minutes. Add pizza sauce; cheese; etc. Bake 20 minutes more.',NULL,NULL,NULL,NULL,NULL,NULL),(63,'Impossible Taco Pie','2019-11-14',1,1,1,NULL,'Heat oven to 400 degrees. Grease pie plate; 10 x 1.5”. Cook and stir beef and onion until brown. Beat milk; baking mix and eggs until smoth; 15 seconds in blender on high or 1 minute with hand beater. Pour into plate. Bake 25 minutes. Top with tomatoes and cheese. Bake until knife inserted between center and edge comes out clean; 8 to 10 minutes. Cool 5 minutes. Top with sour cream; tomatoes; lettuce and cheese if desired. Serves 6 to 8.',NULL,NULL,NULL,NULL,NULL,NULL),(64,'Pasta Primavera','2019-11-14',1,1,1,NULL,'For pesto; in a blender container or food processor bowl. Place fresh basil or parsley; red or green pepper; mayonnaise; parmesan cheese; lemon juice; salt; red pepper and black pepper. Cover; blend or process till pureed. Set aside. In a large amount of boiling salted water cook pasta for 6 minutes. Add carrots and onion. Return to boiling, Drain pasta and vegetables; return to saucepan. Stir in pesto; add chicken to turkey. Toss well to combine. Cook over very low heat for 2 minutes or until heated through; tossing occasionally. Serve immediately. Makes 4 servings.',NULL,NULL,NULL,NULL,NULL,NULL),(65,'Sour Cream Enchiladas','2019-11-14',1,1,1,NULL,'Blend sour cream; onions; cumin; and cheese. Heat tortillas in oil to make them flexible. Put small amount of sauce in bottom of baking dish. Roll filling in tortillas. Place in pan. Put remained of sauce over top. Top with cheese. Bake at 375 degrees for 20 minutes. Make 6 servings. This recipe also works well for chicken enchiladas. Just add two cooked chicken breasts; cut into bite-size pieces.',NULL,NULL,NULL,NULL,NULL,NULL),(66,'Spinach Fritatta','2019-11-14',1,1,1,NULL,'Wash spinach. Cover and steam 3 to 4 minutes; just until wilted. refresh under cold water; drain and squeeze out all moisture. Chop to 3/4 cup. Set aside. Fry bacon and crumble; set aside. Saute spinach; green onions; garlic; and basil in bacon drippings until soft and tender. Add salt and pepper. Beat eggs with water until frothy; pour over vegetables in skillet. Sprinkle bacon on top. Cook on medium heat until eggs are set. Lift edges of set portion and let uncooked egg flow beneath. Cook until done; about 7 to 8 minutes. Sprinkle with cheese. Place under broiler 2 or 3 minutes until eggs are completely set and cheese is bubbly. Serve with salsa.',NULL,NULL,NULL,NULL,NULL,NULL),(67,'Stuffed Green Peppers','2019-11-14',1,1,1,NULL,'Parboil peppers. Mix all the above. Fill peppers. Place in casserole. Pour tomato sauce over top. Bake 1 hour at 350 degrees.',NULL,NULL,NULL,NULL,NULL,NULL),(68,'Wild Mushroom and Spinach Lasanga','2019-11-14',1,1,1,NULL,'Cook lasagna noodles according to package intsructions; set aside. Place oil in large; heavy skillet over medium heat. Add garlic and shallots; cook about 5 minutes; until soft. Add mushrooms; cook until liquid is evaporated; about 10 minutes. With slotted spoon; transfer to a large bowl and reserve. Melt butter in skillet; blen in flour and cook for 2 minutes; sturring constantly. Gradually whisk in milk; bring to a simmer. Cook; stirring; until sauce thickens; about 5 minutes. Stir in gorgonzola; 1/2 up parmesan and the tomato paste. Continue cooking and stirring until the cheese is melted. Stir half the mushrooms misture into sauce. Add salt and pepper to taste. remove from heat; reserve. In large mixing bowl; combine spinach; ricotta; 3/4 cup parmesan; eggs; basil; nutmeg; salt and pepper to taste with remaining mushrooms mushroom mixture; stir to blend. (Both sauce and filling can be made a day in advance; covered tightly and refrigerated; reheat before assembling lasagna.) Preheat oven to 375 degrees. Spread a thin layer of sauce on bottom of 2-quart casserole or deep baking dish. Place layer of noodles over sauce. Spoon layer of spinach/mushroom filling over noodles and top with sauce. Repeat layers; ending with noodles and thin layer of sauce. Sprinkle remaining 1/4 cup parmesan over top. Bake about 35 to 40 minutes or until browned and bubbly. If top browns before sauce is bubbly; cover loosely with aluminum foil. Yields 6 to 8 servings.',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `recipe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipe_ingredient`
--

DROP TABLE IF EXISTS `recipe_ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipe_ingredient` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ingredient_id` int(11) NOT NULL,
  `recipe_id` int(11) NOT NULL,
  `quantity` double NOT NULL,
  `measurement_unit` varchar(100) DEFAULT NULL,
  `remarks` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_recipe_ingredients_recipe1_idx` (`recipe_id`),
  KEY `fk_recipe_ingredients_ingredient1_idx` (`ingredient_id`),
  CONSTRAINT `fk_recipe_ingredients_ingredient1` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredient` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_recipe_ingredients_recipe1` FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1080 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe_ingredient`
--

LOCK TABLES `recipe_ingredient` WRITE;
/*!40000 ALTER TABLE `recipe_ingredient` DISABLE KEYS */;
INSERT INTO `recipe_ingredient` VALUES (1,1,1,2,'Slices',NULL),(2,2,1,1,'Tablespoon',NULL),(3,3,1,1,'Tablespoon',NULL),(4,4,2,0.25,'Pound',NULL),(5,5,2,1,'Jar',NULL),(6,1,3,1,'Slice',NULL),(7,6,3,1,'Teaspoon',NULL),(8,7,4,1,NULL,'Pizza Crust'),(9,8,4,1,'Jar',NULL),(10,9,4,1,'Cup',NULL),(11,10,5,1,'Package',NULL),(12,11,6,2,'cup',NULL),(13,12,6,1.5,'cups',NULL),(14,13,6,2,'whole',NULL),(15,14,6,1,'pinch',NULL),(16,15,6,2,'cup',NULL),(17,16,6,1,'tsp',NULL),(18,17,6,1.75,'cups',NULL),(19,18,6,1.5,'tsp',NULL),(20,19,6,2,'cup',NULL),(27,6,7,2,'cup',NULL),(28,12,7,1.5,'cups',NULL),(29,13,7,3,'Whole',NULL),(30,17,7,4,'cups',NULL),(31,18,7,1,'tbsp',NULL),(32,20,7,12,'ounces',NULL),(33,21,7,1,'tbps',NULL),(34,22,7,3,'tsp',NULL),(35,23,7,2,'cup',NULL),(36,24,7,1,'cup',NULL),(37,25,7,3,'cups',NULL),(42,12,8,2,'cups',NULL),(43,13,8,2,'whole',NULL),(44,14,8,2,'tsp',NULL),(45,15,8,2,'cup',NULL),(46,17,8,2,'cups',NULL),(47,22,8,1,'tsp',NULL),(48,26,8,2,'cup',NULL),(49,27,8,5,'tbsp',NULL),(50,28,8,2,'tsp',NULL),(51,29,8,2,'tsp',NULL),(57,6,28,2,'cup',NULL),(58,6,37,2,'tbsp',NULL),(59,6,40,1,'tablespoon',NULL),(60,6,46,2,'cup',NULL),(61,6,49,2,'cup',NULL),(62,6,50,2,'tbsps',NULL),(63,6,52,1,'tablespoon',NULL),(64,6,60,2,'stick',NULL),(65,6,68,4,'cup',NULL),(66,12,10,2,'cups',NULL),(67,12,11,2,'cup',NULL),(68,12,13,1.5,'cups',NULL),(69,12,17,3,'cup',NULL),(70,12,33,2,'tsp',NULL),(71,13,9,4,'whole',NULL),(72,13,10,2,'whole',NULL),(73,13,13,2,'whole',NULL),(74,13,42,3,'large',NULL),(75,13,51,2,'whole',NULL),(76,13,52,2,'whole',NULL),(77,13,56,3,'whole',NULL),(78,13,57,4,'whole',NULL),(79,13,61,10,'whole',NULL),(80,13,62,2,'whole',NULL),(81,13,63,3,'whole',NULL),(82,13,66,5,'whole',NULL),(83,14,10,1,'tsp',NULL),(84,14,11,2,'tsp',NULL),(85,14,13,2,'tsp',NULL),(86,14,14,4,'tsp',NULL),(87,14,15,4,'tsp',NULL),(88,14,15,4,'tsp',NULL),(89,14,27,2,'tsp',NULL),(90,14,33,2,'tsp',NULL),(91,14,35,2,'tsp',NULL),(92,14,38,2,'tsp',NULL),(93,14,40,1,'pinch',NULL),(94,14,45,1,'pinch',NULL),(95,14,46,4,'tsp',NULL),(96,14,51,1,'pinch',NULL),(97,14,55,1,'teaspoon',NULL),(98,14,56,1,'teaspoon',NULL),(99,14,57,2,'teaspoon',NULL),(100,14,58,1,'teaspoon',NULL),(101,14,59,2,'teaspoons',NULL),(102,14,59,2,'teaspoon',NULL),(103,14,61,2,'teaspoon',NULL),(104,14,62,1,'teaspoon',NULL),(105,14,64,2,'teaspoon',NULL),(106,14,66,1,'pinch',NULL),(107,14,67,1,'teaspoon',NULL),(108,17,10,2,'cups',NULL),(109,17,11,1.5,'cups',NULL),(110,17,13,2,'cups',NULL),(111,17,14,3,'cups',NULL),(112,17,15,2,'tbsp',NULL),(113,17,35,1,'cup',NULL),(114,17,40,1,'tbsp',NULL),(115,17,48,1,'tsp',NULL),(116,17,56,2,'tablespoons',NULL),(117,17,58,3,'tablespoons',NULL),(118,17,59,2,'tablespoons',NULL),(119,17,61,2,'cup',NULL),(120,17,62,1,'cup',NULL),(121,17,68,4,'cup',NULL),(122,18,10,2,'tsp',NULL),(123,18,30,1.5,'tsp',NULL),(124,18,61,1,'teaspoon',NULL),(125,19,10,1,'cups',NULL),(126,21,9,2,'cups',NULL),(127,21,28,2,'tbsp',NULL),(128,21,64,1,'tablespoon',NULL),(129,22,10,2,'tsp',NULL),(130,22,11,1,'tsp',NULL),(131,22,13,1,'tsp',NULL),(132,22,14,1,'tsp',NULL),(133,22,15,1,'tsp',NULL),(134,23,28,2,'cup',NULL),(135,23,37,2,'tbsp',NULL),(136,23,40,1,'tablespoon',NULL),(137,23,46,2,'cup',NULL),(138,23,49,2,'cup',NULL),(139,23,50,2,'tbsps',NULL),(140,23,52,1,'tablespoon',NULL),(141,23,60,2,'stick',NULL),(142,23,68,4,'cup',NULL),(143,24,20,1,'quart',NULL),(144,24,21,2,'cup',NULL),(145,24,30,3,'cup',NULL),(146,24,37,4,'cup',NULL),(147,24,44,1,'cup',NULL),(148,24,62,3,'cup',NULL),(149,24,63,1.25,'cups',NULL),(150,24,68,3,'cups',NULL),(151,26,13,1,'cup',NULL),(152,26,14,2,'cup',NULL),(153,26,15,4,'cup',NULL),(154,28,10,1,'tsp',NULL),(155,28,11,2,'tsp',NULL),(156,28,13,2,'tsp',NULL),(157,30,9,1,'box',NULL),(158,31,9,4,'cup',NULL),(159,31,21,1.5,'cups',NULL),(160,31,29,1,'tbsp',NULL),(161,31,38,2,'tbsp',NULL),(162,31,49,4,'cups',NULL),(163,31,53,3,'cup',NULL),(164,31,59,1,'tablespoon',NULL),(165,31,66,4,'cup',NULL),(166,32,9,1,'small pkg',NULL),(167,33,9,4,'cup',NULL),(168,33,10,2,'cups',NULL),(169,33,30,1,'tbsp',NULL),(170,33,36,3,'tbsp',NULL),(171,34,9,2,'cups',NULL),(172,34,12,2,'cup',NULL),(173,34,36,1,'tsp',NULL),(174,34,49,1,'cup',NULL),(175,35,10,4,'cups',NULL),(176,36,10,2,'tsp',NULL),(177,36,27,2,'tsp',NULL),(178,37,11,2,'cup',NULL),(179,38,11,2,'cup',NULL),(180,38,14,1.25,'cups',NULL),(181,38,27,3,'cup',NULL),(182,38,53,3,'cup',NULL),(183,39,11,1,'whole',NULL),(184,39,24,1,'whole',NULL),(185,39,38,1,'whole',NULL),(186,39,45,1,'whole',NULL),(187,39,67,1,'whole',NULL),(188,40,11,1,'package',NULL),(189,40,13,1,'cup',NULL),(190,40,14,1,'cup',NULL),(191,41,11,2,'cups',NULL),(192,42,12,1,'cup',NULL),(193,43,12,3,'tbsp',NULL),(194,44,12,2,'cup',NULL),(195,45,12,2.5,'cups',NULL),(196,46,12,1,'cup',NULL),(197,47,13,1,'cup',NULL),(198,48,14,3,'cup',NULL),(199,48,14,2,'cup',NULL),(200,49,14,1,'whole',NULL),(201,50,14,1.5,'cups',NULL),(202,51,15,1,'cup',NULL),(203,52,15,2,'whole',NULL),(204,53,15,4,'cup',NULL),(205,54,15,2,'cup',NULL),(206,54,18,1,'cup',NULL),(207,55,16,4,'cups',NULL),(208,56,16,2,'cup',NULL),(209,56,36,2,'cup',NULL),(210,57,16,1,'whle',NULL),(211,58,16,1,'cup',NULL),(212,59,16,1,'cup',NULL),(213,59,17,1,'cup',NULL),(214,60,16,2,'whole',NULL),(215,61,16,1,'Tbsp',NULL),(216,62,16,1,'null',NULL),(217,63,17,2,'heads',NULL),(218,64,17,8,'ounce',NULL),(219,64,57,2,'pound',NULL),(220,65,17,1,'small',NULL),(221,66,17,4,'strips',NULL),(222,66,47,6,'slices',NULL),(223,67,17,2,'Tbsp',NULL),(224,67,47,2,'cup',NULL),(225,67,53,2,'cup',NULL),(226,67,59,1,'tablespoons',NULL),(227,67,59,1,'tablespoon',NULL),(228,68,18,1,'cup',NULL),(229,69,18,1,'cup',NULL),(230,70,18,1,'cup',NULL),(231,71,18,1,'cup',NULL),(232,71,21,2,'cup',NULL),(233,71,29,2,'cup',NULL),(234,71,35,2,'cups',NULL),(235,71,48,1,'cup',NULL),(236,71,55,1.5,'cups',NULL),(237,71,65,1,'pint',NULL),(238,71,55,1.5,'cups',NULL),(239,72,19,2,'cups',NULL),(240,73,19,1,'large',NULL),(241,74,19,3,'large',NULL),(242,74,23,6,'whole',NULL),(243,75,19,2,'stalks',NULL),(244,76,19,1,'large',NULL),(245,76,21,4,'cups',NULL),(246,76,23,1,'large',NULL),(247,76,27,1,'medium',NULL),(248,76,37,1,'tbsp',NULL),(249,76,43,2,'small',NULL),(250,76,51,1,'whole',NULL),(251,76,54,2,'medium',NULL),(252,76,59,4,'cup',NULL),(253,76,63,2,'cups',NULL),(254,77,19,2,'cubes',NULL),(255,78,19,1,'dash',NULL),(256,79,19,1,'pinch',NULL),(257,80,19,1,'large handful',NULL),(258,81,20,2,'pound',NULL),(259,82,20,1,'large',NULL),(260,83,20,3,'stocks',NULL),(261,84,20,2,'cups',NULL),(262,85,20,1,'pint',NULL),(263,85,58,1.5,'cups',NULL),(264,86,20,1,'pinch',NULL),(265,86,25,1,'pinch',NULL),(266,86,28,1,'pinch',NULL),(267,87,20,1,'tbsp',NULL),(268,88,20,4,'cans',NULL),(269,89,21,3,'cups',NULL),(270,90,21,3,'cloves',NULL),(271,90,36,2,'cloves',NULL),(272,90,43,1,'clove',NULL),(273,90,50,1,'clove',NULL),(274,91,21,1,'Tbsp',NULL),(275,91,43,1,'tbsp',NULL),(276,92,21,1,'10 oz. can',NULL),(277,93,21,2,'tsp',NULL),(278,94,21,1.5,'tsp',NULL),(279,95,21,2,'cup',NULL),(280,96,22,1,'medium',NULL),(281,97,22,1,'pinch',NULL),(282,97,68,1,'pinch',NULL),(283,98,22,1,'cup',NULL),(284,99,22,2,'whole',NULL),(285,100,23,1,'pound',NULL),(286,100,67,1,'pound',NULL),(287,101,23,4,'whole',NULL),(288,102,23,3,'whole',NULL),(289,103,23,1,'can',NULL),(290,104,23,1,'package',NULL),(291,105,23,2,'small',NULL),(292,106,23,2,'head',NULL),(293,107,23,1,'large can',NULL),(294,108,23,1,'large can',NULL),(295,108,59,2,'cans',NULL),(296,109,23,1,'package',NULL),(297,110,23,1,'handful',NULL),(298,111,24,2,'cup',NULL),(299,112,24,2,'tbsp',NULL),(300,112,25,2,'tbsp',NULL),(301,112,27,1,'tablesoon',NULL),(302,112,29,3,'tbsp',NULL),(303,112,32,2,'tbsp',NULL),(304,112,35,4,'tbsp',NULL),(305,112,53,3,'tbsp',NULL),(306,112,65,4,'tablespoons',NULL),(307,113,24,3,'ounces',NULL),(308,114,24,2,'cup',NULL),(309,115,24,1,'quart',NULL),(310,116,24,3,'Tbsp',NULL),(311,116,25,4,'tbsp',NULL),(312,116,26,1,'tab',NULL),(313,116,27,1.5,'tsp',NULL),(314,116,31,4,'cup',NULL),(315,116,33,4,'cup',NULL),(316,116,34,3,'tbsp',NULL),(317,116,41,2,'tbsp',NULL),(318,117,24,1,'tbsp',NULL),(319,118,25,1,'cup',NULL),(320,119,25,1,'cup',NULL),(321,120,25,4,'cups',NULL),(322,121,25,1,'can',NULL),(323,122,25,1,'can',NULL),(324,123,25,1,'can',NULL),(325,123,33,2,'cup',NULL),(326,124,25,1,'pkg',NULL),(327,125,25,1,'large can',NULL),(328,126,26,1,'pound',NULL),(329,127,26,1,'pound',NULL),(330,128,26,1,'bundle',NULL),(331,129,26,1,'whole',NULL),(332,130,27,1,'pound',NULL),(333,131,27,1,'tbsp',NULL),(334,131,29,2,'tbsp',NULL),(335,131,33,2,'tbsp',NULL),(336,131,34,2,'tbsp',NULL),(337,131,36,2,'tbsp',NULL),(338,132,27,1,'tbsp',NULL),(339,133,27,2,'cup',NULL),(340,134,27,2,'cup',NULL),(341,135,27,1,'whole',NULL),(342,136,27,1,'whole',NULL),(343,137,27,1,'whole',NULL),(344,138,27,1.5,'cups',NULL),(345,139,27,3,'cup',NULL),(346,140,27,2,'tsp',NULL),(347,140,35,4,'tsp',NULL),(348,141,27,1,'large',NULL),(349,142,27,1,'cup',NULL),(350,143,28,2,'whole',NULL),(351,144,28,1,'cup',NULL),(352,144,35,1,'cup',NULL),(353,145,28,1,'cup',NULL),(354,145,33,1,'cup',NULL),(355,145,40,1,'cup',NULL),(356,146,28,1,'large',NULL),(357,146,48,2,'cup',NULL),(358,147,28,2,'tbsp',NULL),(359,147,38,2,'tbsp',NULL),(360,147,56,2,'cup',NULL),(361,148,29,4,'whole',NULL),(362,149,29,1,'tsp',NULL),(363,150,29,1,'tsp',NULL),(364,151,29,1,'Whole',NULL),(365,152,29,3,'cup',NULL),(366,152,43,3,'tbsps',NULL),(367,153,29,1,'whole',NULL),(368,154,29,1.5,'cups',NULL),(369,155,29,4,'cup',NULL),(370,156,29,4,'cup',NULL),(371,156,34,1,'large',NULL),(372,157,29,1,'container',NULL),(373,158,29,1,'bundle',NULL),(374,159,30,1,'whole',NULL),(375,160,30,1,'cup',NULL),(376,161,30,2,'tsp',NULL),(377,162,30,4,'tsp',NULL),(378,162,33,1,'dash',NULL),(379,162,35,4,'tsp',NULL),(380,162,38,8,'tsp',NULL),(381,162,40,1,'pinch',NULL),(382,162,42,2,'tsp',NULL),(383,162,45,1,'pinch',NULL),(384,162,46,4,'tsp',NULL),(385,162,51,1,'pinch',NULL),(386,162,52,1,'pinch',NULL),(387,162,53,1,'pinch',NULL),(388,162,55,2,'teaspoon',NULL),(389,162,56,2,'teaspoon',NULL),(390,162,59,1,'pinch',NULL),(391,162,62,8,'teaspoon',NULL),(392,162,66,1,'pinch',NULL),(393,162,67,1,'pinch',NULL),(394,162,55,2,'teaspoon',NULL),(395,163,30,1,'small',NULL),(396,163,38,1,'Breast',NULL),(397,164,30,1,'tablesoon',NULL),(398,165,31,4,'cup',NULL),(399,166,31,2,'tsp',NULL),(400,166,41,1,'dash',NULL),(401,167,31,1,'pound',NULL),(402,168,31,16,'ounces',NULL),(403,169,32,10,'ounces',NULL),(404,170,32,3,'tbsp',NULL),(405,170,55,4,'cup',NULL),(406,170,55,4,'cup',NULL),(407,171,32,2,'whole',NULL),(408,172,32,3,'cup',NULL),(409,172,57,4,'cup',NULL),(410,173,32,4,'tsp',NULL),(411,174,32,2,'ounces',NULL),(412,175,33,3,'whole',NULL),(413,176,33,2,'pound',NULL),(414,177,33,2,'cup',NULL),(415,177,36,4,'cup',NULL),(416,178,33,6,'ounces',NULL),(417,179,33,1,'tsp',NULL),(418,179,34,2,'cup',NULL),(419,180,33,2,'ounces',NULL),(420,181,34,2,'whole',NULL),(421,182,34,1,'tbsp',NULL),(422,183,34,2,'bundle',NULL),(423,184,34,6,'whole',NULL),(424,184,35,0.5,'pound',NULL),(425,185,34,14,'pounds',NULL),(426,186,34,1,'pound',NULL),(427,187,35,2.5,'tsp',NULL),(428,187,38,2,'tsp',NULL),(429,187,40,1,'pinch',NULL),(430,187,46,4,'tsp',NULL),(431,187,52,1,'pinch',NULL),(432,187,58,1,'teaspoon',NULL),(433,188,35,2,'tsp',NULL),(434,189,35,4,'tsp',NULL),(435,190,35,1,'tsp',NULL),(436,190,66,2,'teaspoon',NULL),(437,191,35,10,'pieces',NULL),(438,192,35,1,'clove',NULL),(439,193,35,2.5,'cups',NULL),(440,193,36,1.5,'cups',NULL),(441,193,42,1.5,'cups',NULL),(442,194,35,2,'tbsp',NULL),(443,195,36,1,'pound',NULL),(444,196,36,2,'cup',NULL),(445,197,36,2,'tsp',NULL),(446,198,36,2,'pound',NULL),(447,199,36,1,'large',NULL),(448,200,36,4,'cup',NULL),(449,201,37,2,'pounds',NULL),(450,202,37,1,'can',NULL),(451,203,37,1,'tbsp',NULL),(452,204,37,1,'cup',NULL),(453,205,38,4,'cup',NULL),(454,206,38,2,'cup',NULL),(455,207,38,3,'cup',NULL),(456,218,40,2,'whole',NULL),(457,219,40,4,'cup',NULL),(458,220,40,1,'cup',NULL),(459,221,40,1,'tablespoon',NULL),(460,221,51,1,'pinch',NULL),(461,221,56,1,'clove',NULL),(462,222,40,1,'cup',NULL),(463,222,67,4,'cup',NULL),(464,223,41,1,'pkg',NULL),(465,224,41,2,'tbsp',NULL),(466,225,41,2,'tbsp',NULL),(467,225,51,1,'tablespoon',NULL),(468,226,41,1.5,'tsp',NULL),(469,227,41,1,'dash',NULL),(470,230,42,1,'pound',NULL),(471,231,42,1,'medium',NULL),(472,231,56,2,'cup',NULL),(473,231,60,1,'medium',NULL),(474,232,42,4,'large',NULL),(475,232,43,1.5,'cups',NULL),(476,233,42,2,'cup',NULL),(477,234,42,4,'cup',NULL),(478,235,42,2,'tsp',NULL),(479,236,42,2,'tbsp',NULL),(480,236,57,2,'cup',NULL),(481,237,43,3,'whole',NULL),(482,238,43,1.5,'cups',NULL),(483,239,43,4,'tsp',NULL),(484,240,43,4,'tsp',NULL),(485,241,44,1,'can',NULL),(486,242,44,4,'whole',NULL),(487,242,58,4,'large',NULL),(488,243,44,1,'cup',NULL),(489,244,44,1,'cup',NULL),(490,245,44,2,'cup',NULL),(491,246,44,4,'cup',NULL),(492,246,50,1,'tablespoon',NULL),(493,246,51,1,'tablespoon',NULL),(494,246,52,2,'cup',NULL),(495,246,56,1,'tablesoon',NULL),(496,247,45,1.5,'pounds',NULL),(497,248,45,1,'small',NULL),(498,248,52,1,'small',NULL),(499,249,46,6,'medium',NULL),(500,250,46,6,'medium',NULL),(501,251,46,1,'clove',NULL),(502,252,46,4,'tsp',NULL),(503,253,47,1,'cup',NULL),(504,253,59,3,'tablespoons',NULL),(505,254,47,1,'pkg',NULL),(506,255,47,2,'cans',NULL),(507,256,47,2,'cups',NULL),(508,257,48,8,'slices',NULL),(509,258,48,1,'pound',NULL),(510,259,48,1,'tsp',NULL),(511,259,52,1,'tablespoon',NULL),(512,260,48,1,'whole',NULL),(513,261,49,3,'large',NULL),(514,262,49,2,'whole',NULL),(515,263,50,2,'small',NULL),(516,263,51,3,'6 inch',NULL),(517,263,56,5,'medium',NULL),(518,264,51,2,'pound',NULL),(519,265,51,2,'cups',NULL),(520,266,51,1,'whole',NULL),(521,267,51,1,'pinch',NULL),(522,268,51,1,'pinch',NULL),(523,269,51,1,'pinch',NULL),(524,270,52,1,'whole',NULL),(525,271,52,1,'cup',NULL),(526,272,52,1,'cup',NULL),(527,273,53,6,'cups',NULL),(528,274,53,3,'cups',NULL),(529,275,53,4,'tsp',NULL),(530,275,67,1,'teaspoon',NULL),(531,276,54,1,'4 ounce can',NULL),(532,277,54,2,'10 ounce package',NULL),(533,278,54,2,'cups',NULL),(534,279,54,3,'cup',NULL),(535,280,54,2,'whole',NULL),(536,280,68,3,'large',NULL),(537,281,54,1,'salt',NULL),(538,281,54,1,'pepper',NULL),(539,281,54,1,'paprika',NULL),(540,282,54,3,'cup',NULL),(541,282,58,2,'cups',NULL),(542,283,55,2,'packages',NULL),(543,284,55,3,'tablespoons',NULL),(544,285,55,1,'can',NULL),(545,286,55,2,'cups',NULL),(546,286,55,2,'cups',NULL),(547,287,55,4,'cup',NULL),(548,287,55,4,'cup',NULL),(549,288,55,2,'cups',NULL),(550,288,55,2,'cups',NULL),(551,289,56,2,'cup',NULL),(552,289,57,2,'tablespoons',NULL),(553,289,68,3,'tablespoons',NULL),(554,290,57,2,'cloves',NULL),(555,291,57,3,'tablespoon',NULL),(556,292,57,1,'teaspoon',NULL),(557,293,57,14,'ounce can',NULL),(558,294,57,1,'teaspoon',NULL),(559,295,58,1,'10 inch',NULL),(560,296,58,2,'teaspoon',NULL),(561,297,58,10,'Spears',NULL),(562,298,58,1,'medium',NULL),(563,299,59,1,'pound',NULL),(564,300,59,1,'clove',NULL),(565,300,59,1,'clove',NULL),(566,301,59,1,'tablespoon',NULL),(567,301,59,2,'teaspoon',NULL),(568,302,59,1,'tablespoon',NULL),(569,303,59,10,'whole',NULL),(570,304,59,1,'cube',NULL),(571,305,59,1,'cup',NULL),(572,306,60,2,'cups',NULL),(573,307,60,1,'package',NULL),(574,308,60,2,'cup',NULL),(575,309,60,1,'cup',NULL),(576,310,60,1,'pound',NULL),(577,311,61,2,'cups',NULL),(578,312,61,4,'cups',NULL),(579,313,61,2,'4 oz cans',NULL),(580,314,62,2,'teaspoon',NULL),(581,315,63,1,'pound',NULL),(582,316,63,1,'envelope',NULL),(583,317,63,1,'4 oz can',NULL),(584,318,63,4,'cups',NULL),(585,319,63,2,'Whole',NULL),(586,319,67,1,'can',NULL),(587,320,63,1,'cup',NULL),(588,321,64,1,'cup',NULL),(589,322,64,1,'medium',NULL),(590,323,64,2,'cup',NULL),(591,324,64,2,'tablespoons',NULL),(592,325,64,8,'teaspoon',NULL),(593,326,64,8,'teaspoon',NULL),(594,327,64,8,'oz',NULL),(595,328,64,2,'large',NULL),(596,329,64,10,'oz',NULL),(597,330,65,1,'cup',NULL),(598,331,65,2,'teaspoon',NULL),(599,332,65,4,'cups',NULL),(600,333,65,12,'whole',NULL),(601,334,65,1,'can',NULL),(602,335,66,2,'pound',NULL),(603,336,66,3,'slices',NULL),(604,337,66,4,'cup',NULL),(605,338,66,1,'medium',NULL),(606,339,66,2,'cup',NULL),(607,340,67,1,'whole',NULL),(608,341,67,4,'cup',NULL),(609,347,55,2,'pounds',NULL),(610,348,55,1,'teaspoon',NULL),(611,349,55,3,'tablespoons',NULL),(612,350,55,1,'can',NULL),(613,351,68,1,'pounds',NULL),(614,352,68,2,'cloves',NULL),(615,353,68,3,'whole',NULL),(616,354,68,4,'pound',NULL),(617,355,68,2,'pound',NULL),(618,356,68,2,'cup',NULL),(619,357,68,1.5,'cups',NULL),(620,358,68,2,'tablespoons',NULL),(621,359,68,3,'10 oz packages',NULL),(622,360,68,1.5,'cups',NULL),(623,361,68,1.5,'teaspoons',NULL),(624,362,68,8,'teaspoon',NULL);
/*!40000 ALTER TABLE `recipe_ingredient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipe_review`
--

DROP TABLE IF EXISTS `recipe_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipe_review` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `recipe_id` int(11) NOT NULL,
  `rating` int(1) NOT NULL,
  `review_date` date NOT NULL,
  `comment` text,
  `active` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_recipe_review_recipe1_idx` (`recipe_id`),
  KEY `fk_recipe_review_user1_idx` (`user_id`),
  CONSTRAINT `fk_recipe_review_recipe1` FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_recipe_review_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe_review`
--

LOCK TABLES `recipe_review` WRITE;
/*!40000 ALTER TABLE `recipe_review` DISABLE KEYS */;
INSERT INTO `recipe_review` VALUES (1,1,1,4,'2019-11-14','It was pretty delicious',1);
/*!40000 ALTER TABLE `recipe_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipe_type`
--

DROP TABLE IF EXISTS `recipe_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipe_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe_type`
--

LOCK TABLES `recipe_type` WRITE;
/*!40000 ALTER TABLE `recipe_type` DISABLE KEYS */;
INSERT INTO `recipe_type` VALUES (1,'Breakfast'),(2,'Lunch'),(3,'Dinner'),(4,'Snack'),(5,'Dessert'),(6,'Baked');
/*!40000 ALTER TABLE `recipe_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(16) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `admin` tinyint(4) NOT NULL DEFAULT '0',
  `date_created` datetime DEFAULT CURRENT_TIMESTAMP,
  `date_updated` datetime DEFAULT CURRENT_TIMESTAMP,
  `avatar_url` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'marthaStewart','marthaStewart@gmail.com','marthaStewart','Martha','Stewart',1,0,NULL,NULL,NULL),(2,'testUser','test@test.com','testie','Testie','McTesterson',1,0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_recipe`
--

DROP TABLE IF EXISTS `user_recipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_recipe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `recipe_id` int(11) NOT NULL,
  `user_favorite` tinyint(4) DEFAULT '0',
  `comment` text,
  `date_last_made` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_recipe_user1_idx` (`user_id`),
  KEY `fk_user_recipe_recipe1_idx` (`recipe_id`),
  CONSTRAINT `fk_user_recipe_recipe1` FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_recipe_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_recipe`
--

LOCK TABLES `user_recipe` WRITE;
/*!40000 ALTER TABLE `user_recipe` DISABLE KEYS */;
INSERT INTO `user_recipe` VALUES (1,1,5,1,'Soooo gooooood',NULL);
/*!40000 ALTER TABLE `user_recipe` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-15 10:38:05
