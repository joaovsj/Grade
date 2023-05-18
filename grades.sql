-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 18-Maio-2023 às 23:13
-- Versão do servidor: 10.4.25-MariaDB
-- versão do PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `grades`
--
CREATE DATABASE IF NOT EXISTS `grades` DEFAULT CHARACTER SET utf8 COLLATE utf8_swedish_ci;
USE `grades`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `assignment_tb`
--

CREATE TABLE `assignment_tb` (
  `assignment_id` int(11) NOT NULL,
  `assingment_name` varchar(50) COLLATE utf8_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Extraindo dados da tabela `assignment_tb`
--

INSERT INTO `assignment_tb` (`assignment_id`, `assingment_name`) VALUES
(1, 'Exam'),
(2, 'Seminary');

-- --------------------------------------------------------

--
-- Estrutura da tabela `grade_tb`
--

CREATE TABLE `grade_tb` (
  `grades_id` int(11) NOT NULL,
  `assignment_grade` char(2) COLLATE utf8_swedish_ci NOT NULL COMMENT 'MB, B, R, I',
  `assignment_fk` int(11) NOT NULL,
  `student_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Extraindo dados da tabela `grade_tb`
--

INSERT INTO `grade_tb` (`grades_id`, `assignment_grade`, `assignment_fk`, `student_fk`) VALUES
(2, 'MB', 2, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pattern_tb`
--

CREATE TABLE `pattern_tb` (
  `pattern_id` int(11) NOT NULL,
  `pattern_formula` varchar(50) COLLATE utf8_swedish_ci NOT NULL COMMENT 'Ex: mb + b + b + mb = mb',
  `teacher_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `student_tb`
--

CREATE TABLE `student_tb` (
  `student_id` int(11) NOT NULL,
  `student_name` varchar(50) COLLATE utf8_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Extraindo dados da tabela `student_tb`
--

INSERT INTO `student_tb` (`student_id`, `student_name`) VALUES
(1, 'Vitor Miranda'),
(2, 'Carlos Eduardo');

-- --------------------------------------------------------

--
-- Estrutura da tabela `teacher_tb`
--

CREATE TABLE `teacher_tb` (
  `teacher_id` int(11) NOT NULL,
  `teacher_name` varchar(50) COLLATE utf8_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Extraindo dados da tabela `teacher_tb`
--

INSERT INTO `teacher_tb` (`teacher_id`, `teacher_name`) VALUES
(1, 'João Jesus');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `assignment_tb`
--
ALTER TABLE `assignment_tb`
  ADD PRIMARY KEY (`assignment_id`);

--
-- Índices para tabela `grade_tb`
--
ALTER TABLE `grade_tb`
  ADD PRIMARY KEY (`grades_id`),
  ADD KEY `fk_aluno` (`student_fk`),
  ADD KEY `fk_atividade` (`assignment_fk`);

--
-- Índices para tabela `pattern_tb`
--
ALTER TABLE `pattern_tb`
  ADD PRIMARY KEY (`pattern_id`),
  ADD KEY `fk_professor` (`teacher_fk`);

--
-- Índices para tabela `student_tb`
--
ALTER TABLE `student_tb`
  ADD PRIMARY KEY (`student_id`);

--
-- Índices para tabela `teacher_tb`
--
ALTER TABLE `teacher_tb`
  ADD PRIMARY KEY (`teacher_id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `assignment_tb`
--
ALTER TABLE `assignment_tb`
  MODIFY `assignment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `grade_tb`
--
ALTER TABLE `grade_tb`
  MODIFY `grades_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `pattern_tb`
--
ALTER TABLE `pattern_tb`
  MODIFY `pattern_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `student_tb`
--
ALTER TABLE `student_tb`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `teacher_tb`
--
ALTER TABLE `teacher_tb`
  MODIFY `teacher_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `grade_tb`
--
ALTER TABLE `grade_tb`
  ADD CONSTRAINT `assignment_fk` FOREIGN KEY (`assignment_fk`) REFERENCES `assignment_tb` (`assignment_id`),
  ADD CONSTRAINT `student_fk` FOREIGN KEY (`student_fk`) REFERENCES `student_tb` (`student_id`);

--
-- Limitadores para a tabela `pattern_tb`
--
ALTER TABLE `pattern_tb`
  ADD CONSTRAINT `teacher_fk` FOREIGN KEY (`teacher_fk`) REFERENCES `teacher_tb` (`teacher_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
