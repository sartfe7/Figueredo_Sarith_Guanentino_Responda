-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 17-07-2025 a las 00:54:41
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `asociación_egresados`
--
CREATE DATABASE IF NOT EXISTS `asociación_egresados` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `asociación_egresados`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

CREATE TABLE `administrador` (
  `id_administrador` int(11) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `contraseña` varchar(200) NOT NULL,
  `id_rol` int(11) NOT NULL,
  `id_notificacion` int(11) NOT NULL,
  `id_publicacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `egresado`
--

CREATE TABLE `egresado` (
  `id_egresado` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `telefono` varchar(50) NOT NULL,
  `email` varchar(200) NOT NULL,
  `contraseña` varchar(50) NOT NULL,
  `profesion` varchar(70) NOT NULL,
  `promocion` date NOT NULL,
  `id_rol` int(11) NOT NULL,
  `id_notificacion` int(11) NOT NULL,
  `id_publicacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notificacion`
--

CREATE TABLE `notificacion` (
  `id_notificacion` int(11) NOT NULL,
  `mensaje` varchar(500) NOT NULL,
  `descripcion` varchar(1000) NOT NULL,
  `fecha_envio` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `publicacion`
--

CREATE TABLE `publicacion` (
  `id_publicacion` int(11) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `contenido` text NOT NULL,
  `fecha` date NOT NULL,
  `id_notificacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Rol`
--

CREATE TABLE `Rol` (
  `id_rol` int(11) NOT NULL,
  `nombre` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`id_administrador`),
  ADD KEY `id_notificacion` (`id_notificacion`),
  ADD KEY `id_publicacion` (`id_publicacion`),
  ADD KEY `id_rol` (`id_rol`);

--
-- Indices de la tabla `egresado`
--
ALTER TABLE `egresado`
  ADD PRIMARY KEY (`id_egresado`),
  ADD KEY `id_rol` (`id_rol`),
  ADD KEY `id_notificacion` (`id_notificacion`),
  ADD KEY `id_publicacion` (`id_publicacion`);

--
-- Indices de la tabla `notificacion`
--
ALTER TABLE `notificacion`
  ADD PRIMARY KEY (`id_notificacion`);

--
-- Indices de la tabla `publicacion`
--
ALTER TABLE `publicacion`
  ADD PRIMARY KEY (`id_publicacion`),
  ADD KEY `id_notificacion` (`id_notificacion`);

--
-- Indices de la tabla `Rol`
--
ALTER TABLE `Rol`
  ADD PRIMARY KEY (`id_rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `administrador`
--
ALTER TABLE `administrador`
  MODIFY `id_administrador` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `egresado`
--
ALTER TABLE `egresado`
  MODIFY `id_egresado` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `notificacion`
--
ALTER TABLE `notificacion`
  MODIFY `id_notificacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `publicacion`
--
ALTER TABLE `publicacion`
  MODIFY `id_publicacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Rol`
--
ALTER TABLE `Rol`
  MODIFY `id_rol` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD CONSTRAINT `administrador_ibfk_1` FOREIGN KEY (`id_notificacion`) REFERENCES `notificacion` (`id_notificacion`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `administrador_ibfk_2` FOREIGN KEY (`id_publicacion`) REFERENCES `publicacion` (`id_publicacion`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `administrador_ibfk_3` FOREIGN KEY (`id_rol`) REFERENCES `Rol` (`id_rol`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `egresado`
--
ALTER TABLE `egresado`
  ADD CONSTRAINT `egresado_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `Rol` (`id_rol`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `egresado_ibfk_2` FOREIGN KEY (`id_notificacion`) REFERENCES `notificacion` (`id_notificacion`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `egresado_ibfk_3` FOREIGN KEY (`id_publicacion`) REFERENCES `publicacion` (`id_publicacion`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `publicacion`
--
ALTER TABLE `publicacion`
  ADD CONSTRAINT `publicacion_ibfk_1` FOREIGN KEY (`id_notificacion`) REFERENCES `notificacion` (`id_notificacion`) ON DELETE CASCADE ON UPDATE CASCADE;
--
-- Base de datos: `BD_2_SQL`
--
CREATE DATABASE IF NOT EXISTS `BD_2_SQL` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci;
USE `BD_2_SQL`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Departamento_2`
--

CREATE TABLE `Departamento_2` (
  `id_departamento` int(11) NOT NULL,
  `nombre_departamento` varchar(100) NOT NULL,
  `presupuesto_departamento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Empleado_2`
--

CREATE TABLE `Empleado_2` (
  `id_empleado` varchar(9) NOT NULL,
  `nombre_empleado` varchar(100) NOT NULL,
  `apellidos_empleados` varchar(255) NOT NULL,
  `id_departamento` int(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Departamento_2`
--
ALTER TABLE `Departamento_2`
  ADD PRIMARY KEY (`id_departamento`);

--
-- Indices de la tabla `Empleado_2`
--
ALTER TABLE `Empleado_2`
  ADD PRIMARY KEY (`id_empleado`);
--
-- Base de datos: `BD_ZAPATERIA`
--
CREATE DATABASE IF NOT EXISTS `BD_ZAPATERIA` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci;
USE `BD_ZAPATERIA`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Articulo`
--

CREATE TABLE `Articulo` (
  `id_articulo` varchar(10) NOT NULL,
  `nombre_articulo` varchar(30) NOT NULL,
  `precio_articulo` int(11) NOT NULL,
  `id_fabricante` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `Articulo`
--

INSERT INTO `Articulo` (`id_articulo`, `nombre_articulo`, `precio_articulo`, `id_fabricante`) VALUES
('Zap01', 'Zapato hombre', 70000, 'fab01'),
('Zap02', 'Sandalia', 35000, 'fab04'),
('Zap03', 'Zapatilla', 60000, 'fab02'),
('Zap04', 'Chocato', 8000, 'fab03'),
('Zap05', 'Zapato niño', 40000, 'fab01'),
('Zap06', 'Apache', 40000, 'fab03'),
('Zap07', 'Mocasin', 45000, 'fab02'),
('Zap08', 'Tenis', 95000, 'fab01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Fabricante`
--

CREATE TABLE `Fabricante` (
  `id_fabricante` varchar(10) NOT NULL,
  `nombre_fabricante` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `Fabricante`
--

INSERT INTO `Fabricante` (`id_fabricante`, `nombre_fabricante`) VALUES
('fab01', 'Maya'),
('fab02', 'Pepito'),
('fab03', 'Calcín'),
('fab04', 'Equimoda');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Articulo`
--
ALTER TABLE `Articulo`
  ADD PRIMARY KEY (`id_articulo`),
  ADD KEY `id_fabricante` (`id_fabricante`);

--
-- Indices de la tabla `Fabricante`
--
ALTER TABLE `Fabricante`
  ADD PRIMARY KEY (`id_fabricante`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Articulo`
--
ALTER TABLE `Articulo`
  ADD CONSTRAINT `Articulo_ibfk_1` FOREIGN KEY (`id_fabricante`) REFERENCES `Fabricante` (`id_fabricante`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Articulo_ibfk_2` FOREIGN KEY (`id_fabricante`) REFERENCES `Fabricante` (`id_fabricante`) ON DELETE CASCADE ON UPDATE CASCADE;
--
-- Base de datos: `Empresa`
--
CREATE DATABASE IF NOT EXISTS `Empresa` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci;
USE `Empresa`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Departamento`
--

CREATE TABLE `Departamento` (
  `id_departamento` int(11) NOT NULL,
  `nombre_departamento` varchar(100) NOT NULL,
  `presupuesto_departamento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `Departamento`
--

INSERT INTO `Departamento` (`id_departamento`, `nombre_departamento`, `presupuesto_departamento`) VALUES
(11, 'Sistemas', 150000000),
(12, 'Contabilidad', 40000000),
(13, 'Recursos Humanos', 10000000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Empleado`
--

CREATE TABLE `Empleado` (
  `id_empleado` varchar(8) NOT NULL,
  `nombre_empleado` varchar(100) NOT NULL,
  `apellidos_empleado` varchar(255) NOT NULL,
  `id_departamento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `Empleado`
--

INSERT INTO `Empleado` (`id_empleado`, `nombre_empleado`, `apellidos_empleado`, `id_departamento`) VALUES
('12536', 'Nestor', 'Páez', 11),
('13', 'Cesar', 'Juan', 12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Usuario`
--

CREATE TABLE `Usuario` (
  `email` varchar(100) NOT NULL,
  `password` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `Usuario`
--

INSERT INTO `Usuario` (`email`, `password`) VALUES
('npaez@colegioguanenta.edu.co', '123456');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Departamento`
--
ALTER TABLE `Departamento`
  ADD PRIMARY KEY (`id_departamento`);

--
-- Indices de la tabla `Empleado`
--
ALTER TABLE `Empleado`
  ADD PRIMARY KEY (`id_empleado`),
  ADD KEY `id_departamento` (`id_departamento`);

--
-- Indices de la tabla `Usuario`
--
ALTER TABLE `Usuario`
  ADD PRIMARY KEY (`email`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Empleado`
--
ALTER TABLE `Empleado`
  ADD CONSTRAINT `Empleado_ibfk_1` FOREIGN KEY (`id_departamento`) REFERENCES `Departamento` (`id_departamento`) ON DELETE CASCADE ON UPDATE CASCADE;
--
-- Base de datos: `Guanentino_Responda`
--
CREATE DATABASE IF NOT EXISTS `Guanentino_Responda` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci;
USE `Guanentino_Responda`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `contraseña` varchar(100) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `admin`
--

INSERT INTO `admin` (`id_admin`, `email`, `contraseña`, `nombre`) VALUES
(1, 'sarithfigueredo@colegioguanenta.edu.co', '123', 'Sarith Figueredo'),
(2, 'SARAMI@gmail.com', '$2y$10$ArZIkdZgzehfpQsehNd0CeYOdoM0ucVKJCk79auD.msg7D9nZ67De', 'sara'),
(3, 'SARAMI@gmail.com', '$2y$10$vdMbHJ6OwtPGJS/hmEJtueMAMCHpxUHiMVMUG2WdwgEhaP6nuK6ra', 'sara'),
(4, 'herrera@gmail.com', '$2y$10$Fb8/uMi29AhXqhvStVL.9uw.KjejK0zpHlOQorFspgdiV0z4LWYK6', 'herrera'),
(5, 'npaez@gmail.com', '$2y$10$buMWs7jhrsdBmui7y4Oc7O714DIGP2kYNv6MkSD2OiynDARU/gaHy', 'Nestor'),
(6, 'qqq@gmail.com', '$2y$10$occydWMmSPFuNyfXYTaLduZsG3QMjsJhSco1Y8yajsxD/dfhHPv4m', 'qqq');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignaturas`
--

CREATE TABLE `asignaturas` (
  `id_asignatura` int(11) NOT NULL,
  `nombre` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `asignaturas`
--

INSERT INTO `asignaturas` (`id_asignatura`, `nombre`) VALUES
(1, 'Matemáticas'),
(2, 'Lectura Crítica'),
(3, 'Ciencias sociales y competencias ciudadanas'),
(4, 'Biología'),
(5, 'Física'),
(6, 'Química'),
(7, 'Inglés');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignaturas-docente`
--

CREATE TABLE `asignaturas-docente` (
  `id` int(11) NOT NULL,
  `id_asignatura` int(11) NOT NULL,
  `id_docente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `digitador`
--

CREATE TABLE `digitador` (
  `id_digitador` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `contraseña` varchar(100) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `digitador`
--

INSERT INTO `digitador` (`id_digitador`, `email`, `contraseña`, `nombre`) VALUES
(1, 'edwinplata@colegioguanenta.edu.co', '1234', 'Edwin Santiago Plata Torrado'),
(2, 'platatorrado@colegioguanenta.edu.co', '12345', 'Edwin Plata');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `docente`
--

CREATE TABLE `docente` (
  `id_usuario` int(11) NOT NULL,
  `contraseña` varchar(100) NOT NULL,
  `email` varchar(1000) NOT NULL,
  `nombre` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `docente`
--

INSERT INTO `docente` (`id_usuario`, `contraseña`, `email`, `nombre`) VALUES
(1, 'npaez2025', 'npaez@colegioguanenta.edu.co', 'Néstor Paéz'),
(2, 'eplata2025', 'edwinplata@colegioguanenta.edu.co', 'Edwin Plata'),
(3, 'kromero2025', 'keinerromero@colegioguanenta.edu.co', 'Keiner Romero'),
(4, 'sfigueredo2025', 'sarithfigueredo@colegioguanenta.edu.co', 'Sarith Figueredo'),
(5, 'jgarces2025', 'joségarces@colegioguaneta.edu.co', 'José Garces'),
(6, '123456', 'npaez@colegioguanenta.edu.co', 'Nestor Paez'),
(7, '$2y$10$yDvBNJo.l2Qut/gEMstxBeORMym/4NA1Zuio3AGEcshD.aPXHl6Uq', 'SOFI@gmail.com', 'SOFIA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grado`
--

CREATE TABLE `grado` (
  `id_grado` int(11) NOT NULL,
  `nombre` varchar(111) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `grado`
--

INSERT INTO `grado` (`id_grado`, `nombre`) VALUES
(1, 'Primero'),
(2, 'Segundo'),
(3, 'Tercero'),
(4, 'Cuarto'),
(5, 'Quinto'),
(6, 'Sexto'),
(7, 'Séptimo '),
(8, 'Octavo'),
(9, 'Noveno'),
(10, 'Décimo'),
(11, 'Undécimo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupo`
--

CREATE TABLE `grupo` (
  `id_grupo` int(11) NOT NULL,
  `nombre` varchar(111) NOT NULL,
  `id_grado` int(11) NOT NULL,
  `id_jornada` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `grupo`
--

INSERT INTO `grupo` (`id_grupo`, `nombre`, `id_grado`, `id_jornada`) VALUES
(1, '11-1', 11, 1),
(2, '11-2', 11, 1),
(3, '11-3', 11, 1),
(4, '11-4', 11, 1),
(5, '11-5', 11, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupo-docente`
--

CREATE TABLE `grupo-docente` (
  `id_grupo` int(11) NOT NULL,
  `id_docente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagen_ans`
--

CREATE TABLE `imagen_ans` (
  `id_imagen_ans` int(11) NOT NULL,
  `path_imagen` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagen_pregunta`
--

CREATE TABLE `imagen_pregunta` (
  `id_imagen_pregunta` int(11) NOT NULL,
  `path_imagen` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jornada`
--

CREATE TABLE `jornada` (
  `id_jornada` int(11) NOT NULL,
  `nombre_jornada` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `jornada`
--

INSERT INTO `jornada` (`id_jornada`, `nombre_jornada`) VALUES
(1, 'Mañana'),
(2, 'Tarde');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `opcion_respuesta`
--

CREATE TABLE `opcion_respuesta` (
  `id_opc_respuesta` int(100) NOT NULL,
  `texto` text NOT NULL,
  `justificacion` text NOT NULL,
  `es_correcta` tinyint(1) NOT NULL,
  `id_pregunta` int(11) NOT NULL,
  `id_imagen_ans` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `opcion_respuesta`
--

INSERT INTO `opcion_respuesta` (`id_opc_respuesta`, `texto`, `justificacion`, `es_correcta`, `id_pregunta`, `id_imagen_ans`) VALUES
(2, 'bat', 'Ninguna de las demás opciones describe a un animal largo que no tenga patas.', 0, 1, NULL),
(3, 'cat', 'Ninguna de las demás opciones describe a un animal largo que no tenga patas.', 0, 1, NULL),
(4, 'dog', 'Ninguna de las demás opciones describe a un animal largo que no tenga patas.', 0, 1, NULL),
(5, 'hippo', 'Ninguna de las demás opciones describe a un animal largo que no tenga patas.', 0, 1, NULL),
(6, 'horse', 'Ninguna de las demás opciones describe a un animal largo que no tenga patas.', 0, 1, NULL),
(7, 'snake', 'Las serpientes se caracterizan por ser largas y no tener patas.', 1, 1, NULL),
(8, 'spider', 'Ninguna de las demás opciones describe a un animal largo que no tenga patas.', 0, 1, NULL),
(9, 'whale', 'Ninguna de las demás opciones describe a un animal largo que no tenga patas.', 0, 1, NULL),
(10, 'Premisa/evidencia.', 'La opción A afirma que el primer enunciado es una premisa y el segundo una\r\nevidencia para sustentar esa premisa, pero el segundo enunciado presenta evidencia que va en\r\ncontravía de lo dicho en el primero.', 0, 2, NULL),
(11, 'Introducción/descripción.', 'La opción B dice que el primer enunciado es una introducción\r\ny el segundo una descripción, pero el segundo enunciado no hace una descripción; presenta\r\nevidencia de estudios para contradecir la hipótesis inicial.', 0, 2, NULL),
(12, 'Antecedente/fundamento.', 'La opción C, por último, asegura\r\nque el primer es un antecedente y el segundo enunciado es un fundamento, pero el primer\r\nenunciado no es un antecedente de un razonamiento.', 0, 2, NULL),
(13, 'Conjetura/contraevidencia.', 'La opción D es la respuesta correcta, ya que el primer enunciado presenta una conjetura acerca\r\nde la posibilidad de verter basura sin consecuencias en los océanos, dada su profundidad, y el\r\nsegundo enunciado señala que existen estudios que prueban que la conjetura no era correcta.', 1, 2, NULL),
(14, 'a la libertad de culto.', 'La opción A es incorrecta porque, aunque hace referencia al derecho consignado en el Artículo\r\n19 sobre garantizar la libertad de cultos, en este caso la situación no apunta a que el estudiante\r\nno pueda profesar su religión, sino a que acepte participar en ceremonias religiosas diferentes\r\na la religión a la que pertenece, para que lo acepten en la institución educativa.', 0, 3, NULL),
(15, 'a la libre personalidad.', 'La opción B no es correcta porque, aunque la decisión o no de profesar una religión puede relacionarse con características de la personalidad, este implica más elementos; directamente el derecho que está en juego en la situación es el de libertad de cultos.', 0, 3, NULL),
(16, 'a la libertad de conciencia.', 'La opción C es la respuesta correcta porque este derecho hace referencia a que “nadie será molestado\r\npor razón de sus opiniones religiosas, ni compelido a profesar creencia ni a observar prácticas\r\ncontrarias a su conciencia”. Esto es lo que se pretende en la situación al indicar que será aceptado\r\nsi accede a participar en ceremonias religiosas, aunque el estudiante profese una religión distinta.', 1, 3, NULL),
(17, 'a la libre expresión.', 'La opción D no es correcta porque este derecho hace\r\nreferencia a poder manifestar sus puntos de vista y opiniones, lo cual no se relaciona directamente\r\ncon el derecho que se trata en el enunciado.', 0, 3, NULL),
(18, 'Construir más vías genera más empleos en la construcción.', 'La opción A no es correcta porque la generación de empleos es algo que se espera con la\r\nconstrucción de nuevas vías y no tendría un efecto negativo.', 0, 4, NULL),
(19, 'Construir más vías incentiva el uso del automóvil.', 'La opción B es correcta porque la solución propuesta puede llevar a que se incremente el uso del\r\nautomóvil, lo cual en principio fue la causa del problema. A largo plazo puede generar que la\r\nsolución deje de ser efectiva e incluso afectar otras dimensiones como lo ambiental, que es un efecto\r\nno deseado.', 1, 4, NULL),
(20, 'Construir más vías disminuye la velocidad de circulación de los automóviles.', 'La opción C no es correcta porque\r\nla construcción de nuevas vías no se asocia directamente con la disminución de velocidad, y\r\nde ser así, podría ser un efecto positivo si se relaciona por ejemplo con baja accidentalidad.', 0, 4, NULL),
(21, 'Construir más vías, y su posterior utilización, genera más contaminación.', 'La opción D no es correcta porque la construcción de vías y la utilización de éstas no se relaciona\r\ncon más contaminación, faltaría que se aumente el uso o la compra de más automóviles.', 0, 4, NULL),
(22, 'verdadera, pues el número de bolas de cada color no importa.', 'Es posible que los estudiantes que elijan la opción A consideren que, al haber bolas de 3 colores\r\nen la bolsa, la probabilidad de sacar una bola de cualquier color es de 1/3.', 0, 5, NULL),
(23, 'falsa, pues no se sabe el número total de bolas en la bolsa.', 'Es posible que los estudiantes que elijan la opción B consideren que las 3 bolas rojas, las 3\r\nnegras y las 12 blancas son solo una muestra del total de bolas que hay en la bolsa, por lo que se\r\ndesconoce el número total de bolas.', 0, 5, NULL),
(24, 'falsa, pues hay más bolas de un color que de los otros dos.', 'En la bolsa hay en total 18 bolas y, por tanto, la probabilidad de seleccionar al azar una roja\r\nes de 3/18; una negra, de 3/18; una blanca, de 12/18. Luego, como 3 < 12 entonces el color blanco\r\ntiene una mayor probabilidad de ser elegido al azar.', 1, 5, NULL),
(25, 'verdadera, pues las bolas están repartidas de igual manera.', 'Es posible que los estudiantes que elijan la opción D consideren que, como las bolas están\r\nmezcladas dentro de la bolsa, y no se puede ver el color, entonces están repartidas de igual\r\nmanera.', 0, 5, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pregunta`
--

CREATE TABLE `pregunta` (
  `id_pregunta` int(100) NOT NULL,
  `competencia` varchar(200) DEFAULT NULL,
  `evidencia` varchar(300) DEFAULT NULL,
  `afirmacion` varchar(300) DEFAULT NULL,
  `contexto` text NOT NULL,
  `evaluacion` varchar(200) DEFAULT NULL,
  `estandar` varchar(300) DEFAULT NULL,
  `nivel` varchar(100) DEFAULT NULL,
  `id_grado` int(11) NOT NULL,
  `id_asignatura` int(11) NOT NULL,
  `id_imagen_pregunta` int(11) DEFAULT NULL,
  `id_digitador` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `pregunta`
--

INSERT INTO `pregunta` (`id_pregunta`, `competencia`, `evidencia`, `afirmacion`, `contexto`, `evaluacion`, `estandar`, `nivel`, `id_grado`, `id_asignatura`, `id_imagen_pregunta`, `id_digitador`) VALUES
(1, NULL, NULL, NULL, 'It can be long and does not have feet.', NULL, NULL, 'Pre-A1', 11, 7, NULL, 1),
(2, 'Comprensión lectora.', 'Comprende las relaciones entre diferentes partes o enunciados de un texto.', 'Comprende cómo se articulan las partes de un texto para darle un sentido global.', 'LA CONTAMINACIÓN MARINA\r\n\r\nDebido a la inmensidad y profundidad de los océanos, hasta hace poco se creía que podrían ser utilizados para\r\nverter basura y sustancias químicas en cantidades ilimitadas sin que esto tuviera consecuencias importantes. Los\r\npartidarios de continuar con los vertidos en los océanos incluso tienen un eslogan: “La solución a la contaminación es\r\nla dilución”. En la actualidad, basta con fijarse en la zona muerta del tamaño del estado de Nueva Jersey que se forma\r\ncada verano en el delta del Río Mississippi, o en la extensión de 1.600 kilómetros de plástico en descomposición en el\r\nPacífico Norte para darse cuenta de que esta ideología de la “dilución” ha contribuido a llevar al borde del colapso lo\r\nque tiempo atrás fue un ecosistema oceánico próspero. Existen pruebas de que los océanos han sufrido a manos del\r\nhombre durante miles de años. Sin embargo, estudios recientes demuestran que la degradación, especialmente en\r\nlas zonas costeras, se ha acelerado notablemente en los últimos tres siglos a medida que han aumentado los vertidos\r\nindustriales y los contaminantes procedentes de explotaciones agrarias y ciudades costeras.\r\nAlgunos de los contaminantes más comunes derivados de la actividad humana son los plaguicidas, fertilizantes\r\nquímicos, detergentes, hidrocarburos, aguas residuales, plásticos y otros sólidos. Muchos de estos contaminantes\r\nse acumulan en las profundidades del océano, donde son ingeridos por pequeños organismos marinos a través\r\nde los cuales se introducen en la cadena alimentaria global. Los fertilizantes ricos en nitrógeno que utilizan los\r\nproductores agrícolas en zonas del interior, por ejemplo, acaban en las corrientes, ríos y aguas subterráneas locales,\r\ny más tarde se depositan en los estuarios, bahías y deltas. Este exceso de nutrientes puede provocar un crecimiento\r\nmasivo de algas que consumen el oxígeno del agua, lo cual genera zonas en las que no puede haber vida marina o\r\napenas existe. Los científicos han descubierto 400 zonas muertas con estas características por todo el planeta. Los\r\nhumanos comienzan a percatarse de la insostenibilidad de la filosofía de la “dilución”. Muchas leyes nacionales y\r\nprotocolos internacionales prohíben en la actualidad el vertido de sustancias nocivas en los océanos, si bien su\r\naplicación es a menudo incierta. Se están creando santuarios marinos con el fin de mantener ecosistemas marinos\r\nprístinos. Asimismo, se están llevando a cabo iniciativas aisladas que han logrado cierto éxito en la restauración\r\nde estuarios y bahías.\r\n\r\n(Tomado y adaptado de: http://www.nationalgeographic.es/el-oceano/cuestiones-criticas-sobre-el-problemas-de-la-\r\ncontaminacion-marina/cuestiones-criticas-sobre-el-problemas-de-la-contaminacion-marina.)\r\n\r\n¿Cuál es la relación argumentativa entre los dos enunciados del texto que se presentan a continuación?\r\n“Debido a la inmensidad y profundidad de los océanos, hasta hace poco se creía que podrían ser utilizados para\r\nverter basura y sustancias químicas en cantidades ilimitadas sin que esto tuviera consecuencias importantes”.\r\n“Estudios recientes demuestran que la degradación, especialmente en las zonas costeras, se ha acelerado\r\nnotablemente en los últimos tres siglos”.', 'La capacidad para identificar la relación entre dos enunciados de un texto.', 'Analizo los aspectos textuales, conceptuales y formales de cada uno de los textos que leo.', NULL, 11, 2, NULL, 1),
(3, 'Pensamiento Social (Competencias Ciudadanas).', 'Conoce el modelo de Estado Social de Derecho y su aplicación en Colombia.', 'Comprende modelos conceptuales, sus características y contextos de aplicación.', 'Un niño presenta una entrevista para ingresar en un colegio público. Durante la entrevista, le preguntan a\r\nqué religión pertenece. Al finalizar la entrevista, le dicen al niño que pueden admitirlo si accede a participar\r\nen las ceremonias religiosas del colegio, aunque él profese una religión distinta. El derecho fundamental que\r\nse le violaría al niño en este caso sería', 'La habilidad para reconocer cuándo se respeta o vulneran los derechos fundamentales.', 'Participo constructivamente en iniciativas o proyectos a favor de la no-violencia en el nivel local o\r\nglobal.', NULL, 11, 3, NULL, 1),
(4, 'Pensamiento Reflexivo y Sistémico (Competencias Ciudadanas).', 'Analiza los efectos en distintas dimensiones que tendría una posible intervención.', 'Comprende que los problemas y sus soluciones involucran distintas dimensiones y reconoce\r\nrelaciones entre estas.', 'Uno de los principales problemas de las grandes ciudades es la dificultad para movilizarse debido a la gran\r\ncantidad de automóviles. Tradicionalmente, se ha propuesto que la mejor solución para este problema es\r\nconstruir más vías que permitan el flujo de más automóviles. Esta solución puede ser efectiva, pero puede\r\ngenerar efectos no deseados. ¿Cuál es uno de estos efectos?', 'La habilidad para reconocer en una situación que las soluciones a las problemáticas tienen efectos\r\nque pueden ser no esperados o no deseados.', 'Participo constructivamente en iniciativas o proyectos a favor de la no-violencia en el nivel local\r\no global.', NULL, 11, 3, NULL, 1),
(5, 'Argumentación.', 'Plantea afirmaciones que sustentan o refutan una interpretación dada a la información disponible\r\nen el marco de la solución de un problema.', 'Valida procedimientos y estrategias matemáticas utilizadas para dar solución a problemas.', 'En una bolsa hay 3 bolas rojas, 3 negras y 12 blancas. Una persona afirma que al sacar una bola al azar, los\r\ntres colores tienen la misma probabilidad de salir. Esta afirmación es', 'La capacidad para justificar la validez de una afirmación sobre una probabilidad a partir de la\r\ndescripción de los elementos de un conjunto.', 'Justifico o refuto inferencias basadas en razonamientos estadísticos a partir de resultados de\r\nestudios publicados en los medios o diseñados en el ámbito escolar.', NULL, 11, 1, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `respuesta`
--

CREATE TABLE `respuesta` (
  `id_respuesta` int(100) NOT NULL,
  `puntaje` varchar(1000) NOT NULL,
  `fecha` date NOT NULL,
  `hora_inicio` time(6) NOT NULL,
  `hora_fin` time(6) NOT NULL,
  `PIN` int(100) NOT NULL,
  `apodo_est` varchar(100) NOT NULL,
  `id_pregunta` int(11) NOT NULL,
  `id_grupo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `respuesta`
--

INSERT INTO `respuesta` (`id_respuesta`, `puntaje`, `fecha`, `hora_inicio`, `hora_fin`, `PIN`, `apodo_est`, `id_pregunta`, `id_grupo`) VALUES
(7, '1', '2025-03-17', '31:13:07.000000', '16:13:07.000000', 123456, 'platica', 5, 3),
(8, '0', '2025-03-17', '16:13:15.000000', '23:13:07.000000', 123457, 'Sarith', 2, 1),
(9, '1', '2025-03-17', '31:13:07.000000', '16:13:07.000000', 124567, 'Keiner', 1, 2),
(10, '1', '2025-03-17', '11:20:27.000000', '16:13:07.000000', 123456, 'José Luis', 4, 4),
(11, '0', '2025-03-17', '11:20:27.000000', '16:13:07.000000', 234789, 'Mayra', 3, 5);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indices de la tabla `asignaturas`
--
ALTER TABLE `asignaturas`
  ADD PRIMARY KEY (`id_asignatura`);

--
-- Indices de la tabla `asignaturas-docente`
--
ALTER TABLE `asignaturas-docente`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_asignatura` (`id_asignatura`,`id_docente`),
  ADD KEY `id_docente` (`id_docente`);

--
-- Indices de la tabla `digitador`
--
ALTER TABLE `digitador`
  ADD PRIMARY KEY (`id_digitador`);

--
-- Indices de la tabla `docente`
--
ALTER TABLE `docente`
  ADD PRIMARY KEY (`id_usuario`);

--
-- Indices de la tabla `grado`
--
ALTER TABLE `grado`
  ADD PRIMARY KEY (`id_grado`);

--
-- Indices de la tabla `grupo`
--
ALTER TABLE `grupo`
  ADD PRIMARY KEY (`id_grupo`),
  ADD KEY `id_grado` (`id_grado`),
  ADD KEY `id_jornada` (`id_jornada`);

--
-- Indices de la tabla `grupo-docente`
--
ALTER TABLE `grupo-docente`
  ADD KEY `id_grupo` (`id_grupo`,`id_docente`),
  ADD KEY `id_docente` (`id_docente`);

--
-- Indices de la tabla `imagen_ans`
--
ALTER TABLE `imagen_ans`
  ADD PRIMARY KEY (`id_imagen_ans`);

--
-- Indices de la tabla `imagen_pregunta`
--
ALTER TABLE `imagen_pregunta`
  ADD PRIMARY KEY (`id_imagen_pregunta`);

--
-- Indices de la tabla `jornada`
--
ALTER TABLE `jornada`
  ADD PRIMARY KEY (`id_jornada`);

--
-- Indices de la tabla `opcion_respuesta`
--
ALTER TABLE `opcion_respuesta`
  ADD PRIMARY KEY (`id_opc_respuesta`),
  ADD KEY `id_pregunta` (`id_pregunta`),
  ADD KEY `id_imagen_ans` (`id_imagen_ans`);

--
-- Indices de la tabla `pregunta`
--
ALTER TABLE `pregunta`
  ADD PRIMARY KEY (`id_pregunta`),
  ADD KEY `id_grado` (`id_grado`),
  ADD KEY `id_asignatura` (`id_asignatura`),
  ADD KEY `id_imagen_pregunta` (`id_imagen_pregunta`),
  ADD KEY `id_digitador` (`id_digitador`);

--
-- Indices de la tabla `respuesta`
--
ALTER TABLE `respuesta`
  ADD PRIMARY KEY (`id_respuesta`),
  ADD KEY `id_pregunta` (`id_pregunta`),
  ADD KEY `id_grupo` (`id_grupo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `asignaturas`
--
ALTER TABLE `asignaturas`
  MODIFY `id_asignatura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `asignaturas-docente`
--
ALTER TABLE `asignaturas-docente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `digitador`
--
ALTER TABLE `digitador`
  MODIFY `id_digitador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `docente`
--
ALTER TABLE `docente`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `grado`
--
ALTER TABLE `grado`
  MODIFY `id_grado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `grupo`
--
ALTER TABLE `grupo`
  MODIFY `id_grupo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `imagen_ans`
--
ALTER TABLE `imagen_ans`
  MODIFY `id_imagen_ans` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `jornada`
--
ALTER TABLE `jornada`
  MODIFY `id_jornada` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `opcion_respuesta`
--
ALTER TABLE `opcion_respuesta`
  MODIFY `id_opc_respuesta` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `pregunta`
--
ALTER TABLE `pregunta`
  MODIFY `id_pregunta` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `respuesta`
--
ALTER TABLE `respuesta`
  MODIFY `id_respuesta` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asignaturas-docente`
--
ALTER TABLE `asignaturas-docente`
  ADD CONSTRAINT `asignaturas-docente_ibfk_1` FOREIGN KEY (`id_asignatura`) REFERENCES `asignaturas` (`id_asignatura`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `asignaturas-docente_ibfk_2` FOREIGN KEY (`id_docente`) REFERENCES `docente` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `grupo`
--
ALTER TABLE `grupo`
  ADD CONSTRAINT `grupo_ibfk_1` FOREIGN KEY (`id_grado`) REFERENCES `grado` (`id_grado`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `grupo_ibfk_2` FOREIGN KEY (`id_jornada`) REFERENCES `jornada` (`id_jornada`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `grupo-docente`
--
ALTER TABLE `grupo-docente`
  ADD CONSTRAINT `grupo-docente_ibfk_1` FOREIGN KEY (`id_grupo`) REFERENCES `grupo` (`id_grupo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `grupo-docente_ibfk_2` FOREIGN KEY (`id_docente`) REFERENCES `docente` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `opcion_respuesta`
--
ALTER TABLE `opcion_respuesta`
  ADD CONSTRAINT `opcion_respuesta_ibfk_1` FOREIGN KEY (`id_pregunta`) REFERENCES `pregunta` (`id_pregunta`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `opcion_respuesta_ibfk_2` FOREIGN KEY (`id_imagen_ans`) REFERENCES `imagen_ans` (`id_imagen_ans`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `pregunta`
--
ALTER TABLE `pregunta`
  ADD CONSTRAINT `pregunta_ibfk_1` FOREIGN KEY (`id_grado`) REFERENCES `grado` (`id_grado`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pregunta_ibfk_2` FOREIGN KEY (`id_asignatura`) REFERENCES `asignaturas` (`id_asignatura`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pregunta_ibfk_3` FOREIGN KEY (`id_imagen_pregunta`) REFERENCES `imagen_pregunta` (`id_imagen_pregunta`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pregunta_ibfk_4` FOREIGN KEY (`id_digitador`) REFERENCES `digitador` (`id_digitador`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `respuesta`
--
ALTER TABLE `respuesta`
  ADD CONSTRAINT `respuesta_ibfk_1` FOREIGN KEY (`id_pregunta`) REFERENCES `pregunta` (`id_pregunta`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `respuesta_ibfk_2` FOREIGN KEY (`id_grupo`) REFERENCES `grupo` (`id_grupo`) ON DELETE CASCADE ON UPDATE CASCADE;
--
-- Base de datos: `opcion_respuesta`
--
CREATE DATABASE IF NOT EXISTS `opcion_respuesta` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `opcion_respuesta`;
--
-- Base de datos: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(11) NOT NULL,
  `dbase` varchar(255) NOT NULL DEFAULT '',
  `user` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `query` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

--
-- Volcado de datos para la tabla `pma__bookmark`
--

INSERT INTO `pma__bookmark` (`id`, `dbase`, `user`, `label`, `query`) VALUES
(2, 'servicio_social', '', 'Crear relacion 1:m', 'ALTER TABLE servicio ADD FOREIGN KEY(id_servicio) REFERENCES apoyo(id_apoyo)\r\nON DELETE CASCADE\r\nON UPDATE CASCADE'),
(3, 'servicio_social', 'root', 'Crear relacion 1:m', 'ALTER TABLE  servicio ADD FOREIGN KEY(id_servicio) REFERENCES apoyo(id_apoyo)\r\nON DELETE CASCADE\r\nON UPDATE CASCADE'),
(4, 'asociación_egresados', '', 'necesaria', 'SELECT * FROM `publicacion`');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) NOT NULL,
  `col_name` varchar(64) NOT NULL,
  `col_type` varchar(64) NOT NULL,
  `col_length` text DEFAULT NULL,
  `col_collation` varchar(64) NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) DEFAULT '',
  `col_default` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `column_name` varchar(64) NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `transformation` varchar(255) NOT NULL DEFAULT '',
  `transformation_options` varchar(255) NOT NULL DEFAULT '',
  `input_transformation` varchar(255) NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) NOT NULL,
  `settings_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

--
-- Volcado de datos para la tabla `pma__designer_settings`
--

INSERT INTO `pma__designer_settings` (`username`, `settings_data`) VALUES
('root', '{\"angular_direct\":\"direct\",\"relation_lines\":\"true\",\"snap_to_grid\":\"off\"}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `export_type` varchar(10) NOT NULL,
  `template_name` varchar(64) NOT NULL,
  `template_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db` varchar(64) NOT NULL DEFAULT '',
  `table` varchar(64) NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) NOT NULL,
  `item_name` varchar(64) NOT NULL,
  `item_type` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Volcado de datos para la tabla `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"Empresa\",\"table\":\"Usuario\"},{\"db\":\"Empresa\",\"table\":\"Empleado\"},{\"db\":\"Empresa\",\"table\":\"Departamento\"},{\"db\":\"Guanentino_Responda\",\"table\":\"admin\"},{\"db\":\"Guanentino_Responda\",\"table\":\"digitador\"},{\"db\":\"Guanentino_Responda\",\"table\":\"pregunta\"},{\"db\":\"Guanentino_Responda\",\"table\":\"docente\"},{\"db\":\"Empresa\",\"table\":\"Uuario\"},{\"db\":\"guanentino_responda\",\"table\":\"Opcion_respuesta\"},{\"db\":\"guanentino_responda\",\"table\":\"grado\"}]');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) NOT NULL DEFAULT '',
  `master_table` varchar(64) NOT NULL DEFAULT '',
  `master_field` varchar(64) NOT NULL DEFAULT '',
  `foreign_db` varchar(64) NOT NULL DEFAULT '',
  `foreign_table` varchar(64) NOT NULL DEFAULT '',
  `foreign_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `search_name` varchar(64) NOT NULL DEFAULT '',
  `search_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `display_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `prefs` text NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text NOT NULL,
  `schema_sql` text DEFAULT NULL,
  `data_sql` longtext DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Volcado de datos para la tabla `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2025-07-16 22:54:01', '{\"lang\":\"es\",\"Console\\/Mode\":\"collapse\",\"DefaultConnectionCollation\":\"utf8mb4_spanish2_ci\"}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) NOT NULL,
  `tab` varchar(64) NOT NULL,
  `allowed` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) NOT NULL,
  `usergroup` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indices de la tabla `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indices de la tabla `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indices de la tabla `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indices de la tabla `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indices de la tabla `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indices de la tabla `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indices de la tabla `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indices de la tabla `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indices de la tabla `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indices de la tabla `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indices de la tabla `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indices de la tabla `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indices de la tabla `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Base de datos: `servicio_social`
--
CREATE DATABASE IF NOT EXISTS `servicio_social` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `servicio_social`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acudiente`
--

CREATE TABLE `acudiente` (
  `id_acudiente` int(11) NOT NULL,
  `cedula` int(11) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `correo` varchar(200) NOT NULL,
  `telefono` varchar(200) NOT NULL,
  `id_rol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `acudiente`
--

INSERT INTO `acudiente` (`id_acudiente`, `cedula`, `apellidos`, `nombre`, `correo`, `telefono`, `id_rol`) VALUES
(1, 11001, 'Barrio,Lopez', 'Daniel,Steven', 'barriosdaniel@gmail.com', '12345', 10),
(2, 11002, 'Ferreira,Burgos', 'Santiago,Jose', 'santiagoburgos@gmail.com', '1236578', 10),
(3, 11003, 'Rodriguez,Hernandez', 'Jose,Luis', 'luisrodriguez@gmail.com', '321489', 10),
(4, 11004, 'Plata,Torado', 'Felipe', 'felipeplata@gmail.com', '123456', 10),
(5, 11005, 'Lora,Castro', 'Ana', 'analora@gmail.com', '3218917638', 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `apoyo`
--

CREATE TABLE `apoyo` (
  `id_apoyo` int(11) NOT NULL,
  `id_estudiante` int(11) NOT NULL,
  `id_soporte` int(11) NOT NULL,
  `id_supervisor` int(11) NOT NULL,
  `id_servicio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `apoyo`
--

INSERT INTO `apoyo` (`id_apoyo`, `id_estudiante`, `id_soporte`, `id_supervisor`, `id_servicio`) VALUES
(1, 1, 1, 5, 5),
(2, 2, 1, 4, 4),
(3, 3, 1, 1, 3),
(4, 4, 1, 2, 1),
(5, 5, 1, 3, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `convenio`
--

CREATE TABLE `convenio` (
  `id_convenio` int(11) NOT NULL,
  `path` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `convenio`
--

INSERT INTO `convenio` (`id_convenio`, `path`) VALUES
(1, 'https://docs.google.com/document/d/14SJTwmrHRxd6IyxEoZ5ytci8cPNh-RZXLTNvl42tky4/edit?tab=t.0'),
(2, 'https://docs.google.com/document/d/14SJTwmrHRxd6IyxEoZ5ytci8cPNh-RZXLTNvl42tky4/edit?tab=t.0'),
(3, 'no hay'),
(4, 'https://docs.google.com/document/d/14SJTwmrHRxd6IyxEoZ5ytci8cPNh-RZXLTNvl42tky4/edit?tab=t.0'),
(5, 'no esta disponible'),
(6, 'esta en proceso'),
(7, 'no hay');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante`
--

CREATE TABLE `estudiante` (
  `id_estudiante` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `doc_ident` int(11) NOT NULL,
  `telefono` varchar(200) NOT NULL,
  `correo` varchar(200) NOT NULL,
  `id_rol` int(11) NOT NULL,
  `id_acudiente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estudiante`
--

INSERT INTO `estudiante` (`id_estudiante`, `nombre`, `apellidos`, `doc_ident`, `telefono`, `correo`, `id_rol`, `id_acudiente`) VALUES
(1, 'zharick ', 'burgos rodriguez', 1142971, '3208592990', 'zharickburgos@gmail.com', 11, 2),
(2, 'plata,rojas', 'santiago', 1142970, '3107369698', 'santiagorojas@gmail.com', 11, 4),
(3, 'ferreira lopez', 'daniel', 100078, '3218575', 'daniellopez@gmail.com', 11, 2),
(4, 'daniela ', 'hernandez castro', 1100736, '32187364', 'danielacastro@gmail.com', 11, 3),
(5, 'lopez duran', 'jose', 119473, '324724445', 'joseduran@gmail.com', 11, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grado`
--

CREATE TABLE `grado` (
  `id_grado` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `grado`
--

INSERT INTO `grado` (`id_grado`, `nombre`) VALUES
(7, 'Undécimo'),
(8, 'Decimo'),
(9, 'Noveno'),
(10, 'Octavo'),
(11, 'Septimo'),
(12, 'Sexto');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupo`
--

CREATE TABLE `grupo` (
  `id_grupo` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `id_grado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `grupo`
--

INSERT INTO `grupo` (`id_grupo`, `nombre`, `id_grado`) VALUES
(3, '11-1', 7),
(4, '11-2', 7),
(5, '11-3', 7),
(6, '11-4', 7),
(7, '11-5', 7),
(8, '10-1', 8),
(9, '10-2', 8),
(10, '10-3', 8),
(11, '10-4', 8),
(12, '10-5', 8),
(13, '10-6', 8),
(14, '10-7', 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupo_estudiante`
--

CREATE TABLE `grupo_estudiante` (
  `id_grupo` int(11) NOT NULL,
  `id_estudiante` int(11) NOT NULL,
  `año` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `grupo_estudiante`
--

INSERT INTO `grupo_estudiante` (`id_grupo`, `id_estudiante`, `año`) VALUES
(8, 4, '2025-03-11'),
(9, 3, '2025-03-02'),
(10, 5, '2025-03-03'),
(11, 1, '2025-03-12'),
(12, 2, '2025-03-11');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro_horas`
--

CREATE TABLE `registro_horas` (
  `id_registro_horas` int(11) NOT NULL,
  `numero_horas` varchar(10) NOT NULL,
  `fecha` date NOT NULL,
  `observacion` varchar(300) NOT NULL,
  `id_apoyo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `registro_horas`
--

INSERT INTO `registro_horas` (`id_registro_horas`, `numero_horas`, `fecha`, `observacion`, `id_apoyo`) VALUES
(1, '4', '2025-03-03', 'realizo bien el trabajo', 1),
(2, '3', '2025-03-04', 'completo el trabajo', 2),
(3, '2', '2025-03-06', 'completo el trabajo asignado', 3),
(4, '4', '2025-03-02', 'hizo correctamente el trabajo', 4),
(5, '3', '2025-03-19', 'completo la tarea', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `id_rol` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`id_rol`, `nombre`) VALUES
(7, 'Administrador'),
(9, 'Profesor'),
(10, 'Acudiente'),
(11, 'estudiante');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio`
--

CREATE TABLE `servicio` (
  `id_servicio` int(11) NOT NULL,
  `nombre` varchar(300) NOT NULL,
  `lugar` varchar(300) NOT NULL,
  `horario` varchar(200) NOT NULL,
  `horas diarias` varchar(10) NOT NULL,
  `hora_inical` date NOT NULL,
  `hora_final` varchar(100) NOT NULL,
  `estado` varchar(100) NOT NULL,
  `N_estudiantes` text NOT NULL,
  `tareas` varchar(100) NOT NULL,
  `id_tipo` int(11) NOT NULL,
  `id_convenio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `servicio`
--

INSERT INTO `servicio` (`id_servicio`, `nombre`, `lugar`, `horario`, `horas diarias`, `hora_inical`, `hora_final`, `estado`, `N_estudiantes`, `tareas`, `id_tipo`, `id_convenio`) VALUES
(1, 'pintr el salon 05', 'institucion educativa san jose  de guanenta', 'de 7am-11am martes y jueves', '4', '2025-03-18', 'cuando finalice la tarea', 'activo', '3 estudiantes haran la tarea de pintar el salon 05', 'proseguir con el dibujo alusivo al dia de la mujer', 1, 1),
(2, 'regar y hacer mantenimiento a las plantas del sector de la cancha ', 'institucion educativa san jose de guanenta', '2pm-6pm martes y viernes', '4', '2025-03-28', 'cuando finalice la tareas', 'activo', '2 estudiantes realizaran esta tarea', 'proseguir con traer abono para el mantenimiento de las plantas', 1, 1),
(3, 'mantenimineto de tableros', 'institucion educativa san jose de guanenta', '4pm-6pm toda la semana', '2', '2025-03-21', 'cuando finalice la tarea', 'activo', '3 estudiantes ', 'proseguir con el compromiso de tener sentido de pertencia', 1, 1),
(4, 'ayuda con el reciclaje', 'institucion educativa san jose de guanenta', '6am-10am jueves y viernes', '4', '2025-03-26', 'cuando finalice el trabajo asignado', 'activo', '4 estudiantes', 'vender el reciclaje y recojer ese dinero y destinarlo a las ecesidades de colegio', 1, 1),
(5, 'limpiamiento de pupitres', 'institucion educativa san jose de guanenta', '8am-11am lunes y miercoles', '3', '2025-03-22', 'cuando finalice el trabajo asignado', 'activo', '5 estudiantes', 'proseguir con el mantenimiento', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `soporte_pdf`
--

CREATE TABLE `soporte_pdf` (
  `id_soporte` int(11) NOT NULL,
  `path` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `soporte_pdf`
--

INSERT INTO `soporte_pdf` (`id_soporte`, `path`) VALUES
(1, 'https://docs.google.com/document/d/14SJTwmrHRxd6IyxEoZ5ytci8cPNh-RZXLTNvl42tky4/edit?tab=t.0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `supervisor`
--

CREATE TABLE `supervisor` (
  `id_supervisor` int(11) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `doc_ident` int(11) NOT NULL,
  `id_rol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `supervisor`
--

INSERT INTO `supervisor` (`id_supervisor`, `apellidos`, `nombre`, `correo`, `doc_ident`, `id_rol`) VALUES
(1, 'gatan,lupa', 'gabriel', 'gatangabriel@gmail.com', 11006, 7),
(2, 'morales,figueredo', 'luis', 'luismorales@gmail.com', 11007, 7),
(3, 'rodriguez,burgos', 'sebastian', 'sebastianburgos@gmail.com', 11008, 7),
(4, 'barrios,castro', 'aura', 'auracastro@gmail.com', 11009, 7),
(5, 'ardila,fuentes', 'daniela', 'danielafuentes@gmail.com', 110010, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo`
--

CREATE TABLE `tipo` (
  `id_tipo` int(11) NOT NULL,
  `descripcion` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo`
--

INSERT INTO `tipo` (`id_tipo`, `descripcion`) VALUES
(1, 'Institucional'),
(2, 'Convenio');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `acudiente`
--
ALTER TABLE `acudiente`
  ADD PRIMARY KEY (`id_acudiente`),
  ADD KEY `id_rol` (`id_rol`);

--
-- Indices de la tabla `apoyo`
--
ALTER TABLE `apoyo`
  ADD PRIMARY KEY (`id_apoyo`),
  ADD KEY `id_servicio` (`id_servicio`),
  ADD KEY `id_supervisor` (`id_supervisor`),
  ADD KEY `id_soporte` (`id_soporte`);

--
-- Indices de la tabla `convenio`
--
ALTER TABLE `convenio`
  ADD PRIMARY KEY (`id_convenio`);

--
-- Indices de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD PRIMARY KEY (`id_estudiante`),
  ADD KEY `id_rol` (`id_rol`),
  ADD KEY `id_acudiente` (`id_acudiente`);

--
-- Indices de la tabla `grado`
--
ALTER TABLE `grado`
  ADD PRIMARY KEY (`id_grado`);

--
-- Indices de la tabla `grupo`
--
ALTER TABLE `grupo`
  ADD PRIMARY KEY (`id_grupo`),
  ADD KEY `id_grado` (`id_grado`);

--
-- Indices de la tabla `grupo_estudiante`
--
ALTER TABLE `grupo_estudiante`
  ADD KEY `id_grupo` (`id_grupo`),
  ADD KEY `id_estudiante` (`id_estudiante`);

--
-- Indices de la tabla `registro_horas`
--
ALTER TABLE `registro_horas`
  ADD PRIMARY KEY (`id_registro_horas`),
  ADD KEY `id_apoyo` (`id_apoyo`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD PRIMARY KEY (`id_servicio`),
  ADD KEY `id_convenio` (`id_convenio`),
  ADD KEY `id_tipo` (`id_tipo`);

--
-- Indices de la tabla `soporte_pdf`
--
ALTER TABLE `soporte_pdf`
  ADD PRIMARY KEY (`id_soporte`);

--
-- Indices de la tabla `supervisor`
--
ALTER TABLE `supervisor`
  ADD PRIMARY KEY (`id_supervisor`),
  ADD KEY `id_rol` (`id_rol`);

--
-- Indices de la tabla `tipo`
--
ALTER TABLE `tipo`
  ADD PRIMARY KEY (`id_tipo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `acudiente`
--
ALTER TABLE `acudiente`
  MODIFY `id_acudiente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `apoyo`
--
ALTER TABLE `apoyo`
  MODIFY `id_apoyo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `convenio`
--
ALTER TABLE `convenio`
  MODIFY `id_convenio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  MODIFY `id_estudiante` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `grado`
--
ALTER TABLE `grado`
  MODIFY `id_grado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `grupo`
--
ALTER TABLE `grupo`
  MODIFY `id_grupo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `registro_horas`
--
ALTER TABLE `registro_horas`
  MODIFY `id_registro_horas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `id_rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `servicio`
--
ALTER TABLE `servicio`
  MODIFY `id_servicio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `soporte_pdf`
--
ALTER TABLE `soporte_pdf`
  MODIFY `id_soporte` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `supervisor`
--
ALTER TABLE `supervisor`
  MODIFY `id_supervisor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tipo`
--
ALTER TABLE `tipo`
  MODIFY `id_tipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `acudiente`
--
ALTER TABLE `acudiente`
  ADD CONSTRAINT `acudiente_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id_rol`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `apoyo`
--
ALTER TABLE `apoyo`
  ADD CONSTRAINT `apoyo_ibfk_1` FOREIGN KEY (`id_servicio`) REFERENCES `servicio` (`id_servicio`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `apoyo_ibfk_2` FOREIGN KEY (`id_supervisor`) REFERENCES `supervisor` (`id_supervisor`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `apoyo_ibfk_3` FOREIGN KEY (`id_soporte`) REFERENCES `soporte_pdf` (`id_soporte`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD CONSTRAINT `estudiante_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id_rol`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `estudiante_ibfk_3` FOREIGN KEY (`id_acudiente`) REFERENCES `acudiente` (`id_acudiente`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `grupo`
--
ALTER TABLE `grupo`
  ADD CONSTRAINT `grupo_ibfk_1` FOREIGN KEY (`id_grado`) REFERENCES `grado` (`id_grado`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `grupo_estudiante`
--
ALTER TABLE `grupo_estudiante`
  ADD CONSTRAINT `grupo_estudiante_ibfk_1` FOREIGN KEY (`id_grupo`) REFERENCES `grupo` (`id_grupo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `grupo_estudiante_ibfk_2` FOREIGN KEY (`id_estudiante`) REFERENCES `estudiante` (`id_estudiante`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `registro_horas`
--
ALTER TABLE `registro_horas`
  ADD CONSTRAINT `registro_horas_ibfk_1` FOREIGN KEY (`id_apoyo`) REFERENCES `apoyo` (`id_apoyo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD CONSTRAINT `servicio_ibfk_1` FOREIGN KEY (`id_convenio`) REFERENCES `convenio` (`id_convenio`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `servicio_ibfk_2` FOREIGN KEY (`id_tipo`) REFERENCES `tipo` (`id_tipo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `supervisor`
--
ALTER TABLE `supervisor`
  ADD CONSTRAINT `supervisor_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id_rol`) ON DELETE CASCADE ON UPDATE CASCADE;
--
-- Base de datos: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `test`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
