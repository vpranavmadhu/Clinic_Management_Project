/*
SQLyog Community v13.0.1 (64 bit)
MySQL - 8.0.33 : Database - smart_clinic
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`smart_clinic` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `smart_clinic`;

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_group` */

/*Table structure for table `auth_group_permissions` */

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_group_permissions` */

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_permission` */

insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values 
(1,'Can add log entry',1,'add_logentry'),
(2,'Can change log entry',1,'change_logentry'),
(3,'Can delete log entry',1,'delete_logentry'),
(4,'Can view log entry',1,'view_logentry'),
(5,'Can add permission',2,'add_permission'),
(6,'Can change permission',2,'change_permission'),
(7,'Can delete permission',2,'delete_permission'),
(8,'Can view permission',2,'view_permission'),
(9,'Can add group',3,'add_group'),
(10,'Can change group',3,'change_group'),
(11,'Can delete group',3,'delete_group'),
(12,'Can view group',3,'view_group'),
(13,'Can add user',4,'add_user'),
(14,'Can change user',4,'change_user'),
(15,'Can delete user',4,'delete_user'),
(16,'Can view user',4,'view_user'),
(17,'Can add content type',5,'add_contenttype'),
(18,'Can change content type',5,'change_contenttype'),
(19,'Can delete content type',5,'delete_contenttype'),
(20,'Can view content type',5,'view_contenttype'),
(21,'Can add session',6,'add_session'),
(22,'Can change session',6,'change_session'),
(23,'Can delete session',6,'delete_session'),
(24,'Can view session',6,'view_session'),
(25,'Can add booking_table',7,'add_booking_table'),
(26,'Can change booking_table',7,'change_booking_table'),
(27,'Can delete booking_table',7,'delete_booking_table'),
(28,'Can view booking_table',7,'view_booking_table'),
(29,'Can add disease_table',8,'add_disease_table'),
(30,'Can change disease_table',8,'change_disease_table'),
(31,'Can delete disease_table',8,'delete_disease_table'),
(32,'Can view disease_table',8,'view_disease_table'),
(33,'Can add doctor_table',9,'add_doctor_table'),
(34,'Can change doctor_table',9,'change_doctor_table'),
(35,'Can delete doctor_table',9,'delete_doctor_table'),
(36,'Can view doctor_table',9,'view_doctor_table'),
(37,'Can add login_table',10,'add_login_table'),
(38,'Can change login_table',10,'change_login_table'),
(39,'Can delete login_table',10,'delete_login_table'),
(40,'Can view login_table',10,'view_login_table'),
(41,'Can add pharmacy_table',11,'add_pharmacy_table'),
(42,'Can change pharmacy_table',11,'change_pharmacy_table'),
(43,'Can delete pharmacy_table',11,'delete_pharmacy_table'),
(44,'Can view pharmacy_table',11,'view_pharmacy_table'),
(45,'Can add prescription_table',12,'add_prescription_table'),
(46,'Can change prescription_table',12,'change_prescription_table'),
(47,'Can delete prescription_table',12,'delete_prescription_table'),
(48,'Can view prescription_table',12,'view_prescription_table'),
(49,'Can add user_table',13,'add_user_table'),
(50,'Can change user_table',13,'change_user_table'),
(51,'Can delete user_table',13,'delete_user_table'),
(52,'Can view user_table',13,'view_user_table'),
(53,'Can add symptom_table',14,'add_symptom_table'),
(54,'Can change symptom_table',14,'change_symptom_table'),
(55,'Can delete symptom_table',14,'delete_symptom_table'),
(56,'Can view symptom_table',14,'view_symptom_table'),
(57,'Can add shedule_table',15,'add_shedule_table'),
(58,'Can change shedule_table',15,'change_shedule_table'),
(59,'Can delete shedule_table',15,'delete_shedule_table'),
(60,'Can view shedule_table',15,'view_shedule_table'),
(61,'Can add request_table',16,'add_request_table'),
(62,'Can change request_table',16,'change_request_table'),
(63,'Can delete request_table',16,'delete_request_table'),
(64,'Can view request_table',16,'view_request_table'),
(65,'Can add medicine_table',17,'add_medicine_table'),
(66,'Can change medicine_table',17,'change_medicine_table'),
(67,'Can delete medicine_table',17,'delete_medicine_table'),
(68,'Can view medicine_table',17,'view_medicine_table'),
(69,'Can add feedback_table',18,'add_feedback_table'),
(70,'Can change feedback_table',18,'change_feedback_table'),
(71,'Can delete feedback_table',18,'delete_feedback_table'),
(72,'Can view feedback_table',18,'view_feedback_table'),
(73,'Can add complaint_table',19,'add_complaint_table'),
(74,'Can change complaint_table',19,'change_complaint_table'),
(75,'Can delete complaint_table',19,'delete_complaint_table'),
(76,'Can view complaint_table',19,'view_complaint_table'),
(77,'Can add bill_table',20,'add_bill_table'),
(78,'Can change bill_table',20,'change_bill_table'),
(79,'Can delete bill_table',20,'delete_bill_table'),
(80,'Can view bill_table',20,'view_bill_table'),
(81,'Can add bill_items_table',21,'add_bill_items_table'),
(82,'Can change bill_items_table',21,'change_bill_items_table'),
(83,'Can delete bill_items_table',21,'delete_bill_items_table'),
(84,'Can view bill_items_table',21,'view_bill_items_table');

/*Table structure for table `auth_user` */

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user` */

insert  into `auth_user`(`id`,`password`,`last_login`,`is_superuser`,`username`,`first_name`,`last_name`,`email`,`is_staff`,`is_active`,`date_joined`) values 
(1,'pbkdf2_sha256$260000$ANkc7HseypIsqcx928yeAe$+uOpOfM4AuS7zKMZ/TblaS7G1KFddXmPukcoLMZm7ys=','2024-03-21 08:35:11.338082',1,'admin','','','admin@gmail.com',1,1,'2023-12-19 00:09:47.041315');

/*Table structure for table `auth_user_groups` */

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user_groups` */

/*Table structure for table `auth_user_user_permissions` */

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user_user_permissions` */

/*Table structure for table `clinic_managementapp_bill_items_table` */

DROP TABLE IF EXISTS `clinic_managementapp_bill_items_table`;

CREATE TABLE `clinic_managementapp_bill_items_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` varchar(600) NOT NULL,
  `MEDICINE_id` bigint NOT NULL,
  `bill_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `clinic_managementapp_MEDICINE_id_b097073b_fk_clinic_ma` (`MEDICINE_id`),
  KEY `clinic_managementapp_bill_id_6536e486_fk_clinic_ma` (`bill_id`),
  CONSTRAINT `clinic_managementapp_bill_id_6536e486_fk_clinic_ma` FOREIGN KEY (`bill_id`) REFERENCES `clinic_managementapp_bill_table` (`id`),
  CONSTRAINT `clinic_managementapp_MEDICINE_id_b097073b_fk_clinic_ma` FOREIGN KEY (`MEDICINE_id`) REFERENCES `clinic_managementapp_medicine_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `clinic_managementapp_bill_items_table` */

/*Table structure for table `clinic_managementapp_bill_table` */

DROP TABLE IF EXISTS `clinic_managementapp_bill_table`;

CREATE TABLE `clinic_managementapp_bill_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `PHARMACY_id` bigint NOT NULL,
  `Status` varchar(600) NOT NULL,
  `Total` varchar(600) NOT NULL,
  `prescription_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `clinic_managementapp_PHARMACY_id_5e8461f3_fk_clinic_ma` (`PHARMACY_id`),
  KEY `clinic_managementapp_prescription_id_6f09fff5_fk_clinic_ma` (`prescription_id`),
  CONSTRAINT `clinic_managementapp_PHARMACY_id_5e8461f3_fk_clinic_ma` FOREIGN KEY (`PHARMACY_id`) REFERENCES `clinic_managementapp_pharmacy_table` (`id`),
  CONSTRAINT `clinic_managementapp_prescription_id_6f09fff5_fk_clinic_ma` FOREIGN KEY (`prescription_id`) REFERENCES `clinic_managementapp_prescription_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `clinic_managementapp_bill_table` */

