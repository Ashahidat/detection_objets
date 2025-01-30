-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 30 jan. 2025 à 11:31
-- Version du serveur :  10.4.19-MariaDB
-- Version de PHP : 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `prediction`
--

-- --------------------------------------------------------

--
-- Structure de la table `objets`
--

CREATE TABLE `objets` (
  `id` int(11) NOT NULL,
  `utilisateur_id` int(11) DEFAULT NULL,
  `type_objet` varchar(255) NOT NULL,
  `image_url` text NOT NULL,
  `temps_reponse` float NOT NULL,
  `date` date NOT NULL DEFAULT curdate()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `objets`
--

INSERT INTO `objets` (`id`, `utilisateur_id`, `type_objet`, `image_url`, `temps_reponse`, `date`) VALUES
(1, 2, 'bird (0.64)', 'uploads\\n02009912_8563.JPEG', 0, '2025-01-22'),
(6, 4, 'bird (0.95)', 'uploads\\annotated_n02009912_1358.JPEG', 0, '2025-01-22'),
(7, 4, 'person (0.86), cup (0.43), diningtable (0.58), laptop (0.45), chair (0.83), cup (0.70), cup (0.76), person (0.89)', 'uploads\\annotated_image.png', 0, '2025-01-22'),
(8, 4, 'person (0.86), cup (0.43), diningtable (0.58), laptop (0.45), chair (0.83), cup (0.70), cup (0.76), person (0.89)', 'uploads\\annotated_image.png', 0, '2025-01-22'),
(9, 4, 'cup (0.70), cup (0.76), cup (0.43), laptop (0.45), diningtable (0.58), person (0.89), chair (0.83), person (0.86)', 'uploads\\annotated_image.png', 0, '2025-01-22'),
(10, 5, 'pottedplant (0.31), bird (0.87)', 'uploads\\annotated_n02009912_26245.JPEG', 0, '2025-01-22'),
(11, 5, 'bird (0.95)', 'uploads\\annotated_n02009912_1358.JPEG', 0, '2025-01-22'),
(12, 5, 'horse (0.28), dog (0.54)', 'uploads\\annotated_n02088094_3882.JPEG', 0, '2025-01-22'),
(13, 6, 'person (0.45), person (0.72), dog (0.72), person (0.54), person (0.33), person (0.36), dog (0.38), person (0.37), dog (0.54), person (0.53), person (0.86), dog (0.74), person (0.65), person (0.52)', 'uploads\\annotated_n02088094_1045.JPEG', 0, '2025-01-22'),
(14, 6, 'dog (0.34), person (0.74), pottedplant (0.67), horse (0.33), person (0.78)', 'uploads\\annotated_n02088094_5532.JPEG', 0, '2025-01-22'),
(15, 6, 'bear (0.42), dog (0.27)', 'uploads\\annotated_n02088094_6533.JPEG', 0, '2025-01-22'),
(16, 6, 'dog (0.27), bear (0.42)', 'uploads\\annotated_n02088094_6533.JPEG', 0, '2025-01-22'),
(17, 7, 'apple (0.47), apple (0.30), orange (0.39), apple (0.48)', 'uploads\\annotated_n07753592_7688.JPEG', 0, '2025-01-22'),
(18, 7, 'banana (0.46), surfboard (0.40)', 'uploads\\annotated_n07753592_928.JPEG', 0, '2025-01-22'),
(19, 7, 'bird (0.95)', 'uploads\\annotated_n02009912_1358.JPEG', 0, '2025-01-22'),
(20, 7, 'bird (0.95)', 'uploads\\annotated_n02009912_1358.JPEG', 0, '2025-01-22'),
(21, 7, 'chair (0.83), cup (0.76), person (0.86), cup (0.70), diningtable (0.58), laptop (0.45), cup (0.43), person (0.89)', 'uploads\\annotated_image.png', 0, '2025-01-22'),
(22, 8, 'cup (0.76), chair (0.83), person (0.86), cup (0.43), diningtable (0.58), person (0.89), cup (0.70), laptop (0.45)', 'uploads\\annotated_image.png', 0, '2025-01-22'),
(23, 8, 'person (0.75)', 'uploads\\annotated_n01697457_8331.JPEG', 0, '2025-01-22'),
(24, 8, 'bird (0.90)', 'uploads\\annotated_n02009912_13895.JPEG', 0, '2025-01-22'),
(25, 9, 'person (0.75)', 'uploads\\annotated_n01697457_8331.JPEG', 0, '2025-01-22'),
(26, 9, 'bird (0.95)', 'uploads\\annotated_n02009912_1358.JPEG', 0, '2025-01-22'),
(27, 9, 'horse (0.33), person (0.78), pottedplant (0.67), person (0.74), dog (0.34)', 'uploads\\annotated_n02088094_5532.JPEG', 0, '2025-01-22'),
(28, 9, 'chair (0.83), cup (0.76), person (0.89), person (0.86), cup (0.43), laptop (0.45), cup (0.70), diningtable (0.58)', 'uploads\\annotated_image.png', 0, '2025-01-22'),
(29, 9, 'bird (0.95)', 'uploads\\annotated_n02009912_1358.JPEG', 0, '2025-01-22'),
(30, 10, '', 'uploads\\annotated_n01697457_260.JPEG', 0, '2025-01-22'),
(31, 10, 'person (0.75)', 'uploads\\annotated_n01697457_8331.JPEG', 0, '2025-01-22'),
(32, 10, 'bird (0.30)', 'uploads\\annotated_n01697457_10393.JPEG', 0, '2025-01-22'),
(33, 10, 'bird (0.92)', 'uploads\\annotated_n02009912_15872.JPEG', 0, '2025-01-22'),
(34, 10, 'person (0.40), person (0.35), person (0.75), chair (0.43), person (0.76), person (0.66), person (0.25), dog (0.89), person (0.71)', 'uploads\\annotated_n02088094_7360.JPEG', 0, '2025-01-22'),
(35, 10, 'bird (0.30)', 'uploads\\annotated_n01697457_10393.JPEG', 0, '2025-01-22'),
(36, 11, 'truck (0.81), person (0.70), person (0.59), person (0.35), person (0.34), person (0.31), person (0.55), person (0.38), person (0.46)', 'uploads\\annotated_n02701002_15786.JPEG', 0, '2025-01-22'),
(37, 12, 'bird (0.39), bird (0.49)', 'uploads\\annotated_n02009912_5700.JPEG', 2.26718, '2025-01-22'),
(38, 12, 'bird (0.39), bird (0.49)', 'uploads\\annotated_n02009912_5700.JPEG', 2.24931, '2025-01-22'),
(39, 12, 'person (0.75)', 'uploads\\annotated_n01697457_8331.JPEG', 0.256577, '2025-01-22'),
(40, 13, 'bird (0.30)', 'uploads\\annotated_n01697457_10393.JPEG', 0.256405, '2025-01-22'),
(41, 13, 'bird (0.30)', 'uploads\\annotated_n01697457_10393.JPEG', 2.23001, '2025-01-22'),
(42, 13, 'bird (0.30)', 'uploads\\annotated_n01697457_10393.JPEG', 0.221633, '2025-01-22'),
(43, 13, 'bird (0.30)', 'uploads\\annotated_n01697457_10393.JPEG', 0, '2025-01-22'),
(44, 13, 'person (0.75)', 'uploads\\annotated_n01697457_8331.JPEG', 0, '2025-01-22'),
(45, 13, 'person (0.75)', 'uploads\\annotated_n01697457_8331.JPEG', 0, '2025-01-22'),
(46, 13, 'person (0.75)', 'uploads\\annotated_n01697457_8331.JPEG', 0, '2025-01-22'),
(47, 14, 'person (0.75)', 'uploads\\annotated_n01697457_8331.JPEG', 0, '2025-01-22'),
(48, 14, 'bird (0.30)', 'uploads\\annotated_n01697457_10393.JPEG', 2.18, '2025-01-22'),
(49, 14, 'person (0.75)', 'uploads\\annotated_n01697457_8331.JPEG', 0, '2025-01-22'),
(50, 14, 'bird (0.32)', 'uploads\\annotated_n01773549_701.JPEG', 0, '2025-01-23'),
(51, 14, 'dog (0.82)', 'uploads\\annotated_n02088094_6565.JPEG', 2.22, '2025-01-23'),
(52, 15, 'bird (0.92)', 'uploads\\annotated_n02009912_15872.JPEG', 0.29, '2025-01-23'),
(53, 15, 'scissors (0.47)', 'uploads\\annotated_n07753592_16664.JPEG', 0.27, '2025-01-23'),
(54, 15, 'scissors (0.47)', 'uploads\\annotated_n07753592_16664.JPEG', 0.22, '2025-01-23'),
(55, 15, 'dog (0.82)', 'uploads\\annotated_n02088094_6565.JPEG', 0.2, '2025-01-23'),
(56, 15, 'chair (0.83), cup (0.43), cup (0.70), diningtable (0.58), cup (0.76), person (0.86), laptop (0.45), person (0.89)', 'uploads\\annotated_image.png', 0.35, '2025-01-23'),
(57, 16, 'chair (0.83), cup (0.43), cup (0.70), diningtable (0.58), cup (0.76), person (0.86), laptop (0.45), person (0.89)', 'uploads\\annotated_image.png', 0.23, '2025-01-23'),
(58, 17, 'chair (0.83), cup (0.43), cup (0.70), diningtable (0.58), cup (0.76), person (0.86), laptop (0.45), person (0.89)', 'uploads\\annotated_image.png', 0.23, '2025-01-23'),
(59, 20, 'chair (0.83), cup (0.70), cup (0.76), person (0.89), diningtable (0.58), laptop (0.45), cup (0.43), person (0.86)', 'uploads\\annotated_image.png', 6.61, '2025-01-23'),
(60, 21, 'chair (0.83), cup (0.70), cup (0.76), person (0.89), diningtable (0.58), laptop (0.45), cup (0.43), person (0.86)', 'uploads\\annotated_image.png', 0.25, '2025-01-23'),
(61, 22, 'cup (0.76), cup (0.70), cup (0.43), laptop (0.45), chair (0.83), person (0.89), person (0.86), diningtable (0.58)', 'uploads\\annotated_image.png', 2.74, '2025-01-23'),
(62, 22, 'bird (0.30)', 'uploads\\annotated_n01697457_10393.JPEG', 0.36, '2025-01-23'),
(63, 22, 'bird (0.30)', 'uploads\\annotated_n01697457_10393.JPEG', 0.34, '2025-01-23'),
(64, 22, 'bird (0.30)', 'uploads\\annotated_n01697457_10393.JPEG', 0.27, '2025-01-23');

-- --------------------------------------------------------

--
-- Structure de la table `satisfaction`
--

CREATE TABLE `satisfaction` (
  `id` int(11) NOT NULL,
  `utilisateur_id` int(11) DEFAULT NULL,
  `satisfait` int(11) DEFAULT 0,
  `non_satisfait` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `satisfactions`
--

CREATE TABLE `satisfactions` (
  `id` int(11) NOT NULL,
  `utilisateur_id` int(11) DEFAULT NULL,
  `satisfait` int(11) DEFAULT 0,
  `non_satisfait` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `satisfactions`
--

INSERT INTO `satisfactions` (`id`, `utilisateur_id`, `satisfait`, `non_satisfait`) VALUES
(1, 5, 1, 0),
(2, 7, 1, 0),
(3, 10, 2, 1),
(6, 11, 1, 0),
(7, 13, 1, 0),
(8, 14, 3, 2),
(13, 15, 3, 2),
(18, 16, 1, 0),
(19, 17, 1, 0),
(20, 20, 0, 1),
(21, 21, 1, 0);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateurs`
--

CREATE TABLE `utilisateurs` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mot_de_passe` varchar(255) NOT NULL,
  `nb_predictions` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `utilisateurs`
--

INSERT INTO `utilisateurs` (`id`, `email`, `mot_de_passe`, `nb_predictions`) VALUES
(1, 'fantisca747@gmail.com', 'fatoumata', 0),
(2, 'fantisca74@gmail.com', 'scrypt:32768:8:1$Sgwj9fvoRlNoaDsM$614f717ff29c0e3753d4f3c42f00e32a1912880773d2f43bed46bbab14ec6a5b2347007719580e854b5949f05cbb23b4d66e3ea10546737099c4aac5d7e443dc', 1),
(4, 'admin@gmail.com', 'scrypt:32768:8:1$x0Ec3Nhs5qUflgnH$09c279d02fbd4ae4108db3daf0f8fe29e9d4b2dc225e7329e392c8927f4ecb00e0d1a8c23155710eb20a86bc11141fe14d3c9039a290e7cd3b7a90a560b5bb0f', 4),
(5, 'fat@demo.com', 'scrypt:32768:8:1$u5RzR9xMfEUWlkQQ$39514569238ebd46dc869557365dd0d4e2441f8517afa1511b96650f76070882aac05b2933b9e8ced964369956a842b968c02796139b75e16df419597e312cd7', 3),
(6, 'adminn@demo.com', 'scrypt:32768:8:1$WfYDikI8prrysB5A$6bd0dbf51c3e84b737896147294e9dbed1273718660a41b2bc770afa387cea5523c2c895baffe2a035496565d76f95115a9dd4c88562861d1d6c5d5cd3d50cb0', 4),
(7, 'ad@demo.com', 'scrypt:32768:8:1$cysw4wMVP0Yryrxi$db5802636f59c8c387acbf52ef785c6b9b71aa07640f007dfd8349452e8cc66ac365d09b8125479632fd4eef30032b96ead678da66ab17f1835bdd1f3ac7ad27', 5),
(8, 'adm@demo.com', 'scrypt:32768:8:1$qSq4LNczoqdMwkJ6$2e80726720a56601ac1211a862655711c8714c78cdbabc24bfa33e55649bdbfb79ee130101eb1de83ed05303326defa98c966c70cef7c503a9a6bf7912d00cc5', 3),
(9, 'adminf@demo.com', 'scrypt:32768:8:1$2Gqr7kMdh6MztutP$e63756112520aea21d1aba29c68e313527b3553793c5b497a2702abe790fc0d9cd8f4772351f49e49df1aa0f9b7e98df84e8dd3ebd5a68895b7def23ab81e88c', 5),
(10, 'awa23219@23219', 'scrypt:32768:8:1$v38atpzt0uGoDY7i$edc296b06ff99f7bcbdc85a21900b8798da130557c7d76117c51bb3ef2fd70798c364d40785116f44a730076025d2d0173e1fcc40386c4ce80fd7dc00f27b821', 6),
(11, 'fati@demo.com', 'scrypt:32768:8:1$wYmxqEf5T1ag0IIa$0f653f1275dd0765ee6e246d6091e496bbb55b5d2d4b850314abcac66f9f92aae3ba1043397dc6855d0c82c6fbc92aad7fe42cf29c805a01ac9d0ace048622c1', 1),
(12, 'famous@gmail.com', 'scrypt:32768:8:1$BKC5WmzTrT54ClCh$eb5e2bca6f0fe35bdf80aa9b5ab6bf15376129d96b24011bf45a8591d160679f98222836c735a64f5226b79175c02455070329f854480c94245c928ed41dcd6f', 3),
(13, 'fatp@demo.com', 'scrypt:32768:8:1$MKcjhx1COc36NZbK$7d9eea3c2f508c84b01b124ad38faddb3270efa128d925ccb19b2134fbf49f90a2237fddf688dab15ebe384597abf4ae01aa474e3c9d329977263125d44be177', 7),
(14, 'gg@demo.com', 'scrypt:32768:8:1$l5MxDJthevUp2mu5$3f79e33aade8597ed0b3a1f12e194bacc47af6052d03d65ed84a4192ce31e959e441acc5f235ab99b24e72ce765312308926c3e9b5779819cfdccddcc3047e36', 5),
(15, 'famille@demo.com', 'scrypt:32768:8:1$ncDlGMurbOwzNNEh$4a76b72d159cbb8291f271b30ff5a605a4c69757b69753f2a97e0efe996f79dbf4b041374148321362fd835bade65b3683fc9e4ea4bde5a3a198b7e8a1d10ae1', 5),
(16, 'mam@gmail.com', 'scrypt:32768:8:1$7wbbEGfCLyDHkukR$94b6fd5a1d17e3d19d61d4ea1afccb6ee718073bc413cc2733a4292e1da265e00f8c04dd83a569100ab4508616f73e1b92070073d3d01c48a839074d1b6464ac', 1),
(17, 'famous@demo.com', 'scrypt:32768:8:1$YntiwF9o7X7FcFWu$d35ab07ac2136a4f78f030b81c0055b0353b3c14e0569387ea05fd561c6a1d85b88fb2fa8e3ef07ad76cff789f2f49123f584bfb32c6409bb59af0acdfbb8502', 1),
(18, 'fami@gmail.com', 'scrypt:32768:8:1$DGl5Mk2eYbILg8ZO$c198c8386f7db04d467799ddd71c26fe3beba6f8dca3500787a0d13c92c0cb0274dd512de1309100c485676999299cb31ba41423f1206c07c5c56d5786b96061', 0),
(19, 'bb@demo.com', 'scrypt:32768:8:1$7stEPkwoQjQyWJmL$b59a7639a9b61b42307c792d0c5a501ea6a682895e1d4668d5ba12ecbcdb399cb3e304d13cb7c5cff7474dbd7513621846612caf03c6b65ebb87a8356bc84212', 0),
(20, 'fatp@gmail.com', 'scrypt:32768:8:1$nMHvrXDbVS1vo4Wf$d72e002b6536453aa926e7ff434bc3f6b2241087a842f56acc5a765a6186de19be8af39d177f91579d983507724db83c070b97f63d4cfd1a71664cbde4c1516d', 1),
(21, 'ffg@demo.com', 'scrypt:32768:8:1$6rT27kW2tNAmDMVE$a744dfcf7d0499f8cacbebc97dacdb2a63a11eda1ae707d57118023e05486aada6dc7f7bdbb61d883a072d0e67b26bf631e79dea42cfbc61b016929e4e8f8e11', 1),
(22, 'fatou@gmail.com', 'scrypt:32768:8:1$IsqStNEhA9NEiSYB$d1d5556400990ad767cd29ec61a58fc27f2c9fa5d572f96c63dcc1e312ba80dd5826ed111553b37b5391bbc5ed9415fa55fa6dc6211bdad2b763687cc2aa1824', 4);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `objets`
--
ALTER TABLE `objets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `utilisateur_id` (`utilisateur_id`);

--
-- Index pour la table `satisfaction`
--
ALTER TABLE `satisfaction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `utilisateur_id` (`utilisateur_id`);

--
-- Index pour la table `satisfactions`
--
ALTER TABLE `satisfactions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `utilisateur_id` (`utilisateur_id`);

--
-- Index pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `objets`
--
ALTER TABLE `objets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT pour la table `satisfaction`
--
ALTER TABLE `satisfaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `satisfactions`
--
ALTER TABLE `satisfactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `objets`
--
ALTER TABLE `objets`
  ADD CONSTRAINT `objets_ibfk_1` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateurs` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `satisfaction`
--
ALTER TABLE `satisfaction`
  ADD CONSTRAINT `satisfaction_ibfk_1` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateurs` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `satisfactions`
--
ALTER TABLE `satisfactions`
  ADD CONSTRAINT `satisfactions_ibfk_1` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateurs` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
