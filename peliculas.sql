-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-08-2021 a las 03:32:56
-- Versión del servidor: 10.4.20-MariaDB
-- Versión de PHP: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `peliculas`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_create` (IN `p_name` VARCHAR(64), IN `p_description` VARCHAR(256), IN `p_releaseDate` DATE, IN `p_boxOffice` INT(9))  BEGIN
	INSERT INTO movies (name, description, releaseDate, boxOffice) VALUES (p_name, p_description, p_releaseDate, p_boxOffice);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete` (IN `p_id` INT(4))  BEGIN
	UPDATE movies
    SET movies.status = 0
    WHERE movies.id = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_findAll` ()  BEGIN
	SELECT *
    FROM movies;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_findByID` (IN `p_id` INT(4))  BEGIN
	SELECT *
    FROM movies
    WHERE movies.id = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update` (IN `p_id` INT(4), IN `p_name` VARCHAR(64), IN `p_description` VARCHAR(256), IN `p_releaseDate` DATE, IN `p_boxOffice` INT(9))  BEGIN
	UPDATE movies
    SET movies.name = p_name,
    movies.description = p_description,
    movies.releaseDate = p_releaseDate,
    movies.boxOffice = p_boxOffice
    WHERE movies.id = p_id;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movies`
--

CREATE TABLE `movies` (
  `id` int(4) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `description` varchar(256) DEFAULT NULL,
  `releaseDate` date DEFAULT NULL,
  `boxOffice` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `movies`
--

INSERT INTO `movies` (`id`, `name`, `description`, `releaseDate`, `boxOffice`, `status`) VALUES
(1, 'Jurassic Park', 'Jurassic Park es una película de ciencia ficción y aventuras dirigida por el cineasta estadounidense Steven Spielberg y estrenada en 1993', '1993-06-09', 1029153882, 1),
(2, 'Carrie', 'Carrie es una película estadounidense de suspenso y terror psicológico de 1976 dirigida por Brian De Palma y escrita por Lawrence D. Cohen.', '1976-11-03', 33800000, 0),
(3, 'Spider-Man 2', 'Spider-Man 2 es una película de superhéroes estadounidense de 2004 dirigida por Sam Raimi y escrita por Alvin Sargent a partir de una historia de Alfred Gough, Miles Millar y Michael Chabon.', '2004-06-22', 789000000, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `movies`
--
ALTER TABLE `movies`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
