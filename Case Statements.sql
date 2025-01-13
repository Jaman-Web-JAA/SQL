select *
from employee_demographics
;

select first_name,
last_name,
age,
CASE
	WHEN age <= 30 THEN 'Young'
    WHEN age between 31 and 50 THEN 'OLD'
    when age >= 50 then "On Death's Door"
END as category
from employee_demographics
;

select *
from
employee_salary;

select first_name,last_name,salary,
case
	when salary < 50000 then salary + (salary*0.05)
    when salary > 50000 then salary + (salary*0.07)
end as new_salary,
case
	when pd.department_name = 'Finance' then salary + (salary*0.10)
end as bonus
from employee_salary sal
inner join parks_departments pd
on sal.dept_id = pd.department_id
;