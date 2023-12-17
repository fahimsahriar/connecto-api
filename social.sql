-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 17, 2023 at 02:19 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `social`
--

-- --------------------------------------------------------

--
-- Table structure for table `coments`
--

CREATE TABLE `coments` (
  `id` int(11) NOT NULL,
  `description` varchar(200) NOT NULL,
  `createdAt` datetime NOT NULL,
  `userid` int(11) NOT NULL,
  `postid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `coments`
--

INSERT INTO `coments` (`id`, `description`, `createdAt`, `userid`, `postid`) VALUES
(1, 'hlw', '2023-12-16 18:52:51', 1, 23),
(2, 'Go go', '2023-12-17 00:32:49', 1, 23),
(3, 'hi', '2023-12-17 00:42:46', 1, 22),
(4, 'Yes', '2023-12-17 00:43:43', 3, 23),
(5, 'Okay', '2023-12-17 00:43:50', 3, 21),
(6, 'Yeah', '2023-12-17 00:44:28', 1, 21);

-- --------------------------------------------------------

--
-- Table structure for table `follwers`
--

CREATE TABLE `follwers` (
  `id` int(11) NOT NULL,
  `follwerUserid` int(11) NOT NULL,
  `followedUserid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `follwers`
--

INSERT INTO `follwers` (`id`, `follwerUserid`, `followedUserid`) VALUES
(2, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `postid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`id`, `userid`, `postid`) VALUES
(1, 1, 20),
(2, 3, 20),
(4, 1, 22),
(5, 1, 21);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `description` varchar(200) NOT NULL,
  `img` varchar(200) DEFAULT NULL,
  `userid` int(11) NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `blood` int(11) DEFAULT NULL,
  `location` varchar(300) DEFAULT NULL,
  `bloodGroup` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `description`, `img`, `userid`, `createdAt`, `blood`, `location`, `bloodGroup`) VALUES
(18, 'eita to thakbei', '1702727798396link.png', 1, '2023-12-16 17:56:38', 0, NULL, NULL),
(19, '12 Filler text is text that shares some characteristics of a real written text, but is random or otherwise generated. It may be used to display a sample of fonts, generate text fo testing, or to spoo', '1702729849134person-working-with-floating-screens.jpg', 3, '2023-12-16 18:30:49', 0, NULL, NULL),
(20, '13 Filler is text that shares some characteristics of a real written text, but is random or otherwise generated. It may be used to display a sample of fonts, generate text for testing, or to spoof a', '1702729882470seo_dubai4.png', 3, '2023-12-16 18:31:22', 0, NULL, NULL),
(21, 'Filler text is text that shares some characteristics of a real written text, but is random or otherwise generated. It may be used to display a sample of fonts, generate text for testing, or to spoof a', '1702729899893meditism.png', 3, '2023-12-16 18:31:39', 1, 'Farazi Hospital, Vatara, Dhaka', 'O+'),
(22, 'Filler text is text that shares some characteristics of a real written text, but is random or otherwise generated. It may be used to display a sample of fonts, generate text for testing, or to spoof a', '1702729934011Screenshot (1).png', 1, '2023-12-16 18:32:14', 1, 'United Hospital, Gulshan, Dhaka', 'A+'),
(23, 'Filler text is text that shares some characteristics of a real written text, but is random or otherwise generated. It may be used to display a sample of fonts, generate text for testing, or to spoof a', '1702729940433Screenshot (3).png', 1, '2023-12-16 18:32:20', 0, NULL, NULL),
(24, 'Yes I need', '', 1, '2023-12-17 19:12:13', 1, 'Appollo Hospital', 'O+');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `coverPic` varchar(300) DEFAULT NULL,
  `profilePic` varchar(300) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `website` varchar(45) DEFAULT NULL,
  `password` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `name`, `coverPic`, `profilePic`, `city`, `website`, `password`) VALUES
(1, 'test', 'sifat@gmail.com', 'Sifat Ahmed', '1702806323168Passport_size.jpg', '1702806323153Untitled design.jpg', 'Dhaka', 'uiu.ac.bd', '$2a$10$jNBdHvZjpJgNW9DmnIRdRuSO6MWO18jMfjKG2bQ4YyaRrNQ2BJxmq'),
(2, 'test1', 'sifat1@gmail.com', 'Fahim Sahriar', NULL, 'https://images.pexels.com/photos/12657069/pexels-photo-12657069.png?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', NULL, NULL, '$2a$10$KXC/0W.yrU5zFGdyctWoQuZON5F/UzfK3KGUbJvtLG.1qvmZWmIia'),
(3, 'test2', 'test2@gmail.com', 'Monjurul Islam', '1702806702728Screenshot+2023-07-26+at+6.07.17+PM.png', '1702806702714Screenshot+2023-07-26+at+6.02.27+PM.png', 'Dhaka', 'uiu.ac.bd', '$2b$10$WfhUB9FJ/S2KNGe1bxbmC.qENu37JsG0f0go3SP1dcQNENk/ai2Ua');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `coments`
--
ALTER TABLE `coments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `postid` (`postid`),
  ADD KEY `userid` (`userid`);

--
-- Indexes for table `follwers`
--
ALTER TABLE `follwers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `followedUserid` (`followedUserid`),
  ADD KEY `follwerUserid` (`follwerUserid`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `postid` (`postid`),
  ADD KEY `userid` (`userid`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_ibfk_1` (`userid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `coments`
--
ALTER TABLE `coments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `follwers`
--
ALTER TABLE `follwers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `coments`
--
ALTER TABLE `coments`
  ADD CONSTRAINT `coments_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `coments_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `follwers`
--
ALTER TABLE `follwers`
  ADD CONSTRAINT `follwers_ibfk_1` FOREIGN KEY (`followedUserid`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `follwers_ibfk_2` FOREIGN KEY (`follwerUserid`) REFERENCES `users` (`id`);

--
-- Constraints for table `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `likes_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `users` (`id`);

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
