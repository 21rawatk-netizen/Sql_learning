/*Inventory Management & Stock Alert System*/
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    stock INT
);
INSERT INTO products VALUES
(1,'Keyboard',5),
(2,'Mouse',25),
(3,'Monitor',60);
SELECT product_name,
       stock,
       CASE
           WHEN stock < 10 THEN 'LOW STOCK'
           WHEN stock BETWEEN 10 AND 50 THEN 'MEDIUM STOCK'
           ELSE 'SUFFICIENT STOCK'
       END AS stock_status
FROM products;
