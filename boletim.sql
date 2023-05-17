-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 17-Maio-2023 às 22:09
-- Versão do servidor: 10.4.17-MariaDB
-- versão do PHP: 7.3.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `boletim`
--
CREATE DATABASE IF NOT EXISTS `boletim` DEFAULT CHARACTER SET utf8 COLLATE utf8_swedish_ci;
USE `boletim`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_alunos`
--

CREATE TABLE `tb_alunos` (
  `id_aluno` int(11) NOT NULL,
  `nome_aluno` varchar(50) COLLATE utf8_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_atividades`
--

CREATE TABLE `tb_atividades` (
  `id_atividade` int(11) NOT NULL,
  `nome_atividadde` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `nota_atividade` char(2) COLLATE utf8_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_boletins`
--

CREATE TABLE `tb_boletins` (
  `id_boletim` int(11) NOT NULL,
  `fk_atividade` int(11) NOT NULL,
  `fk_aluno` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_professores`
--

CREATE TABLE `tb_professores` (
  `id_professor` int(11) NOT NULL,
  `nome_professor` varchar(50) COLLATE utf8_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_regras`
--

CREATE TABLE `tb_regras` (
  `id_regra` int(11) NOT NULL,
  `formula_regra` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `fk_professor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `tb_alunos`
--
ALTER TABLE `tb_alunos`
  ADD PRIMARY KEY (`id_aluno`);

--
-- Índices para tabela `tb_atividades`
--
ALTER TABLE `tb_atividades`
  ADD PRIMARY KEY (`id_atividade`);

--
-- Índices para tabela `tb_boletins`
--
ALTER TABLE `tb_boletins`
  ADD PRIMARY KEY (`id_boletim`),
  ADD KEY `fk_aluno` (`fk_aluno`),
  ADD KEY `fk_atividade` (`fk_atividade`);

--
-- Índices para tabela `tb_professores`
--
ALTER TABLE `tb_professores`
  ADD PRIMARY KEY (`id_professor`);

--
-- Índices para tabela `tb_regras`
--
ALTER TABLE `tb_regras`
  ADD PRIMARY KEY (`id_regra`),
  ADD KEY `fk_professor` (`fk_professor`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tb_alunos`
--
ALTER TABLE `tb_alunos`
  MODIFY `id_aluno` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_atividades`
--
ALTER TABLE `tb_atividades`
  MODIFY `id_atividade` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_boletins`
--
ALTER TABLE `tb_boletins`
  MODIFY `id_boletim` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_professores`
--
ALTER TABLE `tb_professores`
  MODIFY `id_professor` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_regras`
--
ALTER TABLE `tb_regras`
  MODIFY `id_regra` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `tb_boletins`
--
ALTER TABLE `tb_boletins`
  ADD CONSTRAINT `fk_aluno` FOREIGN KEY (`fk_aluno`) REFERENCES `tb_alunos` (`id_aluno`),
  ADD CONSTRAINT `fk_atividade` FOREIGN KEY (`fk_atividade`) REFERENCES `tb_boletins` (`id_boletim`);

--
-- Limitadores para a tabela `tb_regras`
--
ALTER TABLE `tb_regras`
  ADD CONSTRAINT `fk_professor` FOREIGN KEY (`fk_professor`) REFERENCES `tb_professores` (`id_professor`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
