-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 15-06-2020 a las 12:17:23
-- Versión del servidor: 10.1.31-MariaDB
-- Versión de PHP: 7.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `optica`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `client`
--

CREATE TABLE `client` (
  `id_client` int(11) NOT NULL,
  `nom` varchar(25) NOT NULL,
  `primer_cognom` varchar(25) NOT NULL,
  `segon_cognom` varchar(25) NOT NULL,
  `carrer` varchar(25) NOT NULL,
  `numero` varchar(5) NOT NULL,
  `pis` varchar(3) NOT NULL,
  `porta` varchar(3) NOT NULL,
  `ciutat` varchar(20) NOT NULL,
  `codi_postal` varchar(20) NOT NULL,
  `telefon` varchar(20) NOT NULL,
  `email` varchar(25) NOT NULL,
  `data_registres` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `recomenat` enum('si','no') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleat`
--

CREATE TABLE `empleat` (
  `id_empleat` int(11) NOT NULL,
  `nom` varchar(25) NOT NULL,
  `primer_cognom` varchar(25) NOT NULL,
  `segon_cognom` varchar(25) NOT NULL,
  `ulleres_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveidor`
--

CREATE TABLE `proveidor` (
  `id_proveidor` int(11) NOT NULL,
  `nom` varchar(25) NOT NULL,
  `primer_cognom` varchar(25) NOT NULL,
  `segon_cognom` varchar(25) NOT NULL,
  `carrer` varchar(25) NOT NULL,
  `numero` varchar(5) NOT NULL,
  `pis` varchar(3) NOT NULL,
  `porta` varchar(3) NOT NULL,
  `ciutat` varchar(20) NOT NULL,
  `codi_postal` varchar(20) NOT NULL,
  `pais` varchar(25) NOT NULL,
  `telefon` varchar(20) NOT NULL,
  `fax` varchar(20) NOT NULL,
  `nif` varchar(20) NOT NULL,
  `ulleres_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ulleres`
--

CREATE TABLE `ulleres` (
  `id_ulleres` int(11) NOT NULL,
  `marca` varchar(25) NOT NULL,
  `grad_vidre_dret` float NOT NULL,
  `grad_vidre_esq` float NOT NULL,
  `tipus_muntura` enum('flotant','pasta','metàl·lica') NOT NULL,
  `color_muntura` varchar(25) NOT NULL,
  `color_vidre` varchar(25) NOT NULL,
  `preu` double NOT NULL,
  `provedior_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `id_venta` int(11) NOT NULL,
  `empleat_id` int(11) NOT NULL,
  `ullera_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id_client`);

--
-- Indices de la tabla `empleat`
--
ALTER TABLE `empleat`
  ADD PRIMARY KEY (`id_empleat`);

--
-- Indices de la tabla `proveidor`
--
ALTER TABLE `proveidor`
  ADD PRIMARY KEY (`id_proveidor`);

--
-- Indices de la tabla `ulleres`
--
ALTER TABLE `ulleres`
  ADD PRIMARY KEY (`id_ulleres`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `client`
--
ALTER TABLE `client`
  MODIFY `id_client` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `empleat`
--
ALTER TABLE `empleat`
  MODIFY `id_empleat` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `proveidor`
--
ALTER TABLE `proveidor`
  MODIFY `id_proveidor` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ulleres`
--
ALTER TABLE `ulleres`
  MODIFY `id_ulleres` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `client_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `ulleres` (`id_ulleres`);

--
-- Filtros para la tabla `ulleres`
--
ALTER TABLE `ulleres`
  ADD CONSTRAINT `ulleres_ibfk_1` FOREIGN KEY (`id_ulleres`) REFERENCES `proveidor` (`id_proveidor`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
