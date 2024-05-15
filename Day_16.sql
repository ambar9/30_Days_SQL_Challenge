-- 16/30 Days SQL Challenge 

-- TikTok Interview Question for data analyst

-- Create TikTok table
CREATE TABLE tiktok (
					views INT
);


-- Insert records
-- Insert records into the tiktok table
INSERT INTO tiktok (views) 
VALUES 
	(100), (800), (350), 
	(150), (600), 
	(700), (700), (950);

/*
-- Tik Tok Data Analyst Interview question

Q.1 Find the median within a series of numbers in SQL ;


*/

-- METHOD1:

WITH CTE AS(
SELECT  
    views,
    ROW_NUMBER() OVER(ORDER BY views ASC) AS rn_asc,
    ROW_NUMBER() OVER(ORDER BY views DESC) AS rn_desc
FROM
    tiktok
)
    
SELECT
    ROUND(AVG(views),0) AS median
FROM
    CTE
WHERE
    ABS(rn_asc - rn_desc) <=1;


--METHOD -2:

WITH ordered_numbers AS (
    SELECT
        views,
        ROW_NUMBER() OVER (ORDER BY views) AS row_num,
        COUNT(*) OVER() AS total_rows
    FROM
        tiktok
    WHERE
        views < 900
)
SELECT
    ROUND(AVG(views),0) AS median
FROM
    ordered_numbers
WHERE
    row_num = (total_rows + 1) / 2
    OR row_num = (total_rows + 2) / 2;