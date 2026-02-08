/* =========================================
   SQL WINDOW FUNCTIONS
   ========================================= */

/* ---------- Sample Table ---------- */

CREATE TABLE employee_sales (
    emp_id INT,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    sales_amount INT,
    sales_month VARCHAR(20)
);

/* ---------- Insert Sample Data ---------- */

INSERT INTO employee_sales VALUES
(1, 'Amit', 'IT', 50000, 'January'),
(2, 'Ravi', 'IT', 60000, 'January'),
(3, 'Neha', 'HR', 45000, 'January'),
(4, 'Pooja', 'HR', 55000, 'January'),
(5, 'Karan', 'Finance', 70000, 'January'),
(6, 'Amit', 'IT', 52000, 'February'),
(7, 'Ravi', 'IT', 61000, 'February'),
(8, 'Neha', 'HR', 47000, 'February'),
(9, 'Pooja', 'HR', 56000, 'February'),
(10, 'Karan', 'Finance', 72000, 'February');

/* =========================================
   1. ROW_NUMBER()
   ========================================= */

-- Assign a unique row number within each department
SELECT emp_name, department, sales_amount,
ROW_NUMBER() OVER (PARTITION BY department ORDER BY sales_amount DESC) AS row_num
FROM employee_sales;

/* =========================================
   2. RANK()
   ========================================= */

-- Rank employees based on sales (with gaps)
SELECT emp_name, department, sales_amount,
RANK() OVER (PARTITION BY department ORDER BY sales_amount DESC) AS sales_rank
FROM employee_sales;

/* =========================================
   3. DENSE_RANK()
   ========================================= */

-- Rank employees based on sales (no gaps)
SELECT emp_name, department, sales_amount,
DENSE_RANK() OVER (PARTITION BY department ORDER BY sales_amount DESC) AS dense_rank
FROM employee_sales;

/* =========================================
   4. LEAD()
   ========================================= */

-- Get next month's sales for each employee
SELECT emp_name, sales_month, sales_amount,
LEAD(sales_amount) OVER (PARTITION BY emp_name ORDER BY sales_month) AS next_month_sales
FROM employee_sales;

/* =========================================
   5. LAG()
   ========================================= */

-- Get previous month's sales for each employee
SELECT emp_name, sales_month, sales_amount,
LAG(sales_amount) OVER (PARTITION BY emp_name ORDER BY sales_month) AS previous_month_sales
FROM employee_sales;

/* =========================================
   6. Running Total using SUM()
   ========================================= */

-- Cumulative sales per employee
SELECT emp_name, sales_month, sales_amount,
SUM(sales_amount) OVER (PARTITION BY emp_name ORDER BY sales_month) AS running_total
FROM employee_sales;

/* =========================================
   END OF WINDOW FUNCTIONS
   ========================================= */
