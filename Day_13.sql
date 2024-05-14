-- 13/30 SQL Challenge

-- Facebook medium level SQL question for Data Analyst 


-- Q.1 SCHEMAS

CREATE TABLE fb_posts (
    post_id INT PRIMARY KEY,
    user_id INT,
    likes INT,
    comments INT,
    post_date DATE
);


INSERT INTO fb_posts (post_id, user_id, likes, comments, post_date) VALUES
(1, 101, 50, 20, '2024-02-27'),
(2, 102, 30, 15, '2024-02-28'),
(3, 103, 70, 25, '2024-02-29'),
(4, 101, 80, 30, '2024-03-01'),
(5, 102, 40, 10, '2024-03-02'),
(6, 103, 60, 20, '2024-03-03'),
(7, 101, 90, 35, '2024-03-04'),
(8, 101, 90, 35, '2024-03-05'),
(9, 102, 50, 15, '2024-03-06'),
(10, 103, 30, 10, '2024-03-07'),
(11, 101, 60, 25, '2024-03-08'),
(12, 102, 70, 30, '2024-03-09'),
(13, 103, 80, 35, '2024-03-10'),
(14, 101, 40, 20, '2024-03-11'),
(15, 102, 90, 40, '2024-03-12'),
(16, 103, 20, 5, '2024-03-13'),
(17, 101, 70, 25, '2024-03-14'),
(18, 102, 50, 15, '2024-03-15'),
(19, 103, 30, 10, '2024-03-16'),
(20, 101, 60, 20, '2024-03-17');

/*
-- Q.1
Question: Identify the top 3 posts with the highest engagement 
(likes + comments) for each user on a Facebook page. Display 
the user ID, post ID, engagement count, and rank for each post.
*/

WITH CTE AS(
    SELECT
        user_id,
        post_id,
        (likes + comments) AS engagement_count,
        DENSE_RANK() OVER(PARTITION BY user_id ORDER BY (likes + comments) DESC) AS post_rank
    FROM
        fb_posts
    GROUP BY
        user_id,
        post_id
)
SELECT
    user_id,
    post_id,
    engagement_count,
    post_rank
FROM
    CTE
WHERE
    post_rank <= 3
ORDER BY
    user_id,
    engagement_count DESC;



-- Question2:


-- Schemas for Q.2

CREATE TABLE posts (
    post_id INT PRIMARY KEY,
    user_id INT,
    likes INT,
    post_date DATE
);

INSERT INTO posts (post_id, user_id, likes, post_date) VALUES
(1, 101, 50, '2024-02-27'),
(2, 102, 30, '2024-02-28'),
(3, 103, 70, '2024-02-29'),
(4, 101, 80, '2024-02-01'),
(5, 102, 40, '2024-02-02'),
(6, 103, 60, '2024-02-29'),
(7, 101, 90, '2024-01-29'),
(8, 101, 20, '2024-02-05'),
(9, 102, 50, '2024-01-29'),
(10, 103, 30, '2024-02-29'),
(11, 101, 60, '2024-01-08'),
(12, 102, 70, '2024-01-09'),
(13, 103, 80, '2024-01-10'),
(14, 101, 40, '2024-01-29'),
(15, 102, 90, '2024-01-29'),
(16, 103, 20, '2024-01-13'),
(17, 101, 70, '2024-01-14'),
(18, 102, 50, '2024-02-29'),
(19, 103, 30, '2024-02-16'),
(20, 101, 60, '2024-02-17');

/*
-- Q.2

Determine the users who have posted more than 2 times 
in the past week and calculate the total number of likes
they have received. Return user_id and number of post and no of likes
*/

SELECT
    user_id,
    COUNT(post_id) AS number_of_post,
    SUM(likes) AS total_likes
FROM
    posts
WHERE
    post_date >= '2024-02-27'  --post_date >= CURRENT_DATE - 7 AND post_date < CURRENT_DATE
    AND
    post_date < '2024-03-07'
GROUP BY
    user_id
HAVING
    COUNT(post_id) > 2
ORDER BY
    user_id;