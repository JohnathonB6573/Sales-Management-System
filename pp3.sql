-- Johnathon Brumfield Project Phase 3 

USE pp3;
	
CREATE TABLE user (Ssn INT PRIMARY KEY, FName VARCHAR(20), MInit CHAR, LName VARCHAR(20),
Sex CHAR, Email VARCHAR(30), Address VARCHAR(25), Birthday DATE);
CREATE TABLE `pp3`.`roles` (
  `roles_id` INT NOT NULL,
  `role_name` VARCHAR(15) NULL,
  FOREIGN KEY (`roles_id`) REFERENCES user(Ssn));
  CREATE TABLE `pp3`.`permissions` (
  `permission_id` INT NOT NULL,
  `permission_name` VARCHAR(15) NULL,
  FOREIGN KEY (`permission_id`) REFERENCES user(Ssn));
  CREATE TABLE `pp3`.`sales` (
  `sale_id` INT NULL,
  `sale_description` VARCHAR(50) NULL,
  `card_no` VARCHAR(16) NOT NULL,
  `product_id` VARCHAR(45) NULL,
  `sale_employee` INT NOT NULL,
  FOREIGN KEY (`sale_employee`) REFERENCES user(Ssn),
  FOREIGN KEY (`card_no`) REFERENCES payment(card_no),
FOREIGN KEY (`product_id`) REFERENCES product(product_id),
  PRIMARY KEY (`sale_id`));
CREATE TABLE `pp3`.`product` (
  `product_id` INT NOT NULL,
  `product_description` VARCHAR(45) NULL,
  `product_name` VARCHAR(20) NULL,
  `product_item` INT NULL,
  PRIMARY KEY (`product_id`));
CREATE TABLE `pp3`.`payment` (
  `card_no` INT NOT NULL,
  `pay_description` VARCHAR(45) NULL,
  `pay_date` DATE NULL,
  `stock_id` INT NULL,
   FOREIGN KEY (`stock_id`) REFERENCES stock(stock_id),
  PRIMARY KEY (`card_no`));
CREATE TABLE `pp3`.`stock` (
  `stock_id` INT NOT NULL,
  `stock_type` VARCHAR(45) NULL,
  `stock_description` VARCHAR(45) NULL,
  `num_in_stock` INT NULL,
  PRIMARY KEY (`stock_id`));
CREATE TABLE `pp3`.`login` (
	 `login_id` INT NOT NULL,
  `login_un` VARCHAR(45) NULL,
  `login_pw` VARCHAR(45) NULL,
  FOREIGN KEY (`login_id`) REFERENCES user(Ssn));
  
  -- populating tables
  
INSERT INTO `pp3`.`user` (`Ssn`, `FName`, `MInit`, `LName`, `Sex`, `Email`, `Address`, `Birthday`) VALUES ('1111111111', 'Johnathon', 'L', 'Brumfield', 'M', 'johnb@gmail.com', '382 Brookside Ln', '08-30-2003');
INSERT INTO `pp3`.`user` (`Ssn`, `FName`, `MInit`, `LName`, `Sex`, `Email`, `Address`, `Birthday`) VALUES ('1111111112', 'Javia', 'Y', 'Brumfield', 'F', 'javiayb@gmail.com', '453 Redbull Rd', '04-10-2005');
INSERT INTO `pp3`.`user` (`Ssn`, `FName`, `LName`, `Sex`, `Email`, `Address`, `Birthday`) VALUES ('1111111113', 'Isaiah', 'Brumfield ', 'M', 'issie@yahoo.com', '863 Naruto Rd', '12-10-2008');
INSERT INTO `pp3`.`user` (`Ssn`, `FName`, `MInit`, `LName`, `Sex`, `Email`, `Address`, `Birthday`) VALUES ('1111111114', 'Manuela', 'G', 'Barsta', 'F', 'manuela@msn.com', '924 Water ', '03-26-2014');
INSERT INTO `pp3`.`user` (`Ssn`, `FName`, `MInit`, `LName`, `Sex`, `Email`, `Address`, `Birthday`) VALUES ('1111111115', 'Grace', 'J', 'Sanders', 'F', 'grace@yahoo.com', '252 Cyclops Ln', '03- 14-2006');
INSERT INTO `pp3`.`user` (`Ssn`, `FName`, `MInit`, `LName`, `Sex`, `Email`, `Address`, `Birthday`) VALUES ('1111111116', 'Eric', 'C', 'Chin', 'M', 'ericgoesshopping@msn.com', '876 Chapstick Rd', '05-23-2004');

