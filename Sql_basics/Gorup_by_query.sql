
SELECT department, COUNT(*) AS total_employees
FROM employees
GROUP BY department;

SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department;
