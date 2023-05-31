-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Departamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Departamento` (
  `idDepartamento` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `localizacao` VARCHAR(45) NOT NULL,
  `orcamento` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idDepartamento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Empregado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Empregado` (
  `idEmpregado` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `idGerente` INT NULL,
  `funcao` VARCHAR(45) NULL,
  `Departamento_idDepartamento` INT NOT NULL,
  `dataAdmissao` DATE NOT NULL,
  `salario` INT NULL,
  `comissao` INT NULL,
  PRIMARY KEY (`idEmpregado`, `Departamento_idDepartamento`),
  INDEX `fk_Empregado_Departamento_idx` (`Departamento_idDepartamento` ASC),
  CONSTRAINT `fk_Empregado_Departamento`
    FOREIGN KEY (`Departamento_idDepartamento`)
    REFERENCES `mydb`.`Departamento` (`idDepartamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
