-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: Oct 22, 2024 at 12:19 PM
-- Server version: 9.0.0
-- PHP Version: 8.2.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inventariomedicalJAC`
--

-- --------------------------------------------------------

--
-- Table structure for table `cpb`
--

CREATE TABLE `cpb` (
  `ID` int NOT NULL,
  `cpb` varchar(100) NOT NULL,
  `Estatus` tinyint(1) NOT NULL,
  `Zona_id` int NOT NULL,
  `Fecha_reg` date NOT NULL,
  `Fecha_mod` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `EntradasMedicamentos`
--

CREATE TABLE `EntradasMedicamentos` (
  `id_entrada` int NOT NULL,
  `id_lote` int NOT NULL,
  `fecha_entrada` date NOT NULL,
  `cantidad_entrada` int NOT NULL,
  `id_usuario` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `EntradasMedicamentos`
--

INSERT INTO `EntradasMedicamentos` (`id_entrada`, `id_lote`, `fecha_entrada`, `cantidad_entrada`, `id_usuario`) VALUES
(1, 1, '2024-07-18', 3, 1),
(2, 1, '2024-07-17', 7, 1),
(3, 41, '2024-07-24', 4, 1),
(4, 45, '2024-07-24', 1, 1),
(5, 43, '2024-07-24', 4, 1),
(6, 45, '2024-07-24', 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `ID` int NOT NULL,
  `Accion` varchar(100) NOT NULL,
  `Usuario_id` int NOT NULL,
  `Fecha_reg` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Lotes`
--

