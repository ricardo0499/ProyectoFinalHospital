-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-07-2021 a las 17:56:54
-- Versión del servidor: 10.4.18-MariaDB
-- Versión de PHP: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `hospital`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paciente`
--

CREATE TABLE `paciente` (
  `id` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `cedula` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `fecha` varchar(15) NOT NULL,
  `hora` varchar(15) NOT NULL,
  `medico` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `paciente`
--

INSERT INTO `paciente` (`id`, `nombre`, `cedula`, `email`, `fecha`, `hora`, `medico`) VALUES
(2, 'Anais Vergara', '3-214-447', 'ana@anas.com', '2021-07-25', '1:00 pm', 'Medico 3'),
(3, 'José Vallarino', '2-890-6789', 'jose@jose.com', '2021-07-22', '9:00 am', 'Medico 2'),
(4, 'Andrés Beitia', '6-236-1245', 'and@andres.com', '2021-07-23', '12:00 pm', 'Medico 3'),
(5, 'María Batista', '8-231-456', 'mari@mari.com', '2021-07-22', '1:00 pm', 'Medico 2'),
(6, 'Carla González', '9-124-832', 'carla@carla.com', '2021-07-24', '11:00 am', 'Medico 3'),
(7, 'Rebeca Famanía', '5-789-145', 'rebe@rebe.com', '2021-07-25', '8:00 am', 'Medico 2'),
(8, 'Edward Gómez', '1-124-6780', 'edward@gomez.com', '2021-07-26', '10:00 am', 'Medico 3'),
(9, 'Bill Thompson', '4-1234-789', 'bill@bill.com', '2021-07-25', '9:00 am', 'Medico 1'),
(10, 'Valeria Martínez', '4-902-1242', 'vale@vale.com', '2021-07-24', '7:00 am', 'Medico 1'),
(30, 'Samuel Rodriguez', '2-802-412', 'sam.rod@gmail.com', '2021-07-23', '11:00 am', 'Medico 2'),
(31, 'Raul Candanedo', '2-456-234', 'raul.can@gmail.com', '2021-07-28', '12:00 pm', 'Medico 2'),
(33, 'Theo Pereira', '8-021-345', 'theo.p@gmail.com', '2021-07-24', '2:00 pm', 'Medico 3'),
(37, 'Ricardo Pitti', '4-802-157', 'pittiricardo7@gmail.com', '2021-07-14', '7:00 am', 'Medico 1'),
(39, 'Jacobo Ramos', '5-789-123', 'ejemplo@gm.com', '2021-07-31', '7:00 am', 'Medico 1'),
(40, 'Deybi Mojica', '8-930-200', 'deybi@gmail.com', '2021-07-22', '12:00 pm', 'Medico 3'),
(44, 'Ana Perurena', '8-993-2077', 'ana.perurena@gmail.com', '2021-08-07', '2:00 pm', 'Medico 2'),
(46, 'Juan Corrales', '5-678-234', 'juan@juan.com', '2021-07-22', '3:00 pm', 'Medico 3'),
(47, 'Francisco Jimenez', '6-902-456', 'fran@fran.com', '2021-07-21', '9:00 am', 'Medico 2'),
(48, 'Olivia Hernandez', '4-872-345', 'olivia@olivia.com', '2021-07-22', '11:00 am', 'Medico 1'),
(50, 'Maria Caballero', '4-093-467', 'maria@castillo.com', '2021-07-24', '10:00 am', 'Medico 2'),
(51, 'Carlos Manu', '6-9098-1234', 'asda@gmail.com', '2021-07-30', '9:00 am', 'Medico 3');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `contrasena` varchar(30) NOT NULL,
  `nivel` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `nombre`, `contrasena`, `nivel`) VALUES
(1, 'Medico 1', '12345678', 2),
(2, 'Medico 2', '12345678', 2),
(3, 'Medico 3', '12345678', 2),
(4, 'Recepcion', '12345678', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `paciente`
--
ALTER TABLE `paciente`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `fecha` (`fecha`,`hora`),
  ADD UNIQUE KEY `fecha_2` (`fecha`,`hora`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `paciente`
--
ALTER TABLE `paciente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
