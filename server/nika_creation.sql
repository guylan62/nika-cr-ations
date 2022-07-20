-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 20 juin 2022 à 15:59
-- Version du serveur : 10.4.24-MariaDB
-- Version de PHP : 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `nika_creation`
--

-- --------------------------------------------------------

--
-- Structure de la table `address`
--

CREATE TABLE `address` (
  `Id_address` int(11) NOT NULL,
  `street` varchar(255) NOT NULL,
  `number` int(11) NOT NULL,
  `apartment_number` int(11) NOT NULL,
  `message` text DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `update_at` datetime DEFAULT NULL,
  `Id_town` int(11) NOT NULL,
  `Id_address_type` int(11) NOT NULL,
  `Id_person` int(11) NOT NULL,
  `email` varchar(155) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `address_type`
--

CREATE TABLE `address_type` (
  `Id_address_type` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `is_active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `appartenir`
--

CREATE TABLE `appartenir` (
  `Id_town` int(11) NOT NULL,
  `Id_country` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `bill`
--

CREATE TABLE `bill` (
  `Id_bill` int(11) NOT NULL,
  `bill_number` varchar(155) NOT NULL,
  `created_at` datetime NOT NULL,
  `paymeny_method` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `bill_line`
--

CREATE TABLE `bill_line` (
  `Id_delivery` int(11) NOT NULL,
  `Id_order` int(11) NOT NULL,
  `Id_order_line` int(11) NOT NULL,
  `Id_delivery_line` int(11) NOT NULL,
  `Id_bill` int(11) NOT NULL,
  `Id_bill_line` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `amount_excl_tax` decimal(15,2) NOT NULL,
  `amount_vat` decimal(15,2) NOT NULL,
  `percent_vat` decimal(15,2) NOT NULL,
  `amount_all_tax` decimal(15,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `category_1`
--

CREATE TABLE `category_1` (
  `Id_category_1` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `slug` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `category_1`
--

INSERT INTO `category_1` (`Id_category_1`, `name`, `slug`) VALUES
(1, 't-shirt', 't-shirt'),
(2, 'pull', 'pull'),
(3, 'eco responsable', 'eco-responsable'),
(4, 'accessoires', 'accessoires'),
(5, 'unvers enfant', 'univers-enfant');

-- --------------------------------------------------------

--
-- Structure de la table `category_2`
--

CREATE TABLE `category_2` (
  `Id_category_2` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `slug` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `category_2`
--

INSERT INTO `category_2` (`Id_category_2`, `name`, `slug`) VALUES
(1, 'hiver', 'hiver'),
(2, 'printemps', 'printemps'),
(3, 'été', 'été'),
(4, 'automne', 'automne');

-- --------------------------------------------------------

--
-- Structure de la table `comment`
--

CREATE TABLE `comment` (
  `Id_rating` int(11) NOT NULL,
  `title` varchar(155) DEFAULT NULL,
  `content` text NOT NULL,
  `created_at` datetime NOT NULL,
  `Id_shop` int(11) NOT NULL,
  `Id_person` int(11) NOT NULL,
  `email` varchar(155) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `country`
--

CREATE TABLE `country` (
  `Id_country` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `customer`
--

CREATE TABLE `customer` (
  `Id_person` int(11) NOT NULL,
  `email` varchar(155) NOT NULL,
  `last_login` datetime NOT NULL,
  `Id_role` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `customer`
--

INSERT INTO `customer` (`Id_person`, `email`, `last_login`, `Id_role`) VALUES
(1, 'nikacreations07@gmail.com', '2022-06-15 14:38:23', 1);

-- --------------------------------------------------------

--
-- Structure de la table `delivery`
--

CREATE TABLE `delivery` (
  `Id_delivery` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `update_at` datetime DEFAULT NULL,
  `shipped_at` datetime DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `Id_address` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `delivery_line`
--

CREATE TABLE `delivery_line` (
  `Id_delivery` int(11) NOT NULL,
  `Id_order` int(11) NOT NULL,
  `Id_order_line` int(11) NOT NULL,
  `Id_delivery_line` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `order_line`
--

CREATE TABLE `order_line` (
  `Id_order` int(11) NOT NULL,
  `Id_order_line` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `amount_excl_tax` decimal(15,2) NOT NULL,
  `amount_vat` decimal(15,2) NOT NULL,
  `Id_payment` int(11) NOT NULL,
  `Id_product` int(11) NOT NULL,
  `Id_discount` int(11) NOT NULL,
  `Id_vat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `payment`
--

CREATE TABLE `payment` (
  `Id_payment` int(11) NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `created_at` datetime NOT NULL,
  `update_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `payment_method`
--

CREATE TABLE `payment_method` (
  `Id_payment_method` int(11) NOT NULL,
  `code` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `is_enabled` tinyint(1) NOT NULL,
  `Id_payment` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `picture`
--

CREATE TABLE `picture` (
  `Id_picture` int(11) NOT NULL,
  `image_name` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `Id_product` int(11) NOT NULL,
  `Id_shop` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `product`
--

CREATE TABLE `product` (
  `Id_product` int(11) NOT NULL,
  `name` varchar(155) NOT NULL,
  `description` text DEFAULT NULL,
  `extra` varchar(155) DEFAULT NULL,
  `price_excl_tax` decimal(15,2) NOT NULL,
  `slug` varchar(155) NOT NULL,
  `created_at` datetime NOT NULL,
  `update_at` datetime DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `Id_category_2` int(11) DEFAULT NULL,
  `Id_shop` int(11) NOT NULL,
  `Id_category_1` int(11) NOT NULL,
  `color` varchar(50) DEFAULT NULL,
  `size` varchar(50) DEFAULT NULL,
  `pattern` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `product`
--

INSERT INTO `product` (`Id_product`, `name`, `description`, `extra`, `price_excl_tax`, `slug`, `created_at`, `update_at`, `enabled`, `Id_category_2`, `Id_shop`, `Id_category_1`, `color`, `size`, `pattern`) VALUES
(1, 'j\'peux pas j\'ai tir a l\'arc', 'Je vous propose un t-shirt avec ce jolie motif.\r\n\r\nMatière douce et confortable.\r\nCoupe tubulaire.\r\nTaille unisexe.\r\nEncolure ronde.\r\n100% coton\r\nCertifié oeko-texT\r\nT-shirt couleur - motif blanc\r\nT-shirt blanc - motif noir\r\nINFO: au vu des ruptures fournisseurs ,le délai de préparation de commande est estimé à une semaine minimum. Merci\r\n\r\nLavage à l\'envers 30 degrés en machine. Ne pas repasser le motif !! repassage sur l\'envers du t-shirt.\r\n\r\nFlocage par transfert', 'classique', '18.50', 'j-peux-pas-j-ai-tir-a-l-arc', '2022-06-16 13:22:37', NULL, 1, 3, 1, 1, 'blanc', 's', NULL),
(2, 'j\'peux pas j\'ai...', 'T-shirt J\'peux pas j\'ai .... à vous de choisir la suite !\r\n\r\nMatière douce et confortable.\r\nCoupe tubulaire.\r\nTaille unisexe.\r\nEncolure ronde.\r\n100% coton\r\nCertifié oeko-tex\r\nINFO: au vu des ruptures fournisseurs ,le délai de préparation de commande est estimé à une semaine minimum. Merci\r\n\r\nLavage à l\'envers 30 degrés en machine. Ne pas repasser le motif !! repassage sur l\'envers du t-shirt.\r\n\r\nFlocage par transfert.\r\n\r\nTaxes incluses. Frais d\'expédition calculés lors du paiement.', 'personnalisé', '21.99', 'j-peux-pas-j-ai', '2022-06-16 13:22:37', NULL, 1, 3, 1, 1, 'noir', 'm', NULL),
(3, 'pull hope', 'Unisexe.\r\n80% coton / 20% polyester.\r\nEn molleton gratté pour un confort optimal.\r\nIdéal pour un porter quotidien et décontracté.\r\nBas de manches et de vêtement.\r\nFinition bord-côte encolure\r\nCertifié STANDARD 100 by OEKO-TEX\r\nFlocage flex OEKO-TEX\r\nGrammage 280 g/m²\r\nINFO: au vu des ruptures fournisseurs ,le délai de préparation de commande est estimé à une semaine minimum. Merci\r\n\r\n\r\nLavage à l\'envers 30 degrés en machine. Ne pas repasser le motif !! repassage sur l\'envers du t-shirt.\r\n\r\nTaxes incluses. Frais d\'expédition calculés lors du paiement.', 'pull', '32.50', 'pull-hope', '2022-06-16 13:26:36', NULL, 1, 1, 1, 2, 'navy', 'xs', NULL),
(4, 'pull a capuche give', '50% coton / 50% polyester.\r\nUnisexe\r\nMolleton gratté.\r\nBord inférieur et poignets en élasthanne.\r\nPoche kangourou.\r\nCapuche à deux pans avec cordon.\r\nCertifié STANDARD 100 by OEKO-TEX.\r\nGrammage 270 g/m².\r\nFlocage par transfert OEKO-TEX.\r\nINFO: au vu des ruptures fournisseurs ,le délai de préparation de commande est estimé à une semaine minimum. Merci\r\n\r\n\r\nLavage à l\'envers 30 degrés en machine. Ne pas repasser le motif !! repassage sur l\'envers du t-shirt.\r\n\r\nTaxes incluses. Frais d\'expédition calculés lors du paiement.', 'capuche', '42.50', 'pull-a-capuche-give', '2022-06-16 13:32:51', NULL, 1, 1, 1, 2, 'bleu', '2xl', NULL),
(5, 'grandes lingettes', 'Je vous propose un lot de 6 lingettes fait main.\r\nTissu coton,\r\nEponge bambou certifié okeo-tex.\r\n6 lingettes environ 10X10\r\nLavage en machine 40 degrés\r\nTaxes incluses. Frais d\'expédition calculés lors du paiement.', 'lingettes', '11.50', 'grandes-lingettes', '2022-06-16 13:35:38', NULL, 1, NULL, 1, 3, NULL, NULL, 'écaille'),
(6, 'filet de lavage rose', 'Filet de lavage pour machine à laver. Fait main.\r\n\r\nMotif fleur rose\r\n\r\nTissu filet mesh 100% Polyester.\r\nTissu motif 100% coton.\r\nFermeture par cordon.\r\nDimension 11x22cm env\r\nDimension 15x20cm env\r\nDimension 21.5x16.5cm env\r\nTaxes incluses. Frais d\'expédition calculés lors du paiement.', 'filet de lavage', '6.50', 'filet-de-lavage-rose', '2022-06-16 13:35:38', NULL, 1, NULL, 1, 3, NULL, '11x22cm', NULL),
(7, 'bagagerie', 'Je vous propose une pochette de toilette plate fait main.\r\n\r\nTissu enduit imperméable extérieur.\r\nDoublure blanc coton. \r\nFermeture éclaire blanche. \r\nDimension environ 21x18cm \r\nDimension environ 27x22cm\r\ncertifié okeo-tex\r\n\r\n\r\n\r\nTaxes incluses. Frais d\'expédition calculés lors du paiement.', 'pochette de toilette', '17.50', 'pochette-de-toilette', '2022-06-16 13:56:02', NULL, 1, NULL, 1, 4, NULL, '21x18cm', NULL),
(8, 'les personnalisables', 'Ici vous avez la possibilité de personnaliser vos articles éco responsable avec un prénom.\r\n\r\nIdéal pour offrir ou juste se faire plaisir !\r\n\r\nJe vous propose un panier et ses 6 lingettes 100% fait main,\r\nEponge bambou, tissu coton imprimé\r\nTissu certifié oeko-tex 100\r\n\r\nPanier (environ 8x8 cm)\r\n6 Lingettes (environ 8x8 cm):3 douces + 3 ultra douces\r\nLavage : Machine 30°\r\n\r\nTaxes incluses. Frais d\'expédition calculés lors du paiement.', 'les personnalisables', '15.50', 'les-personnalisables', '2022-06-16 13:51:32', NULL, 1, NULL, 1, 3, NULL, NULL, NULL),
(9, 'pochette bi-matière', 'Pochette en toiles de coton et jute.\r\n\r\nBi-matière pour un style tendance.\r\nToile de jute naturelle laminée, pour une meilleure résistance.\r\nCertifié STANDARD 100 by OEKO-TEX® VEGAN\r\nIntérieur imperméabilisé \r\nDimensions 27 cm x 5 cm x 18 cm\r\nFlocage par transfert. \r\nINFO: au vu des ruptures fournisseurs ,le délai de préparation de commande est estimé à une semaine minimum. Merci\r\nTaxes incluses. Frais d\'expédition calculés lors du paiement.', 'divers', '14.90', 'pochette-bi-matiere', '2022-06-16 14:03:24', NULL, 1, NULL, 1, 4, 'vert', NULL, 'sunshine');

-- --------------------------------------------------------

--
-- Structure de la table `promotion`
--

CREATE TABLE `promotion` (
  `Id_discount` int(11) NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `type` decimal(15,2) NOT NULL,
  `starts_at` datetime DEFAULT NULL,
  `ends_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `update_at` datetime DEFAULT NULL,
  `usage_limit` int(11) DEFAULT NULL,
  `used` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `provider`
--

CREATE TABLE `provider` (
  `Id_person` int(11) NOT NULL,
  `email` varchar(155) NOT NULL,
  `last_login` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `provider`
--

INSERT INTO `provider` (`Id_person`, `email`, `last_login`) VALUES
(1, 'nikacreations07@gmail.com', '2022-06-15 14:37:47');

-- --------------------------------------------------------

--
-- Structure de la table `rating`
--

CREATE TABLE `rating` (
  `Id_rating` int(11) NOT NULL,
  `score` int(11) DEFAULT NULL,
  `Id_shop` int(11) NOT NULL,
  `Id_person` int(11) NOT NULL,
  `email` varchar(155) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

CREATE TABLE `role` (
  `Id_role` int(11) NOT NULL,
  `name` varchar(155) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `role`
--

INSERT INTO `role` (`Id_role`, `name`) VALUES
(1, 'ADMIN'),
(2, 'USER'),
(3, 'CUSTOM');

-- --------------------------------------------------------

--
-- Structure de la table `shop`
--

CREATE TABLE `shop` (
  `Id_shop` int(11) NOT NULL,
  `name` varchar(155) NOT NULL,
  `description` text DEFAULT NULL,
  `siren_number` varchar(255) NOT NULL,
  `street` varchar(155) NOT NULL,
  `number` int(11) NOT NULL,
  `country_code` varchar(15) NOT NULL,
  `phone_number` varchar(155) NOT NULL,
  `phone_number_2` varchar(155) DEFAULT NULL,
  `is_expired` tinyint(1) NOT NULL,
  `slug` varchar(155) NOT NULL,
  `Id_person` int(11) NOT NULL,
  `email` varchar(155) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `shop`
--

INSERT INTO `shop` (`Id_shop`, `name`, `description`, `siren_number`, `street`, `number`, `country_code`, `phone_number`, `phone_number_2`, `is_expired`, `slug`, `Id_person`, `email`) VALUES
(1, 'Nika Créations', 'Originaire des Hauts de France, j\'ai pris la route pour le sud, puis j\'ai posé mes valises en Ardèche  «  Merveillous Païs »\r\n\r\n Tout a commencé dans le but de faire plaisir à mes proches  pour des événements ( anniversaires, fête des mères, Noël...). \r\n\r\nDe nature créative et passionnée je me suis lancé dans la création d\'objets et textiles personnalisés (sac, tote bag, lingette, panier, t-shirt...). En voyant leurs réjouissances j\'ai donc décidé de partager mon savoir-faire en créant mon entreprise en 2019.\r\n\r\n Avec NIKA CREATIONS, je souhaite vous proposer une alternative aux grandes marques ou grandes surfaces. Quand il s’agit de trouver vos accessoires, un cadeau fait main ou des articles originaux et uniques pour vos événements.\r\n\r\n Le fait-main est une tendance qui s’exprime par le plaisir de consommer différemment et l’envie de qualité. Chaque article est confectionné avec grand soin dans des matériaux de qualité (certifié Oeko-tex ) d’après des modèles personnels. Et ce à des prix tout à fait raisonnables.\r\n\r\nJuste pour vous !\r\n\r\nHarmonie créatrice de', '88060385700017', 'le mazel', 1, '250', '06.12.85.63.68', '', 1, 'Nika-Creation', 1, 'nikacreations07@gmail.com');

-- --------------------------------------------------------

--
-- Structure de la table `town`
--

CREATE TABLE `town` (
  `Id_town` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `postal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `user_app`
--

CREATE TABLE `user_app` (
  `Id_person` int(11) NOT NULL,
  `email` varchar(155) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `phone_number` varchar(155) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `user_app`
--

INSERT INTO `user_app` (`Id_person`, `email`, `firstname`, `lastname`, `password`, `gender`, `phone_number`, `created_at`, `update_at`) VALUES
(1, 'nikacreations07@gmail.com', 'Harmonie', 'Abadia Perez', '84868858mai7\r\n', 'female', '06.12.85.63.68', '2022-06-15 14:30:03', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `vat`
--

CREATE TABLE `vat` (
  `Id_vat` int(11) NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `include_in_price` tinyint(1) NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `created_at` datetime NOT NULL,
  `update_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `_order`
--

CREATE TABLE `_order` (
  `Id_order` int(11) NOT NULL,
  `number` varchar(255) NOT NULL,
  `customer_ip` varchar(255) DEFAULT NULL,
  `state` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL,
  `update_at` datetime DEFAULT NULL,
  `Id_person` int(11) NOT NULL,
  `email` varchar(155) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`Id_address`),
  ADD KEY `Id_town` (`Id_town`),
  ADD KEY `Id_address_type` (`Id_address_type`),
  ADD KEY `Id_person` (`Id_person`,`email`);

--
-- Index pour la table `address_type`
--
ALTER TABLE `address_type`
  ADD PRIMARY KEY (`Id_address_type`);

--
-- Index pour la table `appartenir`
--
ALTER TABLE `appartenir`
  ADD PRIMARY KEY (`Id_town`,`Id_country`),
  ADD KEY `Id_country` (`Id_country`);

--
-- Index pour la table `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`Id_bill`);

--
-- Index pour la table `bill_line`
--
ALTER TABLE `bill_line`
  ADD PRIMARY KEY (`Id_delivery`,`Id_order`,`Id_order_line`,`Id_delivery_line`,`Id_bill`,`Id_bill_line`),
  ADD KEY `Id_bill` (`Id_bill`);

--
-- Index pour la table `category_1`
--
ALTER TABLE `category_1`
  ADD PRIMARY KEY (`Id_category_1`);

--
-- Index pour la table `category_2`
--
ALTER TABLE `category_2`
  ADD PRIMARY KEY (`Id_category_2`);

--
-- Index pour la table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`Id_rating`),
  ADD KEY `Id_shop` (`Id_shop`),
  ADD KEY `Id_person` (`Id_person`,`email`);

--
-- Index pour la table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`Id_country`);

--
-- Index pour la table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`Id_person`,`email`),
  ADD KEY `Id_role` (`Id_role`);

--
-- Index pour la table `delivery`
--
ALTER TABLE `delivery`
  ADD PRIMARY KEY (`Id_delivery`),
  ADD KEY `Id_address` (`Id_address`);

--
-- Index pour la table `delivery_line`
--
ALTER TABLE `delivery_line`
  ADD PRIMARY KEY (`Id_delivery`,`Id_order`,`Id_order_line`,`Id_delivery_line`),
  ADD KEY `Id_order` (`Id_order`,`Id_order_line`);

--
-- Index pour la table `order_line`
--
ALTER TABLE `order_line`
  ADD PRIMARY KEY (`Id_order`,`Id_order_line`),
  ADD KEY `Id_payment` (`Id_payment`),
  ADD KEY `Id_product` (`Id_product`),
  ADD KEY `Id_discount` (`Id_discount`),
  ADD KEY `Id_vat` (`Id_vat`);

--
-- Index pour la table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`Id_payment`);

--
-- Index pour la table `payment_method`
--
ALTER TABLE `payment_method`
  ADD PRIMARY KEY (`Id_payment_method`),
  ADD KEY `Id_payment` (`Id_payment`);

--
-- Index pour la table `picture`
--
ALTER TABLE `picture`
  ADD PRIMARY KEY (`Id_picture`),
  ADD KEY `Id_product` (`Id_product`),
  ADD KEY `Id_shop` (`Id_shop`);

--
-- Index pour la table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`Id_product`),
  ADD KEY `Id_category_2` (`Id_category_2`),
  ADD KEY `Id_shop` (`Id_shop`),
  ADD KEY `Id_category_1` (`Id_category_1`);

--
-- Index pour la table `promotion`
--
ALTER TABLE `promotion`
  ADD PRIMARY KEY (`Id_discount`);

--
-- Index pour la table `provider`
--
ALTER TABLE `provider`
  ADD PRIMARY KEY (`Id_person`,`email`);

--
-- Index pour la table `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`Id_rating`),
  ADD KEY `Id_shop` (`Id_shop`),
  ADD KEY `Id_person` (`Id_person`,`email`);

--
-- Index pour la table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`Id_role`);

--
-- Index pour la table `shop`
--
ALTER TABLE `shop`
  ADD PRIMARY KEY (`Id_shop`),
  ADD KEY `Id_person` (`Id_person`,`email`);

--
-- Index pour la table `town`
--
ALTER TABLE `town`
  ADD PRIMARY KEY (`Id_town`);

--
-- Index pour la table `user_app`
--
ALTER TABLE `user_app`
  ADD PRIMARY KEY (`Id_person`,`email`);

--
-- Index pour la table `vat`
--
ALTER TABLE `vat`
  ADD PRIMARY KEY (`Id_vat`);

--
-- Index pour la table `_order`
--
ALTER TABLE `_order`
  ADD PRIMARY KEY (`Id_order`),
  ADD KEY `Id_person` (`Id_person`,`email`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `address_ibfk_1` FOREIGN KEY (`Id_town`) REFERENCES `town` (`Id_town`),
  ADD CONSTRAINT `address_ibfk_2` FOREIGN KEY (`Id_address_type`) REFERENCES `address_type` (`Id_address_type`),
  ADD CONSTRAINT `address_ibfk_3` FOREIGN KEY (`Id_person`,`email`) REFERENCES `customer` (`Id_person`, `email`);

--
-- Contraintes pour la table `appartenir`
--
ALTER TABLE `appartenir`
  ADD CONSTRAINT `appartenir_ibfk_1` FOREIGN KEY (`Id_town`) REFERENCES `town` (`Id_town`),
  ADD CONSTRAINT `appartenir_ibfk_2` FOREIGN KEY (`Id_country`) REFERENCES `country` (`Id_country`);

--
-- Contraintes pour la table `bill_line`
--
ALTER TABLE `bill_line`
  ADD CONSTRAINT `bill_line_ibfk_1` FOREIGN KEY (`Id_delivery`,`Id_order`,`Id_order_line`,`Id_delivery_line`) REFERENCES `delivery_line` (`Id_delivery`, `Id_order`, `Id_order_line`, `Id_delivery_line`),
  ADD CONSTRAINT `bill_line_ibfk_2` FOREIGN KEY (`Id_bill`) REFERENCES `bill` (`Id_bill`);

--
-- Contraintes pour la table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`Id_shop`) REFERENCES `shop` (`Id_shop`),
  ADD CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`Id_person`,`email`) REFERENCES `customer` (`Id_person`, `email`);

--
-- Contraintes pour la table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`Id_person`,`email`) REFERENCES `user_app` (`Id_person`, `email`),
  ADD CONSTRAINT `customer_ibfk_2` FOREIGN KEY (`Id_role`) REFERENCES `role` (`Id_role`);

--
-- Contraintes pour la table `delivery`
--
ALTER TABLE `delivery`
  ADD CONSTRAINT `delivery_ibfk_1` FOREIGN KEY (`Id_address`) REFERENCES `address` (`Id_address`);

--
-- Contraintes pour la table `delivery_line`
--
ALTER TABLE `delivery_line`
  ADD CONSTRAINT `delivery_line_ibfk_1` FOREIGN KEY (`Id_delivery`) REFERENCES `delivery` (`Id_delivery`),
  ADD CONSTRAINT `delivery_line_ibfk_2` FOREIGN KEY (`Id_order`,`Id_order_line`) REFERENCES `order_line` (`Id_order`, `Id_order_line`);

--
-- Contraintes pour la table `order_line`
--
ALTER TABLE `order_line`
  ADD CONSTRAINT `order_line_ibfk_1` FOREIGN KEY (`Id_order`) REFERENCES `_order` (`Id_order`),
  ADD CONSTRAINT `order_line_ibfk_2` FOREIGN KEY (`Id_payment`) REFERENCES `payment` (`Id_payment`),
  ADD CONSTRAINT `order_line_ibfk_3` FOREIGN KEY (`Id_product`) REFERENCES `product` (`Id_product`),
  ADD CONSTRAINT `order_line_ibfk_4` FOREIGN KEY (`Id_discount`) REFERENCES `promotion` (`Id_discount`),
  ADD CONSTRAINT `order_line_ibfk_5` FOREIGN KEY (`Id_vat`) REFERENCES `vat` (`Id_vat`);

--
-- Contraintes pour la table `payment_method`
--
ALTER TABLE `payment_method`
  ADD CONSTRAINT `payment_method_ibfk_1` FOREIGN KEY (`Id_payment`) REFERENCES `payment` (`Id_payment`);

--
-- Contraintes pour la table `picture`
--
ALTER TABLE `picture`
  ADD CONSTRAINT `picture_ibfk_1` FOREIGN KEY (`Id_product`) REFERENCES `product` (`Id_product`),
  ADD CONSTRAINT `picture_ibfk_2` FOREIGN KEY (`Id_shop`) REFERENCES `shop` (`Id_shop`);

--
-- Contraintes pour la table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`Id_category_2`) REFERENCES `category_2` (`Id_category_2`),
  ADD CONSTRAINT `product_ibfk_2` FOREIGN KEY (`Id_shop`) REFERENCES `shop` (`Id_shop`),
  ADD CONSTRAINT `product_ibfk_3` FOREIGN KEY (`Id_category_1`) REFERENCES `category_1` (`Id_category_1`);

--
-- Contraintes pour la table `provider`
--
ALTER TABLE `provider`
  ADD CONSTRAINT `provider_ibfk_1` FOREIGN KEY (`Id_person`,`email`) REFERENCES `user_app` (`Id_person`, `email`);

--
-- Contraintes pour la table `rating`
--
ALTER TABLE `rating`
  ADD CONSTRAINT `rating_ibfk_1` FOREIGN KEY (`Id_shop`) REFERENCES `shop` (`Id_shop`),
  ADD CONSTRAINT `rating_ibfk_2` FOREIGN KEY (`Id_person`,`email`) REFERENCES `customer` (`Id_person`, `email`);

--
-- Contraintes pour la table `shop`
--
ALTER TABLE `shop`
  ADD CONSTRAINT `shop_ibfk_1` FOREIGN KEY (`Id_person`,`email`) REFERENCES `provider` (`Id_person`, `email`);

--
-- Contraintes pour la table `_order`
--
ALTER TABLE `_order`
  ADD CONSTRAINT `_order_ibfk_1` FOREIGN KEY (`Id_person`,`email`) REFERENCES `customer` (`Id_person`, `email`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
