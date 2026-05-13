-- what art the most in demand skills for data analyst job in 2024?
-- we can use the skills_job_dim and skills_dim to find out the most in demand skills for data analyst job in 2024. we can join the job_postings_fact with skills_job_dim and skills_dim to get the skills for data analyst job and then we can count the number of job postings for each skill to find out the most in demand skills for data analyst job in 2024.
SELECT skills_dim.skills,  count(skills_job_dim.job_id) as demand_count FROM job_postings_fact INNER JOIN skills_job_dim 
ON job_postings_fact.job_id = skills_job_dim.job_id  
inner join skills_dim on skills_job_dim.skill_id = skills_dim.skill_id 
WHERE job_title_short = 'Data Analyst' /*AND job_location = 'Anywhere'*/  
GROUP BY skills ORDER BY demand_count DESC LIMIT 10