/*Table structure for table `clinic_managementapp_booking_table` */

DROP TABLE IF EXISTS `clinic_managementapp_booking_table`;

CREATE TABLE `clinic_managementapp_booking_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `status` varchar(100) NOT NULL,
  `SHEDULE_id` bigint NOT NULL,
  `USER_id` bigint NOT NULL,
  `bstatus` varchar(100) NOT NULL,
  `sloat` varchar(50) NOT NULL,
  `token` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `clinic_managementapp_SHEDULE_id_b9fdac10_fk_clinic_ma` (`SHEDULE_id`),
  KEY `clinic_managementapp_USER_id_d74b7442_fk_clinic_ma` (`USER_id`),
  CONSTRAINT `clinic_managementapp_SHEDULE_id_b9fdac10_fk_clinic_ma` FOREIGN KEY (`SHEDULE_id`) REFERENCES `clinic_managementapp_shedule_table` (`id`),
  CONSTRAINT `clinic_managementapp_USER_id_d74b7442_fk_clinic_ma` FOREIGN KEY (`USER_id`) REFERENCES `clinic_managementapp_user_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `clinic_managementapp_booking_table` */

insert  into `clinic_managementapp_booking_table`(`id`,`date`,`status`,`SHEDULE_id`,`USER_id`,`bstatus`,`sloat`,`token`) values 
(1,'2024-02-01','Available',1,1,'not completed','5',2),
(2,'2024-04-12','Available',2,2,'completed','2',33),
(3,'2024-02-01','Available',3,2,'not completed','8',9),
(4,'2024-04-12','Available',4,3,'completed','5',10),
(5,'2024-03-12','Available',5,2,'not completed','8',11);

/*Table structure for table `clinic_managementapp_complaint_table` */

DROP TABLE IF EXISTS `clinic_managementapp_complaint_table`;

CREATE TABLE `clinic_managementapp_complaint_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `complaint` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `reply` varchar(100) NOT NULL,
  `USER_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `clinic_managementapp_USER_id_1ddcdd04_fk_clinic_ma` (`USER_id`),
  CONSTRAINT `clinic_managementapp_USER_id_1ddcdd04_fk_clinic_ma` FOREIGN KEY (`USER_id`) REFERENCES `clinic_managementapp_user_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `clinic_managementapp_complaint_table` */

insert  into `clinic_managementapp_complaint_table`(`id`,`complaint`,`date`,`reply`,`USER_id`) values 
(1,'not good','2023-12-10','ghcgmvb',1),
(3,'bad','2023-12-11','SORRY FOR THE INCONVIENIENCE',1),
(4,'not clean','2023-12-21','sorry',2),
(5,'no parking','2023-12-21','pending',2),
(6,'not good','2023-12-21','pending',2);

/*Table structure for table `clinic_managementapp_disease_table` */

DROP TABLE IF EXISTS `clinic_managementapp_disease_table`;

CREATE TABLE `clinic_managementapp_disease_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `disease` varchar(100) NOT NULL,
  `remedy` varchar(1000) NOT NULL,
  `department` varchar(100) NOT NULL,
  `preventive_measure` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `clinic_managementapp_disease_table` */

