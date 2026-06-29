SELECT * FROM(
    SELECT 
    d.department_id,
    d.dept_name,
    ROUND(AVG(p.salary),2) as avg_Salary
    FROM departments d 
    join professors p
    on d.department_id = p.department_id
    GROUP BY
    d.department_id,
    d.dept_name
) as department_salary WHERE avg_Salary > 85000;
