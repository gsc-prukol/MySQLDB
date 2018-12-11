-- MySQL Script generated by MySQL Workbench
-- пт, 09-лис-2018 13:00:34 +0200
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

#SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
#SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
#SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema kursova
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema kursova
-- -----------------------------------------------------
#CREATE SCHEMA IF NOT EXISTS `kursova2` DEFAULT CHARACTER SET utf8;
#USE `kursova2` ;
ALTER SCHEMA `ka66_03`  DEFAULT COLLATE utf8_unicode_ci ;

-- -----------------------------------------------------
-- Table `kursova`.`Users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Users` (
  `idUser` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `login` VARCHAR(45) NOT NULL UNIQUE,
  `passwordHash` VARCHAR(100) NOT NULL,
  `name` VARCHAR(45) NOT NULL DEFAULT "Користувач",
  PRIMARY KEY (`idUser`)
  ) ENGINE = InnoDB
	PACK_KEYS = DEFAULT;


-- -----------------------------------------------------
-- Table `kursova`.`Videos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Videos` (
  `idVideo` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(200) NOT NULL,
  `duration` TIME NOT NULL DEFAULT "00:00:00",
  `rating` TINYINT(4) NOT NULL DEFAULT 5 CHECK(`rating` >= 1 AND `rating` <= 10),
  `url` VARCHAR(200) NOT NULL DEFAULT "",
  PRIMARY KEY (`idVideo`)
  ) ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `kursova`.`Groups`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Groups` (
  `idGroup` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(80) NOT NULL,
  `type` CHAR(1) NOT NULL,
  PRIMARY KEY (`idGroup`),
  CONSTRAINT `typeGroup` CHECK(`type` IN ('y', 'g', 'd', 'a', 'o')) # year, genre, director, actor, other
  ) ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `kursova`.`Users_has_Video`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `UsersHasVideo` (
  `idUser` INT UNSIGNED NOT NULL,
  `idVideo` INT UNSIGNED NOT NULL,
  `status` CHAR(1) NOT NULL,
  PRIMARY KEY (`idUser`, `idVideo`),
  INDEX `fk_idVideo` (`idVideo` ASC),
  INDEX `fk_idUser` (`idUser` ASC),
  CONSTRAINT `fk_idUserUHV`
    FOREIGN KEY (`idUser`)
    REFERENCES `Users` (`idUser`),
  CONSTRAINT `fk_idVideoUHV`
    FOREIGN KEY (`idVideo`)
    REFERENCES `Videos` (`idVideo`),
    CONSTRAINT `typeStatus` CHECK(`status` IN ('c', 'h', 's')) #completed, happens, scheduled
) ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `kursova`.`Video_has_Groups`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `VideoHasGroups` (
  `idVideo` INT UNSIGNED NOT NULL,
  `idGroup` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`idVideo`, `idGroup`),
  INDEX `fk_idGroup` (`idGroup` ASC),
  INDEX `fk_idVideo` (`idVideo` ASC),
  CONSTRAINT `fk_idVideoVHG`
    FOREIGN KEY (`idVideo`)
    REFERENCES `Videos` (`idVideo`),
  CONSTRAINT `fk_idGroupVHG`
    FOREIGN KEY (`idGroup`)
    REFERENCES `Groups` (`idGroup`)
    ) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Log` (
  `idLog` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `logMessage` VARCHAR(200) NOT NULL,
  `tableName` VARCHAR(20) NOT NULL,
  `idRowsTable` INT UNSIGNED NOT NULL,
  `actionType` CHAR(1) NOT NULL CHECK (`actionType` IN ('i', 'u', 'd')) , # insert, update, delete
  `time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`idLog`)
) ENGINE = InnoDB;


#SET SQL_MODE=@OLD_SQL_MODE;
#SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
#SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
