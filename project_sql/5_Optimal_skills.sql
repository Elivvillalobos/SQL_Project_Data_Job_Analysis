/*
Answer: What are the most optimal skills to learn (aka it's in high demand and a high-paying skill)? 
Identify skills in high demand and associated with high average salaries for Data Analyst roles 
Concentrates on remote positions with specified salaries
Why? Targets skills that offer job security (high demand) and financial benefits (high salaries),
offering strategic insights for career development in data analysis
*/

WITH skill_demand AS (
    SELECT
        skills_dim.skill_id,
        skills_dim.skills,
        COUNT(skills_job_dim.job_id) AS demand_count
    FROM job_postings_fact
    INNER JOIN skills_job_dim
        ON skills_job_dim.job_id = job_postings_fact.job_id
    INNER JOIN skills_dim
        ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst'
        AND job_work_from_home = TRUE
        AND salary_year_avg IS NOT NULL
    GROUP BY
        skills_dim.skill_id,
        skills_dim.skills
),

average_salary AS (
    SELECT
        skills_dim.skill_id,
        skills_dim.skills,
        ROUND(AVG(salary_year_avg), 0) AS year_avg
    FROM job_postings_fact
    INNER JOIN skills_job_dim
        ON skills_job_dim.job_id = job_postings_fact.job_id
    INNER JOIN skills_dim
        ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst'
        AND salary_year_avg IS NOT NULL
    GROUP BY
        skills_dim.skill_id,
        skills_dim.skills
)

SELECT
    skill_demand.skill_id,
    skill_demand.skills,
    skill_demand.demand_count,
    average_salary.year_avg
FROM skill_demand
INNER JOIN average_salary
    ON skill_demand.skill_id = average_salary.skill_id
ORDER BY
    demand_count DESC,
    year_avg DESC;


  