-- Day 09 SQL 


-- Create Department table
CREATE TABLE Departmentt (
    id INT PRIMARY KEY,
    name VARCHAR(50)
);

-- Insert values into Department table
INSERT INTO Departmentt (id, name) VALUES
(1, 'IT'),
(2, 'Sales');

-- Create Employee table
CREATE TABLE Employee1 (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    salary INT,
    departmentId INT,
    FOREIGN KEY (departmentId) REFERENCES Departmentt(id)
);

-- Insert additional records into Employee table
INSERT INTO Employee1 (id, name, salary, departmentId) VALUES
(8, 'Alice', 75000, 2),
(9, 'Bob', 82000, 2),
(10, 'Carol', 78000, 1),
(11, 'David', 70000, 1),
(12, 'Eva', 85000, 2),
(13, 'Frank', 72000, 1),
(14, 'Gina', 83000, 1),
(15, 'Hank', 68000, 1),
(16, 'Irene', 76000, 2),
(17, 'Jack', 74000, 2),
(18, 'Kelly', 79000, 1),
(19, 'Liam', 71000, 1),
(20, 'Molly', 77000, 2),
(21, 'Nathan', 81000, 1),
(22, 'Olivia', 73000, 2),
(23, 'Peter', 78000, 1),
(24, 'Quinn', 72000, 1),
(25, 'Rachel', 80000, 2),
(26, 'Steve', 75000, 2),
(27, 'Tina', 79000, 1);






/*
-- Question Day-09/30
Find Department's Top three 
salaries in each department.

Table: department

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |  id is primary key
| name        | varchar |	department_name
+-------------+---------+

Table: employee
+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| id           | int     |		id is the primary key
| name         | varchar |
| salary       | int     |
| departmentId | int     |		departmentId is the foreign key	
+--------------+---------+
*/
 /*A company's executives are interested in seeing who earns the most 
 money in each of the company's departments. 
 A high earner in a department is an employee 
 who has a salary in the top three unique salaries 
 for that department.

-- Write a solution to find the employees 
who are high earners in each of the departments.*/

--Solution:

WITH top_3_employee AS (
    SELECT
    e.name AS employee_name,
    d.name AS department_name,
    salary,
    DENSE_RANK() OVER(PARTITION BY d.name ORDER BY salary DESC) AS Salary_rank
    FROM
        employee1 AS e
        JOIN
        departmentt AS d
        ON
        e.departmentid = d.id
)
SELECT
    employee_name,
    department_name,
    salary
FROM
    top_3_employee
WHERE
    salary_rank <=3
;