-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-09-2026 a las 03:09:16
-- Versión del servidor: 10.1.38-MariaDB
-- Versión de PHP: 7.1.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `horariosgauss`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrera`
--

CREATE TABLE `carrera` (
  `idcarrera` int(11) NOT NULL,
  `carreramat` varchar(30) COLLATE utf8_bin NOT NULL,
  `statuscarrera` varchar(5) COLLATE utf8_bin NOT NULL DEFAULT 'ALTA'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `carrera`
--

INSERT INTO `carrera` (`idcarrera`, `carreramat`, `statuscarrera`) VALUES
(1, 'Ciencias de la informatica ', 'ALTA'),
(2, 'Tecnico en informatica', 'BAJA'),
(3, 'Diseño grafico', 'ALTA'),
(4, 'Derecho', 'ALTA'),
(5, 'Medicina general', 'BAJA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciclos`
--

CREATE TABLE `ciclos` (
  `idciclo` int(11) NOT NULL,
  `ciclo` varchar(20) COLLATE utf8_bin NOT NULL,
  `statusciclo` varchar(4) COLLATE utf8_bin NOT NULL DEFAULT 'ALTA'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `ciclos`
--

INSERT INTO `ciclos` (`idciclo`, `ciclo`, `statusciclo`) VALUES
(1, '2020 - 2021/1', 'ALTA'),
(2, '2020 - 2021/2', 'ALTA'),
(3, '2020 - 2021/', 'BAJA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `disponibilidad`
--

CREATE TABLE `disponibilidad` (
  `idhorario` int(11) NOT NULL,
  `id_profesor` int(11) NOT NULL,
  `id_ciclo` int(11) NOT NULL,
  `id_materia` int(11) NOT NULL,
  `id_grupo` int(11) NOT NULL,
  `dia` varchar(15) COLLATE utf8_bin NOT NULL,
  `hora` varchar(15) COLLATE utf8_bin NOT NULL,
  `estatusdisp` varchar(4) COLLATE utf8_bin NOT NULL DEFAULT 'ALTA'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `disponibilidad`
--

INSERT INTO `disponibilidad` (`idhorario`, `id_profesor`, `id_ciclo`, `id_materia`, `id_grupo`, `dia`, `hora`, `estatusdisp`) VALUES
(1, 1, 2, 4, 1, 'Lunes', '7:00 - 8:00', 'ALTA'),
(2, 2, 2, 3, 5, 'Lunes', '8:00 - 9:00', 'ALTA'),
(3, 1, 2, 5, 3, 'Lunes', '8:00 - 9:00', 'ALTA'),
(4, 1, 2, 5, 2, 'Lunes', '10:00 - 11:00', 'ALTA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupos`
--

CREATE TABLE `grupos` (
  `idgrupo` int(11) NOT NULL,
  `descripciongrupo` varchar(30) COLLATE utf8_bin NOT NULL,
  `carrera` int(11) NOT NULL,
  `estatusgrupo` varchar(5) COLLATE utf8_bin NOT NULL DEFAULT 'ALTA'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `grupos`
--

INSERT INTO `grupos` (`idgrupo`, `descripciongrupo`, `carrera`, `estatusgrupo`) VALUES
(1, 'LCI-1501', 1, 'ALTA'),
(2, 'BI 1501 ', 2, 'ALTA'),
(3, 'LCI 1201', 1, 'ALTA'),
(4, 'LCI-1601', 1, 'ALTA'),
(5, 'LCI-1401', 1, 'ALTA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horaros`
--

CREATE TABLE `horaros` (
  `cicloescolar` varchar(30) COLLATE utf8_bin NOT NULL,
  `idhorario` int(11) NOT NULL,
  `idmateria` int(11) NOT NULL,
  `idgrupo` int(11) NOT NULL,
  `idprofesor` int(11) NOT NULL,
  `dia` varchar(10) COLLATE utf8_bin NOT NULL,
  `hora` varchar(20) COLLATE utf8_bin NOT NULL,
  `estatushorario` varchar(5) COLLATE utf8_bin NOT NULL DEFAULT 'ALTA'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materias`
--

CREATE TABLE `materias` (
  `idmateria` int(11) NOT NULL,
  `descripcionmateria` varchar(70) COLLATE utf8_bin NOT NULL,
  `carreramateria` varchar(30) COLLATE utf8_bin NOT NULL,
  `estatus` varchar(5) COLLATE utf8_bin NOT NULL DEFAULT 'ALTA'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `materias`
--

INSERT INTO `materias` (`idmateria`, `descripcionmateria`, `carreramateria`, `estatus`) VALUES
(1, 'Teleinformatica', '2', 'BAJA'),
(2, 'Sistemas manejadores de la bas', '1', 'BAJA'),
(3, 'Matematicas III', '2', 'ALTA'),
(4, 'Matematicas I', '2', 'ALTA'),
(5, 'Programación I', '1', 'ALTA'),
(6, 'Programación II', '1', 'BAJA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesores`
--

CREATE TABLE `profesores` (
  `idprofesor` int(11) NOT NULL,
  `nombreprof` varchar(15) COLLATE utf8_bin NOT NULL,
  `apaternoprof` varchar(15) COLLATE utf8_bin NOT NULL,
  `amaternoprof` varchar(15) COLLATE utf8_bin NOT NULL,
  `domicilioprof` varchar(70) COLLATE utf8_bin NOT NULL,
  `telefonoprof` varchar(30) COLLATE utf8_bin NOT NULL,
  `mailprof` varchar(35) COLLATE utf8_bin NOT NULL,
  `estatusprof` varchar(5) COLLATE utf8_bin NOT NULL DEFAULT 'ALTA'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `profesores`
--

INSERT INTO `profesores` (`idprofesor`, `nombreprof`, `apaternoprof`, `amaternoprof`, `domicilioprof`, `telefonoprof`, `mailprof`, `estatusprof`) VALUES
(1, 'Joaquin', 'Gonzalez', 'Hernandez', 'CDMX', '5544444444', 'uno@hotmail.com', 'ALTA'),
(2, 'Pedro', 'Flores', 'Mendieta', 'GDJ', '5566776677', 'dos@hotmail.com', 'ALTA'),
(3, 'Felipe', 'Dorantes', 'Gomez', 'MORELOS', '5577667766', 'tres@hotmail.com', 'ALTA'),
(4, 'Gerardo', 'Fernandez', 'Juarez', 'MONTERREY', '5544554455', 'cuatro@hotmail.com', 'ALTA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `username` varchar(12) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `auth_level` tinyint(3) UNSIGNED NOT NULL,
  `banned` enum('0','1') NOT NULL DEFAULT '0',
  `passwd` varchar(60) NOT NULL,
  `passwd_recovery_code` varchar(60) DEFAULT NULL,
  `passwd_recovery_date` datetime DEFAULT NULL,
  `passwd_modified_at` datetime DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`user_id`, `username`, `email`, `auth_level`, `banned`, `passwd`, `passwd_recovery_code`, `passwd_recovery_date`, `passwd_modified_at`, `last_login`, `created_at`, `modified_at`) VALUES
(3901033069, 'admin', 'skunkbot@example.com', 1, '0', '$2y$11$xJu1BBtXbE6idlY8sS4.KOkVjggY81l/lRE68sUQEQ4szX02jqjiC', NULL, NULL, '2022-07-22 21:51:54', '2022-07-24 00:52:43', '2022-07-23 04:47:18', '2022-07-23 22:52:43');

--
-- Disparadores `users`
--
DELIMITER $$
CREATE TRIGGER `ca_passwd_trigger` BEFORE UPDATE ON `users` FOR EACH ROW BEGIN
    IF ((NEW.passwd <=> OLD.passwd) = 0) THEN
        SET NEW.passwd_modified_at = NOW();
    END IF;
END
$$
DELIMITER ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carrera`
--
ALTER TABLE `carrera`
  ADD PRIMARY KEY (`idcarrera`);

--
-- Indices de la tabla `ciclos`
--
ALTER TABLE `ciclos`
  ADD PRIMARY KEY (`idciclo`);

--
-- Indices de la tabla `disponibilidad`
--
ALTER TABLE `disponibilidad`
  ADD PRIMARY KEY (`idhorario`);

--
-- Indices de la tabla `grupos`
--
ALTER TABLE `grupos`
  ADD PRIMARY KEY (`idgrupo`);

--
-- Indices de la tabla `horaros`
--
ALTER TABLE `horaros`
  ADD PRIMARY KEY (`idhorario`);

--
-- Indices de la tabla `materias`
--
ALTER TABLE `materias`
  ADD PRIMARY KEY (`idmateria`);

--
-- Indices de la tabla `profesores`
--
ALTER TABLE `profesores`
  ADD PRIMARY KEY (`idprofesor`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `carrera`
--
ALTER TABLE `carrera`
  MODIFY `idcarrera` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `ciclos`
--
ALTER TABLE `ciclos`
  MODIFY `idciclo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `disponibilidad`
--
ALTER TABLE `disponibilidad`
  MODIFY `idhorario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `grupos`
--
ALTER TABLE `grupos`
  MODIFY `idgrupo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `horaros`
--
ALTER TABLE `horaros`
  MODIFY `idhorario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `materias`
--
ALTER TABLE `materias`
  MODIFY `idmateria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `profesores`
--
ALTER TABLE `profesores`
  MODIFY `idprofesor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
