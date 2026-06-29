SELECT student_id,
       first_name,
       department_id
FROM students
WHERE student_id = 3;

BEGIN;

SELECT sp_transfer_student(3,999);

ROLLBACK;

SELECT student_id,
       first_name,
       department_id
FROM students
WHERE student_id = 3;

SELECT *
FROM department_transfer_log;
