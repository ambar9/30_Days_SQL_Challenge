-- --  Day 19/30 SQL Challenge

-- Google Interview Question for DA

CREATE TABLE student_names(
    student_id INT,
    name VARCHAR(50)
);

-- Insert the records
INSERT INTO student_names (student_id, name) VALUES
(1, 'RAM'),
(2, 'ROBERT'),
(3, 'ROHIM'),
(4, 'RAM'),
(5, 'ROBERT');


-- Question 


-- Get the count of distint student that are not unique 

WITH CTE AS (
    SELECT
        name,
        COUNT(name) AS name_count
    FROM
        student_names
    GROUP BY
        name
    HAVING 
    COUNT(name) > 1
)
SELECT
    COUNT(DISTINCT name) AS distinct_name_count
FROM
    CTE;