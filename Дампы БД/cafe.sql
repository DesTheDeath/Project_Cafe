-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema cafescheme
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema cafescheme
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cafescheme` DEFAULT CHARACTER SET utf8mb3 ;
USE `cafescheme` ;

-- -----------------------------------------------------
-- Table `cafescheme`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cafescheme`.`customer` (
  `Customer_Id` INT NOT NULL AUTO_INCREMENT,
  `Customer_Phone` TEXT NULL DEFAULT NULL,
  `Customer_Name` TEXT NULL DEFAULT NULL,
  `Customer_Points` INT NULL DEFAULT NULL,
  PRIMARY KEY (`Customer_Id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `cafescheme`.`menu_item`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cafescheme`.`menu_item` (
  `Item_Id` INT NOT NULL AUTO_INCREMENT,
  `Item_Value` DECIMAL(10,0) NULL DEFAULT NULL,
  `Iitem_Name` TEXT NULL DEFAULT NULL,
  `Item_Type` ENUM('Напиток', 'Закуска') NULL DEFAULT NULL,
  `Item_Price` INT NULL DEFAULT NULL,
  `Item_ImagePath` VARCHAR(90) NULL,
  PRIMARY KEY (`Item_Id`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `cafescheme`.`worker`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cafescheme`.`worker` (
  `Worker_Id` INT NOT NULL AUTO_INCREMENT,
  `Worker_Name` TEXT NULL DEFAULT NULL,
  `Worker_Role` ENUM('Бариста', 'Менеджер') NULL DEFAULT NULL,
  `Worker_Password` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`Worker_Id`))
ENGINE = InnoDB
AUTO_INCREMENT = 16
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `cafescheme`.`order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cafescheme`.`order` (
  `Order_Id` INT NOT NULL AUTO_INCREMENT,
  `Order_Date` DATE NULL,
  `Worrker_Id` INT NULL,
  `Customer_Id` INT NULL,
  PRIMARY KEY (`Order_Id`),
  INDEX `work_id_idx` (`Worrker_Id` ASC) VISIBLE,
  INDEX `cust_Id_idx` (`Customer_Id` ASC) VISIBLE,
  CONSTRAINT `work_id`
    FOREIGN KEY (`Worrker_Id`)
    REFERENCES `cafescheme`.`worker` (`Worker_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `cust_Id`
    FOREIGN KEY (`Customer_Id`)
    REFERENCES `cafescheme`.`customer` (`Customer_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `cafescheme`.`order_list`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cafescheme`.`order_list` (
  `Item_Id` INT NOT NULL,
  `Order_Id` INT NOT NULL,
  `ItemList_Id` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ItemList_Id`),
  INDEX `ItemId_idx` (`Item_Id` ASC) VISIBLE,
  INDEX `OrderId_idx` (`Order_Id` ASC) VISIBLE,
  CONSTRAINT `order`
    FOREIGN KEY (`Order_Id`)
    REFERENCES `cafescheme`.`order` (`Order_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `item`
    FOREIGN KEY (`Item_Id`)
    REFERENCES `cafescheme`.`menu_item` (`Item_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
