CREATE DATABASE college;
USE college;
CREATE TABLE student(
id INT PRIMARY KEY,
name VARCHAR(50),
grade VARCHAR(1));
INSERT INTO student(
id,name,grade)
VALUES
(01,"kiran",4),
(02,"aman",5),
(03,"sam",6);
SELECT*FROM student;
SELECT id,name FROM student;
INSERT INTO student(
id,name,grade)
VALUES
(04,"harsh",5);
SELECT DISTINCT grade FROM student;
SELECT* FROM student WHERE grade >4;
SELECT*FROM student WHERE grade BETWEEN 4 AND 6;
SELECT*FROM student WHERE grade IN (4,6);
SELECT*FROM student WHERE grade NOT IN (5);
SELECT name,grade FROM student 
LIMIT 2;
SELECT * FROM student 
LIMIT 3;
SELECT * FROM student
ORDER BY grade ASC;
SELECT id,grade FROM student
ORDER BY name DESC;
SELECT*FROM student
ORDER BY grade DESC
LIMIT 3;
SELECT MAX(grade)
FROM student;
SELECT AVG(grade)
FROM student;
SELECT grade, Count(name)
FROM student
GROUP BY grade;
