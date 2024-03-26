-- MySQL Script generated by MySQL Workbench
-- Sun Sep  4 15:07:03 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema rockola
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `rockola` ;

-- -----------------------------------------------------
-- Schema rockola
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `rockola`;
USE `rockola` ;

-- -----------------------------------------------------
-- Table `rockola`.`generos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rockola`.`generos` (
  `idGenero` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idGenero`))
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `rockola`.`canciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rockola`.`canciones` (
  `idCancion` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Autor` VARCHAR(45) NULL DEFAULT NULL,
  `IdGenero` INT NOT NULL,
  PRIMARY KEY (`idCancion`),
  CONSTRAINT `fk_IdCancionGenero`
    FOREIGN KEY (`IdGenero`)
    REFERENCES `rockola`.`generos` (`idGenero`))
ENGINE = InnoDB;

CREATE INDEX `fk_IdCancionGenero_idx` ON `rockola`.`canciones` (`IdGenero` ASC) ;


-- -----------------------------------------------------
-- Table `rockola`.`roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rockola`.`roles` (
  `IdRol` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`IdRol`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rockola`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rockola`.`usuarios` (
  `IdUsuario` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Cedula` INT NOT NULL,
  `Correo` VARCHAR(45) NULL DEFAULT NULL,
  `IdRol` INT NOT NULL,
  `Contraseña` INT NOT NULL,
  PRIMARY KEY (`IdUsuario`),
  CONSTRAINT `fk_idUsuarioRol`
    FOREIGN KEY (`IdRol`)
    REFERENCES `rockola`.`roles` (`IdRol`))
ENGINE = InnoDB;

CREATE INDEX `IdRol_idx` ON `rockola`.`usuarios` (`IdRol` ASC);


-- -----------------------------------------------------
-- Table `rockola`.`playlist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rockola`.`playlist` (
  `idPlayList` INT NOT NULL,
  `idUsuario` INT NOT NULL,
  `Creditos` VARCHAR(45) NULL DEFAULT NULL,
  `Nombre` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idPlayList`),
  CONSTRAINT `fk_IdUsuarioPlaylist`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `rockola`.`usuarios` (`IdUsuario`))
ENGINE = InnoDB;

CREATE INDEX `fk_IdUsuarioPlaylist_idx` ON `rockola`.`playlist` (`idUsuario` ASC) ;


-- -----------------------------------------------------
-- Table `rockola`.`listas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rockola`.`listas` (
  `idLista` INT NOT NULL,
  `idCancion` INT NOT NULL,
  `posicion` INT NOT NULL,
  `idUsuario` INT NOT NULL,
  `idPlaylist` INT NOT NULL,
  PRIMARY KEY (`idLista`),
  CONSTRAINT `fk_IdCancion_Listas`
    FOREIGN KEY (`idCancion`)
    REFERENCES `rockola`.`canciones` (`idCancion`),
  CONSTRAINT `fk_IdPlatlist_Listas`
    FOREIGN KEY (`idPlaylist`)
    REFERENCES `rockola`.`playlist` (`idPlayList`),
  CONSTRAINT `fk_IdUsuario_Listas`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `rockola`.`usuarios` (`IdUsuario`))
ENGINE = InnoDB;
CREATE INDEX `fk_IdCancion_Listas_idx` ON `rockola`.`listas` (`idCancion` ASC) ;

CREATE INDEX `fk_IdPlatlist_Listas_idx` ON `rockola`.`listas` (`idPlaylist` ASC) ;

CREATE INDEX `fk_IdUsuario_Listas_idx` ON `rockola`.`listas` (`idUsuario` ASC) ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;