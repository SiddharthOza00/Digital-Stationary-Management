-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema Stationary
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Stationary
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Stationary` ;
USE `Stationary` ;
-- drop table admin;
-- drop table customer;
-- drop table stock;
-- drop table product;
-- drop table employee;
-- drop table purchase;
-- drop table supplier;
-- drop table login;
-- drop table billing;
-- drop table selling;
-- drop table `order`;
-- drop table website;
-- drop table rack;
-- drop table 

-- -----------------------------------------------------
-- Table `Stationary`.`admin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Stationary`.`admin` (
  `admin_ID` VARCHAR(20) NOT NULL,
  `admin_password` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`admin_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Stationary`.`Employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Stationary`.`Employee` (
  `Empl_ID` VARCHAR(20) NOT NULL,
  `Empl_password` VARCHAR(20) NOT NULL,
  `Empl_name` VARCHAR(20) NOT NULL,
  `Empl_Salary` VARCHAR(10) NOT NULL,
  `Date_join` DATE NOT NULL,
  `Empl_Contact` DECIMAL(10) NOT NULL,
  `Empl_Address` VARCHAR(50) NOT NULL,
  `Empl_ID_name_proof` VARCHAR(20) NOT NULL,
  `Empl_ID_proof_No` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`Empl_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Stationary`.`Login`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Stationary`.`Login` (
  `admin_ID` VARCHAR(20) NOT NULL,
  `Empl_ID` VARCHAR(20) NOT NULL,
  `Login_history` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`Login_history`),
  INDEX `admin_ID_idx` (`admin_ID` ASC) VISIBLE,
  -- INDEX `Empl_ID_idx` (`Empl_ID` ASC) VISIBLE,
