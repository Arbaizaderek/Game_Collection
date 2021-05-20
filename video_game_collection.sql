-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 20, 2021 at 05:17 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `video_game_collection`
--

-- --------------------------------------------------------

--
-- Table structure for table `console`
--

CREATE TABLE `console` (
  `id_console` int(11) NOT NULL,
  `console_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `console`
--

INSERT INTO `console` (`id_console`, `console_name`) VALUES
(1, 'PlayStation 1'),
(2, 'PlayStation 2'),
(3, 'PlayStation 3'),
(4, 'PlayStation 4');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `user_password` varchar(100) NOT NULL,
  `user_role` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `user_name`, `user_password`, `user_role`) VALUES
(1, 'arbaizaderek', 'derek', 1),
(2, 'nicolas', 'nico', 0);

-- --------------------------------------------------------

--
-- Table structure for table `videogame`
--

CREATE TABLE `videogame` (
  `videogame_id` int(11) NOT NULL,
  `videogame_title` varchar(250) NOT NULL,
  `videogame_photo` varchar(500) NOT NULL,
  `videogame_console` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `videogame`
--

INSERT INTO `videogame` (`videogame_id`, `videogame_title`, `videogame_photo`, `videogame_console`) VALUES
(1, 'Horizon Zero Dawn', 'wwwwwwwww.jpg', 'PlayStation 4'),
(2, 'The Shadow of the Tomb Raider', 'The_Shadow_of_the_Tomb Raider.jpg', 'PlayStation 4'),
(5, 'The Rise of the Tomb Raider', 'artworks-000269165432-srcu2b-t500x500.jpg2021085912', 'PlayStation 4'),
(7, 'God of War', 'artworks-000269165432-srcu2b-t500x500.jpg2021090811', 'PlayStation 4');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `console`
--
ALTER TABLE `console`
  ADD PRIMARY KEY (`id_console`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `videogame`
--
ALTER TABLE `videogame`
  ADD PRIMARY KEY (`videogame_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `console`
--
ALTER TABLE `console`
  MODIFY `id_console` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `videogame`
--
ALTER TABLE `videogame`
  MODIFY `videogame_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
