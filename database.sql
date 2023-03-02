CREATE TABLE `users` (
  `id` INT PRIMARY KEY AUTO_INCREMENT
);

CREATE TABLE `shopping_list` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `user_id` INT
);

CREATE TABLE `products` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `name` VARCHAR(100),
  `price` DECIMAL(5,2)
);

CREATE TABLE `companies` (
  `company_id` INT PRIMARY KEY AUTO_INCREMENT
);

CREATE TABLE `stores` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `company_id` INT,
  `location_id` INT UNIQUE
);

CREATE TABLE `locations` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `municipality` VARCHAR(50),
  `city` VARCHAR(50)
);

CREATE TABLE `inventory` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `product_id` INT,
  `availability` BOOLEAN
);

ALTER TABLE `products` ADD FOREIGN KEY (`id`) REFERENCES `shopping_list` (`id`);

CREATE TABLE `products_stores` (
  `products_id` INT,
  `stores_id` INT,
  PRIMARY KEY (`products_id`, `stores_id`)
);

ALTER TABLE `products_stores` ADD FOREIGN KEY (`products_id`) REFERENCES `products` (`id`);

ALTER TABLE `products_stores` ADD FOREIGN KEY (`stores_id`) REFERENCES `stores` (`id`);

ALTER TABLE `stores` ADD FOREIGN KEY (`id`) REFERENCES `inventory` (`id`);

ALTER TABLE `shopping_list` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

ALTER TABLE `stores` ADD FOREIGN KEY (`company_id`) REFERENCES `companies` (`company_id`);

ALTER TABLE `locations` ADD FOREIGN KEY (`id`) REFERENCES `stores` (`location_id`);

