select *
from employee_demographics
;

select *
from employee_salary
;

-- inner join --
select *
from employee_demographics emp_demo
inner join employee_salary emp_sal
	on emp_demo.employee_id = emp_sal.employee_id
    ;
    
select *
from employee_demographics emp_demo
inner join employee_salary emp_sal
	on emp_demo.employee_id = emp_sal.employee_id
    ;
    
select dem.employee_id,dem.age, sal.occupation
from employee_demographics AS dem
inner join employee_salary AS sal
	on dem.employee_id = sal.employee_id
    ;

-- outer join --
select *
from employee_demographics AS dem
left join employee_salary AS sal
	on dem.employee_id = sal.employee_id
    ;
    
select *
from employee_demographics AS dem
right join employee_salary AS sal
	on dem.employee_id = sal.employee_id
    ;

-- self join --
select emp1.employee_id,emp1.first_name,emp1.last_name,emp2.employee_id,emp2.first_name,emp2.last_name 
from employee_salary emp1
join employee_salary emp2
	on emp1.employee_id + 1 = emp2.employee_id
;

select emp1.employee_id AS emp_santa,
emp1.first_name AS first_name_santa,
emp1.last_name AS last_name_santa,
emp2.employee_id AS emp_name,
emp2.first_name AS first_name_emp,
emp2.last_name AS last_name_emp
from employee_salary emp1
join employee_salary emp2
	on emp1.employee_id + 1 = emp2.employee_id
;


-- joining multiple tables together --
select *
from employee_demographics emp_demo
inner join employee_salary emp_sal
	on emp_demo.employee_id = emp_sal.employee_id
;

select * 
from parks_departments
;

select *
from employee_demographics dem
inner join employee_salary sal
on dem.employee_id = sal.employee_id
inner join parks_departments par
on sal.dept_id = par.department_id
;

