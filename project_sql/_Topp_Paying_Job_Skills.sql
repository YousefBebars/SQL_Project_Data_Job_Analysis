
WITH top_paying_job AS(
SELECT  job_id,job_title, job_location, salary_year_avg , job_schedule_type , name as company_name 
FROM public.job_postings_fact 
LEFT JOIN company_dim 
ON job_postings_fact.company_id = company_dim.company_id
WHERE job_title_short = 'Data Analyst' AND job_location = 'Anywhere' AND salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC LIMIT 10
)
select  * from  top_paying_job 
INNER JOIN skills_job_dim on top_paying_job.job_id = skills_job_dim.job_id 
inner join skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
 ORDER BY salary_year_avg DESC LIMIT 10;





/*
[
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_location": "Anywhere",
    "salary_year_avg": "255829.5",
    "job_schedule_type": "Full-time",
    "company_name": "AT&T",
    "job_id (1)": 552322,
    "skill_id": 0,
    "skill_id (1)": 0,
    "skills": "sql",
    "type": "programming"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_location": "Anywhere",
    "salary_year_avg": "255829.5",
    "job_schedule_type": "Full-time",
    "company_name": "AT&T",
    "job_id (1)": 552322,
    "skill_id": 1,
    "skill_id (1)": 1,
    "skills": "python",
    "type": "programming"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_location": "Anywhere",
    "salary_year_avg": "255829.5",
    "job_schedule_type": "Full-time",
    "company_name": "AT&T",
    "job_id (1)": 552322,
    "skill_id": 5,
    "skill_id (1)": 5,
    "skills": "r",
    "type": "programming"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_location": "Anywhere",
    "salary_year_avg": "255829.5",
    "job_schedule_type": "Full-time",
    "company_name": "AT&T",
    "job_id (1)": 552322,
    "skill_id": 74,
    "skill_id (1)": 74,
    "skills": "azure",
    "type": "cloud"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_location": "Anywhere",
    "salary_year_avg": "255829.5",
    "job_schedule_type": "Full-time",
    "company_name": "AT&T",
    "job_id (1)": 552322,
    "skill_id": 75,
    "skill_id (1)": 75,
    "skills": "databricks",
    "type": "cloud"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_location": "Anywhere",
    "salary_year_avg": "255829.5",
    "job_schedule_type": "Full-time",
    "company_name": "AT&T",
    "job_id (1)": 552322,
    "skill_id": 76,
    "skill_id (1)": 76,
    "skills": "aws",
    "type": "cloud"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_location": "Anywhere",
    "salary_year_avg": "255829.5",
    "job_schedule_type": "Full-time",
    "company_name": "AT&T",
    "job_id (1)": 552322,
    "skill_id": 93,
    "skill_id (1)": 93,
    "skills": "pandas",
    "type": "libraries"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_location": "Anywhere",
    "salary_year_avg": "255829.5",
    "job_schedule_type": "Full-time",
    "company_name": "AT&T",
    "job_id (1)": 552322,
    "skill_id": 95,
    "skill_id (1)": 95,
    "skills": "pyspark",
    "type": "libraries"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_location": "Anywhere",
    "salary_year_avg": "255829.5",
    "job_schedule_type": "Full-time",
    "company_name": "AT&T",
    "job_id (1)": 552322,
    "skill_id": 102,
    "skill_id (1)": 102,
    "skills": "jupyter",
    "type": "libraries"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_location": "Anywhere",
    "salary_year_avg": "255829.5",
    "job_schedule_type": "Full-time",
    "company_name": "AT&T",
    "job_id (1)": 552322,
    "skill_id": 181,
    "skill_id (1)": 181,
    "skills": "excel",
    "type": "analyst_tools"
  }
]
*/