--   CONSTRAINT `admin_ID`
    FOREIGN KEY (`admin_ID`)
    REFERENCES `Stationary`.`admin` (`admin_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  -- CONSTRAINT `Empl_ID`
    FOREIGN KEY (`Empl_ID`)
    REFERENCES `Stationary`.`Employee` (`Empl_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Stationary`.`Product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Stationary`.`Product` (
  `Prod_ID` VARCHAR(20) NOT NULL,
  `Prod_Type` VARCHAR(20) NOT NULL,
  `Prod_Name` VARCHAR(20) NOT NULL,
  `Prod_Price` INT(10) NOT NULL,
  PRIMARY KEY (`Prod_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Stationary`.`Order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Stationary`.`Order` (
  `Order_ID` VARCHAR(20) NOT NULL,
  `Prod_ID` VARCHAR(20) NOT NULL,
  `Order_Date` DATE NOT NULL,
  `Order_history` VARCHAR(20) NULL,
  PRIMARY KEY (`Order_ID`),
  -- INDEX `Prod_ID_idx` (`Prod_ID` ASC) VISIBLE,
--   CONSTRAINT `Prod_ID`
    FOREIGN KEY (`Prod_ID`)
    REFERENCES `Stationary`.`Product` (`Prod_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Stationary`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Stationary`.`Customer` (
  `Cust_Name` VARCHAR(20) NOT NULL,
  `Cust_Address` VARCHAR(50) NULL,
  `Cust_email` VARCHAR(100) NULL,
  `Order_ID` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`Cust_Name`),
  -- INDEX `Order_ID_idx` (`Order_ID` ASC) VISIBLE,
--   CONSTRAINT `Order_ID`
    FOREIGN KEY (`Order_ID`)
    REFERENCES `Stationary`.`Order` (`Order_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Stationary`.`Stock`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Stationary`.`Stock` (
  `Stock_ID` VARCHAR(20) NOT NULL,
  `Prod_ID` VARCHAR(20) NOT NULL,
  `Avail_Prod` INT(10) NOT NULL,
  PRIMARY KEY (`Stock_ID`),
  -- INDEX `Prod_ID_idx` (`Prod_ID` ASC) VISIBLE,
--   CONSTRAINT `Prod_ID`
    FOREIGN KEY (`Prod_ID`)
    REFERENCES `Stationary`.`Product` (`Prod_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Stationary`.`Selling`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Stationary`.`Selling` (
  `Sell_Date` DATE NOT NULL,
  `Prod_ID` VARCHAR(20) NOT NULL,
  `Sell_history` VARCHAR(10) NULL,
  PRIMARY KEY (`Sell_Date`),
  -- INDEX `Prod_ID_idx` (`Prod_ID` ASC) VISIBLE,
--   CONSTRAINT `Prod_ID`
    FOREIGN KEY (`Prod_ID`)
    REFERENCES `Stationary`.`Product` (`Prod_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Stationary`.`Billing`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Stationary`.`Billing` (
  `Bill_No` VARCHAR(20) NOT NULL,
  `Prod_ID` VARCHAR(20) NOT NULL,
  `Unit` INT(10) NOT NULL,
  `Tax` FLOAT NULL,
  `Tot_Price` FLOAT(10) NOT NULL,
  `Cust_Name` VARCHAR(20) NOT NULL,
  `Date` DATE NOT NULL,
  `Pay_Method` VARCHAR(20) NULL,
  PRIMARY KEY (`Bill_No`),
 --  INDEX `Cust_Name_idx` (`Cust_Name` ASC) VISIBLE,
--   CONSTRAINT `Cust_Name`
    FOREIGN KEY (`Cust_Name`)
    REFERENCES `Stationary`.`Customer` (`Cust_Name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Stationary`.`Rack`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Stationary`.`Rack` (
  `Rack_ID` VARCHAR(20) NOT NULL,
  `Prod_ID` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`Rack_ID`),
 --  INDEX `Prod_ID_idx` (`Prod_ID` ASC) VISIBLE,
--   CONSTRAINT `Prod_ID`
    FOREIGN KEY (`Prod_ID`)
    REFERENCES `Stationary`.`Product` (`Prod_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Stationary`.`Website`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Stationary`.`Website` (
  `Seller_ID` VARCHAR(20) NOT NULL,
  `Seller_password` VARCHAR(20) NOT NULL,
  `web_name` VARCHAR(20) NOT NULL,
  `admin_ID` VARCHAR(20) NOT NULL,
  `Stock_ID` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`Seller_ID`),
  -- INDEX `admin_ID_idx` (`admin_ID` ASC) VISIBLE,
--   INDEX `Stock_ID_idx` (`Stock_ID` ASC) VISIBLE,
--   CONSTRAINT `admin_ID`
    FOREIGN KEY (`admin_ID`)
    REFERENCES `Stationary`.`admin` (`admin_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  -- CONSTRAINT `Stock_ID`
    FOREIGN KEY (`Stock_ID`)
    REFERENCES `Stationary`.`Stock` (`Stock_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Stationary`.`Supplier`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Stationary`.`Supplier` (
  `Supp_Name` VARCHAR(100) NOT NULL,
  `Prod_ID` VARCHAR(20) NOT NULL,
  `Quantity_Prod` INT(10) NOT NULL,
  `Tot_Amount` INT(10) NOT NULL,
  `Date_Supp` DATE NOT NULL,
  PRIMARY KEY (`Supp_Name`),
 --  INDEX `Prod_ID_idx` (`Prod_ID` ASC) VISIBLE,
--   CONSTRAINT `Prod_ID`
    FOREIGN KEY (`Prod_ID`)
    REFERENCES `Stationary`.`Product` (`Prod_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Stationary`.`purchase`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Stationary`.`purchase` (
  `Date_pur` DATE NOT NULL,
  `Supp_Name` VARCHAR(100) NOT NULL,
  `Pur_history` VARCHAR(20) NULL,
  PRIMARY KEY (`Date_pur`),
  -- INDEX `Supp_Name_idx` (`Supp_Name` ASC) VISIBLE,
--   CONSTRAINT `Supp_Name`
    FOREIGN KEY (`Supp_Name`)
    REFERENCES `Stationary`.`Supplier` (`Supp_Name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
