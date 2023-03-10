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

CREATE TABLE `locations` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `municipality` VARCHAR(50),
  `city` VARCHAR(50),
  `address` VARCHAR(150)
);

CREATE TABLE `companies_products` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `companies_id` INT,
  `products_id` INT,
  `product_price` DECIMAL(5,2),
  `availability` BOOLEAN,
  `user_id` INT
);


ALTER TABLE `companies` ADD FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`);

ALTER TABLE `companies_products` ADD FOREIGN KEY (`companies_id`) REFERENCES `companies` (`id`);

ALTER TABLE `companies_products` ADD FOREIGN KEY (`products_id`) REFERENCES `products` (`id`);

ALTER TABLE `companies_products` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);


  INSERT INTO users (name) 
  VALUES 
  ('Tino'), 
  ('Javi'), 
  ('Airam');


  INSERT INTO products (name)
  VALUES 
  ('Red apple'), 
  ('Tomato'),
  ('Milk'),
  ('Lanjaron Water');




  INSERT INTO locations (municipality, city, address)
  VALUES
  ('Las Palmas de Gran Canaria', 'Las Palmas GC', 'Calle tenerife, 1'),
  ('Las Palmas de Gran Canaria', 'Las Palmas GC', 'El Sebadal, 42'),
  ('Las Palmas de Gran Canaria', 'Las Palmas GC', 'Hoya La Playa'),
  ('Las Palmas de Gran Canaria', 'Las Palmas GC', 'Calle Triana, 1'),
  ('Telde', 'Telde', 'Polígono industrial Jinamar');
  

  INSERT INTO companies (company_name, location_id)
  VALUES
  ('Hiperdino Las Canteras', 1),
  ('Mercadona', 2),
  ('Carrefour', 3),
  ('Hiperdino Triana', 4),
  ('Lidl', 5);
  
  INSERT INTO companies_products (products_id, companies_id, product_price, availability,user_id) 
  VALUES
  (3,1, 2.99, true, 1),
  (3,2, 2.15, true,2),
  (2,4, 3.15, true,3),
  (2,5, 2.00, false,1),
  (1,1, 0.99, true,2),
  (1,2, 1.15, false,1 ),
  (1,3, 1.80, true,3);
  

  
  