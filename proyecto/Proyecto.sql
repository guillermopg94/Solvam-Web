-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 03, 2021 at 09:34 AM
-- Server version: 10.2.36-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Proyecto`
--

-- --------------------------------------------------------

--
-- Table structure for table `articulos`
--

CREATE TABLE `articulos` (
  `id_articulo` int(11) NOT NULL,
  `titulo` varchar(225) NOT NULL,
  `articulo` text NOT NULL,
  `autor` varchar(20) NOT NULL,
  `fecha` date NOT NULL,
  `etiquetas` varchar(255) NOT NULL,
  `categorias` int(11) NOT NULL,
  `foto` varchar(100) NOT NULL,
  `visitas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `articulos`
--

INSERT INTO `articulos` (`id_articulo`, `titulo`, `articulo`, `autor`, `fecha`, `etiquetas`, `categorias`, `foto`, `visitas`) VALUES
(1, 'El beso', 'El beso (original en alemán: Der Kuss) es una obra del pintor austríaco Gustav Klimt y probablemente su obra más conocida. Es un óleo con laminillas de oro y estaño sobre lienzo de 180 x 180 centímetros, realizado entre 1907-08.\r\n\r\n', 'Gustav Klimt', '1907-05-04', 'modernismo', 1, 'el_beso.jpg', 6),
(2, 'Impresión, sol naciente', 'Impresión, sol naciente es un cuadro del pintor francés Claude Monet, que dio su nombre al movimiento impresionista. Se conserva en el Museo Marmottan Monet de París.', 'Claude Monet', '1872-05-04', 'impresionismo', 2, 'sol_naciente.jpg', 8),
(3, 'Las señoritas de Avignon', 'Las señoritas de Aviñón o, más correctamente, Las señoritas de la calle de Avinyó, es un cuadro del pintor español Pablo Picasso pintado en 1907 al óleo sobre lienzo y sus medidas son 243,9 x 233,7 cm. Se conserva en el Museo de Arte Moderno de Nueva York.', 'Pablo Picasso', '1907-03-16', 'cubismo', 3, 'senioritas.jpg', 6),
(4, 'El grito', 'El cuadro es abundante en colores cálidos de fondo, luz semioscura y la figura principal es una persona en un sendero con vallas que se pierde de vista fuera de la escena. Esta figura está gritando, con una expresión de desesperación. En el fondo, casi fuera de escena, se aprecian dos figuras con sombrero que no se pueden distinguir con claridad. El cielo parece fluido y arremolinado, igual que el resto del fondo.', 'Edvard Munch', '1893-07-15', 'expresionismo', 4, 'el_grito.jpg', 6);

-- --------------------------------------------------------

--
-- Table structure for table `categorias`
--

