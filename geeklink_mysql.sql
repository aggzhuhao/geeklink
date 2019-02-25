CREATE DATABASE  IF NOT EXISTS `geeklink` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `geeklink`;
-- MySQL dump 10.13  Distrib 5.5.16, for Win32 (x86)
--
-- Host: localhost    Database: yeelink
-- ------------------------------------------------------
-- Server version	5.0.67-community-nt

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
-- Not dumping tablespaces as no INFORMATION_SCHEMA.FILES table on this server
--

--
-- Table structure for table `device`
--

DROP TABLE IF EXISTS `device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `device` (
  `device_id` int(4) NOT NULL auto_increment,
  `availability` tinyint(2) default NULL COMMENT '0：不公开，1：公开',
  `description` varchar(30) default NULL,
  `address` varchar(255) default NULL,
  `api_address` varchar(255) default NULL,
  `name` varchar(30) default NULL,
  `tags` varchar(255) default NULL,
  `location` varchar(20) default NULL COMMENT '如上海，南通，北京',
  `placement` varchar(10) default NULL COMMENT '室内|室外',
  `longitude` decimal(17,14) default NULL COMMENT '经度',
  `latitude` decimal(17,14) default NULL COMMENT '纬度',
  `user_id` int(4) default NULL,
  PRIMARY KEY  (`device_id`),
  KEY `fk_device_user_id_user_idx` (`user_id`),
  CONSTRAINT `fk_device_user_id_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1008 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device`
--

LOCK TABLES `device` WRITE;
/*!40000 ALTER TABLE `device` DISABLE KEYS */;
INSERT INTO `device` VALUES (1001,1,'用于控制LED灯的开关','http://www.yeelink.net/devices/5905','http://www.yeelink.net/devices/5905','远程电灯控制','LED,开关','南通','室内',121.00718956822516,32.11425891592737,7349),(1002,1,'新一代智能家庭控制系统','http://www.yeelink.net/devices/8805','http://www.yeelink.net/devices/8805','智能家庭远程控制','家庭','上海','室内',121.47533352868618,31.26925010600316,7349),(1003,1,'智能工厂温控系统','http://www.yeelink.net/devices/8810','http://www.yeelink.net/devices/8810','工厂温控系统','工厂','上海','室内',121.47533352868625,31.26925010600320,7349),(1004,0,'新一代微博播报设备','http://www.yeelink.net/devices/6925','http://www.yeelink.net/devices/6925','微博播报设备','微博','上海','室内',121.47533352868610,31.26925010600318,7349),(1005,1,'宜居智能家庭控制系统，给您不一样的家的体验','http://www.yeelink.net/devices/3598','http://www.yeelink.net/devices/3598','宜居智能家庭控制系统','家庭','南京','室内',120.47533352868648,30.47533352868725,7349),(1006,1,'2018新款LED灯控系统','http://www.yeelink.net/devices/5566','http://www.yeelink.net/devices/5566','2018LED灯控系统','LED','上海','室外',121.47533352868655,31.26925010600625,7349),(1007,0,'2018款儿童防走丢监控设备','http://www.yeelink.net/devices/4329','http://www.yeelink.net/devices/4329','儿童防走丢监控设备','GPS','南通','室外',121.00718956822785,31.26925010600110,7349);
/*!40000 ALTER TABLE `device` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device_action`
--

