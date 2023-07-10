select salary,last_name
from employees
where salary= 
    (select max(salary)
    from employees);
    
    -- 6 Practice --

-- 1 feladat
select last_name,hire_date
from employees
where department_id = 
    (select department_id
    from employees
    where last_name = 'Zlotkey');
    
-- 2 feladat
select employee_id,last_name,salary 
from employees
where salary > 
    (select avg(salary)
    from employees);
    --order by salary);

-- 3 feladat
select employee_id,last_name
from employees
where  department_id in 
        (select department_id
        from employees
        where last_name like '%u%');
        
-- 4 feladat
select department_id,job_id,last_name
from employees
where  department_id in -- tobb valasz eseten
    (select department_id
    from departments
    where location_id = 1700);
    
-- 5 feladat
select last_name,salary
from employees
where manager_id in
        (select employee_id
        from employees
        where last_name = 'King' );
        
--6 feladat
select department_id,last_name,job_id
from employees
where  department_id in -- tobb valasz eseten
    (select department_id
    from departments
    where department_name = 'Executive');
    
-- 7 feladat
select employee_id,last_name,salary 
from employees
where salary > 
    (select avg(salary)
    from employees)
and where  department_id in 
        (select department_id
        from employees
        where last_name like '%u%');
        