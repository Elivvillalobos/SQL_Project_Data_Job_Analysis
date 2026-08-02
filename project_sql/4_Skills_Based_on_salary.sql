 /*
 What are the top skills based on salary?
• Look at the average salary associated with each skill for Data Analyst positions
• Focuses on roles with specified salaries, regardless of location
Why? It reveals how different skills impact salary levels for Data Analysts and helps identify
the most financially rewarding skills to acquire or improve
*/

SELECT 
    skills,
    ROUND (AVG (salary_year_avg), 0) AS year_avg
 FROM
  job_postings_fact
  INNER JOIN
    skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
    INNER JOIN
    skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
    salary_year_avg IS NOT NULL  AND
    job_title_short = 'Data Analyst'
GROUP BY
    skills
ORDER BY
    year_avg DESC;


/*
Advanced technologies pay more: Skills related to cloud computing,
big data, and machine learning (e.g., Spark, Snowflake, TensorFlow, AWS) are 
associated with the highest average salaries for Data Analysts.
Core skills remain essential: Traditional data analysis tools such
as SQL, Python, Power BI, and Excel are common requirements but tend to have lower
average salaries than more specialized technologies.
Interpret results with caution: Some skills have very high average salaries but may
 appear in only a few job postings. Including the number of postings per skill would
provide a more reliable analysis.
*/