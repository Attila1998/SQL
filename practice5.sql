-- practice 5
-- 1 feladata
select location_id,street_address,city,state_province,country_name, region_id
from countrye c join locations l
on c.country_id = l.countrt_id;

-- 2 feladat
select e.last_name,e.departmant_id,d.departmanet_name
from employees e join departments d
on e.department_id = d.department_id;

-- 3 feladat
select e.last_name,e.job_id,e.departmant_id,d.departmanet_name
from employees e join departments d
on e.department_id = d.department_id
join locations l
on d.location_id = l.location_id
where l.city='Toronto';

-- 4 feladat
select w.last_name,w.first_name,m.last_name,m.first_name
from employees w join employees m
on w.manager_id=m.employee_id;
--order by w.last_name;

-- 5 feladat
select w.last_name,w.first_name,m.last_name,m.first_name
from employees w left outer join employees m
on w.manager_id=m.employee_id;
--order by w.first_name;

-- 6 feladat
select e.department_id,e.last_name as "Employee",c.last_name as "Collegue"
from employees e join employees c
on e.department_id = c.department_id and e.employee_id < c.employee_id;

-- 7 nem kelll, 8 feladat
select du.last_name,du.hire_date
from employees d join employees du
on d.hire_date < du.hire_date
where d.last_name = 'Davies';

-- 9 feladat - hazi