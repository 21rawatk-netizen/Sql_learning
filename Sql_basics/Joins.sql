/* =========================================
   SQL JOINS – PRACTICE QUERIES
   ========================================= */

/* ---------- Sample Tables ---------- */

CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary INT,
    dept_id INT
);

/* ---------- Insert Sample Data ---------- */

INSERT INTO departments VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Finance'),
(4, 'Marketing');

INSERT INTO employees VALUES
(101, 'Rahul', 50000, 2),
(102, 'Anita', 60000, 1),
(103, 'Suresh', 55000, 2),
(104, 'Meena', 65000, 3),
(105, 'Vikram', 48000, NULL);

/* =========================================
   1. INNER JOIN
   ========================================= */

-- Employees with their department names
SELECT e.emp_id, e.emp_name, d.dept_name
FROM employees e
INNER JOIN departments d
ON e.dept_id = d.dept_id;

/* =========================================
   2. LEFT JOIN
   ========================================= */

-- All employees, even if they don't belong to a department
SELECT e.emp_id, e.emp_name, d.dept_name
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id;

/* =========================================
   3. RIGHT JOIN
   ========================================= */

-- All departments, even if no employee is assigned
SELECT e.emp_name, d.dept_name
FROM employees e
RIGHT JOIN departments d
ON e.dept_id = d.dept_id;

/* =========================================
   4. FULL OUTER JOIN
   (Works in PostgreSQL, SQL Server)
   ========================================= */

SELECT e.emp_name, d.dept_name
FROM employees e
FULL OUTER JOIN departments d
ON e.dept_id = d.dept_id;

/* =========================================
   5. SELF JOIN
   ========================================= */

-- Compare employees working in the same department
SELECT a.emp_name AS Employee1, b.emp_name AS Employee2, a.dept_id
FROM employees a
JOIN employees b
ON a.dept_id = b.dept_id
AND a.emp_id <> b.emp_id;

/* =========================================
   6. CROSS JOIN
   ========================================= */

-- Every employee with every department
SELECT e.emp_name, d.dept_name
FROM employees e
CROSS JOIN departments d;

/* =========================================
   END OF JOINS
   ========================================= */
