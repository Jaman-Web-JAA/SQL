CREATE TABLE job_applied(
    job_id INT,
    application_sent_date DATE,
    custom_resume BOOLEAN,
    resume_file_name VARCHAR(255),
    cover_letter_sent BOOLEAN,
    cover_letter_file_name VARCHAR(255),
    status VARCHAR(50)
)


Insert into job_applied
(job_id,
application_sent_date,
custom_resume,
resume_file_name,
cover_letter_sent,
cover_letter_file_name,
status)
values(
    2,
'2024-02-01',
true,
'resume01.pdf',
true,
'cover_letter01.pdf',
'submitted'),
(
    3,
'2024-02-01',
true,
'resume02.pdf',
true,
'cover_letter02.pdf',
'submitted'),
(
    4,
'2024-02-01',
true,
'resume03.pdf',
true,
'cover_letter03.pdf',
'submitted'),
(
    5,
'2024-02-01',
true,
'resume04.pdf',
true,
'cover_letter04.pdf',
'submitted');

ALTER TABLE job_applied
Add contact varchar(50);

UPDATE job_applied
set contact = 'person2'
where job_id=2;

UPDATE job_applied
set contact = 'person3'
where job_id=3;

UPDATE job_applied
set contact = 'person4'
where job_id=4;

UPDATE job_applied
set contact = 'person5'
where job_id=5;

ALTER TABLE job_applied
RENAME COLUMN contact TO contact_name;

ALTER Table job_applied
ALTER column contact_name TYPE text;

ALTER Table job_applied
Drop column contact_name;

//Drop Table job_applied;

select job_posted_date from job_postings_fact
limit 10


select job_posted_date::DATE as date,
job_location as location,
job_title_short as title
from 
job_postings_fact
LIMIT 1000

select job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'IST' as date,
job_location as location,
job_title_short as title
from 
job_postings_fact
LIMIT 5

select job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'IST' as date,
EXTRACT(MONTH from job_posted_date) as month,
EXTRACT(YEAR from job_posted_date) as year,
job_location as location,
job_title_short as title
from 
job_postings_fact
LIMIT 5


select 
count(job_id) as job_count,
EXTRACT(MONTH from job_posted_date) as month
from 
job_postings_fact
where job_title_short='Data Analyst'
group by month
order by job_count;

CREATE Table january_jobs as 
SELECT * from 
job_postings_fact
where EXTRACT(MONTH from job_posted_date) =1

CREATE Table february_jobs as 
SELECT * from 
job_postings_fact
where EXTRACT(MONTH from job_posted_date) =2

CREATE Table march_jobs as 
SELECT * from 
job_postings_fact
where EXTRACT(MONTH from job_posted_date) =3

select 
count(job_id) as no_of_jobs,
CASE
WHEN job_location = 'Anywhere' then 'Remote'
WHEN job_location = 'New York, NY' THEN 'Local'
ELSE 'On site'
END as Job_type
FROM job_postings_fact
GROUP BY Job_type

select 
count(job_id) as no_of_jobs,
CASE
WHEN job_location = 'Anywhere' then 'Remote'
WHEN job_location = 'New York, NY' THEN 'Local'
ELSE 'On site'
END as Job_type
FROM job_postings_fact
where job_title_short='Data Analyst'
GROUP BY Job_type


--subquery
select *
from (
SELECT * from 
job_postings_fact
where EXTRACT(MONTH from job_posted_date) =1)
as january_jobs_table;

select company_id,name as cmp_name
from company_dim 
where company_id in (
SELECT
company_id
 FROM job_postings_fact
 WHERE
 job_no_degree_mention = TRUE
);

--CTE
with january_jobs_fn as (
SELECT * from 
job_postings_fact
where EXTRACT(MONTH from job_posted_date) =1)

select * from january_jobs_fn;


with company_job_count as (
select company_id,
count(job_title_short) as total_jobs
FROM
job_postings_fact
GROUP BY company_id
)
select company_dim.name,company_job_count.total_jobs from
company_dim
LEFT JOIN company_job_count
on company_job_count.company_id=company_dim.company_id
order by total_jobs DESC;

with remote_job_skills as (select
skill_id,
count(*) as skill_count

FROM
job_postings_fact as jpf
INNER JOIN skills_job_dim as sjd ON
jpf.job_id=sjd.job_id
where jpf.job_work_from_home=TRUE AND
jpf.job_title_short = 'Data Analyst'
GROUP BY sjd.skill_id
)

select skills.skill_id,
skills as skills_name,
skill_count
from remote_job_skills
INNER JOIN skills_dim as skills ON
skills.skill_id=remote_job_skills.skill_id
ORDER BY skill_count desc
LIMIT 5;


