insert  into `clinic_managementapp_disease_table`(`id`,`disease`,`remedy`,`department`,`preventive_measure`) values 
(1,'Fungal infection','bath twice, use detol or neem in bathing water, keep infected area dry, use clean cloths','dermatologist','In humans, fungal infections occur when an invading fungus takes over an area of the body and is too much for the immune system to handle. Fungi can live in the air, soil, water, and plants. There are also some fungi that live naturally in the human body. Like many microbes, there are helpful fungi and harmful fungi.'),
(2,'Allergy','apply calamine, cover area with bandage, use ice to compress itching','Allergist','An allergy is an immune system response to a foreign substance that\'s not typically harmful to your body.They can include certain foods, pollen, or pet dander. Your immune system\'s job is to keep you healthy by fighting harmful pathogens.'),
(3,'GERD','avoid fatty spicy food, avoid lying down after eating, maintain healthy weight, exercise','Gastroenterologist','Gastroesophageal reflux disease, or GERD, is a digestive disorder that affects the lower esophageal sphincter (LES), the ring of muscle between the esophagus and stomach. Many people, including pregnant women, suffer from heartburn or acid indigestion caused by GERD.'),
(4,'Chronic cholestasis','cold baths, anti itch medicine, consult doctor, eat healthy','Gastroenterologist','Chronic cholestatic diseases, whether occurring in infancy, childhood or adulthood, are characterized by defective bile acid transport from the liver to the intestine, which is caused by primary damage to the biliary epithelium in most cases'),
(5,'Drug Reaction','Stop irritation, consult nearest hospital, stop taking drug','Allergist','An adverse drug reaction (ADR) is an injury caused by taking medication. ADRs may occur following a single dose or prolonged administration of a drug or result from the combination of two or more drugs.'),
(6,'Peptic ulcer diseae','avoid fatty spicy food, consume probiotic food, eliminate milk, limit alcohol','Gastroenterologist','Peptic ulcer disease (PUD) is a break in the inner lining of the stomach, the first part of the small intestine, or sometimes the lower esophagus. An ulcer in the stomach is called a gastric ulcer, while one in the first part of the intestines is a duodenal ulcer.'),
(7,'AIDS','avoid open cuts, wear ppe if possible, consult doctor, follow up','Infectious Diseases','Acquired immunodeficiency syndrome (AIDS) is a chronic, potentially life-threatening condition caused by the human immunodeficiency virus (HIV). By damaging your immune system, HIV interferes with your body\'s ability to fight infection and disease.'),
(8,'Diabetes ','have balanced diet, exercise, consult doctor, follow up','General Medicine','Diabetes is a disease that occurs when your blood glucose, also called blood sugar, is too high. Blood glucose is your main source of energy and comes from the food you eat. Insulin, a hormone made by the pancreas, helps glucose from food get into your cells to be used for energy.'),
(9,'Gastroenteritis','stop eating solid food for while, try taking small sips of water, rest, ease back into eating','Gastroenterologist','Gastroenteritis is an inflammation of the digestive tract, particularly the stomach, and large and small intestines. Viral and bacterial gastroenteritis are intestinal infections associated with symptoms of diarrhea , abdominal cramps, nausea , and vomiting .'),
(10,'Bronchial Asthma','switch to loose cloothing, take deep breaths, get away from trigger, seek help','Allergist','Bronchial asthma is a medical condition which causes the airway path of the lungs to swell and narrow. Due to this swelling, the air path produces excess mucus making it hard to breathe, which results in coughing, short breath, and wheezing. The disease is chronic and interferes with daily working.'),
(11,'Hypertension ','meditation, salt baths, reduce stress, get proper sleep','General Medicine','Hypertension (HTN or HT), also known as high blood pressure (HBP), is a long-term medical condition in which the blood pressure in the arteries is persistently elevated. High blood pressure typically does not cause symptoms.'),
(12,'Migraine','meditation, reduce stress, use poloroid glasses in sun, consult doctor','Ophthalmologists','A migraine can cause severe throbbing pain or a pulsing sensation, usually on one side of the head. It\'s often accompanied by nausea, vomiting, and extreme sensitivity to light and sound. Migraine attacks can last for hours to days, and the pain can be so severe that it interferes with your daily activities.'),
(13,'Jaundice','drink plenty of water, consume milk thistle, eat fruits and high fiberous food, medication','Gastroenterologist','Yellow staining of the skin and sclerae (the whites of the eyes) by abnormally high blood levels of the bile pigment bilirubin. The yellowing extends to other tissues and body fluids. Jaundice was once called the \"morbus regius\" (the regal disease) in the belief that only the touch of a king could cure it'),
(14,'Malaria','Consult nearest hospital, avoid oily food, avoid non veg food, keep mosquitos out','Internal Medicine','An infectious disease caused by protozoan parasites from the Plasmodium family that can be transmitted by the bite of the Anopheles mosquito or by a contaminated needle or transfusion. Falciparum malaria is the most deadly type.'),
(15,'Chicken pox','use neem in bathing, consume neem leaves, take vaccine, avoid public places','General Medicine','Chickenpox is a highly contagious disease caused by the varicella-zoster virus (VZV). It can cause an itchy, blister-like rash. The rash first appears on the chest, back, and face, and then spreads over the entire body, causing between 250 and 500 itchy blisters.'),
(16,'Dengue','drink papaya leaf juice, avoid fatty spicy food, keep mosquitos away, keep hydrated','Infectious Diseases','an acute infectious disease caused by a flavivirus (species Dengue virus of the genus Flavivirus), transmitted by aedes mosquitoes, and characterized by headache, severe joint pain, and a rash. â€” called also breakbone fever, dengue fever.'),
(17,'Typhoid','eat high calorie vegitables, antiboitic therapy, consult doctor, medication','General Medicine','A vein that has enlarged and twisted, often appearing as a bulging, blue blood vessel that is clearly visible through the skin. Varicose veins are most common in older adults, particularly women, and occur especially on the legs.'),
(18,'hepatitis A','Consult nearest hospital, wash hands through, avoid fatty spicy food, medication','Hepatologist','Hepatitis A is a highly contagious liver infection caused by the hepatitis A virus. The virus is one of several types of hepatitis viruses that cause inflammation and affect your liver\'s ability to function.'),
(19,'Hepatitis B','consult nearest hospital, vaccination, eat healthy, medication','Hepatologist','Hepatitis B is an infection of your liver. It can cause scarring of the organ, liver failure, and cancer. It can be fatal if it isn\'t treated. It\'s spread when people come in contact with the blood, open sores, or body fluids of someone who has the hepatitis B virus.'),
(20,'Hepatitis C','Consult nearest hospital, vaccination, eat healthy, medication','Hepatologist','Inflammation of the liver due to the hepatitis C virus (HCV), which is usually spread via blood transfusion (rare), hemodialysis, and needle sticks. The damage hepatitis C does to the liver can lead to cirrhosis and its complications as well as cancer.'),
(21,'Hepatitis D','consult doctor, medication., eat healthy, follow up','Hepatologist','Hepatitis D, also known as the hepatitis delta virus, is an infection that causes the liver to become inflamed. This swelling can impair liver function and cause long-term liver problems, including liver scarring and cancer. The condition is caused by the hepatitis D virus (HDV).'),
(22,'Hepatitis E','stop alcohol consumption, take rest, consult doctor, medication','Hepatologist','A rare form of liver inflammation caused by infection with the hepatitis E virus (HEV). It is transmitted via food or drink handled by an infected person or through infected water supplies in areas where fecal matter may get into the water. Hepatitis E does not cause chronic liver disease.'),
(23,'Alcoholic hepatitis','stop alcohol consumption, onsult doctor, medication 	follow up','Hepatologist','Bronchial asthma is a medical condition which causes the airway path of the lungs to swell and narrow. Due to this swelling, the air path produces excess mucus making it hard to breathe, which results in coughing, short breath, and wheezing. The disease is chronic and interferes with daily working.'),
(24,'Tuberculosis','cover mouth, consult doctor, medication, rest','Infectious Diseases','Tuberculosis (TB) is an infectious disease usually caused by Mycobacterium tuberculosis (MTB) bacteria. Tuberculosis generally affects the lungs, but can also affect other parts of the body. Most infections show no symptoms, in which case it is known as latent tuberculosis.'),
(25,'Common Cold','drink vitamin c rich drinks, take vapour, avoid cold food, keep fever in check','General Medicine','The common cold is a viral infection of your nose and throat (upper respiratory tract). It\'s usually harmless, although it might not feel that way. Many types of viruses can cause a common cold.'),
(26,'Pneumonia','consult doctor, medication, rest, follow up','Infectious Diseases','Pneumonia is an infection in one or both lungs. Bacteria, viruses, and fungi cause it. The infection causes inflammation in the air sacs in your lungs, which are called alveoli. The alveoli fill with fluid or pus, making it difficult to breathe.'),
(27,'Dimorphic hemmorhoids(piles)','avoid fatty spicy food, consume witch hazel, warm bath with epsom salt, consume alovera juice','Proctologist','Hemorrhoids, also spelled haemorrhoids, are vascular structures in the anal canal. Other names, Haemorrhoids, piles, hemorrhoidal disease.'),
(28,'Heart attack','call ambulance, chew or swallow asprin, keep calm','cardio','The death of heart muscle due to the loss of blood supply. The loss of blood supply is usually caused by a complete blockage of a coronary artery, one of the arteries that supplies blood to the heart muscle.'),
(29,'Hypothyroidism','reduce stress, do exercise, eat healthy, get proper sleep, use lemon balm, take radioactive iodine treatment','Endocrinologist','Hypothyroidism, also called underactive thyroid or low thyroid, is a disorder of the endocrine system in which the thyroid gland does not produce enough thyroid hormone.'),
(30,'Hypoglycemia','lie down on side, check in pulse, drink sugary drinks, consult doctor','Endocrinologist','Hypoglycemia is a condition in which your blood sugar (glucose) level is lower than normal. Glucose is your body\'s main energy source. Hypoglycemia is often related to diabetes treatment. But other drugs and a variety of conditions many rare can cause low blood sugar in people who don\'t have diabetes.'),
(31,'Arthritis','exercise, use hot and cold therapy, try acupuncture, massage','Rheumatologists','Arthritis is the swelling and tenderness of one or more of your joints. The main symptoms of arthritis are joint pain and stiffness, which typically worsen with age. The most common types of arthritis are osteoarthritis and rheumatoid arthritis.'),
(32,'Urinary tract infection','drink plenty of water, increase vitamin c intake, drink cranberry juice, take probiotics','Urologist','Urinary tract infection: An infection of the kidney, ureter, bladder, or urethra. Abbreviated UTI. Not everyone with a UTI has symptoms, but common symptoms include a frequent urge to urinate and pain or burning when urinating.'),
(33,'Paralysis (brain hemorrhage)','massage, eat healthy, exercise, consult doctor','Internal Medicine','Intracerebral hemorrhage (ICH) is when blood suddenly bursts into brain tissue, causing damage to your brain. Symptoms usually appear suddenly during ICH. They include headache, weakness, confusion, and paralysis, particularly on one side of your body.'),
(34,'Varicose veins','lie down flat and raise the leg high, use oinments, use vein compression, dont stand still for long','Vascular Surgeons','A vein that has enlarged and twisted, often appearing as a bulging, blue blood vessel that is clearly visible through the skin. Varicose veins are most common in older adults, particularly women, and occur especially on the legs.'),
(35,'Osteoarthristis','acetaminophen, consult nearest hospital, follow up, salt baths','Rheumatologists','Osteoarthritis is the most common form of arthritis, affecting millions of people worldwide. It occurs when the protective cartilage that cushions the ends of your bones wears down over time.'),
(36,'Acne','bath twice, avoid fatty spicy food, drink plenty of water, avoid too many products','9','Acne vulgaris is the formation of comedones, papules, pustules, nodules, and/or cysts as a result of obstruction and inflammation of pilosebaceous units (hair follicles and their accompanying sebaceous gland). Acne develops on the face and upper trunk. It most often affects adolescents.'),
(37,'Psoriasis','wash hands with warm soapy water, stop bleeding using pressure, consult doctor, salt baths','9','Psoriasis is a common skin disorder that forms thick, red, bumpy patches covered with silvery scales. They can pop up anywhere, but most appear on the scalp, elbows, knees, and lower back. Psoriasis can\'t be passed from person to person. It does sometimes happen in members of the same family.'),
(38,'Impetigo','soak affected area in warm water, use antibiotics, remove scabs with wet compressed cloth, consult doctor','9','Impetigo is a common and highly contagious skin infection that mainly affects infants and children. Impetigo usually appears as red sores on the face, especially around a child\'s nose and mouth, and on hands and feet. The sores burst and develop honey-colored crusts.'),
(39,'Cervical spondylosis','use heating pad or cold pack, exercise, take otc pain reliver, consult doctor','Orthopedic','Cervical spondylosis is a general term for age-related wear and tear affecting the spinal disks in your neck. As the disks dehydrate and shrink, signs of osteoarthritis develop, including bony projections along the edges of bones (bone spurs).'),
(40,'Hyperthyroidism','eat healthy, massage, use lemon balm, take radioactive iodine treatment','Endocrinologist','Hyperthyroidism (overactive thyroid) occurs when your thyroid gland produces too much of the hormone thyroxine. Hyperthyroidism can accelerate your body\'s metabolism, causing unintentional weight loss and a rapid or irregular heartbeat.'),
(41,'(vertigo) Paroymsal  Positional Vertigo','lie down, avoid sudden change in body, avoid abrupt head movment, relax','General Medicine','Benign paroxysmal positional vertigo (BPPV) is one of the most common causes of vertigo â€” the sudden sensation that you\'re spinning or that the inside of your head is spinning. Benign paroxysmal positional vertigo causes brief episodes of mild to intense dizziness.');

