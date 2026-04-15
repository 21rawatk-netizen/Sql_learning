CREATE DATABASE grocerylist;
USE grocerylist;
CREATE TABLE items(
id INT PRIMARY KEY,
product_name VARCHAR(30),
price INT);
INSERT INTO items (id,product_name,price)
VALUES

(01,"rice",15),
(02,"sugar",80),
(03,"flour",12),
(04,"DAAL",30),
(06,"salt",90);

SELECT* FROM items;
SELECT product_name,price,
CASE
    WHEN price <20 THEN 'low cost'
    WHEN price BETWEEN 20 AND 50 THEN 'Medium cost'
    ELSE 'high cost'
END AS pricecategory
FROM items;
