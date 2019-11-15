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
INSERT INTO `user` (`id`, `username`, `email`, `password`, `first_name`, `last_name`, `active`, `admin`, `date_created`, `date_updated`, `avatar_url`) VALUES (1, 'marthaStewart', 'marthaStewart@gmail.com', 'marthaStewart', 'Martha', 'Stewart', 1, 0, NULL, NULL, NULL);
INSERT INTO `user` (`id`, `username`, `email`, `password`, `first_name`, `last_name`, `active`, `admin`, `date_created`, `date_updated`, `avatar_url`) VALUES (2, 'testUser', 'test@test.com', 'testie', 'Testie', 'McTesterson', 1, 0, NULL, NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `ingredient`
-- -----------------------------------------------------
START TRANSACTION;
USE `nom`;
INSERT INTO `ingredient` (`id`, `name`, `brand`, `size`, `category`) VALUES (1, 'Sandwich Bread', NULL, NULL, 'Baked Goods');
INSERT INTO `ingredient` (`id`, `name`, `brand`, `size`, `category`) VALUES (2, 'Peanut Butter', NULL, NULL, 'Canned Goods');
INSERT INTO `ingredient` (`id`, `name`, `brand`, `size`, `category`) VALUES (3, 'Strawberry Jelly', NULL, NULL, 'Canned Goods');
INSERT INTO `ingredient` (`id`, `name`, `brand`, `size`, `category`) VALUES (4, 'Spaghetti Noodles', NULL, NULL, 'Pasta');
INSERT INTO `ingredient` (`id`, `name`, `brand`, `size`, `category`) VALUES (5, 'Spaghetti Sauce', NULL, NULL, 'Canned Goods');
INSERT INTO `ingredient` (`id`, `name`, `brand`, `size`, `category`) VALUES (6, 'Butter', NULL, NULL, 'Dairy');
INSERT INTO `ingredient` (`id`, `name`, `brand`, `size`, `category`) VALUES (7, 'Pizza Crust', 'Boboli', NULL, NULL);
INSERT INTO `ingredient` (`id`, `name`, `brand`, `size`, `category`) VALUES (8, 'Pizza Sauce', NULL, NULL, 'Canned Goods');
INSERT INTO `ingredient` (`id`, `name`, `brand`, `size`, `category`) VALUES (9, 'Mozzerella Cheese', NULL, NULL, 'Dairy');
INSERT INTO `ingredient` (`id`, `name`, `brand`, `size`, `category`) VALUES (10, 'Ramen Noodles', 'Top Ramen', NULL, 'Pasta');

COMMIT;


-- -----------------------------------------------------
-- Data for table `category`
-- -----------------------------------------------------
START TRANSACTION;
USE `nom`;
INSERT INTO `category` (`id`, `name`) VALUES (1, 'Other');
INSERT INTO `category` (`id`, `name`) VALUES (2, 'Asian');
INSERT INTO `category` (`id`, `name`) VALUES (3, 'American');
INSERT INTO `category` (`id`, `name`) VALUES (4, 'Italian');
INSERT INTO `category` (`id`, `name`) VALUES (5, 'Mediterranean');
INSERT INTO `category` (`id`, `name`) VALUES (6, 'Mexican');
INSERT INTO `category` (`id`, `name`) VALUES (7, 'French');
INSERT INTO `category` (`id`, `name`) VALUES (8, 'Indian');

COMMIT;


-- -----------------------------------------------------
-- Data for table `recipe_type`
-- -----------------------------------------------------
START TRANSACTION;
USE `nom`;
INSERT INTO `recipe_type` (`id`, `name`) VALUES (1, 'Breakfast');
INSERT INTO `recipe_type` (`id`, `name`) VALUES (2, 'Lunch');
INSERT INTO `recipe_type` (`id`, `name`) VALUES (3, 'Dinner');
INSERT INTO `recipe_type` (`id`, `name`) VALUES (4, 'Snack');
INSERT INTO `recipe_type` (`id`, `name`) VALUES (5, 'Dessert');
INSERT INTO `recipe_type` (`id`, `name`) VALUES (6, 'Baked');

COMMIT;


-- -----------------------------------------------------
-- Data for table `recipe`
-- -----------------------------------------------------
START TRANSACTION;
USE `nom`;
INSERT INTO `recipe` (`id`, `name`, `date_created`, `active`, `creator_id`, `is_public`, `prep_time`, `instructions`, `photo_link`, `cookbook`, `cookbook_page_number`, `web_link`, `category_id`, `type_id`) VALUES (1, 'Peanut Butter and Jelly Sandwich', '2019-11-14', 1, 1, 1, '5', '1. Spread peanut butter onto one piece of bread. 2. Spread jelly onto a second piece of bread. 3. Combine and enjoy.', 'https://tmbidigitalassetsazure.blob.core.windows.net/secure/RMS/attachments/37/1200x1200/Peanut-Butter-and-Jelly-French-Toast_EXPS_BMZ19_526_B12_04_10b.jpg', 'The Bachelor’s Cookbook', '1', '', 3, 2);
INSERT INTO `recipe` (`id`, `name`, `date_created`, `active`, `creator_id`, `is_public`, `prep_time`, `instructions`, `photo_link`, `cookbook`, `cookbook_page_number`, `web_link`, `category_id`, `type_id`) VALUES (2, 'Spaghetti ', '2019-11-14', 1, 1, 1, '20', '1. Boil noodles for 8 minutes and drain. 2. Pour spaghetti sauce into a pot and warm 3. Combine and eat.', 'https://www.inspiredtaste.net/wp-content/uploads/2019/03/Spaghetti-with-Meat-Sauce-Recipe-3-1200.jpg', 'The Bachelor’s Cookbook', '2', '', 4, 3);
INSERT INTO `recipe` (`id`, `name`, `date_created`, `active`, `creator_id`, `is_public`, `prep_time`, `instructions`, `photo_link`, `cookbook`, `cookbook_page_number`, `web_link`, `category_id`, `type_id`) VALUES (3, 'Buttered Toast', '2019-11-14', 1, 1, 1, '3', '1. Place a slice of bread into the toaster & toast to desired crispness. 2. Remove and spread a layer of butter onto the toast. 3. Eat', 'https://cdn-image.myrecipes.com/sites/default/files/styles/pronto_crop_large/public/assets%252Fmessage-editor%252F1467176631211-diner-toast-knife-inline_0.jpg', 'The Bachelor’s Cookbook', '3', '', 3, 1);
INSERT INTO `recipe` (`id`, `name`, `date_created`, `active`, `creator_id`, `is_public`, `prep_time`, `instructions`, `photo_link`, `cookbook`, `cookbook_page_number`, `web_link`, `category_id`, `type_id`) VALUES (4, 'Pizza', '2019-11-14', 1, 1, 1, '20', '1. Spread pizza sauce onto pizza crust. 2. Add mozzarella cheese. 3. Cook in the oven at 375 for 20 minutes. 4. Remove and cool for 5 minutes. 5. Slice and chow down.', 'https://i.iheart.com/v3/re/new_assets/5d710bf67e5b163a524c72b2', 'The Bachelor’s Cookbook', '4', '', 4, 3);
INSERT INTO `recipe` (`id`, `name`, `date_created`, `active`, `creator_id`, `is_public`, `prep_time`, `instructions`, `photo_link`, `cookbook`, `cookbook_page_number`, `web_link`, `category_id`, `type_id`) VALUES (5, 'Ramen', '2019-11-14', 1, 1, 1, '5', '1. Boil ramen in a pot of water for 3-5 minutes. 2. Add seasoning 3. Allow to cool to desired temperature and enjoy.', 'https://images-na.ssl-images-amazon.com/images/I/915AEp17FaL._SL1500_.jpg', 'The Bachelor’s Cookbook', '5', '', 2, 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `recipe_ingredient`
-- -----------------------------------------------------
START TRANSACTION;
USE `nom`;
INSERT INTO `recipe_ingredient` (`id`, `ingredient_id`, `recipe_id`, `quantity`, `measurement_unit`, `remarks`) VALUES (1, 1, 1, 2, 'Slices', NULL);
INSERT INTO `recipe_ingredient` (`id`, `ingredient_id`, `recipe_id`, `quantity`, `measurement_unit`, `remarks`) VALUES (2, 2, 1, 1, 'Tablespoon', NULL);
INSERT INTO `recipe_ingredient` (`id`, `ingredient_id`, `recipe_id`, `quantity`, `measurement_unit`, `remarks`) VALUES (3, 3, 1, 1, 'Tablespoon', NULL);
INSERT INTO `recipe_ingredient` (`id`, `ingredient_id`, `recipe_id`, `quantity`, `measurement_unit`, `remarks`) VALUES (4, 4, 2, 0.25, 'Pound', NULL);
INSERT INTO `recipe_ingredient` (`id`, `ingredient_id`, `recipe_id`, `quantity`, `measurement_unit`, `remarks`) VALUES (5, 5, 2, 1, 'Jar', NULL);
INSERT INTO `recipe_ingredient` (`id`, `ingredient_id`, `recipe_id`, `quantity`, `measurement_unit`, `remarks`) VALUES (6, 1, 3, 1, 'Slice', NULL);
INSERT INTO `recipe_ingredient` (`id`, `ingredient_id`, `recipe_id`, `quantity`, `measurement_unit`, `remarks`) VALUES (7, 6, 3, 1, 'Teaspoon', NULL);
INSERT INTO `recipe_ingredient` (`id`, `ingredient_id`, `recipe_id`, `quantity`, `measurement_unit`, `remarks`) VALUES (8, 7, 4, 1, NULL, 'Pizza Crust');
INSERT INTO `recipe_ingredient` (`id`, `ingredient_id`, `recipe_id`, `quantity`, `measurement_unit`, `remarks`) VALUES (9, 8, 4, 1, 'Jar', NULL);
INSERT INTO `recipe_ingredient` (`id`, `ingredient_id`, `recipe_id`, `quantity`, `measurement_unit`, `remarks`) VALUES (10, 9, 4, 1, 'Cup', NULL);
INSERT INTO `recipe_ingredient` (`id`, `ingredient_id`, `recipe_id`, `quantity`, `measurement_unit`, `remarks`) VALUES (11, 10, 5, 1, 'Package', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `recipe_review`
-- -----------------------------------------------------
START TRANSACTION;
USE `nom`;
INSERT INTO `recipe_review` (`id`, `user_id`, `recipe_id`, `rating`, `review_date`, `comment`, `active`) VALUES (1, 1, 1, 4, '2019-11-14', 'It was pretty delicious', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `meal_plan`
-- -----------------------------------------------------
START TRANSACTION;
USE `nom`;
INSERT INTO `meal_plan` (`id`, `user_id`, `plan_name`, `description`, `active`) VALUES (1, 1, 'Test Plan', 'Test Description', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `meal_plan_recipe`
-- -----------------------------------------------------
START TRANSACTION;
USE `nom`;
INSERT INTO `meal_plan_recipe` (`id`, `meal_plan_id`, `recipe_id`, `sequence_number`, `day_name`, `type_id`) VALUES (1, 1, 2, 1, 'Sunday', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `grocery_list`
-- -----------------------------------------------------
START TRANSACTION;
USE `nom`;
INSERT INTO `grocery_list` (`id`, `meal_plan_id`, `purchased`) VALUES (1, 1, 0);

COMMIT;