/*Table structure for table `clinic_managementapp_doctor_table` */

DROP TABLE IF EXISTS `clinic_managementapp_doctor_table`;

CREATE TABLE `clinic_managementapp_doctor_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `dob` date NOT NULL,
  `gender` varchar(100) NOT NULL,
  `specilization` longtext NOT NULL,
  `qualification` longtext NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `LOGIN_id` bigint NOT NULL,
  `photo` varchar(100) NOT NULL,
  `pin` varchar(100) NOT NULL,
  `place` varchar(100) NOT NULL,
  `post` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `clinic_managementapp_LOGIN_id_9cba94da_fk_clinic_ma` (`LOGIN_id`),
  CONSTRAINT `clinic_managementapp_LOGIN_id_9cba94da_fk_clinic_ma` FOREIGN KEY (`LOGIN_id`) REFERENCES `clinic_managementapp_login_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `clinic_managementapp_doctor_table` */

insert  into `clinic_managementapp_doctor_table`(`id`,`firstname`,`lastname`,`dob`,`gender`,`specilization`,`qualification`,`email`,`phone`,`LOGIN_id`,`photo`,`pin`,`place`,`post`) values 
(10,'Dr. Ahmed','KC','1994-05-09','Male','Consultant Ophthalmologist','MBBS','Ahmed123@gmail.com','8765980765',25,'doctor-2748707_1280.png','673001','Calicut','Calicut'),
(12,'Dr. Maya','Natraj','1998-12-20','Female','Cornea | Lasik','MBBS,DO,DNB(Ophthal)','maya123@gmail.com','7689556070',27,'female doc.jpg','680312','Thrissur','Chengallur'),
(13,'Dr. Meena','Kurup','1992-08-23','Female','Consultant Ophthalmologist','DO','meena123@gmail.com','7866098564',28,'female doc_b5ztzCx.jpg','670301','Kannur','kannur'),
(15,'Dr.Abhinand','pradeep','1999-02-28','Male','Consultant Ophthalmologist,Pediatric Opthalmologist','DO, MS(Ophthal)','abhinandad10@gmail.com','9991247789',32,'PHOTO.jpg','673310','mahe','palloor'),
(17,'Dr.Athul ','Sebastian','1995-05-30','Male','Pediatric Opthalmologist,Squint,Retina Surgeon,CMO Surgeon,Cornea Surgeon,Consultant Retina,Cornea & Lasic','MBBS, DO','athulsebastin@gmail.com','9074513202',34,'WhatsApp Image 2024-03-21 at 12.15.38_f6260702.jpg','670571','Kannur','Karthikapuram p.o'),
(21,'Dr. Shobana','kumari','2000-12-04','Male','Consultant Ophthalmologist','MBBS, DO','afff@gmail.com','7902757835',38,'female doc_k5SbtWu.jpg','675521','trivandrum','trivandram'),
(22,'Dr.Jafar','K C','1997-05-04','Male','Consultant Ophthalmologist,Pediatric Opthalmologist','MBBS, DO','jaferjafy@gmail.com','9855647852',39,'doc_1gX9Tl9.webp','670301','calicut','koilandy'),
(24,'Dr.hhbh','hkbk','2019-12-30','Male','Pediatric Opthalmologist','MNAMS','hvjhj@ghvhvhj.com','5555555555',42,'female doc_JFSVM4u.jpg','673001','mahe','kannur'),
(25,'Dr.Ayyappan','Avarkkal','1994-10-18','Male','Consultant Retina,Cornea & Lasic','','ayyapps@gmail.com','9002365412',43,'doc_h4LTyNy.webp','678852','thrissur','thrissur'),
(26,'Dr.Fredy','George','1992-03-04','Male','Squint','DO','fredyfredy@gmail.com','9965420010',44,'doc_GgqXPFO.webp','679521','kollam','kollam'),
(30,'Dr.Punnya','Pradeep','2000-03-13','Female','Retina Surgeon,Cornea Surgeon,Consultant Retina','MBBS, DO, FMRF, DNB','punnyapp@gmail.com','8086658470',51,'WhatsApp Image 2024-03-21 at 12.29.16_709e223a.jpg','670671','thalassery','pannyannur'),
(31,'Dr.Gopika','Nair','1996-03-13','Female','Consultant Ophthalmologist,Retina Surgeon','','gopikannair@gmail.com','9188701611',52,'WhatsApp Image 2024-03-21 at 12.35.01_f4defb17.jpg','670006','Kannur','kappad'),
(32,'Dr.Sourav','sreeju','1998-01-08','Male','Consultant Ophthalmologist,Pediatric Opthalmologist,Retina Surgeon','MBBS, DO, FMRF','sourav2003cs@gmail.com','9744744278',53,'WhatsApp Image 2024-03-21 at 11.57.33_21769118.jpg','670613','kannur','Chakkarakkal'),
(33,'Dr.Pranav','Madhu','1998-01-19','Male','Consultant Ophthalmologist,Pediatric Opthalmologist,Squint','MBBS, DO, MS(Ophthal)','pranavmadhu2003@gmail.com','7025836625',54,'WhatsApp Image 2024-03-21 at 12.41.29_f1b40340_JBFY8KD.jpg','670301','kannur','cherkunnu');

/*Table structure for table `clinic_managementapp_feedback_table` */

DROP TABLE IF EXISTS `clinic_managementapp_feedback_table`;

