/*Employee Performance & Salary Analysis System*/
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    department VARCHAR(50),
    salary INT
);

CREATE TABLE performance (
    perf_id INT PRIMARY KEY,
    emp_id INT,
    rating INT,
    review_year INT,
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);
WITH ranked_perf AS (
    SELECT e.emp_name, e.department, p.rating,
           RANK() OVER (PARTITION BY e.department ORDER BY p.rating DESC) AS rnk
    FROM employees e
    JOIN performance p ON e.emp_id = p.emp_id
)
SELECT * FROM ranked_perf WHERE rnk = 1;