DROP TABLE IF EXISTS `device_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `device_action` (
  `action_id` int(4) NOT NULL auto_increment,
  `name` varchar(30) default NULL,
  `type` tinyint(2) default NULL COMMENT '1：电邮，2：网址推送，3：微博，4：移动端',
  `type_value` varchar(50) default NULL,
  `status` tinyint(2) default NULL COMMENT '0:禁用，1：启用',
  PRIMARY KEY  (`action_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1257 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_action`
--

LOCK TABLES `device_action` WRITE;
/*!40000 ALTER TABLE `device_action` DISABLE KEYS */;
INSERT INTO `device_action` VALUES (1253,'高温警报',4,'13861931522',1),(1254,'低温警报',2,'http://www.boode.com/alert.html',1),(1255,'正常温度播报',1,'boode@boode.com',1);
/*!40000 ALTER TABLE `device_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sensor`
--

DROP TABLE IF EXISTS `sensor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sensor` (
  `sensor_id` int(4) NOT NULL auto_increment,
  `name` varchar(30) default NULL,
  `description` varchar(30) default NULL,
  `tag` varchar(255) default NULL,
  `type` tinyint(2) default NULL COMMENT '1: 数值 2: 开关 3: GPS 4: 微博抓取',
  `status` tinyint(2) default NULL COMMENT '1：正常，-1：故障',
  `device_id` int(4) default NULL,
  `datapoint` varchar(50) default NULL COMMENT '采集的数据',
  `api_address` varchar(255) default NULL,
  `address` varchar(255) default NULL,
  PRIMARY KEY  (`sensor_id`),
  KEY `fk_sensor_device_id_device_idx` (`device_id`),
  CONSTRAINT `fk_sensor_device_id_device` FOREIGN KEY (`device_id`) REFERENCES `device` (`device_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5789 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sensor`
--

LOCK TABLES `sensor` WRITE;
/*!40000 ALTER TABLE `sensor` DISABLE KEYS */;
INSERT INTO `sensor` VALUES (5722,'中继开关','控制led灯的中继开关1','led, 中继',2,1,1001,'1','http://api.geeklink.net/device/5905/sensor/5722','http://api.geeklink.net/device/5905/sensor/5722'),(5723,'中继开关','控制led灯的中继开关2','led, 中继',2,1,1001,'0','http://api.geeklink.net/device/5905/sensor/5798','http://api.geeklink.net/device/5905/sensor/5798'),(5735,'LM35温度传感器','LM35 输出电压为摄氏温标。','LM35, 温度',1,1,1002,'35','http://api.geeklink.net/device/8805/sensor/5735','http://api.geeklink.net/device/8805/sensor/5735'),(5736,'温度传感器','温度传感器','温度',1,1,1002,'24','http://api.geeklink.net/device/8805/sensor/5736','http://api.geeklink.net/device/8805/sensor/5736'),(5737,'中继开关1','中继开关','开关',2,1,1002,'0','http://api.geeklink.net/device/8805/sensor/5737','http://api.geeklink.net/device/8805/sensor/5737'),(5738,'中继开关2','中继开关','开关',2,-1,1002,'0','http://api.geeklink.net/device/8805/sensor/5738','http://api.geeklink.net/device/8805/sensor/5738'),(5739,'gps传感器','gps传感器','经纬度,gps',3,1,1002,'121.12459807107211,32.09054978410158','http://api.geeklink.net/device/8805/sensor/5739','http://api.geeklink.net/device/8805/sensor/5739'),(5741,'传感器4','用于采集微博jj最近收到的信息条数','微博',4,1,1002,'3','http://api.geeklink.net/device/8805/sensor/5741','http://api.geeklink.net/device/8805/sensor/5741'),(5755,'温度传感器a','温度传感器','led,中继',1,1,1003,'25','http://api.geeklink.net/device/8810/sensor/4833','http://api.geeklink.net/device/8810/sensor/4833'),(5756,'温度传感器b','温度传感器','led,中继',1,1,1003,'35','http://api.geeklink.net/device/8810/sensor/4834','http://api.geeklink.net/device/8810/sensor/4834'),(5757,'温度传感器c','温度传感器','led,中继',1,-1,1003,'55','http://api.geeklink.net/device/8810/sensor/4835','http://api.geeklink.net/device/8810/sensor/4835'),(5758,'温度传感器d','温度传感器','led,中继',1,-1,1003,'0','http://api.geeklink.net/device/8810/sensor/4836','http://api.geeklink.net/device/8810/sensor/4836'),(5759,'温度传感器e','温度传感器','led,中继',1,1,1003,'23','http://api.geeklink.net/device/8810/sensor/4837','http://api.geeklink.net/device/8810/sensor/4837'),(5760,'微博传感器','微博抓取传感器','微博,新浪',4,1,1004,'5','http://api.geeklink.net/device/6925/sensor/5566','http://api.geeklink.net/device/6925/sensor/5566'),(5761,'微博传感器','微博抓取传感器','微博,腾讯',4,1,1004,'2','http://api.geeklink.net/device/6925/sensor/5567','http://api.geeklink.net/device/6925/sensor/5567'),(5762,'温度传感器','温度传感器','温度',1,1,1005,'25','http://api.geeklink.net/device/3598/sensor/5575','http://api.geeklink.net/device/3598/sensor/5575'),(5763,'温度传感器','温度传感器','温度',1,1,1005,'26','http://api.geeklink.net/device/3598/sensor/5576','http://api.geeklink.net/device/3598/sensor/5576'),(5764,'温度传感器','温度传感器','温度',1,1,1005,'28','http://api.geeklink.net/device/3598/sensor/5577','http://api.geeklink.net/device/3598/sensor/5577'),(5765,'温度传感器','温度传感器','温度',1,1,1005,'29','http://api.geeklink.net/device/3598/sensor/5578','http://api.geeklink.net/device/3598/sensor/5578'),(5766,'gps传感器','gps传感器','经纬度,gps',3,-1,1005,'120.47533352868648,30.47533352868725','http://api.geeklink.net/device/3598/sensor/5579','http://api.geeklink.net/device/3598/sensor/5579'),(5768,'中继开关','中继开关','led,中继',2,1,1006,'1','http://api.geeklink.net/device/5566/sensor/6301','http://api.geeklink.net/device/5566/sensor/6301'),(5769,'中继开关','中继开关','led,中继',2,1,1006,'1','http://api.geeklink.net/device/5566/sensor/6302','http://api.geeklink.net/device/5566/sensor/6302'),(5770,'中继开关','中继开关','led,中继',2,-1,1006,'0','http://api.geeklink.net/device/5566/sensor/6303','http://api.geeklink.net/device/5566/sensor/6303'),(5771,'中继开关','中继开关','led,中继',2,-1,1006,'0','http://api.geeklink.net/device/5566/sensor/6304','http://api.geeklink.net/device/5566/sensor/6304'),(5772,'中继开关','中继开关','led,中继',2,1,1006,'1','http://api.geeklink.net/device/5566/sensor/6305','http://api.geeklink.net/device/5566/sensor/6305'),(5785,'gps传感器','gps传感器','经纬度,gps',3,1,1007,'121.00718956822465,31.26925010600185','http://api.geeklink.net/device/4329/sensor/8813','http://api.geeklink.net/device/4329/sensor/8813'),(5786,'gps传感器','gps传感器','经纬度,gps',3,1,1007,'121.00718956822887,31.26925010600365','http://api.geeklink.net/device/4329/sensor/8814','http://api.geeklink.net/device/4329/sensor/8814'),(5787,'gps传感器','gps传感器','经纬度,gps',3,1,1007,'121.00718956822433,31.26925010600986','http://api.geeklink.net/device/4329/sensor/8815','http://api.geeklink.net/device/4329/sensor/8815'),(5788,'gps传感器','gps传感器','经纬度,gps',3,1,1007,'121.00718956822410,31.26925010600107','http://api.geeklink.net/device/4329/sensor/8816','http://api.geeklink.net/device/4329/sensor/8816');
/*!40000 ALTER TABLE `sensor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sensor_action`
--

DROP TABLE IF EXISTS `sensor_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sensor_action` (
  `sensor_action_id` int(4) NOT NULL,
  `trigger_option` varchar(10) default NULL,
  `trigger_value` varchar(10) default NULL,
  `message` varchar(120) default NULL,
  `action_id` int(4) default NULL,
  `sensor_id` int(4) default NULL,
  PRIMARY KEY  (`sensor_action_id`),
  KEY `fk_action_id_action_idx` (`action_id`),
  KEY `fk_sensor_id_sensor_idx` (`sensor_id`),
  CONSTRAINT `fk_sensor_id_sensor` FOREIGN KEY (`sensor_id`) REFERENCES `sensor` (`sensor_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_action_id_action` FOREIGN KEY (`action_id`) REFERENCES `device_action` (`action_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sensor_action`
--

LOCK TABLES `sensor_action` WRITE;
/*!40000 ALTER TABLE `sensor_action` DISABLE KEYS */;
INSERT INTO `sensor_action` VALUES (5325,'>','35','太热了，温度已达35度',1253,5735),(5326,'<','10','气温转凉，请注意防寒',1254,5735),(5327,'=','20','气温宜人，可以出去转转',1255,5735);
/*!40000 ALTER TABLE `sensor_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_id` int(4) NOT NULL auto_increment,
  `name` varchar(20) default NULL,
  `password` varchar(20) default NULL,
  `email` varchar(50) default NULL,
  `description` varchar(30) default NULL,
  `api_key` varchar(32) default NULL,
  `activation_status` tinyint(2) default NULL COMMENT '0：未激活，1：激活',
  `avatar` varchar(50) default NULL COMMENT '存头像的文件路径',
  `role` tinyint(2) default NULL COMMENT '1：超级用户，yeelink后台管理员；2：普通注册用户',
  PRIMARY KEY  (`user_id`),
  UNIQUE KEY `api_key_UNIQUE` (`api_key`)
) ENGINE=InnoDB AUTO_INCREMENT=7600 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1001,'admin','123','admin@geelink.com',NULL,NULL,NULL,'/resource/images/geeklink-avatar.gif',1),(7349,'tom','123','tom@126.com','爱生活，爱编程，爱琢磨，爱折腾','793jIEGJjkjkljfUI3JRTJOIO',1,'/resource/images/avatar-default.gif',2),(7560,'john','123','john@263.com','我就是我，不一样的烟火','886jIEGJjkjkljfUI86RTJX9L',1,'/resource/images/avatar-default.gif',2),(7566,'jack','123','jack@126.com','爱美食，爱旅游，爱电影','893jIEGJjkjkljfUI3JRTJOId',1,'/resource/images/avatar-default.gif',2),(7599,'jerry','123','jerry@hotmail.com','我的乐趣就是喜欢捉弄tom','556jIEGJjkjkljfUI3JRTJXY8',0,'/resource/images/avatar-default.gif',2);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_message`
--

