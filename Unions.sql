select *
from employee_demographics
union
select *
from employee_salary
;


select first_name,last_name
from employee_demographics
union
select first_name,last_name
from employee_salary
;

select first_name,last_name
from employee_demographics
union distinct
select first_name,last_name
from employee_salary
;

select first_name,last_name
from employee_demographics
union all
select first_name,last_name
from employee_salary
;


select first_name,last_name, 'Old' AS label
from employee_demographics
where age > 50
;


select first_name,last_name, 'Old Man' AS label
from employee_demographics
where age > 40 and gender = 'Male'
union
select first_name,last_name, 'Old Lady' AS label
from employee_demographics
where age > 40 and gender = 'Female'
union
select first_name,last_name, 'Highly paid employee' AS label
from employee_salary
where salary > 70000
order by first_name,last_name
;
