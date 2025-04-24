create database e-comers;
use e-comers;
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla de productos
CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    stock INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla de carritos
CREATE TABLE carts (
    cart_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Tabla de items del carrito
CREATE TABLE cart_items (
    cart_item_id INT AUTO_INCREMENT PRIMARY KEY,
    cart_id INT,
    product_id INT,
    quantity INT NOT NULL CHECK (quantity > 0),
    FOREIGN KEY (cart_id) REFERENCES carts(cart_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Tabla de órdenes
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    total DECIMAL(10, 2),
    payment_status VARCHAR(50) DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Detalles de productos comprados
CREATE TABLE order_items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    price_at_purchase DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

NSERT INTO users (username, email, password_hash) VALUES
('jdoe', 'jdoe@ejemplo.com', 'hashed123'),
('asmith', 'asmith@ejemplo.com', 'hashed456'),
('mbrown', 'mbrown@ejemplo.com', 'hashed789'),
('lwhite', 'lwhite@ejemplo.com', 'hashed111'),
('gclark', 'gclark@ejemplo.com', 'hashed222');

-- Productos
INSERT INTO products (name, description, price, stock) VALUES
('Laptop Pro 14"', 'Laptop profesional con Intel i7', 2599999.99, 10),
('Smartphone X200', 'Smartphone gama alta', 2999999.99, 25),
('Auriculares', 'Auriculares con cancelación de ruido', 349999.99, 50),
('Tablet 10"', 'Tablet para multimedia y lectura', 1599999.99, 15),
('Smartwatch', 'Reloj inteligente resistente al agua', 999999.99, 30);

-- Carritos
INSERT INTO carts (user_id) VALUES
(1), (2), (3), (4), (5);

-- Items en carritos
INSERT INTO cart_items (cart_id, product_id, quantity) VALUES
(1, 1, 1),
(1, 2, 2),
(2, 3, 1),
(3, 4, 1),
(5, 5, 3);

-- Órdenes
INSERT INTO orders (user_id, total, payment_status) VALUES
(1, 3099.98, 'paid'),
(2, 199.99, 'pending'),
(3, 499.99, 'paid'),
(4, 149.99, 'paid'),
(5, 449.97, 'paid');

-- Items de órdenes
INSERT INTO order_items (order_id, product_id, quantity, price_at_purchase) VALUES
(1, 1, 1, 1299.99),
(1, 2, 2, 899.50),
(2, 3, 1, 199.99),
(3, 4, 1, 499.99),
(5, 5, 3, 149.99);
