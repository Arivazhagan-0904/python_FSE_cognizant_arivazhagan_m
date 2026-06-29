SELECT
    c.course_id,
    c.course_name
FROM courses c
WHERE EXISTS
(
    SELECT 1
    FROM enrollments e
    WHERE e.course_id = c.course_id
)
AND NOT EXISTS
(
    SELECT 1
    FROM enrollments e
    WHERE e.course_id = c.course_id
    AND e.grade <> 'A'
);
