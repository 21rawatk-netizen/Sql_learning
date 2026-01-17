/*E-Learning Platform Progress Tracker*/
CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100)
);

CREATE TABLE enrollments (
    user_id INT,
    course_id INT,
    completed BOOLEAN
);
INSERT INTO courses VALUES
(1,'SQL Advanced'),
(2,'Python');

INSERT INTO enrollments VALUES
(101,1,TRUE),
(102,1,FALSE),
(103,2,TRUE),
(104,2,TRUE);
SELECT course_id,
       COUNT(*) AS total_enrolled,
       SUM(CASE WHEN completed = TRUE THEN 1 ELSE 0 END) AS completed_users
FROM enrollments
GROUP BY course_id;
