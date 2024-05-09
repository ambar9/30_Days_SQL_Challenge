-- Leetcode problem LeetCode SQL Premium Problem 2853: 'Highest Salary Difference'


-- DDL for Salaries table
CREATE TABLE Salaries (
emp_name VARCHAR(50),
department VARCHAR(50),
salary INT,
PRIMARY KEY (emp_name, department)
);

-- DML for Salaries table
INSERT INTO Salaries (emp_name, 
					  department, salary) VALUES
('Kathy', 'Engineering', 50000),
('Roy', 'Marketing', 30000),
('Charles', 'Engineering', 45000),
('Jack', 'Engineering', 85000),
('Benjamin', 'Marketing', 34000),
('Anthony', 'Marketing', 42000),
('Edward', 'Engineering', 102000),
('Terry', 'Engineering', 44000),
('Evelyn', 'Marketing', 53000),
('Arthur', 'Engineering', 32000);


/*
Write an SQL query to calculate the difference 
between the highest salaries 
in the marketing and engineering department. 
Output the absolute difference in salaries.
*/

--Method1:

WITH departments_split AS(
SELECT
    CASE WHEN department = 'Marketing' THEN salary END AS Marketing_Salaries,
    CASE WHEN department = 'Engineering' THEN salary END AS Engineering_Salaries
FROM
    Salaries)
    
SELECT
    ABS(MAX(Marketing_Salaries) - MAX(Engineering_Salaries)) AS absolute_difference
FROM
    departments_split;


--Method2:

Solution with CTE
WITH cte AS(
SELECT salary, RANK() OVER(PARTITION BY department ORDER BY salary DESC) AS rk FROM Salaries
)
SELECT (MAX(salary) - MIN(salary)) AS Salary_diff FROM cte WHERE rk = 1;







-- Message Table

CREATE TABLE messages (
    message_id INT,
    sender_id INT,
    receiver_id INT,
    content VARCHAR(255),
    sent_date TIMESTAMP,
    PRIMARY KEY (message_id)
);

INSERT INTO messages (message_id, sender_id, receiver_id, content, sent_date) VALUES
(901, 3601, 4500, 'You up?', '2022-08-03 16:43:00'),
(743, 3601, 8752, 'Let''s take this offline', '2022-06-14 14:30:00'),
(888, 3601, 7855, 'DataLemur has awesome user base!', '2022-08-12 08:45:00'),
(100, 2520, 6987, 'Send this out now!', '2021-08-16 00:35:00'),
(898, 2520, 9630, 'Are you ready for your upcoming presentation?', '2022-08-13 14:35:00'),
(990, 2520, 8520, 'Maybe it was done by the automation process.', '2022-08-19 06:30:00'),
(819, 2310, 4500, 'What''s the status on this?', '2022-07-10 15:55:00'),
(922, 3601, 4500, 'Get on the call', '2022-08-10 17:03:00'),
(942, 2520, 3561, 'How much do you know about Data Science?', '2022-08-17 13:44:00'),
(966, 3601, 7852, 'Meet me in five!', '2022-08-17 02:20:00'),
(902, 4500, 3601, 'Only if you''re buying', '08/03/2022 06:50:00');

/*
Write a query to identify the top 2 Power Users who sent the highest number of messages on Microsoft Teams 
in August 2022. 
Display the IDs of these 2 users along with the total number of messages they sent. 
Output the results in descending order based on the count of the messages.

Assumption:

No two users have sent the same number of messages in August 2022.*/



SELECT
    sender_id,
    COUNT(message_id) AS message_count
FROM 
    messages
WHERE
    EXTRACT(MONTH FROM sent_date) = 08
    AND
    EXTRACT(YEAR FROM sent_date) = 2022
GROUP BY
    sender_id
ORDER BY
    message_count DESC
LIMIT 2;