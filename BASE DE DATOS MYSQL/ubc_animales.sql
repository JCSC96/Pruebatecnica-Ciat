-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-04-2021 a las 00:10:40
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
-- Base de datos: `ubc_animales`
--

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
(2, 54);

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
(2, 93);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `propietario_animal`
--

CREATE TABLE `propietario_animal` (
  `ID` int(11) NOT NULL,
  `CEDULA` int(11) DEFAULT NULL,
  `NOMBRE` varchar(50) DEFAULT NULL,
  `ID_LATITUD` int(11) DEFAULT NULL,
  `ID_LONGITUD` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `propietario_animal`
--

INSERT INTO `propietario_animal` (`ID`, `CEDULA`, `NOMBRE`, `ID_LATITUD`, `ID_LONGITUD`) VALUES
(1, 1107080111, 'Harold', 1, 1),
(2, 1143867694, 'juan camilo', 1, 2);

--
-- Índices para tablas volcadas
--

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
-- Indices de la tabla `propietario_animal`
--
ALTER TABLE `propietario_animal`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK__latitud` (`ID_LATITUD`),
  ADD KEY `FK__longitud` (`ID_LONGITUD`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

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

--
-- AUTO_INCREMENT de la tabla `propietario_animal`
--
ALTER TABLE `propietario_animal`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `propietario_animal`
--
ALTER TABLE `propietario_animal`
  ADD CONSTRAINT `FK__latitud` FOREIGN KEY (`ID_LATITUD`) REFERENCES `latitud` (`ID`),
  ADD CONSTRAINT `FK__longitud` FOREIGN KEY (`ID_LONGITUD`) REFERENCES `longitud` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
