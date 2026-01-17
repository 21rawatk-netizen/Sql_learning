Online Shopping Sales Analysis
/*Subqueries, GROUP BY, HAVING*/
  CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_amount INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
INSERT INTO customers VALUES
(1,'Kiran'),
(2,'Rohit'),
(3,'Anjali');

INSERT INTO orders VALUES
(101,1,5000,'2024-01-10'),
(102,1,3000,'2024-01-15'),
(103,2,2000,'2024-01-20'),
(104,3,9000,'2024-01-25');

SELECT customer_id, SUM(order_amount) AS total_spent
FROM orders
GROUP BY customer_id
HAVING SUM(order_amount) >
      (SELECT AVG(order_amount) FROM orders);

