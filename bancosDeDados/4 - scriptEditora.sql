-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema editora_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema editora_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `editora_db` DEFAULT CHARACTER SET utf8 ;
USE `editora_db` ;

-- -----------------------------------------------------
-- Table `editora_db`.`Autor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `editora_db`.`Autor` (
  `idAutor` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idAutor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `editora_db`.`Editora`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `editora_db`.`Editora` (
  `idEditora` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idEditora`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `editora_db`.`Genero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `editora_db`.`Genero` (
  `idGenero` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idGenero`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `editora_db`.`Livro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `editora_db`.`Livro` (
  `idLivro` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(45) NOT NULL,
  `preco` DECIMAL(3) NULL,
  `idEditora` INT NOT NULL,
  `idGenero` INT NOT NULL,
  PRIMARY KEY (`idLivro`),
  INDEX `fk_Livro_Editora_idx` (`idEditora` ASC),
  INDEX `fk_Livro_Genero1_idx` (`idGenero` ASC),
  CONSTRAINT `fk_Livro_Editora`
    FOREIGN KEY (`idEditora`)
    REFERENCES `editora_db`.`Editora` (`idEditora`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Livro_Genero1`
    FOREIGN KEY (`idGenero`)
    REFERENCES `editora_db`.`Genero` (`idGenero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `editora_db`.`Livro_Autor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `editora_db`.`Livro_Autor` (
  `idAutor` INT NOT NULL,
  `idLivro` INT NOT NULL,
  PRIMARY KEY (`idAutor`, `idLivro`),
  INDEX `fk_Autor_has_Livro_Livro1_idx` (`idLivro` ASC),
  INDEX `fk_Autor_has_Livro_Autor1_idx` (`idAutor` ASC),
  CONSTRAINT `fk_Autor_has_Livro_Autor1`
    FOREIGN KEY (`idAutor`)
    REFERENCES `editora_db`.`Autor` (`idAutor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Autor_has_Livro_Livro1`
    FOREIGN KEY (`idLivro`)
    REFERENCES `editora_db`.`Livro` (`idLivro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `editora_db`.`Ranking`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `editora_db`.`Ranking` (
  `idRanking` INT NOT NULL AUTO_INCREMENT,
  `dataInicial` DATE NOT NULL,
  `dataFinal` DATE NOT NULL,
  PRIMARY KEY (`idRanking`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `editora_db`.`Ranking_Semanal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `editora_db`.`Ranking_Semanal` (
  `idRanking` INT NOT NULL,
  `idLivro` INT NOT NULL,
  `posicao` DECIMAL(2) NULL,
  `quantidadeSemanas` DECIMAL(2) NULL,
  `semanasConsecutivas` DECIMAL(2) NULL,
  `posicaoSemanaAnterior` DECIMAL(2) NULL,
  PRIMARY KEY (`idRanking`, `idLivro`),
  INDEX `fk_Ranking_has_Livro_Livro1_idx` (`idLivro` ASC),
  INDEX `fk_Ranking_has_Livro_Ranking1_idx` (`idRanking` ASC),
  CONSTRAINT `fk_Ranking_has_Livro_Ranking1`
    FOREIGN KEY (`idRanking`)
    REFERENCES `editora_db`.`Ranking` (`idRanking`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ranking_has_Livro_Livro1`
    FOREIGN KEY (`idLivro`)
    REFERENCES `editora_db`.`Livro` (`idLivro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
