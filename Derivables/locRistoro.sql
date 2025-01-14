-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Gen 05, 2015 alle 12:53
-- Versione del server: 5.6.20
-- PHP Version: 5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `localeristoro`
--
CREATE DATABASE IF NOT EXISTS `localeristoro` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `localeristoro`;

-- --------------------------------------------------------

--
-- Struttura della tabella `effettua`
--

DROP TABLE IF EXISTS `effettua`;
CREATE TABLE IF NOT EXISTS `effettua` (
  `id_tavolo` int(2) NOT NULL,
  `id_ordinazione` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `ha_una`
--

DROP TABLE IF EXISTS `ha_una`;
CREATE TABLE IF NOT EXISTS `ha_una` (
  `id_tavolo` int(2) NOT NULL,
  `dataPrenotazione` datetime NOT NULL,
  `id_prenotazione` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `ha_una`
--

INSERT INTO `ha_una` (`id_tavolo`, `dataPrenotazione`, `id_prenotazione`) VALUES
(1, '2015-01-06 00:00:00', 13);

-- --------------------------------------------------------

--
-- Struttura della tabella `ordinazione`
--

DROP TABLE IF EXISTS `ordinazione`;
CREATE TABLE IF NOT EXISTS `ordinazione` (
`id` int(5) NOT NULL,
  `prezzotot` int(11) NOT NULL,
  `statoOrdinazione` tinyint(1) NOT NULL,
  `id_cameriere` int(3) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `portate`
--

DROP TABLE IF EXISTS `portate`;
CREATE TABLE IF NOT EXISTS `portate` (
`id` int(3) NOT NULL,
  `descrizione` varchar(50) NOT NULL,
  `prezzo` float NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `portate_in_ordinazioni`
--

DROP TABLE IF EXISTS `portate_in_ordinazioni`;
CREATE TABLE IF NOT EXISTS `portate_in_ordinazioni` (
`id` int(5) NOT NULL,
  `id_ordinazione` int(5) NOT NULL,
  `dataOrdinazione` datetime NOT NULL,
  `id_portata` int(3) NOT NULL,
  `statoPortateOrdinazione` int(1) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `prenotazioni`
--

DROP TABLE IF EXISTS `prenotazioni`;
CREATE TABLE IF NOT EXISTS `prenotazioni` (
`id` int(5) NOT NULL,
  `id_utente` int(5) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Dump dei dati per la tabella `prenotazioni`
--

INSERT INTO `prenotazioni` (`id`, `id_utente`) VALUES
(13, 2),
(14, 2);

-- --------------------------------------------------------

--
-- Struttura della tabella `tavoli`
--

DROP TABLE IF EXISTS `tavoli`;
CREATE TABLE IF NOT EXISTS `tavoli` (
`id` int(2) NOT NULL,
  `numero_posti` int(2) NOT NULL,
  `numeroTavolo` tinytext NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dump dei dati per la tabella `tavoli`
--

INSERT INTO `tavoli` (`id`, `numero_posti`, `numeroTavolo`) VALUES
(1, 10, '1'),
(2, 10, '1'),
(3, 10, '1'),
(4, 10, '1'),
(5, 10, '1'),
(6, 10, '1'),
(7, 10, '1'),
(8, 10, '1'),
(9, 10, '1'),
(10, 10, '1'),
(11, 10, '1');

-- --------------------------------------------------------

--
-- Struttura della tabella `utenti`
--

DROP TABLE IF EXISTS `utenti`;
CREATE TABLE IF NOT EXISTS `utenti` (
`id` int(3) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(20) NOT NULL,
  `nome` tinytext NOT NULL,
  `cognome` tinytext NOT NULL,
  `tipologia` char(10) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dump dei dati per la tabella `utenti`
--

INSERT INTO `utenti` (`id`, `email`, `password`, `nome`, `cognome`, `tipologia`) VALUES
(1, 'concacaf@gmail.it', '2e99bf4e42962410038b', 'Giovanni', 'Zampaglione', 'utente'),
(2, 'sono@gay.org', '2e99bf4e42962410038b', 'Peppe', 'Capaldo', 'utente'),
(3, 'sono@peppe.org', '2e99bf4e42962410038b', 'Peppe', 'Capaldo', 'utente');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `effettua`
--
ALTER TABLE `effettua`
 ADD KEY `id_tavolo` (`id_tavolo`), ADD KEY `id_ordinazione` (`id_ordinazione`);

--
-- Indexes for table `ha_una`
--
ALTER TABLE `ha_una`
 ADD PRIMARY KEY (`id_tavolo`,`id_prenotazione`), ADD UNIQUE KEY `id_tavolo` (`id_tavolo`,`dataPrenotazione`), ADD UNIQUE KEY `id_tavolo_2` 
(`id_tavolo`,`dataPrenotazione`), ADD KEY `id_prenotazione` (`id_prenotazione`);

--
-- Indexes for table `ordinazione`
--
ALTER TABLE `ordinazione`
 ADD PRIMARY KEY (`id`), ADD KEY `id_cameriere` (`id_cameriere`);

--
-- Indexes for table `portate`
--
ALTER TABLE `portate`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `descrizione` (`descrizione`,`prezzo`);

--
-- Indexes for table `portate_in_ordinazioni`
--
ALTER TABLE `portate_in_ordinazioni`
 ADD PRIMARY KEY (`id`), ADD KEY `id_ordinazione` (`id_ordinazione`), ADD KEY `id_portata` (`id_portata`);

--
-- Indexes for table `prenotazioni`
--
ALTER TABLE `prenotazioni`
 ADD PRIMARY KEY (`id`), ADD KEY `id_utente` (`id_utente`);

--
-- Indexes for table `tavoli`
--
ALTER TABLE `tavoli`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `utenti`
--
ALTER TABLE `utenti`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ordinazione`
--
ALTER TABLE `ordinazione`
MODIFY `id` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `portate`
--
ALTER TABLE `portate`
MODIFY `id` int(3) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `portate_in_ordinazioni`
--
ALTER TABLE `portate_in_ordinazioni`
MODIFY `id` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `prenotazioni`
--
ALTER TABLE `prenotazioni`
MODIFY `id` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `tavoli`
--
ALTER TABLE `tavoli`
MODIFY `id` int(2) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `utenti`
--
ALTER TABLE `utenti`
MODIFY `id` int(3) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `effettua`
--
ALTER TABLE `effettua`
ADD CONSTRAINT `effettua_ibfk_1` FOREIGN KEY (`id_tavolo`) REFERENCES `tavoli` (`id`) ON DELETE CASCADE,
ADD CONSTRAINT `effettua_ibfk_2` FOREIGN KEY (`id_ordinazione`) REFERENCES `ordinazione` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `ha_una`
--
ALTER TABLE `ha_una`
ADD CONSTRAINT `ha_una_ibfk_1` FOREIGN KEY (`id_tavolo`) REFERENCES `tavoli` (`id`) ON DELETE CASCADE,
ADD CONSTRAINT `ha_una_ibfk_2` FOREIGN KEY (`id_prenotazione`) REFERENCES `prenotazioni` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `ordinazione`
--
ALTER TABLE `ordinazione`
ADD CONSTRAINT `ordinazione_ibfk_1` FOREIGN KEY (`id_cameriere`) REFERENCES `utenti` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `portate_in_ordinazioni`
--
ALTER TABLE `portate_in_ordinazioni`
ADD CONSTRAINT `portate_in_ordinazioni_ibfk_1` FOREIGN KEY (`id_ordinazione`) REFERENCES `ordinazione` (`id`) ON DELETE CASCADE,
ADD CONSTRAINT `portate_in_ordinazioni_ibfk_2` FOREIGN KEY (`id_portata`) REFERENCES `portate` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `prenotazioni`
--
ALTER TABLE `prenotazioni`
ADD CONSTRAINT `prenotazioni_ibfk_1` FOREIGN KEY (`id_utente`) REFERENCES `utenti` (`id`) ON DELETE CASCADE;
