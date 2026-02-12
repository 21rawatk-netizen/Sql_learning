-- ============================================
-- E-COMMERCE MANAGEMENT SYSTEM - FULL PROJECT
-- ============================================

DROP DATABASE IF EXISTS EcommerceSystem;
CREATE DATABASE EcommerceSystem;
USE EcommerceSystem;

-- ============================================
-- 1️⃣ TABLES
-- ============================================

-- Users Table
CREATE TABLE Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15),
    address VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Products Table
CREATE TABLE Products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(150) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    stock INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Orders Table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10,2) DEFAULT 0.00,
    order_status VARCHAR(30) DEFAULT 'Pending',

    FOREIGN KEY (user_id) REFERENCES Users(user_id)
    ON DELETE CASCADE
);

-- Order Items Table
CREATE TABLE OrderItems (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10,2),

    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
    ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
    ON DELETE CASCADE
);

-- Payments Table
CREATE TABLE Payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payment_method VARCHAR(50),
    payment_status VARCHAR(30) DEFAULT 'Pending',

    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
    ON DELETE CASCADE
);

-- ============================================
-- 2️⃣ SAMPLE DATA
-- ============================================

INSERT INTO Users (name, email, phone, address)
VALUES
('Rahul Sharma', 'rahul@gmail.com', '9876543210', 'Delhi'),
('Priya Verma', 'priya@gmail.com', '9123456780', 'Mumbai');

INSERT INTO Products (product_name, price, stock)
VALUES
('Laptop', 60000.00, 10),
('Mobile Phone', 20000.00, 20),
('Headphones', 2000.00, 50);

-- ============================================
-- 3️⃣ TRIGGER (Auto Reduce Stock After Order)
-- ============================================

DELIMITER //

CREATE TRIGGER AfterOrderItemInsert
AFTER INSERT ON OrderItems
FOR EACH ROW
BEGIN
    UPDATE Products
    SET stock = stock - NEW.quantity
    WHERE product_id = NEW.product_id;
END //

DELIMITER ;

-- ============================================
-- 4️⃣ STORED PROCEDURE (Place Order)
-- ============================================

DELIMITER //

CREATE PROCEDURE PlaceOrder(
    IN u_id INT,
    IN p_id INT,
    IN qty INT
)
BEGIN
    DECLARE prod_price DECIMAL(10,2);
    DECLARE total DECIMAL(10,2);
    DECLARE new_order_id INT;

    -- Get product price
    SELECT price INTO prod_price
    FROM Products
    WHERE product_id = p_id;

    SET total = prod_price * qty;

    -- Create order
    INSERT INTO Orders(user_id, total_amount)
    VALUES (u_id, total);

    SET new_order_id = LAST_INSERT_ID();

    -- Insert order item
    INSERT INTO OrderItems(order_id, product_id, quantity, price)
    VALUES (new_order_id, p_id, qty, prod_price);
END //

DELIMITER ;

-- ============================================
-- 5️⃣ VIEW (Order Details)
-- ============================================

CREATE VIEW OrderDetailsView AS
SELECT 
    o.order_id,
    u.name,
    p.product_name,
    oi.quantity,
    oi.price,
    o.total_amount,
    o.order_status
FROM Orders o
JOIN Users u ON o.user_id = u.user_id
JOIN OrderItems oi ON o.order_id = oi.order_id
JOIN Products p ON oi.product_id = p.product_id;

-- ============================================
-- 6️⃣ TESTING QUERIES
-- ============================================

-- Place an Order
-- CALL PlaceOrder(1, 1, 2);

-- View Orders
-- SELECT * FROM Orders;

-- View Order Items
-- SELECT * FROM OrderItems;

-- Check Product Stock
-- SELECT product_name, stock FROM Products;

-- View Full Order Details
-- SELECT * FROM OrderDetailsView;

-- Total Revenue
-- SELECT SUM(total_amount) AS Total_Revenue FROM Orders;

-- ============================================
-- END OF PROJECT
-- ============================================
