-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Mag 10, 2022 alle 10:38
-- Versione del server: 10.4.21-MariaDB
-- Versione PHP: 8.0.12
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */
;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */
;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */
;
/*!40101 SET NAMES utf8mb4 */
;
--
-- Database: `aeroportomln`
--
-- --------------------------------------------------------
--
-- Struttura della tabella `addetti`
--
CREATE TABLE `addetti` (
    `id_addetto` int(11) NOT NULL,
    `id_funzionario` varchar(32) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;
-- --------------------------------------------------------
--
-- Struttura della tabella `controlli`
--
CREATE TABLE `controlli` (
    `id_controllo` int(11) NOT NULL,
    `id_addetto` int(11) DEFAULT NULL,
    `punto_controllo` varchar(32) DEFAULT NULL,
    `inizio_controllo` datetime DEFAULT NULL,
    `durata_controllo` float DEFAULT NULL,
    `note` text DEFAULT NULL,
    `chiuso` tinyint(1) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;
-- --------------------------------------------------------
--
-- Struttura della tabella `controlli_merci`
--
CREATE TABLE `controlli_merci` (
    `id_controllo_merci` int(11) NOT NULL,
    `esito` enum('passate', 'respinte') DEFAULT NULL,
    `dazi` float DEFAULT NULL,
    `descrizione` text DEFAULT NULL,
    `categoria` varchar(32) DEFAULT NULL,
    `quantita` int(11) DEFAULT NULL,
    `id_controllo` int(11) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;
-- --------------------------------------------------------
--
-- Struttura della tabella `controlli_passeggeri`
--
CREATE TABLE `controlli_passeggeri` (
    `id_controllo_passeggeri` int(11) NOT NULL,
    `esito` enum('passato', 'fermo') DEFAULT NULL,
    `nome` varchar(32) DEFAULT NULL,
    `cognome` varchar(32) DEFAULT NULL,
    `nazionalita` varchar(32) DEFAULT NULL,
    `aeroporto_partenza` varchar(3) DEFAULT NULL,
    `aeroporto_arrivo` varchar(3) DEFAULT NULL,
    `tipo_documento` varchar(32) DEFAULT NULL,
    `n_documento` varchar(32) DEFAULT NULL,
    `motivo_viaggio` varchar(32) DEFAULT NULL,
    `note` text DEFAULT NULL,
    `id_controllo` int(11) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;
-- --------------------------------------------------------
--
-- Struttura della tabella `funzionari`
--
CREATE TABLE `funzionari` (
    `id_funzionario` varchar(32) NOT NULL,
    `password` varchar(32) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;
--
-- Indici per le tabelle scaricate
--
--
-- Indici per le tabelle `addetti`
--
ALTER TABLE `addetti`
ADD PRIMARY KEY (`id_addetto`),
    ADD KEY `id_funzionario` (`id_funzionario`);
--
-- Indici per le tabelle `controlli`
--
ALTER TABLE `controlli`
ADD PRIMARY KEY (`id_controllo`),
    ADD KEY `id_addetto` (`id_addetto`);
--
-- Indici per le tabelle `controlli_merci`
--
ALTER TABLE `controlli_merci`
ADD PRIMARY KEY (`id_controllo_merci`),
    ADD KEY `id_controllo` (`id_controllo`);
--
-- Indici per le tabelle `controlli_passeggeri`
--
ALTER TABLE `controlli_passeggeri`
ADD PRIMARY KEY (`id_controllo_passeggeri`),
    ADD KEY `id_controllo` (`id_controllo`);
--
-- Indici per le tabelle `funzionari`
--
ALTER TABLE `funzionari`
ADD PRIMARY KEY (`id_funzionario`);
--
-- AUTO_INCREMENT per le tabelle scaricate
--
--
-- AUTO_INCREMENT per la tabella `addetti`
--
ALTER TABLE `addetti`
MODIFY `id_addetto` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la tabella `controlli`
--
ALTER TABLE `controlli`
MODIFY `id_controllo` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la tabella `controlli_merci`
--
ALTER TABLE `controlli_merci`
MODIFY `id_controllo_merci` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la tabella `controlli_passeggeri`
--
ALTER TABLE `controlli_passeggeri`
MODIFY `id_controllo_passeggeri` int(11) NOT NULL AUTO_INCREMENT;
--
-- Limiti per le tabelle scaricate
--
--
-- Limiti per la tabella `addetti`
--
ALTER TABLE `addetti`
ADD CONSTRAINT `addetti_ibfk_1` FOREIGN KEY (`id_funzionario`) REFERENCES `funzionari` (`id_funzionario`);
--
-- Limiti per la tabella `controlli`
--
ALTER TABLE `controlli`
ADD CONSTRAINT `controlli_ibfk_1` FOREIGN KEY (`id_addetto`) REFERENCES `addetti` (`id_addetto`);
--
-- Limiti per la tabella `controlli_merci`
--
ALTER TABLE `controlli_merci`
ADD CONSTRAINT `controlli_merci_ibfk_1` FOREIGN KEY (`id_controllo`) REFERENCES `controlli` (`id_controllo`);
--
-- Limiti per la tabella `controlli_passeggeri`
--
ALTER TABLE `controlli_passeggeri`
ADD CONSTRAINT `controlli_passeggeri_ibfk_1` FOREIGN KEY (`id_controllo`) REFERENCES `controlli` (`id_controllo`);
COMMIT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */
;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */
;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */
;