CREATE TABLE `clinic_managementapp_feedback_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `feedback` varchar(100) NOT NULL,
  `rating` double NOT NULL,
  `date` date NOT NULL,
  `DOCTOR_id` bigint NOT NULL,
  `USER_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `clinic_managementapp_DOCTOR_id_3f511d65_fk_clinic_ma` (`DOCTOR_id`),
  KEY `clinic_managementapp_USER_id_350b98e3_fk_clinic_ma` (`USER_id`),
  CONSTRAINT `clinic_managementapp_DOCTOR_id_3f511d65_fk_clinic_ma` FOREIGN KEY (`DOCTOR_id`) REFERENCES `clinic_managementapp_doctor_table` (`id`),
  CONSTRAINT `clinic_managementapp_USER_id_350b98e3_fk_clinic_ma` FOREIGN KEY (`USER_id`) REFERENCES `clinic_managementapp_user_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `clinic_managementapp_feedback_table` */

insert  into `clinic_managementapp_feedback_table`(`id`,`feedback`,`rating`,`date`,`DOCTOR_id`,`USER_id`) values 
(2,'need to improve',5,'2024-02-26',13,5),
(3,'not bad',7,'2024-02-05',10,2),
(4,'thankyou doc',10,'2024-02-28',12,5),
(5,'very good',9,'2024-02-28',12,4);

/*Table structure for table `clinic_managementapp_login_table` */

DROP TABLE IF EXISTS `clinic_managementapp_login_table`;

CREATE TABLE `clinic_managementapp_login_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `clinic_managementapp_login_table` */

insert  into `clinic_managementapp_login_table`(`id`,`username`,`password`,`type`) values 
(1,'admin','admin','admin'),
(4,'ph','ph','pharmacy'),
(5,'sh','sh','doctor'),
(6,'doctor','doctor','doctor'),
(7,'user','123','user'),
(8,'doctor','doc','doctotr'),
(9,'nkjkjkj','Aswin1234','doctor'),
(10,'','','pharmacy'),
(11,'lolan','123456789','user'),
(12,'lolan','123456789','user'),
(13,'lolan','123456789','user'),
(14,'lolan','123456789','user'),
(15,'lolan','123456789','user'),
(16,'lolan','123456789','user'),
(17,'low','12345','user'),
(18,'eee','12345','user'),
(19,'eee','123456','user'),
(20,'super renjith','B4abu1234','doctor'),
(21,'babu','Babu1234','doctor'),
(22,'babu','Babu1234','doctor'),
(23,'renjith','Renjith123','doctor'),
(24,'shobana','Shobana123','doctor'),
(25,'ahmed','Ahmed123','doctor'),
(26,'renjith','Renjith123','doctor'),
(27,'maya','Maya1234','doctor'),
(28,'meena','Meena123','doctor'),
(29,'11','11111111@aA','doctor'),
(30,'visruth','Visruth1234','user'),
(31,'abhinanda','Abhi1234','user'),
(32,'abhinand','Abhinand123','doctor'),
(33,'ahmed','Kytgv12343','doctor'),
(34,'athul','Athul123','doctor'),
(35,'babbs','Babu1234','doctor'),
(36,'anu22','Anu123%$#','doctor'),
(37,'abhinand','Abhinand123','doctor'),
(38,'jkghk','kghkhaA46@','doctor'),
(39,'ytgyhkjlk','Setrt2@FGH','doctor'),
(40,'4562','5AsJKJJLKJJNJBJHJ','doctor'),
(41,'gvgvhhjhbhj','Dw@jjknjknlkklkmk0','doctor'),
(42,'gvgvhhjhbhj','Dw@jjknjknlkklkmk0','doctor'),
(43,'rgvhbj','4W@kujnklmkmkm','doctor'),
(44,'dfGDGDG','eW#zgsrgzsgsggge1','doctor'),
(45,'ammjm','Abhi@123','doctor'),
(46,'IZFJGKZSGK','aJHBK1@kjk','doctor'),
(47,'IZFJGKZSGK','aJHBK1@kjk','doctor'),
(48,'pranav','Pranav@123','doctor'),
(49,'abhinand','Dw@jjknjknlkklkmk0','doctor'),
(50,'abhinand','Dw@jjknjknlkklkmk0','doctor'),
(51,'punnya','Punnya@123','doctor'),
(52,'gopika','Gopika@123','doctor'),
(53,'souru','Souru@123','doctor'),
(54,'pranav','Pranav@123','doctor');

/*Table structure for table `clinic_managementapp_medicine_table` */

DROP TABLE IF EXISTS `clinic_managementapp_medicine_table`;

CREATE TABLE `clinic_managementapp_medicine_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `medicinename` varchar(100) NOT NULL,
  `description` varchar(100) NOT NULL,
  `rate` varchar(100) NOT NULL,
  `stock` varchar(100) NOT NULL,
  `PHARMACY_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `clinic_managementapp_PHARMACY_id_009fe8d6_fk_clinic_ma` (`PHARMACY_id`),
  CONSTRAINT `clinic_managementapp_PHARMACY_id_009fe8d6_fk_clinic_ma` FOREIGN KEY (`PHARMACY_id`) REFERENCES `clinic_managementapp_pharmacy_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `clinic_managementapp_medicine_table` */

insert  into `clinic_managementapp_medicine_table`(`id`,`medicinename`,`description`,`rate`,`stock`,`PHARMACY_id`) values 
(2,'paracetamol','Fever','14','485',1),
(3,'Dolo','cold','15','280',1),
(4,'avil','cold','12','715',1);

/*Table structure for table `clinic_managementapp_pharmacy_table` */

DROP TABLE IF EXISTS `clinic_managementapp_pharmacy_table`;

CREATE TABLE `clinic_managementapp_pharmacy_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `place` varchar(100) NOT NULL,
  `post` varchar(100) NOT NULL,
  `pin` varchar(100) NOT NULL,
  `latitude` varchar(100) NOT NULL,
  `longitude` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `LOGIN_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `clinic_managementapp_LOGIN_id_605c0a10_fk_clinic_ma` (`LOGIN_id`),
  CONSTRAINT `clinic_managementapp_LOGIN_id_605c0a10_fk_clinic_ma` FOREIGN KEY (`LOGIN_id`) REFERENCES `clinic_managementapp_login_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `clinic_managementapp_pharmacy_table` */

insert  into `clinic_managementapp_pharmacy_table`(`id`,`name`,`place`,`post`,`pin`,`latitude`,`longitude`,`email`,`phone`,`LOGIN_id`) values 
(1,'Wayanad medicals','uhguy','guguyg','65','4','4','gc','564',4),
(2,'','','','','','','','',10);

/*Table structure for table `clinic_managementapp_prescription_table` */

DROP TABLE IF EXISTS `clinic_managementapp_prescription_table`;

CREATE TABLE `clinic_managementapp_prescription_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `prescription` varchar(5000) NOT NULL,
  `date` date NOT NULL,
  `BOOKING_id` bigint NOT NULL,
  `type` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `clinic_managementapp_BOOKING_id_17622ed7_fk_clinic_ma` (`BOOKING_id`),
  CONSTRAINT `clinic_managementapp_BOOKING_id_17622ed7_fk_clinic_ma` FOREIGN KEY (`BOOKING_id`) REFERENCES `clinic_managementapp_booking_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `clinic_managementapp_prescription_table` */

insert  into `clinic_managementapp_prescription_table`(`id`,`prescription`,`date`,`BOOKING_id`,`type`) values 
(21,'WhatsApp Image 2024-02-28 at 11.37.35 AM (1).jpeg','2024-02-28',2,'f'),
(22,'nptel.pdf','2024-03-21',4,'f'),
(23,'nptel_aFdTQFb.pdf','2024-03-21',4,'f');

/*Table structure for table `clinic_managementapp_request_table` */

DROP TABLE IF EXISTS `clinic_managementapp_request_table`;

