CREATE TABLE `users` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `name` VARCHAR(50)
);

CREATE TABLE `shopping_list` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `user_id` INT
);

CREATE TABLE `products` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `shopping_list_id` INT,
  `name` VARCHAR(100)
);

CREATE TABLE `companies` (
  `company_id` INT PRIMARY KEY AUTO_INCREMENT,
  `company_name` VARCHAR(50)
);

CREATE TABLE `stores` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `store_name` VARCHAR(50),
  `company_id` INT,
  `location_id` INT UNIQUE
);

CREATE TABLE `locations` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `municipality` VARCHAR(50),
  `city` VARCHAR(50)
);

CREATE TABLE `products_stores` (
  `products_id` INT,
  `stores_id` INT,
  PRIMARY KEY (`products_id`, `stores_id`)
);

ALTER TABLE `products_stores` ADD FOREIGN KEY (`products_id`) REFERENCES `products` (`id`);

ALTER TABLE `products_stores` ADD FOREIGN KEY (`stores_id`) REFERENCES `stores` (`id`);


ALTER TABLE `shopping_list` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

ALTER TABLE `stores` ADD FOREIGN KEY (`company_id`) REFERENCES `companies` (`company_id`);

ALTER TABLE `locations` ADD FOREIGN KEY (`id`) REFERENCES `stores` (`location_id`);

ALTER TABLE `products` ADD FOREIGN KEY (`shopping_list_id`) REFERENCES `shopping_list` (`id`);

CREATE TABLE `companies_products` (
  `companies_company_id` INT,
  `products_id` INT,
  PRIMARY KEY (`companies_company_id`, `products_id`)
);

ALTER TABLE `companies_products` ADD FOREIGN KEY (`companies_company_id`) REFERENCES `companies` (`company_id`);

ALTER TABLE `companies_products` ADD FOREIGN KEY (`products_id`) REFERENCES `products` (`id`);
