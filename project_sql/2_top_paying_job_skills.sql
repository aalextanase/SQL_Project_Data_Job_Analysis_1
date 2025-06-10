/* 
    Question: What skills are required for the top-paying data analyst jobs?
*/

WITH top_paying_jobs AS (

    SELECT
        job_id,
        job_title,
        salary_year_avg,
        name AS company_name
    FROM   
        job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE
        job_title_short = 'Data Analyst' AND 
        job_location = 'Anywhere' AND
        salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT 10
)

-- if there is a job that doesn't have any skills it's not useful, since -->  INNER JOIN
SELECT 
    top_paying_jobs.*,
    skills 
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id 
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
ORDER BY 
    salary_year_avg DESC;

/*
    Key Insights:
- SQL and Python are the most in-demand core skills.
- Tableau and R remain important for data visualization and statistical analysis.
- Snowflake, Pandas, and Excel indicate a focus on data wrangling and cloud data platforms.
- Bitbucket and Azure suggest that version control and cloud knowledge are valued.
*/