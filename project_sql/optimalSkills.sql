WITH top_paying_skills AS(
    SELECT 
    skills_dim.skill_id ,
    skills_dim.skills,
    COUNT(*) AS demand_count,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim
    ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim
    ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Analyst'
    AND job_work_from_home = TRUE
    AND salary_year_avg IS NOT NULL
GROUP BY skills_dim.skill_id 
 
 
 
), top_demand_skills AS
(SELECT skills_dim.skill_id, skills_dim.skills,  count(skills_job_dim.job_id) as demand_count FROM job_postings_fact INNER JOIN skills_job_dim 
ON job_postings_fact.job_id = skills_job_dim.job_id  
inner join skills_dim on skills_job_dim.skill_id = skills_dim.skill_id 
WHERE job_title_short = 'Data Analyst'  AND job_work_from_home = TRUE AND salary_year_avg IS NOT NULL
GROUP BY skills_dim.skill_id  )


SELECT top_paying_skills.skills, top_paying_skills.avg_salary, top_demand_skills.demand_count
FROM top_paying_skills
INNER JOIN top_demand_skills    
ON top_paying_skills.skill_id = top_demand_skills.skill_id
ORDER BY demand_count DESC , avg_salary DESC LIMIT 10;
