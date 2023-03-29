-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema driver monitoring
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema driver monitoring
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `driver monitoring` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `driver monitoring` ;

-- -----------------------------------------------------
-- Table `driver monitoring`.`acceleration`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `driver monitoring`.`acceleration` (
  `Acceleration_id` INT NOT NULL,
  `driver_id` VARCHAR(45) NULL DEFAULT NULL,
  `timestamp` DATETIME NULL DEFAULT NULL,
  `Acceleration_pressure` VARCHAR(45) NULL DEFAULT NULL,
  `braking_braking_id` INT NOT NULL,
  PRIMARY KEY (`Acceleration_id`, `braking_braking_id`),
  INDEX `fk_acceleration_braking1_idx` (`braking_braking_id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `driver monitoring`.`braking`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `driver monitoring`.`braking` (
  `braking_id` INT NOT NULL,
  `driver_idl` VARCHAR(45) NULL DEFAULT NULL,
  `timestamp` DATETIME NULL DEFAULT NULL,
  `brake_pressure` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`braking_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `driver monitoring`.`day`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `driver monitoring`.`day` (
  `time_of_day` VARCHAR(45) NOT NULL,
  `driver_id` VARCHAR(45) NULL DEFAULT NULL,
  `timestamp` VARCHAR(45) NULL DEFAULT NULL,
  `day_of_the week` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`time_of_day`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `driver monitoring`.`drivers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `driver monitoring`.`drivers` (
  `driver_id` INT NOT NULL,
  `first_name` VARCHAR(50) NULL DEFAULT NULL,
  `last_name` VARCHAR(50) NULL DEFAULT NULL,
  `mobileNo` VARCHAR(15) NULL DEFAULT NULL,
  `email` VARCHAR(40) NULL DEFAULT NULL,
  PRIMARY KEY (`driver_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `driver monitoring`.`day_has_drivers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `driver monitoring`.`day_has_drivers` (
  `day_time_of_day` VARCHAR(45) NOT NULL,
  `drivers_driver_id` INT NOT NULL,
  PRIMARY KEY (`day_time_of_day`, `drivers_driver_id`),
  INDEX `fk_day_has_drivers_drivers1_idx` (`drivers_driver_id` ASC) VISIBLE,
  INDEX `fk_day_has_drivers_day1_idx` (`day_time_of_day` ASC) VISIBLE,
  CONSTRAINT `fk_day_has_drivers_day1`
    FOREIGN KEY (`day_time_of_day`)
    REFERENCES `driver monitoring`.`day` (`time_of_day`),
  CONSTRAINT `fk_day_has_drivers_drivers1`
    FOREIGN KEY (`drivers_driver_id`)
    REFERENCES `driver monitoring`.`drivers` (`driver_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `driver monitoring`.`speed`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `driver monitoring`.`speed` (
  `speed_id` INT NOT NULL,
  `driver_id` VARCHAR(45) NULL DEFAULT NULL,
  `timestamp` DATETIME NULL DEFAULT NULL,
  `speed` VARCHAR(60) NULL DEFAULT NULL,
  PRIMARY KEY (`speed_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `driver monitoring`.`drivers_has_speed`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `driver monitoring`.`drivers_has_speed` (
  `drivers_driver_id` INT NOT NULL,
  `speed_speed_id` INT NOT NULL,
  PRIMARY KEY (`drivers_driver_id`, `speed_speed_id`),
  INDEX `fk_drivers_has_speed_speed1_idx` (`speed_speed_id` ASC) VISIBLE,
  INDEX `fk_drivers_has_speed_drivers1_idx` (`drivers_driver_id` ASC) VISIBLE,
  CONSTRAINT `fk_drivers_has_speed_drivers1`
    FOREIGN KEY (`drivers_driver_id`)
    REFERENCES `driver monitoring`.`drivers` (`driver_id`),
  CONSTRAINT `fk_drivers_has_speed_speed1`
    FOREIGN KEY (`speed_speed_id`)
    REFERENCES `driver monitoring`.`speed` (`speed_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `driver monitoring`.`location`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `driver monitoring`.`location` (
  `location_id` INT NOT NULL,
  `driver_id` VARCHAR(45) NULL DEFAULT NULL,
  `Timestamp` DATETIME NULL DEFAULT NULL,
  `latitude` VARCHAR(45) NULL DEFAULT NULL,
  `longitude` VARCHAR(45) NULL DEFAULT NULL,
  `county_id` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`location_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `driver monitoring`.`location_has_day_has_drivers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `driver monitoring`.`location_has_day_has_drivers` (
  `location_location_id` INT NOT NULL,
  `day_has_drivers_day_time_of_day` VARCHAR(45) NOT NULL,
  `day_has_drivers_drivers_driver_id` INT NOT NULL,
  PRIMARY KEY (`location_location_id`, `day_has_drivers_day_time_of_day`, `day_has_drivers_drivers_driver_id`),
  INDEX `fk_location_has_day_has_drivers_day_has_drivers1_idx` (`day_has_drivers_day_time_of_day` ASC, `day_has_drivers_drivers_driver_id` ASC) VISIBLE,
  INDEX `fk_location_has_day_has_drivers_location1_idx` (`location_location_id` ASC) VISIBLE,
  CONSTRAINT `fk_location_has_day_has_drivers_day_has_drivers1`
    FOREIGN KEY (`day_has_drivers_day_time_of_day` , `day_has_drivers_drivers_driver_id`)
    REFERENCES `driver monitoring`.`day_has_drivers` (`day_time_of_day` , `drivers_driver_id`),
  CONSTRAINT `fk_location_has_day_has_drivers_location1`
    FOREIGN KEY (`location_location_id`)
    REFERENCES `driver monitoring`.`location` (`location_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `driver monitoring`.`location_has_drivers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `driver monitoring`.`location_has_drivers` (
  `location_location_id` INT NOT NULL,
  `drivers_driver_id` INT NOT NULL,
  PRIMARY KEY (`location_location_id`, `drivers_driver_id`),
  INDEX `fk_location_has_drivers_drivers1_idx` (`drivers_driver_id` ASC) VISIBLE,
  INDEX `fk_location_has_drivers_location_idx` (`location_location_id` ASC) VISIBLE,
  CONSTRAINT `fk_location_has_drivers_drivers1`
    FOREIGN KEY (`drivers_driver_id`)
    REFERENCES `driver monitoring`.`drivers` (`driver_id`),
  CONSTRAINT `fk_location_has_drivers_location`
    FOREIGN KEY (`location_location_id`)
    REFERENCES `driver monitoring`.`location` (`location_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `driver monitoring`.`speed_has_acceleration`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `driver monitoring`.`speed_has_acceleration` (
  `speed_speed_id` INT NOT NULL,
  `acceleration_Acceleration_id` INT NOT NULL,
  `acceleration_braking_braking_id` INT NOT NULL,
  PRIMARY KEY (`speed_speed_id`, `acceleration_Acceleration_id`, `acceleration_braking_braking_id`),
  INDEX `fk_speed_has_acceleration_acceleration1_idx` (`acceleration_Acceleration_id` ASC, `acceleration_braking_braking_id` ASC) VISIBLE,
  INDEX `fk_speed_has_acceleration_speed1_idx` (`speed_speed_id` ASC) VISIBLE,
  CONSTRAINT `fk_speed_has_acceleration_acceleration1`
    FOREIGN KEY (`acceleration_Acceleration_id` , `acceleration_braking_braking_id`)
    REFERENCES `driver monitoring`.`acceleration` (`Acceleration_id` , `braking_braking_id`),
  CONSTRAINT `fk_speed_has_acceleration_speed1`
    FOREIGN KEY (`speed_speed_id`)
    REFERENCES `driver monitoring`.`speed` (`speed_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `driver monitoring`.`speed_has_acceleration_has_braking`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `driver monitoring`.`speed_has_acceleration_has_braking` (
  `speed_has_acceleration_speed_speed_id` INT NOT NULL,
  `speed_has_acceleration_acceleration_Acceleration_id` INT NOT NULL,
  `speed_has_acceleration_acceleration_braking_braking_id` INT NOT NULL,
  `braking_braking_id` INT NOT NULL,
  PRIMARY KEY (`speed_has_acceleration_speed_speed_id`, `speed_has_acceleration_acceleration_Acceleration_id`, `speed_has_acceleration_acceleration_braking_braking_id`, `braking_braking_id`),
  INDEX `fk_speed_has_acceleration_has_braking_braking1_idx` (`braking_braking_id` ASC) VISIBLE,
  INDEX `fk_speed_has_acceleration_has_braking_speed_has_acceleratio_idx` (`speed_has_acceleration_speed_speed_id` ASC, `speed_has_acceleration_acceleration_Acceleration_id` ASC, `speed_has_acceleration_acceleration_braking_braking_id` ASC) VISIBLE,
  CONSTRAINT `fk_speed_has_acceleration_has_braking_braking1`
    FOREIGN KEY (`braking_braking_id`)
    REFERENCES `driver monitoring`.`braking` (`braking_id`),
  CONSTRAINT `fk_speed_has_acceleration_has_braking_speed_has_acceleration1`
    FOREIGN KEY (`speed_has_acceleration_speed_speed_id` , `speed_has_acceleration_acceleration_Acceleration_id` , `speed_has_acceleration_acceleration_braking_braking_id`)
    REFERENCES `driver monitoring`.`speed_has_acceleration` (`speed_speed_id` , `acceleration_Acceleration_id` , `acceleration_braking_braking_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
