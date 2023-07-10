
    -- practice 7 --

-- 1 feladat
select department_id
from employees
Minus
select department_id
from employees
where job_id = 'ST_CLERCK';