CREATE TABLE `clinic_managementapp_request_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `status` varchar(100) NOT NULL,
  `PHARMACY_id` bigint NOT NULL,
  `PRESCRIPTION_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `clinic_managementapp_PHARMACY_id_d89c17f1_fk_clinic_ma` (`PHARMACY_id`),
  KEY `clinic_managementapp_PRESCRIPTION_id_8590603d_fk_clinic_ma` (`PRESCRIPTION_id`),
  CONSTRAINT `clinic_managementapp_PHARMACY_id_d89c17f1_fk_clinic_ma` FOREIGN KEY (`PHARMACY_id`) REFERENCES `clinic_managementapp_pharmacy_table` (`id`),
  CONSTRAINT `clinic_managementapp_PRESCRIPTION_id_8590603d_fk_clinic_ma` FOREIGN KEY (`PRESCRIPTION_id`) REFERENCES `clinic_managementapp_prescription_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `clinic_managementapp_request_table` */

/*Table structure for table `clinic_managementapp_shedule_table` */

DROP TABLE IF EXISTS `clinic_managementapp_shedule_table`;

CREATE TABLE `clinic_managementapp_shedule_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `fromtime` time(6) NOT NULL,
  `totime` time(6) NOT NULL,
  `DOCTOR_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `clinic_managementapp_DOCTOR_id_dc269a17_fk_clinic_ma` (`DOCTOR_id`),
  CONSTRAINT `clinic_managementapp_DOCTOR_id_dc269a17_fk_clinic_ma` FOREIGN KEY (`DOCTOR_id`) REFERENCES `clinic_managementapp_doctor_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `clinic_managementapp_shedule_table` */

insert  into `clinic_managementapp_shedule_table`(`id`,`date`,`fromtime`,`totime`,`DOCTOR_id`) values 
(1,'2024-02-28','09:00:00.000000','14:30:00.000000',10),
(2,'2024-02-28','14:17:00.000000','17:00:00.000000',12),
(3,'2024-02-17','10:00:00.000000','12:00:00.000000',13),
(4,'2024-04-12','09:00:00.000000','11:00:00.000000',12),
(5,'2024-04-12','09:00:00.000000','11:00:00.000000',12),
(8,'2024-03-30','08:50:00.000000','15:30:00.000000',10),
(11,'2024-03-17','12:30:00.000000','07:45:00.000000',10),
(13,'2010-09-19','18:21:00.000000','17:20:00.000000',10),
(14,'2024-03-18','08:20:00.000000','10:20:00.000000',12),
(15,'2024-03-22','10:20:00.000000','12:30:00.000000',12),
(17,'2024-03-13','04:08:00.000000','08:09:00.000000',10),
(18,'2024-03-19','16:09:00.000000','20:09:00.000000',10);

/*Table structure for table `clinic_managementapp_symptom_table` */

DROP TABLE IF EXISTS `clinic_managementapp_symptom_table`;

