CREATE DATABASE marksheet;
USE marksheet;
CREATE TABLE record(
id INT PRIMARY KEY ,
name VARCHAR(30),
grade INT,
city VARCHAR(20));
INSERT INTO record(id,name,grade,city)
VALUES
(01,"kiran",20,"DELHI"),
(02,"AMAN",30,"DELHI"),
(03,"SAM",40,"MUMBAI"),
(04,"MAX",30,"MUMBAI");
SELECT city,count(name)
FROM record 
GROUP BY city;
HAVING max(grade)>20;
SELECT city
FROM record 
WHERE grade > 20 
GROUP BY city 
HAVING max(grade)>35;
SELECT city
FROM record 
WHERE grade > 20 
GROUP BY city 
HAVING min(grade)<35
ORDER BY city DESC;
-- updateing the table --
UPDATE record
SET grade = 20
WHERE grade = 10;
-- it giving safe warning so use 	SET SQL_SAFE_UPDATE=0; --
SET SQL_SAFE_UPDATES=0;
UPDATE record
SET grade = 10
WHERE grade = 20;
SELECT*FROM record;
UPDATE record
SET grade = 20
WHERE grade = 30;
SELECT*FROM record;
UPDATE record
SET grade=grade+1;
SELECT*FROM record;
-- deleteing the record--
DELETE FROM record
WHERE grade<15;
SELECT*FROM record;
