SELECT name FROM Students
WHERE student_id IN (
    SELECT student_id FROM Marks WHERE marks > 80
);
