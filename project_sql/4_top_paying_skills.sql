/* 
    Question: What are the top skills based on salary?
*/

SELECT 
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id 
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
  --AND job_work_from_home = TRUE
GROUP BY skills
ORDER BY avg_salary DESC
LIMIT 25;

/*

Here's a breakdown of the results for top paying skills
- Big Data & Engineering Skills Pay Most: Tools like PySpark, Databricks, and Airflow top the list, showing high demand for analysts who can handle large-scale data processing and pipelines.
- DevOps & Collaboration Tools Matter: Skills in GitLab, Bitbucket, Jenkins, and Atlassian suggest that data analysts who understand version control and team workflows earn more.
- ML & Programming Knowledge Boosts Pay: Familiarity with Python libraries (Pandas, NumPy, Scikit-learn) and languages like Scala and Go adds strong value, bridging analysis with modeling and development.

*/