CREATE TABLE `Lotes` (
  `id_lote` int NOT NULL,
  `id_medicamento` int NOT NULL,
  `numero_lote` varchar(50) NOT NULL,
  `fecha_caducidad` date NOT NULL,
  `fecha_reg` date NOT NULL,
  `fecha_mod` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Lotes`
--

INSERT INTO `Lotes` (`id_lote`, `id_medicamento`, `numero_lote`, `fecha_caducidad`, `fecha_reg`, `fecha_mod`) VALUES
(1, 4, 'LME1307', '2024-12-31', '2024-07-13', '2024-07-13'),
(9, 4, 'LME1407', '2024-07-31', '2024-07-13', '2024-07-13'),
(41, 120, 'LME1807', '2025-10-25', '2024-07-18', '2024-07-18'),
(42, 3, 'LME1808', '2025-12-20', '2024-07-18', '2024-07-18'),
(43, 45, 'LME1809', '2026-11-10', '2024-07-18', '2024-07-18'),
(44, 50, 'LME1310', '2024-07-18', '2024-07-18', '2024-07-18'),
(45, 45, 'LME13120', '2027-10-18', '2024-07-18', '2024-07-18');

-- --------------------------------------------------------

--
-- Table structure for table `Medicamentos`
--

CREATE TABLE `Medicamentos` (
  `id_medicamento` int NOT NULL,
  `sku` varchar(50) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `fecha_reg` date NOT NULL,
  `fecha_mod` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Medicamentos`
--

INSERT INTO `Medicamentos` (`id_medicamento`, `sku`, `nombre`, `fecha_reg`, `fecha_mod`) VALUES
(1, 'ME001', 'ME001 - Aceite de Pescado (Omega 3-6-9) Capsulas', '2024-07-13', '2024-07-13'),
(2, 'ME002', 'ME002 - Aciclovir 0.05g/1g  Crema Tópica', '2024-07-13', '2024-07-13'),
(3, 'ME003', 'ME003 - Aciclovir 200mg. Tabletas', '2024-07-13', '2024-07-13'),
(4, 'ME004', 'ME004 - Ácido Acetilsalicílico 100mg. Tabletas liberación retardada', '2024-07-13', '2024-07-13'),
(5, 'ME005', 'ME005 - Ácido Acetilsalicílico 500mg. Tabletas', '2024-07-13', '2024-07-13'),
(6, 'ME006', 'ME006 - Ácido Ascórbico (Vitamina C) 2g. Tabletas efervescentes', '2024-07-13', '2024-07-13'),
(7, 'ME007', 'ME007 - Ácido Ascórbico  100mg. Tabletas', '2024-07-13', '2024-07-13'),
(8, 'ME008', 'ME008 - Ácido Fólico 5.0mg. Tabletas', '2024-07-13', '2024-07-13'),
(9, 'ME009', 'ME009 - Albendazol 20mg/1ml. Suspensión', '2024-07-13', '2024-07-13'),
(10, 'ME010', 'ME010 - Alopurinol Tabletas', '2024-07-13', '2024-07-13'),
(11, 'ME011', 'ME011 - Ambroxol + Amoxicilina 500/30mg Capsulas', '2024-07-13', '2024-07-13'),
(12, 'ME012', 'ME012 - Ambroxol + Amoxicilina 250-15mg/5ml Suspensión', '2024-07-13', '2024-07-13'),
(13, 'ME013', 'ME013 - Ambroxol 15mg/5ml. Solución', '2024-07-13', '2024-07-13'),
(14, 'ME014', 'ME014 - Ambroxol 30mg. Tabletas', '2024-07-13', '2024-07-13'),
(15, 'ME015', 'ME015 - Ambroxol+Cefalexina 5g/0.3g/75ml Suspensión', '2024-07-13', '2024-07-13'),
(16, 'ME016', 'ME016 - Amikacina 100mg. Ampoyeta Inyectable', '2024-07-13', '2024-07-13'),
(17, 'ME017', 'ME017 - Amikacina 500mg. Ampoyeta Inyectable', '2024-07-13', '2024-07-13'),
(18, 'ME018', 'ME018 - Amlodipino  5mg. Tabletas', '2024-07-13', '2024-07-13'),
(19, 'ME019', 'ME019 - Amoxicilina + Ácido Clavulánico 125/31.25mg. Suspensión', '2024-07-13', '2024-07-13'),
(20, 'ME020', 'ME020 - Amoxicilina + Ácido Clavulánico 250/62.50mg. Suspensión', '2024-07-13', '2024-07-13'),
(21, 'ME021', 'ME021 - Amoxicilina + Ácido Clavulánico 875/125mg. Tabletas', '2024-07-13', '2024-07-13'),
(22, 'ME022', 'ME022 - Amoxicilina 250mg. Capsulas', '2024-07-13', '2024-07-13'),
(23, 'ME023', 'ME023 - Amoxicilina 500mg. Capsulas', '2024-07-13', '2024-07-13'),
(24, 'ME024', 'ME024 - Ampicilina 1g. Solución Inyectables', '2024-07-13', '2024-07-13'),
(25, 'ME025', 'ME025 - Ampicilina 1g. Tabletas', '2024-07-13', '2024-07-13'),
(26, 'ME026', 'ME026 - Ampicilina 250mg. Suspensión', '2024-07-13', '2024-07-13'),
(27, 'ME027', 'ME027 - Atorvastatina 40mg. Tabletas', '2024-07-13', '2024-07-13'),
(28, 'ME028', 'ME028 - Baño coloide (Harina de soya+Polividona) Polvo.', '2024-07-13', '2024-07-13'),
(29, 'ME029', 'ME029 - Bencilpenicilina Benzatínica 1´200,000 U Suspensión Inyectable', '2024-07-13', '2024-07-13'),
(30, 'ME030', 'ME030 - Bencilpenicilinas Procaínica y Cristalina 800,000 U/2ml Susp. Inyectable', '2024-07-13', '2024-07-13'),
(31, 'ME031', 'ME031 - Benzonatato 100mg Capsulas', '2024-07-13', '2024-07-13'),
(32, 'ME032', 'ME032 - Betametasona+Clotrimazol+Gentamicina 50mg-1g-0.1g/100g  Crema', '2024-07-13', '2024-07-13'),
(33, 'ME033', 'ME033 - Bezafibrato 200mg. Tabletas', '2024-07-13', '2024-07-13'),
(34, 'ME034', 'ME034 - Eritromicina - Biotril 500 Mg. Tabletas', '2024-07-13', '2024-07-13'),
(35, 'ME035', 'ME035 - Bromuro de ipratropio/ salbutamol. Sol. Para inhalación', '2024-07-13', '2024-07-13'),
(36, 'ME036', 'ME036 - Butilhioscina ó Hioscina 20mg/ml Sol. Inyectable', '2024-07-13', '2024-07-13'),
(37, 'ME037', 'ME037 - Butilhioscina ó Hioscina 10mg Tabletas', '2024-07-13', '2024-07-13'),
(38, 'ME038', 'ME038 - Butilhioscina ó Hioscina+Metamizol Sódico Tabletas', '2024-07-13', '2024-07-13'),
(39, 'ME039', 'ME039 - Calcio+Vitamina D Capsulas', '2024-07-13', '2024-07-13'),
(40, 'ME040', 'ME040 - Captopril 25mg. Tabletas', '2024-07-13', '2024-07-13'),
(41, 'ME041', 'ME041 - Caseína 0.1g+2000 millones de Lactobacilos+Vitamina-E 6.0mg/1 Capsulas', '2024-07-13', '2024-07-13'),
(42, 'ME042', 'ME042 - Cefalexina  125mg. Suspensión', '2024-07-13', '2024-07-13'),
(43, 'ME043', 'ME043 - Cefalexina  250mg. Suspensión', '2024-07-13', '2024-07-13'),
(44, 'ME044', 'ME044 - Cefalexina 500mg+Bromhexina 8.782mg. Capsulas', '2024-07-13', '2024-07-13'),
(45, 'ME045', 'ME045 - Ceftriaxona 1g. Solución Inyectable', '2024-07-13', '2024-07-13'),
(46, 'ME046', 'ME046 - Ceftriaxona 500mg. Solución Inyectable', '2024-07-13', '2024-07-13'),
(47, 'ME047', 'ME047 - Celecoxib 200mg. Capsulas', '2024-07-13', '2024-07-13'),
(48, 'ME048', 'ME048 - Cinitaprida Tabletas', '2024-07-13', '2024-07-13'),
(49, 'ME049', 'ME049 - Ciprofloxacino 500mg. Tabletas', '2024-07-13', '2024-07-13'),
(50, 'ME050', 'ME050 - Ciprofloxacino+Dexametasona Sol. Oftálmica', '2024-07-13', '2024-07-13'),
(51, 'ME051', 'ME051 - Claritromicina 250g. Tabletas', '2024-07-13', '2024-07-13'),
(52, 'ME052', 'ME052 - Claritromicina 500mg. Tabletas', '2024-07-13', '2024-07-13'),
(53, 'ME053', 'ME053 - Clindamicina 1% GEL', '2024-07-13', '2024-07-13'),
(54, 'ME054', 'ME054 - Clindamicina 300mg. Capsulas', '2024-07-13', '2024-07-13'),
(55, 'ME055', 'ME055 - Clindamicina 600mg/4ml. Sol. Inyectable', '2024-07-13', '2024-07-13'),
(56, 'ME056', 'ME056 - Clindamicina+Ketoconazol 100+400mg. Crema Vaginal', '2024-07-13', '2024-07-13'),
(57, 'ME057', 'ME057 - Clioquinol 3% Crema', '2024-07-13', '2024-07-13'),
(58, 'ME058', 'ME058 - Clonixinato de Lisina 100mg. Solución Inyectable', '2024-07-13', '2024-07-13'),
(59, 'ME059', 'ME059 - Clonixinato de Lisina 250mg. Tabletas', '2024-07-13', '2024-07-13'),
(60, 'ME060', 'ME060 - Cloranfenicol 5mg/ml Sol. Oftalmica', '2024-07-13', '2024-07-13'),
(61, 'ME061', 'ME061 - Clorfenamina Tabletas', '2024-07-13', '2024-07-13'),
(62, 'ME062', 'ME062 - Clortalidona 50mg Tabletas', '2024-07-13', '2024-07-13'),
(63, 'ME063', 'ME063 - Clotrimazol 2% Crema Vaginal', '2024-07-13', '2024-07-13'),
(64, 'ME064', 'ME064 - Complejo B [Tiamina, Piridoxina, Cianocobalamina 1.0mg]+Diclofenaco  50mg. Tabletas', '2024-07-13', '2024-07-13'),
(65, 'ME065', 'ME065 - Complejo B [Tiamina, Piridoxina,Cianocobalamina 5mg]+Diclofenaco 75mg. Sol. Inyectable', '2024-07-13', '2024-07-13'),
(66, 'ME066', 'ME066 - Complejo B + Ciproheptadina + Hierro .40g/.100g/.150g/200mcg/3.0g/2.095g Solución', '2024-07-13', '2024-07-13'),
(67, 'ME067', 'ME067 - Complejo B enriquecido Tabletas', '2024-07-13', '2024-07-13'),
(68, 'ME068', 'ME068 - Dexametasona Sol. Inyectable', '2024-07-13', '2024-07-13'),
(69, 'ME069', 'ME069 - Dexametasona 1mg. Tabletas', '2024-07-13', '2024-07-13'),
(70, 'ME070', 'ME070 - Dexpantenol 5g/100g Pomada', '2024-07-13', '2024-07-13'),
(71, 'ME071', 'ME071 - Dextrometorfano + Ambroxol 225mg/225mg/100ml Jarabe', '2024-07-13', '2024-07-13'),
(72, 'ME072', 'ME072 - Dextrometorfano + Ambroxol113mg/150mg/100ml Jarabe', '2024-07-13', '2024-07-13'),
(73, 'ME073', 'ME073 - Dextrometorfano + Guaifenesina + Fenilefrina Jarabe', '2024-07-13', '2024-07-13'),
(74, 'ME074', 'ME074 - Dextrometorfano 300mg/100ml Supensión', '2024-07-13', '2024-07-13'),
(75, 'ME075', 'ME075 - Diclofenaco Sol. Oftálmica', '2024-07-13', '2024-07-13'),
(76, 'ME076', 'ME076 - Diclofenaco GEL', '2024-07-13', '2024-07-13'),
(77, 'ME077', 'ME077 - Diclofenaco Sódico 100mg. Tabletas', '2024-07-13', '2024-07-13'),
(78, 'ME078', 'ME078 - Diclofenaco Sódico 75mg. Sol. Inyectable', '2024-07-13', '2024-07-13'),
(79, 'ME079', 'ME079 - Dicloxacilina  250mg. Suspensión', '2024-07-13', '2024-07-13'),
(80, 'ME080', 'ME080 - Dicloxacilina  500mg. Capsulas', '2024-07-13', '2024-07-13'),
(81, 'ME081', 'ME081 - Difenidol  25mg. Tabletas', '2024-07-13', '2024-07-13'),
(82, 'ME082', 'ME082 - Difenidol 40mg/2ml Solución Inyectable', '2024-07-13', '2024-07-13'),
(83, 'ME083', 'ME083 - Dimenhidrinato Tabletas', '2024-07-13', '2024-07-13'),
(84, 'ME084', 'ME084 - Diosmina+Hesperidina Tabletas', '2024-07-13', '2024-07-13'),
(85, 'ME085', 'ME085 - Diyodohidroxiquinoleina+Caolin+Pectina 4g/10g/1g/100ml Suspensión', '2024-07-13', '2024-07-13'),
(86, 'ME086', 'ME086 - Electrólitos orales en solución con Sabor 300ml', '2024-07-13', '2024-07-13'),
(87, 'ME087', 'ME087 - Enalapril 10mg. Tabletas', '2024-07-13', '2024-07-13'),
(88, 'ME088', 'ME088 - Eritromicina 250 mg/5ml 100ml Suspensión', '2024-07-13', '2024-07-13'),
(89, 'ME089', 'ME089 - Etoricoxib 90mg Tabletas', '2024-07-13', '2024-07-13'),
(90, 'ME090', 'ME090 - Fenazopiridina Tabletas', '2024-07-13', '2024-07-13'),
(91, 'ME091', 'ME091 - Fenitoína Tabletas', '2024-07-13', '2024-07-13'),
(92, 'ME092', 'ME092 - Fluconazol 100mg. Capsulas', '2024-07-13', '2024-07-13'),
(93, 'ME093', 'ME093 - Fluocinolona 0.010g. Crema tópica', '2024-07-13', '2024-07-13'),
(94, 'ME094', 'ME094 - Fluticasona 50 mg Aerosol bucal', '2024-07-13', '2024-07-13'),
(95, 'ME095', 'ME095 - Fumarato Ferroso Suspensión', '2024-07-13', '2024-07-13'),
(96, 'ME096', 'ME096 - Fumarato Ferroso Tabletas', '2024-07-13', '2024-07-13'),
(97, 'ME097', 'ME097 - Furosemida 40mg Tabletas', '2024-07-13', '2024-07-13'),
(98, 'ME098', 'ME098 - Ibuprofeno 600mg. Capsulas', '2024-07-13', '2024-07-13'),
(99, 'ME099', 'ME099 - Gentamicina  20mg Sol. Inyectable', '2024-07-13', '2024-07-13'),
(100, 'ME100', 'ME100 - Gentamicina 160mg. Sol. Inyectable', '2024-07-13', '2024-07-13'),
(101, 'ME101', 'ME101 - Glibenclamida 5mg Tabletas', '2024-07-13', '2024-07-13'),
(102, 'ME102', 'ME102 - Hidrocortisona 1 mg. Crema tópica', '2024-07-13', '2024-07-13'),
(103, 'ME103', 'ME103 - Hidroxido de Aluminio 3.70g+Hidroxido de Magnesio 4.0g. Suspensión', '2024-07-13', '2024-07-13'),
(104, 'ME104', 'ME104 - Hierro Dextrano Sol. Inyectable', '2024-07-13', '2024-07-13'),
(105, 'ME105', 'ME105 - Hipromelosa al 0.5% Solución', '2024-07-13', '2024-07-13'),
(106, 'ME106', 'ME106 - Ibuprofeno 100mg. Suspensión', '2024-07-13', '2024-07-13'),
(107, 'ME107', 'ME107 - Ibuprofeno 400mg. Tabletas', '2024-07-13', '2024-07-13'),
(108, 'ME108', 'ME108 - Indometacina 25mg. Capsulas', '2024-07-13', '2024-07-13'),
(109, 'ME109', 'ME109 - Ketoconazol Crema Tópica', '2024-07-13', '2024-07-13'),
(110, 'ME110', 'ME110 - Ketoconazol 200mg Tabletas', '2024-07-13', '2024-07-13'),
(111, 'ME111', 'ME111 - Ketorolaco 10mg. Tabletas', '2024-07-13', '2024-07-13'),
(112, 'ME112', 'ME112 - Ketorolaco 30mg. Sol. Inyectable', '2024-07-13', '2024-07-13'),
(113, 'ME113', 'ME113 - Lansoprazol 30mg. Capsulas', '2024-07-13', '2024-07-13'),
(114, 'ME114', 'ME114 - Levodropropizina 600mg/100ml Solución', '2024-07-13', '2024-07-13'),
(115, 'ME115', 'ME115 - Levofloxacino 500mg. Tabletas', '2024-07-13', '2024-07-13'),
(116, 'ME116', 'ME116 - Levotiroxina Sódica 100mcg. Tabletas', '2024-07-13', '2024-07-13'),
(117, 'ME117', 'ME117 - Lidocaína + Hidrocortisona 60/5mg Supositorios.', '2024-07-13', '2024-07-13'),
(118, 'ME118', 'ME118 - Lincomicina 300mg Sol. Inyectable', '2024-07-13', '2024-07-13'),
(119, 'ME119', 'ME119 - Loperamida Tabletas', '2024-07-13', '2024-07-13'),
(120, 'ME120', 'ME120 - Loratadina 100mg/100ml Solución', '2024-07-13', '2024-07-13'),
(121, 'ME121', 'ME121 - Loratadina 10mg Tabletas', '2024-07-13', '2024-07-13'),
(122, 'ME122', 'ME122 - Loratadina + Ambroxol 0.6g/0.1g (Sol. Oral).', '2024-07-13', '2024-07-13'),
(123, 'ME123', 'ME123 - Losartán  50mg. Tabletas', '2024-07-13', '2024-07-13'),
(124, 'ME124', 'ME124 - Meclizina+Piridoxina8.330mg/16.660mg/ml Sol. Gotas', '2024-07-13', '2024-07-13'),
(125, 'ME125', 'ME125 - Meloxicam + Metocarbamol 15/215mg. Tabletas', '2024-07-13', '2024-07-13'),
(126, 'ME126', 'ME126 - Metamizol Sódico 250mg. Jarabe', '2024-07-13', '2024-07-13'),
(127, 'ME127', 'ME127 - Metamizol Sódico 500mg. Tabletas', '2024-07-13', '2024-07-13'),
(128, 'ME128', 'ME128 - Metformina  850mg. Tabletas', '2024-07-13', '2024-07-13'),
(129, 'ME129', 'ME129 - Metformina+Glibenclamida  500/2.5mg. Tabletas', '2024-07-13', '2024-07-13'),
(130, 'ME130', 'ME130 - Metformina+Glibenclamida  500/5mg. Tabletas', '2024-07-13', '2024-07-13'),
(131, 'ME131', 'ME131 - Metoclopramida Solución gotas', '2024-07-13', '2024-07-13'),
(132, 'ME132', 'ME132 - Metoclopramida 10mg. Tabletas', '2024-07-13', '2024-07-13'),
(133, 'ME133', 'ME133 - Metoprolol  100mg. Tabletas', '2024-07-13', '2024-07-13'),
(134, 'ME134', 'ME134 - Metronidazol 250mg. Suspensión', '2024-07-13', '2024-07-13'),
(135, 'ME135', 'ME135 - Metronidazol 500mg. Tabletas', '2024-07-13', '2024-07-13'),
(136, 'ME136', 'ME136 - Metronidazol 500mg. Tabletas Vaginales', '2024-07-13', '2024-07-13'),
(137, 'ME137', 'ME137 - Miconazol 2g Crema Topica', '2024-07-13', '2024-07-13'),
(138, 'ME138', 'ME138 - Montelukast 5mg. Tabletas', '2024-07-13', '2024-07-13'),
(139, 'ME139', 'ME139 - Nafazolina 1mg. Sol. Oftálmica', '2024-07-13', '2024-07-13'),
(140, 'ME140', 'ME140 - Nafazolina+Feniramina 0.16mg/3.0mg Sol. Oftálmica', '2024-07-13', '2024-07-13'),
(141, 'ME141', 'ME141 - Naproxeno 500mg. Tabletas', '2024-07-13', '2024-07-13'),
(142, 'ME142', 'ME142 - Naproxeno Sódico + Paracetamol Suspensión Oral', '2024-07-13', '2024-07-13'),
(143, 'ME143', 'ME143 - Naproxeno Sódico+Paracetamol  Tabletas', '2024-07-13', '2024-07-13'),
(144, 'ME144', 'ME144 - Neomicina + Caolín + Pectina 0.733g/10g/0.700g/100ml Suspensión', '2024-07-13', '2024-07-13'),
(145, 'ME145', 'ME145 - Neomicina+Retinol 100,000U pomada', '2024-07-13', '2024-07-13'),
(146, 'ME146', 'ME146 - Nistatina 2,400,000U Suspensión Oral', '2024-07-13', '2024-07-13'),
(147, 'ME147', 'ME147 - Nistatina Tabletas Vaginales', '2024-07-13', '2024-07-13'),
(148, 'ME148', 'ME148 - Nitrofural ó Nitrofurazona 6mg Óvulos', '2024-07-13', '2024-07-13'),
(149, 'ME149', 'ME149 - Nitrofurantoína  Capsulas', '2024-07-13', '2024-07-13'),
(150, 'ME150', 'ME150 - Omeprazol 20mg. Capsulas', '2024-07-13', '2024-07-13'),
(151, 'ME151', 'ME151 - Oximetazolina 25mg. Solución nasal', '2024-07-13', '2024-07-13'),
(152, 'ME152', 'ME152 - Oximetazolina 50mg. Solución nasal', '2024-07-13', '2024-07-13'),
(153, 'ME153', 'ME153 - Pantoprazol 40mg. Tabletas', '2024-07-13', '2024-07-13'),
(154, 'ME154', 'ME154 - Paracetamol  100mg. Solución Gotas', '2024-07-13', '2024-07-13'),
(155, 'ME155', 'ME155 - Paracetamol + Fenilefrina + Dextrometorfano Tabletas', '2024-07-13', '2024-07-13'),
(156, 'ME156', 'ME156 - Paracetamol 3.2g. Solución', '2024-07-13', '2024-07-13'),
(157, 'ME157', 'ME157 - Paracetamol+Cafeína 500/50mg. Tabletas', '2024-07-13', '2024-07-13'),
(158, 'ME158', 'ME158 - Paracetamol+Cafeína+Fenilefrina+Clorfenamina  Tabletas', '2024-07-13', '2024-07-13'),
(159, 'ME159', 'ME159 - Pentoxifilina 400 mg. Tabletas', '2024-07-13', '2024-07-13'),
(160, 'ME160', 'ME160 - Picosulfato sódico 7.5g/1ml Solución Oral', '2024-07-13', '2024-07-13'),
(161, 'ME161', 'ME161 - Pinaverio + Dimeticona 100/300mg. Capsulas', '2024-07-13', '2024-07-13'),
(162, 'ME162', 'ME162 - Pinaverio 100mg. Tabletas', '2024-07-13', '2024-07-13'),
(163, 'ME163', 'ME163 - Piroxicam Tableta', '2024-07-13', '2024-07-13'),
(164, 'ME164', 'ME164 - Polvo de cáscara de semilla de Plántago Psyllium 49.7g.', '2024-07-13', '2024-07-13'),
(165, 'ME165', 'ME165 - Pravastatina 10mg. Tabletas', '2024-07-13', '2024-07-13'),
(166, 'ME166', 'ME166 - Prednisona  5mg Tabletas', '2024-07-13', '2024-07-13'),
(167, 'ME167', 'ME167 - Quinfamida+Albendazol Tabletas', '2024-07-13', '2024-07-13'),
(168, 'ME168', 'ME168 - Salbutamol 100mcg Aerosol bucal', '2024-07-13', '2024-07-13'),
(169, 'ME169', 'ME169 - Salbutamol 40mg+Ambroxol 150mg. Jarabe', '2024-07-13', '2024-07-13'),
(170, 'ME170', 'ME170 - Senósidos A-B  8.6mg. Tabletas', '2024-07-13', '2024-07-13'),
(171, 'ME171', 'ME171 - Subsalicilato de Bismuto 1.75g. Suspensión', '2024-07-13', '2024-07-13'),
(172, 'ME172', 'ME172 - Terbinafina Crema topica', '2024-07-13', '2024-07-13'),
(173, 'ME173', 'ME173 - Terbinafina 250mg. Tabletas', '2024-07-13', '2024-07-13'),
(174, 'ME174', 'ME174 - Nanoderma Talco 5g - Tournefortia + Hirsutissima + Zeolita Clinoptilolita', '2024-07-13', '2024-07-13'),
(175, 'ME175', 'ME175 - Tramadol+Paracetamol Tabletas', '2024-07-13', '2024-07-13'),
(176, 'ME176', 'ME176 - Trimebutina Tabletas', '2024-07-13', '2024-07-13'),
(177, 'ME177', 'ME177 - Trimetoprima 40 mg, Sulfametoxasol 200 mg. Suspensión', '2024-07-13', '2024-07-13'),
(178, 'ME178', 'ME178 - Trimetoprima+Sulfametoxazol  80/400mg. Tabletas', '2024-07-13', '2024-07-13');

-- --------------------------------------------------------

--
-- Table structure for table `SalidasMedicamentos`
--

CREATE TABLE `SalidasMedicamentos` (
  `id_salida` int NOT NULL,
  `id_lote` int NOT NULL,
  `fecha_salida` date NOT NULL,
  `cantidad_salida` int NOT NULL,
  `id_usuario` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `SalidasMedicamentos`
--

INSERT INTO `SalidasMedicamentos` (`id_salida`, `id_lote`, `fecha_salida`, `cantidad_salida`, `id_usuario`) VALUES
(1, 1, '2024-08-31', 4, 1),
(2, 45, '2024-07-26', 1, 1),
(3, 43, '2024-07-26', 2, 1),
(4, 43, '2024-07-26', 1, 1),
(5, 1, '2024-07-26', 3, 1),
(6, 1, '2024-07-26', 1, 1),
(7, 41, '2024-07-26', 1, 1),
(8, 45, '2024-08-07', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int NOT NULL,
  `Nombre_completo` varchar(100) NOT NULL,
  `Puesto` varchar(50) NOT NULL,
  `Estatus` tinyint(1) NOT NULL,
  `CPB_id` int NOT NULL,
  `Usuario` varchar(20) NOT NULL,
  `Password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Fecha_reg` date NOT NULL,
  `Fecha_mod` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `Nombre_completo`, `Puesto`, `Estatus`, `CPB_id`, `Usuario`, `Password`, `Fecha_reg`, `Fecha_mod`) VALUES
(1, 'JC', 'Sistemas', 1, 1, 'carlos', '827ccb0eea8a706c4c34a16891f84e7b', '2024-06-16', '2024-06-16'),
(2, 'JP', 'Veterinario', 1, 1, 'Pablo', '12356', '2024-07-11', '2024-07-11');

-- --------------------------------------------------------

--
-- Table structure for table `zonas`
--

CREATE TABLE `zonas` (
  `ID` int NOT NULL,
  `Zona` varchar(50) NOT NULL,
  `Estatus` tinyint(1) NOT NULL,
  `Fecha_reg` date NOT NULL,
  `Fecha_mod` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cpb`
--
ALTER TABLE `cpb`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `EntradasMedicamentos`
--
ALTER TABLE `EntradasMedicamentos`
  ADD PRIMARY KEY (`id_entrada`),
  ADD KEY `id_lote` (`id_lote`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `Lotes`
--
ALTER TABLE `Lotes`
  ADD PRIMARY KEY (`id_lote`),
  ADD UNIQUE KEY `numero_lote` (`numero_lote`),
  ADD KEY `id_medicamento` (`id_medicamento`);

--
-- Indexes for table `Medicamentos`
--
ALTER TABLE `Medicamentos`
  ADD PRIMARY KEY (`id_medicamento`),
  ADD UNIQUE KEY `nombre_unique` (`sku`,`nombre`);

--
-- Indexes for table `SalidasMedicamentos`
--
ALTER TABLE `SalidasMedicamentos`
  ADD PRIMARY KEY (`id_salida`),
  ADD KEY `id_lote` (`id_lote`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`);

--
-- Indexes for table `zonas`
--
ALTER TABLE `zonas`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cpb`
--
ALTER TABLE `cpb`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `EntradasMedicamentos`
--
ALTER TABLE `EntradasMedicamentos`
  MODIFY `id_entrada` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Lotes`
--
ALTER TABLE `Lotes`
  MODIFY `id_lote` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `Medicamentos`
--
ALTER TABLE `Medicamentos`
  MODIFY `id_medicamento` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=179;

--
-- AUTO_INCREMENT for table `SalidasMedicamentos`
--
ALTER TABLE `SalidasMedicamentos`
  MODIFY `id_salida` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `zonas`
--
ALTER TABLE `zonas`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `EntradasMedicamentos`
--
ALTER TABLE `EntradasMedicamentos`
  ADD CONSTRAINT `EntradasMedicamentos_ibfk_1` FOREIGN KEY (`id_lote`) REFERENCES `Lotes` (`id_lote`);

--
-- Constraints for table `Lotes`
--
ALTER TABLE `Lotes`
  ADD CONSTRAINT `Lotes_ibfk_1` FOREIGN KEY (`id_medicamento`) REFERENCES `Medicamentos` (`id_medicamento`);

--
-- Constraints for table `SalidasMedicamentos`
--
ALTER TABLE `SalidasMedicamentos`
  ADD CONSTRAINT `SalidasMedicamentos_ibfk_1` FOREIGN KEY (`id_lote`) REFERENCES `Lotes` (`id_lote`),
  ADD CONSTRAINT `SalidasMedicamentos_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
