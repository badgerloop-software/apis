CREATE SCHEMA IF NOT EXISTS `team-data` DEFAULT CHARACTER SET utf8;
USE `team-data`;

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `team-data`.`tier`;
DROP TABLE IF EXISTS `team-data`.`position`;
DROP TABLE IF EXISTS `team-data`.`year`;
DROP TABLE IF EXISTS `team-data`.`area`;
DROP TABLE IF EXISTS `team-data`.`major`;
DROP TABLE IF EXISTS `team-data`.`team`;
DROP TABLE IF EXISTS `team-data`.`team_majors`;
DROP TABLE IF EXISTS `team-data`.`member`;
SET FOREIGN_KEY_CHECKS=1;

-- -----------------------------------------------------
-- Table `team-data`.`tier`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `team-data`.`tier` (
	`id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,
	`name` VARCHAR(45) NOT NULL UNIQUE,
	`value` INT NOT NULL,
	`timestamp` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- -----------------------------------------------------
-- Table `team-data`.`position`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `team-data`.`position` (
	`id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,
	`name` VARCHAR(45) NOT NULL UNIQUE,
	`level` INT UNSIGNED NOT NULL,
	`timestamp` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	INDEX `FK_position_tier_idx` (`level` ASC),
	CONSTRAINT `FK_position_tier`
		FOREIGN KEY (`level`)
		REFERENCES `team-data`.`tier` (`id`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
);

-- -----------------------------------------------------
-- Table `team-data`.`year`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `team-data`.`year` (
	`id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,
	`name` VARCHAR(45) NOT NULL,
	`timestamp` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- -----------------------------------------------------
-- Table `team-data`.`area`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `team-data`.`area` (
	`id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,
	`name` VARCHAR(45) NOT NULL,
	`description` VARCHAR(255) NOT NULL,
	`timestamp` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- -----------------------------------------------------
-- Table `team-data`.`major`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `team-data`.`major` (
	`id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,
	`name` VARCHAR(45) NOT NULL,
	`abbrev` VARCHAR(45) NOT NULL,
	`description` VARCHAR(255) NOT NULL,
	`timestamp` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- -----------------------------------------------------
-- Table `team-data`.`team`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `team-data`.`team` (
	`id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,
	`name` VARCHAR(45) NOT NULL,
	`supervisor` INT UNSIGNED NOT NULL,
	`area` INT UNSIGNED NOT NULL,
	`description` VARCHAR(255) NOT NULL,
	`timestamp` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	CONSTRAINT `FK_team_area`
		FOREIGN KEY (`area`)
		REFERENCES `team-data`.`area` (`id`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
	CONSTRAINT `FK_team_member`
		FOREIGN KEY (`supervisor`)
		REFERENCES `team-data`.`position` (`id`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
);

-- -----------------------------------------------------
-- Table `team-data`.`team_majors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `team-data`.`team_majors` (
	`id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,
	`team` INT UNSIGNED NOT NULL,
	`major` INT UNSIGNED NOT NULL,
	`timestamp` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	CONSTRAINT `FK_major_team`
		FOREIGN KEY (`team`)
		REFERENCES `team-data`.`team` (`id`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
	CONSTRAINT `FK_major_major`
		FOREIGN KEY (`major`)
		REFERENCES `team-data`.`major` (`id`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
);

-- -----------------------------------------------------
-- Table `team-data`.`member`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `team-data`.`member` (
	`id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,
	`name` VARCHAR(45) NOT NULL UNIQUE,
	`email` VARCHAR(45) NOT NULL UNIQUE,
	`headshot_url` VARCHAR(45) NOT NULL,
	`major` INT UNSIGNED NOT NULL,
	`year` INT UNSIGNED NOT NULL,
	`position` INT UNSIGNED NULL,
	`timestamp` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	INDEX `FK_member_position_idx` (`position` ASC),
	CONSTRAINT `FK_member_position`
		FOREIGN KEY (`position`)
		REFERENCES `team-data`.`position` (`id`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
	CONSTRAINT `FK_member_major`
		FOREIGN KEY (`major`)
		REFERENCES `team-data`.`major` (`id`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
	CONSTRAINT `FK_member_year`
		FOREIGN KEY (`year`)
		REFERENCES `team-data`.`year` (`id`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
);