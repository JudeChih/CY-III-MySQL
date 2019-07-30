-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2019-07-30 15:53:49
-- 伺服器版本： 10.3.16-MariaDB
-- PHP 版本： 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `toby_table`
--

-- --------------------------------------------------------

--
-- 資料表結構 `projectdata`
--

CREATE TABLE `projectdata` (
  `pd_id` int(11) NOT NULL COMMENT '產品編號',
  `pd_image01` text DEFAULT NULL COMMENT '產品圖片1',
  `pd_image02` text DEFAULT NULL COMMENT '產品圖片2',
  `pd_image03` text DEFAULT NULL COMMENT '產品圖片3',
  `pd_image04` text DEFAULT NULL COMMENT '產品圖片4',
  `pd_image05` text DEFAULT NULL COMMENT '產品圖片5',
  `pd_image06` text DEFAULT NULL COMMENT '產品圖片6',
  `pd_image07` text DEFAULT NULL COMMENT '產品圖片7',
  `pd_image08` text DEFAULT NULL COMMENT '產品圖片8'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `transactiondata`
--

CREATE TABLE `transactiondata` (
  `td_id` int(11) NOT NULL COMMENT '交易編號',
  `td_date` datetime DEFAULT NULL COMMENT '交易時間',
  `td_name` varchar(50) DEFAULT NULL COMMENT '交易名稱',
  `td_user` varchar(50) DEFAULT NULL COMMENT '交易對象'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `userdata`
--

CREATE TABLE `userdata` (
  `ud_id` int(10) NOT NULL COMMENT '使用者編號',
  `ud_icon` text NOT NULL COMMENT '使用者頭像',
  `ud_account` varchar(50) NOT NULL COMMENT '使用者帳號',
  `ud_name` varchar(50) NOT NULL COMMENT '使用者名稱',
  `ud_password` varchar(50) NOT NULL COMMENT '使用者密碼'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `projectdata`
--
ALTER TABLE `projectdata`
  ADD PRIMARY KEY (`pd_id`);

--
-- 資料表索引 `transactiondata`
--
ALTER TABLE `transactiondata`
  ADD PRIMARY KEY (`td_id`);

--
-- 資料表索引 `userdata`
--
ALTER TABLE `userdata`
  ADD PRIMARY KEY (`ud_id`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `projectdata`
--
ALTER TABLE `projectdata`
  MODIFY `pd_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '產品編號';

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `transactiondata`
--
ALTER TABLE `transactiondata`
  MODIFY `td_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '交易編號';

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `userdata`
--
ALTER TABLE `userdata`
  MODIFY `ud_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '使用者編號';
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
