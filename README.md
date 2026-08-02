# Introduction

📊 In this repository you will see an analysis of the data job market. It analyses, according to each job what are the top.paying jobs, what are the most in demand skills and what skill leads to the higest paying jobs.

You can see the queries used here: [project_sql](/project_sql/).

# Background

It could be hard to navigate in the Data Job Market with so many option out there, but, what are the most in demand jobs, what skills should I develope first, I It going to lead to a good remuneration?

This proyect is based in the [SQL Course](https://www.youtube.com/watch?v=MOzEvNYvbik) developed  by Luke Barousse, and It  not  just answer this questions, but It also stand as an learning experience for those who are diving in to the Data Job World.

## Questions answered in the queries

1. What are the top-paying data analyst jobs?
2. What skills are required for these top-paying jobs? 
3. What skills are most in demand for data analysts?
4. Which skills are associated with higher salaries? 
5. What are the most optimal skills to learn?

# Tools I Used

- **SQL:** The primary language used to analyze the data and extract valuable insights from the database through queries.
- **PostgreSQL:** Database management system used to store, manage, and query the raw data.
- **Visual Studio Code (VS Code):** Code editor used to write, execute, and manage SQL scripts.
- **Git & GitHub:** Used for version control and to store and share the SQL scripts.

### 1. Top Paying Data Analyst Jobs
To identify the highest-paying data analyst positions, this query filters job listings based on average annual salary and location, with a particular focus on remote opportunities. The analysis highlights the most competitive salary offerings within the data analytics job market.

```     SQL
SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name AS company_name
FROM
    job_postings_fact
LEFT JOIN
    company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 10;
```
## what we got from the analysis n° 1

- **Wide Salary Range**: The top 10 highest-paying data analyst positions in 2023 offered annual salaries ranging from $184,000 to $650,000, demonstrating the significant earning potential within the field.

- **Diverse Employers**: Leading organizations such as SmartAsset, Meta, and AT&T offered some of the highest salaries, highlighting strong demand for data analytics professionals across multiple industries.

- **Variety of Roles**: The results include a broad range of job titles, from Data Analyst to Director of Analytics, reflecting the diversity of career paths and levels of specialization available within the data analytics profession.


# What I Learned

Advanced SQL Querying: Developed complex SQL queries by combining multiple tables through joins and utilizing Common Table Expressions (CTEs) to improve query organization and readability.
Data Aggregation and Analysis: Applied GROUP BY clauses and aggregate functions such as COUNT() and AVG() to summarize, analyze, and extract meaningful insights from large datasets.
Analytical Problem-Solving: Strengthened analytical thinking by translating business questions into efficient SQL queries that generated actionable, data-driven insights.

# Conclusions

The analysis produced several key insights into the data analyst job market:

- **Top-Paying Data Analyst Positions:** Remote data analyst roles offer a broad salary range, with the highest-paying position reaching an annual salary of $650,000, demonstrating the significant earning potential within the field.

- **Skills Required for High-Paying Roles:** The highest-paying positions consistently require advanced proficiency in SQL, highlighting its importance as a core technical skill for career advancement.

- **Most In-Demand Skill:** SQL emerged as the most frequently requested skill across job postings, reinforcing its essential role in the current data analytics job market.

- **Highest-Paying Specialized Skills:** Niche technical skills, such as SVN and Solidity, are associated with the highest average salaries, suggesting that specialized expertise can command a salary premium.

- **Optimal Skill for Career Growth:** SQL stands out by combining high employer demand with strong salary potential, making it one of the most valuable skills for aspiring and experienced data analysts seeking to maximize their career opportunities.

### Closing Thoughts

Working through this project reinforced the importance of SQL as a fundamental skill in the data analytics job market. It allowed me to strengthen my ability to design complex queries, apply analytical logic, and effectively leverage the capabilities of a well-structured database.

Additionally, this experience provided a deeper understanding of the SQL ecosystem, including database management systems, development environments, and version control tools such as GitHub. Overall, this project was a valuable learning experience that allowed me to apply data analysis principles from start to finish while developing the technical skills and best practices required to build a complete, professional data project.

