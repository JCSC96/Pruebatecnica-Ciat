-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-04-2021 a las 00:10:57
-- Versión del servidor: 10.4.17-MariaDB
-- Versión de PHP: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `zona_desforestacion`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `area_desfo`
--

CREATE TABLE `area_desfo` (
  `ID` int(11) NOT NULL,
  `CODIGO` int(11) DEFAULT NULL,
  `NOMBRE` varchar(50) DEFAULT NULL,
  `ID_LATITUD` int(11) DEFAULT NULL,
  `ID_LONGITUD` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `area_desfo`
--

INSERT INTO `area_desfo` (`ID`, `CODIGO`, `NOMBRE`, `ID_LATITUD`, `ID_LONGITUD`) VALUES
(1, 111, 'Bosque ', 1, 1),
(2, 112, 'selva', 2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `latitud`
--

CREATE TABLE `latitud` (
  `ID` int(11) NOT NULL,
  `VALOR` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `latitud`
--

INSERT INTO `latitud` (`ID`, `VALOR`) VALUES
(1, 10),
(2, 20);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `longitud`
--

CREATE TABLE `longitud` (
  `ID` int(11) NOT NULL,
  `VALOR` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `longitud`
--

INSERT INTO `longitud` (`ID`, `VALOR`) VALUES
(1, -10),
(2, -20);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `area_desfo`
--
ALTER TABLE `area_desfo`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK__latitud` (`ID_LATITUD`),
  ADD KEY `FK__longitud` (`ID_LONGITUD`);

--
-- Indices de la tabla `latitud`
--
ALTER TABLE `latitud`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `longitud`
--
ALTER TABLE `longitud`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `area_desfo`
--
ALTER TABLE `area_desfo`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `latitud`
--
ALTER TABLE `latitud`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `longitud`
--
ALTER TABLE `longitud`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
