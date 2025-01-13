select *
from employee_demographics
order by age desc
limit 3, 3
;

-- Aliasing --

select gender,avg(age) AS avg_age
from employee_demographics
group by gender
having avg_age > 40
;