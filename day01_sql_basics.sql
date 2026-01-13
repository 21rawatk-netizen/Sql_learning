-- Day 01: SQL Basics Practice
-- Topic: CREATE, INSERT, SELECT, WHERE, ORDER BY

-- Create a database
CREATE DATABASE sql_learning;
USE sql_learning;

-- Create a table
CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary INT
);

-- Insert data into table
INSERT INTO employees (id, name, department, salary) VALUES
(1, 'Amit', 'IT', 50000),
(2, 'Neha', 'HR', 40000),
(3, 'Rahul', 'Finance', 45000),
(4, 'Priya', 'IT', 55000);

-- Select all records
SELECT * FROM employees;

-- Select specific columns
SELECT name, department FROM employees;

-- Use WHERE clause
SELECT * FROM employees WHERE department = 'IT';

-- Order by salary
SELECT * FROM employees ORDER BY salary DESC;

-- Aggregate function
SELECT department, COUNT(*) AS total_employees
FROM employees
GROUP BY department;

-- End of Day 01 practice
