CREATE DATABASE college;
USE college;
CREATE TABLE student (
s_id INT PRIMARY KEY,
name VARCHAR(20));
INSERT INTO student(s_id,name)
VALUES
(01,"kiran"),
(02,"aman"),
(03,"max"),
(04,"sam");
CREATE TABLE course(
c_id INT PRIMARY KEY,
name VARCHAR(20));
INSERT INTO course(c_id,name)
VALUES
(01,"python"),
(02,"java"),
(03,"sql"),
(04,"c");
SELECT* FROM student;
SELECT* FROM course;
-- Inner join--
SELECT*
FROM student
INNER JOIN course
ON student.s_id=course.c_id;
-- avoid duplicates--
SELECT
 student.s_id,
 student.name,
 course.name AS course_name -- to avoid confusion --
 FROM student
 INNER JOIN course
 ON student.s_id=course.c_id;
 -- Left Join--
 SELECT*
FROM student
LEFT JOIN course
ON student.s_id=course.c_id;
-- avoid duplicates--
SELECT
 student.s_id,
 student.name,
 course.name AS course_name -- to avoid confusion --
 FROM student
 LEFT JOIN course
 ON student.s_id=course.c_id;
 -- Right join--
SELECT*
FROM student
RIGHT JOIN course
ON student.s_id=course.c_id;
-- avoid duplicates--
SELECT
 student.s_id,
 student.name,
 course.name AS course_name -- to avoid confusion --
 FROM student
 RIGHT JOIN course
 ON student.s_id=course.c_id;
 -- FULL JOIN--
SELECT*
FROM student
LEFT JOIN course
ON student.s_id=course.c_id
UNION
SELECT*
FROM student
RIGHT JOIN course
ON student.s_id=course.c_id;
-- avoid duplicates--
SELECT
 student.s_id,
 student.name,
 course.name AS course_name -- to avoid confusion --
 FROM student
 LEFT JOIN course
 ON student.s_id=course.c_id
UNION
SELECT
 student.s_id,
 student.name,
 course.name AS course_name -- to avoid confusion --
 FROM student
 RIGHT JOIN course
 ON student.s_id=course.c_id;
-- LEFT EXCLUSIVE JOIN
SELECT*
FROM student
LEFT JOIN course
ON student.s_id=course.c_id
WHERE course.c_id IS NULL;


 

 
