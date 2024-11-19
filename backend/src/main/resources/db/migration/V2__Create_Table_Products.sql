CREATE TABLE `products` (
    `id` VARCHAR(255) PRIMARY KEY UNIQUE NOT NULL,
    `name` VARCHAR(50) NOT NULL UNIQUE,
    `price` DECIMAL(5, 2)NOT NULL,
    `quantity` INTEGER NOT NULL,
    `description` VARCHAR(20) NOT NULL,
    `category` VARCHAR(20) NOT NULL
);