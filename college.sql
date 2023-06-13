-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 01, 2023 at 02:05 PM
-- Server version: 8.0.31
-- PHP Version: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `college`
--

-- --------------------------------------------------------

--
-- Table structure for table `alumni_management`
--

DROP TABLE IF EXISTS `alumni_management`;
CREATE TABLE IF NOT EXISTS `alumni_management` (
  `Alumni_ID` int NOT NULL AUTO_INCREMENT,
  `Student_Branch` longtext,
  `Student_Profile` varchar(100) DEFAULT NULL,
  `Student_Roll_No` longtext,
  `Student_Name` longtext,
  PRIMARY KEY (`Alumni_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `alumni_management`
--

INSERT INTO `alumni_management` (`Alumni_ID`, `Student_Branch`, `Student_Profile`, `Student_Roll_No`, `Student_Name`) VALUES
(1, 'CSE', '', 'pr123', 'pranav');

-- --------------------------------------------------------

--
-- Table structure for table `assignment_model`
--

DROP TABLE IF EXISTS `assignment_model`;
CREATE TABLE IF NOT EXISTS `assignment_model` (
  `Assignment_ID` int NOT NULL AUTO_INCREMENT,
  `Assignment_Name` longtext NOT NULL,
  `Assignment_Branch` longtext,
  `Assignment_Sem` longtext,
  PRIMARY KEY (`Assignment_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `assignment_model`
--

INSERT INTO `assignment_model` (`Assignment_ID`, `Assignment_Name`, `Assignment_Branch`, `Assignment_Sem`) VALUES
(1, 'Assignment-1', 'CIVIL', 'semester-2'),
(2, 'Assignment-2', 'EEE', 'semester-1'),
(3, 'Assignment-3', 'EEE', 'semester-1'),
(4, 'Assignment-5', 'CIVIL', 'semester-2'),
(5, 'Assignment-1', 'CIVIL', 'semester-2');

-- --------------------------------------------------------

--
-- Table structure for table `attendance_management`
--

DROP TABLE IF EXISTS `attendance_management`;
CREATE TABLE IF NOT EXISTS `attendance_management` (
  `Attendence_ID` int NOT NULL AUTO_INCREMENT,
  `Student_Name` longtext NOT NULL,
  `Student_Roll` longtext NOT NULL,
  `Stu_Sem` longtext NOT NULL,
  `Stu_Branch` longtext NOT NULL,
  `Att_Status` tinyint(1) DEFAULT NULL,
  `Att_Date` date DEFAULT NULL,
  `Att_Subject` longtext,
  `Student_Foregin_id` int DEFAULT NULL,
  `Student_Status` longtext,
  PRIMARY KEY (`Attendence_ID`),
  KEY `attendance_management_Student_Foregin_id_86a3b3ef` (`Student_Foregin_id`)
) ENGINE=MyISAM AUTO_INCREMENT=260 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `attendance_management`
--

INSERT INTO `attendance_management` (`Attendence_ID`, `Student_Name`, `Student_Roll`, `Stu_Sem`, `Stu_Branch`, `Att_Status`, `Att_Date`, `Att_Subject`, `Student_Foregin_id`, `Student_Status`) VALUES
(258, 'suresh', 's765', 'semester-1', 'EEE', 0, '2023-06-01', 'signals and systems', 7, 'present'),
(259, 'chaitanya', 'c1234', 'semester-1', 'EEE', NULL, '2023-06-01', 'signals and systems', 8, 'absent'),
(257, 'sam ', 'sam567', 'semester-2', 'CIVIL', 0, '2023-06-01', 'html', 3, 'present'),
(256, 'Raghu Vrama', 'n321', 'semester-2', 'CIVIL', NULL, '2023-06-01', 'html', 1, 'absent');

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_group_id_b120cbf9` (`group_id`),
  KEY `auth_group_permissions_permission_id_84c5c92e` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id_2f476e4b` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add alumni_ management', 7, 'add_alumni_management'),
(26, 'Can change alumni_ management', 7, 'change_alumni_management'),
(27, 'Can delete alumni_ management', 7, 'delete_alumni_management'),
(28, 'Can view alumni_ management', 7, 'view_alumni_management'),
(29, 'Can add faculty_ management', 8, 'add_faculty_management'),
(30, 'Can change faculty_ management', 8, 'change_faculty_management'),
(31, 'Can delete faculty_ management', 8, 'delete_faculty_management'),
(32, 'Can view faculty_ management', 8, 'view_faculty_management'),
(33, 'Can add learning_ management', 9, 'add_learning_management'),
(34, 'Can change learning_ management', 9, 'change_learning_management'),
(35, 'Can delete learning_ management', 9, 'delete_learning_management'),
(36, 'Can view learning_ management', 9, 'view_learning_management'),
(37, 'Can add library_ management', 10, 'add_library_management'),
(38, 'Can change library_ management', 10, 'change_library_management'),
(39, 'Can delete library_ management', 10, 'delete_library_management'),
(40, 'Can view library_ management', 10, 'view_library_management'),
(41, 'Can add marks_ management', 11, 'add_marks_management'),
(42, 'Can change marks_ management', 11, 'change_marks_management'),
(43, 'Can delete marks_ management', 11, 'delete_marks_management'),
(44, 'Can view marks_ management', 11, 'view_marks_management'),
(45, 'Can add student_ management', 12, 'add_student_management'),
(46, 'Can change student_ management', 12, 'change_student_management'),
(47, 'Can delete student_ management', 12, 'delete_student_management'),
(48, 'Can view student_ management', 12, 'view_student_management'),
(49, 'Can add subject_ management', 13, 'add_subject_management'),
(50, 'Can change subject_ management', 13, 'change_subject_management'),
(51, 'Can delete subject_ management', 13, 'delete_subject_management'),
(52, 'Can view subject_ management', 13, 'view_subject_management'),
(53, 'Can add thesis_ management', 14, 'add_thesis_management'),
(54, 'Can change thesis_ management', 14, 'change_thesis_management'),
(55, 'Can delete thesis_ management', 14, 'delete_thesis_management'),
(56, 'Can view thesis_ management', 14, 'view_thesis_management'),
(57, 'Can add attendence_ management', 15, 'add_attendence_management'),
(58, 'Can change attendence_ management', 15, 'change_attendence_management'),
(59, 'Can delete attendence_ management', 15, 'delete_attendence_management'),
(60, 'Can view attendence_ management', 15, 'view_attendence_management'),
(61, 'Can add assignment_details', 16, 'add_assignment_details'),
(62, 'Can change assignment_details', 16, 'change_assignment_details'),
(63, 'Can delete assignment_details', 16, 'delete_assignment_details'),
(64, 'Can view assignment_details', 16, 'view_assignment_details'),
(65, 'Can add course_ buy_ model', 17, 'add_course_buy_model'),
(66, 'Can change course_ buy_ model', 17, 'change_course_buy_model'),
(67, 'Can delete course_ buy_ model', 17, 'delete_course_buy_model'),
(68, 'Can view course_ buy_ model', 17, 'view_course_buy_model'),
(69, 'Can add grade_ management', 18, 'add_grade_management'),
(70, 'Can change grade_ management', 18, 'change_grade_management'),
(71, 'Can delete grade_ management', 18, 'delete_grade_management'),
(72, 'Can view grade_ management', 18, 'view_grade_management');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE IF NOT EXISTS `auth_user` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_user_id_6a12ed8b` (`user_id`),
  KEY `auth_user_groups_group_id_97559544` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_user_id_a95ead1b` (`user_id`),
  KEY `auth_user_user_permissions_permission_id_1fbb5f2c` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `buy_course`
--

DROP TABLE IF EXISTS `buy_course`;
CREATE TABLE IF NOT EXISTS `buy_course` (
  `Buy_ID` int NOT NULL AUTO_INCREMENT,
  `Student_Name` longtext NOT NULL,
  `Stundent_Roll_num` longtext NOT NULL,
  `Student_Branch` longtext NOT NULL,
  `CourseName` longtext,
  `Description` longtext,
  `Price` longtext,
  PRIMARY KEY (`Buy_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `buy_course`
--

INSERT INTO `buy_course` (`Buy_ID`, `Student_Name`, `Stundent_Roll_num`, `Student_Branch`, `CourseName`, `Description`, `Price`) VALUES
(1, '', 'c1234', '', 'oops ', 'programming language\r\n', '8000'),
(2, '', 'c1234', '', 'Data science', 'Django is a free and open-source, Python-based web framework that follows the model–template–viewsarchitectural pattern. It is maintained by the Django Software Foundation,an independent organization established in the US as a 501 non-profit.', '18000');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6` (`user_id`)
) ;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(2, 'auth', 'permission'),
(3, 'auth', 'group'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(7, 'adminapp', 'alumni_management'),
(8, 'adminapp', 'faculty_management'),
(9, 'adminapp', 'learning_management'),
(10, 'adminapp', 'library_management'),
(11, 'adminapp', 'marks_management'),
(12, 'adminapp', 'student_management'),
(13, 'adminapp', 'subject_management'),
(14, 'adminapp', 'thesis_management'),
(15, 'facultyapp', 'attendence_management'),
(16, 'facultyapp', 'assignment_details'),
(17, 'adminapp', 'course_buy_model'),
(18, 'adminapp', 'grade_management');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-05-24 06:45:55.176666'),
(2, 'auth', '0001_initial', '2023-05-24 06:45:55.711686'),
(3, 'admin', '0001_initial', '2023-05-24 06:45:55.897486'),
(4, 'admin', '0002_logentry_remove_auto_add', '2023-05-24 06:45:55.912679'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-05-24 06:45:55.912679'),
(6, 'contenttypes', '0002_remove_content_type_name', '2023-05-24 06:45:55.996541'),
(7, 'auth', '0002_alter_permission_name_max_length', '2023-05-24 06:45:56.032593'),
(8, 'auth', '0003_alter_user_email_max_length', '2023-05-24 06:45:56.067012'),
(9, 'auth', '0004_alter_user_username_opts', '2023-05-24 06:45:56.074092'),
(10, 'auth', '0005_alter_user_last_login_null', '2023-05-24 06:45:56.107236'),
(11, 'auth', '0006_require_contenttypes_0002', '2023-05-24 06:45:56.107236'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2023-05-24 06:45:56.116843'),
(13, 'auth', '0008_alter_user_username_max_length', '2023-05-24 06:45:56.157356'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2023-05-24 06:45:56.201555'),
(15, 'auth', '0010_alter_group_name_max_length', '2023-05-24 06:45:56.234069'),
(16, 'auth', '0011_update_proxy_permissions', '2023-05-24 06:45:56.243109'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2023-05-24 06:45:56.273349'),
(18, 'sessions', '0001_initial', '2023-05-24 06:45:56.322763'),
(19, 'adminapp', '0001_initial', '2023-05-25 07:24:36.437058'),
(20, 'adminapp', '0002_learning_management_course_name_and_more', '2023-05-25 07:29:13.343571'),
(21, 'adminapp', '0003_alumni_management_student_branch_and_more', '2023-05-25 07:33:30.467822'),
(22, 'adminapp', '0004_rename_id_faculty_management_f_id', '2023-05-25 10:15:05.014382'),
(23, 'adminapp', '0005_marks_management_student_branch_and_more', '2023-05-25 18:30:04.482425'),
(24, 'adminapp', '0006_alter_marks_management_add_marks', '2023-05-26 06:34:37.893143'),
(25, 'adminapp', '0007_alumni_management_student_name', '2023-05-26 11:23:09.374411'),
(26, 'adminapp', '0008_student_management_alumni', '2023-05-26 11:34:59.165626'),
(27, 'adminapp', '0009_alter_student_management_alumni', '2023-05-26 11:45:13.174258'),
(28, 'adminapp', '0010_faculty_management_status', '2023-05-27 06:51:47.790336'),
(29, 'adminapp', '0011_subject_management_status', '2023-05-27 07:31:53.672929'),
(30, 'adminapp', '0012_student_management_status', '2023-05-27 08:25:22.653287'),
(31, 'adminapp', '0013_subject_management_faculty', '2023-05-27 10:13:40.429991'),
(32, 'facultyapp', '0001_initial', '2023-05-27 13:19:04.525182'),
(33, 'facultyapp', '0002_attendence_management_att_date', '2023-05-27 13:22:16.874535'),
(34, 'adminapp', '0014_student_management_subject', '2023-05-27 13:23:52.476271'),
(35, 'facultyapp', '0003_attendence_management_att_subject', '2023-05-27 13:26:02.601486'),
(36, 'facultyapp', '0004_attendence_management_student_foregin_and_more', '2023-05-31 10:39:14.243736'),
(37, 'facultyapp', '0005_alter_attendence_management_att_status', '2023-05-31 11:25:31.005278'),
(38, 'facultyapp', '0006_alter_attendence_management_att_status', '2023-05-31 11:41:51.822844'),
(39, 'adminapp', '0015_marks_management_stu_foregin', '2023-05-31 12:24:17.403922'),
(40, 'adminapp', '0016_student_management_marks', '2023-05-31 12:26:13.881775'),
(41, 'adminapp', '0017_student_management_marks_subject', '2023-05-31 12:32:35.187471'),
(42, 'adminapp', '0018_remove_marks_management_student_profile', '2023-05-31 12:36:43.636926'),
(43, 'facultyapp', '0007_alter_attendence_management_att_status', '2023-06-01 06:16:47.540056'),
(44, 'facultyapp', '0008_alter_attendence_management_att_status', '2023-06-01 06:25:13.878346'),
(45, 'facultyapp', '0009_attendence_management_student_status', '2023-06-01 06:27:07.992032'),
(46, 'adminapp', '0019_student_management_att_date', '2023-06-01 06:42:24.763624'),
(47, 'facultyapp', '0010_alter_attendence_management_att_status_and_more', '2023-06-01 07:19:57.580668'),
(48, 'adminapp', '0020_remove_student_management_marks_subject_and_more', '2023-06-01 07:38:50.808602'),
(49, 'facultyapp', '0011_assignment_details', '2023-06-01 07:44:02.359286'),
(50, 'facultyapp', '0012_assignment_details_assignment_branch_and_more', '2023-06-01 07:46:14.877879'),
(51, 'adminapp', '0021_course_buy_model', '2023-06-01 09:42:01.015681'),
(52, 'adminapp', '0022_course_buy_model_coursename_and_more', '2023-06-01 10:01:25.892276'),
(53, 'adminapp', '0023_student_management_grade', '2023-06-01 10:46:42.894300'),
(54, 'adminapp', '0024_grade_management', '2023-06-01 10:50:31.194210'),
(55, 'adminapp', '0025_alter_grade_management_add_marks', '2023-06-01 10:56:49.154802'),
(56, 'adminapp', '0026_alter_student_management_grade', '2023-06-01 11:22:07.262101'),
(57, 'adminapp', '0027_alter_student_management_grade', '2023-06-01 12:01:09.283932'),
(58, 'adminapp', '0028_subject_management_fac_foregin', '2023-06-01 12:39:34.468425');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('9t0wt4n77h7lml60pvo47sayqyog6js6', 'eyJTdHVkZW50X0lEIjo4fQ:1q4iSH:QZr6J4ptflI6hBge2mgtH_byVjD95iPa2IJqejx0Wc0', '2023-06-15 13:35:05.377679');

-- --------------------------------------------------------

--
-- Table structure for table `faculty_management`
--

DROP TABLE IF EXISTS `faculty_management`;
CREATE TABLE IF NOT EXISTS `faculty_management` (
  `Faculty_ID` int NOT NULL AUTO_INCREMENT,
  `F_ID` longtext NOT NULL,
  `Full_Name` longtext NOT NULL,
  `Email` varchar(254) NOT NULL,
  `Department` longtext NOT NULL,
  `Preferred_Subject` longtext NOT NULL,
  `Profile` varchar(100) NOT NULL,
  `Faculty_Password` longtext NOT NULL,
  `Status` longtext,
  PRIMARY KEY (`Faculty_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `faculty_management`
--

INSERT INTO `faculty_management` (`Faculty_ID`, `F_ID`, `Full_Name`, `Email`, `Department`, `Preferred_Subject`, `Profile`, `Faculty_Password`, `Status`) VALUES
(7, 'punith123', 'punith kumar', 'pk@gmail.com', 'MECH', 'electronics', 'Images/download_mdWGuvn.jfif', '29qx', 'pending'),
(5, 'dinesh123', 'Dinesh Kumar', 'd@gmail.com', 'EEE', 'signals', 'Images/pexels-photo-3244513.jpeg', 'DF3z', 'pending'),
(6, 'dilip9999', 'Dilip Yadav', 'dy@gmail.com', 'ECE', 'electronics', 'Images/pexels-photo-2603464.jpeg', '7Jx5', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `grade_management`
--

DROP TABLE IF EXISTS `grade_management`;
CREATE TABLE IF NOT EXISTS `grade_management` (
  `Grade_ID` int NOT NULL AUTO_INCREMENT,
  `Student_Branch` longtext,
  `Student_Semester` longtext,
  `Student_Name` longtext NOT NULL,
  `Student_Roll_No` longtext NOT NULL,
  `Add_Marks` double DEFAULT NULL,
  `Stu_Foregin_id` int DEFAULT NULL,
  PRIMARY KEY (`Grade_ID`),
  KEY `grade_management_Stu_Foregin_id_6dd2c929` (`Stu_Foregin_id`)
) ENGINE=MyISAM AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `learning_management`
--

DROP TABLE IF EXISTS `learning_management`;
CREATE TABLE IF NOT EXISTS `learning_management` (
  `Learning_ID` int NOT NULL AUTO_INCREMENT,
  `Course_Name` longtext,
  `Description` longtext,
  `Photo` varchar(100) DEFAULT NULL,
  `Price` longtext,
  PRIMARY KEY (`Learning_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `learning_management`
--

INSERT INTO `learning_management` (`Learning_ID`, `Course_Name`, `Description`, `Photo`, `Price`) VALUES
(5, 'oops ', 'programming language\r\n', 'Images/pexels-photo-906150.webp', '8000'),
(2, 'Data science', 'Django is a free and open-source, Python-based web framework that follows the model–template–viewsarchitectural pattern. It is maintained by the Django Software Foundation,an independent organization established in the US as a 501 non-profit.', 'Images/download_1_z5oJCRl.jfif', '18000'),
(4, 'data structures', 'Very Good \r\n', 'Images/pexels-photo-757889_nL3GQyo.webp', '14000');

-- --------------------------------------------------------

--
-- Table structure for table `library_management`
--

DROP TABLE IF EXISTS `library_management`;
CREATE TABLE IF NOT EXISTS `library_management` (
  `Library_ID` int NOT NULL AUTO_INCREMENT,
  `Title` longtext NOT NULL,
  `Author_Name` longtext NOT NULL,
  `Publisher_Name` longtext NOT NULL,
  `Preferred_Name` longtext NOT NULL,
  PRIMARY KEY (`Library_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `library_management`
--

INSERT INTO `library_management` (`Library_ID`, `Title`, `Author_Name`, `Publisher_Name`, `Preferred_Name`) VALUES
(4, 'code', 'syntax', 'error', 'CSE'),
(5, 'data analyst', 'albert', 'nirmala', 'CSE'),
(6, 'programming', 'K. N King', 'Prentice Hall', 'CSE');

-- --------------------------------------------------------

--
-- Table structure for table `marks_management`
--

DROP TABLE IF EXISTS `marks_management`;
CREATE TABLE IF NOT EXISTS `marks_management` (
  `Marks_ID` int NOT NULL AUTO_INCREMENT,
  `Student_Name` longtext NOT NULL,
  `Student_Roll_No` longtext NOT NULL,
  `Add_Marks` int DEFAULT NULL,
  `Student_Branch` longtext,
  `Student_Semester` longtext,
  `Student_Subject` longtext,
  `Stu_Foregin_id` int DEFAULT NULL,
  PRIMARY KEY (`Marks_ID`),
  KEY `marks_management_Stu_Foregin_id_e069b432` (`Stu_Foregin_id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `marks_management`
--

INSERT INTO `marks_management` (`Marks_ID`, `Student_Name`, `Student_Roll_No`, `Add_Marks`, `Student_Branch`, `Student_Semester`, `Student_Subject`, `Stu_Foregin_id`) VALUES
(21, 'Raghu Vrama', 'n321', 90, 'CIVIL', 'semester-2', 'Assignment-1', 1),
(20, 'sam ', 'sam567', 20, 'CIVIL', 'semester-2', 'html', 3),
(18, 'chaitanya', 'c1234', 23, 'EEE', 'semester-1', 'Assignment-1', 8),
(19, 'Raghu Vrama', 'n321', 22, 'CIVIL', 'semester-2', 'html', 1),
(17, 'suresh', 's765', 1, 'EEE', 'semester-1', 'signals and systems', 7),
(22, 'sam ', 'sam567', 100, 'CIVIL', 'semester-2', 'Assignment-1', 3),
(23, 'suresh', 's765', 33, 'EEE', 'semester-1', 'Assignment-3', 7),
(24, 'chaitanya', 'c1234', 44, 'EEE', 'semester-1', 'Assignment-3', 8),
(25, 'Raghu Vrama', 'n321', 22, 'CIVIL', 'semester-2', 'Assignment-5', 1),
(26, 'sam ', 'sam567', 11, 'CIVIL', 'semester-2', 'Assignment-5', 3);

-- --------------------------------------------------------

--
-- Table structure for table `student_management`
--

DROP TABLE IF EXISTS `student_management`;
CREATE TABLE IF NOT EXISTS `student_management` (
  `Student_ID` int NOT NULL AUTO_INCREMENT,
  `Full_Name` longtext NOT NULL,
  `Roll_No` longtext NOT NULL,
  `Email` varchar(254) NOT NULL,
  `Branch_Name` longtext NOT NULL,
  `Semester` longtext NOT NULL,
  `Address` longtext NOT NULL,
  `Phone_No` longtext NOT NULL,
  `Profile` varchar(100) NOT NULL,
  `Student_Password` longtext NOT NULL,
  `Alumni` longtext,
  `Status` longtext,
  `Subject` longtext,
  `Marks` int DEFAULT NULL,
  `Att_Date` date DEFAULT NULL,
  `Marks_Assignment` longtext,
  `Grade` int DEFAULT NULL,
  PRIMARY KEY (`Student_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `student_management`
--

INSERT INTO `student_management` (`Student_ID`, `Full_Name`, `Roll_No`, `Email`, `Branch_Name`, `Semester`, `Address`, `Phone_No`, `Profile`, `Student_Password`, `Alumni`, `Status`, `Subject`, `Marks`, `Att_Date`, `Marks_Assignment`, `Grade`) VALUES
(1, 'Raghu Vrama', 'n321', 'n@gmail.com', 'CIVIL', 'semester-2', 'Hyderabad', '1231231231', 'Images/download_1.jfif', '321', 'Not-Alumni', 'rejected', 'Assignment-5', 1, NULL, 'Assignment-1', 1),
(3, 'sam ', 'sam567', 's@gmail.com', 'CIVIL', 'semester-2', 'qwsfRS', '1122334455', 'Images/pexels-photo-206648.jpeg', 'MN3c', 'Not-Alumni', 'accepted', 'Assignment-5', 1, NULL, 'Assignment-1', 1),
(5, 'john', 'john987', 'j@gmail.com', 'CSE', 'semester-1', 'wqsaz', '9998887776', 'Images/pexels-photo-757889.webp', 'PaCC', 'Not-Alumni', 'pending', '', 0, NULL, NULL, 0),
(7, 'suresh', 's765', 'su@gmail.com', 'EEE', 'semester-1', 'efsvdczX', '1234567899', 'Images/download_4.jfif', '1234', 'Not-Alumni', 'pending', 'html', 0, NULL, 'Assignment-3', 0),
(8, 'chaitanya', 'c1234', 'c@gvvvv.vom', 'EEE', 'semester-1', 'wqsaz', '9998887776', 'Images/pexels-photo-2681319.webp', '1234', 'Not-Alumni', 'pending', 'html', 0, NULL, 'Assignment-3', 0),
(9, 'pranav', 'pr123', 'p@gmail.com', 'CSE', 'semester-8', 'nmnfd', '3456789089', 'Images/download_3_Yw2pIMT.jfif', '6iPz', 'Alumni', 'pending', '', 0, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `subject_management`
--

DROP TABLE IF EXISTS `subject_management`;
CREATE TABLE IF NOT EXISTS `subject_management` (
  `Subject_ID` int NOT NULL AUTO_INCREMENT,
  `Subject_Name` longtext NOT NULL,
  `Branch_Name` longtext NOT NULL,
  `Semester` longtext NOT NULL,
  `Status` longtext,
  `Faculty` longtext,
  `Fac_Foregin_id` int DEFAULT NULL,
  PRIMARY KEY (`Subject_ID`),
  KEY `subject_management_Fac_Foregin_id_5d0689b1` (`Fac_Foregin_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `subject_management`
--

INSERT INTO `subject_management` (`Subject_ID`, `Subject_Name`, `Branch_Name`, `Semester`, `Status`, `Faculty`, `Fac_Foregin_id`) VALUES
(2, 'html', 'CSE', 'semester-6', 'not-assigned', NULL, NULL),
(3, 'signals and systems', 'ECE', 'semester-5', 'not-assigned', NULL, NULL),
(6, 'python', 'CSE', 'semester-4', 'pending', NULL, NULL),
(5, 'Django', 'CSE', 'semester-4', 'pending', NULL, NULL),
(7, 'css', 'MECH', 'semester-6', 'pending', NULL, NULL),
(8, 'dfvsf', 'MECH', 'semester-6', 'pending', NULL, NULL),
(9, 'dfvsf', 'MECH', 'semester-6', 'pending', NULL, NULL),
(10, 'dfsvdc', 'CSE', 'semester-5', 'pending', NULL, NULL),
(11, 'erfed', 'CSE', 'semester-5', 'pending', NULL, NULL),
(12, 'Concrete Structures', 'CIVIL', 'semester-4', 'pending', 'varun kumar', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `thesis_management`
--

DROP TABLE IF EXISTS `thesis_management`;
CREATE TABLE IF NOT EXISTS `thesis_management` (
  `Thesis_ID` int NOT NULL AUTO_INCREMENT,
  `Thesis_File` varchar(100) DEFAULT NULL,
  `Thesis_Name` longtext,
  PRIMARY KEY (`Thesis_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `thesis_management`
--

INSERT INTO `thesis_management` (`Thesis_ID`, `Thesis_File`, `Thesis_Name`) VALUES
(2, 'Images/ABSTARCT-_Pro1.pdf', 'code'),
(3, 'Images/ABSTARCT-_Pro1_D0jjKPL.pdf', 'program');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
