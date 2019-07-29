-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2019-07-29 17:05:11
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
-- 資料庫： `addressbook`
--

-- --------------------------------------------------------

--
-- 資料表結構 `bill`
--

CREATE TABLE `bill` (
  `tel` varchar(20) NOT NULL,
  `fee` int(11) DEFAULT NULL,
  `dd` datetime NOT NULL,
  `hid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `bill`
--

INSERT INTO `bill` (`tel`, `fee`, `dd`, `hid`) VALUES
('1111', 300, '2019-01-01 00:00:00', 1),
('1111', 700, '2019-02-01 00:00:00', 1),
('1112', 700, '2019-01-01 00:00:00', 1),
('1112', 450, '2019-02-01 00:00:00', 1),
('1112', 200, '2019-03-01 00:00:00', 1),
('2222', 150, '2019-01-01 00:00:00', 2),
('2222', 400, '2019-02-01 00:00:00', 2),
('2222', 300, '2019-03-01 00:00:00', 2),
('3333', 500, '2019-04-01 00:00:00', 3);

-- --------------------------------------------------------

--
-- 資料表結構 `house`
--

CREATE TABLE `house` (
  `hid` int(11) NOT NULL,
  `address` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `house`
--

INSERT INTO `house` (`hid`, `address`) VALUES
(1, '台北市南京東路1號'),
(2, '新竹市光復北路1號'),
(3, '台中市公益路二段51號'),
(4, '高雄市五福路3號');

-- --------------------------------------------------------

--
-- 資料表結構 `live`
--

CREATE TABLE `live` (
  `uid` varchar(20) NOT NULL,
  `hid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `live`
--

INSERT INTO `live` (`uid`, `hid`) VALUES
('A01', 1),
('A01', 3),
('A02', 1),
('A03', 1);

-- --------------------------------------------------------

--
-- 資料表結構 `phone`
--

CREATE TABLE `phone` (
  `tel` varchar(20) NOT NULL,
  `hid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `phone`
--

INSERT INTO `phone` (`tel`, `hid`) VALUES
('1111', 1),
('1112', 1),
('2222', 2),
('3333', 3);

-- --------------------------------------------------------

--
-- 資料表結構 `userinfo`
--

CREATE TABLE `userinfo` (
  `uid` varchar(20) NOT NULL,
  `cname` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `userinfo`
--

INSERT INTO `userinfo` (`uid`, `cname`) VALUES
('A01', '王大明'),
('A02', '李大媽'),
('A03', '王小毛'),
('A04', '朱小妹'),
('A05', NULL),
('A06', '');

-- --------------------------------------------------------

--
-- 替換檢視表以便查看 `vw_user`
-- (請參考以下實際畫面)
--
CREATE TABLE `vw_user` (
`uid` varchar(20)
,`cname` varchar(45)
,`address` varchar(200)
,`tel` varchar(20)
);

-- --------------------------------------------------------

--
-- 檢視表結構 `vw_user`
--
DROP TABLE IF EXISTS `vw_user`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_user`  AS  select `userinfo`.`uid` AS `uid`,`userinfo`.`cname` AS `cname`,`house`.`address` AS `address`,`phone`.`tel` AS `tel` from (((`userinfo` left join `live` on(`userinfo`.`uid` = `live`.`uid`)) left join `house` on(`live`.`hid` = `house`.`hid`)) left join `phone` on(`house`.`hid` = `phone`.`hid`)) ;

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`tel`,`dd`),
  ADD KEY `fk_hid_idx` (`hid`);

--
-- 資料表索引 `house`
--
ALTER TABLE `house`
  ADD PRIMARY KEY (`hid`);

--
-- 資料表索引 `live`
--
ALTER TABLE `live`
  ADD PRIMARY KEY (`uid`,`hid`),
  ADD KEY `fk_hid_idx` (`hid`);

--
-- 資料表索引 `phone`
--
ALTER TABLE `phone`
  ADD PRIMARY KEY (`tel`),
  ADD KEY `fk_Phone_hid_idx` (`hid`);

--
-- 資料表索引 `userinfo`
--
ALTER TABLE `userinfo`
  ADD PRIMARY KEY (`uid`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `house`
--
ALTER TABLE `house`
  MODIFY `hid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- 已傾印資料表的限制式
--

--
-- 資料表的限制式 `bill`
--
ALTER TABLE `bill`
  ADD CONSTRAINT `fk_Bill_hid` FOREIGN KEY (`hid`) REFERENCES `house` (`hid`),
  ADD CONSTRAINT `fk_Bill_tel` FOREIGN KEY (`tel`) REFERENCES `phone` (`tel`);

--
-- 資料表的限制式 `live`
--
ALTER TABLE `live`
  ADD CONSTRAINT `fk_hid` FOREIGN KEY (`hid`) REFERENCES `house` (`hid`),
  ADD CONSTRAINT `fk_uid` FOREIGN KEY (`uid`) REFERENCES `userinfo` (`uid`);

--
-- 資料表的限制式 `phone`
--
ALTER TABLE `phone`
  ADD CONSTRAINT `fk_Phone_hid` FOREIGN KEY (`hid`) REFERENCES `house` (`hid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
