-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        8.0.26 - MySQL Community Server - GPL
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- community 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `community` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `community`;

-- 테이블 community.account 구조 내보내기
CREATE TABLE IF NOT EXISTS `account` (
  `aid` int NOT NULL AUTO_INCREMENT,
  `userId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`aid`),
  UNIQUE KEY `account` (`userId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 community.account:~3 rows (대략적) 내보내기
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT IGNORE INTO `account` (`aid`, `userId`, `password`, `name`, `phone`) VALUES
	(1, '1', '1', '홍길동', '01012341234'),
	(2, '123', '123', '박길동', '01012351235'),
	(3, 'asd', 'asd', '전길동', '01012361236');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;

-- 테이블 community.board 구조 내보내기
CREATE TABLE IF NOT EXISTS `board` (
  `bno` int NOT NULL AUTO_INCREMENT,
  `Title` varchar(50) DEFAULT NULL,
  `Content` varchar(255) DEFAULT NULL,
  `userId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `fileName` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `regDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`bno`)
) ENGINE=InnoDB AUTO_INCREMENT=216 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 community.board:~35 rows (대략적) 내보내기
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT IGNORE INTO `board` (`bno`, `Title`, `Content`, `userId`, `fileName`, `regDate`) VALUES
	(143, 'Test1', 'Test', '123', '7d1a6355-b293-4629-9945-52807f913b93_1.jpg', '2021-09-17 09:16:29'),
	(144, 'Test2', 'T\r\ne\r\ns\r\nt', '123', '15556af3-e74f-4fe7-84c9-7af1c9d22f99_2.png', '2021-09-17 09:22:14'),
	(145, 'Test3', 'Test', '123', 'febba7da-93aa-4fa9-959e-2ec7b4ffbdd6_3.jpg', '2021-09-17 09:39:24'),
	(146, 'Test4', 't\r\ne\r\nst4', '123', 'f1c200f2-da34-4fd6-bc27-e87b2b5d88cb_4.jpg', '2021-09-17 09:41:18'),
	(147, 'Test5', '123124124214', '123', '5838da24-73a5-4cdd-a600-6c5128b6fee5_5.jpg', '2021-09-17 09:46:26'),
	(148, 'Test6', 'asfa\r\nsfzx\r\nasgqwkltjqwps\r\ndzxclkasjodcuwqur', '123', 'e88334dd-42d7-4a6b-8413-52330ca2ed5b_6.jpg', '2021-09-17 09:50:51'),
	(149, 'Test7', 'asdzxc', '123', 'e561e096-5810-403c-9629-724e82ac4505_7.jpg', '2021-09-17 09:51:39'),
	(151, 'Test8', 'Taaaaaaaaa', '123', 'f49276fb-7f47-4078-ad9f-858d7b8a4658_8.png', '2021-09-17 09:57:31'),
	(152, 'Test9', 'asdzxc', '123', '18700af8-cad6-46cd-887b-53cecf8a4ee1_9.png', '2021-09-17 09:58:03'),
	(153, 'Test10', 'aszx', '123', '4e9a5018-db2a-4ad0-b3a8-82b2dc7aa257_10.png', '2021-09-17 09:58:29'),
	(154, 'Test11', 'asdxc', '123', '7a09f1fe-bdce-477d-8121-769df8cbe369_1.jpg', '2021-09-17 09:59:10'),
	(155, 'Test12', 'asd', '123', 'eac093c4-065b-4bc6-8397-128a6dee7bbc_2.png', '2021-09-17 09:59:22'),
	(156, 'Test13', 'z', '123', 'aa07ab18-d82b-4582-bcf4-987037e457b8_3.jpg', '2021-09-17 10:47:42'),
	(157, 'Test14', '14', '123', 'd35252aa-e45a-4143-8563-04fa506a4d06_4.jpg', '2021-09-17 10:47:49'),
	(158, 'Test15', '15', '123', '880d221b-b2b9-4d37-8497-eb45cc5725ad_5.jpg', '2021-09-17 10:47:55'),
	(159, 'Test16', '16', '123', 'f0de76ec-cb49-4b3b-a612-9d122a6c8876_6.jpg', '2021-09-17 10:48:02'),
	(160, 'Test17', '17', '123', 'd540e56a-519b-4368-abb3-1048f014b6ac_7.jpg', '2021-09-17 10:48:08'),
	(161, 'Test18', '18', '123', 'f731ec5c-6415-4085-a40a-97070b1ca2d0_8.png', '2021-09-17 10:48:15'),
	(162, 'Test19', '19', '123', 'b3a354aa-77c0-495e-8591-f82ea72f920c_9.png', '2021-09-17 10:48:22'),
	(163, 'Test20', '20', '123', '6f2d627d-ad7d-4b67-8b34-4c8e1e650292_10.png', '2021-09-17 10:48:29'),
	(170, 'Test21', '21', '1', '1a08c03e-c332-45f6-8d84-2737385e331d_1.jpg', '2021-09-23 10:15:50'),
	(171, 'Test22', '22', '1', '5a7c33cd-b122-490b-a931-78ce51dccc4b_Mobile.JPG', '2021-09-23 10:16:20'),
	(172, 'Test23', '23', '1', '7d557128-7146-4ee6-8483-e8ffea03df7d_Mobile.JPG', '2021-09-23 10:35:05'),
	(173, 'Test24', '24\r\n24\r\n24\r\n24\r\n24', '123', 'a7c5aa6e-e47b-4692-94fe-9b848ba83683_4.jpg', '2021-09-23 12:45:03'),
	(174, 'Test25', '25', '123', 'e835fcc3-fbe8-43d7-b901-4a5aef0836cf_5.jpg', '2021-09-23 13:30:08'),
	(175, 'Test26', '26\r\n26', '1', '73e42499-f1bc-4314-8212-3e4323cdc228_Mobile.JPG', '2021-09-23 13:30:51'),
	(176, 'Test27', '27번째\r\n테스트\r\n게시글', '123', '5fa6f0d3-a562-48ed-9d02-dc676ed44635_7.jpg', '2021-09-23 13:42:40'),
	(177, 'Test28', '28번째ㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐ\r\n테스트ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ\r\n게시글ㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹ', '123', '41aa38d8-d151-4b86-a6d1-b384a1369c12_8.png', '2021-09-23 13:43:08'),
	(178, 'Test29', '2222222222222\r\n9999999999999\r\n22222222222\r\n9\r\n2\r\n9\r\n2\r\n9', '123', 'e7025555-eca7-4376-b72e-3e4b75bed365_9.png', '2021-09-23 14:51:37'),
	(185, 'Test30', '3030', '123', '718b8c96-4d9d-4803-9aa7-0a743897e197_10.png', '2021-09-23 15:45:18'),
	(189, 'Test31', 'Test31', '123', '6aeda469-93eb-4beb-8b49-741210cc1340_1.jpg', '2021-09-23 18:02:37'),
	(190, 'Test32', '3232', '123', 'e7c05af8-6356-416a-93f6-73bacf34ebf5_2.png', '2021-09-24 10:11:30'),
	(191, 'Test33', 'Test33', '1', '55a5eba1-939a-411b-9e65-5e108a3e6437_Mobile.JPG', '2021-09-24 10:28:16'),
	(197, 'Test34', '35', '123', 'dc7062db-40dc-4e82-8407-34db537147d2_4.jpg', '2021-09-24 13:59:49'),
	(215, 'Test35', 'sss', '123', '2a64ddef-e2af-4308-91c6-fece2c378aa8_5.jpg', '2021-10-08 11:25:16');
/*!40000 ALTER TABLE `board` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
