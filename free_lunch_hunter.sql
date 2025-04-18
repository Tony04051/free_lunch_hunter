-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2024-06-11 08:22:11
-- 伺服器版本： 10.4.32-MariaDB
-- PHP 版本： 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `free_lunch_hunter`
--

-- --------------------------------------------------------

--
-- 資料表結構 `activities`
--

CREATE TABLE `activities` (
  `user_id` int(11) DEFAULT NULL,
  `activity_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `img` varchar(255) DEFAULT NULL,
  `act_date` date DEFAULT NULL,
  `place` varchar(255) DEFAULT NULL,
  `STARTT` time DEFAULT NULL,
  `ENDT` time DEFAULT NULL,
  `LUNCH` varchar(255) DEFAULT NULL,
  `URL` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `activities`
--

INSERT INTO `activities` (`user_id`, `activity_id`, `title`, `content`, `img`, `act_date`, `place`, `STARTT`, `ENDT`, `LUNCH`, `URL`) VALUES
(2, 10, 'test', 'testestsetse', '', '2024-06-04', 'etstsetes', '04:45:00', '01:50:00', '', ''),
(7, 11, 'test2', '222222', 'https://miro.medium.com/v2/resize:fit:828/format:webp/1*V5yud1OkmgG0lhEZuD5k0g.png', '2024-06-13', '5454', '11:47:00', '05:47:00', '3453453', 'https://www.youtube.com/watch?v=tzhy1KglwH4');

-- --------------------------------------------------------

--
-- 資料表結構 `articles`
--

CREATE TABLE `articles` (
  `user_id` int(11) DEFAULT NULL,
  `article_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `img` varchar(255) DEFAULT NULL,
  `art_date` datetime DEFAULT current_timestamp(),
  `rate` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `articles`
--

INSERT INTO `articles` (`user_id`, `article_id`, `title`, `content`, `img`, `art_date`, `rate`) VALUES
(1, 3, '恩', 'ㄚㄚ', '', '2024-06-09 00:00:00', 0),
(1, 5, '考績', '吃烤雞', '/final_project/src/img/1717939651.jpg', '2024-06-09 00:00:00', 25),
(1, 6, '烤', '雞', '/final_project/src/img/1717940687.jpg', '2024-06-09 00:00:00', 1),
(1, 7, '123123', '哈哈哈哈', NULL, '2024-06-10 00:32:32', 1),
(1, 8, '234', '234', NULL, '2024-06-10 00:34:02', 0),
(1, 9, '345', '345', NULL, '2024-06-10 00:34:07', 1),
(1, 10, '456', '456', NULL, '2024-06-10 00:34:12', 1),
(3, 11, 'hguty', 'jhguy', NULL, '2024-06-10 01:18:26', 1),
(3, 12, 'hguty', 'jhguy123', NULL, '2024-06-10 01:18:36', 4),
(4, 13, '88', '88', '/final_project/src/img/1717955247.jpg', '2024-06-10 01:41:41', 1),
(8, 14, '吃吃吃', 'hi', '/final_project/src/img/1718008435.jpg', '2024-06-10 16:33:55', 1),
(8, 15, '第二篇', 'yy', NULL, '2024-06-10 16:38:54', 1),
(8, 16, '生無可戀', '哈哈', NULL, '2024-06-10 19:51:25', 1),
(4, 17, '前', '前', NULL, '2024-06-11 01:53:56', 1),
(4, 18, '前', '前', NULL, '2024-06-11 01:54:08', 1),
(4, 19, '前', '前', NULL, '2024-06-11 01:54:11', 1),
(4, 20, '前', '前5', NULL, '2024-06-11 01:54:21', 1),
(4, 21, 'dsc', 'cd', NULL, '2024-06-11 01:55:32', 1),
(4, 22, 'dsc', 'cdds', NULL, '2024-06-11 01:56:35', 1),
(9, 23, '2024/6/11', 'kgfiugigu', NULL, '2024-06-11 01:59:49', 2),
(12, 24, '全家歐趴糖', '櫃檯直接拿，糖果餅乾零食都有', NULL, '2024-06-11 10:04:19', 2),
(4, 25, 'money', 'money', NULL, '2024-06-11 12:22:37', 1);

-- --------------------------------------------------------

--
-- 資料表結構 `comments`
--

CREATE TABLE `comments` (
  `comment_id` int(11) NOT NULL,
  `article_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `content` text NOT NULL,
  `comm_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `comments`
--

INSERT INTO `comments` (`comment_id`, `article_id`, `user_id`, `content`, `comm_date`) VALUES
(3, 12, 4, '浚瑀好電', '2024-06-10 01:41:04'),
(4, 12, 5, '電電電', '2024-06-10 01:42:42'),
(5, 12, 1, '程品諭電電電', '2024-06-10 01:57:49'),
(6, 10, 8, '哈哈哈', '2024-06-10 16:37:22'),
(7, 10, 8, '嗨哈', '2024-06-10 16:37:34'),
(8, 15, 1, 'abc\r\n', '2024-06-10 17:08:17'),
(9, 5, 8, '我是留言', '2024-06-10 18:52:08'),
(10, 11, 4, '有積分?', '2024-06-11 01:53:29'),
(11, 20, 9, '345456', '2024-06-11 02:01:35'),
(12, 23, 12, '竟然第一?', '2024-06-11 09:52:34'),
(13, 23, 12, '我又來打卡了', '2024-06-11 09:53:15');

-- --------------------------------------------------------

--
-- 資料表結構 `join_activity`
--

CREATE TABLE `join_activity` (
  `user_id` int(11) NOT NULL,
  `activity_id` int(11) NOT NULL,
  `personal_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `join_activity`
--

INSERT INTO `join_activity` (`user_id`, `activity_id`, `personal_id`) VALUES
(3, 11, NULL),
(12, 11, NULL);

-- --------------------------------------------------------

--
-- 資料表結構 `premium`
--

CREATE TABLE `premium` (
  `user_id` int(11) NOT NULL,
  `money` decimal(10,2) NOT NULL,
  `premium` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `premium`
--

INSERT INTO `premium` (`user_id`, `money`, `premium`) VALUES
(1, 971.00, 1),
(2, 0.00, 2),
(3, 0.00, 0),
(4, 999970.00, 1),
(5, 40.00, 1),
(6, 0.00, 2),
(7, 0.00, 2),
(8, 0.00, 1),
(9, 0.00, 0),
(10, 0.00, 0),
(11, 0.00, 2),
(12, 0.00, 0);

-- --------------------------------------------------------

--
-- 資料表結構 `user_account`
--

CREATE TABLE `user_account` (
  `user_id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `birth_date` date DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `reg_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `user_account`
--

INSERT INTO `user_account` (`user_id`, `email`, `username`, `birth_date`, `password`, `reg_date`) VALUES
(1, 'qwer@qwer', 'qwer', '2020-06-17', '$2y$10$Vvee8JYZyhBXqgs.yjRpr.qlfNseo2k16IpKAf0eBTz2zyft340mG', '2024-05-27'),
(2, 'asdf@asdf', 'asdf', '2024-06-25', '$2y$10$sSs56L5mzXnaWv76758lD.rhiiThC7e5qNVIuDh5irgDezjcxVPXW', '2024-06-09'),
(3, 'zxcv@zxcv', 'zxcv', '2024-06-10', '$2y$10$QjiyLWTh1qCSkYP32563b.BakFuK3m9Z78s945RFv2NQkdlP/16Re', '2024-06-10'),
(4, 'c8c8@gmail.com', 'c8c8', '2024-05-30', '$2y$10$Ks0amnUuMobYmCxFBAIRleKw5ojWJ2mrL4/YTSTY2S0zUqZ.mF4le', '2024-06-10'),
(5, 'tony20040405@gmail.com', 'taro', '2004-04-05', '$2y$10$mv11gWsK2MJxSAhwPrtsC.8yQ5/twRFB5spVayulmGnog7FuNnRQK', '2024-06-10'),
(6, 'super@gmail.com', 'Tony', '2004-04-05', '$2y$10$2dIMPIjVq1p3JHV8abalJesszZLj10LEauGmGHHHgJdmqLhXXga4G', '2024-06-10'),
(7, 'test1@gmail.com', 'test1', '2024-06-10', '$2y$10$DGL.VikMO.716hAJVTXGiu2Wm1yIYioQb2qkxGhDY9ojXhRS1meom', '2024-06-10'),
(8, 'test2@gmail.com', 'test2', '2024-06-10', '$2y$10$HC9gvGzBFik4r6MRzl9ZmOoTtYBnqmzCchymBjHdLkYstARRktu8m', '2024-06-10'),
(9, 'test3@gmail.com', 'test3', '2024-06-10', '$2y$10$wIdgn78bX0EVPMfOJQy8wOI/QeVyNgr1oYK.bO18uNSaHJ9G4Lo0i', '2024-06-10'),
(10, 'zackc0302@gmail.com', 'zack', '2024-05-27', '$2y$10$sgAE5cn9qvdO0TdHEwCIxueZp4XR4YALUsmfu/7aLtlniyPK6UcGy', '2024-06-10'),
(11, 'test@gmail.com', 'asd', '2024-06-11', '$2y$10$Cuo8iZoY6MI.qDAFzMYgNe2Di9q8/7s7dpWSx5xOMn2dKlivNLW6e', '2024-06-11'),
(12, '2024608@gmail.com', 'Fighting', '2024-05-29', '$2y$10$zUb.ImweRGcnGR7o89y.0OzqJVTwnYSqDW/QRevJ2aP3Frj4H4loq', '2024-06-11');

-- --------------------------------------------------------

--
-- 資料表結構 `votes`
--

CREATE TABLE `votes` (
  `vote_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `article_id` int(11) DEFAULT NULL,
  `rate` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `votes`
--

INSERT INTO `votes` (`vote_id`, `user_id`, `article_id`, `rate`) VALUES
(9, 1, 10, 1),
(17, 5, 13, 1),
(18, 5, 12, 1),
(19, 5, 11, 1),
(22, 5, 5, -1),
(23, 5, 9, -1),
(24, 5, 10, 1),
(27, 5, 6, -1),
(41, 1, 7, 1),
(67, 8, 11, 0),
(97, 8, 12, 1),
(98, 8, 13, -1),
(105, 8, 10, 0),
(119, 9, 15, 1),
(120, 9, 14, 0),
(122, 8, 15, 1),
(123, 8, 14, 1),
(124, 8, 9, 1),
(125, 8, 6, 1),
(142, 8, 7, -1),
(143, 8, 3, 0),
(145, 8, 8, 0),
(151, 8, 5, 0),
(152, 1, 15, -1),
(153, 3, 16, 0),
(154, 3, 13, 0),
(155, 3, 12, 1),
(156, 4, 22, 1),
(157, 9, 20, 0),
(158, 9, 19, 0),
(159, 9, 22, 0),
(160, 4, 5, 0),
(161, 4, 7, 1),
(162, 4, 23, 1),
(163, 12, 23, 1),
(164, 12, 24, 1),
(165, 1, 5, 1),
(166, 4, 21, 1),
(167, 4, 20, 1),
(168, 4, 19, 1),
(169, 4, 18, 1),
(170, 4, 17, 1),
(171, 4, 16, 1),
(172, 4, 15, 1),
(173, 4, 13, 1),
(174, 4, 10, 1),
(175, 9, 24, 1),
(176, 9, 25, 0),
(188, 1, 12, 1),
(189, 1, 25, 1),
(190, 1, 14, 1),
(191, 1, 9, 1),
(192, 1, 6, 1);

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `activities`
--
ALTER TABLE `activities`
  ADD PRIMARY KEY (`activity_id`),
  ADD KEY `user_id` (`user_id`);

--
-- 資料表索引 `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`article_id`),
  ADD KEY `user_id` (`user_id`);

--
-- 資料表索引 `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `article_id` (`article_id`),
  ADD KEY `user_id` (`user_id`);

--
-- 資料表索引 `join_activity`
--
ALTER TABLE `join_activity`
  ADD PRIMARY KEY (`user_id`,`activity_id`),
  ADD KEY `activity_id` (`activity_id`);

--
-- 資料表索引 `premium`
--
ALTER TABLE `premium`
  ADD PRIMARY KEY (`user_id`);

--
-- 資料表索引 `user_account`
--
ALTER TABLE `user_account`
  ADD PRIMARY KEY (`user_id`);

--
-- 資料表索引 `votes`
--
ALTER TABLE `votes`
  ADD PRIMARY KEY (`vote_id`),
  ADD UNIQUE KEY `user_id` (`user_id`,`article_id`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `activities`
--
ALTER TABLE `activities`
  MODIFY `activity_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `articles`
--
ALTER TABLE `articles`
  MODIFY `article_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `user_account`
--
ALTER TABLE `user_account`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `votes`
--
ALTER TABLE `votes`
  MODIFY `vote_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=193;

--
-- 已傾印資料表的限制式
--

--
-- 資料表的限制式 `activities`
--
ALTER TABLE `activities`
  ADD CONSTRAINT `activities_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_account` (`user_id`);

--
-- 資料表的限制式 `articles`
--
ALTER TABLE `articles`
  ADD CONSTRAINT `articles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_account` (`user_id`);

--
-- 資料表的限制式 `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`article_id`) REFERENCES `articles` (`article_id`),
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user_account` (`user_id`);

--
-- 資料表的限制式 `join_activity`
--
ALTER TABLE `join_activity`
  ADD CONSTRAINT `join_activity_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_account` (`user_id`),
  ADD CONSTRAINT `join_activity_ibfk_2` FOREIGN KEY (`activity_id`) REFERENCES `activities` (`activity_id`);

--
-- 資料表的限制式 `premium`
--
ALTER TABLE `premium`
  ADD CONSTRAINT `premium_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_account` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