CREATE TABLE `categorias` (
  `id_categoria` int(11) NOT NULL,
  `categoria` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categorias`
--

INSERT INTO `categorias` (`id_categoria`, `categoria`) VALUES
(1, 'modernismo'),
(2, 'impresionismo'),
(3, 'cubismo'),
(4, 'expresionismo');

-- --------------------------------------------------------

--
-- Table structure for table `detalles`
--

CREATE TABLE `detalles` (
  `codigo` int(11) NOT NULL,
  `titulo` varchar(225) NOT NULL,
  `descripcion` text NOT NULL,
  `imagen` varchar(30) NOT NULL,
  `articulo` text NOT NULL,
  `autor` varchar(30) NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detalles`
--

INSERT INTO `detalles` (`codigo`, `titulo`, `descripcion`, `imagen`, `articulo`, `autor`, `fecha`) VALUES
(1, 'El beso', 'Autor: Gustav Klimnt\r\nCorriente: Modernismo', 'el_beso.jpg', 'El beso (original en alemán: Der Kuss) es una obra del pintor austríaco Gustav Klimt y probablemente su obra más conocida. Es un óleo con laminillas de oro y estaño sobre lienzo de 180 x 180 centímetros, realizado entre 1907-08.', 'Gustav Klimnt', '1907-05-04'),
(2, 'Impresión, sol naciente', 'Autor: Claude Monet\r\nCorriente: Impresionismo', 'sol_naciente.jpg', 'Impresión, sol naciente es un cuadro del pintor francés Claude Monet, que dio su nombre al movimiento impresionista. Se conserva en el Museo Marmottan Monet de París.', 'Claude Monet', '1872-05-04'),
(3, 'Las señoritas de Avignon', 'Autor: Pablo Picasso\r\nCorriente: Cubismo', 'senioritas.jpg', 'Las señoritas de Aviñón o, más correctamente, Las señoritas de la calle de Avinyó, es un cuadro del pintor español Pablo Picasso pintado en 1907 al óleo sobre lienzo y sus medidas son 243,9 x 233,7 cm. Se conserva en el Museo de Arte Moderno de Nueva York.', 'Pablo Picasso', '1907-03-16'),
(4, 'El grito', 'Autor: Edvard Munch\r\nCorriente: expresionismo', 'el_grito.jpg', 'El cuadro es abundante en colores cálidos de fondo, luz semioscura y la figura principal es una persona en un sendero con vallas que se pierde de vista fuera de la escena. Esta figura está gritando, con una expresión de desesperación. En el fondo, casi fuera de escena, se aprecian dos figuras con sombrero que no se pueden distinguir con claridad. El cielo parece fluido y arremolinado, igual que el resto del fondo.', 'Edvard Munch', '1893-07-15'),
(5, 'Trigal con cuervos', 'Autor: Vincent Van Gogh\r\nCorriente: Impresionismo ', 'trigal.jpg', 'Es un óleo sobre lienzo del pintor holandés Vincent van Gogh. Comúnmente se afirmaba que esta fue la última pintura de Van Gogh', 'Vincent Van Gogh', '1890-07-07'),
(6, 'Cartel de Le Chat Noir', 'Autor: Théophile Alexandre  Corriente: Modernismo ', 'le_char.jpg', 'De marcado carácter modernista tanto en lo que respecta a la imagen como a la tipografía, el famoso cartel fue publicado en la propia revista humorística «Le Chat Noir» para remarcar la importancia de este cabaret en la sociedad del momento.', 'Théophile Alexandre', '1896-09-17'),
(7, 'Fränzi ante una silla tallada', 'Autor: Ernst Ludwig  Corriente: Expresionismo', 'silla.jpg', '\'Fränzi ante una silla tallada, es una obra del pintor alemán Ernst Ludwig Kirchner, perteneciente al grupo Die Brücke, uno de los grupos más importantes del expresionismo alemán. ', 'Ernst Ludwig ', '1910-11-17'),
(8, 'El parque de Carrières-Saint-Denis', 'Autor: Georges Braque  Corriente: Cubismo', 'parque.jpg', 'El parque de Carrières-Saint-Denis, perteneciente a la colección Thyssen-Bornemisza, que guarda un cierto parecido con la composición de La iglesia de Chatou de André Derain, ya que en ambos evocan determinados elementos de la naturaleza sin renunciar a la planitud y la estructura geométrica del lienzo.', 'Georges Braque', '1909-02-16');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`name`) VALUES
('guille');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `articulos`
--
ALTER TABLE `articulos`
  ADD PRIMARY KEY (`id_articulo`),
  ADD KEY `categorias` (`categorias`);

--
-- Indexes for table `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id_categoria`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- Indexes for table `detalles`
--
ALTER TABLE `detalles`
  ADD PRIMARY KEY (`codigo`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `articulos`
--
ALTER TABLE `articulos`
  ADD CONSTRAINT `articulos_ibfk_1` FOREIGN KEY (`categorias`) REFERENCES `categorias` (`id_categoria`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
