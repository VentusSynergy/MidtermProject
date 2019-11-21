-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema nom
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `nom` ;

-- -----------------------------------------------------
-- Schema nom
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `nom` DEFAULT CHARACTER SET utf8 ;
USE `nom` ;

-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(200) NOT NULL,
  `email` VARCHAR(200) NOT NULL,
  `password` VARCHAR(16) NOT NULL,
  `first_name` VARCHAR(100) NOT NULL,
  `last_name` VARCHAR(100) NOT NULL,
  `active` TINYINT NOT NULL DEFAULT 1,
  `admin` TINYINT NOT NULL DEFAULT 0,
  `date_created` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updated` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `avatar_url` VARCHAR(1000) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ingredient`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ingredient` ;

CREATE TABLE IF NOT EXISTS `ingredient` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `brand` VARCHAR(45) NULL DEFAULT NULL,
  `size` VARCHAR(45) NULL DEFAULT NULL,
  `category` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `category` ;

CREATE TABLE IF NOT EXISTS `category` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `recipe_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `recipe_type` ;

CREATE TABLE IF NOT EXISTS `recipe_type` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `recipe`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `recipe` ;

CREATE TABLE IF NOT EXISTS `recipe` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(200) NOT NULL,
  `date_created` DATE NOT NULL,
  `active` TINYINT NOT NULL DEFAULT 1,
  `creator_id` INT NOT NULL DEFAULT 1,
  `is_public` TINYINT NOT NULL DEFAULT 1,
  `prep_time` VARCHAR(45) NULL DEFAULT NULL,
  `instructions` TEXT NULL DEFAULT NULL,
  `photo_link` VARCHAR(5000) NULL DEFAULT NULL,
  `cookbook` VARCHAR(100) NULL DEFAULT NULL,
  `cookbook_page_number` VARCHAR(45) NULL DEFAULT NULL,
  `web_link` VARCHAR(5000) NULL DEFAULT NULL,
  `category_id` INT NULL,
  `type_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `id_idx` (`category_id` ASC),
  INDEX `fk_recipe_creator_idx` (`creator_id` ASC),
  CONSTRAINT `fk_recipe_category`
    FOREIGN KEY (`category_id`)
    REFERENCES `category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_recipe_type`
    FOREIGN KEY (`type_id`)
    REFERENCES `recipe_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_recipe_creator`
    FOREIGN KEY (`creator_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `recipe_ingredient`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `recipe_ingredient` ;

CREATE TABLE IF NOT EXISTS `recipe_ingredient` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `ingredient_id` INT NOT NULL,
  `recipe_id` INT NOT NULL,
  `quantity` DOUBLE NOT NULL,
  `measurement_unit` VARCHAR(100) NULL,
  `remarks` VARCHAR(300) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_recipe_ingredients_recipe1_idx` (`recipe_id` ASC),
  INDEX `fk_recipe_ingredients_ingredient1_idx` (`ingredient_id` ASC),
  CONSTRAINT `fk_recipe_ingredients_recipe1`
    FOREIGN KEY (`recipe_id`)
    REFERENCES `recipe` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_recipe_ingredients_ingredient1`
    FOREIGN KEY (`ingredient_id`)
    REFERENCES `ingredient` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user_recipe`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_recipe` ;

CREATE TABLE IF NOT EXISTS `user_recipe` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `recipe_id` INT NOT NULL,
  `user_favorite` TINYINT NULL DEFAULT 0,
  `comment` TEXT NULL,
  `date_last_made` DATE NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_user_recipe_user1_idx` (`user_id` ASC),
  INDEX `fk_user_recipe_recipe1_idx` (`recipe_id` ASC),
  CONSTRAINT `fk_user_recipe_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_recipe_recipe1`
    FOREIGN KEY (`recipe_id`)
    REFERENCES `recipe` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `recipe_review`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `recipe_review` ;

CREATE TABLE IF NOT EXISTS `recipe_review` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `recipe_id` INT NOT NULL,
  `rating` INT(1) NOT NULL,
  `review_date` DATE NOT NULL,
  `comment` TEXT NULL DEFAULT NULL,
  `active` TINYINT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  INDEX `fk_recipe_review_recipe1_idx` (`recipe_id` ASC),
  INDEX `fk_recipe_review_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_recipe_review_recipe1`
    FOREIGN KEY (`recipe_id`)
    REFERENCES `recipe` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_recipe_review_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `meal_plan`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `meal_plan` ;

CREATE TABLE IF NOT EXISTS `meal_plan` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `plan_name` VARCHAR(100) NULL,
  `description` TEXT NULL,
  `active` TINYINT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_meal_plan_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_meal_plan_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `meal_plan_recipe`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `meal_plan_recipe` ;

CREATE TABLE IF NOT EXISTS `meal_plan_recipe` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `meal_plan_id` INT NOT NULL,
  `recipe_id` INT NOT NULL,
  `sequence_number` INT NOT NULL,
  `day_name` ENUM('Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday') NULL,
  `type_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_week_recipe1_idx` (`recipe_id` ASC),
  INDEX `fk_week_meal_plan1_idx` (`meal_plan_id` ASC),
  INDEX `fk_meal_plan_recipe_type_idx` (`type_id` ASC),
  CONSTRAINT `fk_week_recipe1`
    FOREIGN KEY (`recipe_id`)
    REFERENCES `recipe` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_week_meal_plan1`
    FOREIGN KEY (`meal_plan_id`)
    REFERENCES `meal_plan` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_meal_plan_recipe_type`
    FOREIGN KEY (`type_id`)
    REFERENCES `recipe_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `grocery_list`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `grocery_list` ;

CREATE TABLE IF NOT EXISTS `grocery_list` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `meal_plan_id` INT NOT NULL,
  `purchased` TINYINT NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  INDEX `fk_grocery_list_meal_plan_idx` (`meal_plan_id` ASC),
  CONSTRAINT `fk_grocery_list_meal_plan`
    FOREIGN KEY (`meal_plan_id`)
    REFERENCES `meal_plan` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS marthastewart@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'marthastewart'@'localhost' IDENTIFIED BY 'marthastewart';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'marthastewart'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `nom`;
INSERT INTO `user` (`id`, `username`, `email`, `password`, `first_name`, `last_name`, `active`, `admin`, `date_created`, `date_updated`, `avatar_url`) VALUES (1, 'marthaStewart', 'marthaStewart@gmail.com', 'marthaStewart', 'Martha', 'Stewart', DEFAULT, DEFAULT, NULL, NULL, NULL);

COMMIT;

