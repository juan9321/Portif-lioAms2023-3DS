-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 05-Out-2023 às 22:04
-- Versão do servidor: 10.4.22-MariaDB
-- versão do PHP: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `littlehost`
--
CREATE DATABASE IF NOT EXISTS `littlehost` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `littlehost`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `administrador`
--

CREATE TABLE `administrador` (
  `cod` int(10) UNSIGNED NOT NULL,
  `nome` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `administrador`
--

INSERT INTO `administrador` (`cod`, `nome`, `email`, `senha`) VALUES
(1, 'hostinho', 'adm@gmail.com', '12345678');

-- --------------------------------------------------------

--
-- Estrutura da tabela `anfitriao`
--

CREATE TABLE `anfitriao` (
  `cod` int(10) UNSIGNED NOT NULL,
  `nome` varchar(255) NOT NULL,
  `telefone` bigint(13) UNSIGNED NOT NULL,
  `endereco` varchar(255) NOT NULL,
  `cidade` varchar(100) NOT NULL,
  `bairro` varchar(100) NOT NULL,
  `num_casa` varchar(20) NOT NULL,
  `complemento` varchar(50) NOT NULL,
  `cep` bigint(8) UNSIGNED NOT NULL,
  `cpf` bigint(11) UNSIGNED NOT NULL,
  `genero` enum('Feminino','Masculino','Outro') NOT NULL,
  `dt_nasc` date NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha` varchar(8) NOT NULL,
  `imagem_perfil` varchar(50) NOT NULL,
  `imagem_local` varchar(50) NOT NULL,
  `valor_hora` double NOT NULL,
  `preferencias` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `anfitriao`
--

INSERT INTO `anfitriao` (`cod`, `nome`, `telefone`, `endereco`, `cidade`, `bairro`, `num_casa`, `complemento`, `cep`, `cpf`, `genero`, `dt_nasc`, `email`, `senha`, `imagem_perfil`, `imagem_local`, `valor_hora`, `preferencias`) VALUES
(1, 'Amanda', 11959955896, 'Rua Um', 'São Paulo', 'Bairro Um', '69', 'Casa 5', 8485200, 12312312356, 'Masculino', '0000-00-00', 'victor@gmail.com', '12345678', 'img/imagem1.png', '', 14.99, ''),
(2, 'Julia', 11959955896, 'Rua Um', 'São Paulo', 'Bairro Um', '69', 'Casa 5', 8485200, 12312312356, 'Masculino', '2005-12-19', 'victor@gmail.com', '12345678', 'img/imagem1.png', '', 14.99, '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `ficha_animal`
--

CREATE TABLE `ficha_animal` (
  `cod_animal` int(10) UNSIGNED NOT NULL,
  `cod_tutor` int(10) UNSIGNED NOT NULL,
  `nome` varchar(255) NOT NULL,
  `especie` enum('Gato','Cachorro') NOT NULL,
  `raca` varchar(100) NOT NULL,
  `sexo` enum('Fêmea','Macho') NOT NULL,
  `idade` int(10) UNSIGNED NOT NULL,
  `peso` decimal(10,2) NOT NULL,
  `tamanho` decimal(10,2) NOT NULL,
  `caracteristicas` varchar(255) NOT NULL,
  `comportamento` text NOT NULL,
  `historico_medico` text NOT NULL,
  `instrucoes_especiais` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `ficha_animal`
--

INSERT INTO `ficha_animal` (`cod_animal`, `cod_tutor`, `nome`, `especie`, `raca`, `sexo`, `idade`, `peso`, `tamanho`, `caracteristicas`, `comportamento`, `historico_medico`, `instrucoes_especiais`) VALUES
(2, 8, 'Jubi', 'Cachorro', 'Pincher', 'Fêmea', 5, '10.00', '30.00', 'Toda preta', 'Raivosa e ama leite', 'Possui Bipolaridade', 'Passar pomada no nariz de 1 em 1 hora');

-- --------------------------------------------------------

--
-- Estrutura da tabela `hospedagem`
--

CREATE TABLE `hospedagem` (
  `cod` int(10) UNSIGNED NOT NULL,
  `cod_tutor` int(10) UNSIGNED NOT NULL,
  `cod_anfitriao` int(10) UNSIGNED NOT NULL,
  `cod_animal` int(10) UNSIGNED NOT NULL,
  `data_hosp` datetime NOT NULL,
  `data_busca` datetime NOT NULL,
  `valor_total` double UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `hospedagem`
--

INSERT INTO `hospedagem` (`cod`, `cod_tutor`, `cod_anfitriao`, `cod_animal`, `data_hosp`, `data_busca`, `valor_total`) VALUES
(1, 8, 1, 2, '2023-09-23 17:37:53', '2023-09-29 17:37:54', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tutor`
--

CREATE TABLE `tutor` (
  `cod` int(10) UNSIGNED NOT NULL,
  `nome` text NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha` varchar(8) NOT NULL,
  `imagem_perfil` varchar(100) NOT NULL,
  `imagem_animal` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tutor`
--

INSERT INTO `tutor` (`cod`, `nome`, `email`, `senha`, `imagem_perfil`, `imagem_animal`) VALUES
(8, 'Juan', 'juan@gmail.com', '123123', 'img/imagem2.png', ''),
(9, 'fernanda', 'fernanda@gmail.com', '123123', 'img/imagem3.png', '');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`cod`);

--
-- Índices para tabela `anfitriao`
--
ALTER TABLE `anfitriao`
  ADD PRIMARY KEY (`cod`);

--
-- Índices para tabela `ficha_animal`
--
ALTER TABLE `ficha_animal`
  ADD PRIMARY KEY (`cod_animal`),
  ADD KEY `animal_tutor` (`cod_tutor`);

--
-- Índices para tabela `hospedagem`
--
ALTER TABLE `hospedagem`
  ADD PRIMARY KEY (`cod`),
  ADD KEY `cod_tutor` (`cod_tutor`),
  ADD KEY `cod_anf` (`cod_anfitriao`),
  ADD KEY `cod_animal` (`cod_animal`);

--
-- Índices para tabela `tutor`
--
ALTER TABLE `tutor`
  ADD PRIMARY KEY (`cod`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `administrador`
--
ALTER TABLE `administrador`
  MODIFY `cod` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `anfitriao`
--
ALTER TABLE `anfitriao`
  MODIFY `cod` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `ficha_animal`
--
ALTER TABLE `ficha_animal`
  MODIFY `cod_animal` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `hospedagem`
--
ALTER TABLE `hospedagem`
  MODIFY `cod` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `tutor`
--
ALTER TABLE `tutor`
  MODIFY `cod` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `ficha_animal`
--
ALTER TABLE `ficha_animal`
  ADD CONSTRAINT `animal_tutor` FOREIGN KEY (`cod_tutor`) REFERENCES `tutor` (`cod`);

--
-- Limitadores para a tabela `hospedagem`
--
ALTER TABLE `hospedagem`
  ADD CONSTRAINT `hosp_anfitriao` FOREIGN KEY (`cod_anfitriao`) REFERENCES `anfitriao` (`cod`),
  ADD CONSTRAINT `hosp_animal` FOREIGN KEY (`cod_animal`) REFERENCES `ficha_animal` (`cod_animal`),
  ADD CONSTRAINT `hosp_tutor` FOREIGN KEY (`cod_tutor`) REFERENCES `tutor` (`cod`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
