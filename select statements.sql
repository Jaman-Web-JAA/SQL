select * from parks_and_recreation.employee_demographics;

select first_name,
last_name,
birth_date,
age,
(age + 10) * 10 + 5
from parks_and_recreation.employee_demographics;

#PEMDAS
# PEMDAS means parentheses, exponents, multiplication, division, addition, and subtraction.

select distinct gender
from parks_and_recreation.employee_demographics;

select distinct first_name,gender
from parks_and_recreation.employee_demographics;
