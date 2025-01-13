select length('helloworld');

select last_name , length(last_name) 
from employee_demographics
order by 2
;

select upper('jaman');
select lower('JJkassd');


select first_name , upper(first_name) 
from employee_demographics
;

select trim('             fdsdsd       ');
select ltrim('             fdsdsd       ');
select rtrim('             fdsdsd       ');


select first_name, left(first_name,3)
from employee_demographics
;

select first_name,left(first_name,3), right(first_name,3)
from employee_demographics
;


select first_name,
left(first_name,3), 
right(first_name,3),
substring(first_name,3,2)
from employee_demographics
;


select first_name,
left(first_name,3), 
right(first_name,3),
substring(first_name,3,2),
birth_date,
substring(birth_date,6,2) as birth_month
from employee_demographics
;


select first_name, replace(first_name,'a','z')
from employee_demographics
;


select locate('n','jaman');

select first_name,last_name,
concat(first_name , ' ', last_name) as full_name
from employee_demographics
;