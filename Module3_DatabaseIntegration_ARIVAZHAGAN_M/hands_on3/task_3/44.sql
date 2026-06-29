CREATE OR REPLACE FUNCTION fn_enroll_students(
    p_student_id INT,
    p_course_id INT,
    p_enrollment_date DATE
)
RETURNS void
LANGUAGE plpgsql
AS $$
BEGIN 
if EXISTS (
    SELECT 1
    FROM enrollments
    WHERE student_id = p_student_id
    and course_id = p_course_id
) THEN
    RAISE exception 'duplicate enrollment: student % is already enrolled in course %', p_student_id, p_course_id;
    end if;
    INSERT INTO enrollments 
    (student_id,
    course_id,enrollment_id)
    VALUES 
    (p_student_id,p_course_id,p_enrollment_date);
END;
$$;
