-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 19-Out-2022 às 16:12
-- Versão do servidor: 10.4.19-MariaDB
-- versão do PHP: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `base`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `candidaturas`
--

CREATE TABLE `candidaturas` (
  `IdCandidatura` int(11) NOT NULL,
  `Cargo` varchar(50) NOT NULL,
  `NumeroCandidatura` varchar(10) NOT NULL,
  `NomeCandidato` varchar(100) NOT NULL,
  `NomeVice` varchar(100) DEFAULT NULL,
  `NomePartido` varchar(10) NOT NULL,
  `NumeroPartido` varchar(10) NOT NULL,
  `FotoCandidato` varchar(2500) DEFAULT NULL,
  `FotoVice` varchar(2500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `candidaturas`
--

INSERT INTO `candidaturas` (`IdCandidatura`, `Cargo`, `NumeroCandidatura`, `NomeCandidato`, `NomeVice`, `NomePartido`, `NumeroPartido`, `FotoCandidato`, `FotoVice`) VALUES
(12, 'prefeito', '01', 'Lidera Jovem', 'Djennyfer Kaylane', 'G.E.L.J', '12', 'chapa1.jpeg', 'blob:https://web.whatsapp.com/37db9d1a-da69-4509-a274-662b0e242033'),
(13, 'prefeito', '02', 'Resiliência Jovem', 'Kaique', 'G.E.R.J', '13', 'chapa2.jpeg', 'blob:https://web.whatsapp.com/6e2551e9-972b-4fe9-b48c-ae3312b2afe0');

-- --------------------------------------------------------

--
-- Estrutura da tabela `votos`
--

CREATE TABLE `votos` (
  `IdVoto` int(11) NOT NULL,
  `IdCandidaturaVotada` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `candidaturas`
--
ALTER TABLE `candidaturas`
  ADD PRIMARY KEY (`IdCandidatura`);

--
-- Índices para tabela `votos`
--
ALTER TABLE `votos`
  ADD PRIMARY KEY (`IdVoto`),
  ADD KEY `IdCandidaturaVotada` (`IdCandidaturaVotada`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `candidaturas`
--
ALTER TABLE `candidaturas`
  MODIFY `IdCandidatura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15124;

--
-- AUTO_INCREMENT de tabela `votos`
--
ALTER TABLE `votos`
  MODIFY `IdVoto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `votos`
--
ALTER TABLE `votos`
  ADD CONSTRAINT `votos_ibfk_1` FOREIGN KEY (`IdCandidaturaVotada`) REFERENCES `candidaturas` (`IdCandidatura`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
