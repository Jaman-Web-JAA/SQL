select * 
from employee_demographics;

select *
from employee_salary;

delimiter $$
create trigger employee_insert
	after insert on employee_salary
    for each row
begin
	insert into employee_demographics(employee_id,first_name,last_name)
    values(new.employee_id,new.first_name,new.last_name);
end $$
delimiter ;


insert into employee_salary values(13,'Jean-Ralphino','Saperstein','Exntertainment 720 CEO',100000,Null);



-- Events --
delimiter $$
create event delete_retries
on schedule every 30 second
do
begin
	delete
    from employee_demographics
    where age >= 60;
end $$
delimiter ;

drop event delete_retries;