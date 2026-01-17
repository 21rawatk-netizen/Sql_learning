/*Student Result & Ranking System*/
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE marks (
    student_id INT,
    subject VARCHAR(50),
    marks INT
);
INSERT INTO students VALUES
(1,'Kiran'),
(2,'Ravi'),
(3,'Sneha');

INSERT INTO marks VALUES
(1,'Math',85),
(1,'Science',90),
(2,'Math',75),
(2,'Science',80),
(3,'Math',95),
(3,'Science',92);
SELECT student_id,
       SUM(marks) AS total_marks,
       RANK() OVER (ORDER BY SUM(marks) DESC) AS rank
FROM marks
GROUP BY student_id;
