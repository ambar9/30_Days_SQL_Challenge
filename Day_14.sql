-- SQL Challenge 14/30 Days 

CREATE TABLE job_listings (
    job_id INTEGER PRIMARY KEY,
    company_id INTEGER,
    title TEXT,
    description TEXT
);

INSERT INTO job_listings (job_id, company_id, title, description)
VALUES
    (248, 827, 'Business Analyst', 'Business analyst evaluates past and current business data with the primary goal of improving decision-making processes within organizations.'),
    (149, 845, 'Business Analyst', 'Business analyst evaluates past and current business data with the primary goal of improving decision-making processes within organizations.'),
    (945, 345, 'Data Analyst', 'Data analyst reviews data to identify key insights into a business''s customers and ways the data can be used to solve problems.'),
    (164, 345, 'Data Analyst', 'Data analyst reviews data to identify key insights into a business''s customers and ways the data can be used to solve problems.'),
    (172, 244, 'Data Engineer', 'Data engineer works in a variety of settings to build systems that collect, manage, and convert raw data into usable information for data scientists and business analysts to interpret.'),
    (573, 456, 'Software Engineer', 'Software engineer designs, develops, tests, and maintains software applications.'),
    (324, 789, 'Software Engineer', 'Software engineer designs, develops, tests, and maintains software applications.'),
    (890, 123, 'Data Scientist', 'Data scientist analyzes and interprets complex data to help organizations make informed decisions.'),
    (753, 123, 'Data Scientist', 'Data scientist analyzes and interprets complex data to help organizations make informed decisions.');


/*
-- Q.1 LinkedIn Data Analyst Interview question 

Assume you're given a table containing job postings 
from various companies on the LinkedIn platform. 
Write a query to retrieve the count of companies
that have posted duplicate job listings.

Definition:

Duplicate job listings are defined as two job listings 
within the same company that share identical titles and descriptions.
*/

WITH CTE AS (
    SELECT
        company_id,
        title,
        description,
        COUNT(job_id) AS identical_jobs
    FROM
        job_listings
    GROUP BY
        company_id,
        title,
        description
)
SELECT
     count(1) AS how_many_companies
FROM
    CTE
WHERE 
    identical_jobs > 1;