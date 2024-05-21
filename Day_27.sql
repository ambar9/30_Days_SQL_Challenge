-- 27/30 

-- SCHEMAS

DROP TABLE IF EXISTS orders;

-- Create the orders table
CREATE TABLE orders5 (
    user_id INT,
    item_ordered VARCHAR(512)
);

-- Insert sample data into the orders table
INSERT INTO orders5 VALUES 
('1', 'Pizza'),
('1', 'Burger'),
('2', 'Cold Drink'),
('2', 'Burger'),
('3', 'Burger'),
('3', 'Cold Drink'),
('4', 'Pizza'),
('4', 'Cold Drink'),
('5', 'Cold Drink'),
('6', 'Burger'),
('6', 'Cold Drink'),
('7', 'Pizza'),
('8', 'Burger');

-- Flipkart Data Analyst Interview Questions
-- Question: Write an SQL query to fetch user IDs that have only bought both 'Burger' and 'Cold Drink' items.

-- Expected Output Columns: user_id

WITH CTE AS(
SELECT
    user_id,
    COUNT(DISTINCT(CASE WHEN item_ordered IN ('Burger','Cold Drink') THEN item_ordered END)) AS distinct_target_items,
    COUNT(DISTINCT item_ordered) AS distinct_total_items
FROM
    orders5
GROUP BY
    user_id
)

SELECT
    user_id
FROM
    CTE
WHERE
    distinct_target_items = 2
    AND
    distinct_total_items = 2
ORDER BY
    user_id;



