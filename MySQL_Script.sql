SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `traductor` ;
CREATE SCHEMA IF NOT EXISTS `traductor` DEFAULT CHARACTER SET latin1 ;
USE `traductor` ;

-- -----------------------------------------------------
-- Table `traductor`.`diccionario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `traductor`.`diccionario` ;

CREATE  TABLE IF NOT EXISTS `traductor`.`diccionario` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `Espanol` VARCHAR(50) NOT NULL ,
  `Kaqchikel` VARCHAR(50) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = latin1;

USE `traductor` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;