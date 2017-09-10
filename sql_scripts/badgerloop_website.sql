CREATE SCHEMA IF NOT EXISTS `website-data` DEFAULT CHARACTER SET utf8;
USE `website-data` ;

-- -----------------------------------------------------
-- Table `website-data`.`tier`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `website-data`.`tier` ;

CREATE TABLE IF NOT EXISTS `website-data`.`tier` (
	`id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,
	`name` VARCHAR(45) NOT NULL UNIQUE,
	`value` INT NOT NULL,
	`timestamp` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- -----------------------------------------------------
-- Table `website-data`.`position`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `website-data`.`position` ;

CREATE TABLE IF NOT EXISTS `website-data`.`position` (
	`id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,
	`name` VARCHAR(45) NOT NULL UNIQUE,
	`level` INT UNSIGNED NOT NULL,
	`timestamp` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	INDEX `FK_position_tier_idx` (`level` ASC),
	CONSTRAINT `FK_position_tier`
		FOREIGN KEY (`level`)
		REFERENCES `website-data`.`tier` (`id`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
);

-- -----------------------------------------------------
-- Table `website-data`.`member`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `website-data`.`member` ;

CREATE TABLE IF NOT EXISTS `website-data`.`member` (
	`id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,
	`uid` VARCHAR(45) NOT NULL,
	`eppn` VARCHAR(45) NOT NULL UNIQUE,
	`position` INT UNSIGNED NULL,
	`timestamp` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	INDEX `FK_member_position_idx` (`position` ASC),
	CONSTRAINT `FK_member_position`
		FOREIGN KEY (`position`)
		REFERENCES `website-data`.`position` (`id`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
);
