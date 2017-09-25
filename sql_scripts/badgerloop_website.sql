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
-- Table `website-data`.`year`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `website-data`.`year` (
	`id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,
	`name` VARCHAR(45) NOT NULL,
	`timestamp` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- -----------------------------------------------------
-- Table `website-data`.`member`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `website-data`.`member` (
	`id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,
	`uid` VARCHAR(45) NOT NULL,
	`eppn` VARCHAR(45) NOT NULL UNIQUE,
	`first_name` VARCHAR(45) NOT NULL,
	`last_name` VARCHAR(45) NOT NULL,
	`email` VARCHAR(45) NOT NULL,
	`linkedin` VARCHAR(255) NOT NULL,
	`headshot` VARCHAR(45) NOT NULL,
	`major` INT UNSIGNED NOT NULL,
	`year` INT UNSIGNED NOT NULL,
	`position` INT UNSIGNED NULL,
	`timestamp` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	INDEX `FK_member_position_idx` (`position` ASC),
	CONSTRAINT `FK_member_position`
		FOREIGN KEY (`position`)
		REFERENCES `website-data`.`position` (`id`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
	CONSTRAINT `FK_member_major`
		FOREIGN KEY (`major`)
		REFERENCES `website-data`.`major` (`id`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
	CONSTRAINT `FK_member_year`
		FOREIGN KEY (`year`)
		REFERENCES `website-data`.`year` (`id`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
);

-- -----------------------------------------------------
-- Table `website-data`.`area`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `website-data`.`area` ;

CREATE TABLE IF NOT EXISTS `website-data`.`area` (
	`id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,
	`name` VARCHAR(45) NOT NULL,
	`description` VARCHAR(255) NOT NULL,
	`timestamp` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- -----------------------------------------------------
-- Table `website-data`.`major`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `website-data`.`major` ;

CREATE TABLE IF NOT EXISTS `website-data`.`major` (
	`id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,
	`name` VARCHAR(45) NOT NULL,
	`abbrev` VARCHAR(45) NOT NULL,
	`description` VARCHAR(45) NOT NULL,
	`timestamp` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- -----------------------------------------------------
-- Table `website-data`.`major`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `website-data`.`team` ;

CREATE TABLE IF NOT EXISTS `website-data`.`team` (
	`id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,
	`name` VARCHAR(45) NOT NULL,
	`supervisor` INT UNSIGNED NOT NULL,
	`area` INT UNSIGNED NOT NULL,
	`description` VARCHAR(255) NOT NULL,
	`timestamp` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	CONSTRAINT `FK_team_area`
		FOREIGN KEY (`area`)
		REFERENCES `website-data`.`area` (`id`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
	CONSTRAINT `FK_team_member`
		FOREIGN KEY (`supervisor`)
		REFERENCES `website-data`.`member` (`id`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
);

-- -----------------------------------------------------
-- Table `website-data`.`team_majors`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `website-data`.`team_majors` ;

CREATE TABLE IF NOT EXISTS `website-data`.`team_majors` (
	`id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,
	`team` INT UNSIGNED NOT NULL,
	`major` INT UNSIGNED NOT NULL,
	`timestamp` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	CONSTRAINT `FK_major_team`
		FOREIGN KEY (`team`)
		REFERENCES `website-data`.`team` (`id`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
	CONSTRAINT `FK_major_major`
		FOREIGN KEY (`major`)
		REFERENCES `website-data`.`major` (`id`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
);
