-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 04-Jul-2023 às 21:51
-- Versão do servidor: 5.7.40
-- versão do PHP: 8.0.26

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

DROP TABLE IF EXISTS `assignment_tb`;
CREATE TABLE IF NOT EXISTS `assignment_tb` (
  `assignment_id` int(11) NOT NULL AUTO_INCREMENT,
  `assingment_name` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  PRIMARY KEY (`assignment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

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

DROP TABLE IF EXISTS `grade_tb`;
CREATE TABLE IF NOT EXISTS `grade_tb` (
  `grades_id` int(11) NOT NULL AUTO_INCREMENT,
  `assignment_grade` char(2) COLLATE utf8_swedish_ci NOT NULL COMMENT 'MB, B, R, I',
  `assignment_fk` int(11) NOT NULL,
  `student_fk` int(11) NOT NULL,
  PRIMARY KEY (`grades_id`),
  KEY `fk_aluno` (`student_fk`),
  KEY `fk_atividade` (`assignment_fk`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Extraindo dados da tabela `grade_tb`
--

INSERT INTO `grade_tb` (`grades_id`, `assignment_grade`, `assignment_fk`, `student_fk`) VALUES
(2, 'MB', 2, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pattern_tb`
--

DROP TABLE IF EXISTS `pattern_tb`;
CREATE TABLE IF NOT EXISTS `pattern_tb` (
  `pattern_id` int(11) NOT NULL AUTO_INCREMENT,
  `pattern_formula` varchar(50) COLLATE utf8_swedish_ci NOT NULL COMMENT 'Ex: mb + b + b + mb = mb',
  `teacher_fk` int(11) NOT NULL,
  PRIMARY KEY (`pattern_id`),
  KEY `fk_professor` (`teacher_fk`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Extraindo dados da tabela `pattern_tb`
--

INSERT INTO `pattern_tb` (`pattern_id`, `pattern_formula`, `teacher_fk`) VALUES
(1, 'MB + MB + MB + MB = MB', 24),
(16, 'B + B + B + B = B', 24);

-- --------------------------------------------------------

--
-- Estrutura da tabela `student_tb`
--

DROP TABLE IF EXISTS `student_tb`;
CREATE TABLE IF NOT EXISTS `student_tb` (
  `student_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_name` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  `student_age` int(100) NOT NULL,
  PRIMARY KEY (`student_id`),
  UNIQUE KEY `student_name` (`student_name`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Extraindo dados da tabela `student_tb`
--

INSERT INTO `student_tb` (`student_id`, `student_name`, `student_age`) VALUES
(1, 'Vitor Miranda', 0),
(2, 'Carlos Eduardo', 0),
(65, 'teste', 15),
(67, 'jose', 45);

-- --------------------------------------------------------

--
-- Estrutura da tabela `teacher_tb`
--

DROP TABLE IF EXISTS `teacher_tb`;
CREATE TABLE IF NOT EXISTS `teacher_tb` (
  `teacher_id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_name` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `teacher_email` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  `teacher_password` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  PRIMARY KEY (`teacher_id`),
  UNIQUE KEY `teacher_email` (`teacher_email`)
) ENGINE=InnoDB AUTO_INCREMENT=232 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Extraindo dados da tabela `teacher_tb`
--

INSERT INTO `teacher_tb` (`teacher_id`, `teacher_name`, `teacher_email`, `teacher_password`) VALUES
(1, 'João Jesus', '', ''),
(24, 'pedro', 'pedro@gmail.com', '40bd001563085fc35165329ea1ff5c5ecbdbbeef');

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