DROP TABLE IF EXISTS `user_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_message` (
  `msg_id` int(4) NOT NULL,
  `receiver_id` int(4) default NULL,
  `sender_id` int(4) default NULL,
  `type` varchar(20) default NULL COMMENT '1：系统消息，2：私信，3：设备评论',
  `msg` varchar(255) default NULL,
  `send_time` datetime NOT NULL,
  `subject` varchar(50) default NULL,
  `read_status` tinyint(2) default NULL COMMENT '0：未读，1：已读',
  PRIMARY KEY  (`msg_id`),
  KEY `fk_user_message_user_id_user_idx` (`receiver_id`),
  KEY `fk_message_sender_id_user_idx` (`sender_id`),
  CONSTRAINT `fk_message_receiver_id_user` FOREIGN KEY (`receiver_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_message_sender_id_user` FOREIGN KEY (`sender_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_message`
--

LOCK TABLES `user_message` WRITE;
/*!40000 ALTER TABLE `user_message` DISABLE KEYS */;
INSERT INTO `user_message` VALUES (5588,7349,7566,'2','2018，新年快乐','2018-02-12 08:26:18','NULL',1),(5589,7349,7566,'3','这个设备太牛了','2018-02-28 08:26:20','智能家庭远程控制',0),(5592,7349,1001,'1','您的VIP快到期了，请尽快续费','2018-02-01 08:26:20','',0),(5593,7349,7599,'3','哪儿有买？','2018-02-11 18:26:20','智能家庭远程控制',NULL);
/*!40000 ALTER TABLE `user_message` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-01 18:02:00
