select *
from employee_salary
where salary >=50000
;


create procedure large_salaries()
select *
from employee_salary
where salary >=50000
;

call large_salaries();


create procedure large_salaries2()
select *
from employee_salary
where salary >=50000
;
select *
from employee_salary
where salary >=10000
;


Delimiter $$
create procedure large_salaries3()
begin
	select *
	from employee_salary
	where salary >=50000
	;
	select *
	from employee_salary
	where salary >=10000;
end $$
delimiter ;

call large_salaries3();

Delimiter $$
create procedure large_salaries4(emp_id int)
begin
	select *
	from employee_salary
	where employee_id = emp_id;
end $$
delimiter ;

call large_salaries4(1);


