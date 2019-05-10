-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Client :  localhost:3306
-- Généré le :  Ven 10 Mai 2019 à 21:50
-- Version du serveur :  5.7.25-0ubuntu0.18.04.2
-- Version de PHP :  7.2.15-0ubuntu0.18.04.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `tfckomanda`
--

-- --------------------------------------------------------

--
-- Structure de la table `auditoires`
--

CREATE TABLE `auditoires` (
  `idauditoires` int(10) UNSIGNED NOT NULL,
  `lib` varchar(65) COLLATE utf8_unicode_ci NOT NULL,
  `abbr` varchar(65) COLLATE utf8_unicode_ci NOT NULL,
  `idfacultes` int(10) UNSIGNED NOT NULL,
  `idpromotions` int(10) UNSIGNED NOT NULL,
  `idsections` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `auditoires`
--

INSERT INTO `auditoires` (`idauditoires`, `lib`, `abbr`, `idfacultes`, `idpromotions`, `idsections`) VALUES
(9, 'G1 INFORMATIQUE INDUSTRIELLE ET RESEAUX', 'G1 IIR', 1, 2, 1),
(10, 'G1 INFORMATIQUE DE GESTION', 'G1 IG', 2, 2, 1),
(11, 'G2 INFORMATIQUE INDUSTRIELLE ET RESEAUX', 'G2 IIR', 1, 3, 1),
(12, 'G3 INFORMATIQUE INDUSTRIELLE ET RESEAUX', 'G3 IIR', 1, 3, 1),
(13, 'G2 INFORMATIQUE DE GESTION', 'G2 IG', 2, 3, 1),
(14, 'G3 INFORMATIQUE DE GESTION', 'G3 IG', 2, 4, 1),
(15, 'L1 INFORMATIQUE INDUSTRIELLE', 'L1 II', 3, 5, 1),
(16, 'L2 INFORMATIQUE INDUSTRIELLE', 'L2 II', 3, 6, 1);

-- --------------------------------------------------------

--
-- Structure de la table `enroles`
--

CREATE TABLE `enroles` (
  `idenroles` int(11) NOT NULL,
  `idetudiants` int(11) NOT NULL,
  `idusers` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `enroles`
--

INSERT INTO `enroles` (`idenroles`, `idetudiants`, `idusers`, `created_at`, `updated_at`) VALUES
(1, 55, 1, '2019-05-10 03:08:54', '2019-05-10 03:08:54'),
(2, 105, 1, '2019-05-10 06:08:05', '2019-05-10 06:08:05'),
(3, 118, 1, '2019-05-10 19:48:09', '2019-05-10 19:48:09');

-- --------------------------------------------------------

--
-- Structure de la table `etudiants`
--

CREATE TABLE `etudiants` (
  `idetudiants` int(10) UNSIGNED NOT NULL,
  `matricule` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `nom` varchar(65) COLLATE utf8_unicode_ci NOT NULL,
  `postnom` varchar(65) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prenom` varchar(65) COLLATE utf8_unicode_ci DEFAULT NULL,
  `idauditoires` int(10) UNSIGNED NOT NULL,
  `annee_acad` int(10) UNSIGNED NOT NULL,
  `frais` int(11) DEFAULT NULL,
  `idprofils` int(10) UNSIGNED DEFAULT NULL,
  `commentaire` text COLLATE utf8_unicode_ci,
  `statut` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `etudiants`
--

INSERT INTO `etudiants` (`idetudiants`, `matricule`, `nom`, `postnom`, `prenom`, `idauditoires`, `annee_acad`, `frais`, `idprofils`, `commentaire`, `statut`, `created_at`, `updated_at`) VALUES
(1, '20152696', 'Emard', 'Bahringer', 'Hubert', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(2, '20177340', 'Veum', 'Blick', 'Lucienne', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(3, '20177604', 'Yundt', 'Littel', 'Luella', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(4, '20160528', 'Moore', 'Kessler', 'Mohamed', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(5, '20172507', 'Kessler', 'Braun', 'Noemy', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(6, '20161174', 'Veum', 'Dibbert', 'Gilbert', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(7, '20154458', 'Pfannerstill', 'Robel', 'Pat', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(8, '20159931', 'Beer', 'Goodwin', 'Walton', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(9, '20160086', 'Zieme', 'Abshire', 'Maud', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(10, '20160436', 'Kuhic', 'Friesen', 'Arturo', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(11, '20173699', 'Hammes', 'Renner', 'Tressa', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(12, '20159389', 'Tromp', 'White', 'Paul', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(13, '20167853', 'Reichel', 'Kirlin', 'Cletus', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(14, '20155359', 'Blanda', 'Dooley', 'Graciela', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(15, '20175232', 'Ratke', 'Harvey', 'Kenneth', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(16, '20157001', 'Baumbach', 'Kuvalis', 'Freddie', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(17, '20162300', 'Christiansen', 'Becker', 'Clemmie', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(18, '20157436', 'Rogahn', 'Jerde', 'Guiseppe', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(19, '20166423', 'Goyette', 'Gusikowski', 'Shakira', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(20, '20157772', 'Maggio', 'Herzog', 'Neva', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(21, '20161804', 'Greenfelder', 'Reynolds', 'Felicia', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(22, '20178925', 'Schamberger', 'Jakubowski', 'Delfina', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(23, '20162034', 'Kutch', 'Hackett', 'Joyce', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(24, '20154044', 'Kutch', 'Wiza', 'Delmer', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(25, '20157946', 'Rempel', 'Mayert', 'Jessy', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(26, '20161086', 'Nader', 'Kohler', 'Joana', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(27, '20178564', 'Mante', 'McDermott', 'Litzy', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(28, '20150629', 'Rogahn', 'Hill', 'Moshe', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(29, '20177499', 'Lindgren', 'Cronin', 'Horacio', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(30, '20164301', 'Schaefer', 'Jerde', 'Antonio', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(31, '20175792', 'Windler', 'Morissette', 'Amelia', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(32, '20152449', 'Gutmann', 'Morissette', 'Aimee', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(33, '20158588', 'Auer', 'Zulauf', 'Everardo', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(34, '20162082', 'Swift', 'Wunsch', 'Jerrell', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(35, '20170250', 'Ziemann', 'Reinger', 'Nils', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(36, '20178911', 'Gusikowski', 'Sporer', 'Jaime', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(37, '20153215', 'Borer', 'Wehner', 'John', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(38, '20178723', 'Toy', 'Goldner', 'Noelia', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(39, '20169623', 'Satterfield', 'Littel', 'Salvatore', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(40, '20156259', 'Conn', 'Zieme', 'Demetris', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(41, '20163653', 'Adams', 'Eichmann', 'Alvena', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(42, '20176860', 'Klocko', 'Lynch', 'Loy', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(43, '20157302', 'Parker', 'Gerlach', 'Zackery', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(44, '20176974', 'Mayer', 'Ritchie', 'Jaycee', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(45, '20179196', 'Stanton', 'Hermiston', 'Gilda', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(46, '20151758', 'McDermott', 'Stracke', 'Antonina', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(47, '20152949', 'Denesik', 'Rippin', 'Kristoffer', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(48, '20175415', 'Howe', 'Collier', 'Samir', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(49, '20165135', 'Leffler', 'Gorczany', 'Telly', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(50, '20164554', 'McDermott', 'Beer', 'Estevan', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(51, '20164487', 'Legros', 'Jones', 'Kacie', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(52, '20169344', 'McCullough', 'Kirlin', 'Gonzalo', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(53, '20177081', 'Armstrong', 'Zboncak', 'Garret', 10, 1, 2000, 1, 'a', 1, NULL, '2019-05-09 13:03:23'),
(54, '20155190', 'Schowalter', 'Runolfsson', 'Percival', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(55, '20159774', 'Abbott', 'Bogan', 'Missouri', 10, 1, 55, 2, 'testsssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss', 1, NULL, '2019-05-10 01:26:26'),
(56, '20154712', 'Murazik', 'Baumbach', 'Alphonso', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(57, '20172230', 'Roob', 'Kemmer', 'Zander', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(58, '20170813', 'Shields', 'King', 'Christine', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(59, '20174081', 'Daniel', 'Wyman', 'Cordell', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(60, '20174159', 'Kub', 'Weber', 'Zora', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(61, '20176667', 'Cole', 'Lesch', 'Kelvin', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(62, '20160256', 'Dibbert', 'Beier', 'Madyson', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(63, '20176230', 'Macejkovic', 'Murray', 'Zelda', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(64, '20152237', 'Ledner', 'Braun', 'Mariane', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(65, '20172873', 'Barton', 'Roob', 'Josie', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(66, '20156976', 'Gorczany', 'Cremin', 'Meggie', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(67, '20169197', 'Gerlach', 'Fritsch', 'Mallie', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(68, '20158173', 'Schinner', 'Kulas', 'Keanu', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(69, '20161290', 'Wintheiser', 'Wuckert', 'Edwin', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(70, '20174900', 'Grady', 'Schoen', 'Elinore', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(71, '20177615', 'Pfannerstill', 'Mitchell', 'Abbie', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(72, '20169426', 'Blick', 'Bruen', 'Eva', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(73, '20152879', 'Nitzsche', 'McClure', 'Koby', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(74, '20168689', 'Sawayn', 'Rutherford', 'Emilia', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(75, '20154848', 'Goldner', 'Aufderhar', 'Vernice', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(76, '20152507', 'Veum', 'Frami', 'Thora', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(77, '20165407', 'Mayert', 'Breitenberg', 'Georgiana', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(78, '20164925', 'Lueilwitz', 'Bergnaum', 'Kelvin', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(79, '20170993', 'Murazik', 'Walter', 'Adele', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(80, '20169584', 'Christiansen', 'Legros', 'Major', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(81, '20161750', 'Kertzmann', 'Mohr', 'Brando', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(82, '20166948', 'Pagac', 'Zulauf', 'Karlee', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(83, '20171367', 'Medhurst', 'Gerlach', 'Derek', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(84, '20173621', 'Toy', 'Hane', 'Nicholas', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(85, '20157959', 'Olson', 'McKenzie', 'Leon', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(86, '20179043', 'Bogan', 'White', 'Hilma', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(87, '20174999', 'Greenholt', 'Abbott', 'Susie', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(88, '20177921', 'Kulas', 'Carter', 'Jessyca', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(89, '20171216', 'Pagac', 'Terry', 'Mortimer', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(90, '20152869', 'Bartell', 'Mueller', 'Ella', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(91, '20173476', 'Bradtke', 'Satterfield', 'Dannie', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(92, '20152884', 'Douglas', 'West', 'Dee', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(93, '20167425', 'Connelly', 'Balistreri', 'Johann', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(94, '20160596', 'Labadie', 'Jacobson', 'Filomena', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(95, '20173254', 'Ledner', 'Konopelski', 'Selina', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(96, '20167515', 'Vandervort', 'Walsh', 'Allison', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(97, '20166853', 'Veum', 'Crona', 'Lolita', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(98, '20170894', 'Schroeder', 'Schmitt', 'Sabryna', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(99, '20154990', 'Feil', 'Gutmann', 'Lonnie', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(100, '20167975', 'Reilly', 'Bruen', 'Aglae', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(101, '20155363', 'Stamm', 'Boyle', 'Sydni', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(102, '20166731', 'Hickle', 'Keeling', 'Margret', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(103, '20165828', 'Lakin', 'Lemke', 'Jeffrey', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(104, '20166260', 'Aufderhar', 'Beahan', 'Janie', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(105, '20154964', 'Abbott', 'Farrell', 'Gudrun', 10, 1, 105, 2, 'sss', 1, NULL, '2019-05-10 01:41:52'),
(106, '20169595', 'Carroll', 'Weber', 'Dixie', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(107, '20168573', 'Gusikowski', 'Kihn', 'Edmund', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(108, '20178964', 'Boyle', 'Monahan', 'Selmer', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(109, '20167027', 'Murazik', 'Kozey', 'Neil', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(110, '20173234', 'Huel', 'Streich', 'Malachi', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(111, '20158959', 'Bruen', 'Doyle', 'Dayana', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(112, '20177145', 'Monahan', 'Corkery', 'Jose', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(113, '20155380', 'Rosenbaum', 'Reynolds', 'Annie', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(114, '20167269', 'Simonis', 'Cremin', 'Alf', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(115, '20151812', 'Stehr', 'Anderson', 'Margarett', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(116, '20152703', 'Conroy', 'Gerhold', 'Ernestine', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(117, '20157785', 'Sauer', 'Huel', 'Pearlie', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(118, '20178098', 'Adams', 'Metz', 'Kristian', 10, 1, 118, 2, 'stae', 1, NULL, '2019-05-09 13:03:20'),
(119, '20153789', 'Weissnat', 'Prohaska', 'Darby', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(120, '20169332', 'Russel', 'Stark', 'Emerald', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(121, '20157087', 'Smitham', 'Dooley', 'Tavares', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(122, '20175282', 'Hammes', 'Cormier', 'Jensen', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(123, '20168192', 'Runolfsson', 'Runolfsdottir', 'Jordyn', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(124, '20162359', 'DuBuque', 'Cronin', 'Alaina', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(125, '20156801', 'Lockman', 'Fahey', 'Anais', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(126, '20156303', 'Schmeler', 'Welch', 'Eliezer', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(127, '20157812', 'Douglas', 'Wisozk', 'Ottis', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(128, '20178041', 'Hagenes', 'Barton', 'Chloe', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(129, '20160825', 'Beer', 'Walker', 'Cynthia', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(130, '20152340', 'Schinner', 'Renner', 'Eleonore', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(131, '20160824', 'Cummerata', 'Moore', 'Tianna', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(132, '20176782', 'Homenick', 'Robel', 'Savanah', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(133, '20160708', 'Anderson', 'Roob', 'Jake', 10, 1, 0, 1, NULL, 1, NULL, '2019-05-09 13:03:21'),
(134, '20162303', 'Rutherford', 'Ward', 'Angelina', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(135, '20157171', 'Buckridge', 'Kuhlman', 'Dereck', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(136, '20172370', 'Fisher', 'Kreiger', 'Cora', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(137, '20168873', 'Bradtke', 'Abernathy', 'Keaton', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(138, '20164347', 'Maggio', 'Johnson', 'Holly', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(139, '20167368', 'Satterfield', 'Volkman', 'Graham', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(140, '20160188', 'Fahey', 'Olson', 'Jamal', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(141, '20157510', 'Schumm', 'Cronin', 'Rosalinda', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(142, '20168352', 'Graham', 'Ferry', 'Katharina', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(143, '20169813', 'McGlynn', 'Walter', 'Kenneth', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(144, '20169677', 'Heathcote', 'Stroman', 'Norberto', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(145, '20179088', 'Corkery', 'O\'Reilly', 'Jakob', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(146, '20176335', 'Mayer', 'Langworth', 'Kameron', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(147, '20165693', 'Grant', 'Feeney', 'Brisa', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(148, '20164451', 'Shields', 'Williamson', 'Victor', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(149, '20170759', 'Zieme', 'Stanton', 'Daphney', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(150, '20179657', 'Becker', 'Robel', 'Lucas', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(151, '20173887', 'Goyette', 'Lakin', 'Kristoffer', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(152, '20168367', 'Rowe', 'Kunde', 'Russell', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(153, '20170826', 'Hintz', 'McLaughlin', 'Clement', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(154, '20163318', 'Schaden', 'Schaden', 'Carmela', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(155, '20152595', 'Grady', 'Boyle', 'Lolita', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(156, '20168025', 'Bogan', 'Klocko', 'Baby', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(157, '20179889', 'Huels', 'Dicki', 'Chaim', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(158, '20177439', 'Sporer', 'Schmidt', 'Arely', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(159, '20153062', 'Nitzsche', 'Volkman', 'Leatha', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(160, '20173673', 'Marquardt', 'Reichel', 'Talon', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(161, '20163152', 'Tillman', 'Balistreri', 'Carmine', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(162, '20177960', 'Cummerata', 'Skiles', 'Henry', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(163, '20175933', 'Hansen', 'Wisoky', 'Archibald', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(164, '20161824', 'Kuvalis', 'Braun', 'Caleigh', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(165, '20152203', 'Jacobson', 'Jenkins', 'Misael', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(166, '20178120', 'Abbott', 'Hills', 'Mustafa', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(167, '20155999', 'Gutkowski', 'Gaylord', 'Timmy', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(168, '20167785', 'Shanahan', 'Cole', 'Libby', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(169, '20161562', 'Bosco', 'Heaney', 'Johanna', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(170, '20154920', 'Casper', 'Effertz', 'Brenda', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(171, '20159390', 'Casper', 'Douglas', 'Myron', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(172, '20151259', 'Rogahn', 'Collins', 'Emelie', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(173, '20170164', 'Koelpin', 'Wisoky', 'Davonte', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(174, '20151974', 'Huels', 'Okuneva', 'Lily', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(175, '20151713', 'Collier', 'Rohan', 'Roselyn', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(176, '20160685', 'Hickle', 'Maggio', 'Lucienne', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(177, '20163341', 'Haag', 'Schneider', 'Reagan', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(178, '20154015', 'Boyer', 'Carroll', 'Muriel', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(179, '20168668', 'Waelchi', 'Effertz', 'Woodrow', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(180, '20169704', 'Mertz', 'Sauer', 'Joshuah', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(181, '20165897', 'Kris', 'Hartmann', 'Dax', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(182, '20167590', 'Anderson', 'Barrows', 'Sheila', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(183, '20154099', 'Hettinger', 'Abbott', 'Amaya', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(184, '20167212', 'Dibbert', 'Kub', 'Ezekiel', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(185, '20173989', 'Barrows', 'Schuppe', 'Maida', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(186, '20167227', 'Daniel', 'Bashirian', 'Adella', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(187, '20159422', 'Feil', 'Klein', 'Dorian', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(188, '20166418', 'Blick', 'Crooks', 'Samanta', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(189, '20157843', 'Cremin', 'Conroy', 'Dayton', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(190, '20151909', 'Christiansen', 'Kerluke', 'Santina', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(191, '20156940', 'Kiehn', 'Kiehn', 'Carter', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(192, '20168601', 'Barrows', 'Grant', 'Aaliyah', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(193, '20161740', 'Johnston', 'Langosh', 'Maritza', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(194, '20172217', 'Kihn', 'Beahan', 'Constantin', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(195, '20167295', 'Volkman', 'Mitchell', 'Stephon', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(196, '20173689', 'Bailey', 'Lesch', 'Ryann', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(197, '20162513', 'D\'Amore', 'Emmerich', 'Efren', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(198, '20172558', 'Schulist', 'Dibbert', 'Lilyan', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(199, '20157497', 'Schmeler', 'Bartoletti', 'Alisa', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(200, '20163763', 'Rempel', 'Schoen', 'Audreanne', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(201, '20172152', 'Tillman', 'McGlynn', 'Tad', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(202, '20175624', 'Pagac', 'Carroll', 'Carmelo', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(203, '20152963', 'Goyette', 'Hartmann', 'Willis', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(204, '20175180', 'McKenzie', 'Towne', 'Carissa', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(205, '20164476', 'Beatty', 'Stokes', 'Citlalli', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(206, '20177882', 'Luettgen', 'Bruen', 'Gavin', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(207, '20179305', 'Mosciski', 'Homenick', 'Maribel', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(208, '20172437', 'Spinka', 'Rolfson', 'Nova', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(209, '20174972', 'Beahan', 'Kohler', 'Yolanda', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(210, '20163585', 'Zulauf', 'Gerlach', 'Alejandrin', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(211, '20172077', 'Kemmer', 'Marks', 'Elisabeth', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(212, '20163479', 'Davis', 'Nikolaus', 'Jennings', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(213, '20153937', 'Walker', 'Cummings', 'Rico', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(214, '20162657', 'Mertz', 'Greenfelder', 'Luisa', 9, 1, 0, 1, NULL, 0, NULL, NULL),
(215, '20162877', 'Lakin', 'Krajcik', 'Berneice', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(216, '20159524', 'Gerhold', 'Turner', 'Jodie', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(217, '20156939', 'Bosco', 'Glover', 'Mavis', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(218, '20179715', 'Nienow', 'Wiza', 'Mayra', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(219, '20169183', 'Kuhn', 'Rempel', 'Mac', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(220, '20167729', 'Kub', 'Rippin', 'Daija', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(221, '20159463', 'Keebler', 'Cummings', 'Edgardo', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(222, '20173394', 'Bednar', 'Yost', 'Earline', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(223, '20170400', 'Denesik', 'DuBuque', 'Rolando', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(224, '20163784', 'Bartell', 'Schumm', 'Christa', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(225, '20176331', 'Effertz', 'Aufderhar', 'Grayson', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(226, '20164382', 'Pfeffer', 'Waters', 'Elsa', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(227, '20164319', 'Trantow', 'Quigley', 'Elisha', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(228, '20169946', 'Smitham', 'Conn', 'Ryann', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(229, '20169960', 'Zulauf', 'Collier', 'Maudie', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(230, '20159209', 'Larson', 'Beatty', 'Sasha', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(231, '20156029', 'Gibson', 'Grady', 'Georgette', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(232, '20155387', 'Funk', 'Emard', 'Romaine', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(233, '20151377', 'Kilback', 'Farrell', 'Ottilie', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(234, '20151625', 'Oberbrunner', 'Ankunding', 'Nina', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(235, '20165522', 'Jakubowski', 'Gleichner', 'Gladyce', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(236, '20169254', 'Ferry', 'Anderson', 'Josh', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(237, '20176151', 'Botsford', 'Gottlieb', 'Novella', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(238, '20176147', 'McDermott', 'Frami', 'Hosea', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(239, '20166488', 'Gleason', 'Kuhic', 'London', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(240, '20176051', 'Kunze', 'Dickinson', 'Delphia', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(241, '20167240', 'Kuhn', 'Klein', 'Stephan', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(242, '20166525', 'Larson', 'Toy', 'Stacy', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(243, '20163953', 'Bogan', 'Grimes', 'Margaretta', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(244, '20174883', 'Fisher', 'Keeling', 'Donnell', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(245, '20174101', 'Kiehn', 'Daugherty', 'Elsa', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(246, '20156758', 'Daugherty', 'Schuppe', 'Orlando', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(247, '20158408', 'Kunze', 'Mitchell', 'Lorena', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(248, '20152427', 'Senger', 'Franecki', 'Melvin', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(249, '20158073', 'McDermott', 'Hilpert', 'Electa', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(250, '20163177', 'Beer', 'Waelchi', 'Rachel', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(251, '20169830', 'Bednar', 'Rath', 'Zella', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(252, '20150415', 'Gutmann', 'Sipes', 'Elvie', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(253, '20166567', 'Bernier', 'Paucek', 'Darian', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(254, '20164521', 'Davis', 'Barton', 'Aletha', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(255, '20172653', 'Harber', 'Bednar', 'Lloyd', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(256, '20151901', 'Schmidt', 'Conroy', 'Vincenza', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(257, '20163431', 'McClure', 'Beatty', 'Amir', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(258, '20178330', 'Ritchie', 'Cummerata', 'Adriel', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(259, '20158549', 'Crooks', 'Jast', 'Claude', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(260, '20153787', 'Hermiston', 'Langosh', 'Armando', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(261, '20155354', 'Heidenreich', 'Abshire', 'Giuseppe', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(262, '20177727', 'Fritsch', 'Boyle', 'Liliana', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(263, '20151834', 'Heller', 'Kerluke', 'Stan', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(264, '20154573', 'Dooley', 'Kihn', 'Megane', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(265, '20152108', 'Leffler', 'Bruen', 'Burnice', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(266, '20171076', 'Veum', 'Parisian', 'Emmanuelle', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(267, '20159672', 'Larson', 'Hansen', 'Ellie', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(268, '20151067', 'Bechtelar', 'Lubowitz', 'Chelsey', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(269, '20160215', 'Marks', 'Rodriguez', 'Minerva', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(270, '20150184', 'Wolf', 'O\'Reilly', 'Madelynn', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(271, '20175027', 'Jerde', 'Green', 'Cloyd', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(272, '20171965', 'Parisian', 'Smitham', 'Arvilla', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(273, '20155068', 'Harber', 'Marks', 'Moises', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(274, '20158748', 'Stehr', 'Stroman', 'Maurine', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(275, '20153386', 'Grady', 'Zulauf', 'Priscilla', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(276, '20155186', 'Klein', 'Kemmer', 'Wava', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(277, '20160565', 'McKenzie', 'Macejkovic', 'Arne', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(278, '20175859', 'Moore', 'Strosin', 'Maudie', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(279, '20172203', 'Barrows', 'Parker', 'Annabelle', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(280, '20151681', 'Pfannerstill', 'O\'Conner', 'Nyasia', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(281, '20177205', 'Brown', 'Ernser', 'Rhea', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(282, '20171980', 'Schoen', 'Hayes', 'Trevor', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(283, '20177768', 'Bechtelar', 'McDermott', 'Misael', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(284, '20154806', 'Spinka', 'Ruecker', 'Estevan', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(285, '20169568', 'Tremblay', 'Wisozk', 'Keith', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(286, '20159802', 'Tremblay', 'Stiedemann', 'Quinten', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(287, '20179494', 'Denesik', 'Feil', 'Clair', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(288, '20171156', 'Huel', 'Witting', 'Trinity', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(289, '20176850', 'Donnelly', 'Gerhold', 'Patsy', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(290, '20155457', 'Stamm', 'Rosenbaum', 'Alisha', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(291, '20178870', 'Kub', 'Padberg', 'Monica', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(292, '20167831', 'Krajcik', 'Gutkowski', 'Rey', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(293, '20154708', 'Weimann', 'Hayes', 'Althea', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(294, '20153655', 'Wuckert', 'Aufderhar', 'Rafaela', 10, 1, 0, 1, NULL, 0, NULL, NULL),
(295, '20163633', 'Spencer', 'Collier', 'Peter', 11, 1, 0, 1, NULL, 0, NULL, NULL),
(296, '20151773', 'Bode', 'Blick', 'Odie', 11, 1, 0, 1, NULL, 0, NULL, NULL),
(297, '20169670', 'Hayes', 'O\'Reilly', 'Candace', 11, 1, 0, 1, NULL, 0, NULL, NULL),
(298, '20164880', 'Little', 'King', 'Marisa', 11, 1, 0, 1, NULL, 0, NULL, NULL),
(299, '20170581', 'Hansen', 'Glover', 'Madaline', 11, 1, 0, 1, NULL, 0, NULL, NULL),
(300, '20174386', 'Mayer', 'Lindgren', 'Helen', 11, 1, 0, 1, NULL, 0, NULL, NULL),
(301, '20152425', 'Bergstrom', 'Mante', 'Taya', 11, 1, 0, 1, NULL, 0, NULL, NULL),
(302, '20156993', 'Yost', 'Breitenberg', 'Jermey', 11, 1, 0, 1, NULL, 0, NULL, NULL),
(303, '20177831', 'Casper', 'Bergnaum', 'Keagan', 11, 1, 0, 1, NULL, 0, NULL, NULL),
(304, '20164125', 'Ortiz', 'Kautzer', 'Adolphus', 11, 1, 0, 1, NULL, 0, NULL, NULL),
(305, '20164888', 'Windler', 'Gutkowski', 'Leonel', 11, 1, 0, 1, NULL, 0, NULL, NULL),
(306, '20150573', 'Upton', 'Parker', 'Elliot', 11, 1, 0, 1, NULL, 0, NULL, NULL),
(307, '20152937', 'Dickens', 'Deckow', 'Orland', 11, 1, 0, 1, NULL, 0, NULL, NULL),
(308, '20159806', 'Nolan', 'Grady', 'Louvenia', 11, 1, 0, 1, NULL, 0, NULL, NULL),
(309, '20166678', 'Carter', 'Paucek', 'Vance', 11, 1, 0, 1, NULL, 0, NULL, NULL),
(310, '20159005', 'Kassulke', 'Goyette', 'Madisyn', 11, 1, 0, 1, NULL, 0, NULL, NULL),
(311, '20174014', 'Erdman', 'Christiansen', 'Vernie', 11, 1, 0, 1, NULL, 0, NULL, NULL),
(312, '20151535', 'Jacobs', 'Kreiger', 'Mae', 11, 1, 0, 1, NULL, 0, NULL, NULL),
(313, '20155613', 'Jenkins', 'Thompson', 'Benton', 11, 1, 0, 1, NULL, 0, NULL, NULL),
(314, '20158208', 'Volkman', 'Swift', 'Deron', 11, 1, 0, 1, NULL, 0, NULL, NULL),
(315, '20167675', 'Sawayn', 'Jast', 'Emilio', 11, 1, 0, 1, NULL, 0, NULL, NULL),
(316, '20171736', 'Lindgren', 'Nicolas', 'Gabe', 11, 1, 0, 1, NULL, 0, NULL, NULL),
(317, '20159666', 'Gislason', 'Koelpin', 'Margarete', 11, 1, 0, 1, NULL, 0, NULL, NULL),
(318, '20168782', 'Okuneva', 'Wilderman', 'Sigurd', 11, 1, 0, 1, NULL, 0, NULL, NULL),
(319, '20178276', 'Glover', 'Vandervort', 'Noemi', 11, 1, 0, 1, NULL, 0, NULL, NULL),
(320, '20165461', 'Schowalter', 'Hartmann', 'Jermain', 11, 1, 0, 1, NULL, 0, NULL, NULL),
(321, '20174079', 'Kohler', 'Ferry', 'Julianne', 11, 1, 0, 1, NULL, 0, NULL, NULL),
(322, '20170842', 'Spinka', 'Vandervort', 'Felton', 11, 1, 0, 1, NULL, 0, NULL, NULL),
(323, '20164533', 'Steuber', 'Kozey', 'Citlalli', 11, 1, 0, 1, NULL, 0, NULL, NULL),
(324, '20173874', 'Wunsch', 'Kertzmann', 'Estrella', 11, 1, 0, 1, NULL, 0, NULL, NULL),
(325, '20156056', 'Lynch', 'Leffler', 'Valerie', 11, 1, 0, 1, NULL, 0, NULL, NULL),
(326, '20156335', 'Armstrong', 'Swift', 'Aliyah', 11, 1, 0, 1, NULL, 0, NULL, '2019-05-09 13:16:23'),
(327, '20177601', 'Pollich', 'Kassulke', 'Jadon', 11, 1, 0, 1, NULL, 0, NULL, NULL),
(328, '20168748', 'Flatley', 'Kovacek', 'Cathrine', 11, 1, 0, 1, NULL, 0, NULL, NULL),
(329, '20172642', 'Treutel', 'Hessel', 'Annetta', 11, 1, 0, 1, NULL, 0, NULL, NULL),
(330, '20150478', 'Christiansen', 'Nolan', 'Margarita', 11, 1, 0, 1, NULL, 0, NULL, NULL),
(331, '20178929', 'Dicki', 'Barrows', 'Jeramie', 11, 1, 0, 1, NULL, 0, NULL, NULL),
(332, '20163540', 'Dach', 'Hyatt', 'Arnulfo', 11, 1, 0, 1, NULL, 0, NULL, NULL),
(333, '20150102', 'Walker', 'Haag', 'Ibrahim', 11, 1, 0, 1, NULL, 0, NULL, NULL),
(334, '20164085', 'Schumm', 'Stracke', 'Dandre', 11, 1, 0, 1, NULL, 0, NULL, NULL),
(335, '20156314', 'Gibson', 'Denesik', 'Chadd', 11, 1, 0, 1, NULL, 0, NULL, NULL),
(336, '20157177', 'Jaskolski', 'Anderson', 'Ryder', 11, 1, 0, 1, NULL, 0, NULL, NULL),
(337, '20152177', 'Nader', 'Lakin', 'Millie', 11, 1, 0, 1, NULL, 0, NULL, NULL),
(338, '20155780', 'Weber', 'Trantow', 'Vaughn', 11, 1, 0, 1, NULL, 0, NULL, NULL),
(339, '20169473', 'Champlin', 'Luettgen', 'Ephraim', 11, 1, 0, 1, NULL, 0, NULL, NULL),
(340, '20169757', 'Conroy', 'Adams', 'Ivah', 11, 1, 0, 1, NULL, 0, NULL, NULL),
(341, '20162698', 'Batz', 'Conn', 'Stuart', 11, 1, 0, 1, NULL, 0, NULL, NULL),
(342, '20165038', 'Weber', 'Swaniawski', 'Alycia', 11, 1, 0, 1, NULL, 0, NULL, NULL),
(343, '20176765', 'Dibbert', 'Leannon', 'Garland', 11, 1, 0, 1, NULL, 0, NULL, NULL),
(344, '20174974', 'Wiza', 'Kautzer', 'Geoffrey', 11, 1, 0, 1, NULL, 0, NULL, NULL),
(345, '20173269', 'Bernier', 'Langosh', 'Linda', 11, 1, 0, 1, NULL, 0, NULL, NULL),
(346, '20159529', 'O\'Connell', 'Lind', 'Cecilia', 11, 1, 0, 1, NULL, 0, NULL, NULL),
(347, '20172104', 'Swaniawski', 'Erdman', 'Rex', 11, 1, 0, 1, NULL, 0, NULL, NULL),
(348, '20152271', 'Toy', 'Mertz', 'Arthur', 11, 1, 0, 1, NULL, 0, NULL, NULL),
(349, '20163676', 'Kunze', 'Toy', 'Chesley', 11, 1, 0, 1, NULL, 0, NULL, NULL),
(350, '20174133', 'Prohaska', 'Koss', 'Kyra', 11, 1, 0, 1, NULL, 0, NULL, NULL),
(351, '20172744', 'Rippin', 'Christiansen', 'Estel', 11, 1, 0, 1, NULL, 0, NULL, NULL),
(352, '20176601', 'Olson', 'Shields', 'Ashlynn', 11, 1, 0, 1, NULL, 0, NULL, NULL),
(353, '20166978', 'Roob', 'Parker', 'Idella', 11, 1, 0, 1, NULL, 0, NULL, NULL),
(354, '20175137', 'Lemke', 'Sanford', 'Virginia', 11, 1, 0, 1, NULL, 0, NULL, NULL),
(355, '20156653', 'Bradtke', 'Cassin', 'Tyree', 11, 1, 0, 1, NULL, 0, NULL, NULL),
(356, '20150063', 'Roberts', 'Blick', 'Jensen', 11, 1, 0, 1, NULL, 0, NULL, NULL),
(357, '20166213', 'Mueller', 'Schinner', 'Tyson', 11, 1, 0, 1, NULL, 0, NULL, NULL),
(358, '20179876', 'DuBuque', 'Rippin', 'Velda', 11, 1, 0, 1, NULL, 0, NULL, NULL),
(359, '20152064', 'Tillman', 'Shields', 'Tristian', 11, 1, 0, 1, NULL, 0, NULL, NULL),
(360, '20174324', 'Rempel', 'Daniel', 'Dino', 11, 1, 0, 1, NULL, 0, NULL, NULL),
(361, '20171689', 'Vandervort', 'Balistreri', 'Foster', 11, 1, 0, 1, NULL, 0, NULL, NULL),
(362, '20172140', 'Shanahan', 'Barrows', 'Carmel', 11, 1, 0, 1, NULL, 0, NULL, NULL),
(363, '20160098', 'Bartoletti', 'Dickens', 'Karlie', 11, 1, 0, 1, NULL, 0, NULL, '2019-05-09 13:16:25'),
(364, '20151927', 'Turner', 'Torp', 'Dell', 11, 1, 0, 1, NULL, 0, NULL, NULL),
(365, '20157768', 'Jakubowski', 'Satterfield', 'Lyric', 11, 1, 0, 1, NULL, 0, NULL, NULL),
(366, '20178717', 'McClure', 'Schowalter', 'Amparo', 11, 1, 0, 1, NULL, 0, NULL, NULL),
(367, '20176740', 'Spinka', 'Hermann', 'Shannon', 11, 1, 0, 1, NULL, 0, NULL, NULL),
(368, '20162908', 'Swaniawski', 'Sporer', 'Evans', 12, 1, 0, 1, NULL, 0, NULL, NULL),
(369, '20159129', 'Kutch', 'Jerde', 'Jeramie', 12, 1, 0, 1, NULL, 0, NULL, NULL),
(370, '20166807', 'Rolfson', 'Dickens', 'Elvie', 12, 1, 0, 1, NULL, 0, NULL, NULL),
(371, '20158065', 'Cartwright', 'Kassulke', 'Juanita', 12, 1, 0, 1, NULL, 0, NULL, NULL),
(372, '20152069', 'Prohaska', 'Adams', 'Zena', 12, 1, 0, 1, NULL, 0, NULL, NULL),
(373, '20164686', 'Jenkins', 'Fritsch', 'Carmelo', 12, 1, 0, 1, NULL, 0, NULL, NULL),
(374, '20162446', 'Witting', 'Thiel', 'Abdul', 12, 1, 0, 1, NULL, 0, NULL, NULL),
(375, '20158920', 'Kutch', 'Torphy', 'Fernando', 12, 1, 0, 1, NULL, 0, NULL, NULL),
(376, '20154620', 'Bauch', 'Rath', 'Josiah', 12, 1, 0, 1, NULL, 0, NULL, NULL),
(377, '20160302', 'Mueller', 'Farrell', 'Sierra', 12, 1, 0, 1, NULL, 0, NULL, NULL),
(378, '20164100', 'Streich', 'Connelly', 'Aileen', 12, 1, 0, 1, NULL, 0, NULL, NULL),
(379, '20163334', 'Reichert', 'Treutel', 'Delpha', 12, 1, 0, 1, NULL, 0, NULL, NULL),
(380, '20170038', 'Rohan', 'Mertz', 'Monserrate', 12, 1, 0, 1, NULL, 0, NULL, NULL),
(381, '20156293', 'Rosenbaum', 'Johnston', 'Antonetta', 12, 1, 0, 1, NULL, 0, NULL, NULL),
(382, '20166087', 'Skiles', 'Klein', 'Morton', 12, 1, 0, 1, NULL, 0, NULL, NULL),
(383, '20155115', 'Fisher', 'Skiles', 'Coralie', 12, 1, 0, 1, NULL, 0, NULL, NULL),
(384, '20159509', 'McKenzie', 'Batz', 'Adeline', 12, 1, 0, 1, NULL, 0, NULL, NULL),
(385, '20177889', 'Moen', 'Dietrich', 'Grayson', 12, 1, 0, 1, NULL, 0, NULL, NULL),
(386, '20159585', 'Mertz', 'Ryan', 'Noelia', 12, 1, 0, 1, NULL, 0, NULL, NULL),
(387, '20151782', 'Becker', 'Hill', 'Garrett', 12, 1, 0, 1, NULL, 0, NULL, NULL),
(388, '20161213', 'Pacocha', 'Adams', 'Christine', 12, 1, 0, 1, NULL, 0, NULL, NULL),
(389, '20157396', 'Kautzer', 'Balistreri', 'Johanna', 12, 1, 0, 1, NULL, 0, NULL, NULL),
(390, '20164919', 'Maggio', 'Stehr', 'Wyatt', 12, 1, 0, 1, NULL, 0, NULL, NULL),
(391, '20157637', 'Greenholt', 'D\'Amore', 'Vinnie', 12, 1, 0, 1, NULL, 0, NULL, NULL),
(392, '20152575', 'Schaefer', 'Mills', 'Corrine', 12, 1, 0, 1, NULL, 0, NULL, NULL),
(393, '20178450', 'Flatley', 'Lueilwitz', 'Eino', 12, 1, 0, 1, NULL, 0, NULL, NULL),
(394, '20167057', 'Osinski', 'Baumbach', 'Luciano', 12, 1, 0, 1, NULL, 0, NULL, NULL),
(395, '20167393', 'Rippin', 'Lockman', 'Bethany', 12, 1, 0, 1, NULL, 0, NULL, NULL),
(396, '20165584', 'Ebert', 'Bauch', 'Elda', 12, 1, 0, 1, NULL, 0, NULL, NULL),
(397, '20171221', 'Nienow', 'Mertz', 'Jedediah', 12, 1, 0, 1, NULL, 0, NULL, NULL),
(398, '20154411', 'Mann', 'Medhurst', 'Joannie', 12, 1, 0, 1, NULL, 0, NULL, NULL),
(399, '20167852', 'Bradtke', 'Hegmann', 'Amaya', 12, 1, 0, 1, NULL, 0, NULL, NULL),
(400, '20179164', 'Erdman', 'Johnson', 'Eda', 12, 1, 0, 1, NULL, 0, NULL, NULL),
(401, '20152757', 'Larson', 'Crooks', 'Roger', 12, 1, 0, 1, NULL, 0, NULL, NULL),
(402, '20169564', 'Goodwin', 'Rutherford', 'Elody', 12, 1, 0, 1, NULL, 0, NULL, NULL),
(403, '20173344', 'Wolff', 'Klein', 'Luna', 12, 1, 0, 1, NULL, 0, NULL, NULL),
(404, '20162942', 'Ledner', 'Tillman', 'Tristian', 12, 1, 0, 1, NULL, 0, NULL, NULL),
(405, '20150185', 'Torphy', 'Kuhlman', 'Rosemarie', 12, 1, 0, 1, NULL, 0, NULL, NULL),
(406, '20177212', 'Batz', 'Nikolaus', 'Jennifer', 12, 1, 0, 1, NULL, 0, NULL, NULL),
(407, '20172101', 'Reichel', 'Kuphal', 'Chase', 12, 1, 0, 1, NULL, 0, NULL, NULL),
(408, '20171171', 'Friesen', 'Romaguera', 'Mikayla', 12, 1, 0, 1, NULL, 0, NULL, NULL),
(409, '20166656', 'Howell', 'Stroman', 'Freddie', 12, 1, 0, 1, NULL, 0, NULL, NULL),
(410, '20178528', 'Harber', 'Braun', 'Avery', 12, 1, 0, 1, NULL, 0, NULL, NULL),
(411, '20155497', 'Hyatt', 'Ruecker', 'Dewitt', 12, 1, 0, 1, NULL, 0, NULL, NULL),
(412, '20165162', 'Nader', 'Abshire', 'Wendy', 12, 1, 0, 1, NULL, 0, NULL, NULL),
(413, '20158751', 'Kassulke', 'Marvin', 'Kyler', 12, 1, 0, 1, NULL, 0, NULL, NULL),
(414, '20172344', 'Cormier', 'Volkman', 'Nels', 12, 1, 0, 1, NULL, 0, NULL, NULL),
(415, '20165128', 'Purdy', 'Huel', 'Antonio', 12, 1, 0, 1, NULL, 0, NULL, NULL),
(416, '20164360', 'Johns', 'Flatley', 'Minnie', 12, 1, 0, 1, NULL, 0, NULL, NULL),
(417, '20167767', 'Schaefer', 'Murazik', 'Deron', 12, 1, 0, 1, NULL, 0, NULL, NULL),
(418, '20163942', 'Kunde', 'Schiller', 'Aniya', 12, 1, 0, 1, NULL, 0, NULL, NULL),
(419, '20178079', 'Aufderhar', 'Witting', 'Providenci', 12, 1, 0, 1, NULL, 0, NULL, NULL),
(420, '20176423', 'Hagenes', 'Collier', 'Aurelio', 12, 1, 0, 1, NULL, 0, NULL, NULL),
(421, '20169309', 'Wolf', 'Denesik', 'Rossie', 12, 1, 0, 1, NULL, 0, NULL, NULL),
(422, '20150428', 'Kuphal', 'Hoeger', 'Magdalen', 12, 1, 0, 1, NULL, 0, NULL, NULL),
(423, '20164636', 'Padberg', 'Senger', 'Zack', 12, 1, 0, 1, NULL, 0, NULL, NULL),
(424, '20171250', 'Bauch', 'Parisian', 'Haleigh', 12, 1, 0, 1, NULL, 0, NULL, NULL),
(425, '20178731', 'Keebler', 'Little', 'Vern', 12, 1, 0, 1, NULL, 0, NULL, NULL),
(426, '20179734', 'Corkery', 'Rogahn', 'Travis', 12, 1, 0, 1, NULL, 0, NULL, NULL),
(427, '20161654', 'Rau', 'Homenick', 'Margaretta', 12, 1, 0, 1, NULL, 0, NULL, NULL),
(428, '20179513', 'Bergnaum', 'Emmerich', 'Ozella', 12, 1, 0, 1, NULL, 0, NULL, NULL),
(429, '20167442', 'Jaskolski', 'Lakin', 'Leslie', 12, 1, 0, 1, NULL, 0, NULL, NULL),
(430, '20178494', 'Jones', 'Leuschke', 'Sibyl', 12, 1, 0, 1, NULL, 0, NULL, NULL),
(431, '20164948', 'Eichmann', 'McClure', 'Hollie', 12, 1, 0, 1, NULL, 0, NULL, NULL),
(432, '20173908', 'Reilly', 'Terry', 'Bridgette', 12, 1, 0, 1, NULL, 0, NULL, NULL),
(433, '20153642', 'Boehm', 'Berge', 'Dessie', 12, 1, 0, 1, NULL, 0, NULL, NULL),
(434, '20157064', 'Mueller', 'Walsh', 'Clemmie', 12, 1, 0, 1, NULL, 0, NULL, NULL),
(435, '20170430', 'Rowe', 'Kulas', 'Herman', 12, 1, 0, 1, NULL, 0, NULL, NULL),
(436, '20173768', 'Hill', 'Erdman', 'Dallin', 12, 1, 0, 1, NULL, 0, NULL, NULL),
(437, '20171438', 'Paucek', 'Wilderman', 'Tyrese', 12, 1, 0, 1, NULL, 0, NULL, NULL),
(438, '20175563', 'Hane', 'Howe', 'Marc', 12, 1, 0, 1, NULL, 0, NULL, NULL),
(439, '20166101', 'Lindgren', 'Bailey', 'Gaylord', 12, 1, 0, 1, NULL, 0, NULL, NULL),
(440, '20157233', 'Ferry', 'Gottlieb', 'Bernice', 12, 1, 0, 1, NULL, 0, NULL, NULL),
(441, '20165830', 'Wiegand', 'Roberts', 'Kay', 12, 1, 0, 1, NULL, 0, NULL, NULL),
(442, '20166930', 'Von', 'Spencer', 'Jovanny', 12, 1, 0, 1, NULL, 0, NULL, NULL),
(443, '20155662', 'Bahringer', 'Ratke', 'Chelsie', 12, 1, 0, 1, NULL, 0, NULL, NULL),
(444, '20171707', 'Swaniawski', 'Kessler', 'Micaela', 12, 1, 0, 1, NULL, 0, NULL, NULL),
(445, '20171637', 'White', 'Homenick', 'Kurtis', 12, 1, 0, 1, NULL, 0, NULL, NULL),
(446, '20176113', 'Larkin', 'Gottlieb', 'Jacques', 12, 1, 0, 1, NULL, 0, NULL, NULL),
(447, '20179195', 'Cartwright', 'Auer', 'Cecelia', 12, 1, 0, 1, NULL, 0, NULL, NULL),
(448, '20172216', 'Batz', 'Franecki', 'Roberta', 12, 1, 0, 1, NULL, 0, NULL, NULL),
(449, '20170801', 'Doyle', 'Rutherford', 'Jovan', 12, 1, 0, 1, NULL, 0, NULL, NULL),
(450, '20175916', 'Davis', 'Beahan', 'Nicolas', 12, 1, 0, 1, NULL, 0, NULL, NULL),
(451, '20153945', 'Schiller', 'Steuber', 'Geovanny', 12, 1, 0, 1, NULL, 0, NULL, NULL),
(452, '20176718', 'Stehr', 'Kautzer', 'Kameron', 12, 1, 0, 1, NULL, 0, NULL, NULL),
(453, '20160214', 'Dooley', 'Nolan', 'Osbaldo', 12, 1, 0, 1, NULL, 0, NULL, NULL),
(454, '20164009', 'Purdy', 'Kuvalis', 'Kale', 12, 1, 0, 1, NULL, 0, NULL, NULL),
(455, '20152964', 'McLaughlin', 'Swaniawski', 'Pinkie', 12, 1, 0, 1, NULL, 0, NULL, NULL),
(456, '20150206', 'Schaefer', 'Hagenes', 'Hank', 12, 1, 0, 1, NULL, 0, NULL, NULL),
(457, '20158204', 'Rice', 'Kuvalis', 'Vada', 12, 1, 0, 1, NULL, 0, NULL, NULL),
(458, '20170139', 'Baumbach', 'Nader', 'Dashawn', 12, 1, 0, 1, NULL, 0, NULL, NULL),
(459, '20150830', 'Hoeger', 'Yost', 'Celine', 12, 1, 0, 1, NULL, 0, NULL, NULL),
(460, '20172985', 'Gottlieb', 'Romaguera', 'Eloise', 12, 1, 0, 1, NULL, 0, NULL, NULL),
(461, '20153719', 'Fadel', 'Hand', 'Sofia', 12, 1, 0, 1, NULL, 0, NULL, NULL),
(462, '20158721', 'Gottlieb', 'Cummerata', 'Pearlie', 12, 1, 0, 1, NULL, 0, NULL, NULL),
(463, '20176975', 'Price', 'Olson', 'Wilfredo', 12, 1, 0, 1, NULL, 0, NULL, NULL),
(464, '20163059', 'Pollich', 'Rowe', 'Kadin', 13, 1, 0, 1, NULL, 0, NULL, NULL),
(465, '20174742', 'Gutkowski', 'Greenfelder', 'Shaun', 13, 1, 0, 1, NULL, 0, NULL, NULL),
(466, '20172739', 'Stroman', 'Lakin', 'Edward', 13, 1, 0, 1, NULL, 0, NULL, NULL),
(467, '20168581', 'Gislason', 'Hyatt', 'Eduardo', 13, 1, 0, 1, NULL, 0, NULL, NULL),
(468, '20151897', 'Aufderhar', 'Ledner', 'Faustino', 13, 1, 0, 1, NULL, 0, NULL, NULL),
(469, '20150487', 'Gerlach', 'Dietrich', 'Shakira', 13, 1, 0, 1, NULL, 0, NULL, NULL),
(470, '20175378', 'Boyle', 'Upton', 'Reilly', 13, 1, 0, 1, NULL, 0, NULL, NULL),
(471, '20173703', 'Marks', 'Weissnat', 'Winfield', 13, 1, 0, 1, NULL, 0, NULL, NULL),
(472, '20163634', 'Hoeger', 'Haag', 'Jammie', 13, 1, 0, 1, NULL, 0, NULL, NULL),
(473, '20170699', 'Flatley', 'Rohan', 'Susie', 13, 1, 0, 1, NULL, 0, NULL, NULL),
(474, '20160353', 'Schaden', 'Stracke', 'Shirley', 13, 1, 0, 1, NULL, 0, NULL, NULL),
(475, '20165115', 'Huels', 'D\'Amore', 'Jovany', 13, 1, 0, 1, NULL, 0, NULL, NULL),
(476, '20154844', 'O\'Conner', 'Toy', 'Gunner', 13, 1, 0, 1, NULL, 0, NULL, NULL),
(477, '20152786', 'Armstrong', 'Schmidt', 'Emmitt', 13, 1, 0, 1, NULL, 0, NULL, NULL),
(478, '20170196', 'Wolff', 'Fay', 'Johathan', 13, 1, 0, 1, NULL, 0, NULL, NULL),
(479, '20173831', 'Stokes', 'Stroman', 'Kali', 13, 1, 0, 1, NULL, 0, NULL, NULL),
(480, '20157656', 'Shanahan', 'O\'Reilly', 'Yasmin', 13, 1, 0, 1, NULL, 0, NULL, NULL),
(481, '20172109', 'Casper', 'Barton', 'Prince', 13, 1, 0, 1, NULL, 0, NULL, NULL),
(482, '20154049', 'Cruickshank', 'Jacobson', 'Barton', 13, 1, 0, 1, NULL, 0, NULL, NULL),
(483, '20168304', 'Zemlak', 'Armstrong', 'Avery', 13, 1, 0, 1, NULL, 0, NULL, NULL),
(484, '20168427', 'Schneider', 'Volkman', 'Adriel', 13, 1, 0, 1, NULL, 0, NULL, NULL),
(485, '20162508', 'Brekke', 'Beatty', 'Bettie', 13, 1, 0, 1, NULL, 0, NULL, NULL),
(486, '20150814', 'Wyman', 'Hermann', 'Ayana', 13, 1, 0, 1, NULL, 0, NULL, NULL),
(487, '20166178', 'Adams', 'Prohaska', 'Karelle', 13, 1, 0, 1, NULL, 0, NULL, NULL),
(488, '20173625', 'Kirlin', 'Witting', 'Geoffrey', 13, 1, 0, 1, NULL, 0, NULL, NULL),
(489, '20173270', 'Barrows', 'Swaniawski', 'Herminia', 13, 1, 0, 1, NULL, 0, NULL, NULL),
(490, '20158690', 'Schulist', 'Eichmann', 'Noah', 13, 1, 0, 1, NULL, 0, NULL, NULL),
(491, '20164516', 'Bode', 'Hermiston', 'Kathleen', 13, 1, 0, 1, NULL, 0, NULL, NULL),
(492, '20177454', 'Hickle', 'Jaskolski', 'Kaleigh', 13, 1, 0, 1, NULL, 0, NULL, NULL),
(493, '20152020', 'Sawayn', 'Hand', 'Verla', 13, 1, 0, 1, NULL, 0, NULL, NULL),
(494, '20165836', 'Ortiz', 'Wilkinson', 'Lloyd', 13, 1, 0, 1, NULL, 0, NULL, NULL),
(495, '20164438', 'Schinner', 'Kuhic', 'Anastacio', 13, 1, 0, 1, NULL, 0, NULL, NULL),
(496, '20159895', 'Bogan', 'Huels', 'Treva', 13, 1, 0, 1, NULL, 0, NULL, NULL),
(497, '20171618', 'Stokes', 'Denesik', 'Isabelle', 13, 1, 0, 1, NULL, 0, NULL, NULL),
(498, '20166578', 'Erdman', 'Rowe', 'Theo', 13, 1, 0, 1, NULL, 0, NULL, NULL),
(499, '20173664', 'Bode', 'Grant', 'Garret', 13, 1, 0, 1, NULL, 0, NULL, NULL),
(500, '20176786', 'King', 'Tromp', 'Colt', 13, 1, 0, 1, NULL, 0, NULL, NULL),
(501, '20173420', 'Hegmann', 'Mitchell', 'Cesar', 13, 1, 0, 1, NULL, 0, NULL, NULL),
(502, '20174797', 'Rosenbaum', 'Ankunding', 'Javon', 13, 1, 0, 1, NULL, 0, NULL, NULL),
(503, '20156650', 'O\'Keefe', 'Nikolaus', 'Karson', 13, 1, 0, 1, NULL, 0, NULL, NULL),
(504, '20175229', 'Wilderman', 'Thiel', 'Madyson', 13, 1, 0, 1, NULL, 0, NULL, NULL),
(505, '20155015', 'Mitchell', 'Sawayn', 'Princess', 13, 1, 0, 1, NULL, 0, NULL, NULL),
(506, '20170473', 'Jacobi', 'Kozey', 'Elna', 13, 1, 0, 1, NULL, 0, NULL, NULL),
(507, '20157549', 'Gaylord', 'Pacocha', 'Rosendo', 13, 1, 0, 1, NULL, 0, NULL, NULL),
(508, '20159528', 'Keeling', 'Schmeler', 'Davin', 13, 1, 0, 1, NULL, 0, NULL, NULL),
(509, '20154263', 'Nolan', 'Gusikowski', 'Cristian', 13, 1, 0, 1, NULL, 0, NULL, NULL),
(510, '20160068', 'Bosco', 'Russel', 'Anissa', 13, 1, 0, 1, NULL, 0, NULL, NULL),
(511, '20174026', 'Cole', 'Medhurst', 'Minnie', 13, 1, 0, 1, NULL, 0, NULL, NULL),
(512, '20164021', 'Smith', 'Dickinson', 'Sanford', 13, 1, 0, 1, NULL, 0, NULL, NULL),
(513, '20177860', 'Cruickshank', 'Parker', 'Oswaldo', 13, 1, 0, 1, NULL, 0, NULL, NULL),
(514, '20174938', 'Zulauf', 'Grimes', 'Kaleigh', 13, 1, 0, 1, NULL, 0, NULL, NULL),
(515, '20154684', 'Hand', 'Renner', 'Robin', 13, 1, 0, 1, NULL, 0, NULL, NULL),
(516, '20170172', 'Rogahn', 'Gutkowski', 'Krystina', 14, 1, 0, 1, NULL, 0, NULL, NULL),
(517, '20176168', 'Gaylord', 'Feeney', 'Alejandrin', 14, 1, 0, 1, NULL, 0, NULL, NULL),
(518, '20176489', 'Corwin', 'Littel', 'Benedict', 14, 1, 0, 1, NULL, 0, NULL, NULL),
(519, '20157601', 'Rowe', 'Kuhn', 'Darius', 14, 1, 0, 1, NULL, 0, NULL, NULL),
(520, '20161028', 'Pollich', 'Gaylord', 'Chris', 14, 1, 0, 1, NULL, 0, NULL, NULL),
(521, '20162559', 'Robel', 'McKenzie', 'Garry', 14, 1, 0, 1, NULL, 0, NULL, NULL),
(522, '20176866', 'Bernier', 'Tillman', 'Abel', 14, 1, 0, 1, NULL, 0, NULL, NULL),
(523, '20168548', 'Reichert', 'Lynch', 'Bria', 14, 1, 0, 1, NULL, 0, NULL, NULL),
(524, '20169857', 'Bogan', 'Daniel', 'Abe', 14, 1, 0, 1, NULL, 0, NULL, NULL),
(525, '20153189', 'Dibbert', 'Mayer', 'Brenda', 14, 1, 0, 1, NULL, 0, NULL, NULL),
(526, '20177969', 'Robel', 'Wolff', 'Summer', 14, 1, 0, 1, NULL, 0, NULL, NULL),
(527, '20178817', 'Mueller', 'Hoeger', 'Austyn', 14, 1, 0, 1, NULL, 0, NULL, NULL),
(528, '20151159', 'Keeling', 'Stamm', 'Garrick', 14, 1, 0, 1, NULL, 0, NULL, NULL),
(529, '20160254', 'Reilly', 'Glover', 'Jacques', 14, 1, 0, 1, NULL, 0, NULL, NULL),
(530, '20178090', 'Herzog', 'Skiles', 'Henri', 14, 1, 0, 1, NULL, 0, NULL, NULL),
(531, '20154340', 'Lindgren', 'Funk', 'Keyon', 14, 1, 0, 1, NULL, 0, NULL, NULL),
(532, '20164065', 'Maggio', 'Borer', 'Lesley', 14, 1, 0, 1, NULL, 0, NULL, NULL),
(533, '20157166', 'Wiegand', 'Hane', 'Christophe', 14, 1, 0, 1, NULL, 0, NULL, NULL),
(534, '20165231', 'Langworth', 'Pacocha', 'Esteban', 14, 1, 0, 1, NULL, 0, NULL, NULL),
(535, '20162826', 'Marks', 'Flatley', 'Carlos', 14, 1, 0, 1, NULL, 0, NULL, NULL),
(536, '20155734', 'Bartoletti', 'Rau', 'Deion', 14, 1, 0, 1, NULL, 0, NULL, NULL),
(537, '20174980', 'Marks', 'Cremin', 'Lempi', 14, 1, 0, 1, NULL, 0, NULL, NULL),
(538, '20160325', 'Donnelly', 'Mayer', 'Katarina', 14, 1, 0, 1, NULL, 0, NULL, NULL),
(539, '20157159', 'Kutch', 'Goldner', 'Marlon', 14, 1, 0, 1, NULL, 0, NULL, NULL),
(540, '20161933', 'Runte', 'Kovacek', 'Mariah', 14, 1, 0, 1, NULL, 0, NULL, NULL),
(541, '20174028', 'Reichel', 'Labadie', 'Cleve', 14, 1, 0, 1, NULL, 0, NULL, NULL),
(542, '20172852', 'Hermiston', 'Koch', 'Gabriella', 14, 1, 0, 1, NULL, 0, NULL, NULL),
(543, '20153327', 'McGlynn', 'Fisher', 'Jennie', 14, 1, 0, 1, NULL, 0, NULL, NULL),
(544, '20166512', 'Reichert', 'Aufderhar', 'Valentina', 14, 1, 0, 1, NULL, 0, NULL, NULL),
(545, '20167028', 'Koepp', 'Runte', 'Gay', 14, 1, 0, 1, NULL, 0, NULL, NULL),
(546, '20175761', 'Marquardt', 'Boyer', 'Caitlyn', 14, 1, 0, 1, NULL, 0, NULL, NULL),
(547, '20171333', 'Kuphal', 'Terry', 'Bryon', 14, 1, 0, 1, NULL, 0, NULL, NULL),
(548, '20155798', 'Larson', 'Kessler', 'Yasmeen', 14, 1, 0, 1, NULL, 0, NULL, NULL),
(549, '20151331', 'Harvey', 'O\'Keefe', 'Rae', 14, 1, 0, 1, NULL, 0, NULL, NULL),
(550, '20175748', 'Roberts', 'Olson', 'Xzavier', 14, 1, 0, 1, NULL, 0, NULL, NULL),
(551, '20170077', 'Batz', 'Lindgren', 'Lesly', 14, 1, 0, 1, NULL, 0, NULL, NULL),
(552, '20174001', 'Denesik', 'Becker', 'Vada', 14, 1, 0, 1, NULL, 0, NULL, NULL),
(553, '20169886', 'Labadie', 'Zboncak', 'Adrain', 14, 1, 0, 1, NULL, 0, NULL, NULL),
(554, '20152278', 'Jacobi', 'Hermiston', 'Cathrine', 14, 1, 0, 1, NULL, 0, NULL, NULL),
(555, '20155177', 'Okuneva', 'Harber', 'Lexie', 14, 1, 0, 1, NULL, 0, NULL, NULL),
(556, '20171494', 'Quitzon', 'Volkman', 'Celine', 14, 1, 0, 1, NULL, 0, NULL, NULL),
(557, '20175851', 'Windler', 'Trantow', 'Blaze', 14, 1, 0, 1, NULL, 0, NULL, NULL),
(558, '20155965', 'Hammes', 'Fritsch', 'Amy', 14, 1, 0, 1, NULL, 0, NULL, NULL),
(559, '20162352', 'Morar', 'Swaniawski', 'Lia', 14, 1, 0, 1, NULL, 0, NULL, NULL),
(560, '20157728', 'Zulauf', 'Reynolds', 'Hershel', 14, 1, 0, 1, NULL, 0, NULL, NULL),
(561, '20163032', 'Bruen', 'Jakubowski', 'Jay', 14, 1, 0, 1, NULL, 0, NULL, NULL),
(562, '20178121', 'Shanahan', 'Bergnaum', 'Sharon', 14, 1, 0, 1, NULL, 0, NULL, NULL),
(563, '20175250', 'Schinner', 'Daugherty', 'Romaine', 14, 1, 0, 1, NULL, 0, NULL, NULL),
(564, '20172061', 'Dooley', 'Block', 'Rico', 14, 1, 0, 1, NULL, 0, NULL, NULL),
(565, '20155126', 'Cremin', 'Schaden', 'Nathanael', 14, 1, 0, 1, NULL, 0, NULL, NULL),
(566, '20179866', 'Mante', 'Windler', 'Lyric', 14, 1, 0, 1, NULL, 0, NULL, NULL),
(567, '20174260', 'Cruickshank', 'Grimes', 'Dora', 14, 1, 0, 1, NULL, 0, NULL, NULL),
(568, '20165062', 'Roob', 'Bernier', 'Wilbert', 14, 1, 0, 1, NULL, 0, NULL, NULL),
(569, '20170290', 'Mann', 'Frami', 'Enola', 14, 1, 0, 1, NULL, 0, NULL, NULL),
(570, '20168787', 'Reynolds', 'Bergstrom', 'Jazmin', 14, 1, 0, 1, NULL, 0, NULL, NULL),
(571, '20178001', 'Bosco', 'Wuckert', 'Zelma', 14, 1, 0, 1, NULL, 0, NULL, NULL),
(572, '20167656', 'Brown', 'Boyle', 'Mekhi', 14, 1, 0, 1, NULL, 0, NULL, NULL),
(573, '20178955', 'Johnson', 'VonRueden', 'Sunny', 14, 1, 0, 1, NULL, 0, NULL, NULL),
(574, '20157953', 'Wunsch', 'Kohler', 'Linwood', 14, 1, 0, 1, NULL, 0, NULL, NULL),
(575, '20162265', 'Hane', 'Abernathy', 'Seth', 14, 1, 0, 1, NULL, 0, NULL, NULL),
(576, '20155210', 'Renner', 'Weimann', 'Estevan', 14, 1, 0, 1, NULL, 0, NULL, NULL),
(577, '20173704', 'Rice', 'O\'Connell', 'Lamar', 14, 1, 0, 1, NULL, 0, NULL, NULL),
(578, '20157957', 'Erdman', 'Emard', 'Brennon', 14, 1, 0, 1, NULL, 0, NULL, NULL),
(579, '20151203', 'Ebert', 'Huel', 'Zoila', 14, 1, 0, 1, NULL, 0, NULL, NULL),
(580, '20158601', 'Wolff', 'Daniel', 'Marielle', 14, 1, 0, 1, NULL, 0, NULL, NULL),
(581, '20170453', 'Kirlin', 'VonRueden', 'Gerhard', 14, 1, 0, 1, NULL, 0, NULL, NULL),
(582, '20152128', 'Windler', 'King', 'Clemmie', 14, 1, 0, 1, NULL, 0, NULL, NULL),
(583, '20151627', 'Mohr', 'O\'Conner', 'Izabella', 14, 1, 0, 1, NULL, 0, NULL, NULL),
(584, '20177846', 'Hyatt', 'Stamm', 'Norene', 14, 1, 0, 1, NULL, 0, NULL, NULL),
(585, '20179725', 'Leannon', 'Russel', 'Madilyn', 14, 1, 0, 1, NULL, 0, NULL, NULL),
(586, '20158737', 'Rice', 'Kuhn', 'Palma', 14, 1, 0, 1, NULL, 0, NULL, NULL),
(587, '20158933', 'Koss', 'Emard', 'Afton', 14, 1, 0, 1, NULL, 0, NULL, NULL),
(588, '20177103', 'Lueilwitz', 'Tremblay', 'Carmella', 14, 1, 0, 1, NULL, 0, NULL, NULL),
(589, '20157859', 'Tromp', 'Rice', 'Patrick', 14, 1, 0, 1, NULL, 0, NULL, NULL),
(590, '20172183', 'Cruickshank', 'Schoen', 'Dariana', 14, 1, 0, 1, NULL, 0, NULL, NULL),
(591, '20150635', 'Swaniawski', 'Hackett', 'Alexane', 14, 1, 0, 1, NULL, 0, NULL, NULL),
(592, '20167687', 'Rolfson', 'Hagenes', 'Viola', 14, 1, 0, 1, NULL, 0, NULL, NULL),
(593, '20178295', 'Bernhard', 'Stroman', 'Queenie', 14, 1, 0, 1, NULL, 0, NULL, NULL),
(594, '20174336', 'Ryan', 'Hauck', 'Herbert', 14, 1, 0, 1, NULL, 0, NULL, NULL),
(595, '20161877', 'Balistreri', 'Spinka', 'Enrique', 14, 1, 0, 1, NULL, 0, NULL, NULL),
(596, '20179188', 'Zemlak', 'Kerluke', 'John', 14, 1, 0, 1, NULL, 0, NULL, NULL),
(597, '20167726', 'Mayert', 'Johnson', 'Devonte', 14, 1, 0, 1, NULL, 0, NULL, NULL),
(598, '20152730', 'Hudson', 'O\'Connell', 'Jamel', 14, 1, 0, 1, NULL, 0, NULL, NULL),
(599, '20152484', 'Doyle', 'Nicolas', 'Rosalind', 14, 1, 0, 1, NULL, 0, NULL, NULL),
(600, '20158036', 'McLaughlin', 'Johnston', 'Braulio', 14, 1, 0, 1, NULL, 0, NULL, NULL),
(601, '20152480', 'Rau', 'Stehr', 'Alize', 14, 1, 0, 1, NULL, 0, NULL, NULL),
(602, '20173446', 'Hermiston', 'Jast', 'Levi', 14, 1, 0, 1, NULL, 0, NULL, NULL),
(603, '20152034', 'Barton', 'Jacobson', 'Joseph', 14, 1, 0, 1, NULL, 0, NULL, NULL),
(604, '20155259', 'Wintheiser', 'Nicolas', 'Kaleb', 14, 1, 0, 1, NULL, 0, NULL, NULL),
(605, '20154174', 'Halvorson', 'O\'Hara', 'Aniya', 14, 1, 0, 1, NULL, 0, NULL, NULL);
INSERT INTO `etudiants` (`idetudiants`, `matricule`, `nom`, `postnom`, `prenom`, `idauditoires`, `annee_acad`, `frais`, `idprofils`, `commentaire`, `statut`, `created_at`, `updated_at`) VALUES
(606, '20158292', 'Koch', 'Gleichner', 'Laverne', 14, 1, 0, 1, NULL, 0, NULL, NULL),
(607, '20167039', 'Rath', 'Blanda', 'Jamil', 14, 1, 0, 1, NULL, 0, NULL, NULL),
(608, '20172275', 'Ebert', 'Goldner', 'Lawrence', 15, 1, 0, 1, NULL, 0, NULL, NULL),
(609, '20152398', 'Kihn', 'Pfeffer', 'Florian', 15, 1, 0, 1, NULL, 0, NULL, NULL),
(610, '20159910', 'Kertzmann', 'Walter', 'Hildegard', 15, 1, 0, 1, NULL, 0, NULL, NULL),
(611, '20162588', 'Moore', 'Langworth', 'Wilburn', 15, 1, 0, 1, NULL, 0, NULL, NULL),
(612, '20165872', 'Ryan', 'Lubowitz', 'Felix', 15, 1, 0, 1, NULL, 0, NULL, NULL),
(613, '20162603', 'Koepp', 'Reilly', 'Colby', 15, 1, 0, 1, NULL, 0, NULL, NULL),
(614, '20176973', 'Upton', 'Hansen', 'Mary', 15, 1, 0, 1, NULL, 0, NULL, NULL),
(615, '20176054', 'Purdy', 'Lang', 'Andres', 15, 1, 0, 1, NULL, 0, NULL, NULL),
(616, '20169981', 'Thiel', 'Conroy', 'Heloise', 15, 1, 0, 1, NULL, 0, NULL, NULL),
(617, '20155248', 'Hirthe', 'Ankunding', 'Simeon', 15, 1, 0, 1, NULL, 0, NULL, NULL),
(618, '20178182', 'Herman', 'Mertz', 'Jerrell', 15, 1, 0, 1, NULL, 0, NULL, NULL),
(619, '20170999', 'Douglas', 'Ernser', 'Brennan', 15, 1, 0, 1, NULL, 0, NULL, NULL),
(620, '20159062', 'Rice', 'Sanford', 'Orval', 15, 1, 0, 1, NULL, 0, NULL, NULL),
(621, '20163662', 'Cruickshank', 'Mertz', 'Haylee', 15, 1, 0, 1, NULL, 0, NULL, NULL),
(622, '20175668', 'Ortiz', 'Rempel', 'Rosa', 15, 1, 0, 1, NULL, 0, NULL, NULL),
(623, '20153114', 'Graham', 'Schmitt', 'Oceane', 15, 1, 0, 1, NULL, 0, NULL, NULL),
(624, '20154291', 'Dickinson', 'O\'Conner', 'Harry', 15, 1, 0, 1, NULL, 0, NULL, NULL),
(625, '20166464', 'Purdy', 'Schmeler', 'Flo', 15, 1, 0, 1, NULL, 0, NULL, NULL),
(626, '20159140', 'Kris', 'Heller', 'Hailie', 15, 1, 0, 1, NULL, 0, NULL, NULL),
(627, '20168643', 'Eichmann', 'Hilpert', 'Ethel', 15, 1, 0, 1, NULL, 0, NULL, NULL),
(628, '20167211', 'Hudson', 'Harris', 'Jessika', 15, 1, 0, 1, NULL, 0, NULL, NULL),
(629, '20161266', 'Schaden', 'Collins', 'Joe', 15, 1, 0, 1, NULL, 0, NULL, NULL),
(630, '20166889', 'West', 'Witting', 'Benjamin', 15, 1, 0, 1, NULL, 0, NULL, NULL),
(631, '20177888', 'Abbott', 'Bode', 'Ellis', 15, 1, 0, 1, NULL, 0, NULL, NULL),
(632, '20170309', 'Little', 'Kozey', 'Abraham', 15, 1, 0, 1, NULL, 0, NULL, NULL),
(633, '20164051', 'Cassin', 'Barton', 'Theron', 15, 1, 0, 1, NULL, 0, NULL, NULL),
(634, '20163638', 'Treutel', 'Beatty', 'Maiya', 15, 1, 0, 1, NULL, 0, NULL, NULL),
(635, '20167155', 'Wiegand', 'Stehr', 'Clara', 15, 1, 0, 1, NULL, 0, NULL, NULL),
(636, '20153542', 'Mertz', 'Emmerich', 'Devonte', 15, 1, 0, 1, NULL, 0, NULL, NULL),
(637, '20155379', 'Rau', 'O\'Conner', 'Arnoldo', 15, 1, 0, 1, NULL, 0, NULL, NULL),
(638, '20172855', 'Torphy', 'Kohler', 'Lacey', 15, 1, 0, 1, NULL, 0, NULL, NULL),
(639, '20178176', 'Jones', 'VonRueden', 'Alexie', 15, 1, 0, 1, NULL, 0, NULL, NULL),
(640, '20158672', 'Schaefer', 'Durgan', 'Misty', 15, 1, 0, 1, NULL, 0, NULL, NULL),
(641, '20156919', 'Schowalter', 'Ernser', 'Eldora', 15, 1, 0, 1, NULL, 0, NULL, NULL),
(642, '20170222', 'Conroy', 'Orn', 'Shanel', 15, 1, 0, 1, NULL, 0, NULL, NULL),
(643, '20160198', 'Grimes', 'Volkman', 'Jadyn', 15, 1, 0, 1, NULL, 0, NULL, NULL),
(644, '20177720', 'Kemmer', 'Smitham', 'Ali', 16, 1, 0, 1, NULL, 0, NULL, NULL),
(645, '20162662', 'Hickle', 'Huel', 'Kristina', 16, 1, 0, 1, NULL, 0, NULL, NULL),
(646, '20174698', 'Wilderman', 'Hansen', 'Katlyn', 16, 1, 0, 1, NULL, 0, NULL, NULL),
(647, '20157806', 'Cole', 'Klocko', 'Bessie', 16, 1, 0, 1, NULL, 0, NULL, NULL),
(648, '20151284', 'Friesen', 'Mitchell', 'Paris', 16, 1, 0, 1, NULL, 0, NULL, NULL),
(649, '20170508', 'O\'Reilly', 'Rempel', 'Howell', 16, 1, 0, 1, NULL, 0, NULL, NULL),
(650, '20165081', 'Eichmann', 'Welch', 'Lucienne', 16, 1, 0, 1, NULL, 0, NULL, NULL),
(651, '20156233', 'Stamm', 'Kassulke', 'Rose', 16, 1, 0, 1, NULL, 0, NULL, NULL),
(652, '20164436', 'Eichmann', 'Simonis', 'Lue', 16, 1, 0, 1, NULL, 0, NULL, NULL),
(653, '20166526', 'Gorczany', 'Baumbach', 'Jaylin', 16, 1, 0, 1, NULL, 0, NULL, NULL),
(654, '20152270', 'Daniel', 'Bogan', 'Lyric', 16, 1, 0, 1, NULL, 0, NULL, NULL),
(655, '20174595', 'Hand', 'Bayer', 'Llewellyn', 16, 1, 0, 1, NULL, 0, NULL, NULL),
(656, '20161949', 'Mante', 'Altenwerth', 'Nicolas', 16, 1, 0, 1, NULL, 0, NULL, NULL),
(657, '20154484', 'Weimann', 'Pacocha', 'Zachariah', 16, 1, 0, 1, NULL, 0, NULL, NULL),
(658, '20178437', 'Cassin', 'Lubowitz', 'Shyann', 16, 1, 0, 1, NULL, 0, NULL, NULL),
(659, '20152627', 'Jast', 'Hoppe', 'Christiana', 16, 1, 0, 1, NULL, 0, NULL, NULL),
(660, '20166611', 'Nader', 'Cronin', 'Caitlyn', 16, 1, 0, 1, NULL, 0, NULL, NULL),
(661, '20151759', 'Willms', 'McClure', 'Marcelina', 16, 1, 0, 1, NULL, 0, NULL, NULL),
(662, '20154732', 'Maggio', 'Effertz', 'Triston', 16, 1, 0, 1, NULL, 0, NULL, NULL),
(663, '20150896', 'Romaguera', 'Simonis', 'Jesse', 16, 1, 0, 1, NULL, 0, NULL, NULL),
(664, '20170537', 'Renner', 'Legros', 'Carole', 16, 1, 0, 1, NULL, 0, NULL, NULL),
(665, '20160558', 'Carroll', 'Walsh', 'Isabelle', 16, 1, 0, 1, NULL, 0, NULL, NULL),
(666, '20165663', 'Nienow', 'Russel', 'Mitchell', 16, 1, 0, 1, NULL, 0, NULL, NULL),
(667, '20175967', 'Raynor', 'Cole', 'Leif', 16, 1, 0, 1, NULL, 0, NULL, NULL),
(668, '20154027', 'Ledner', 'Wisozk', 'Sebastian', 16, 1, 0, 1, NULL, 0, NULL, NULL),
(669, '20152814', 'Wolf', 'Collier', 'Gianni', 16, 1, 0, 1, NULL, 0, NULL, NULL),
(670, '20179920', 'Mills', 'Padberg', 'Murphy', 16, 1, 0, 1, NULL, 0, NULL, NULL),
(671, '20172220', 'Herman', 'Hessel', 'Ryder', 16, 1, 0, 1, NULL, 0, NULL, NULL),
(672, '20163106', 'Considine', 'Rempel', 'Vincenza', 16, 1, 0, 1, NULL, 0, NULL, NULL),
(673, '20166763', 'Kirlin', 'Bradtke', 'Madie', 16, 1, 0, 1, NULL, 0, NULL, NULL),
(674, '20171445', 'Wintheiser', 'Buckridge', 'Martina', 16, 1, 0, 1, NULL, 0, NULL, NULL),
(675, '20157726', 'Hackett', 'Witting', 'Kane', 16, 1, 0, 1, NULL, 0, NULL, NULL),
(676, '20175195', 'Kemmer', 'Tromp', 'Moses', 16, 1, 0, 1, NULL, 0, NULL, NULL),
(677, '20170122', 'Stamm', 'O\'Conner', 'Tristian', 16, 1, 0, 1, NULL, 0, NULL, NULL),
(678, '20163425', 'Hackett', 'Pfannerstill', 'Katelyn', 16, 1, 0, 1, NULL, 0, NULL, NULL),
(679, '20165195', 'DuBuque', 'Conroy', 'Sydnee', 16, 1, 0, 1, NULL, 0, NULL, NULL),
(680, '20168175', 'Torphy', 'Kemmer', 'Florian', 16, 1, 0, 1, NULL, 0, NULL, NULL),
(681, '20164026', 'Boyle', 'Runolfsson', 'Maiya', 16, 1, 0, 1, NULL, 0, NULL, NULL),
(682, '20152055', 'Roberts', 'Hills', 'Maiya', 16, 1, 0, 1, NULL, 0, NULL, NULL),
(683, '20176180', 'Haag', 'Skiles', 'Adele', 16, 1, 0, 1, NULL, 0, NULL, NULL),
(684, '20175824', 'Paucek', 'Waelchi', 'Talia', 16, 1, 0, 1, NULL, 0, NULL, NULL),
(685, '20169314', 'Hudson', 'Langosh', 'Fern', 16, 1, 0, 1, NULL, 0, NULL, NULL),
(686, '20151093', 'Zieme', 'Wisoky', 'Mafalda', 16, 1, 0, 1, NULL, 0, NULL, NULL),
(687, '20156338', 'Stoltenberg', 'Nitzsche', 'Louisa', 16, 1, 0, 1, NULL, 0, NULL, NULL),
(688, '20157086', 'Fritsch', 'Grant', 'Josefina', 16, 1, 0, 1, NULL, 0, NULL, NULL),
(689, '20170925', 'Morissette', 'Ruecker', 'Frankie', 16, 1, 0, 1, NULL, 0, NULL, NULL),
(690, '20157613', 'Stokes', 'Koch', 'Evans', 16, 1, 0, 1, NULL, 0, NULL, NULL),
(691, '20175719', 'Pouros', 'Jenkins', 'Aniyah', 16, 1, 0, 1, NULL, 0, NULL, NULL),
(692, '20166199', 'Shanahan', 'Daugherty', 'Jewell', 16, 1, 0, 1, NULL, 0, NULL, NULL),
(693, '20173759', 'Yundt', 'Becker', 'Javon', 16, 1, 0, 1, NULL, 0, NULL, NULL),
(694, '20162552', 'Schultz', 'Stoltenberg', 'Lurline', 16, 1, 0, 1, NULL, 0, NULL, NULL),
(695, '20165087', 'Hamill', 'Rippin', 'Santos', 16, 1, 0, 1, NULL, 0, NULL, NULL),
(696, '20176346', 'Murphy', 'Larson', 'Alvina', 16, 1, 0, 1, NULL, 0, NULL, NULL),
(697, '20163514', 'Smitham', 'Hermann', 'Jaclyn', 16, 1, 0, 1, NULL, 0, NULL, NULL),
(698, '20172919', 'Cronin', 'Quitzon', 'Augustus', 16, 1, 0, 1, NULL, 0, NULL, NULL),
(699, '20172047', 'Gerhold', 'Reichert', 'Valentina', 16, 1, 0, 1, NULL, 0, NULL, NULL),
(700, '20160412', 'Nader', 'Upton', 'Maud', 16, 1, 0, 1, NULL, 0, NULL, NULL),
(701, '20156910', 'Kohler', 'Schimmel', 'Elza', 16, 1, 0, 1, NULL, 0, NULL, NULL),
(702, '20159608', 'Mitchell', 'Jones', 'Xzavier', 16, 1, 0, 1, NULL, 0, NULL, NULL),
(703, '20168745', 'Klein', 'Stiedemann', 'Cruz', 16, 1, 0, 1, NULL, 0, NULL, NULL),
(704, '20153612', 'Hoppe', 'Friesen', 'Abigayle', 16, 1, 0, 1, NULL, 0, NULL, NULL),
(705, '20156606', 'Leuschke', 'Kuvalis', 'Louvenia', 16, 1, 0, 1, NULL, 0, NULL, NULL),
(706, '20169953', 'Halvorson', 'Lind', 'Cassidy', 16, 1, 0, 1, NULL, 0, NULL, NULL),
(707, '20150982', 'Metz', 'Rempel', 'Shaun', 16, 1, 0, 1, NULL, 0, NULL, NULL),
(708, '20156433', 'Lynch', 'Bechtelar', 'Caleigh', 16, 1, 0, 1, NULL, 0, NULL, NULL),
(709, '20165331', 'West', 'Wiza', 'Nicklaus', 16, 1, 0, 1, NULL, 0, NULL, NULL),
(710, '20156689', 'Barton', 'Weimann', 'Carlie', 16, 1, 0, 1, NULL, 0, NULL, NULL),
(711, '20161939', 'Willms', 'Hahn', 'Ruthe', 16, 1, 0, 1, NULL, 0, NULL, NULL),
(712, '20166786', 'Satterfield', 'Williamson', 'Marquise', 16, 1, 0, 1, NULL, 0, NULL, NULL),
(713, '20162249', 'Murphy', 'Runte', 'Charity', 16, 1, 0, 1, NULL, 0, NULL, NULL),
(714, '20156047', 'Kozey', 'Gusikowski', 'Deangelo', 16, 1, 0, 1, NULL, 0, NULL, NULL),
(715, '20171867', 'Lang', 'Schroeder', 'Destini', 16, 1, 0, 1, NULL, 0, NULL, NULL),
(716, '20151479', 'Swaniawski', 'Ortiz', 'Kennedi', 16, 1, 0, 1, NULL, 0, NULL, NULL),
(717, '20166354', 'Glover', 'Lindgren', 'Alta', 16, 1, 0, 1, NULL, 0, NULL, NULL),
(718, '20168757', 'Donnelly', 'Pollich', 'Nicklaus', 16, 1, 0, 1, NULL, 0, NULL, NULL),
(719, '20173885', 'Murray', 'Hessel', 'Odessa', 16, 1, 0, 1, NULL, 0, NULL, NULL),
(720, '20176044', 'Krajcik', 'Simonis', 'Destinee', 16, 1, 0, 1, NULL, 0, NULL, NULL),
(721, '20155119', 'Greenfelder', 'Haley', 'Vincenzo', 16, 1, 0, 1, NULL, 0, NULL, NULL),
(722, '20151892', 'Konopelski', 'Zemlak', 'Juston', 16, 1, 0, 1, NULL, 0, NULL, NULL),
(723, '20179352', 'Balistreri', 'Ward', 'Sedrick', 16, 1, 0, 1, NULL, 0, NULL, NULL),
(724, '20170558', 'Schowalter', 'Wintheiser', 'Cynthia', 16, 1, 0, 1, NULL, 0, NULL, NULL),
(725, '20173595', 'Roberts', 'Bradtke', 'Oral', 16, 1, 0, 1, NULL, 0, NULL, NULL),
(726, '20158399', 'O\'Keefe', 'Hahn', 'Herminia', 16, 1, 0, 1, NULL, 0, NULL, NULL),
(727, '20161171', 'Yundt', 'Crooks', 'Lew', 16, 1, 0, 1, NULL, 0, NULL, NULL),
(728, '20159323', 'Schmitt', 'Streich', 'Andre', 16, 1, 0, 1, NULL, 0, NULL, NULL),
(729, '20168398', 'Cassin', 'Runolfsson', 'Toni', 16, 1, 0, 1, NULL, 0, NULL, NULL),
(730, '20162654', 'Wiegand', 'Schroeder', 'Brown', 16, 1, 0, 1, NULL, 0, NULL, NULL),
(731, '200000', 'Dialu', 'Krisa', 'Peniel', 10, 1, 350000, 2, 'ceci est un commentaire', 0, '2019-05-08 20:23:58', '2019-05-09 13:03:11');

-- --------------------------------------------------------

--
-- Structure de la table `facultes`
--

CREATE TABLE `facultes` (
  `idfacultes` int(10) UNSIGNED NOT NULL,
  `lib` varchar(65) COLLATE utf8_unicode_ci NOT NULL,
  `abbr` varchar(65) COLLATE utf8_unicode_ci NOT NULL,
  `idsections` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `facultes`
--

INSERT INTO `facultes` (`idfacultes`, `lib`, `abbr`, `idsections`) VALUES
(1, 'INFORMATIQUE INDUSTRIELLE ET RESEAU', 'IIR', 1),
(2, 'INFORMATIQUE DE GESTION', 'IG', 1),
(3, 'INFORMATIQUE INDUSTRIEL ', 'II', 1);

-- --------------------------------------------------------

--
-- Structure de la table `gestion_annees`
--

CREATE TABLE `gestion_annees` (
  `idgestion_annees` int(10) UNSIGNED NOT NULL,
  `annee_debut` year(4) NOT NULL,
  `annee_fin` year(4) NOT NULL,
  `annee_format` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `statut` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `gestion_annees`
--

INSERT INTO `gestion_annees` (`idgestion_annees`, `annee_debut`, `annee_fin`, `annee_format`, `statut`, `created_at`, `updated_at`) VALUES
(1, 2018, 2019, '2018-2019', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contenu de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_100000_create_password_resets_table', 1),
(2, '2019_05_07_150142_creation_des_tables', 1);

-- --------------------------------------------------------

--
-- Structure de la table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `profils`
--

CREATE TABLE `profils` (
  `idprofils` int(11) NOT NULL,
  `lib` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `profils`
--

INSERT INTO `profils` (`idprofils`, `lib`) VALUES
(1, 'Ordinaire'),
(2, 'Ayant droit');

-- --------------------------------------------------------

--
-- Structure de la table `promotions`
--

CREATE TABLE `promotions` (
  `idpromotions` int(10) UNSIGNED NOT NULL,
  `lib` varchar(65) COLLATE utf8_unicode_ci NOT NULL,
  `abbr` varchar(65) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `promotions`
--

INSERT INTO `promotions` (`idpromotions`, `lib`, `abbr`) VALUES
(1, 'Préparatoire', 'PREPO'),
(2, 'Prémier Graduat', 'G1'),
(3, 'Deuxième Graduant', 'G2'),
(4, 'Troisième Graduat', 'G3'),
(5, 'Prémier License ', 'L1'),
(6, 'Deuxième License ', 'L2');

-- --------------------------------------------------------

--
-- Structure de la table `sections`
--

CREATE TABLE `sections` (
  `idsections` int(10) UNSIGNED NOT NULL,
  `lib` varchar(65) COLLATE utf8_unicode_ci NOT NULL,
  `abbr` varchar(65) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `sections`
--

INSERT INTO `sections` (`idsections`, `lib`, `abbr`) VALUES
(1, 'INFORMATIQUE', 'INFO');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `idusers` int(10) UNSIGNED NOT NULL,
  `username` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(65) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(65) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(65) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `idsections` int(10) UNSIGNED DEFAULT NULL,
  `idusers_roles` int(10) UNSIGNED NOT NULL,
  `statut` tinyint(1) NOT NULL DEFAULT '1',
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `users`
--

INSERT INTO `users` (`idusers`, `username`, `name`, `first_name`, `email`, `email_verified_at`, `password`, `idsections`, `idusers_roles`, `statut`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'secinformatique', 'Sécretaire ', 'Informatique', NULL, NULL, '$2y$10$qrxzKyhKIl5lzC9XqMeBKeyDK1lgD3dj/wvE8Ly6Y7D4DOUjl8LQ2', 1, 2, 1, NULL, NULL, NULL),
(3, 'comptable', 'comptable_nom', 'comptable_prenom', NULL, NULL, '$2y$10$qrxzKyhKIl5lzC9XqMeBKeyDK1lgD3dj/wvE8Ly6Y7D4DOUjl8LQ2', NULL, 1, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `users_roles`
--

CREATE TABLE `users_roles` (
  `idusers_roles` int(10) UNSIGNED NOT NULL,
  `lib` varchar(65) COLLATE utf8_unicode_ci NOT NULL,
  `level` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `users_roles`
--

INSERT INTO `users_roles` (`idusers_roles`, `lib`, `level`) VALUES
(1, 'comptabilite', 3),
(2, 'section', 2),
(3, 'admin', 10);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `auditoires`
--
ALTER TABLE `auditoires`
  ADD PRIMARY KEY (`idauditoires`),
  ADD KEY `auditoires_idfacultes_foreign` (`idfacultes`),
  ADD KEY `auditoires_idpromotions_foreign` (`idpromotions`),
  ADD KEY `auditoires_idsections_foreign` (`idsections`);

--
-- Index pour la table `enroles`
--
ALTER TABLE `enroles`
  ADD PRIMARY KEY (`idenroles`);

--
-- Index pour la table `etudiants`
--
ALTER TABLE `etudiants`
  ADD PRIMARY KEY (`idetudiants`),
  ADD UNIQUE KEY `etudiants_matricule_unique` (`matricule`),
  ADD KEY `etudiants_idauditoires_foreign` (`idauditoires`),
  ADD KEY `etudiants_annee_acad_foreign` (`annee_acad`);

--
-- Index pour la table `facultes`
--
ALTER TABLE `facultes`
  ADD PRIMARY KEY (`idfacultes`),
  ADD KEY `facultes_idsections_foreign` (`idsections`);

--
-- Index pour la table `gestion_annees`
--
ALTER TABLE `gestion_annees`
  ADD PRIMARY KEY (`idgestion_annees`);

--
-- Index pour la table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Index pour la table `promotions`
--
ALTER TABLE `promotions`
  ADD PRIMARY KEY (`idpromotions`);

--
-- Index pour la table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`idsections`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`idusers`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_idsections_foreign` (`idsections`),
  ADD KEY `users_idusers_roles_foreign` (`idusers_roles`);

--
-- Index pour la table `users_roles`
--
ALTER TABLE `users_roles`
  ADD PRIMARY KEY (`idusers_roles`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `auditoires`
--
ALTER TABLE `auditoires`
  MODIFY `idauditoires` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT pour la table `enroles`
--
ALTER TABLE `enroles`
  MODIFY `idenroles` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pour la table `etudiants`
--
ALTER TABLE `etudiants`
  MODIFY `idetudiants` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=732;
--
-- AUTO_INCREMENT pour la table `facultes`
--
ALTER TABLE `facultes`
  MODIFY `idfacultes` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pour la table `gestion_annees`
--
ALTER TABLE `gestion_annees`
  MODIFY `idgestion_annees` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `promotions`
--
ALTER TABLE `promotions`
  MODIFY `idpromotions` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT pour la table `sections`
--
ALTER TABLE `sections`
  MODIFY `idsections` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `idusers` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pour la table `users_roles`
--
ALTER TABLE `users_roles`
  MODIFY `idusers_roles` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `auditoires`
--
ALTER TABLE `auditoires`
  ADD CONSTRAINT `auditoires_idfacultes_foreign` FOREIGN KEY (`idfacultes`) REFERENCES `facultes` (`idfacultes`),
  ADD CONSTRAINT `auditoires_idpromotions_foreign` FOREIGN KEY (`idpromotions`) REFERENCES `promotions` (`idpromotions`),
  ADD CONSTRAINT `auditoires_idsections_foreign` FOREIGN KEY (`idsections`) REFERENCES `sections` (`idsections`);

--
-- Contraintes pour la table `etudiants`
--
ALTER TABLE `etudiants`
  ADD CONSTRAINT `etudiants_annee_acad_foreign` FOREIGN KEY (`annee_acad`) REFERENCES `gestion_annees` (`idgestion_annees`) ON DELETE CASCADE,
  ADD CONSTRAINT `etudiants_idauditoires_foreign` FOREIGN KEY (`idauditoires`) REFERENCES `auditoires` (`idauditoires`) ON DELETE CASCADE;

--
-- Contraintes pour la table `facultes`
--
ALTER TABLE `facultes`
  ADD CONSTRAINT `facultes_idsections_foreign` FOREIGN KEY (`idsections`) REFERENCES `sections` (`idsections`) ON DELETE CASCADE;

--
-- Contraintes pour la table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_idsections_foreign` FOREIGN KEY (`idsections`) REFERENCES `sections` (`idsections`) ON DELETE CASCADE,
  ADD CONSTRAINT `users_idusers_roles_foreign` FOREIGN KEY (`idusers_roles`) REFERENCES `users_roles` (`idusers_roles`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;