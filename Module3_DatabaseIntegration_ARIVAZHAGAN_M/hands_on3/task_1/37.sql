SELECT
p.prof_name,
p.department_id,
p.salary
from professors p
WHERE salary = 
(
    select max(p2.salary)
    FROM professors p2
    WHERE p2.department_id = p.department_id
);
