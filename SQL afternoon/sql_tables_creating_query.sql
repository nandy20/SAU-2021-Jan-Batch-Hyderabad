CREATE TABLE `category` (
  `cat_id` varchar(29) NOT NULL,
  `cat_name` tinytext,
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `product` (
  `pro_id` varchar(20) NOT NULL,
  `pro_name` tinytext,
  `unit_price` int(11) DEFAULT NULL,
  `cat_id` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`pro_id`),
  KEY `cat_id` (`cat_id`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`cat_id`) REFERENCES `category` (`cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `customer` (
  `cust_id` varchar(20) NOT NULL,
  `cust_name` tinytext,
  `c_dob` date DEFAULT NULL,
  `gender` tinytext,
  `mob` int(11) DEFAULT NULL,
  `location_code` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`cust_id`),
  KEY `location_code` (`location_code`),
  CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`location_code`) REFERENCES `location` (`location_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `location` (
  `location_code` varchar(20) NOT NULL,
  `loc_name` tinytext,
  PRIMARY KEY (`location_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `sales_exe` (
  `salesexe_id` varchar(20) NOT NULL,
  `saleexe_name` tinytext,
  `gender` tinytext,
  `mobile` int(11) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  PRIMARY KEY (`salesexe_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `order_details` (
  `cust_id` varchar(20) DEFAULT NULL,
  `pro_id` varchar(20) DEFAULT NULL,
  `salesexe_id` varchar(20) DEFAULT NULL,
  `date_of_purchase` date DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  KEY `cust_id` (`cust_id`),
  KEY `pro_id` (`pro_id`),
  KEY `salesexe_id` (`salesexe_id`),
  CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`cust_id`) REFERENCES `customer` (`cust_id`),
  CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`pro_id`) REFERENCES `product` (`pro_id`),
  CONSTRAINT `order_details_ibfk_3` FOREIGN KEY (`salesexe_id`) REFERENCES `sales_exe` (`salesexe_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
