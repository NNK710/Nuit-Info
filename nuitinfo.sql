-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 03 déc. 2021 à 01:35
-- Version du serveur : 10.4.21-MariaDB
-- Version de PHP : 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `nuitinfo`
--

-- --------------------------------------------------------

--
-- Structure de la table `alldeco`
--

CREATE TABLE `alldeco` (
  `idAllDeco` int(11) NOT NULL,
  `idDecoStrange` int(11) NOT NULL,
  `idSauvStrange` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `alldeco`
--

INSERT INTO `alldeco` (`idAllDeco`, `idDecoStrange`, `idSauvStrange`) VALUES
(1, 1, 1),
(2, 2, 1);

-- --------------------------------------------------------

--
-- Structure de la table `allnavire`
--

CREATE TABLE `allnavire` (
  `idAllNavire` int(11) NOT NULL,
  `idEquipeStrange` int(11) NOT NULL,
  `idNavireStrange` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `allnavire`
--

INSERT INTO `allnavire` (`idAllNavire`, `idEquipeStrange`, `idNavireStrange`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `allrecit`
--

CREATE TABLE `allrecit` (
  `idAllRecit` int(11) NOT NULL,
  `idRecitStrange` int(11) NOT NULL,
  `idSauvetageStrange` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `allrecit`
--

INSERT INTO `allrecit` (`idAllRecit`, `idRecitStrange`, `idSauvetageStrange`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `allsauv`
--

CREATE TABLE `allsauv` (
  `idAllSauv` int(11) NOT NULL,
  `idStrangeSauv` int(11) NOT NULL,
  `idStrangeEquipe` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `allsauv`
--

INSERT INTO `allsauv` (`idAllSauv`, `idStrangeSauv`, `idStrangeEquipe`) VALUES
(1, 1, 1),
(2, 2, 1);

-- --------------------------------------------------------

--
-- Structure de la table `allvictime`
--

CREATE TABLE `allvictime` (
  `idAllVic` int(11) NOT NULL,
  `idStrangeVic` int(11) NOT NULL,
  `idStrangeSauvt` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `allvictime`
--

INSERT INTO `allvictime` (`idAllVic`, `idStrangeVic`, `idStrangeSauvt`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `decoration`
--

CREATE TABLE `decoration` (
  `idDecoration` int(11) NOT NULL,
  `nomDeco` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `decoration`
--

INSERT INTO `decoration` (`idDecoration`, `nomDeco`) VALUES
(1, 'Chevalier de la Légion D\'Honne'),
(2, 'Prix Henri Durand de Blois');

-- --------------------------------------------------------

--
-- Structure de la table `equipe`
--

CREATE TABLE `equipe` (
  `idEquipe` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `equipe`
--

INSERT INTO `equipe` (`idEquipe`) VALUES
(1),
(2),
(3),
(4);

-- --------------------------------------------------------

--
-- Structure de la table `navire`
--

CREATE TABLE `navire` (
  `idNavire` int(11) NOT NULL,
  `nomNavire` varchar(50) NOT NULL,
  `lienNavire` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `navire`
--

INSERT INTO `navire` (`idNavire`, `nomNavire`, `lienNavire`) VALUES
(1, 'Le Helena', 'https://fr.wikipedia.org/wiki/Helena_(voilier)');

-- --------------------------------------------------------

--
-- Structure de la table `recit`
--

CREATE TABLE `recit` (
  `idRecit` int(11) NOT NULL,
  `nomRecit` varchar(30) NOT NULL,
  `dateRecit` date NOT NULL,
  `auteurRecit` varchar(30) NOT NULL,
  `recit` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `recit`
--

INSERT INTO `recit` (`idRecit`, `nomRecit`, `dateRecit`, `auteurRecit`, `recit`) VALUES
(1, 'Comment les SIO nous on sauvé', '1813-07-15', 'Mat Menace', 'Lors du sauvetage des sio j\'ai tenter de sauver de sauver kevin... En vain...');

-- --------------------------------------------------------

--
-- Structure de la table `sauvetage`
--

CREATE TABLE `sauvetage` (
  `idSauvt` int(11) NOT NULL,
  `nomSauvt` varchar(30) NOT NULL,
  `lieuSauvt` varchar(30) NOT NULL,
  `dateSauvt` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `sauvetage`
--

INSERT INTO `sauvetage` (`idSauvt`, `nomSauvt`, `lieuSauvt`, `dateSauvt`) VALUES
(1, 'Le SIOvetage', 'Dunkerque', '1813-06-15');

-- --------------------------------------------------------

--
-- Structure de la table `sauveteur`
--

CREATE TABLE `sauveteur` (
  `idSauv` int(11) NOT NULL,
  `nomSauv` varchar(30) NOT NULL,
  `prenomSauv` varchar(30) NOT NULL,
  `naissanceSauv` date NOT NULL,
  `mortSauv` date DEFAULT NULL,
  `metierSauv` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `sauveteur`
--

INSERT INTO `sauveteur` (`idSauv`, `nomSauv`, `prenomSauv`, `naissanceSauv`, `mortSauv`, `metierSauv`) VALUES
(1, 'Benteu', 'Eugène', '1876-12-02', '1914-07-13', 'Officier en second sur le steamer Caravellas des Chargeurs Réunis'),
(2, 'Morel', 'Jacques-Benjamin', '1781-03-26', '1860-08-24', 'Benjamin Morel est pour nous, avant toute autre considération, le fondateur de la Société Humaine de Dunkerque'),
(3, 'Jean', 'Bidule', '2021-12-16', '2021-12-08', 'Plombier');

-- --------------------------------------------------------

--
-- Structure de la table `victime`
--

CREATE TABLE `victime` (
  `idVic` int(11) NOT NULL,
  `nomVic` varchar(30) NOT NULL,
  `prenomVic` varchar(30) NOT NULL,
  `etatVic` tinyint(1) NOT NULL,
  `dateVic` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `victime`
--

INSERT INTO `victime` (`idVic`, `nomVic`, `prenomVic`, `etatVic`, `dateVic`) VALUES
(1, 'Kevin', 'Troll', 0, '2002-04-01');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `alldeco`
--
ALTER TABLE `alldeco`
  ADD PRIMARY KEY (`idAllDeco`),
  ADD KEY `idDecoStrange` (`idDecoStrange`),
  ADD KEY `idDecoStrange_2` (`idDecoStrange`),
  ADD KEY `idSauvStrange` (`idSauvStrange`);

--
-- Index pour la table `allnavire`
--
ALTER TABLE `allnavire`
  ADD PRIMARY KEY (`idAllNavire`),
  ADD KEY `idEquipeStrange` (`idEquipeStrange`,`idNavireStrange`),
  ADD KEY `idNavireStrange` (`idNavireStrange`);

--
-- Index pour la table `allrecit`
--
ALTER TABLE `allrecit`
  ADD PRIMARY KEY (`idAllRecit`),
  ADD KEY `idRecitStrange` (`idRecitStrange`,`idSauvetageStrange`),
  ADD KEY `idSauvetageStrange` (`idSauvetageStrange`);

--
-- Index pour la table `allsauv`
--
ALTER TABLE `allsauv`
  ADD PRIMARY KEY (`idAllSauv`),
  ADD KEY `idStrangeSauv` (`idStrangeSauv`,`idStrangeEquipe`),
  ADD KEY `idStrangeEquipe` (`idStrangeEquipe`);

--
-- Index pour la table `allvictime`
--
ALTER TABLE `allvictime`
  ADD PRIMARY KEY (`idAllVic`),
  ADD KEY `idStrangeVic` (`idStrangeVic`,`idStrangeSauvt`),
  ADD KEY `idStrangeSauvt` (`idStrangeSauvt`);

--
-- Index pour la table `decoration`
--
ALTER TABLE `decoration`
  ADD PRIMARY KEY (`idDecoration`);

--
-- Index pour la table `equipe`
--
ALTER TABLE `equipe`
  ADD PRIMARY KEY (`idEquipe`);

--
-- Index pour la table `navire`
--
ALTER TABLE `navire`
  ADD PRIMARY KEY (`idNavire`);

--
-- Index pour la table `recit`
--
ALTER TABLE `recit`
  ADD PRIMARY KEY (`idRecit`);

--
-- Index pour la table `sauvetage`
--
ALTER TABLE `sauvetage`
  ADD PRIMARY KEY (`idSauvt`);

--
-- Index pour la table `sauveteur`
--
ALTER TABLE `sauveteur`
  ADD PRIMARY KEY (`idSauv`);

--
-- Index pour la table `victime`
--
ALTER TABLE `victime`
  ADD PRIMARY KEY (`idVic`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `alldeco`
--
ALTER TABLE `alldeco`
  MODIFY `idAllDeco` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `allnavire`
--
ALTER TABLE `allnavire`
  MODIFY `idAllNavire` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `allrecit`
--
ALTER TABLE `allrecit`
  MODIFY `idAllRecit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `allsauv`
--
ALTER TABLE `allsauv`
  MODIFY `idAllSauv` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `allvictime`
--
ALTER TABLE `allvictime`
  MODIFY `idAllVic` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `decoration`
--
ALTER TABLE `decoration`
  MODIFY `idDecoration` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `equipe`
--
ALTER TABLE `equipe`
  MODIFY `idEquipe` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `navire`
--
ALTER TABLE `navire`
  MODIFY `idNavire` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `recit`
--
ALTER TABLE `recit`
  MODIFY `idRecit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `sauvetage`
--
ALTER TABLE `sauvetage`
  MODIFY `idSauvt` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `sauveteur`
--
ALTER TABLE `sauveteur`
  MODIFY `idSauv` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `victime`
--
ALTER TABLE `victime`
  MODIFY `idVic` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `alldeco`
--
ALTER TABLE `alldeco`
  ADD CONSTRAINT `alldeco_ibfk_1` FOREIGN KEY (`idDecoStrange`) REFERENCES `decoration` (`idDecoration`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `alldeco_ibfk_2` FOREIGN KEY (`idSauvStrange`) REFERENCES `sauveteur` (`idSauv`);

--
-- Contraintes pour la table `allnavire`
--
ALTER TABLE `allnavire`
  ADD CONSTRAINT `allnavire_ibfk_1` FOREIGN KEY (`idEquipeStrange`) REFERENCES `equipe` (`idEquipe`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `allnavire_ibfk_2` FOREIGN KEY (`idNavireStrange`) REFERENCES `navire` (`idNavire`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `allrecit`
--
ALTER TABLE `allrecit`
  ADD CONSTRAINT `allrecit_ibfk_1` FOREIGN KEY (`idRecitStrange`) REFERENCES `recit` (`idRecit`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `allrecit_ibfk_2` FOREIGN KEY (`idSauvetageStrange`) REFERENCES `sauvetage` (`idSauvt`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `allsauv`
--
ALTER TABLE `allsauv`
  ADD CONSTRAINT `allsauv_ibfk_1` FOREIGN KEY (`idStrangeEquipe`) REFERENCES `equipe` (`idEquipe`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `allsauv_ibfk_2` FOREIGN KEY (`idStrangeSauv`) REFERENCES `sauveteur` (`idSauv`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `allvictime`
--
ALTER TABLE `allvictime`
  ADD CONSTRAINT `allvictime_ibfk_1` FOREIGN KEY (`idStrangeSauvt`) REFERENCES `sauvetage` (`idSauvt`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `allvictime_ibfk_2` FOREIGN KEY (`idStrangeVic`) REFERENCES `victime` (`idVic`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