INSERT INTO `pp3`.`login` (`login_id`, `login_un`, `login_pw`) VALUES ('1111111111', 'abc', 'a11');
INSERT INTO `pp3`.`login` (`login_id`, `login_un`, `login_pw`) VALUES ('1111111112', 'def', 'b22');
INSERT INTO `pp3`.`login` (`login_id`, `login_un`, `login_pw`) VALUES ('1111111113', 'ghi', 'c33');
INSERT INTO `pp3`.`login` (`login_id`, `login_un`, `login_pw`) VALUES ('1111111114', 'jkl', 'd44');
INSERT INTO `pp3`.`login` (`login_id`, `login_un`, `login_pw`) VALUES ('1111111115', 'mno', 'e55');
INSERT INTO `pp3`.`login` (`login_id`, `login_un`, `login_pw`) VALUES ('1111111116', 'pqr', 'f66');

INSERT INTO `pp3`.`roles` (`roles_id`, `role_name`) VALUES ('1111111111', 'Manager');
INSERT INTO `pp3`.`roles` (`roles_id`, `role_name`) VALUES ('1111111112', 'Cashier');
INSERT INTO `pp3`.`roles` (`roles_id`, `role_name`) VALUES ('1111111113', 'Stocker');
INSERT INTO `pp3`.`roles` (`roles_id`, `role_name`) VALUES ('1111111114', 'Janitor');
INSERT INTO `pp3`.`roles` (`roles_id`, `role_name`) VALUES ('1111111115', 'Cashier');
INSERT INTO `pp3`.`roles` (`roles_id`, `role_name`) VALUES ('1111111116', 'Stocker');

INSERT INTO `pp3`.`permissions` (`permission_id`, `permission_name`) VALUES ('1111111111', 'All');
INSERT INTO `pp3`.`permissions` (`permission_id`, `permission_name`) VALUES ('1111111112', 'Basic');
INSERT INTO `pp3`.`permissions` (`permission_id`, `permission_name`) VALUES ('1111111113', 'Basic');
INSERT INTO `pp3`.`permissions` (`permission_id`, `permission_name`) VALUES ('1111111114', 'Basic');
INSERT INTO `pp3`.`permissions` (`permission_id`, `permission_name`) VALUES ('1111111115', 'Basic');
INSERT INTO `pp3`.`permissions` (`permission_id`, `permission_name`) VALUES ('1111111116', 'Basic');

INSERT INTO `pp3`.`stock` (`stock_id`, `stock_type`, `stock_description`, `num_in_stock`) VALUES ('1', 'Clothing', 'Red Shirt', '32');
INSERT INTO `pp3`.`stock` (`stock_id`, `stock_type`, `stock_description`, `num_in_stock`) VALUES ('2', 'Clothing', 'Brown Pants', '12');
INSERT INTO `pp3`.`stock` (`stock_id`, `stock_type`, `stock_description`, `num_in_stock`) VALUES ('3', 'Clothing', 'Blue Hat', '31');
INSERT INTO `pp3`.`stock` (`stock_id`, `stock_type`, `stock_description`, `num_in_stock`) VALUES ('4', 'Food', 'Burgers', '15');
INSERT INTO `pp3`.`stock` (`stock_id`, `stock_type`, `stock_description`, `num_in_stock`) VALUES ('5', 'Food', 'Chicken Nuggets', '24');
INSERT INTO `pp3`.`stock` (`stock_id`, `stock_type`, `stock_description`, `num_in_stock`) VALUES ('6', 'Tool', 'Screwdriver', '9');

INSERT INTO `pp3`.`product` (`product_id`, `product_description`, `product_name`, `product_item`) VALUES ('1', 'Red Shirt', 'Nike', '1');
INSERT INTO `pp3`.`product` (`product_id`, `product_description`, `product_name`, `product_item`) VALUES ('2', 'Brown Pants', 'Coach', '2');
INSERT INTO `pp3`.`product` (`product_id`, `product_description`, `product_name`, `product_item`) VALUES ('3', 'Blue Hat', 'Nike', '3');
INSERT INTO `pp3`.`product` (`product_id`, `product_description`, `product_name`, `product_item`) VALUES ('4', 'Burgers', 'McDonalds', '4');
INSERT INTO `pp3`.`product` (`product_id`, `product_description`, `product_name`, `product_item`) VALUES ('5', 'Chicken Nuggets', 'Burger King', '5');
INSERT INTO `pp3`.`product` (`product_id`, `product_description`, `product_name`, `product_item`) VALUES ('6', 'Screwdriver', 'Millawakee', '6');

SELECT * FROM user;

