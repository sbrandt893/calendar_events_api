-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 22. Apr 2024 um 00:41
-- Server-Version: 10.4.32-MariaDB
-- PHP-Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `calendar`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `events`
--

INSERT INTO `events` (`id`, `date`, `title`, `description`) VALUES
(1, '2024-04-21', 'Test Title', 'Test Description'),
(2, '2024-04-21', 'Test Title', 'Test Description'),
(3, '2024-04-21', 'Test Title', 'Test Description'),
(4, '2024-04-21', 'Test Title2', 'Test Description2'),
(5, '2024-04-21', 'Test Title2', 'Test Description2'),
(6, '2024-04-21', 'Test Title', 'Test Description'),
(9, '2024-04-21', 'Test Title2', 'Test Description2'),
(11, '2024-04-21', 'Test Title2', 'Test Description2'),
(12, '2024-04-21', 'Test Title2', 'Test Description2'),
(14, '2024-04-21', 'Test Title2', 'Test Description2'),
(16, '2024-04-21', 'Test Title2', 'Test Description2'),
(17, '2024-04-21', 'Test Title2', 'Test Description2'),
(18, '2024-04-21', 'Test Title2', 'Test Description2'),
(19, '2024-04-21', 'Test Title2', 'Test Description2'),
(20, '2024-04-21', 'Test Title2', 'Test Description2'),
(21, '2024-04-21', 'Test Title2', 'Test Description2'),
(22, '2024-04-21', 'Test Title', 'Test Description'),
(23, '2024-04-21', 'Test Title', 'Test Description'),
(25, '2024-04-21', 'Test Title', 'Test Description'),
(26, '2024-04-21', 'Test Title', 'Test Description'),
(27, '2024-04-21', 'Test Title', 'Test Description'),
(28, '2024-04-21', 'Test Title', 'Test Description'),
(29, '2024-04-22', 'Test Title', 'Test Description'),
(30, '2024-04-22', 'Test Title', 'Test Description'),
(31, '2024-04-22', 'Test Title', 'Test Description'),
(32, '2024-04-22', 'Test Title', 'Test Description'),
(33, '2024-04-22', 'Test Title', 'Test Description'),
(34, '2024-04-22', 'Test Title', 'Test Description');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
