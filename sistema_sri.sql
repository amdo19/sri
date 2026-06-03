-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 01-06-2026 a las 00:17:21
-- Versión del servidor: 11.3.2-MariaDB
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sistema_sri`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `anulados`
--

CREATE TABLE `anulados` (
  `id` int(11) NOT NULL,
  `tipo_comprobante` varchar(50) DEFAULT NULL,
  `establecimiento` varchar(10) DEFAULT NULL,
  `punto_emision` varchar(10) DEFAULT NULL,
  `secuencial_desde` varchar(20) DEFAULT NULL,
  `secuencial_hasta` varchar(20) DEFAULT NULL,
  `numero_autorizacion` varchar(50) DEFAULT NULL,
  `tipo_emision` varchar(50) DEFAULT NULL,
  `fecha_anulacion` date DEFAULT NULL,
  `periodo_declarado` varchar(10) DEFAULT 'NO',
  `observaciones` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `id` int(11) NOT NULL,
  `no_identificacion` varchar(20) DEFAULT NULL,
  `cod_identif` varchar(5) DEFAULT NULL,
  `razon_social` varchar(150) DEFAULT NULL,
  `parte_relacionada` varchar(2) DEFAULT NULL,
  `cantidad_comprobantes` int(11) DEFAULT NULL,
  `tipo_emision` varchar(2) DEFAULT NULL,
  `tipo_comprobante` varchar(2) DEFAULT NULL,
  `fecha_emision` date DEFAULT NULL,
  `cod_establecimiento` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contribuyente`
--

CREATE TABLE `contribuyente` (
  `id_ruc` varchar(13) NOT NULL,
  `tipo_id` varchar(50) NOT NULL,
  `razon_social` varchar(255) NOT NULL,
  `direccion` varchar(255) DEFAULT '',
  `tipo_proveedor` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `contribuyente`
--

INSERT INTO `contribuyente` (`id_ruc`, `tipo_id`, `razon_social`, `direccion`, `tipo_proveedor`) VALUES
('1208107688001', 'R-Ruc', 'MARCILLO JOEL', 'Av. Maldonado y Flores, Babahoyo', '01-Persona Natural'),
('9999999999999', 'F-Consumidor Final', 'CONSUMIDOR FINAL', '', '01-Persona Natural');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gastos`
--

CREATE TABLE `gastos` (
  `id` int(11) NOT NULL,
  `no_identificacion` varchar(20) NOT NULL,
  `razon_social` varchar(150) DEFAULT NULL,
  `cantidad_comprobantes` int(11) DEFAULT 1,
  `tipo_documento` varchar(50) DEFAULT NULL,
  `tipo_comprobante` varchar(50) DEFAULT NULL,
  `numero_secuencial` varchar(50) DEFAULT NULL,
  `numero_autorizacion` varchar(50) DEFAULT NULL,
  `fecha_emision` date DEFAULT NULL,
  `base_imponible_0` decimal(10,2) DEFAULT 0.00,
  `base_imponible_iva` decimal(10,2) DEFAULT 0.00,
  `valor_iva` decimal(10,2) DEFAULT 0.00,
  `otros` decimal(10,2) DEFAULT 0.00,
  `total_documento` decimal(10,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `guias`
--

CREATE TABLE `guias` (
  `id` int(11) NOT NULL,
  `no_identificacion` varchar(20) NOT NULL,
  `razon_social` varchar(150) DEFAULT NULL,
  `cantidad_comprobantes` int(11) DEFAULT 1,
  `tipo_documento` varchar(50) DEFAULT NULL,
  `tipo_comprobante` varchar(50) DEFAULT NULL,
  `numero_secuencial` varchar(50) DEFAULT NULL,
  `numero_autorizacion` varchar(50) DEFAULT NULL,
  `fecha_emision` date DEFAULT NULL,
  `fecha_inicio_traslado` date DEFAULT NULL,
  `fecha_fin_traslado` date DEFAULT NULL,
  `ruta_trayecto` varchar(255) DEFAULT NULL,
  `placa_vehiculo` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parametros`
--

CREATE TABLE `parametros` (
  `id` int(11) NOT NULL,
  `ruc_empresa` varchar(13) NOT NULL,
  `razon_social` varchar(255) NOT NULL,
  `nombre_comercial` varchar(255) DEFAULT NULL,
  `email_contacto` varchar(100) DEFAULT NULL,
  `telefonos` varchar(50) DEFAULT NULL,
  `es_obligado_contabilidad` varchar(2) DEFAULT 'NO',
  `periodo_fiscal` int(11) NOT NULL,
  `iva_porcentaje` decimal(4,2) DEFAULT 15.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `parametros`
--

INSERT INTO `parametros` (`id`, `ruc_empresa`, `razon_social`, `nombre_comercial`, `email_contacto`, `telefonos`, `es_obligado_contabilidad`, `periodo_fiscal`, `iva_porcentaje`) VALUES
(2, '1206547893001', 'SERVICIOS TECNICOS BABAHOYO S.A.', 'SERVICIOS TEC', 'tecnic@gmail.com', '0923846514', 'SI', 2026, 15.00),
(3, '1205544332001', 'SERVICIOS TECNICOS BABAHOYO S.A.', 'SERVICIOS TEC', 'tecservices@gmail.com', '01234567893', 'SI', 2026, 15.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id` int(11) NOT NULL,
  `no_identificacion` varchar(20) DEFAULT NULL,
  `cod_identif` varchar(5) DEFAULT NULL,
  `razon_social` varchar(150) DEFAULT NULL,
  `parte_relacionada` varchar(2) DEFAULT NULL,
  `cantidad_comprobantes` int(11) DEFAULT NULL,
  `tipo_emision` varchar(2) DEFAULT NULL,
  `tipo_comprobante` varchar(2) DEFAULT NULL,
  `fecha_emision` date DEFAULT NULL,
  `cod_establecimiento` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `anulados`
--
ALTER TABLE `anulados`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `contribuyente`
--
ALTER TABLE `contribuyente`
  ADD PRIMARY KEY (`id_ruc`);

--
-- Indices de la tabla `gastos`
--
ALTER TABLE `gastos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `guias`
--
ALTER TABLE `guias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `parametros`
--
ALTER TABLE `parametros`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ruc_empresa` (`ruc_empresa`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `anulados`
--
ALTER TABLE `anulados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `gastos`
--
ALTER TABLE `gastos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `guias`
--
ALTER TABLE `guias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `parametros`
--
ALTER TABLE `parametros`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
