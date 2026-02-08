/* =========================================
   SQL LOGICAL OPERATORS
   AND / OR / NOT
   ========================================= */

/* ---------- Sample Table ---------- */

CREATE TABLE employees (
    emp_id INT,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    city VARCHAR(50)
);

/* ---------- Insert Sample Data ---------- */

INSERT INTO employees VALUES
(1, 'Amit', 'IT', 50000, 'Delhi'),
(2, 'Ravi', 'HR', 40000, 'Mumbai'),
(3, 'Neha', 'IT', 60000, 'Delhi'),
(4, 'Pooja', 'Finance', 55000, 'Pune'),
(5, 'Karan', 'HR', 45000, 'Delhi');

/* =========================================
   1. AND Operator
   ========================================= */

-- Employees from IT department earning more than 50,000
SELECT *
FROM employees
WHERE department = 'IT'
AND salary > 50000;

/* =========================================
   2. OR Operator
   ========================================= */

-- Employees from HR or Finance department
SELECT *
FROM employees
WHERE department = 'HR'
OR department = 'Finance';

/* =========================================
   3. NOT Operator
   ========================================= */

-- Employees who are NOT from Delhi
SELECT *
FROM employees
WHERE NOT city = 'Delhi';

/* =========================================
   4. AND + OR Combined
   ========================================= */

-- Employees from IT or HR department AND salary above 45,000
SELECT *
FROM employees
WHERE (department = 'IT' OR department = 'HR')
AND salary > 45000;

/* =========================================
   5. NOT with AND
   ========================================= */

-- Employees not from HR department and earning more than 45,000
SELECT *
FROM employees
WHERE NOT department = 'HR'
AND salary > 45000;

/* =========================================
   END OF LOGICAL OPERATORS
   ========================================= */
