SELECT AVG(course_count)
FROM 
)
SELECT COUNT(course_id) AS course_count
FROM enrollments
GROUP BY student_id
) AS avg_table;

