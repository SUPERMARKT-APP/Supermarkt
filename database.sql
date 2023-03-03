CREATE TABLE `users` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `name` VARCHAR(50)
);

CREATE TABLE `products` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `name` VARCHAR(100)
);

CREATE TABLE `companies` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `company_name` VARCHAR(50),
  `location_id` INT UNIQUE
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
  `city` VARCHAR(50),
  `address` VARCHAR(150)
);

CREATE TABLE `users_products` (
  `users_id` INT,
  `products_id` INT,
  PRIMARY KEY (`users_id`, `products_id`)
);

CREATE TABLE `products_stores` (
  `products_id` INT,
  `stores_id` INT,
  PRIMARY KEY (`products_id`, `stores_id`),
  `product_price` DECIMAL(5,2)
);

ALTER TABLE `users_products` ADD FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

ALTER TABLE `stores` ADD FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`);

ALTER TABLE `stores` ADD FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`);

ALTER TABLE `products_stores` ADD FOREIGN KEY (`products_id`) REFERENCES `products` (`id`);

ALTER TABLE `products_stores` ADD FOREIGN KEY (`stores_id`) REFERENCES `stores` (`id`);

ALTER TABLE `users_products` ADD FOREIGN KEY (`products_id`) REFERENCES `products` (`id`);

INSERT INTO users (name)
VALUES ('Airam');

INSERT INTO products (name)
VALUES('Leche ENTERA'),
('Piña en lata'),
('Agua lanjarón'),
('Manzana roja');

INSERT INTO locations (municipality,city,address)
VALUES
('Las Palmas de Gran Canaria', 'Las Palmas GC', 'Calle Tenerife 1, Las Canteras'),
('Las Palmas de Gran Canaria', 'Las Palmas GC', 'CC Las Arenas');

INSERT INTO companies (company_name, location_id)
VALUES
('Hiperdino', 1),
('Carrefour', 2);

INSERT INTO stores (store_name, company_id, location_id)
VALUES
('Hiperdino Las Canteras', 1, 1),
('Carrefour Las Arenas', 2, 2);

INSERT INTO products_stores (products_id, stores_id, product_price)
VALUES
(1,1, 1.5),
(2,1, 1.95),
(3,1, 0.90),
(4,1, 0.55),
(1,2, 2.00),
(2,2, 2.50),
(3,2, 0.75),
(4,2, 0.49);