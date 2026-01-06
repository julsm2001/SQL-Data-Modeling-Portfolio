-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 06-01-2026 a las 16:16:06
-- Versión del servidor: 9.1.0
-- Versión de PHP: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `hotel`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

DROP TABLE IF EXISTS `clientes`;
CREATE TABLE IF NOT EXISTS `clientes` (
  `ClienteID` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) DEFAULT NULL,
  `Apellido` varchar(50) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Telefono` varchar(20) DEFAULT NULL,
  `Ciudad` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ClienteID`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`ClienteID`, `Nombre`, `Apellido`, `Email`, `Telefono`, `Ciudad`) VALUES
(1, 'Juan', 'Pérez', 'juan.perez@email.com', '555-0101', 'Cuenca'),
(2, 'Maria', 'García', 'maria.garcia@email.com', '555-0102', 'Guayaquil'),
(3, 'Carlos', 'López', 'carlos.lopez@email.com', '555-0103', 'Lima'),
(4, 'Ana', 'Martínez', 'ana.martinez@email.com', '555-0104', 'Quito'),
(5, 'Luis', 'Sánchez', 'luis.sanchez@email.com', '555-0105', 'Madrid');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturacion`
--

DROP TABLE IF EXISTS `facturacion`;
CREATE TABLE IF NOT EXISTS `facturacion` (
  `FacturaID` int NOT NULL AUTO_INCREMENT,
  `ReservaID` int DEFAULT NULL,
  `MontoTotal` decimal(10,2) DEFAULT NULL,
  `MetodoPago` varchar(30) DEFAULT NULL,
  `FechaPago` date DEFAULT NULL,
  PRIMARY KEY (`FacturaID`),
  KEY `ReservaID` (`ReservaID`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `facturacion`
--

INSERT INTO `facturacion` (`FacturaID`, `ReservaID`, `MontoTotal`, `MetodoPago`, `FechaPago`) VALUES
(1, 1, 200.00, 'Tarjeta de Crédito', '2023-10-05'),
(2, 2, 160.00, 'Efectivo', '2023-10-04'),
(3, 3, 400.00, 'Tarjeta de Débito', '2023-10-15'),
(4, 4, 300.00, 'Transferencia', '2023-11-03'),
(5, 5, 250.00, 'Efectivo', '2023-11-10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `habitaciones`
--

DROP TABLE IF EXISTS `habitaciones`;
CREATE TABLE IF NOT EXISTS `habitaciones` (
  `HabitacionID` int NOT NULL AUTO_INCREMENT,
  `Numero` int DEFAULT NULL,
  `Tipo` varchar(30) DEFAULT NULL,
  `PrecioPorNoche` decimal(10,2) DEFAULT NULL,
  `Estado` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`HabitacionID`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `habitaciones`
--

INSERT INTO `habitaciones` (`HabitacionID`, `Numero`, `Tipo`, `PrecioPorNoche`, `Estado`) VALUES
(1, 101, 'Simple', 50.00, 'Ocupada'),
(2, 102, 'Doble', 80.00, 'Disponible'),
(3, 103, 'Suite', 150.00, 'Disponible'),
(4, 104, 'Doble', 80.00, 'Ocupada'),
(5, 105, 'Simple', 50.00, 'Mantenimiento');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservas`
--

DROP TABLE IF EXISTS `reservas`;
CREATE TABLE IF NOT EXISTS `reservas` (
  `ReservaID` int NOT NULL AUTO_INCREMENT,
  `ClienteID` int DEFAULT NULL,
  `HabitacionID` int DEFAULT NULL,
  `FechaEntrada` date DEFAULT NULL,
  `FechaSalida` date DEFAULT NULL,
  PRIMARY KEY (`ReservaID`),
  KEY `ClienteID` (`ClienteID`),
  KEY `HabitacionID` (`HabitacionID`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `reservas`
--

INSERT INTO `reservas` (`ReservaID`, `ClienteID`, `HabitacionID`, `FechaEntrada`, `FechaSalida`) VALUES
(1, 1, 1, '2023-10-01', '2023-10-05'),
(2, 2, 4, '2023-10-02', '2023-10-04'),
(3, 3, 2, '2023-10-10', '2023-10-15'),
(4, 4, 3, '2023-11-01', '2023-11-03'),
(5, 5, 1, '2023-11-05', '2023-11-10');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_clientes_cuenca`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `vista_clientes_cuenca`;
CREATE TABLE IF NOT EXISTS `vista_clientes_cuenca` (
`Apellido` varchar(50)
,`Email` varchar(100)
,`Nombre` varchar(50)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_detalle_reservas`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `vista_detalle_reservas`;
CREATE TABLE IF NOT EXISTS `vista_detalle_reservas` (
`Apellido_Cliente` varchar(50)
,`FechaEntrada` date
,`FechaSalida` date
,`Nombre_Cliente` varchar(50)
,`Numero_Habitacion` int
,`ReservaID` int
,`Tipo_Habitacion` varchar(30)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_habitaciones_disponibles`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `vista_habitaciones_disponibles`;
CREATE TABLE IF NOT EXISTS `vista_habitaciones_disponibles` (
`Numero` int
,`PrecioPorNoche` decimal(10,2)
,`Tipo` varchar(30)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_clientes_cuenca`
--
DROP TABLE IF EXISTS `vista_clientes_cuenca`;

DROP VIEW IF EXISTS `vista_clientes_cuenca`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_clientes_cuenca`  AS SELECT `clientes`.`Nombre` AS `Nombre`, `clientes`.`Apellido` AS `Apellido`, `clientes`.`Email` AS `Email` FROM `clientes` WHERE (`clientes`.`Ciudad` = 'Cuenca') ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_detalle_reservas`
--
DROP TABLE IF EXISTS `vista_detalle_reservas`;

DROP VIEW IF EXISTS `vista_detalle_reservas`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_detalle_reservas`  AS SELECT `r`.`ReservaID` AS `ReservaID`, `c`.`Nombre` AS `Nombre_Cliente`, `c`.`Apellido` AS `Apellido_Cliente`, `h`.`Numero` AS `Numero_Habitacion`, `h`.`Tipo` AS `Tipo_Habitacion`, `r`.`FechaEntrada` AS `FechaEntrada`, `r`.`FechaSalida` AS `FechaSalida` FROM ((`reservas` `r` join `clientes` `c` on((`r`.`ClienteID` = `c`.`ClienteID`))) join `habitaciones` `h` on((`r`.`HabitacionID` = `h`.`HabitacionID`))) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_habitaciones_disponibles`
--
DROP TABLE IF EXISTS `vista_habitaciones_disponibles`;

DROP VIEW IF EXISTS `vista_habitaciones_disponibles`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_habitaciones_disponibles`  AS SELECT `habitaciones`.`Numero` AS `Numero`, `habitaciones`.`Tipo` AS `Tipo`, `habitaciones`.`PrecioPorNoche` AS `PrecioPorNoche` FROM `habitaciones` WHERE (`habitaciones`.`Estado` = 'Disponible') ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
