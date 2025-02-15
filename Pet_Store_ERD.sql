CREATE TABLE `users` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255),
  `email` varchar(255) UNIQUE,
  `password` varchar(255),
  `address` text,
  `created_at` timestamp
);

CREATE TABLE `categories` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255),
  `description` text
);

CREATE TABLE `products` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255),
  `category_id` int,
  `price` decimal,
  `description` text,
  `stock` int,
  `created_at` timestamp
);

CREATE TABLE `reviews` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `user_id` int,
  `product_id` int,
  `rating` int,
  `comment` text,
  `created_at` timestamp
);

CREATE TABLE `related_products` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `product_id` int,
  `related_product_id` int
);

CREATE TABLE `carts` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `user_id` int UNIQUE,
  `address` text,
  `created_at` timestamp
);

CREATE TABLE `cart_items` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `cart_id` int,
  `product_id` int,
  `quantity` int,
  `added_at` timestamp
);

ALTER TABLE `products` ADD FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

ALTER TABLE `reviews` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

ALTER TABLE `reviews` ADD FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

ALTER TABLE `carts` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

ALTER TABLE `cart_items` ADD FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`);

ALTER TABLE `cart_items` ADD FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

ALTER TABLE `related_products` ADD FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

ALTER TABLE `related_products` ADD FOREIGN KEY (`related_product_id`) REFERENCES `products` (`id`);
