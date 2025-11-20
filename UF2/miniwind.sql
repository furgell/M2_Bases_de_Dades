-- Versió reduïda de Northwind

DROP SCHEMA IF EXISTS `miniwind` ;
CREATE SCHEMA IF NOT EXISTS `miniwind` DEFAULT CHARACTER SET utf8mb4;
USE `miniwind`;

-- -----------------------------------------------------
-- Table `minihwind`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `miniwind`.`customers` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `company` VARCHAR(50) NULL DEFAULT NULL,
  `last_name` VARCHAR(50) NULL DEFAULT NULL,
  `first_name` VARCHAR(50) NULL DEFAULT NULL,
  `email_address` VARCHAR(50) NULL DEFAULT NULL,
  `job_title` VARCHAR(50) NULL DEFAULT NULL,
  `mobile_phone` VARCHAR(25) NULL DEFAULT NULL,
  `address` LONGTEXT NULL DEFAULT NULL,
  `city` VARCHAR(50) NULL DEFAULT NULL,
  `state_province` VARCHAR(50) NULL DEFAULT NULL,
  `zip_postal_code` VARCHAR(15) NULL DEFAULT NULL,
  `country_region` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `city` (`city` ASC),
  INDEX `company` (`company` ASC),
  INDEX `first_name` (`first_name` ASC),
  INDEX `last_name` (`last_name` ASC),
  INDEX `zip_postal_code` (`zip_postal_code` ASC),
  INDEX `state_province` (`state_province` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `miniwind`.`employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `miniwind`.`employees` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `last_name` VARCHAR(50) NULL DEFAULT NULL,
  `first_name` VARCHAR(50) NULL DEFAULT NULL,
  `email_address` VARCHAR(50) NULL DEFAULT NULL,
  `job_title` VARCHAR(50) NULL DEFAULT NULL,
  `mobile_phone` VARCHAR(25) NULL DEFAULT NULL,
  `fax_number` VARCHAR(25) NULL DEFAULT NULL,
  `address` LONGTEXT NULL DEFAULT NULL,
  `city` VARCHAR(50) NULL DEFAULT NULL,
  `state_province` VARCHAR(50) NULL DEFAULT NULL,
  `zip_postal_code` VARCHAR(15) NULL DEFAULT NULL,
  `country_region` VARCHAR(50) NULL DEFAULT NULL,
  `notes` LONGTEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `city` (`city` ASC),
  INDEX `first_name` (`first_name` ASC),
  INDEX `last_name` (`last_name` ASC),
  INDEX `zip_postal_code` (`zip_postal_code` ASC),
  INDEX `state_province` (`state_province` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `miniwind`.`orders_status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `miniwind`.`orders_status` (
  `id` TINYINT(4) NOT NULL,
  `status_name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `miniwind`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `miniwind`.`orders` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `employee_id` INT(11) NULL DEFAULT NULL,
  `customer_id` INT(11) NULL DEFAULT NULL,
  `order_date` DATETIME NULL DEFAULT NULL,
  `shipped_date` DATETIME NULL DEFAULT NULL,
  `ship_name` VARCHAR(50) NULL DEFAULT NULL,
  `ship_address` LONGTEXT NULL DEFAULT NULL,
  `ship_city` VARCHAR(50) NULL DEFAULT NULL,
  `ship_state_province` VARCHAR(50) NULL DEFAULT NULL,
  `ship_zip_postal_code` VARCHAR(50) NULL DEFAULT NULL,
  `ship_country_region` VARCHAR(50) NULL DEFAULT NULL,
  `shipping_fee` DECIMAL(19,4) NULL DEFAULT '0.0000',
  `payment_type` VARCHAR(50) NULL DEFAULT NULL,
  `paid_date` DATETIME NULL DEFAULT NULL,
  `status_id` TINYINT(4) NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  INDEX `customer_id` (`customer_id` ASC),
  INDEX `employee_id` (`employee_id` ASC),
  INDEX `id` (`id` ASC),
  INDEX `ship_zip_postal_code` (`ship_zip_postal_code` ASC),
  CONSTRAINT `fk_orders_customers`
    FOREIGN KEY (`customer_id`)
    REFERENCES `miniwind`.`customers` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orders_employees1`
    FOREIGN KEY (`employee_id`)
    REFERENCES `miniwind`.`employees` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orders_orders_status1`
    FOREIGN KEY (`status_id`)
    REFERENCES `miniwind`.`orders_status` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `miniwind`.`products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `miniwind`.`products` (
  `supplier_ids` LONGTEXT NULL DEFAULT NULL,
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `product_code` VARCHAR(25) NULL DEFAULT NULL,
  `product_name` VARCHAR(50) NULL DEFAULT NULL,
  `standard_cost` DECIMAL(19,4) NULL DEFAULT '0.0000',
  `list_price` DECIMAL(19,4) NOT NULL DEFAULT '0.0000',
  `reorder_level` INT(11) NULL DEFAULT NULL,
  `target_level` INT(11) NULL DEFAULT NULL,
  `quantity_per_unit` VARCHAR(50) NULL DEFAULT NULL,
  `minimum_reorder_quantity` INT(11) NULL DEFAULT NULL,
  `category` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `product_code` (`product_code` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `miniwind`.`suppliers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `miniwind`.`suppliers` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `company` VARCHAR(50) NULL DEFAULT NULL,
  `last_name` VARCHAR(50) NULL DEFAULT NULL,
  `first_name` VARCHAR(50) NULL DEFAULT NULL,
  `email_address` VARCHAR(50) NULL DEFAULT NULL,
  `job_title` VARCHAR(50) NULL DEFAULT NULL,
  `mobile_phone` VARCHAR(25) NULL DEFAULT NULL,
  `address` LONGTEXT NULL DEFAULT NULL,
  `city` VARCHAR(50) NULL DEFAULT NULL,
  `state_province` VARCHAR(50) NULL DEFAULT NULL,
  `zip_postal_code` VARCHAR(15) NULL DEFAULT NULL,
  `country_region` VARCHAR(50) NULL DEFAULT NULL,
  `web_page` LONGTEXT NULL DEFAULT NULL,
  `notes` LONGTEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `city` (`city` ASC),
  INDEX `company` (`company` ASC),
  INDEX `first_name` (`first_name` ASC),
  INDEX `last_name` (`last_name` ASC),
  INDEX `zip_postal_code` (`zip_postal_code` ASC),
  INDEX `state_province` (`state_province` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `miniwind`.`invoices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `miniwind`.`invoices` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `order_id` INT(11) NULL DEFAULT NULL,
  `invoice_date` DATETIME NULL DEFAULT NULL,
  `due_date` DATETIME NULL DEFAULT NULL,
  `tax` DECIMAL(19,4) NULL DEFAULT '0.0000',
  `shipping` DECIMAL(19,4) NULL DEFAULT '0.0000',
  `amount_due` DECIMAL(19,4) NULL DEFAULT '0.0000',
  PRIMARY KEY (`id`),
  INDEX `id` (`id` ASC),
  INDEX `fk_invoices_orders1_idx` (`order_id` ASC),
  CONSTRAINT `fk_invoices_orders1`
    FOREIGN KEY (`order_id`)
    REFERENCES `miniwind`.`orders` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `miniwind`.`order_details_status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `miniwind`.`order_details_status` (
  `id` INT(11) NOT NULL,
  `status_name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `miniwind`.`order_details`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `miniwind`.`order_details` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `order_id` INT(11) NOT NULL,
  `product_id` INT(11) NULL DEFAULT NULL,
  `quantity` DECIMAL(18,4) NOT NULL DEFAULT '0.0000',
  `unit_price` DECIMAL(19,4) NULL DEFAULT '0.0000',
  `discount` DOUBLE NOT NULL DEFAULT '0',
  `status_id` INT(11) NULL DEFAULT NULL,
  `inventory_id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `id` (`id` ASC),
  INDEX `inventory_id` (`inventory_id` ASC),
  INDEX `product_id` (`product_id` ASC),
  INDEX `fk_order_details_orders1_idx` (`order_id` ASC),
  INDEX `fk_order_details_order_details_status1_idx` (`status_id` ASC),
  CONSTRAINT `fk_order_details_orders1`
    FOREIGN KEY (`order_id`)
    REFERENCES `miniwind`.`orders` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_details_products1`
    FOREIGN KEY (`product_id`)
    REFERENCES `miniwind`.`products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_details_order_details_status1`
    FOREIGN KEY (`status_id`)
    REFERENCES `miniwind`.`order_details_status` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

-- Dades

#
# Dumping data for table 'customers'
#

INSERT INTO `customers`(`id`, `company`, `last_name`, `first_name`, `email_address`, `job_title`,
  `mobile_phone`, `address`, `city`, `state_province`, `zip_postal_code`, `country_region`) VALUES
(1, 'Lueilwitz, Homenick and Quigley', 'Gladhill', 'Marga', 'mgladhill0@constantcontact.com', 'Purchasing Representative', '(785) 5471951', '63202 Aberg Hill', 'Duluth', 'MN', '55811', 'USA'),
(2, 'Toy-Rutherford', 'Brett', 'Marco', 'mbrett1@unicef.org', 'Purchasing Representative', '(817) 7965289', '7 Homewood Road', 'Santa Ana', 'CA', '92705', 'USA'),
(3, 'Lueilwitz-Zboncak', 'Bellelli', 'Trixie', 'tbellelli2@biblegateway.com', 'Accounting Assistant', '(571) 4007887', '17 Quincy Plaza', 'New Orleans', 'LA', '70183', 'USA'),
(4, 'Renner, Beier and Denesik', 'Teece', 'Marnie', 'mteece3@studiopress.com', 'Purchasing Representative', '(786) 2516698', '9152 Lake View Trail', 'Springfield', 'MO', '65805', 'USA'),
(5, 'Ryan, Farrell and Tromp', 'Sellers', 'Dredi', 'dsellers4@blogger.com', 'Purchasing Representative', '(559) 4379480', '2024 Pawling Circle', 'Virginia Beach', 'VA', '23471', 'USA'),
(6, 'Ullrich, Schoen and Ankunding', 'Squirrel', 'Emma', 'esquirrel5@youtube.com', 'Purchasing Representative', '(410) 3701720', '86 Ridgeway Crossing', 'Largo', 'FL', '34643', 'USA'),
(7, 'Hudson-Lesch', 'Dyott', 'Joni', 'jdyott6@foxnews.com', 'Owner', '(509) 3210210', '7258 Heffernan Parkway', 'Indianapolis', 'IN', '46247', 'USA'),
(8, 'Emmerich, Mueller and Volkman', 'O''Lynn', 'Lorianne', 'lolynn7@example.com', 'Purchasing Representative', '(585) 8222889', '2 Commercial Road', 'Oklahoma City', 'OK', '73152', 'USA'),
(9, 'Zemlak-Muller', 'Trew', 'Mendel', 'mtrew8@mozilla.com', 'Owner', '(336) 4148918', '442 Lukken Circle', 'Dayton', 'OH', '45403', 'USA'),
(10, 'Gerhold-Carter', 'Talks', 'Tessie', 'ttalks9@cdc.gov', 'Purchasing Representative', '(818) 8653483', '29 Texas Road', 'Jacksonville', 'FL', '32230', 'USA'),
(11, 'Towne, Mante and Kuphal', 'Fuzzens', 'Rhody', 'rfuzzensa@istockphoto.com', 'Purchasing Representative', '(941) 2995824', '7 Steensland Street', 'Myrtle Beach', 'SC', '29579', 'USA'),
(12, 'Larson-Weber', 'Clohisey', 'Concordia', 'cclohiseyb@disqus.com', 'Purchasing Manager', '(937) 8628987', '4686 Harbort Court', 'Fresno', 'CA', '93740', 'USA'),
(13, 'Wiza-Wisozk', 'Bonnaire', 'Orelia', 'obonnairec@go.com', 'Purchasing Manager', '(972) 5298537', '99589 Lerdahl Trail', 'Houston', 'TX', '77045', 'USA'),
(14, 'Mante-Wintheiser', 'Malley', 'Pieter', 'pmalleyd@fda.gov', 'Purchasing Representative', '(915) 5775902', '025 Arapahoe Court', 'Pittsburgh', 'PA', '15279', 'USA'),
(15, 'McDermott-Spinka', 'Streat', 'Ammamaria', 'astreate@seattletimes.com', 'Accounting Assistant', '(314) 2160121', '12 Scott Parkway', 'El Paso', 'TX', '79955', 'USA'),
(16, 'McLaughlin, Weber and Green', 'Ashton', 'Thorndike', 'tashtonf@rambler.ru', 'Owner', '(513) 8346641', '1 Magdeline Lane', 'New York City', 'NY', '10155', 'USA'),
(17, 'Welch Group', 'Ludlem', 'Mace', 'mludlemg@cloudflare.com', 'Accounting Assistant', '(801) 3456443', '979 Pennsylvania Hill', 'Mobile', 'AL', '36628', 'USA'),
(18, 'Treutel LLC', 'Fugere', 'Kasey', 'kfugereh@tinypic.com', 'Purchasing Manager', '(352) 6247543', '5 Melvin Way', 'Corpus Christi', 'TX', '78410', 'USA'),
(19, 'Hoeger-Ernser', 'Kindle', 'Shandeigh', 'skindlei@theatlantic.com', 'Purchasing Representative', '(305) 9024633', '5668 Anhalt Plaza', 'San Diego', 'CA', '92121', 'USA'),
(20, 'Buckridge LLC', 'Willis', 'Gipsy', 'gwillisj@symantec.com', 'Purchasing Manager', '(419) 7453729', '53 Gulseth Street', 'Lexington', 'KY', '40591', 'USA'),
(21, 'Mitchell, Brakus and Bradtke', 'Gonnel', 'Filberto', 'fgonnelk@pinterest.com', 'Owner', '(419) 9832396', '9 Hoard Junction', 'Charlotte', 'NC', '28284', 'USA'),
(22, 'Lockman, Pagac and Doyle', 'Messham', 'Dolley', 'dmesshaml@furl.net', 'Purchasing Manager', '(770) 1848252', '59 Cardinal Court', 'Shawnee Mission', 'KS', '66286', 'USA'),
(23, 'Franecki and Sons', 'Sabin', 'Jude', 'jsabinm@live.com', 'Purchasing Manager', '(860) 5354017', '71 Mayer Place', 'Fresno', 'CA', '93704', 'USA'),
(24, 'Kohler and Sons', 'Barron', 'Hannie', 'hbarronn@clickbank.net', 'Purchasing Manager', '(706) 4281660', '07 Hermina Point', 'Brooklyn', 'NY', '11225', 'USA'),
(25, 'Mayert Inc', 'Murden', 'Alford', 'amurdeno@sina.com.cn', 'Purchasing Representative', '(813) 9777076', '59546 Wayridge Street', 'Sioux Falls', 'SD', '57105', 'USA'),
(26, 'Mertz, Weimann and Durgan', 'Basnett', 'Agata', 'abasnettp@weather.com', 'Accounting Assistant', '(502) 8439841', '1842 Mesta Lane', 'Louisville', 'KY', '40210', 'USA'),
(27, 'Sporer LLC', 'Balkwill', 'Judye', 'jbalkwillq@facebook.com', 'Purchasing Representative', '(918) 6821657', '0 Stephen Crossing', 'Fort Wayne', 'IN', '46852', 'USA'),
(28, 'Feil, Mills and Koss', 'Mussington', 'Sumner', 'smussingtonr@umn.edu', 'Owner', '(404) 2902575', '336 Arapahoe Way', 'Sacramento', 'CA', '94250', 'USA'),
(29, 'Cruickshank Inc', 'Coulthard', 'Belita', 'bcoulthards@wsj.com', 'Accounting Assistant', '(408) 9337973', '49 Mayfield Pass', 'Indianapolis', 'IN', '46295', 'USA');
# 29 records


#
# Dumping data for table 'employees'
#

INSERT INTO `employees` (`id`, `last_name`, `first_name`, `email_address`, `job_title`,
  `mobile_phone`, `address`, `city`, `state_province`, `zip_postal_code`, `country_region`, `notes`) VALUES
(1, 'Jurek', 'Maynord', 'maynord@northwindtraders.com', 'Sales Representative', '(901) 3049980', '026 Ohio Alley', 'Portland', 'OR', '97296', 'USA',  NULL),
(2, 'Guyton', 'Jabez', 'jabez@northwindtraders.com', 'Vice President, Sales', '(608) 4693824', '96050 Helena Terrace', 'Fresno', 'CA', '93740', 'USA',  'Joined the company as a sales representative, was promoted to sales manager and was then named vice president of sales.'),
(3, 'Pointing', 'Hall', 'hall@northwindtraders.com', 'Sales Representative', '(614) 7124463', '0651 Melvin Way', 'El Paso', 'TX', '79911', 'USA',  'Was hired as a sales associate and was promoted to sales representative.'),
(4, 'O Sullivan', 'Delaney', 'delaney@northwindtraders.com', 'Sales Representative', '(330) 5001704', '5787 Schlimgen Circle', 'Camden', 'NJ', '08104', 'USA',  NULL),
(5, 'Coppin', 'Grover', 'grover@northwindtraders.com', 'Sales Manager', '(904) 2943765', '83 Mariners Cove Way', 'Atlanta', 'GA', '30301', 'USA',  'Joined the company as a sales representative and was promoted to sales manager.  Fluent in French.'),
(6, 'Seczyk', 'Cesya', 'cesya@northwindtraders.com', 'Sales Representative', '(253) 8468633', '77 Dakota Plaza', 'Oklahoma City', 'OK', '73142', 'USA',  'Fluent in Japanese and can read and write French, Portuguese, and Spanish.'),
(7, 'Redit', 'Titus', 'titus@northwindtraders.com', 'Sales Representative', '(734) 4105611', '94704 Oak Valley Circle', 'Washington', 'DC', '20425', 'USA',  NULL),
(8, 'Jirusek', 'Thelma', 'thelma@northwindtraders.com', 'Sales Coordinator', '(607) 7982119', '1761 Farwell Circle', 'Lubbock', 'TX', '79491', 'USA',  'Reads and writes French.'),
(9, 'Polet', 'Selia', 'selia@northwindtraders.com', 'Sales Representative', '(202) 7115116', '0241 Sutteridge Crossing', 'Washington', 'DC', '20022', 'USA',  'Fluent in French and German.');
# 9 records

#
# Dumping data for table 'orders_status'
#

INSERT INTO `orders_status` (`id`, `status_name`) VALUES
(0, 'New'),
(1, 'Invoiced'),
(2, 'Shipped'),
(3, 'Closed');
# 4 records

#
# Dumping data for table 'order_details_status'
#

INSERT INTO `order_details_status` (`id`, `status_name`) VALUES
(0, 'None'),
(1, 'Allocated'),
(2, 'Invoiced'),
(3, 'Shipped'),
(4, 'On Order'),
(5, 'No Stock');
# 6 records

#
# Dumping data for table 'orders'
#

INSERT INTO `orders` (`id`, `employee_id`, `customer_id`, `order_date`, `shipped_date`, `ship_name`,
`ship_address`, `ship_city`, `ship_state_province`, `ship_zip_postal_code`, `ship_country_region`, `shipping_fee`,
`payment_type`, `paid_date`, `status_id`) VALUES
(30,9,27,'2006-01-15 00:00:00','2006-01-22 00:00:00','Judye Balkwill','0 Stephen Crossing','Fort Wayne','IN','46852','USA',200.0000,'Check','2006-01-15 00:00:00',3),
(31,3,4,'2006-01-20 00:00:00','2006-01-22 00:00:00','Marnie Teece','9152 Lake View Trail','Springfield','MO','65805','USA',5.0000,'Credit Card','2006-01-20 00:00:00',3),
(32,4,12,'2006-01-22 00:00:00','2006-01-22 00:00:00','Concordia Clohisey','4686 Harbort Court','Fresno','CA','93740','USA',5.0000,'Credit Card','2006-01-22 00:00:00',3),
(33,6,8,'2006-01-30 00:00:00','2006-01-31 00:00:00','Lorianne O\'Lynn','2 Commercial Road','Oklahoma City','OK','73152','USA',50.0000,'Credit Card','2006-01-30 00:00:00',3),
(34,9,4,'2006-02-06 00:00:00','2006-02-07 00:00:00','Marnie Teece','9152 Lake View Trail','Springfield','MO','65805','USA',4.0000,'Check','2006-02-06 00:00:00',3),
(35,3,29,'2006-02-10 00:00:00','2006-02-12 00:00:00','Belita Coulthard','49 Mayfield Pass','Indianapolis','IN','46295','USA',7.0000,'Check','2006-02-10 00:00:00',3),
(36,4,3,'2006-02-23 00:00:00','2006-02-25 00:00:00','Trixie Bellelli','17 Quincy Plaza','New Orleans','LA','70183','USA',7.0000,'Cash','2006-02-23 00:00:00',3),
(37,8,6,'2006-03-06 00:00:00','2006-03-09 00:00:00','Emma Squirrel','86 Ridgeway Crossing','Largo','FL','34643','USA',12.0000,'Credit Card','2006-03-06 00:00:00',3),
(38,9,28,'2006-03-10 00:00:00','2006-03-11 00:00:00','Sumner Mussington','336 Arapahoe Way','Sacramento','CA','94250','USA',10.0000,'Check','2006-03-10 00:00:00',3),
(39,3,8,'2006-03-22 00:00:00','2006-03-24 00:00:00','Lorianne O\'Lynn','2 Commercial Road','Oklahoma City','OK','73152','USA',5.0000,'Check','2006-03-22 00:00:00',3),
(40,4,10,'2006-03-24 00:00:00','2006-03-24 00:00:00','Tessie Talks','29 Texas Road','Jacksonville','FL','32230','USA',9.0000,'Credit Card','2006-03-24 00:00:00',3),
(41,1,7,'2006-03-24 00:00:00',NULL,'Joni Dyott','7258 Heffernan Parkway','Indianapolis','IN','46247','USA',0.0000,NULL,NULL,0),
(42,1,10,'2006-03-24 00:00:00','2006-04-07 00:00:00','Tessie Talks','29 Texas Road','Jacksonville','FL','32230','USA',0.0000,NULL,NULL,2),
(43,1,11,'2006-03-24 00:00:00',NULL,'Rhody Fuzzens','7 Steensland Street','Myrtle Beach','SC','29579','USA',0.0000,NULL,NULL,0),
(44,1,1,'2006-03-24 00:00:00',NULL,'Marga Gladhill','63202 Aberg Hill','Duluth','MN','55811','USA',0.0000,NULL,NULL,0),
(45,1,28,'2006-04-07 00:00:00','2006-04-07 00:00:00','Sumner Mussington','336 Arapahoe Way','Sacramento','CA','94250','USA',40.0000,'Credit Card','2006-04-07 00:00:00',3),
(46,7,9,'2006-04-05 00:00:00','2006-04-05 00:00:00','Mendel Trew','442 Lukken Circle','Dayton','OH','45403','USA',100.0000,'Check','2006-04-05 00:00:00',3),
(47,6,6,'2006-04-08 00:00:00','2006-04-08 00:00:00','Emma Squirrel','86 Ridgeway Crossing','Largo','FL','34643','USA',300.0000,'Credit Card','2006-04-08 00:00:00',3),
(48,4,8,'2006-04-05 00:00:00','2006-04-05 00:00:00','Lorianne O\'Lynn','2 Commercial Road','Oklahoma City','OK','73152','USA',50.0000,'Check','2006-04-05 00:00:00',3),
(50,9,25,'2006-04-05 00:00:00','2006-04-05 00:00:00','Alford Murden','59546 Wayridge Street','Sioux Falls','SD','57105','USA',5.0000,'Cash','2006-04-05 00:00:00',3),
(51,9,26,'2006-04-05 00:00:00','2006-04-05 00:00:00','Agata Basnett','1842 Mesta Lane','Louisville','KY','40210','USA',60.0000,'Credit Card','2006-04-05 00:00:00',3),
(55,1,29,'2006-04-05 00:00:00','2006-04-05 00:00:00','Belita Coulthard','49 Mayfield Pass','Indianapolis','IN','46295','USA',200.0000,'Check','2006-04-05 00:00:00',3),
(56,2,6,'2006-04-03 00:00:00','2006-04-03 00:00:00','Emma Squirrel','86 Ridgeway Crossing','Largo','FL','34643','USA',0.0000,'Check','2006-04-03 00:00:00',3),
(57,9,27,'2006-04-22 00:00:00','2006-04-22 00:00:00','Judye Balkwill','0 Stephen Crossing','Fort Wayne','IN','46852','USA',200.0000,'Check','2006-04-22 00:00:00',0),
(58,3,4,'2006-04-22 00:00:00','2006-04-22 00:00:00','Marnie Teece','9152 Lake View Trail','Springfield','MO','65805','USA',5.0000,'Credit Card','2006-04-22 00:00:00',3),
(59,4,12,'2006-04-22 00:00:00','2006-04-22 00:00:00','Concordia Clohisey','4686 Harbort Court','Fresno','CA','93740','USA',5.0000,'Credit Card','2006-04-22 00:00:00',0),
(60,6,8,'2006-04-30 00:00:00','2006-04-30 00:00:00','Lorianne O\'Lynn','2 Commercial Road','Oklahoma City','OK','73152','USA',50.0000,'Credit Card','2006-04-30 00:00:00',3),
(61,9,4,'2006-04-07 00:00:00','2006-04-07 00:00:00','Marnie Teece','9152 Lake View Trail','Springfield','MO','65805','USA',4.0000,'Check','2006-04-07 00:00:00',0),
(62,3,29,'2006-04-12 00:00:00','2006-04-12 00:00:00','Belita Coulthard','49 Mayfield Pass','Indianapolis','IN','46295','USA',7.0000,'Check','2006-04-12 00:00:00',0),
(63,4,3,'2006-04-25 00:00:00','2006-04-25 00:00:00','Trixie Bellelli','17 Quincy Plaza','New Orleans','LA','70183','USA',7.0000,'Cash','2006-04-25 00:00:00',3),
(64,8,6,'2006-05-09 00:00:00','2006-05-09 00:00:00','Emma Squirrel','86 Ridgeway Crossing','Largo','FL','34643','USA',12.0000,'Credit Card','2006-05-09 00:00:00',0),
(65,9,28,'2006-05-11 00:00:00','2006-05-11 00:00:00','Sumner Mussington','336 Arapahoe Way','Sacramento','CA','94250','USA',10.0000,'Check','2006-05-11 00:00:00',0),
(66,3,8,'2006-05-24 00:00:00','2006-05-24 00:00:00','Lorianne O\'Lynn','2 Commercial Road','Oklahoma City','OK','73152','USA',5.0000,'Check','2006-05-24 00:00:00',0),
(67,4,10,'2006-05-24 00:00:00','2006-05-24 00:00:00','Tessie Talks','29 Texas Road','Jacksonville','FL','32230','USA',9.0000,'Credit Card','2006-05-24 00:00:00',3),
(68,1,7,'2006-05-24 00:00:00',NULL,'Joni Dyott','7258 Heffernan Parkway','Indianapolis','IN','46247','USA',0.0000,NULL,NULL,0),
(69,1,10,'2006-05-24 00:00:00',NULL,'Tessie Talks','29 Texas Road','Jacksonville','FL','32230','USA',0.0000,NULL,NULL,0),
(70,1,11,'2006-05-24 00:00:00',NULL,'Rhody Fuzzens','7 Steensland Street','Myrtle Beach','SC','29579','USA',0.0000,NULL,NULL,0),
(71,1,1,'2006-05-24 00:00:00',NULL,'Marga Gladhill','63202 Aberg Hill','Duluth','MN','55811','USA',0.0000,NULL,NULL,0),
(72,1,28,'2006-06-07 00:00:00','2006-06-07 00:00:00','Sumner Mussington','336 Arapahoe Way','Sacramento','CA','94250','USA',40.0000,'Credit Card','2006-06-07 00:00:00',3),
(73,7,9,'2006-06-05 00:00:00','2006-06-05 00:00:00','Mendel Trew','442 Lukken Circle','Dayton','OH','45403','USA',100.0000,'Check','2006-06-05 00:00:00',3),
(74,6,6,'2006-06-08 00:00:00','2006-06-08 00:00:00','Emma Squirrel','86 Ridgeway Crossing','Largo','FL','34643','USA',300.0000,'Credit Card','2006-06-08 00:00:00',3),
(75,4,8,'2006-06-05 00:00:00','2006-06-05 00:00:00','Lorianne O\'Lynn','2 Commercial Road','Oklahoma City','OK','73152','USA',50.0000,'Check','2006-06-05 00:00:00',3),
(76,9,25,'2006-06-05 00:00:00','2006-06-05 00:00:00','Alford Murden','59546 Wayridge Street','Sioux Falls','SD','57105','USA',5.0000,'Cash','2006-06-05 00:00:00',3),
(77,9,26,'2006-06-05 00:00:00','2006-06-05 00:00:00','Agata Basnett','1842 Mesta Lane','Louisville','KY','40210','USA',60.0000,'Credit Card','2006-06-05 00:00:00',3),
(78,1,29,'2006-06-05 00:00:00','2006-06-05 00:00:00','Belita Coulthard','49 Mayfield Pass','Indianapolis','IN','46295','USA',200.0000,'Check','2006-06-05 00:00:00',3),
(79,2,6,'2006-06-23 00:00:00','2006-06-23 00:00:00','Emma Squirrel','86 Ridgeway Crossing','Largo','FL','34643','USA',0.0000,'Check','2006-06-23 00:00:00',3),
(80,2,4,'2006-04-25 17:03:55',NULL,'Marnie Teece','9152 Lake View Trail','Springfield','MO','65805','USA',0.0000,NULL,NULL,0),
(81,2,3,'2006-04-25 17:26:53',NULL,'Trixie Bellelli','17 Quincy Plaza','New Orleans','LA','70183','USA',0.0000,NULL,NULL,0);
# 48 records


#
# Dumping data for table 'invoices'
#

INSERT INTO `invoices` (`id`, `order_id`, `invoice_date`, `due_date`, `tax`, `shipping`, `amount_due`) VALUES
(5, 31, '2006-03-22 16:08:59', NULL, 0, 0, 0),
(6, 32, '2006-03-22 16:10:27', NULL, 0, 0, 0),
(7, 40, '2006-03-24 10:41:41', NULL, 0, 0, 0),
(8, 39, '2006-03-24 10:55:46', NULL, 0, 0, 0),
(9, 38, '2006-03-24 10:56:57', NULL, 0, 0, 0),
(10, 37, '2006-03-24 10:57:38', NULL, 0, 0, 0),
(11, 36, '2006-03-24 10:58:40', NULL, 0, 0, 0),
(12, 35, '2006-03-24 10:59:41', NULL, 0, 0, 0),
(13, 34, '2006-03-24 11:00:55', NULL, 0, 0, 0),
(14, 33, '2006-03-24 11:02:02', NULL, 0, 0, 0),
(15, 30, '2006-03-24 11:03:00', NULL, 0, 0, 0),
(16, 56, '2006-04-03 13:50:15', NULL, 0, 0, 0),
(17, 55, '2006-04-04 11:05:04', NULL, 0, 0, 0),
(18, 51, '2006-04-04 11:06:13', NULL, 0, 0, 0),
(19, 50, '2006-04-04 11:06:56', NULL, 0, 0, 0),
(20, 48, '2006-04-04 11:07:37', NULL, 0, 0, 0),
(21, 47, '2006-04-04 11:08:14', NULL, 0, 0, 0),
(22, 46, '2006-04-04 11:08:49', NULL, 0, 0, 0),
(23, 45, '2006-04-04 11:09:24', NULL, 0, 0, 0),
(24, 79, '2006-04-04 11:35:54', NULL, 0, 0, 0),
(25, 78, '2006-04-04 11:36:21', NULL, 0, 0, 0),
(26, 77, '2006-04-04 11:36:47', NULL, 0, 0, 0),
(27, 76, '2006-04-04 11:37:09', NULL, 0, 0, 0),
(28, 75, '2006-04-04 11:37:49', NULL, 0, 0, 0),
(29, 74, '2006-04-04 11:38:11', NULL, 0, 0, 0),
(30, 73, '2006-04-04 11:38:32', NULL, 0, 0, 0),
(31, 72, '2006-04-04 11:38:53', NULL, 0, 0, 0),
(32, 71, '2006-04-04 11:39:29', NULL, 0, 0, 0),
(33, 70, '2006-04-04 11:39:53', NULL, 0, 0, 0),
(34, 69, '2006-04-04 11:40:16', NULL, 0, 0, 0),
(35, 67, '2006-04-04 11:40:38', NULL, 0, 0, 0),
(36, 42, '2006-04-04 11:41:14', NULL, 0, 0, 0),
(37, 60, '2006-04-04 11:41:45', NULL, 0, 0, 0),
(38, 63, '2006-04-04 11:42:26', NULL, 0, 0, 0),
(39, 58, '2006-04-04 11:43:08', NULL, 0, 0, 0);
# 35 records


#
# Dumping data for table 'products'
#

INSERT INTO `products` (`supplier_ids`, `id`, `product_code`, `product_name`,
`standard_cost`, `list_price`, `reorder_level`, `target_level`, `quantity_per_unit`,
`minimum_reorder_quantity`, `category`) VALUES
('4', 1, 'NWTB-1', 'Northwind Traders Chai', 13.5, 18, 10, 40, '10 boxes x 20 bags', 10, 'Beverages'),
('10', 3, 'NWTCO-3', 'Northwind Traders Syrup', 7.5, 10, 25, 100, '12 - 550 ml bottles', 25, 'Condiments'),
('10', 4, 'NWTCO-4', 'Northwind Traders Cajun Seasoning', 16.5, 22, 10, 40, '48 - 6 oz jars', 10, 'Condiments'),
('10', 5, 'NWTO-5', 'Northwind Traders Olive Oil', 16.0125, 21.35, 10, 40, '36 boxes', 10, 'Oil'),
('2;6', 6, 'NWTJP-6', 'Northwind Traders Boysenberry Spread', 18.75, 25, 25, 100, '12 - 8 oz jars', 25, 'Jams, Preserves'),
('2', 7, 'NWTDFN-7', 'Northwind Traders Dried Pears', 22.5, 30, 10, 40, '12 - 1 lb pkgs.', 10, 'Dried Fruit & Nuts'),
('8', 8, 'NWTS-8', 'Northwind Traders Curry Sauce', 30, 40, 10, 40, '12 - 12 oz jars', 10, 'Sauces'),
('2;6', 14, 'NWTDFN-14', 'Northwind Traders Walnuts', 17.4375, 23.25, 10, 40, '40 - 100 g pkgs.', 10, 'Dried Fruit & Nuts'),
('6', 17, 'NWTCFV-17', 'Northwind Traders Fruit Cocktail', 29.25, 39, 10, 40, '15.25 OZ', 10, 'Canned Fruit & Vegetables'),
('1', 19, 'NWTBGM-19', 'Northwind Traders Chocolate Biscuits Mix', 6.9, 9.2, 5, 20, '10 boxes x 12 pieces', 5, 'Baked Goods & Mixes'),
('2;6', 20, 'NWTJP-6', 'Northwind Traders Marmalade', 60.75, 81, 10, 40, '30 gift boxes', 10, 'Jams, Preserves'),
('1', 21, 'NWTBGM-21', 'Northwind Traders Scones', 7.5, 10, 5, 20, '24 pkgs. x 4 pieces', 5, 'Baked Goods & Mixes'),
('4', 34, 'NWTB-34', 'Northwind Traders Beer', 10.5, 14, 15, 60, '24 - 12 oz bottles', 15, 'Beverages'),
('7', 40, 'NWTCM-40', 'Northwind Traders Crab Meat', 13.8, 18.4, 30, 120, '24 - 4 oz tins', 30, 'Canned Meat'),
('6', 41, 'NWTSO-41', 'Northwind Traders Clam Chowder', 7.2375, 9.65, 10, 40, '12 - 12 oz cans', 10, 'Soups'),
('3;4', 43, 'NWTB-43', 'Northwind Traders Coffee', 34.5, 46, 25, 100, '16 - 500 g tins', 25, 'Beverages'),
('10', 48, 'NWTCA-48', 'Northwind Traders Chocolate', 9.5625, 12.75, 25, 100, '10 pkgs', 25, 'Candy'),
('2', 51, 'NWTDFN-51', 'Northwind Traders Dried Apples', 39.75, 53, 10, 40, '50 - 300 g pkgs.', 10, 'Dried Fruit & Nuts'),
('1', 52, 'NWTG-52', 'Northwind Traders Long Grain Rice', 5.25, 7, 25, 100, '16 - 2 kg boxes', 25, 'Grains'),
('1', 56, 'NWTP-56', 'Northwind Traders Gnocchi', 28.5, 38, 30, 120, '24 - 250 g pkgs.', 30, 'Pasta'),
('1', 57, 'NWTP-57', 'Northwind Traders Ravioli', 14.625, 19.5, 20, 80, '24 - 250 g pkgs.', 20, 'Pasta'),
('8', 65, 'NWTS-65', 'Northwind Traders Hot Pepper Sauce', 15.7875, 21.05, 10, 40, '32 - 8 oz bottles', 10, 'Sauces'),
('8', 66, 'NWTS-66', 'Northwind Traders Tomato Sauce', 12.75, 17, 20, 80, '24 - 8 oz jars', 20, 'Sauces'),
('5', 72, 'NWTD-72', 'Northwind Traders Mozzarella', 26.1, 34.8, 10, 40, '24 - 200 g pkgs.', 10, 'Dairy products'),
('2;6', 74, 'NWTDFN-74', 'Northwind Traders Almonds', 7.5, 10, 5, 20, '5 kg pkg.', 5, 'Dried Fruit & Nuts'),
('10', 77, 'NWTCO-77', 'Northwind Traders Mustard', 9.75, 13, 15, 60, '12 boxes', 15, 'Condiments'),
('2', 80, 'NWTDFN-80', 'Northwind Traders Dried Plums', 3, 3.5, 50, 75, '1 lb bag', 25, 'Dried Fruit & Nuts'),
('3', 81, 'NWTB-81', 'Northwind Traders Green Tea', 2, 2.99, 100, 125, '20 bags per box', 25, 'Beverages'),
('1', 82, 'NWTC-82', 'Northwind Traders Granola', 2, 4, 20, 100, NULL, NULL, 'Cereal'),
('9', 83, 'NWTCS-83', 'Northwind Traders Potato Chips', .5, 1.8, 30, 200, NULL, NULL, 'Chips, Snacks'),
('1', 85, 'NWTBGM-85', 'Northwind Traders Brownie Mix', 9, 12.49, 10, 20, '3 boxes', 5, 'Baked Goods & Mixes'),
('1', 86, 'NWTBGM-86', 'Northwind Traders Cake Mix', 10.5, 15.99, 10, 20, '4 boxes', 5, 'Baked Goods & Mixes'),
('7', 87, 'NWTB-87', 'Northwind Traders Tea', 2, 4, 20, 50, '100 count per box', NULL, 'Beverages'),
('6', 88, 'NWTCFV-88', 'Northwind Traders Pears', 1, 1.3, 10, 40, '15.25 OZ', NULL, 'Canned Fruit & Vegetables'),
('6', 89, 'NWTCFV-89', 'Northwind Traders Peaches', 1, 1.5, 10, 40, '15.25 OZ', NULL, 'Canned Fruit & Vegetables'),
('6', 90, 'NWTCFV-90', 'Northwind Traders Pineapple', 1, 1.8, 10, 40, '15.25 OZ', NULL, 'Canned Fruit & Vegetables'),
('6', 91, 'NWTCFV-91', 'Northwind Traders Cherry Pie Filling', 1, 2, 10, 40, '15.25 OZ', NULL, 'Canned Fruit & Vegetables'),
('6', 92, 'NWTCFV-92', 'Northwind Traders Green Beans', 1, 1.2, 10, 40, '14.5 OZ', NULL, 'Canned Fruit & Vegetables'),
('6', 93, 'NWTCFV-93', 'Northwind Traders Corn', 1, 1.2, 10, 40, '14.5 OZ', NULL, 'Canned Fruit & Vegetables'),
('6', 94, 'NWTCFV-94', 'Northwind Traders Peas', 1, 1.5, 10, 40, '14.5 OZ', NULL, 'Canned Fruit & Vegetables'),
('7', 95, 'NWTCM-95', 'Northwind Traders Tuna Fish', .5, 2, 30, 50, '5 oz', NULL, 'Canned Meat'),
('7', 96, 'NWTCM-96', 'Northwind Traders Smoked Salmon', 2, 4, 30, 50, '5 oz', NULL, 'Canned Meat'),
('1', 97, 'NWTC-82', 'Northwind Traders Hot Cereal', 3, 5, 50, 200, NULL, NULL, 'Cereal'),
('6', 98, 'NWTSO-98', 'Northwind Traders Vegetable Soup', 1, 1.89, 100, 200, NULL, NULL, 'Soups'),
('6', 99, 'NWTSO-99', 'Northwind Traders Chicken Soup', 1, 1.95, 100, 200, NULL, NULL, 'Soups');
# 45 records


#
# Dumping data for table 'order_details'
#

INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `quantity`, `unit_price`, `discount`,
  `status_id`, `inventory_id`) VALUES
(27, 30, 34, 100, 14, 0, 2, 83),
(28, 30, 80, 30, 3.5, 0, 2, 63),
(29, 31, 7, 10, 30, 0, 2, 64),
(30, 31, 51, 10, 53, 0, 2, 65),
(31, 31, 80, 10, 3.5, 0, 2, 66),
(32, 32, 1, 15, 18, 0, 2, 67),
(33, 32, 43, 20, 46, 0, 2, 68),
(34, 33, 19, 30, 9.2, 0, 2, 81),
(35, 34, 19, 20, 9.2, 0, 2, 69),
(36, 35, 48, 10, 12.75, 0, 2, 70),
(37, 36, 41, 200, 9.65, 0, 2, 79),
(38, 37, 8, 17, 40, 0, 2, 71),
(39, 38, 43, 300, 46, 0, 2, 77),
(40, 39, 48, 100, 12.75, 0, 2, 75),
(41, 40, 81, 200, 2.99, 0, 2, 73),
(42, 41, 43, 300, 46, 0, 1, 104),
(43, 42, 6, 10, 25, 0, 2, 84),
(44, 42, 4, 10, 22, 0, 2, 85),
(45, 42, 19, 10, 9.2, 0, 2, 110),
(46, 43, 80, 20, 3.5, 0, 1, 86),
(47, 43, 81, 50, 2.99, 0, 1, 87),
(48, 44, 1, 25, 18, 0, 1, 88),
(49, 44, 43, 25, 46, 0, 1, 89),
(50, 44, 81, 25, 2.99, 0, 1, 90),
(51, 45, 41, 50, 9.65, 0, 2, 116),
(52, 45, 40, 50, 18.4, 0, 2, 91),
(53, 46, 57, 100, 19.5, 0, 2, 101),
(54, 46, 72, 50, 34.8, 0, 2, 114),
(55, 47, 34, 300, 14, 0, 2, 108),
(56, 48, 8, 25, 40, 0, 2, 106),
(57, 48, 19, 25, 9.2, 0, 2, 112),
(59, 50, 21, 20, 10, 0, 2, 92),
(60, 51, 5, 25, 21.35, 0, 2, 93),
(61, 51, 41, 30, 9.65, 0, 2, 94),
(62, 51, 40, 30, 18.4, 0, 2, 95),
(66, 56, 48, 10, 12.75, 0, 2, 99),
(67, 55, 34, 87, 14, 0, 2, 117),
(68, 79, 7, 30, 30, 0, 2, 119),
(69, 79, 51, 30, 53, 0, 2, 118),
(70, 78, 17, 40, 39, 0, 2, 120),
(71, 77, 6, 90, 25, 0, 2, 121),
(72, 76, 4, 30, 22, 0, 2, 122),
(73, 75, 48, 40, 12.75, 0, 2, 123),
(74, 74, 48, 40, 12.75, 0, 2, 124),
(75, 73, 41, 10, 9.65, 0, 2, 125),
(76, 72, 43, 5, 46, 0, 2, 126),
(77, 71, 40, 40, 18.4, 0, 2, 127),
(78, 70, 8, 20, 40, 0, 2, 128),
(79, 69, 80, 15, 3.5, 0, 2, 129),
(80, 67, 74, 20, 10, 0, 2, 130),
(81, 60, 72, 40, 34.8, 0, 2, 131),
(82, 63, 3, 50, 10, 0, 2, 132),
(83, 63, 8, 3, 40, 0, 2, 133),
(84, 58, 20, 40, 81, 0, 2, 134),
(85, 58, 52, 40, 7, 0, 2, 135),
(86, 80, 56, 10, 38, 0, 1, 136),
(90, 81, 81, 0, 2.99, 0, 5, NULL),
(91, 81, 56, 0, 38, 0, 0, NULL);
# 58 records


#
# Dumping data for table 'suppliers'
#

INSERT INTO `suppliers` (`id`, `company`, `last_name`, `first_name`, `email_address`, `job_title`,
`mobile_phone`, `address`, `city`, `state_province`, `zip_postal_code`, `country_region`, `web_page`, `notes`) VALUES
(1, 'Supplier A', 'Andersen', 'Elizabeth A.', NULL, 'Sales Manager', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'Supplier B', 'Weiler', 'Cornelia', NULL, 'Sales Manager', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'Supplier C', 'Kelley', 'Madeleine', NULL, 'Sales Representative', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'Supplier D', 'Sato', 'Naoki', NULL, 'Marketing Manager', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 'Supplier E', 'Hernandez-Echevarria', 'Amaya', NULL, 'Sales Manager', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 'Supplier F', 'Hayakawa', 'Satomi', NULL, 'Marketing Assistant', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 'Supplier G', 'Glasson', 'Stuart', NULL, 'Marketing Manager', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 'Supplier H', 'Dunton', 'Bryn Paul', NULL, 'Sales Representative', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, 'Supplier I', 'Sandberg', 'Mikael', NULL, 'Sales Manager', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 'Supplier J', 'Sousa', 'Luis', NULL, 'Sales Manager', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
# 10 records
