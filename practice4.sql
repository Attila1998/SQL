Select  max(salary),min(salary),avg(salary)
from employees;

-- practice 4
-- 5 feladat
select job_id,max(salary),min(salary),round(avg(salary)),sum(salary)
from employees;
group by job_id

-- 6 feladat
select job_id,count(*)
from employees;
group by job_id

--8 feladat
select max(salary)-min(salary) as "Difference"
from employees;


-- 9 feladat
select manager_id, min(salary)
from employees
where manager_id in not null
having min(salary)>6000

-- 10 feladat
select count(*), SUM(decode(to_char(hire_date, 'yyyy'), 2000,1,0)) AS "2000", 
SUM(decode(to_char(hire_date, 'yyyy'), 1987,1,0)) AS "1987",
SUM(decode(to_char(hire_date, 'yyyy'), 1995,1,0)) AS "1995",
from employees;



