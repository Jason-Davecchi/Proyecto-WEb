-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-12-2020 a las 04:53:15
-- Versión del servidor: 10.4.16-MariaDB
-- Versión de PHP: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `verduleria`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `boleta`
--

CREATE TABLE `boleta` (
  `idBoleta` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `cliente` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentario`
--

CREATE TABLE `comentario` (
  `idComentario` int(11) NOT NULL,
  `coment` varchar(500) NOT NULL,
  `fecha` date NOT NULL,
  `usuarioComent` varchar(10) NOT NULL,
  `prodComent` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle`
--

CREATE TABLE `detalle` (
  `idDetalle` int(11) NOT NULL,
  `valor` int(11) NOT NULL,
  `cantidadPro` int(11) NOT NULL,
  `boleta` int(11) NOT NULL,
  `prod` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `idProducto` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `precio` int(11) NOT NULL,
  `descrip` varchar(45) NOT NULL,
  `cantVendida` int(11) NOT NULL,
  `imagen` varchar(100) NOT NULL,
  `tipo` varchar(10) DEFAULT NULL,
  `cantidad` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`idProducto`, `nombre`, `precio`, `descrip`, `cantVendida`, `imagen`, `tipo`, `cantidad`) VALUES
(1, 'Kiwi', 3000, 'Kiwi granel', 21, 'assets/image/kiwi.png', 'fruta', 'kilo'),
(2, 'Lechuga', 250, 'Lechuga Francesa', 30, 'assets/image/lechuga.png', 'verdura', 'unidad'),
(3, 'Manzana Verde', 1300, 'Manzana verde', 12, 'assets/image/Manzana Verde.png', 'fruta', 'kilo'),
(4, 'Manzana Roja', 800, 'Manzana Roja', 12, 'assets/image/Manzana roja.png', 'fruta', 'kilo'),
(5, 'Limon', 890, 'Limon fresco', 16, 'assets/image/limon.png', 'fruta', 'kilo'),
(6, 'Palta Negra', 3490, 'Aguacate', 9, 'assets/image/Palta Negra.png', 'fruta', 'kilo'),
(7, 'Melon calameño', 590, 'Melon calameño fresco', 10, 'assets/image/melon calameño.png', 'fruta', 'unidad'),
(8, 'Naranja', 1590, 'Naranja granel', 15, 'assets/image/Naranja.png', 'fruta', 'kilo'),
(9, 'Pimiento Rojo', 590, 'Pimiento Rojo', 3, 'assets/image/Pimiento rojo.png', 'verdura', 'unidad'),
(10, 'Pimiento Verde', 590, 'Pimiento Verde', 9, 'assets/image/Pimiento verde.png', 'verdura', 'unidad'),
(11, 'Melon tuna', 1500, 'Melon tuna fresco', 30, 'assets/image/Melon tuna.png', 'fruta', 'unidad'),
(12, 'Palta Fuerte', 3985, 'Palta de cascara suave y delgada', 23, 'assets/image/Palta Fuerte.png', 'fruta', 'kilo'),
(13, 'Palta Hass', 4500, 'Palta cremosa de cascara dura', 69, 'assets/image/PaltaHass.png', 'fruta', 'kilo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `rut` varchar(10) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `correo` varchar(45) NOT NULL,
  `contrasena` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`rut`, `nombre`, `correo`, `contrasena`) VALUES
('19296237-4', 'Esteban Lechuga', 'EstebanLechu@gmail.com', 'mostaza123'),
('20068333-1', 'Jason Davecchi', 'JasonDave@gmail.com', 'maradodead');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `boleta`
--
ALTER TABLE `boleta`
  ADD PRIMARY KEY (`idBoleta`),
  ADD KEY `cliente` (`cliente`);

--
-- Indices de la tabla `comentario`
--
ALTER TABLE `comentario`
  ADD PRIMARY KEY (`idComentario`),
  ADD KEY `usuarioComent` (`usuarioComent`),
  ADD KEY `prodComent` (`prodComent`);

--
-- Indices de la tabla `detalle`
--
ALTER TABLE `detalle`
  ADD PRIMARY KEY (`idDetalle`),
  ADD KEY `boleta` (`boleta`),
  ADD KEY `prod` (`prod`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`idProducto`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`rut`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `boleta`
--
ALTER TABLE `boleta`
  MODIFY `idBoleta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `comentario`
--
ALTER TABLE `comentario`
  MODIFY `idComentario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalle`
--
ALTER TABLE `detalle`
  MODIFY `idDetalle` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `idProducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `boleta`
--
ALTER TABLE `boleta`
  ADD CONSTRAINT `boleta_ibfk_1` FOREIGN KEY (`cliente`) REFERENCES `usuario` (`rut`);

--
-- Filtros para la tabla `comentario`
--
ALTER TABLE `comentario`
  ADD CONSTRAINT `comentario_ibfk_1` FOREIGN KEY (`usuarioComent`) REFERENCES `usuario` (`rut`),
  ADD CONSTRAINT `comentario_ibfk_2` FOREIGN KEY (`prodComent`) REFERENCES `producto` (`idProducto`);

--
-- Filtros para la tabla `detalle`
--
ALTER TABLE `detalle`
  ADD CONSTRAINT `detalle_ibfk_1` FOREIGN KEY (`boleta`) REFERENCES `boleta` (`idBoleta`),
  ADD CONSTRAINT `detalle_ibfk_2` FOREIGN KEY (`prod`) REFERENCES `producto` (`idProducto`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
