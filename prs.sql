DROP TABLE IF EXISTS auth_permission;
CREATE TABLE IF NOT EXISTS `auth_permission` (
    `id` integer NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `name` varchar(50) NOT NULL,
    `content_type_id` integer NOT NULL,
    `codename` varchar(100) NOT NULL,
    UNIQUE (`content_type_id`, `codename`)
);
INSERT INTO auth_permission VALUES(1,'Can add permission',1,'add_permission');
INSERT INTO auth_permission VALUES(2,'Can change permission',1,'change_permission');
INSERT INTO auth_permission VALUES(3,'Can delete permission',1,'delete_permission');
INSERT INTO auth_permission VALUES(4,'Can add group',2,'add_group');
INSERT INTO auth_permission VALUES(5,'Can change group',2,'change_group');
INSERT INTO auth_permission VALUES(6,'Can delete group',2,'delete_group');
INSERT INTO auth_permission VALUES(7,'Can add user',3,'add_user');
INSERT INTO auth_permission VALUES(8,'Can change user',3,'change_user');
INSERT INTO auth_permission VALUES(9,'Can delete user',3,'delete_user');
INSERT INTO auth_permission VALUES(10,'Can add message',4,'add_message');
INSERT INTO auth_permission VALUES(11,'Can change message',4,'change_message');
INSERT INTO auth_permission VALUES(12,'Can delete message',4,'delete_message');
INSERT INTO auth_permission VALUES(13,'Can add content type',5,'add_contenttype');
INSERT INTO auth_permission VALUES(14,'Can change content type',5,'change_contenttype');
INSERT INTO auth_permission VALUES(15,'Can delete content type',5,'delete_contenttype');
INSERT INTO auth_permission VALUES(16,'Can add session',6,'add_session');
INSERT INTO auth_permission VALUES(17,'Can change session',6,'change_session');
INSERT INTO auth_permission VALUES(18,'Can delete session',6,'delete_session');
INSERT INTO auth_permission VALUES(19,'Can add site',7,'add_site');
INSERT INTO auth_permission VALUES(20,'Can change site',7,'change_site');
INSERT INTO auth_permission VALUES(21,'Can delete site',7,'delete_site');
INSERT INTO auth_permission VALUES(22,'Can add activity',8,'add_activity');
INSERT INTO auth_permission VALUES(23,'Can change activity',8,'change_activity');
INSERT INTO auth_permission VALUES(24,'Can delete activity',8,'delete_activity');
INSERT INTO auth_permission VALUES(25,'Can add score',9,'add_score');
INSERT INTO auth_permission VALUES(26,'Can change score',9,'change_score');
INSERT INTO auth_permission VALUES(27,'Can delete score',9,'delete_score');
INSERT INTO auth_permission VALUES(28,'Can add log entry',10,'add_logentry');
INSERT INTO auth_permission VALUES(29,'Can change log entry',10,'change_logentry');
INSERT INTO auth_permission VALUES(30,'Can delete log entry',10,'delete_logentry');
INSERT INTO auth_permission VALUES(31,'Can add migration history',11,'add_migrationhistory');
INSERT INTO auth_permission VALUES(32,'Can change migration history',11,'change_migrationhistory');
INSERT INTO auth_permission VALUES(33,'Can delete migration history',11,'delete_migrationhistory');
INSERT INTO auth_permission VALUES(34,'Can add tag',12,'add_tag');
INSERT INTO auth_permission VALUES(35,'Can change tag',12,'change_tag');
INSERT INTO auth_permission VALUES(36,'Can delete tag',12,'delete_tag');
DROP TABLE IF EXISTS auth_group_permissions;
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
    `id` integer NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `group_id` integer NOT NULL,
    `permission_id` integer NOT NULL REFERENCES `auth_permission` (`id`),
    UNIQUE (`group_id`, `permission_id`)
);
DROP TABLE IF EXISTS auth_group;
CREATE TABLE IF NOT EXISTS `auth_group` (
    `id` integer NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `name` varchar(80) NOT NULL UNIQUE
);
DROP TABLE IF EXISTS auth_user_user_permissions;
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
    `id` integer NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `user_id` integer NOT NULL,
    `permission_id` integer NOT NULL REFERENCES `auth_permission` (`id`),
    UNIQUE (`user_id`, `permission_id`)
);
DROP TABLE IF EXISTS auth_user_groups;
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
    `id` integer NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `user_id` integer NOT NULL,
    `group_id` integer NOT NULL REFERENCES `auth_group` (`id`),
    UNIQUE (`user_id`, `group_id`)
);
DROP TABLE IF EXISTS auth_user;
CREATE TABLE IF NOT EXISTS `auth_user` (
    `id` integer NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `username` varchar(30) NOT NULL UNIQUE,
    `first_name` varchar(30) NOT NULL,
    `last_name` varchar(30) NOT NULL,
    `email` varchar(75) NOT NULL,
    `password` varchar(128) NOT NULL,
    `is_staff` bool NOT NULL,
    `is_active` bool NOT NULL,
    `is_superuser` bool NOT NULL,
    `last_login` datetime NOT NULL,
    `date_joined` datetime NOT NULL
);
INSERT INTO auth_user VALUES(1,'gigi','Gigi','Sayfan','gigi-s@bigfoot.com','sha1$76984$d4671c171ce8f112a8ce9f1df6d0e0bbc79e899c',1,1,1,'2012-02-07 23:46:22.348000','2011-04-28 01:03:09');
INSERT INTO auth_user VALUES(2,'bloblblobl','Saar','Sayfan','bloblblobl@gmail.com','sha1$f2cbf$8bad8dee6687404c2b6435883073f8ba2a9a6aa3',0,1,0,'2011-11-14 10:49:38','2011-11-14 10:49:38');
INSERT INTO auth_user VALUES(3,'liat','','','','sha1$a2cd1$6f44fad8e9f82dec557e916a2b3ad295309e9ef6',0,1,0,'2012-01-22 10:39:57.079000','2012-01-21 22:22:34.764000');
INSERT INTO auth_user VALUES(4,'ophir','Ophir','Sayfan','','sha1$9d5fb$c908ffedff41b4433e524f578bb19d1ca016dc9e',0,1,0,'2012-02-04 22:03:26.618000','2012-02-01 22:01:52');
DROP TABLE IF EXISTS auth_message;
CREATE TABLE IF NOT EXISTS `auth_message` (
    `id` integer NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `user_id` integer NOT NULL REFERENCES `auth_user` (`id`),
    `message` text NOT NULL
);
INSERT INTO auth_message VALUES(1,4,'Your score was created');
INSERT INTO auth_message VALUES(2,4,'Your score was created');
DROP TABLE IF EXISTS django_content_type;
CREATE TABLE IF NOT EXISTS `django_content_type` (
    `id` integer NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `name` varchar(100) NOT NULL,
    `app_label` varchar(100) NOT NULL,
    `model` varchar(100) NOT NULL,
    UNIQUE (`app_label`, `model`)
);
INSERT INTO django_content_type VALUES(1,'permission','auth','permission');
INSERT INTO django_content_type VALUES(2,'group','auth','group');
INSERT INTO django_content_type VALUES(3,'user','auth','user');
INSERT INTO django_content_type VALUES(4,'message','auth','message');
INSERT INTO django_content_type VALUES(5,'content type','contenttypes','contenttype');
INSERT INTO django_content_type VALUES(6,'session','sessions','session');
INSERT INTO django_content_type VALUES(7,'site','sites','site');
INSERT INTO django_content_type VALUES(8,'activity','prs','activity');
INSERT INTO django_content_type VALUES(9,'score','prs','score');
INSERT INTO django_content_type VALUES(10,'log entry','admin','logentry');
INSERT INTO django_content_type VALUES(11,'migration history','south','migrationhistory');
INSERT INTO django_content_type VALUES(12,'tag','prs','tag');
DROP TABLE IF EXISTS django_session;
CREATE TABLE IF NOT EXISTS `django_session` (
    `session_key` varchar(40) NOT NULL PRIMARY KEY,
    `session_data` text NOT NULL,
    `expire_date` datetime NOT NULL
);
INSERT INTO django_session VALUES('4a82b236c49778454df97a6304c7e261','ODZmYjU1Mjc4YTEzYTM0YTZjNGUzYTdhOGIzN2IzYTA1MjE5Mjk3MTqAAn1xAVUKdGVzdGNvb2tp
ZXECVQZ3b3JrZWRxA3Mu
','2011-05-15 13:31:41.732000');
INSERT INTO django_session VALUES('b00d63454ac9ddea1e13bab22494938d','MDhlMTA1NWRhYTg5MjM2ZWU4MDFiZGYyN2M3MmUyYTZkMzRkZjk4YTqAAn1xAShVEl9hdXRoX3Vz
ZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED
VQ1fYXV0aF91c2VyX2lkcQRLAXUu
','2011-05-15 13:59:10.489000');
INSERT INTO django_session VALUES('230deb224a9cea2404c50e417bf95a52','MDhlMTA1NWRhYTg5MjM2ZWU4MDFiZGYyN2M3MmUyYTZkMzRkZjk4YTqAAn1xAShVEl9hdXRoX3Vz
ZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED
VQ1fYXV0aF91c2VyX2lkcQRLAXUu
','2011-05-18 22:24:44.555689');
INSERT INTO django_session VALUES('a81af162e2ddac54b8705b8bfcec1398','MDhlMTA1NWRhYTg5MjM2ZWU4MDFiZGYyN2M3MmUyYTZkMzRkZjk4YTqAAn1xAShVEl9hdXRoX3Vz
ZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED
VQ1fYXV0aF91c2VyX2lkcQRLAXUu
','2011-07-02 08:14:34.285000');
INSERT INTO django_session VALUES('044955cd4e64926cfceb2f8e308ce7e3','MDhlMTA1NWRhYTg5MjM2ZWU4MDFiZGYyN2M3MmUyYTZkMzRkZjk4YTqAAn1xAShVEl9hdXRoX3Vz
ZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED
VQ1fYXV0aF91c2VyX2lkcQRLAXUu
','2011-07-30 12:45:15.883000');
INSERT INTO django_session VALUES('255fa8a577f1c32a06e1133f951220d0','MDhlMTA1NWRhYTg5MjM2ZWU4MDFiZGYyN2M3MmUyYTZkMzRkZjk4YTqAAn1xAShVEl9hdXRoX3Vz
ZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED
VQ1fYXV0aF91c2VyX2lkcQRLAXUu
','2011-09-18 01:03:29.810000');
INSERT INTO django_session VALUES('b897c93e03200052cf040808cb3b4441','MDhlMTA1NWRhYTg5MjM2ZWU4MDFiZGYyN2M3MmUyYTZkMzRkZjk4YTqAAn1xAShVEl9hdXRoX3Vz
ZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED
VQ1fYXV0aF91c2VyX2lkcQRLAXUu
','2011-11-27 15:48:38.883000');
INSERT INTO django_session VALUES('81c669539d9e92baa74f25ded0aacffe','MDhlMTA1NWRhYTg5MjM2ZWU4MDFiZGYyN2M3MmUyYTZkMzRkZjk4YTqAAn1xAShVEl9hdXRoX3Vz
ZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED
VQ1fYXV0aF91c2VyX2lkcQRLAXUu
','2011-12-12 00:09:48.739000');
INSERT INTO django_session VALUES('c83271b364a6dce6bf970a340cb895f8','MDhlMTA1NWRhYTg5MjM2ZWU4MDFiZGYyN2M3MmUyYTZkMzRkZjk4YTqAAn1xAShVEl9hdXRoX3Vz
ZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED
VQ1fYXV0aF91c2VyX2lkcQRLAXUu
','2012-01-29 13:11:35.289000');
INSERT INTO django_session VALUES('6e33d3edc9efafff76afa2bcb905893b','ODZmYjU1Mjc4YTEzYTM0YTZjNGUzYTdhOGIzN2IzYTA1MjE5Mjk3MTqAAn1xAVUKdGVzdGNvb2tp
ZXECVQZ3b3JrZWRxA3Mu
','2012-01-29 13:41:28.524000');
INSERT INTO django_session VALUES('4c8e26edf12fd6bc93cf080b444b4445','MDhlMTA1NWRhYTg5MjM2ZWU4MDFiZGYyN2M3MmUyYTZkMzRkZjk4YTqAAn1xAShVEl9hdXRoX3Vz
ZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED
VQ1fYXV0aF91c2VyX2lkcQRLAXUu
','2012-02-05 10:44:52.174000');
INSERT INTO django_session VALUES('43b8354ee30ba9ff702ae121b129efa6','MDhlMTA1NWRhYTg5MjM2ZWU4MDFiZGYyN2M3MmUyYTZkMzRkZjk4YTqAAn1xAShVEl9hdXRoX3Vz
ZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED
VQ1fYXV0aF91c2VyX2lkcQRLAXUu
','2012-02-21 02:02:42.141000');
INSERT INTO django_session VALUES('17d97f2c2c677018a52f286b5bb39562','MDhlMTA1NWRhYTg5MjM2ZWU4MDFiZGYyN2M3MmUyYTZkMzRkZjk4YTqAAn1xAShVEl9hdXRoX3Vz
ZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED
VQ1fYXV0aF91c2VyX2lkcQRLAXUu
','2012-02-21 23:46:22.455000');
DROP TABLE IF EXISTS django_site;
CREATE TABLE IF NOT EXISTS `django_site` (
    `id` integer NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `domain` varchar(100) NOT NULL,
    `name` varchar(50) NOT NULL
);
INSERT INTO django_site VALUES(1,'example.com','example.com');
DROP TABLE IF EXISTS django_admin_log;
CREATE TABLE IF NOT EXISTS `django_admin_log` (
    `id` integer NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `action_time` datetime NOT NULL,
    `user_id` integer NOT NULL REFERENCES `auth_user` (`id`),
    `content_type_id` integer REFERENCES `django_content_type` (`id`),
    `object_id` text,
    `object_repr` varchar(200) NOT NULL,
    `action_flag` smallint unsigned NOT NULL,
    `change_message` text NOT NULL
);
INSERT INTO django_admin_log VALUES(1,'2011-05-01 14:05:15.523000',1,8,'2','name: Press',1,'');
INSERT INTO django_admin_log VALUES(2,'2011-05-01 14:05:33.667000',1,8,'2','name: Press',2,'Changed reps.');
INSERT INTO django_admin_log VALUES(3,'2011-05-01 14:35:30.856000',1,9,'1','weight: LB 255',1,'');
INSERT INTO django_admin_log VALUES(4,'2011-05-01 14:38:29.860000',1,8,'3','name: Filthy Fifty',1,'');
INSERT INTO django_admin_log VALUES(5,'2011-05-01 14:39:28.976000',1,9,'2','Time: 00:25:36',1,'');
INSERT INTO django_admin_log VALUES(6,'2011-05-01 21:49:20.072000',1,8,'1','name: Back Squat',1,'');
INSERT INTO django_admin_log VALUES(7,'2011-05-01 21:50:18.877000',1,8,'2','name: Press',1,'');
INSERT INTO django_admin_log VALUES(8,'2011-05-01 21:51:06.477000',1,8,'3','name: Deadlift',1,'');
INSERT INTO django_admin_log VALUES(9,'2011-05-01 21:57:51.919000',1,8,'1','name: Back Squat',2,'No fields changed.');
INSERT INTO django_admin_log VALUES(10,'2011-05-01 22:00:10.332000',1,9,'1','Back Squat - 255 LB',1,'');
INSERT INTO django_admin_log VALUES(11,'2011-05-01 22:20:33.355000',1,9,'1','Back Squat - 255 LB',2,'Changed rx.');
INSERT INTO django_admin_log VALUES(12,'2011-05-01 22:21:15.693000',1,9,'2','Press - 150 LB',1,'');
INSERT INTO django_admin_log VALUES(13,'2011-05-04 23:51:20.330200',1,8,'1','Back Squat 1RM',2,'Changed name and reps.');
INSERT INTO django_admin_log VALUES(14,'2011-05-04 23:51:57.204081',1,8,'4','Back Squat 3RM',1,'');
INSERT INTO django_admin_log VALUES(15,'2011-05-04 23:52:38.719132',1,8,'4','Back Squat 3RM',2,'Changed description.');
INSERT INTO django_admin_log VALUES(16,'2011-05-04 23:53:09.766862',1,8,'5','Back Squat 5RM',1,'');
INSERT INTO django_admin_log VALUES(17,'2011-05-04 23:53:26.335027',1,8,'3','Deadlift 1RM',2,'Changed name and reps.');
INSERT INTO django_admin_log VALUES(18,'2011-05-04 23:53:38.076818',1,8,'2','Press 1RM',2,'Changed name.');
INSERT INTO django_admin_log VALUES(19,'2011-05-04 23:58:00.422866',1,9,'2','Press 1RM - 150 LB',2,'Changed reps.');
INSERT INTO django_admin_log VALUES(20,'2011-05-04 23:58:17.254444',1,9,'1','Back Squat 1RM - 255 LB',2,'Changed reps.');
INSERT INTO django_admin_log VALUES(21,'2011-05-09 02:23:09.665000',1,9,'3','Deadlift 1RM - 385 LB',1,'');
INSERT INTO django_admin_log VALUES(22,'2011-05-09 02:25:02.946000',1,9,'4','Back Squat 5RM - 235 LB',1,'');
INSERT INTO django_admin_log VALUES(23,'2011-05-09 02:26:15.609000',1,8,'6','Deadlift 3RM',1,'');
INSERT INTO django_admin_log VALUES(24,'2011-05-09 02:26:46.107000',1,8,'7','Deadlift 5RM',1,'');
INSERT INTO django_admin_log VALUES(25,'2011-05-09 02:27:48.116000',1,8,'8','Press 3RM',1,'');
INSERT INTO django_admin_log VALUES(26,'2011-05-09 02:28:03.274000',1,8,'8','Press 3RM',2,'Changed unit.');
INSERT INTO django_admin_log VALUES(27,'2011-05-09 02:28:40.765000',1,8,'9','Press 5RM',1,'');
INSERT INTO django_admin_log VALUES(28,'2011-05-09 02:30:23.815000',1,9,'5','Deadlift 5RM - 125 LB',1,'');
INSERT INTO django_admin_log VALUES(29,'2011-05-09 02:30:47.291000',1,9,'5','Deadlift 5RM - 345 LB',2,'Changed weight.');
INSERT INTO django_admin_log VALUES(30,'2011-05-09 02:31:23.605000',1,9,'6','Deadlift 3RM - 375 LB',1,'');
INSERT INTO django_admin_log VALUES(31,'2011-05-09 02:37:12.874000',1,9,'7','Press 5RM - 125 LB',1,'');
INSERT INTO django_admin_log VALUES(32,'2011-05-09 02:37:26.082000',1,9,'2','Press 1RM - 150 LB',2,'Changed when.');
INSERT INTO django_admin_log VALUES(33,'2011-06-18 08:18:21.335000',1,8,'10','Max pull ups',1,'');
INSERT INTO django_admin_log VALUES(34,'2011-06-19 10:12:54.449000',1,9,'8','Max Max pull ups - 37',1,'');
INSERT INTO django_admin_log VALUES(35,'2011-06-19 13:44:20.538000',1,8,'10','Pull ups',2,'Changed name.');
INSERT INTO django_admin_log VALUES(36,'2011-07-16 12:48:20.897000',1,8,'11','Max reps 1.5 pood Kettlebell Swings',1,'');
INSERT INTO django_admin_log VALUES(37,'2011-07-16 12:48:57.406000',1,8,'11','Kettlebell Swings - 1.5 pood',2,'Changed name.');
INSERT INTO django_admin_log VALUES(38,'2011-09-04 01:04:14.979000',1,9,'9','Back Squat 5RM - 245 LB',1,'');
INSERT INTO django_admin_log VALUES(39,'2011-11-13 15:50:33.240000',1,8,'12','Kettlebell Swings 2pood',1,'');
INSERT INTO django_admin_log VALUES(40,'2011-11-13 15:50:53.751000',1,8,'12','Kettlebell Swings 2 pood',2,'Changed name.');
INSERT INTO django_admin_log VALUES(41,'2011-11-13 15:51:03.514000',1,8,'12','Kettlebell Swings - 2 pood',2,'Changed name.');
INSERT INTO django_admin_log VALUES(42,'2011-11-13 15:51:11.468000',1,8,'11','Kettlebell Swings - 1.5 pood',2,'Changed description.');
INSERT INTO django_admin_log VALUES(43,'2011-11-14 10:48:59.689000',1,3,'1','gigi',2,'Changed first_name and last_name.');
INSERT INTO django_admin_log VALUES(44,'2011-11-14 10:49:38.363000',1,3,'2','bloblblobl',1,'');
INSERT INTO django_admin_log VALUES(45,'2011-11-14 10:50:33.146000',1,3,'2','bloblblobl',2,'Changed first_name, last_name and email.');
INSERT INTO django_admin_log VALUES(46,'2011-11-28 00:10:17.414000',1,8,'15','Ring Dips',3,'');
INSERT INTO django_admin_log VALUES(47,'2011-11-28 00:10:24.590000',1,8,'14','Ring Dips',3,'');
INSERT INTO django_admin_log VALUES(48,'2011-11-28 16:20:29.492000',1,8,'14','Nasty Girls',1,'');
INSERT INTO django_admin_log VALUES(49,'2011-11-28 16:21:39.333000',1,9,'10','Nasty Girls - 11:02:00',1,'');
INSERT INTO django_admin_log VALUES(50,'2011-11-28 16:22:13.110000',1,9,'11','Nasty Girls - 11:35:00',1,'');
INSERT INTO django_admin_log VALUES(51,'2011-11-28 16:22:15.993000',1,9,'11','Nasty Girls - 11:35:00',2,'No fields changed.');
INSERT INTO django_admin_log VALUES(52,'2011-11-28 16:34:44.965000',1,9,'11','Nasty Girls - 00:11:35',2,'Changed time.');
INSERT INTO django_admin_log VALUES(53,'2011-11-28 16:34:54.326000',1,9,'10','Nasty Girls - 00:11:02',2,'Changed time.');
INSERT INTO django_admin_log VALUES(54,'2012-01-21 22:22:34.770000',1,3,'3','liat',1,'');
INSERT INTO django_admin_log VALUES(55,'2012-01-21 22:24:44.932000',1,9,'12','Back Squat 1RM - 205 LB',1,'');
INSERT INTO django_admin_log VALUES(56,'2012-02-04 12:27:30.198000',1,3,'4','ophir',2,'Changed username.');
INSERT INTO django_admin_log VALUES(57,'2012-02-04 12:28:08.443000',1,3,'4','ophir',2,'Changed first_name and last_name.');
INSERT INTO django_admin_log VALUES(58,'2012-02-04 12:31:42.359000',1,8,'16','Power Clean',1,'');
DROP TABLE IF EXISTS south_migrationhistory;
CREATE TABLE IF NOT EXISTS `south_migrationhistory` (
    `id` integer NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `app_name` varchar(255) NOT NULL,
    `migration` varchar(255) NOT NULL,
    `applied` datetime NOT NULL
);
INSERT INTO south_migrationhistory VALUES(1,'prs','0001_0001','2011-11-13 23:42:30.657000');
INSERT INTO south_migrationhistory VALUES(2,'prs','0002_0002','2011-11-13 23:43:30.614000');
INSERT INTO south_migrationhistory VALUES(3,'prs','0003_schemamigration','2012-02-01 23:06:01.899000');
DROP TABLE IF EXISTS prs_activity;
CREATE TABLE IF NOT EXISTS `prs_activity` (`description` varchar(4096), `weight` integer, `image` text NULL, `reps` integer, `scoreType` varchar(8), `time` time, `id` integer PRIMARY KEY AUTO_INCREMENT, `unit` varchar(4), `name` varchar(256));
INSERT INTO prs_activity VALUES('Put the barbell on your shoulders, sit down and stand up',NULL,NULL,1,'Weight',NULL,1,NULL,'Back Squat 1RM');
INSERT INTO prs_activity VALUES('Rack the barbell on your chest, press up until your elbows are locked. Don''t bend your knees.',NULL,NULL,NULL,'Weight',NULL,2,NULL,'Press 1RM');
INSERT INTO prs_activity VALUES('Pull the barbell from the floor and stand up',NULL,NULL,1,'Weight',NULL,3,NULL,'Deadlift 1RM');
INSERT INTO prs_activity VALUES('Put the barbell on your shoulders, sit down and stand up',NULL,NULL,3,'Weight',NULL,4,NULL,'Back Squat 3RM');
INSERT INTO prs_activity VALUES('Put the barbell on your shoulders, sit down and stand up',NULL,NULL,5,'Weight',NULL,5,NULL,'Back Squat 5RM');
INSERT INTO prs_activity VALUES('Pull the barbell from the floor and stand up',NULL,NULL,3,'Weight',NULL,6,NULL,'Deadlift 3RM');
INSERT INTO prs_activity VALUES('Pull the barbell from the floor and stand up',NULL,NULL,5,'Weight',NULL,7,NULL,'Deadlift 5RM');
INSERT INTO prs_activity VALUES('Rack the barbell on your chest, press up until your elbows are locked. Don''t bend your knees.',NULL,NULL,3,'Time',NULL,8,NULL,'Press 3RM');
INSERT INTO prs_activity VALUES('Rack the barbell on your chest, press up until your elbows are locked. Don''t bend your knees.',NULL,NULL,5,'Weight',NULL,9,NULL,'Press 5RM');
INSERT INTO prs_activity VALUES('Perform as many pull ups as possible without dropping off the bar. Use any style: kipping, strict etc. The only requiremnt is full ROM: chin over bar at the top and arms stretched at the bottom.',NULL,NULL,NULL,'Reps',NULL,10,NULL,'Pull ups');
INSERT INTO prs_activity VALUES('Swing the kettlebell between your legs and over your head.',NULL,'',NULL,'Reps',NULL,11,NULL,'Kettlebell Swings - 1.5 pood');
INSERT INTO prs_activity VALUES('Swing the kettlebell between your legs and over your head.',NULL,'',NULL,'Reps',NULL,12,NULL,'Kettlebell Swings - 2 pood');
INSERT INTO prs_activity VALUES('Jump on the rings and lock your elbows with your arms by your side. That''s your start position. Lower yourself by bending your elbows until your biceps touch the rings. Press up to the start position. Rinse and repeat.',NULL,'',NULL,'Reps',NULL,13,NULL,'Ring Dips');
INSERT INTO prs_activity VALUES('3 rounds for time

50 air squats

7 muscle ups

10 hang power cleans 135#',NULL,'',NULL,'Time',NULL,14,NULL,'Nasty Girls');
INSERT INTO prs_activity VALUES('Skip the rope spinning the rope twice for each skip.',NULL,'',NULL,'Reps',NULL,15,NULL,'Double Unders');
INSERT INTO prs_activity VALUES('Lift the bar from the floor in an explosive motion and rack it on your shoulders. You may bend your knees to catch the bar, but the catch position must not be in a full squat position (heaps at or above knee level) ',NULL,'',NULL,'Weight',NULL,16,NULL,'Power Clean');
DROP TABLE IF EXISTS prs_tag;
CREATE TABLE IF NOT EXISTS `prs_tag` (`id` integer NOT NULL PRIMARY KEY AUTO_INCREMENT, `tag` text NOT NULL, `user_id` integer NOT NULL);
DROP TABLE IF EXISTS prs_score_tags;
CREATE TABLE IF NOT EXISTS `prs_score_tags` (`id` integer NOT NULL PRIMARY KEY AUTO_INCREMENT, `score_id` integer NOT NULL, `tag_id` integer NOT NULL);
DROP TABLE IF EXISTS prs_score;
CREATE TABLE IF NOT EXISTS `prs_score` (`activity_id` integer, `rx` bool, `user_id` integer NOT NULL, `weight` integer, `when` date, `reps` integer, `comments` varchar(1024), `time` time, `id` integer PRIMARY KEY AUTO_INCREMENT, `unit` varchar(4));
INSERT INTO prs_score VALUES(1,1,1,255,'2011-05-01',NULL,'',NULL,1,'LB');
INSERT INTO prs_score VALUES(2,1,1,150,'2011-03-14',NULL,'',NULL,2,'LB');
INSERT INTO prs_score VALUES(3,1,1,385,'2011-05-09',NULL,'',NULL,3,'LB');
INSERT INTO prs_score VALUES(5,1,1,235,'2011-05-09',NULL,'',NULL,4,'LB');
INSERT INTO prs_score VALUES(7,1,1,345,'2011-05-09',NULL,'',NULL,5,'LB');
INSERT INTO prs_score VALUES(6,1,1,375,'2011-05-09',NULL,'',NULL,6,'LB');
INSERT INTO prs_score VALUES(9,1,1,125,'2011-03-14',NULL,'',NULL,7,'LB');
INSERT INTO prs_score VALUES(10,1,1,NULL,'2011-06-17',37,'',NULL,8,NULL);
INSERT INTO prs_score VALUES(5,1,1,245,'2011-09-04',NULL,'',NULL,9,'LB');
INSERT INTO prs_score VALUES(14,1,1,NULL,'2011-11-25',NULL,'','00:11:02',10,'LB');
INSERT INTO prs_score VALUES(14,1,1,NULL,'2011-08-28',NULL,'','00:11:35',11,'LB');
INSERT INTO prs_score VALUES(1,1,3,205,'2012-01-21',1,'',NULL,12,'LB');
INSERT INTO prs_score VALUES(1,1,1,285,'2012-01-14',1,'With belt',NULL,13,'LB');
INSERT INTO prs_score VALUES(15,1,1,NULL,'2012-01-21',70,'',NULL,14,NULL);
INSERT INTO prs_score VALUES(16,1,4,35,'2012-02-03',NULL,'',NULL,15,'LB');
INSERT INTO prs_score VALUES(16,1,4,45,'2012-02-04',NULL,'',NULL,16,'LB');
INSERT INTO prs_score VALUES(15,1,1,NULL,'2012-01-27',75,'',NULL,17,'LB');
CREATE INDEX `auth_permission_1bb8f392` ON `auth_permission` (`content_type_id`);
CREATE INDEX `auth_group_permissions_425ae3c4` ON `auth_group_permissions` (`group_id`);
CREATE INDEX `auth_group_permissions_1e014c8f` ON `auth_group_permissions` (`permission_id`);
CREATE INDEX `auth_user_user_permissions_403f60f` ON `auth_user_user_permissions` (`user_id`);
CREATE INDEX `auth_user_user_permissions_1e014c8f` ON `auth_user_user_permissions` (`permission_id`);
CREATE INDEX `auth_user_groups_403f60f` ON `auth_user_groups` (`user_id`);
CREATE INDEX `auth_user_groups_425ae3c4` ON `auth_user_groups` (`group_id`);
CREATE INDEX `auth_message_403f60f` ON `auth_message` (`user_id`);
CREATE INDEX `django_session_3da3d3d8` ON `django_session` (`expire_date`);
CREATE INDEX `django_admin_log_403f60f` ON `django_admin_log` (`user_id`);
CREATE INDEX `django_admin_log_1bb8f392` ON `django_admin_log` (`content_type_id`);
CREATE INDEX `prs_score_user_id` ON `prs_score` (`user_id`);
CREATE INDEX `prs_tag_403f60f` ON `prs_tag` (`user_id`);
CREATE INDEX `prs_score_tags_77122edb` ON `prs_score_tags` (`score_id`);
CREATE INDEX `prs_score_tags_3747b463` ON `prs_score_tags` (`tag_id`);
CREATE INDEX `prs_score_403f60f` ON `prs_score` (`user_id`);
