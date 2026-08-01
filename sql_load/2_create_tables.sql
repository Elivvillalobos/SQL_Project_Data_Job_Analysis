-- Create company_dim table with primary key
CREATE TABLE public.company_dim
(
    company_id INT PRIMARY KEY,
    name TEXT,
    link TEXT,
    link_google TEXT,
    thumbnail TEXT
);

-- Create skills_dim table with primary key
CREATE TABLE public.skills_dim
(
    skill_id INT PRIMARY KEY,
    skills TEXT,
    type TEXT
);

-- Create job_postings_fact table with primary key
CREATE TABLE public.job_postings_fact
(
    job_id INT PRIMARY KEY,
    company_id INT,
    job_title_short VARCHAR(255),
    job_title TEXT,
    job_location TEXT,
    job_via TEXT,
    job_schedule_type TEXT,
    job_work_from_home BOOLEAN,
    search_location TEXT,
    job_posted_date TIMESTAMP,
    job_no_degree_mention BOOLEAN,
    job_health_insurance BOOLEAN,
    job_country TEXT,
    salary_rate TEXT,
    salary_year_avg NUMERIC,
    salary_hour_avg NUMERIC,
    FOREIGN KEY (company_id) REFERENCES public.company_dim (company_id)
);

-- Create skills_job_dim table with a composite primary key and foreign keys
CREATE TABLE public.skills_job_dim
(
    job_id INT,
    skill_id INT,
    PRIMARY KEY (job_id, skill_id),
    FOREIGN KEY (job_id) REFERENCES public.job_postings_fact (job_id),
    FOREIGN KEY (skill_id) REFERENCES public.skills_dim (skill_id)
);

-- Set ownership of the tables to the postgres user
ALTER TABLE public.company_dim OWNER to postgres;
ALTER TABLE public.skills_dim OWNER to postgres;
ALTER TABLE public.job_postings_fact OWNER to postgres;
ALTER TABLE public.skills_job_dim OWNER to postgres;

-- Create indexes on foreign key columns for better performance
CREATE INDEX idx_company_id ON public.job_postings_fact (company_id);
CREATE INDEX idx_skill_id ON public.skills_job_dim (skill_id);
CREATE INDEX idx_job_id ON public.skills_job_dim (job_id);


SELECT 
        '2023-02-19':: DATE,
        '123':: INTEGER,
        'true':: BOOLEAN,
        '3.14':: REAL;


SELECT
        job_title_short AS title,
        job_location AS location,
        job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST' AS date,
        EXTRACT (MONTH FROM job_posted_date) AS date_month,
        EXTRACT (YEAR FROM job_posted_date) AS date_year
FROM
    job_postings_fact
LIMIT 5;


SELECT 
        COUNT (job_id) AS job_posted_count,
        EXTRACT (MONTH FROM job_posted_date) AS month
FROM
    job_postings_fact
WHERE 
    job_title_short = 'Data Analyst'
GROUP BY 
        month
ORDER BY
        job_posted_count DESC;


--Practice problems 1

SELECT
    AVG (salary_year_avg) AS year_avg,
    AVG (salary_hour_avg) AS hour_avg,
    job_schedule_type,
FROM
    job_postings_fact
WHERE
    job_posted_date > DATE '2023-06-01'
GROUP BY
    job_schedule_type
LIMIT 50;

SELECT
    job_schedule_type,
    AVG(salary_year_avg) AS salary_year_avg,
    AVG(salary_hour_avg) AS salary_hour_avg
FROM job_postings_fact
WHERE job_posted_date > DATE '2023-06-01'
GROUP BY job_schedule_type;

--Practice problem 2

SELECT
    EXTRACT(
        MONTH FROM (
            job_posted_date AT TIME ZONE 'UTC'
            AT TIME ZONE 'America/New_York'
        )
    ) AS month,
    COUNT(*) AS n_jobs
FROM job_postings_fact
WHERE job_posted_date >= '2023-01-01'
  AND job_posted_date < '2024-01-01'
GROUP BY month
ORDER BY month;
    

--Practice problem 3

SELECT DISTINCT
    company_dim.name AS company_name
    
FROM 
    job_postings_fact
LEFT JOIN  
    company_dim ON company_dim.company_id = job_postings_fact.company_id
WHERE
    job_health_insurance = True AND
    (EXTRACT (MONTH FROM job_posted_date) BETWEEN 4 AND 6)