CREATE TABLE `clinic_managementapp_symptom_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `symptom` varchar(100) NOT NULL,
  `disease_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `clinic_managementapp_disease_id_1a1f0e85_fk_clinic_ma` (`disease_id`),
  CONSTRAINT `clinic_managementapp_disease_id_1a1f0e85_fk_clinic_ma` FOREIGN KEY (`disease_id`) REFERENCES `clinic_managementapp_disease_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=319 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `clinic_managementapp_symptom_table` */

insert  into `clinic_managementapp_symptom_table`(`id`,`symptom`,`disease_id`) values 
(1,'itching',1),
(2,'skin_rash',1),
(3,'nodal_skin_eruptions',1),
(4,'dischromic__patches',1),
(5,'continuous_sneezing',2),
(6,'shivering',2),
(7,'chills',2),
(8,'watering_from_eyes',2),
(9,'stomach_pain',3),
(10,'acidity',3),
(11,'ulcers_on_tongue',3),
(12,'vomiting',3),
(13,'cough',3),
(14,'itching',4),
(15,'vomiting',4),
(16,'yellowish_skin',4),
(17,'nausea',4),
(18,'loss_of_appetite',4),
(19,'itching',5),
(20,'skin_rash',5),
(21,'stomach_pain',5),
(22,'burning_micturition',5),
(23,'spotting_urination',5),
(24,'vomiting',6),
(25,'loss_of_appetite',6),
(26,'abdominal_pain',6),
(27,'passage_of_gases',6),
(28,'internal_itching',6),
(29,'indigestion',6),
(30,'muscle_wasting',7),
(31,'patches_in_throat',7),
(32,'high_fever',7),
(33,'extra_marital_contacts',7),
(34,'fatigue',8),
(35,'weight_loss',8),
(36,'restlessness',8),
(37,'lethargy',8),
(38,'irregular_sugar_level',8),
(39,'blurred_and_distorted_vision',8),
(40,'obesity',8),
(41,'increased_appetite',8),
(42,'polyuria',8),
(43,'excessive_hunger',8),
(44,'vomiting',9),
(45,'sunken_eyes',9),
(46,'dehydration',9),
(47,'diarrhoea',9),
(48,'fatigue',10),
(49,'cough',10),
(50,'high_fever',10),
(51,'breathlessness',10),
(52,'family_history',10),
(53,'mucoid_sputum',10),
(54,'headache',11),
(55,'chest_pain',11),
(56,'dizziness',11),
(57,'loss_of_balance',11),
(58,'lack_of_concentration',11),
(59,'acidity',12),
(60,'indigestion',12),
(61,'headache',12),
(62,'blurred_and_distorted_vision',12),
(63,'excessive_hunger',12),
(64,'stiff_neck',12),
(65,'depression',12),
(66,'irritability',12),
(67,'visual_disturbances',12),
(68,'back_pain',39),
(69,'weakness_in_limbs',39),
(70,'neck_pain',39),
(71,'dizziness',39),
(72,'loss_of_balance',39),
(73,'vomiting',33),
(74,'headache',33),
(75,'weakness_of_one_body_side',33),
(76,'altered_sensorium',33),
(77,'itching',13),
(78,'vomiting',13),
(79,'fatigue',13),
(80,'weight_loss',13),
(81,'high_fever',13),
(82,'yellowish_skin',13),
(83,'dark_urine',13),
(84,'abdominal_pain',13),
(85,'chills',14),
(86,'vomiting',14),
(87,'high_fever',14),
(88,'sweating',14),
(89,'headache',14),
(90,'nausea',14),
(91,'muscle_pain',14),
(92,'diarrhoea',14),
(93,'itching',15),
(94,'skin_rash',15),
(95,'fatigue',15),
(96,'lethargy',15),
(97,'high_fever',15),
(98,'headache',15),
(99,'loss_of_appetite',15),
(100,'mild_fever',15),
(101,'swelled_lymph_nodes',15),
(102,'malaise',15),
(103,'red_spots_over_body',15),
(104,'skin_rash',16),
(105,'chills',16),
(106,'joint_pain',16),
(107,'vomiting',16),
(108,'fatigue',16),
(109,'high_fever',16),
(110,'headache',16),
(111,'nausea',16),
(112,'loss_of_appetite',16),
(113,'pain_behind_the_eyes',16),
(114,'back_pain',16),
(115,'muscle_pain',16),
(116,'red_spots_over_body',16),
(117,'malaise',16),
(118,'chills',17),
(119,'vomiting',17),
(120,'fatigue',17),
(121,'high_fever',17),
(122,'nausea',17),
(123,'constipation',17),
(124,'abdominal_pain',17),
(125,'diarrhoea',17),
(126,'toxic_look_(typhos)',17),
(127,'belly_pain',17),
(128,'headache',17),
(129,'joint_pain',18),
(130,'vomiting',18),
(131,'yellowish_skin',18),
(132,'dark_urine',18),
(133,'nausea',18),
(134,'loss_of_appetite',18),
(135,'abdominal_pain',18),
(136,'diarrhoea',18),
(137,'mild_fever',18),
(138,'yellowing_of_eyes',18),
(139,'muscle_pain',18),
(140,'itching',19),
(141,'fatigue',19),
(142,'lethargy',19),
(143,'yellowish_skin',19),
(144,'dark_urine',19),
(145,'loss_of_appetite',19),
(146,'abdominal_pain',19),
(147,'yellow_urine',19),
(148,'yellowing_of_eyes',19),
(149,'malaise',19),
(150,'receiving_blood_transfusion',19),
(151,'receiving_unsterile_injections',19),
(152,'fatigue',20),
(153,'yellowish_skin',20),
(154,'nausea',20),
(155,'loss_of_appetite',20),
(156,'family_history',20),
(157,'yellowing_of_eyes',20),
(158,'joint_pain',21),
(159,'vomiting',21),
(160,'fatigue',21),
(161,'yellowish_skin',21),
(162,'dark_urine',21),
(163,'nausea',21),
(164,'loss_of_appetite',21),
(165,'abdominal_pain',21),
(166,'yellowing_of_eyes',21),
(167,'joint_pain',22),
(168,'vomiting',22),
(169,'fatigue',22),
(170,'high_fever',22),
(171,'yellowish_skin',22),
(172,'dark_urine',22),
(173,'nausea',22),
(174,'loss_of_appetite',22),
(175,'abdominal_pain',22),
(176,'yellowing_of_eyes',22),
(177,'coma',22),
(178,'stomach_bleeding',22),
(179,'acute_liver_failure',22),
(180,'vomiting',23),
(181,'yellowish_skin',23),
(182,'abdominal_pain',23),
(183,'swelling_of_stomach',23),
(184,'distention_of_abdomen',23),
(185,'history_of_alcohol_consumption',23),
(186,'fluid_overload',23),
(187,'chills',24),
(188,'vomiting',24),
(189,'fatigue',24),
(190,'weight_loss',24),
(191,'cough',24),
(192,'high_fever',24),
(193,'breathlessness',24),
(194,'sweating',24),
(195,'loss_of_appetite',24),
(196,'mild_fever',24),
(197,'yellowing_of_eyes',24),
(198,'swelled_lymph_nodes',24),
(199,'malaise',24),
(200,'phlegm',24),
(201,'chest_pain',24),
(202,'blood_in_sputum',24),
(203,'continuous_sneezing',25),
(204,'chills',25),
(205,'fatigue',25),
(206,'cough',25),
(207,'high_fever',25),
(208,'headache',25),
(209,'swelled_lymph_nodes',25),
(210,'malaise',25),
(211,'phlegm',25),
(212,'throat_irritation',25),
(213,'redness_of_eyes',25),
(214,'sinus_pressure',25),
(215,'runny_nose',25),
(216,'congestion',25),
(217,'chest_pain',25),
(218,'loss_of_smell',25),
(219,'muscle_pain',25),
(220,'chills',26),
(221,'fatigue',26),
(222,'cough',26),
(223,'high_fever',26),
(224,'breathlessness',26),
(225,'sweating',26),
(226,'malaise',26),
(227,'phlegm',26),
(228,'chest_pain',26),
(229,'fast_heart_rate',26),
(230,'rusty_sputum',26),
(231,'constipation',27),
(232,'pain_during_bowel_movements',27),
(233,'pain_in_anal_region',27),
(234,'bloody_stool',27),
(235,'irritation_in_anus',27),
(236,'vomiting',28),
(237,'breathlessness',28),
(238,'sweating',28),
(239,'chest_pain',28),
(240,'fatigue',34),
(241,'cramps',34),
(242,'bruising',34),
(243,'obesity',34),
(244,'swollen_legs',34),
(245,'swollen_blood_vessels',34),
(246,'prominent_veins_on_calf',34),
(247,'fatigue',29),
(248,'weight_gain',29),
(249,'cold_hands_and_feets',29),
(250,'mood_swings',29),
(251,'lethargy',29),
(252,'dizziness',29),
(253,'puffy_face_and_eyes',29),
(254,'enlarged_thyroid',29),
(255,'brittle_nails',29),
(256,'swollen_extremeties',29),
(257,'depression',29),
(258,'irritability',29),
(259,'abnormal_menstruation',29),
(260,'fatigue',40),
(261,'mood_swings',40),
(262,'weight_loss',40),
(263,'restlessness',40),
(264,'sweating',40),
(265,'diarrhoea',40),
(266,'fast_heart_rate',40),
(267,'excessive_hunger',40),
(268,'muscle_weakness',40),
(269,'irritability',40),
(270,'abnormal_menstruation',40),
(271,'vomiting',30),
(272,'fatigue',30),
(273,'anxiety',30),
(274,'sweating',30),
(275,'headache',30),
(276,'nausea',30),
(277,'blurred_and_distorted_vision',30),
(278,'excessive_hunger',30),
(279,'drying_and_tingling_lips',30),
(280,'slurred_speech',30),
(281,'irritability',30),
(282,'palpitations',30),
(283,'joint_pain',35),
(284,'neck_pain',35),
(285,'knee_pain',35),
(286,'hip_joint_pain',35),
(287,'swelling_joints',35),
(288,'painful_walking',35),
(289,'muscle_weakness',31),
(290,'stiff_neck',31),
(291,'swelling_joints',31),
(292,'movement_stiffness',31),
(293,'painful_walking',31),
(294,'skin_rash',36),
(295,'pus_filled_pimples',36),
(296,'blackheads',36),
(297,'scurring',36),
(298,'burning_micturition',32),
(299,'bladder_discomfort',32),
(300,'foul_smell_of_urine',32),
(301,'continuous_feel_of_urine',32),
(302,'skin_rash',37),
(303,'joint_pain',37),
(304,'skin_peeling',37),
(305,'silver_like_dusting',37),
(306,'small_dents_in_nails',37),
(307,'inflammatory_nails',37),
(308,'skin_rash',38),
(309,'high_fever',38),
(310,'blister',38),
(311,'red_sore_around_nose',38),
(312,'yellow_crust_ooze',38),
(313,'vomiting',41),
(314,'headache',41),
(315,'nausea',41),
(316,'spinning_movements',41),
(317,'loss_of_balance',41),
(318,'unsteadiness',41);

/*Table structure for table `clinic_managementapp_user_table` */

DROP TABLE IF EXISTS `clinic_managementapp_user_table`;

CREATE TABLE `clinic_managementapp_user_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `dob` date NOT NULL,
  `gender` varchar(100) NOT NULL,
  `place` varchar(100) NOT NULL,
  `post` varchar(100) NOT NULL,
  `pin` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `LOGIN_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `clinic_managementapp_LOGIN_id_9044983c_fk_clinic_ma` (`LOGIN_id`),
  CONSTRAINT `clinic_managementapp_LOGIN_id_9044983c_fk_clinic_ma` FOREIGN KEY (`LOGIN_id`) REFERENCES `clinic_managementapp_login_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `clinic_managementapp_user_table` */

insert  into `clinic_managementapp_user_table`(`id`,`firstname`,`lastname`,`dob`,`gender`,`place`,`post`,`pin`,`phone`,`email`,`LOGIN_id`) values 
(1,'Ashin','A','2023-12-17','Male','Wayanad','Wayanad','654321','9876543212','ashin@gmail.com',7),
(2,'athul','s','2002-07-07','Male','kannur','mndy','654085','9632587412','yen@gmail.com',17),
(3,'pranav','m','2003-01-19','Male','cherukunnu','ko','36258','3312942514','sjmnsjs@gmail.com',19),
(4,'visruth','b','2002-12-27','Male','mahe','jjl','670301','8909768081','visru@gmail.com',30),
(5,'abhinanda','p','2002-02-28','Male','mahe','hbjk','678901','8769087657','abhi@gmail.com',31);

