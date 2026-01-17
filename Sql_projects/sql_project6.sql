/*Hospital Patient Appointment Analysis*/
CREATE TABLE patients (
    patient_id INT PRIMARY KEY,
    patient_name VARCHAR(100)
);

CREATE TABLE appointments (
    appointment_id INT PRIMARY KEY,
    patient_id INT,
    doctor_name VARCHAR(100),
    appointment_date DATE
);
INSERT INTO patients VALUES
(1,'Raj'),
(2,'Meena');

INSERT INTO appointments VALUES
(101,1,'Dr. Sharma','2024-01-10'),
(102,2,'Dr. Sharma','2024-01-12'),
(103,1,'Dr. Gupta','2024-02-10');
SELECT doctor_name,
       MONTH(appointment_date) AS month,
       COUNT(*) AS total_appointments
FROM appointments
GROUP BY doctor_name, MONTH(appointment_date);
