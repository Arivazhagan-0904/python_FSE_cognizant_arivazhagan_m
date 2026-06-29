CREATE OR REPLACE FUNCTION sp_transfer_student(
    p_student_id INT,
    p_new_department INT
)
RETURNS VOID
LANGUAGE plpgsql
AS $$
DECLARE
    v_old_department INT;
BEGIN
    SELECT department_id
    INTO v_old_department
    FROM students
    WHERE student_id = p_student_id;

    UPDATE students
    SET department_id = p_new_department
    WHERE student_id = p_student_id;

    INSERT INTO department_transfer_log (
        student_id,
        old_department,
        new_department
    )
    VALUES (
        p_student_id,
        v_old_department,
        p_new_department
    );
END;
$$;
