-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-11-2023 a las 07:06:45
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `mydb_3_tablas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `dni` varchar(20) NOT NULL,
  `nombre` varchar(20) DEFAULT NULL,
  `apellido` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`dni`, `nombre`, `apellido`) VALUES
('11.496.916', 'Clara', 'Barrionuevo'),
('17.037.523', 'Guieselle', 'Guevara'),
('21.355.847', 'Mabel', 'Avila'),
('28.619.955', 'Martha', 'Cruz'),
('31.643.135', 'Alejandro', 'Moreno'),
('32.238.035', 'Estella', 'Asis'),
('33.694.911', 'Maximiliano', 'Griffith'),
('34.328.642', 'Soledad', 'Parra'),
('35.241.269', 'Belen', 'Alamo'),
('35.542.153', 'Nicolas', 'Del Valle');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `id` int(20) NOT NULL,
  `concepto` varchar(20) DEFAULT NULL,
  `Clientes_dni` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `compras`
--

INSERT INTO `compras` (`id`, `concepto`, `Clientes_dni`) VALUES
(1, 'Pago efectivo', '11.496.916'),
(2, 'Pago tarjeta debito', '17.037.523'),
(3, 'Pago tarjeta credito', '21.355.847'),
(4, 'Pago con cheque', '28.619.955'),
(5, 'Pago en cuotas', '31.643.135'),
(6, 'Pago efectivo', '32.238.035'),
(7, 'Pago tarjeta debito', '33.694.911'),
(8, 'Pago tarjeta credito', '34.328.642'),
(9, 'Pago en cuotas', '35.241.269'),
(10, 'Pago con cheque', '35.542.153');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lineascompra`
--

CREATE TABLE `lineascompra` (
  `numero` int(20) NOT NULL,
  `compras_id` int(20) NOT NULL,
  `producto` varchar(20) NOT NULL,
  `importe` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `lineascompra`
--

INSERT INTO `lineascompra` (`numero`, `compras_id`, `producto`, `importe`) VALUES
(101, 1, 'cafe', 25000),
(102, 2, 'aceite', 34000),
(103, 3, 'nueces', 45000),
(104, 4, 'azucar', 44000),
(105, 5, 'garbanzos', 15000),
(106, 6, 'mate', 47000),
(107, 7, 'dulce de leche', 39000),
(108, 8, 'arroz', 44000),
(109, 9, 'pasta', 19000),
(110, 10, 'fideos', 49000);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`dni`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`id`,`Clientes_dni`),
  ADD KEY `fk_Compras_Clientes1_idx` (`Clientes_dni`);

--
-- Indices de la tabla `lineascompra`
--
ALTER TABLE `lineascompra`
  ADD PRIMARY KEY (`numero`,`compras_id`),
  ADD KEY `compras_id` (`compras_id`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`dni`) REFERENCES `compras` (`Clientes_dni`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `fk_Compras_Clientes1` FOREIGN KEY (`Clientes_dni`) REFERENCES `clientes` (`dni`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `lineascompra`
--
ALTER TABLE `lineascompra`
  ADD CONSTRAINT `lineascompra_ibfk_1` FOREIGN KEY (`compras_id`) REFERENCES `compras` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
