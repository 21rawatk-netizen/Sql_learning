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
INSERT INTO employees VALUES
(1,'Amit','IT',60000),
(2,'Neha','IT',65000),
(3,'Rahul','HR',50000),
(4,'Pooja','HR',52000);

INSERT INTO performance VALUES
(101,1,9,2024),
(102,2,8,2024),
(103,3,7,2024),
(104,4,9,2024);
WITH ranked_perf AS (
    SELECT e.emp_name, e.department, p.rating,
           RANK() OVER (PARTITION BY e.department ORDER BY p.rating DESC) AS rnk
    FROM employees e
    JOIN performance p ON e.emp_id = p.emp_id
)
SELECT * FROM ranked_perf WHERE rnk = 1;