/*Table structure for table `django_admin_log` */

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_admin_log` */

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`app_label`,`model`) values 
(1,'admin','logentry'),
(3,'auth','group'),
(2,'auth','permission'),
(4,'auth','user'),
(21,'clinic_managementapp','bill_items_table'),
(20,'clinic_managementapp','bill_table'),
(7,'clinic_managementapp','booking_table'),
(19,'clinic_managementapp','complaint_table'),
(8,'clinic_managementapp','disease_table'),
(9,'clinic_managementapp','doctor_table'),
(18,'clinic_managementapp','feedback_table'),
(10,'clinic_managementapp','login_table'),
(17,'clinic_managementapp','medicine_table'),
(11,'clinic_managementapp','pharmacy_table'),
(12,'clinic_managementapp','prescription_table'),
(16,'clinic_managementapp','request_table'),
(15,'clinic_managementapp','shedule_table'),
(14,'clinic_managementapp','symptom_table'),
(13,'clinic_managementapp','user_table'),
(5,'contenttypes','contenttype'),
(6,'sessions','session');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values 
(1,'contenttypes','0001_initial','2023-12-15 19:20:31.522940'),
(2,'auth','0001_initial','2023-12-15 19:20:32.006721'),
(3,'admin','0001_initial','2023-12-15 19:20:32.126346'),
(4,'admin','0002_logentry_remove_auto_add','2023-12-15 19:20:32.141859'),
(5,'admin','0003_logentry_add_action_flag_choices','2023-12-15 19:20:32.157522'),
(6,'contenttypes','0002_remove_content_type_name','2023-12-15 19:20:32.231953'),
(7,'auth','0002_alter_permission_name_max_length','2023-12-15 19:20:32.276700'),
(8,'auth','0003_alter_user_email_max_length','2023-12-15 19:20:32.300498'),
(9,'auth','0004_alter_user_username_opts','2023-12-15 19:20:32.316165'),
(10,'auth','0005_alter_user_last_login_null','2023-12-15 19:20:32.368243'),
(11,'auth','0006_require_contenttypes_0002','2023-12-15 19:20:32.372601'),
(12,'auth','0007_alter_validators_add_error_messages','2023-12-15 19:20:32.381096'),
(13,'auth','0008_alter_user_username_max_length','2023-12-15 19:20:32.443820'),
(14,'auth','0009_alter_user_last_name_max_length','2023-12-15 19:20:32.499012'),
(15,'auth','0010_alter_group_name_max_length','2023-12-15 19:20:32.524277'),
(16,'auth','0011_update_proxy_permissions','2023-12-15 19:20:32.524277'),
(17,'auth','0012_alter_user_first_name_max_length','2023-12-15 19:20:32.585349'),
(18,'clinic_managementapp','0001_initial','2023-12-15 19:20:33.638731'),
(19,'sessions','0001_initial','2023-12-15 19:20:33.681168'),
(20,'clinic_managementapp','0002_pharmacy_table_photo','2023-12-15 22:03:01.557894'),
(21,'clinic_managementapp','0003_auto_20231216_0401','2023-12-15 22:31:11.266066'),
(22,'clinic_managementapp','0004_auto_20231217_2224','2023-12-17 16:54:12.882345'),
(23,'clinic_managementapp','0005_alter_prescription_table_prescription','2023-12-17 22:25:32.400189'),
(24,'clinic_managementapp','0006_alter_prescription_table_prescription','2023-12-17 22:32:03.860794'),
(25,'clinic_managementapp','0002_alter_prescription_table_prescription','2023-12-17 22:57:51.084980'),
(26,'clinic_managementapp','0003_auto_20231218_2310','2023-12-18 17:41:00.706462'),
(27,'clinic_managementapp','0004_auto_20231220_2134','2023-12-20 16:04:41.785079'),
(28,'clinic_managementapp','0005_prescription_table_type','2023-12-20 18:40:24.477549'),
(29,'clinic_managementapp','0006_auto_20231222_0423','2023-12-21 22:53:24.334289'),
(30,'clinic_managementapp','0007_auto_20240321_0937','2024-03-21 04:08:04.476450'),
(31,'clinic_managementapp','0008_auto_20240321_1408','2024-03-21 08:38:44.015020');

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_session` */

insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values 
('1zqeyiksjjlku2fnbb806yy6vnfiwx5f','.eJxVjEEOwiAQRe_C2hBopwx16d4zkGEGbNVAUtqV8e7apAvd_vfef6lA2zqFraUlzKLOyqrT7xaJH6nsQO5UblVzLesyR70r-qBNX6uk5-Vw_w4matO3BkQP2PPYZUHxjm2kxKbzacxCZAzC6MD1vfAwsEAkpGzQgbURMJJ6fwDiljgD:1rnDbC:0NK4Ip0JXLQ-hX954vNT82mZdV-q5or4vO02xcAp98k','2024-04-04 08:16:30.266989'),
('5s5y4gpy1frgtqggx40pdbtkayboeyu1','.eJyrVkrJTFGyMtRRSgbRRjpKOSDaVEcpCSqeCxUPCPKPBzFNQEzXYGcwx6gWAEElEZ0:1rFNbx:PNAkbzfxSDr_VYmkHPbTHSgnfA2l8JgpZs2DKWXynNI','2024-01-02 00:05:25.052188'),
('6b9uly3t6ve8tolekrgra1cfwg0q5ob3','.eJxVTksOgjAQvUvXpGnt0KEuNS6NRg9App0iKIGEz8p4dylhobv3z3uLkuapLucxDmXDYi-0yH41T-EVu2Twk7pHL0PfTUPjZYrIzR3luefYHrbs30BNY720AbEANMHtKkYubNCeYlC7IrqKiZRCcBasMRzyPDB4QqoUWtDaA3paRtv0DzJxvZ3ux_WsdoldVmw-X6iXQNE:1rGOV9:45JhT4MhredkciU8IkveTQpeUGlV6T91OaUBAOVv954','2024-01-04 19:14:35.006426'),
('jsuesxmb9rzjcozl5ftrf6co5bm6j40u','.eJxVjsEOgjAQRP-lZ9O0sHSpR-98Q7PdLYKaNqFwMv67kHDQ67yZl3mrQNs6ha2mJcyirsqqy28WiZ8pH0AelO9Fc8nrMkd9VPRJqx6KpNft7P4JJqrTvgbEHrBl34yC0ju2kRKbpk9-FCJjELwD17bCXccCkZBGgw6sjYCRdqkc_6z5fAHkMDo_:1rll6V:Yn4MchFHIabpoJwOW69f1ecKMltmylgFBjnhhvC2XyA','2024-03-31 07:38:47.889769'),
('xh5ch9cu3fpqn7kedlbh5fz6d9tgs9bp','.eJxVjsEOgjAQRP-lZ9O0sHSpR-98Q7PdLYKaNqFwMv67kHDQ67yZl3mrQNs6ha2mJcyirsqqy28WiZ8pH0AelO9Fc8nrMkd9VPRJqx6KpNft7P4JJqrTvgbEHrBl34yC0ju2kRKbpk9-FCJjELwD17bCXccCkZBGgw6sjYCRdqkc_6z5fAHkMDo_:1rnDxw:TYOV2nr3uQue7Fsiah_C69WJR-phT2Bi4uRdBWENoI8','2024-04-04 08:40:00.314514'),
('z8nkgx3jbotn28305752hhj1tipnj7yt','.eJxVjsEOgjAQRP-lZ9O0sHRbj979hma7WwQlJaFwMv67kHDQ67yZl3mrSNs6xK3mJY6irsqqy2-WiF-5HECeVB6z5rmsy5j0UdEnrfo-S55uZ_dPMFAd9jUgesCWQ9MLindsE2U2jc-hFyJjEIID17bCXccCiZB6gw6sTYCJdul0_Gv85wvkgzpQ:1rlLft:oELyjpLlGVtxOycrM9zeVxlv_PapoiZrHm5xrqjWWD4','2024-03-30 04:29:37.858816');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
