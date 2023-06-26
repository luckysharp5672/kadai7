-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- ホスト: 127.0.0.1
-- 生成日時: 2023-06-26 03:27:14
-- サーバのバージョン： 10.4.28-MariaDB
-- PHP のバージョン: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- データベース: `yama_message`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `messages`
--

CREATE TABLE `messages` (
  `id` int(6) UNSIGNED NOT NULL,
  `user_id` int(6) UNSIGNED NOT NULL,
  `message` text NOT NULL,
  `latitude` decimal(10,8) NOT NULL,
  `longitude` decimal(11,8) NOT NULL,
  `username` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- テーブルのデータのダンプ `messages`
--

INSERT INTO `messages` (`id`, `user_id`, `message`, `latitude`, `longitude`, `username`) VALUES
(1, 0, 'てｓｔ', 35.45437970, 139.50564790, 'user'),
(2, 0, 'ありがとうｇ', 35.45437970, 139.50564790, 'user'),
(3, 0, 'テスト5', 35.46152960, 139.49992960, 'user'),
(4, 0, 'こんばんは', 35.46152960, 139.49992960, 'user'),
(5, 0, 'ｆｃｙｇ', 35.46152960, 139.49992960, 'user'),
(6, 0, 'テスト', 35.45447380, 139.50570390, 'user'),
(7, 0, 'テスト', 35.45447380, 139.50570390, 'user'),
(8, 0, 'めでたい', 35.45439850, 139.50567590, 'user'),
(9, 0, '祈る', 35.46152960, 139.49992960, 'user'),
(10, 0, 'ｆだｆｆ', 35.46152960, 139.49992960, 'user'),
(11, 0, 'テステス', 35.45447090, 139.50570550, 'user'),
(12, 0, 'おめでとう', 35.45436750, 139.50564110, 'user'),
(13, 0, 'ojigi', 35.46152960, 139.49992960, 'user'),
(14, 0, 'atyg', 35.46152960, 139.49992960, 'user'),
(15, 0, 'あｓｄｓｖｓｆ', 35.46152960, 139.49992960, 'user'),
(16, 0, '今日は天気', 35.45825280, 139.63427840, 'user');

--
-- ダンプしたテーブルのインデックス
--

--
-- テーブルのインデックス `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- ダンプしたテーブルの AUTO_INCREMENT
--

--
-- テーブルの AUTO_INCREMENT `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
