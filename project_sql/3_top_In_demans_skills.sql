/*Question: What are the most in-demand skills for data analysts? 
Join job postings to inner join table similar to query 2
Identify the top 5 in-demand skills for a data analyst.
- Focus on all job postings.
Why? Retrieves the top 5 skills with the highest demand in the job 
market, providing insights into the most valuable skills for job seekers.*/


WITH remote_job_skills AS ( 
SELECT skills_to_job.skill_id,
 COUNT(*) AS skill_count 
FROM skills_job_dim AS skills_to_job
INNER JOIN job_postings_fact AS 
job_postings ON 
job_postings.job_id = skills_to_job.job_id 
WHERE job_postings.job_work_from_home = TRUE 
GROUP BY skills_to_job.skill_id
 ) 
SELECT 
skills.skill_id,
skills.skills AS skill_name, remote_job_skills.skill_count 
FROM 
remote_job_skills 
INNER JOIN skills_dim AS skills ON skills.skill_id = remote_job_skills.skill_id 
ORDER BY 
skill_count DESC 
LIMIT 5;

/*
What we got from here?
the top in demand skills are in order 
1) Python
2) SQL
3) Amazon Web Services  (AWS)
4) Microsoft Azure 
5) Apache Spark