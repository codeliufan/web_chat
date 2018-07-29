# Host: localhost  (Version: 5.5.47)
# Date: 2017-06-12 14:12:54
# Generator: MySQL-Front 5.3  (Build 4.234)

/*!40101 SET NAMES gb2312 */;

#
# Structure for table "friend"
#

CREATE TABLE `friend` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `userId` varchar(20) NOT NULL,
  `friendId` varchar(20) NOT NULL,
  `pass` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=77 DEFAULT CHARSET=gbk;

#
# Data for table "friend"
#

INSERT INTO `friend` VALUES (26,'liufan','lining',1),(27,'lining','liufan',1),(71,'liufan','lisi',1),(72,'lisi','liufan',1),(73,'liufan','wangziyan',1),(74,'wangziyan','liufan',1),(75,'hukai','liufan',1),(76,'liufan','hukai',1);

#
# Structure for table "message"
#

CREATE TABLE `message` (
  `msgId` varchar(33) NOT NULL,
  `receiver` varchar(20) NOT NULL,
  `sender` varchar(20) NOT NULL,
  `fileName` varchar(50) NOT NULL,
  `extension` varchar(20) CHARACTER SET gbk NOT NULL,
  `path` varchar(50) CHARACTER SET gbk NOT NULL,
  `bites` varchar(10) NOT NULL,
  `sendTime` datetime NOT NULL,
  `isRead` tinyint(1) NOT NULL,
  `content` varchar(3000) CHARACTER SET gbk NOT NULL,
  `type` varchar(10) NOT NULL,
  PRIMARY KEY (`msgId`),
  UNIQUE KEY `msgId` (`msgId`),
  KEY `sendTime` (`sendTime`),
  KEY `msgId_2` (`msgId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "message"
#

INSERT INTO `message` VALUES ('1496660206025','qinliang','liufan','','','','','2017-06-05 18:56:46',1,'你好',''),('1496660212442','liufan','qinliang','','','','','2017-06-05 18:56:52',1,'你也好',''),('1496660217102','qinliang','liufan','','','','','2017-06-05 18:56:57',1,'哈哈',''),('1496660264042','qinliang','liufan','','','','','2017-06-05 18:57:44',1,'你好',''),('1496661417544','qinliang','liufan','','','','','2017-06-05 19:16:57',1,'哈哈',''),('1496661419994','qinliang','liufan','','','','','2017-06-05 19:16:59',1,'呵呵',''),('1496661424812','liufan','qinliang','','','','','2017-06-05 19:17:04',1,'你好啊',''),('1496661465301','liufan','lining','','','','','2017-06-05 19:17:45',1,'你好啊',''),('1496661467488','liufan','lining','','','','','2017-06-05 19:17:47',1,'呵呵呵',''),('1496661486758','lining','liufan','','','','','2017-06-05 19:18:06',1,'你好啊',''),('1496661490781','liufan','lining','','','','','2017-06-05 19:18:10',1,'哈哈',''),('1496661496445','liufan','lining','','','','','2017-06-05 19:18:16',1,'我是你的bigfans',''),('1496661501760','lining','liufan','','','','','2017-06-05 19:18:21',1,'多谢多谢',''),('1496662953682','lining','liufan','','','','','2017-06-05 19:42:33',1,'你好',''),('1496662958060','liufan','lining','','','','','2017-06-05 19:42:38',1,'恩',''),('1496662960679','liufan','lining','','','','','2017-06-05 19:42:40',1,'你也好',''),('1496663022061','liufan','qinliang','','','','','2017-06-05 19:43:42',1,'你好',''),('1496663025779','liufan','qinliang','','','','','2017-06-05 19:43:45',1,'哈',''),('1496663035068','liufan','qinliang','','','','','2017-06-05 19:43:55',1,'你好',''),('1496663038491','qinliang','liufan','','','','','2017-06-05 19:43:58',1,'恩',''),('1496663040564','qinliang','liufan','','','','','2017-06-05 19:44:00',1,'你也好',''),('1496664647822','liufan','qinliang','','','','','2017-06-05 20:10:47',1,'你好',''),('1496664655659','qinliang','liufan','','','','','2017-06-05 20:10:55',1,'niyehao ',''),('1496664697801','qinliang','liufan','','','','','2017-06-05 20:11:37',1,'nihao ',''),('1496664701231','liufan','qinliang','','','','','2017-06-05 20:11:41',1,'哈哈',''),('1496664706292','liufan','qinliang','','','','','2017-06-05 20:11:46',1,'1',''),('1496664706529','liufan','qinliang','','','','','2017-06-05 20:11:46',1,'2',''),('1496664706829','liufan','qinliang','','','','','2017-06-05 20:11:46',1,'3',''),('1496664707085','liufan','qinliang','','','','','2017-06-05 20:11:47',1,'4',''),('1496664707311','liufan','qinliang','','','','','2017-06-05 20:11:47',1,'5',''),('1496664707545','liufan','qinliang','','','','','2017-06-05 20:11:47',1,'6',''),('1496664707767','liufan','qinliang','','','','','2017-06-05 20:11:47',1,'7',''),('1496664708025','liufan','qinliang','','','','','2017-06-05 20:11:48',1,'8',''),('1496664708260','liufan','qinliang','','','','','2017-06-05 20:11:48',1,'9',''),('1496664829456','liufan','qinliang','','','','','2017-06-05 20:13:49',1,'再来一次',''),('1496664834239','qinliang','liufan','','','','','2017-06-05 20:13:54',1,'haode ',''),('1496664837426','liufan','qinliang','','','','','2017-06-05 20:13:57',1,'1',''),('1496664837694','liufan','qinliang','','','','','2017-06-05 20:13:57',1,'2',''),('1496664837945','liufan','qinliang','','','','','2017-06-05 20:13:57',1,'3',''),('1496664838209','liufan','qinliang','','','','','2017-06-05 20:13:58',1,'4',''),('1496664838476','liufan','qinliang','','','','','2017-06-05 20:13:58',1,'5',''),('1496664838766','liufan','qinliang','','','','','2017-06-05 20:13:58',1,'6',''),('1496664838997','liufan','qinliang','','','','','2017-06-05 20:13:58',1,'7',''),('1496664839259','liufan','qinliang','','','','','2017-06-05 20:13:59',1,'8',''),('1496664839436','liufan','qinliang','','','','','2017-06-05 20:13:59',1,'9',''),('1496666088803','liufan','qinliang','','','','','2017-06-05 20:34:48',1,'你好',''),('1496666222658','liufan','qinliang','','','','','2017-06-05 20:37:02',1,'你好',''),('1496666357710','liufan','qinliang','','','','','2017-06-05 20:39:17',1,'你好啊',''),('1496666365810','liufan','qinliang','','','','','2017-06-05 20:39:25',1,'。。。',''),('1496666370037','liufan','qinliang','','','','','2017-06-05 20:39:30',1,'醉了',''),('1496667005813','qinliang','liufan','','','','','2017-06-05 20:50:05',1,'你好',''),('1496667016359','liufan','qinliang','','','','','2017-06-05 20:50:16',1,'嗯嗯',''),('1496667120995','liufan','qinliang','','','','','2017-06-05 20:52:00',1,'呀',''),('1496667125374','liufan','qinliang','','','','','2017-06-05 20:52:05',1,'你也在啊',''),('1496667132683','qinliang','liufan','','','','','2017-06-05 20:52:12',1,'是啊',''),('1496667141966','liufan','qinliang','','','','','2017-06-05 20:52:21',1,'呵呵',''),('1496667148484','qinliang','liufan','','','','','2017-06-05 20:52:28',1,'你不也在么',''),('1496667153519','liufan','qinliang','','','','','2017-06-05 20:52:33',1,'嗯嗯',''),('1496667162136','liufan','qinliang','Desert.jpg','jpg','file/1496667162.jpg','845941','2017-06-05 20:52:42',1,'',''),('1496667171753','liufan','qinliang','Chrysanthemum.jpg','jpg','file/1496667171.jpg','879394','2017-06-05 20:52:51',1,'',''),('1496667179082','liufan','qinliang','','','','','2017-06-05 20:52:59',1,'。。。',''),('1496667187523','liufan','qinliang','','','','','2017-06-05 20:53:07',1,'什么鬼',''),('1496667381061','liufan','qinliang','','','','','2017-06-05 20:56:21',1,'哈哈哈',''),('1496667386845','qinliang','liufan','','','','','2017-06-05 20:56:26',1,'。。。',''),('1496667402283','liufan','qinliang','','','','','2017-06-05 20:56:42',1,'立着',''),('1496667405342','liufan','qinliang','','','','','2017-06-05 20:56:45',1,'你这个',''),('1496667409910','liufan','qinliang','Penguins.jpg','jpg','file/1496667409.jpg','777835','2017-06-05 20:56:49',1,'',''),('1496667414773','liufan','qinliang','','','','','2017-06-05 20:56:54',1,'做的真好啊',''),('1496667421494','qinliang','liufan','','','','','2017-06-05 20:57:01',1,'哈哈',''),('1496667428010','qinliang','liufan','','','','','2017-06-05 20:57:08',1,'谢谢夸奖',''),('1496667439092','qinliang','liufan','','','','','2017-06-05 20:57:19',1,'谢谢',''),('1496667452552','liufan','qinliang','','','','','2017-06-05 20:57:32',1,'不用客气了啦',''),('1496667463149','qinliang','liufan','','','','','2017-06-05 20:57:43',1,'嗯嗯',''),('1496667468589','liufan','qinliang','','','','','2017-06-05 20:57:48',1,'那 拜拜咯',''),('1496667479228','liufan','qinliang','','','','','2017-06-05 20:57:59',1,'加油',''),('1496667498758','liufan','lining','','','','','2017-06-05 20:58:18',1,'hi',''),('1496667507523','liufan','lining','','','','','2017-06-05 20:58:27',1,'亲娘下线了？',''),('1496667516465','lining','liufan','','','','','2017-06-05 20:58:36',1,'恩',''),('1496667522074','qinliang','liufan','','','','','2017-06-05 20:58:42',1,'好的',''),('1496668174108','lining','liufan','','','','','2017-06-05 21:09:34',1,'还要不要继续做了',''),('1496668201788','lining','liufan','','','','','2017-06-05 21:10:01',1,'哎呀 发错了 不好意思',''),('1496668213031','qinliang','liufan','','','','','2017-06-05 21:10:13',1,'还要不要继续做了啊',''),('1496668233369','liufan','qinliang','','','','','2017-06-05 21:10:33',1,'你自己看着办被',''),('1496668236949','liufan','qinliang','','','','','2017-06-05 21:10:36',1,'问我干嘛',''),('1496668242697','qinliang','liufan','','','','','2017-06-05 21:10:42',1,'。。。',''),('1496668255745','liufan','qinliang','','','','','2017-06-05 21:10:55',1,'在测试下吧',''),('1496668259318','qinliang','liufan','','','','','2017-06-05 21:10:59',1,'恩',''),('1496668265473','qinliang','liufan','','','','','2017-06-05 21:11:05',1,'1',''),('1496668265699','qinliang','liufan','','','','','2017-06-05 21:11:05',1,'2',''),('1496668265934','qinliang','liufan','','','','','2017-06-05 21:11:05',1,'3',''),('1496668266179','qinliang','liufan','','','','','2017-06-05 21:11:06',1,'4',''),('1496668266415','qinliang','liufan','','','','','2017-06-05 21:11:06',1,'5',''),('1496668266625','qinliang','liufan','','','','','2017-06-05 21:11:06',1,'6',''),('1496668266847','qinliang','liufan','','','','','2017-06-05 21:11:06',1,'7',''),('1496668267034','qinliang','liufan','','','','','2017-06-05 21:11:07',1,'8',''),('1496668267230','qinliang','liufan','','','','','2017-06-05 21:11:07',1,'9',''),('1496668290395','liufan','qinliang','','','','','2017-06-05 21:11:30',1,'OK',''),('1496668294514','liufan','qinliang','','','','','2017-06-05 21:11:34',1,'我也来试试',''),('1496668296181','liufan','qinliang','','','','','2017-06-05 21:11:36',1,'1',''),('1496668296395','liufan','qinliang','','','','','2017-06-05 21:11:36',1,'2',''),('1496668296605','liufan','qinliang','','','','','2017-06-05 21:11:36',1,'3',''),('1496668296823','liufan','qinliang','','','','','2017-06-05 21:11:36',1,'4',''),('1496668297064','liufan','qinliang','','','','','2017-06-05 21:11:37',1,'5',''),('1496668297276','liufan','qinliang','','','','','2017-06-05 21:11:37',1,'6',''),('1496668297468','liufan','qinliang','','','','','2017-06-05 21:11:37',1,'7',''),('1496668297666','liufan','qinliang','','','','','2017-06-05 21:11:37',1,'8',''),('1496668297806','liufan','qinliang','','','','','2017-06-05 21:11:37',1,'9+',''),('1496668314584','qinliang','liufan','','','','','2017-06-05 21:11:54',1,'试试这个',''),('1496668316456','qinliang','liufan','','','','','2017-06-05 21:11:56',1,'1',''),('1496668316639','qinliang','liufan','','','','','2017-06-05 21:11:56',1,'2',''),('1496668327026','liufan','qinliang','','','','','2017-06-05 21:12:07',1,'没问题',''),('1496668345509','qinliang','liufan','','','','','2017-06-05 21:12:25',1,'好吧 那今天就先这样吧',''),('1496668348906','liufan','qinliang','','','','','2017-06-05 21:12:28',1,'嗯嗯',''),('1496668356485','liufan','qinliang','','','','','2017-06-05 21:12:36',1,'拜拜',''),('1496668360815','qinliang','liufan','','','','','2017-06-05 21:12:40',1,'拜拜',''),('1496672650992','qinliang','liufan','','','','','2017-06-05 22:24:10',1,'还在啊',''),('1496672659685','liufan','qinliang','','','','','2017-06-05 22:24:19',1,'恶化了',''),('1496672680987','liufan','qinliang','','','','','2017-06-05 22:24:40',1,'ca 打错了',''),('1496672699895','qinliang','liufan','','','','','2017-06-05 22:24:59',1,'。。。',''),('1496674920843','hukai','liufan','','','','','2017-06-05 23:02:00',1,'123',''),('1496674943242','hukai','liufan','','','','','2017-06-05 23:02:23',1,'333',''),('1496674949012','hukai','liufan','','','','','2017-06-05 23:02:29',1,'666',''),('1496675589402','qinliang','liufan','','','','','2017-06-05 23:13:09',1,'1',''),('1496675589622','qinliang','liufan','','','','','2017-06-05 23:13:09',1,'2',''),('1496675589911','qinliang','liufan','','','','','2017-06-05 23:13:09',1,'3',''),('1496675590166','qinliang','liufan','','','','','2017-06-05 23:13:10',1,'4',''),('1496675590432','qinliang','liufan','','','','','2017-06-05 23:13:10',1,'5',''),('1496675590745','qinliang','liufan','','','','','2017-06-05 23:13:10',1,'6',''),('1496675910123','liufan','qinliang','Wildlife.wmv','wmv','file/1496675910.wmv','26246026','2017-06-05 23:18:30',1,'',''),('1496676833876','liufan','qinliang','','','','','2017-06-05 23:33:53',1,'123',''),('1496718328592','qinliang','wangziyan','','','','','2017-06-06 11:05:28',1,'你好',''),('1496718333887','qinliang','liufan','','','','','2017-06-06 11:05:33',1,'你好',''),('1496718342447','qinliang','wangziyan','','','','','2017-06-06 11:05:42',1,'。。',''),('1496718347524','liufan','qinliang','','','','','2017-06-06 11:05:47',1,'。。',''),('1496718453852','qinliang','wangziyan','','','','','2017-06-06 11:07:33',1,'123',''),('1496718459348','wangziyan','qinliang','','','','','2017-06-06 11:07:39',1,'321',''),('1496718489779','wangziyan','qinliang','','','','','2017-06-06 11:08:09',1,'11',''),('1496718557099','wangziyan','qinliang','','','','','2017-06-06 11:09:17',1,'11',''),('1496718692319','qinliang','wangziyan','','','','','2017-06-06 11:11:32',1,'1',''),('1496718959439','qinliang','liufan','','','','','2017-06-06 11:15:59',1,'hllo',''),('1496718973903','qinliang','liufan','','','','','2017-06-06 11:16:13',1,'111',''),('1496718983888','qinliang','liufan','','','','','2017-06-06 11:16:23',1,'222',''),('1496718984692','qinliang','liufan','','','','','2017-06-06 11:16:24',1,'333',''),('1496718985552','qinliang','liufan','','','','','2017-06-06 11:16:25',1,'444',''),('1496718986288','qinliang','liufan','','','','','2017-06-06 11:16:26',1,'555',''),('1496718987032','qinliang','liufan','','','','','2017-06-06 11:16:27',1,'666',''),('1496718991624','qinliang','liufan','','','','','2017-06-06 11:16:31',1,'777',''),('1496718999325','qinliang','liufan','Chrysanthemum.jpg','jpg','file/1496718999.jpg','879394','2017-06-06 11:16:39',1,'',''),('1496719023659','qinliang','wangziyan','Desert.jpg','jpg','file/1496719023.jpg','845941','2017-06-06 11:17:03',1,'',''),('1496719103817','qinliang','liufan','','','','','2017-06-06 11:18:23',1,'1',''),('1496719104103','qinliang','liufan','','','','','2017-06-06 11:18:24',1,'2',''),('1496719104359','qinliang','liufan','','','','','2017-06-06 11:18:24',1,'3',''),('1496719104648','qinliang','liufan','','','','','2017-06-06 11:18:24',1,'4',''),('1496719104903','qinliang','liufan','','','','','2017-06-06 11:18:24',1,'5',''),('1496719105226','qinliang','liufan','','','','','2017-06-06 11:18:25',1,'6',''),('1496719112975','liufan','qinliang','','','','','2017-06-06 11:18:32',1,'1',''),('1496719118208','qinliang','liufan','','','','','2017-06-06 11:18:38',1,'1',''),('1496719179888','liufan','qinliang','Desert.jpg','jpg','file/1496719180.jpg','845941','2017-06-06 11:19:39',1,'',''),('1496719197795','qinliang','liufan','Penguins.jpg','jpg','file/1496719197.jpg','777835','2017-06-06 11:19:57',1,'',''),('1496719211485','qinliang','liufan','Penguins.jpg','jpg','file/1496719211.jpg','777835','2017-06-06 11:20:11',1,'',''),('1496719237823','qinliang','wangziyan','','','','','2017-06-06 11:20:37',1,'1',''),('1496719251050','wangziyan','qinliang','','','','','2017-06-06 11:20:51',1,'2',''),('1496719265344','qinliang','wangziyan','Tulips.jpg','jpg','file/1496719265.jpg','620888','2017-06-06 11:21:05',1,'',''),('1496719281709','qinliang','wangziyan','Chrysanthemum.jpg','jpg','file/1496719281.jpg','879394','2017-06-06 11:21:21',1,'',''),('1496719370147','wangziyan','qinliang','Desert.jpg','jpg','file/1496719370.jpg','845941','2017-06-06 11:22:50',1,'',''),('1496719379036','qinliang','wangziyan','Tulips.jpg','jpg','file/1496719379.jpg','620888','2017-06-06 11:22:59',1,'',''),('1496721136099','qinliang','wangziyan','','','','','2017-06-06 11:52:16',1,'你',''),('1496729527688','qinliang','wangziyan','','','','','2017-06-06 14:12:07',1,'哈哈',''),('1496735108149','wangziyan','qinliang','chrome.exe','exe','file/1496735108.exe','1','2017-06-06 15:45:08',1,'',''),('1496735269630','wangziyan','qinliang','chrome.exe','exe','file/1496735269.exe','953.335937','2017-06-06 15:47:49',1,'',''),('1496735321024','wangziyan','qinliang','chrome.exe','exe','file/1496735321.exe','954','2017-06-06 15:48:41',1,'',''),('1496735361328','wangziyan','qinliang','chrome.exe','exe','file/1496735361.exe','954kb','2017-06-06 15:49:21',1,'',''),('1496735398940','wangziyan','qinliang','chrome.exe','exe','file/1496735398.exe','954kb','2017-06-06 15:49:58',1,'',''),('1496735538603','qinliang','wangziyan','Wildlife.wmv','wmv','file/1496735540.wmv','26m','2017-06-06 15:52:18',1,'',''),('1496750523868','liufan','wangziyan','','','','','2017-06-06 20:02:03',1,'','request'),('1496750532186','wangziyan','liufan','','','','','2017-06-06 20:02:12',1,'','response'),('1496750544638','wangziyan','liufan','','','','','2017-06-06 20:02:24',1,'','delete'),('1496750884790','wangziyan','liufan','','','','','2017-06-06 20:08:04',1,'','request'),('1496750896300','liufan','wangziyan','','','','','2017-06-06 20:08:16',1,'','response'),('1496750922769','wangziyan','liufan','','','','','2017-06-06 20:08:42',1,'你好呀',''),('1496750948125','liufan','wangziyan','','','','','2017-06-06 20:09:08',1,'。。。',''),('1496751065891','wangziyan','liufan','','','','','2017-06-06 20:11:05',1,'。',''),('1496751110560','wangziyan','liufan','','','','','2017-06-06 20:11:50',1,'123',''),('1496751195086','wangziyan','liufan','','','','','2017-06-06 20:13:15',1,'123',''),('1496751257884','wangziyan','liufan','','','','','2017-06-06 20:14:17',1,'1',''),('1496751350713','wangziyan','liufan','','','','','2017-06-06 20:15:50',1,'行了么',''),('1496751357464','liufan','wangziyan','','','','','2017-06-06 20:15:57',1,'啊呀',''),('1496751369755','wangziyan','liufan','','','','','2017-06-06 20:16:09',1,'吓死我了都',''),('1496751376700','liufan','wangziyan','','','','','2017-06-06 20:16:16',1,'是啊',''),('1496751380929','wangziyan','liufan','','','','','2017-06-06 20:16:20',1,'1',''),('1496751381114','wangziyan','liufan','','','','','2017-06-06 20:16:21',1,'2',''),('1496751381308','wangziyan','liufan','','','','','2017-06-06 20:16:21',1,'3',''),('1496751381499','wangziyan','liufan','','','','','2017-06-06 20:16:21',1,'4',''),('1496751381722','wangziyan','liufan','','','','','2017-06-06 20:16:21',1,'5',''),('1496751381918','wangziyan','liufan','','','','','2017-06-06 20:16:21',1,'6',''),('1496751651639','liufan','wangziyan','','','','','2017-06-06 20:20:51',1,'','delete'),('1496751675713','liufan','wangziyan','','','','','2017-06-06 20:21:15',1,'','request'),('1496751688319','wangziyan','liufan','','','','','2017-06-06 20:21:28',1,'','response'),('1496751706458','liufan','wangziyan','','','','','2017-06-06 20:21:46',1,'玩个屁',''),('1496751726734','wangziyan','liufan','','','','','2017-06-06 20:22:06',1,'','delete'),('1496751731624','wangziyan','liufan','','','','','2017-06-06 20:22:11',1,'123',''),('1496752946448','liufan','wangziyan','','','','','2017-06-06 20:42:26',1,'','request'),('1496752958432','wangziyan','liufan','','','','','2017-06-06 20:42:38',1,'','response'),('1496753087976','wangziyan','liufan','','','','','2017-06-06 20:44:47',1,'','delete'),('1496753098411','liufan','wangziyan','','','','','2017-06-06 20:44:58',1,'','request'),('1496753110616','wangziyan','liufan','','','','','2017-06-06 20:45:10',1,'','response'),('1496753283813','wangziyan','liufan','','','','','2017-06-06 20:48:03',1,'','delete'),('1496753293502','liufan','wangziyan','','','','','2017-06-06 20:48:13',1,'','request'),('1496753301440','wangziyan','liufan','','','','','2017-06-06 20:48:21',1,'','response'),('1496753380905','wangziyan','liufan','','','','','2017-06-06 20:49:40',1,'','delete'),('1496753393131','liufan','wangziyan','','','','','2017-06-06 20:49:53',1,'','request'),('1496753400934','wangziyan','liufan','','','','','2017-06-06 20:50:00',1,'','response'),('1496753437780','wangziyan','liufan','','','','','2017-06-06 20:50:37',1,'','delete'),('1496753446425','liufan','wangziyan','','','','','2017-06-06 20:50:46',1,'','request'),('1496753453730','wangziyan','liufan','','','','','2017-06-06 20:50:53',1,'','response'),('1496753465919','wangziyan','liufan','','','','','2017-06-06 20:51:05',1,'123',''),('1496753470509','liufan','wangziyan','','','','','2017-06-06 20:51:10',1,'哈哈哈',''),('1496753475053','wangziyan','liufan','','','','','2017-06-06 20:51:15',1,'呵呵',''),('1496753480583','wangziyan','liufan','','','','','2017-06-06 20:51:20',1,'123',''),('1496753488207','wangziyan','liufan','master_preferences','master_preferences','file/1496753488.master_preferences','107b','2017-06-06 20:51:28',1,'',''),('1496753497240','wangziyan','liufan','Hydrangeas.jpg','jpg','file/1496753497.jpg','582kb','2017-06-06 20:51:37',1,'',''),('1496753515615','wangziyan','liufan','Jellyfish.jpg','jpg','file/1496753515.jpg','758kb','2017-06-06 20:51:55',1,'',''),('1496753520279','wangziyan','liufan','','','','','2017-06-06 20:52:00',1,'哈哈去',''),('1496753523372','wangziyan','liufan','','','','','2017-06-06 20:52:03',1,'55',''),('1496753527761','wangziyan','liufan','Tulips.jpg','jpg','file/1496753527.jpg','607kb','2017-06-06 20:52:07',1,'',''),('1496753561927','liufan','wangziyan','Hydrangeas.jpg','jpg','file/1496753561.jpg','582kb','2017-06-06 20:52:41',1,'',''),('1496753567811','wangziyan','liufan','Hydrangeas.jpg','jpg','file/1496753567.jpg','582kb','2017-06-06 20:52:47',1,'',''),('1496753744006','liufan','wangziyan','Jellyfish.jpg','jpg','file/1496753744.jpg','758kb','2017-06-06 20:55:44',1,'',''),('1496753749089','liufan','wangziyan','Lighthouse.jpg','jpg','file/1496753749.jpg','549kb','2017-06-06 20:55:49',1,'',''),('1496754960722','wangziyan','liufan','','','','','2017-06-06 21:16:00',1,'你好啊',''),('1496754965059','liufan','wangziyan','','','','','2017-06-06 21:16:05',1,'嗯嗯',''),('1496754975201','wangziyan','liufan','','','','','2017-06-06 21:16:15',1,'今天答辩',''),('1496754980024','liufan','wangziyan','','','','','2017-06-06 21:16:20',1,'是啊',''),('1496754985928','wangziyan','liufan','','','','','2017-06-06 21:16:25',1,'要加油哦',''),('1496754999137','liufan','wangziyan','','','','','2017-06-06 21:16:39',1,'嗯嗯',''),('1496755019806','wangziyan','liufan','Hydrangeas.jpg','jpg','file/1496755020.jpg','582kb','2017-06-06 21:16:59',1,'',''),('1496755025531','liufan','wangziyan','Koala.jpg','jpg','file/1496755025.jpg','763kb','2017-06-06 21:17:05',1,'',''),('1496755031892','wangziyan','liufan','Tulips.jpg','jpg','file/1496755031.jpg','607kb','2017-06-06 21:17:11',1,'',''),('1496755035832','wangziyan','liufan','','','','','2017-06-06 21:17:15',1,'。。',''),('1496755056829','liufan','wangziyan','','','','','2017-06-06 21:17:36',1,'11',''),('1496755092505','liufan','qinliang','','','','','2017-06-06 21:18:12',1,'真的',''),('1496756128852','liufan','qinliang','','','','','2017-06-06 21:35:28',1,'瓦咔咔',''),('1496756229571','qinliang','liufan','','','','','2017-06-06 21:37:09',1,'111',''),('1496757889607','qinliang','liufan','','','','','2017-06-06 22:04:49',1,'523',''),('1496757892852','qinliang','liufan','','','','','2017-06-06 22:04:52',1,'55',''),('1496758834051','liufan','qinliang','','','','','2017-06-06 22:20:34',1,'22',''),('1496763710254','liufan','qinliang','','','','','2017-06-06 23:41:50',1,'hollo',''),('1496763752795','liufan','hukai','','','','','2017-06-06 23:42:32',1,'。。。',''),('1496763761316','qinliang','liufan','','','','','2017-06-06 23:42:41',1,'hi',''),('1496763765789','qinliang','liufan','','','','','2017-06-06 23:42:45',1,'哈哈',''),('1496768594021','liufan','qinliang','','','','','2017-06-07 01:03:14',1,'','delete'),('1496768611751','qinliang','liufan','','','','','2017-06-07 01:03:31',1,'','request'),('1496768671134','liufan','qinliang','','','','','2017-06-07 01:04:31',1,'','response'),('1496768775060','liufan','qinliang','','','','','2017-06-07 01:06:15',1,'','delete'),('1496768783228','qinliang','liufan','','','','','2017-06-07 01:06:23',1,'','request'),('1496769164738','liufan','qinliang','','','','','2017-06-07 01:12:44',1,'','response'),('1496769217593','liufan','qinliang','','','','','2017-06-07 01:13:37',1,'','delete'),('1496769230372','qinliang','liufan','','','','','2017-06-07 01:13:50',1,'','request'),('1496769249497','liufan','qinliang','','','','','2017-06-07 01:14:09',1,'','response'),('1496769300096','hukai','liufan','','','','','2017-06-07 01:15:00',1,'','delete'),('1496769350129','qinliang','lining','','','','','2017-06-07 01:15:50',1,'','request'),('1496769386664','qinliang','wangziyan','','','','','2017-06-07 01:16:26',1,'','request'),('1496769394809','wangziyan','qinliang','','','','','2017-06-07 01:16:34',1,'','response'),('1496769401119','lining','qinliang','','','','','2017-06-07 01:16:41',0,'','response'),('1496769429572','qinliang','wangziyan','','','','','2017-06-07 01:17:09',1,'你好',''),('1496769434323','wangziyan','qinliang','','','','','2017-06-07 01:17:14',1,'哈哈',''),('1496794425662','liufan','zhangsan','','','','','2017-06-07 08:13:45',1,'','request'),('1496794436059','zhangsan','liufan','','','','','2017-06-07 08:13:56',1,'','response'),('1496795850901','liufan','zhangsan','','','','','2017-06-07 08:37:30',1,'你好',''),('1496795856937','zhangsan','liufan','','','','','2017-06-07 08:37:36',1,'你也好',''),('1496795867404','liufan','zhangsan','','','','','2017-06-07 08:37:47',1,'答辩必过',''),('1496795875786','zhangsan','liufan','','','','','2017-06-07 08:37:55',1,'对头',''),('1496795896598','zhangsan','liufan','','','','','2017-06-07 08:38:16',1,'hi',''),('1496796170945','zhangsan','liufan','','','','','2017-06-07 08:42:50',1,'','delete'),('1496796189568','liufan','zhangsan','','','','','2017-06-07 08:43:09',1,'','request'),('1496796196767','zhangsan','liufan','','','','','2017-06-07 08:43:16',1,'','response'),('1496796205458','zhangsan','liufan','Chrysanthemum.jpg','jpg','file/1496796205.jpg','859kb','2017-06-07 08:43:25',1,'',''),('1496796224492','zhangsan','liufan','Tulips.jpg','jpg','file/1496796224.jpg','607kb','2017-06-07 08:43:44',1,'',''),('1496796230812','zhangsan','liufan','','','','','2017-06-07 08:43:50',1,'，',''),('1496796347748','zhangsan','liufan','11303090122_刘凡_基于WEB的网络聊天软件的设计与实现.doc','doc','file/1496796347.doc','7m','2017-06-07 08:45:47',1,'',''),('1496801037282','liufan','lisi','','','','','2017-06-07 10:03:57',1,'','request'),('1496801045649','lisi','liufan','','','','','2017-06-07 10:04:05',1,'','response'),('1496801063663','liufan','lisi','','','','','2017-06-07 10:04:23',1,'你好',''),('1496801070808','lisi','liufan','','','','','2017-06-07 10:04:30',1,'你好',''),('1496801080115','liufan','lisi','Chrysanthemum.jpg','jpg','file/1496801080.jpg','859kb','2017-06-07 10:04:40',1,'',''),('1496801089901','lisi','liufan','Hydrangeas.jpg','jpg','file/1496801089.jpg','582kb','2017-06-07 10:04:49',1,'',''),('1496801100100','liufan','lisi','11303090122_刘凡_基于WEB的网络聊天软件的设计与实现.doc','doc','file/1496801100.doc','7m','2017-06-07 10:05:00',1,'',''),('1496801127214','liufan','lisi','','','','','2017-06-07 10:05:27',1,'','delete'),('1496801153336','liufan','lisi','','','','','2017-06-07 10:05:53',1,'','request'),('1496801159865','lisi','liufan','','','','','2017-06-07 10:05:59',1,'','response'),('1496847658306','zhangsan','liufan','','','','','2017-06-07 23:00:58',0,'','delete'),('1496847665203','qinliang','liufan','','','','','2017-06-07 23:01:05',1,'','delete'),('1496847923346','liufan','wangziyan','','','','','2017-06-07 23:05:23',1,'你好',''),('1496848117709','liufan','wangziyan','','','','','2017-06-07 23:08:37',1,'你好',''),('1496848134052','liufan','wangziyan','','','','','2017-06-07 23:08:54',1,'你好',''),('1496848134662','wangziyan','liufan','','','','','2017-06-07 23:08:54',1,'你好',''),('1496848551893','liufan','wangziyan','','','','','2017-06-07 23:15:51',1,'','delete'),('1496848564392','liufan','wangziyan','','','','','2017-06-07 23:16:04',1,'','request'),('1496848613845','wangziyan','liufan','','','','','2017-06-07 23:16:53',1,'','response'),('1496849077908','liufan','wangziyan','','','','','2017-06-07 23:24:37',1,'你好',''),('1496849089684','liufan','lisi','','','','','2017-06-07 23:24:49',1,'我是李四',''),('1496849298429','liufan','wangziyan','','','','','2017-06-07 23:28:18',1,'你好',''),('1496854083511','lining','qinliang','','','','','2017-06-08 00:48:03',0,'','delete'),('1496854089199','wangziyan','qinliang','','','','','2017-06-08 00:48:09',0,'','delete'),('1497018017811','hukai','liufan','','','','','2017-06-09 22:20:17',1,'','request'),('1497018851668','liufan','hukai','','','','','2017-06-09 22:34:11',1,'','response'),('1497018871322','wangziyan','liufan','','','','','2017-06-09 22:34:31',0,'你好',''),('1497018875914','wangziyan','liufan','','','','','2017-06-09 22:34:35',0,'现在是晚上了',''),('1497018886825','liufan','hukai','','','','','2017-06-09 22:34:46',1,'你好',''),('1497018891642','liufan','hukai','','','','','2017-06-09 22:34:51',1,'你在吗','');

#
# Structure for table "user"
#

CREATE TABLE `user` (
  `userId` varchar(20) NOT NULL,
  `password` varchar(20) CHARACTER SET gbk NOT NULL,
  `sex` varchar(5) NOT NULL,
  `age` int(5) NOT NULL,
  `status` varchar(10) CHARACTER SET gbk NOT NULL,
  `nickName` varchar(50) CHARACTER SET gbk NOT NULL,
  `avatar` varchar(100) NOT NULL,
  PRIMARY KEY (`userId`),
  UNIQUE KEY `userId` (`userId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "user"
#

INSERT INTO `user` VALUES ('hukai','123456','男',30,'on','hukai','avatar/10.jpg'),('lining','123456','男',20,'off','lining','avatar/2.jpg'),('lisi','123456','男',20,'on','李四','avatar/4.jpg'),('liufan','666666','男',23,'on','HTML','avatar/5.jpg'),('qinliang','123456','男',22,'on','僵小鱼','avatar/7.jpg'),('wangziyan','123456','男',21,'off','Android','avatar/6.jpg'),('zhangsan','123456','男',22,'off','xiaozhang','avatar/6.jpg');
