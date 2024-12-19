-- phpMyAdmin SQL Dump
-- version 3.3.9.2
-- http://www.phpmyadmin.net
--
-- Serveur: 127.0.0.1
-- Généré le : Jeu 19 Décembre 2024 à 10:55
-- Version du serveur: 5.5.10
-- Version de PHP: 5.3.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `gestioncommandes`
--

-- --------------------------------------------------------

--
-- Structure de la table `table clients`
--

CREATE TABLE IF NOT EXISTS `table clients` (
  `id_client` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `date_inscription` date NOT NULL,
  PRIMARY KEY (`id_client`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `table clients`
--

INSERT INTO `table clients` (`id_client`, `nom`, `prenom`, `email`, `date_inscription`) VALUES
(3, 'Dupont', 'Marie', 'marie.dupont@example.com', '2023-01-10'),
(4, 'Durant', 'Paul', 'paul.durand@example.com', '2023-02-20'),
(5, 'Martin', 'Alice', 'alice.martin@example.com', '2023-03-15');

-- --------------------------------------------------------

--
-- Structure de la table `table commandes`
--

CREATE TABLE IF NOT EXISTS `table commandes` (
  `id_commandes` int(11) NOT NULL AUTO_INCREMENT,
  `id_client` int(11) NOT NULL,
  `date_commande` date NOT NULL,
  `montant_total` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_commandes`),
  KEY `id_client` (`id_client`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Contenu de la table `table commandes`
--

INSERT INTO `table commandes` (`id_commandes`, `id_client`, `date_commande`, `montant_total`) VALUES
(9, 3, '2023-12-01', 1950.00),
(10, 4, '2023-12-03', 800.00);

-- --------------------------------------------------------

--
-- Structure de la table `table detailscommandes`
--

CREATE TABLE IF NOT EXISTS `table detailscommandes` (
  `id_detail` int(11) NOT NULL AUTO_INCREMENT,
  `id_commande` int(11) NOT NULL,
  `id_produit` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  `prix_total` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_detail`),
  KEY `id_produit` (`id_produit`),
  KEY `id_commande` (`id_commande`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `table detailscommandes`
--

INSERT INTO `table detailscommandes` (`id_detail`, `id_commande`, `id_produit`, `quantite`, `prix_total`) VALUES
(1, 9, 1, 1, 1200.00),
(2, 10, 3, 5, 750.00),
(3, 9, 2, 1, 800.50);

-- --------------------------------------------------------

--
-- Structure de la table `table produits`
--

CREATE TABLE IF NOT EXISTS `table produits` (
  `id_produit` int(11) NOT NULL AUTO_INCREMENT,
  `nom_produit` varchar(255) NOT NULL,
  `prix` decimal(10,2) NOT NULL,
  `stock` int(11) NOT NULL,
  PRIMARY KEY (`id_produit`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Contenu de la table `table produits`
--

INSERT INTO `table produits` (`id_produit`, `nom_produit`, `prix`, `stock`) VALUES
(1, 'Ordinateur portable', 1200.00, 10),
(2, 'Smartphone', 800.80, 15),
(3, 'Casque audio', 150.00, 30),
(4, 'Clavier', 50.00, 50);

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `table commandes`
--
ALTER TABLE `table commandes`
  ADD CONSTRAINT `table@0020commandes_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `table clients` (`id_client`);

--
-- Contraintes pour la table `table detailscommandes`
--
ALTER TABLE `table detailscommandes`
  ADD CONSTRAINT `table@0020detailscommandes_ibfk_2` FOREIGN KEY (`id_commande`) REFERENCES `table commandes` (`id_commandes`),
  ADD CONSTRAINT `table@0020detailscommandes_ibfk_1` FOREIGN KEY (`id_produit`) REFERENCES `table produits` (`id_produit`);
