-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3308
-- Tiempo de generación: 04-03-2020 a las 08:40:57
-- Versión del servidor: 8.0.18
-- Versión de PHP: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `avisoshn`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `anuncios`
--

DROP TABLE IF EXISTS `anuncios`;
CREATE TABLE IF NOT EXISTS `anuncios` (
  `idAnuncios` int(11) NOT NULL AUTO_INCREMENT,
  `idUsuario` int(11) NOT NULL,
  `idcategoria` int(11) NOT NULL,
  `idMunicipios` int(11) NOT NULL,
  `precio` decimal(45,0) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `fechaPublicacion` date NOT NULL,
  `estadoArticulo` varchar(20) DEFAULT NULL,
  `estadoAnuncio` varchar(1) NOT NULL,
  `fechaLimite` date DEFAULT NULL,
  PRIMARY KEY (`idAnuncios`),
  KEY `fk_anuncios_categoria1` (`idcategoria`),
  KEY `fk_anuncios_municipios1` (`idMunicipios`),
  KEY `fk_anuncios_Usuario1` (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calificacionescomprador`
--

DROP TABLE IF EXISTS `calificacionescomprador`;
CREATE TABLE IF NOT EXISTS `calificacionescomprador` (
  `idcalificacionesComprador` int(11) NOT NULL,
  `cantidadEstrellas` int(1) DEFAULT NULL,
  `comentarios` varchar(500) DEFAULT NULL,
  `idUsuario` int(11) NOT NULL,
  PRIMARY KEY (`idcalificacionesComprador`),
  KEY `fk_calificacionesComprador_Usuario1` (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calificacionesvendedor`
--

DROP TABLE IF EXISTS `calificacionesvendedor`;
CREATE TABLE IF NOT EXISTS `calificacionesvendedor` (
  `idCalificacionVendedor` varchar(45) NOT NULL,
  `cantidadEstrellas` int(11) DEFAULT NULL,
  `comentarios` varchar(500) DEFAULT NULL,
  `idUsuario` int(11) NOT NULL,
  PRIMARY KEY (`idCalificacionVendedor`),
  KEY `fk_calificacionesVendedor_Usuario1` (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

DROP TABLE IF EXISTS `categoria`;
CREATE TABLE IF NOT EXISTS `categoria` (
  `idcategoria` int(11) NOT NULL,
  `nombreCategoria` varchar(80) DEFAULT NULL,
  `idgrupocategoria` int(8) NOT NULL,
  PRIMARY KEY (`idcategoria`),
  KEY `fk_categoria_grupocategoria1` (`idgrupocategoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`idcategoria`, `nombreCategoria`, `idgrupocategoria`) VALUES
(0, 'Móviles y Telefonía', 0),
(1, 'Informática y Tablets', 0),
(2, 'Cámaras y Fotografía', 0),
(3, 'Consolas y Videojuegos', 0),
(4, 'Hogar y Decoración', 1),
(5, 'Eletrodomésticos', 1),
(6, 'Bricolaje', 1),
(7, 'Terraza y Jardín', 1),
(8, 'Ropa de hombre', 2),
(9, 'Ropa de mujer', 2),
(10, 'Ropa y calzado de niños', 2),
(11, 'Calzado', 2),
(12, 'Ciclismo', 3),
(13, 'Fitness, Running y Yoga', 3),
(14, 'Pádel y Tenis', 3),
(15, 'Pesca', 3),
(16, 'Repuestos para coches', 4),
(17, 'Audio, tecnología y navegación', 4),
(18, 'Tuning para coches', 4),
(19, 'Accesorios para coches', 4),
(20, 'Arte y Antigüedades', 5),
(21, 'Artículos militares', 5),
(22, 'Artículos de Escritorio', 5),
(23, 'Cromos', 5),
(24, 'Relojes y Joyas', 6),
(25, 'Belleza y Salud', 6),
(26, 'Manicura y Pedicura', 6),
(27, 'Maquillaje', 6),
(28, 'Juguetes', 7),
(29, 'Instrumentos musicales', 7),
(30, 'Libros y Música', 7),
(31, 'Viajes', 7),
(32, 'Vinos y Gastronomía', 8),
(33, 'Bebés', 8),
(34, 'Equipamento y Maquinaría', 8),
(35, 'Artículos para animales', 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `denuncias`
--

DROP TABLE IF EXISTS `denuncias`;
CREATE TABLE IF NOT EXISTS `denuncias` (
  `idDenuncias` int(11) NOT NULL AUTO_INCREMENT,
  `idrazonDenuncia` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  PRIMARY KEY (`idDenuncias`),
  KEY `fk_Denuncias_razonDenuncia1` (`idrazonDenuncia`),
  KEY `fk_Denuncias_Usuario1` (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamentos`
--

DROP TABLE IF EXISTS `departamentos`;
CREATE TABLE IF NOT EXISTS `departamentos` (
  `idDepartamentos` int(11) NOT NULL,
  `nombreDepartamento` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idDepartamentos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `departamentos`
--

INSERT INTO `departamentos` (`idDepartamentos`, `nombreDepartamento`) VALUES
(1, 'Atlántida'),
(2, 'Colón'),
(3, 'Comayagua'),
(4, 'Copán'),
(5, 'Cortés'),
(6, 'Choluteca'),
(7, 'El Paraíso'),
(8, 'Francisco Morazán'),
(9, 'Gracias a Dios'),
(10, 'Intibucá'),
(11, 'Islas de la Bahía'),
(12, 'La Paz'),
(13, 'Lempira'),
(14, 'Ocotepeque'),
(15, 'Olancho'),
(16, 'Santa Bárbara'),
(17, 'Valle'),
(18, 'Yoro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupocategoria`
--

DROP TABLE IF EXISTS `grupocategoria`;
CREATE TABLE IF NOT EXISTS `grupocategoria` (
  `idgrupocategoria` int(11) NOT NULL,
  `nombregrupo` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`idgrupocategoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `grupocategoria`
--

INSERT INTO `grupocategoria` (`idgrupocategoria`, `nombregrupo`) VALUES
(0, 'Electrónica'),
(1, 'Casa y Jardín'),
(2, 'Moda'),
(3, 'Deportes'),
(4, 'Motor'),
(5, 'Coleccionismo'),
(6, 'Joyería y Belleza'),
(7, 'Ocio'),
(8, 'Otras categorías');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `municipios`
--

DROP TABLE IF EXISTS `municipios`;
CREATE TABLE IF NOT EXISTS `municipios` (
  `idMunicipios` int(11) NOT NULL,
  `idDepartamentos` int(11) NOT NULL,
  `municipio` varchar(45) NOT NULL,
  PRIMARY KEY (`idMunicipios`),
  KEY `fk_municipios_departamentos1` (`idDepartamentos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `municipios`
--

INSERT INTO `municipios` (`idMunicipios`, `idDepartamentos`, `municipio`) VALUES
(1, 1, 'La Ceiba'),
(2, 1, 'El Porvenir'),
(3, 1, 'Tela'),
(4, 1, 'Jutiapa'),
(5, 1, 'La Masica'),
(6, 1, 'San Francisco'),
(7, 1, 'Arizona'),
(8, 1, 'Esparta'),
(9, 2, 'Trijullo'),
(10, 2, 'Balfate'),
(11, 2, 'Iriona'),
(12, 2, 'Limón'),
(13, 2, 'Sabá'),
(14, 2, 'Santa Fe'),
(15, 2, 'Santa Rosa de Aguán'),
(16, 2, 'Sonaguera'),
(17, 2, 'Tocoa'),
(18, 2, 'Bonito Oriental'),
(19, 3, 'Comayagua'),
(20, 3, 'Ajuterique'),
(21, 3, 'El Rosario'),
(22, 3, 'Esquías'),
(23, 3, 'Humuya'),
(24, 3, 'La libertad'),
(25, 3, 'Lamaní'),
(26, 3, 'La Trinidad'),
(27, 3, 'Lejamani'),
(28, 3, 'Meambar'),
(29, 3, 'Minas de Oro'),
(30, 3, 'Ojos de Agua'),
(31, 3, 'San Jerónimo'),
(32, 3, 'San José de Comayagua'),
(33, 3, 'San José del Potrero'),
(34, 3, 'San Luis'),
(35, 3, 'San Sebastián'),
(36, 3, 'Siguatepeque'),
(37, 3, 'Villa de San Antonio'),
(38, 3, 'Las Lajas'),
(39, 3, 'Taulabé'),
(40, 4, 'Santa Rosa de Copán'),
(41, 4, 'Cabañas'),
(42, 4, 'Concepción'),
(43, 4, 'Copán Ruinas'),
(44, 4, 'Corquín'),
(45, 4, 'Cucuyagua'),
(46, 4, 'Dolores'),
(47, 4, 'Dulce Nombre'),
(48, 4, 'El Paraíso'),
(49, 4, 'Florida'),
(50, 4, 'La Jigua'),
(51, 4, 'La Unión'),
(52, 4, 'Nueva Arcadia'),
(53, 4, 'San Agustín'),
(54, 4, 'San Antonio'),
(55, 4, 'San Jerónimo'),
(56, 4, 'San José'),
(57, 4, 'San Juan de Opoa'),
(58, 4, 'San Nicolás'),
(59, 4, 'San Pedro'),
(60, 4, 'Santa Rita'),
(61, 4, 'Trinidad de Copán'),
(62, 4, 'Veracruz'),
(63, 5, 'San Pedro Sula'),
(64, 5, 'Choloma'),
(65, 5, 'Omoa'),
(66, 5, 'Pimienta'),
(67, 5, 'Potrerillos'),
(68, 5, 'Puerto Cortés'),
(69, 5, 'San Antonio de Cortés'),
(70, 5, 'San Francisco de Yojoa'),
(71, 5, 'San Manuel'),
(72, 5, 'Santa Cruz de Yojoa'),
(73, 5, 'Villanueva'),
(74, 5, 'La Lima'),
(75, 6, 'Choluteca'),
(76, 6, 'Apacilagua'),
(77, 6, 'Concepción de María'),
(78, 6, 'Duyure'),
(79, 6, 'El Corpus'),
(80, 6, 'El Triunfo'),
(81, 6, 'Marcovia'),
(82, 6, 'Morolica'),
(83, 6, 'Namasigue'),
(84, 6, 'Orocuina'),
(85, 6, 'Pespire'),
(86, 6, 'San Antonio de Flores'),
(87, 6, 'San Isidro'),
(88, 6, 'San José'),
(89, 6, 'San Marcos de Colón'),
(90, 6, 'Santa Ana de Yusguare'),
(91, 7, 'Yuscarán'),
(92, 7, 'Alauca'),
(93, 7, 'Danlí'),
(94, 7, 'El Paraíso'),
(95, 7, 'Güinope'),
(96, 7, 'Jacaleapa'),
(97, 7, 'Liure'),
(98, 7, 'Morocelí'),
(99, 7, 'Oropolí'),
(100, 7, 'Potrerillos'),
(101, 7, 'San Antonio de Flores'),
(102, 7, 'San Lucas'),
(103, 7, 'San Matías'),
(104, 7, 'Soledad'),
(105, 7, 'Teupasenti'),
(106, 7, 'Texiguat'),
(107, 7, 'Vado Ancho'),
(108, 7, 'Yauyupe'),
(109, 7, 'Trojes'),
(110, 8, 'Distrito Central'),
(111, 8, 'Alubarén'),
(112, 8, 'Cedros'),
(113, 8, 'Curarén'),
(114, 8, 'El Porvenir'),
(115, 8, 'Guaimaca'),
(116, 8, 'La Libertad'),
(117, 8, 'La Venta'),
(118, 8, 'Lepaterique'),
(119, 8, 'Maraita'),
(120, 8, 'Marale'),
(121, 8, 'Nueva Armenia'),
(122, 8, 'Ojojona'),
(123, 8, 'Orica'),
(124, 8, 'Reitoca'),
(125, 8, 'Sabanagrande'),
(126, 8, 'San Antonio de Oriente'),
(127, 8, 'San Buenaventura'),
(128, 8, 'San Ignacio'),
(129, 8, 'San Juan de Flores'),
(130, 8, 'San Miguelito'),
(131, 8, 'Santa Ana'),
(132, 8, 'Santa Lucía'),
(133, 8, 'Talanga'),
(134, 8, 'Tatumbla'),
(135, 8, 'Valle de Ángeles'),
(136, 8, 'Villa de San Francisco'),
(137, 8, 'Vallecillo'),
(138, 9, 'Puerto Lempira'),
(139, 9, 'Brus Laguna'),
(140, 9, 'Ahuas'),
(141, 9, 'Juan Francisco Bulnes'),
(142, 9, 'Ramón Villeda Morales'),
(143, 9, 'Wampusirpe'),
(144, 10, 'La Esperanza'),
(145, 10, 'Camasca'),
(146, 10, 'Colomoncagua'),
(147, 10, 'Concepción'),
(148, 10, 'Dolores'),
(149, 10, 'Intibucá'),
(150, 10, 'Jesús de Otoro'),
(151, 10, 'Magdalena'),
(152, 10, 'Masaguara'),
(153, 10, 'San Antonio'),
(154, 10, 'San Isidro'),
(155, 10, 'San Juan'),
(156, 10, 'San Marcos de la Sierra'),
(157, 10, 'San Miguel Guancapla'),
(158, 10, 'Santa Lucía'),
(159, 10, 'Yamaranguila'),
(160, 10, 'San Francisco de Opalaca'),
(161, 11, 'Roatán'),
(162, 11, 'Guanaja'),
(163, 11, 'José Santos Guardiola'),
(164, 11, 'Utila'),
(165, 12, 'La Paz'),
(166, 12, 'Aguanqueterique'),
(167, 12, 'Cabañas'),
(168, 12, 'Cane'),
(169, 12, 'Chinacla'),
(170, 12, 'Guajiquiro'),
(171, 12, 'Lauterique'),
(172, 12, 'Marcala'),
(173, 12, 'Mercedes de Oriente'),
(174, 12, 'Opatoro'),
(175, 12, 'San Antonio del Norte'),
(176, 12, 'San José'),
(177, 12, 'San Juan'),
(178, 12, 'San Pedro de Tutule'),
(179, 12, 'Santa Ana'),
(180, 12, 'Santa Elena'),
(181, 12, 'Santa María'),
(182, 12, 'Santiago de Puringla'),
(183, 12, 'Yarula'),
(184, 13, 'Gracias'),
(185, 13, 'Belén'),
(186, 13, 'Candelaria'),
(187, 13, 'Cololaca'),
(188, 13, 'Erandique'),
(189, 13, 'Gualcince'),
(190, 13, 'Guarita'),
(191, 13, 'La Campa'),
(192, 13, 'La Iguala'),
(193, 13, 'Las Flores'),
(194, 13, 'La Unión'),
(195, 13, 'La Virtud'),
(196, 13, 'Lepaera'),
(197, 13, 'Mapulaca'),
(198, 13, 'Piraera'),
(199, 13, 'San Andrés'),
(200, 13, 'San Francisco'),
(201, 13, 'San Juan Guarita'),
(202, 13, 'San Manuel Colohete'),
(203, 13, 'San Rafael'),
(204, 13, 'San Sebastián'),
(205, 13, 'Santa Cruz'),
(206, 13, 'Talgua'),
(207, 13, 'Tambla'),
(208, 13, 'Tomalá'),
(209, 13, 'Valladolid'),
(210, 13, 'Virginia'),
(211, 13, 'San Marcos de Caiquín'),
(212, 14, 'Ocotepeque'),
(213, 14, 'Belén Gualcho'),
(214, 14, 'Concepción'),
(215, 14, 'Dolores Merendón'),
(216, 14, 'Fraternidad'),
(217, 14, 'La Encarnación'),
(218, 14, 'La Labor'),
(219, 14, 'Lucerna'),
(220, 14, 'Mercedes'),
(221, 14, 'San Fernando'),
(222, 14, 'San Francisco del Valle'),
(223, 14, 'San Jorge'),
(224, 14, 'San Marcos'),
(225, 14, 'Santa Fe'),
(226, 14, 'Sensenti'),
(227, 14, 'Sinuapa'),
(228, 15, 'Juticalpa'),
(229, 15, 'Campamento'),
(230, 15, 'Catacamas'),
(231, 15, 'Concordia'),
(232, 15, 'Dulce Nombre de Culmí'),
(233, 15, 'El Rosario'),
(234, 15, 'Esquipulas del Norte'),
(235, 15, 'Gualaco'),
(236, 15, 'Guarizama'),
(237, 15, 'Guata'),
(238, 15, 'Guayape'),
(239, 15, 'Jano'),
(240, 15, 'La Unión'),
(241, 15, 'Mangulile'),
(242, 15, 'Manto'),
(243, 15, 'Salamá'),
(244, 15, 'San Esteban'),
(245, 15, 'San Francisco de Becerra'),
(246, 15, 'San Francisco de la Paz'),
(247, 15, 'Santa María del Real'),
(248, 15, 'Patuca'),
(249, 15, 'Yocón'),
(250, 15, 'Patuca'),
(251, 16, 'Santa Bárbara'),
(252, 16, 'Arada'),
(253, 16, 'Atima'),
(254, 16, 'Azacualpa'),
(255, 16, 'Ceguaca'),
(256, 16, 'Concepción del Norte'),
(257, 16, 'Concepción del Sur'),
(258, 16, 'Chinda'),
(259, 16, 'El Níspero'),
(260, 16, 'Gualala'),
(261, 16, 'Ilama'),
(262, 16, 'Las Vegas'),
(263, 16, 'Macuelizo'),
(264, 16, 'Naranjito'),
(265, 16, 'Nuevo Celilac'),
(266, 16, 'Nueva Frontera'),
(267, 16, 'Petoa'),
(268, 16, 'Protección'),
(269, 16, 'Quimistán'),
(270, 16, 'San Francisco de Ojuera'),
(271, 16, 'San José de las Colinas'),
(272, 16, 'San Luis'),
(273, 16, 'San Marcos'),
(274, 16, 'San Nicolás'),
(275, 16, 'San Pedro Zacapa'),
(276, 16, 'San Vicente Centenario'),
(277, 16, 'Santa Rita'),
(278, 16, 'Trinidad'),
(279, 17, 'Nacaome'),
(280, 17, 'Alianza'),
(281, 17, 'Amapala'),
(282, 17, 'Aramecina'),
(283, 17, 'Caridad'),
(284, 17, 'Goascorán'),
(285, 17, 'Langue'),
(286, 17, 'San Francisco de Coray'),
(287, 17, 'San Lorenzo'),
(288, 18, 'Yoro'),
(289, 18, 'Arenal'),
(290, 18, 'El Negrito'),
(291, 18, 'El Progreso'),
(292, 18, 'Jocón'),
(293, 18, 'Morazán'),
(294, 18, 'Olanchito'),
(295, 18, 'Santa Rita'),
(296, 18, 'Sulaco'),
(297, 18, 'Victoria'),
(298, 18, 'Yorito');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `razondenuncia`
--

DROP TABLE IF EXISTS `razondenuncia`;
CREATE TABLE IF NOT EXISTS `razondenuncia` (
  `idrazonDenuncia` int(11) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  PRIMARY KEY (`idrazonDenuncia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipousuario`
--

DROP TABLE IF EXISTS `tipousuario`;
CREATE TABLE IF NOT EXISTS `tipousuario` (
  `idtipoUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `tipoUsuario` varchar(45) NOT NULL,
  PRIMARY KEY (`idtipoUsuario`),
  UNIQUE KEY `idtipoUsuario_UNIQUE` (`idtipoUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `tipousuario`
--

INSERT INTO `tipousuario` (`idtipoUsuario`, `tipoUsuario`) VALUES
(1, 'no registrado'),
(2, 'registrado'),
(3, 'administrador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `idtipoUsuario` int(11) NOT NULL,
  `idMunicipios` int(11) NOT NULL,
  `pNombre` varchar(45) NOT NULL,
  `pApellido` varchar(45) DEFAULT NULL,
  `correoElectronico` varchar(45) NOT NULL,
  `numTelefono` varchar(45) NOT NULL,
  `fechaRegistro` datetime NOT NULL,
  `fechaNacimiento` date NOT NULL,
  `RTN` varchar(45) DEFAULT NULL,
  `urlFoto` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`idUsuario`),
  UNIQUE KEY `idPersona_UNIQUE` (`idUsuario`),
  KEY `fk_Usuario_tipoUsuario1` (`idtipoUsuario`),
  KEY `fk_Usuario_municipios1` (`idMunicipios`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `anuncios`
--
ALTER TABLE `anuncios`
  ADD CONSTRAINT `fk_anuncios_Usuario1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`),
  ADD CONSTRAINT `fk_anuncios_categoria1` FOREIGN KEY (`idcategoria`) REFERENCES `categoria` (`idcategoria`),
  ADD CONSTRAINT `fk_anuncios_municipios1` FOREIGN KEY (`idMunicipios`) REFERENCES `municipios` (`idMunicipios`);

--
-- Filtros para la tabla `calificacionescomprador`
--
ALTER TABLE `calificacionescomprador`
  ADD CONSTRAINT `fk_calificacionesComprador_Usuario1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`);

--
-- Filtros para la tabla `calificacionesvendedor`
--
ALTER TABLE `calificacionesvendedor`
  ADD CONSTRAINT `fk_calificacionesVendedor_Usuario1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`);

--
-- Filtros para la tabla `denuncias`
--
ALTER TABLE `denuncias`
  ADD CONSTRAINT `fk_Denuncias_Usuario1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`),
  ADD CONSTRAINT `fk_Denuncias_razonDenuncia1` FOREIGN KEY (`idrazonDenuncia`) REFERENCES `razondenuncia` (`idrazonDenuncia`);

--
-- Filtros para la tabla `municipios`
--
ALTER TABLE `municipios`
  ADD CONSTRAINT `fk_municipios_departamentos1` FOREIGN KEY (`idDepartamentos`) REFERENCES `departamentos` (`idDepartamentos`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_Usuario_municipios1` FOREIGN KEY (`idMunicipios`) REFERENCES `municipios` (`idMunicipios`),
  ADD CONSTRAINT `fk_Usuario_tipoUsuario1` FOREIGN KEY (`idtipoUsuario`) REFERENCES `tipousuario` (`idtipoUsuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
