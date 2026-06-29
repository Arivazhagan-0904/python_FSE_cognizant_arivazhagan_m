BEGIN;

INSERT INTO enrollments
(student_id, course_id, enrollment_date, grade)
VALUES
(1,3,CURRENT_DATE,'A');

SAVEPOINT first_insert;

INSERT INTO enrollments
(student_id, course_id, enrollment_date, grade)
VALUES
(999,4,CURRENT_DATE,'B');

ROLLBACK TO SAVEPOINT first_insert;

COMMIT;

SELECT *
FROM enrollments
WHERE student_id = 1;
