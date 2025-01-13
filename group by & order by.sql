select *
from employee_demographics
;


select gender
from employee_demographics
group by gender
;

select first_name
from employee_demographics
group by gender
;

select gender, avg(age)
from employee_demographics
group by gender
;


select occupation,count(*) 
from employee_salary
group by occupation
;

select gender, avg(age),max(age),min(age),count(age)
from employee_demographics
group by gender
;


-- order by ---
select *
from employee_demographics
order by gender, age
;

select *
from employee_demographics
order by gender, age desc
;

select *
from employee_demographics
order by 5, 4 desc
;

