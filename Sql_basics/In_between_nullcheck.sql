
SELECT * FROM Students
WHERE city IN ('Delhi', 'Pune');

SELECT * FROM Students
WHERE age BETWEEN 20 AND 22;

SELECT * FROM Students
WHERE city IS NULL;

SELECT * FROM Students
WHERE city IS NOT NULL;
