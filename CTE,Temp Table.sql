-- CTEs

WITH CTE_Example as
(
SELECT gender,AVG(salary) avg_sal,MAX(salary) max_sal,MIN(salary) min_sal,COUNT(Salary) count_sal
FROM employee_demographics dem
JOIN employee_salary sal
on dem.employee_id = sal.employee_id
GROUP BY GENDER
)
SELECT AVG(AVG_SAL)
FROM CTE_Example
;
 -- just an example to compare this cte with subqueries to understand the difference
SELECT AVG(avg_sal)
FROM(SELECT gender,AVG(salary) avg_sal,MAX(salary) max_sal,MIN(salary) min_sal,COUNT(Salary) count_sal
FROM employee_demographics dem
JOIN employee_salary sal
on dem.employee_id = sal.employee_id
GROUP BY GENDER
) example_subquery
;

SELECT AVG(avg_sal)  -- this line gives error because it doesnot store in database
FROM CTE_Example ;

-- multiple cte

WITH CTE_Example as
(
SELECT employee_id,gender,birth_date
FROM employee_demographics dem
WHERE birth_date > '1985-01-01'
),
CTE_Example2 as
(
SELECT employee_id,salary
FROM employee_salary
WHERE salary> 50000
)
SELECT *
FROM CTE_Example
JOIN CTE_Example2
ON CTE_Example.employee_id = CTE_Example2.employee_id
;

WITH CTE_Example(Gender,avg_sal,max_salary,min_salary,count_salary) as -- this line is same as previous but we can mention column name within the parenthesis
(
SELECT gender,AVG(salary) avg_sal,MAX(salary) max_sal,MIN(salary) min_sal,COUNT(Salary) count_sal
FROM employee_demographics dem
JOIN employee_salary sal
on dem.employee_id = sal.employee_id
GROUP BY GENDER
)
SELECT *
FROM CTE_Example
;

-- TEMPORARY TABLE -- this tabel only lasts until you close the sql, this temp table will disappear after closing the sql app

CREATE TEMPORARY TABLE temp_table
(first_name varchar(50),
last_name varchar(50),
fav_movie varchar(100)
);

SELECT *
FROM temp_table;

INSERT INTO temp_table 
VALUES('saravana' ,'kumar','sherlock');

SELECT *
FROM temp_table;

SELECT *
FROM employee_salary;

CREATE TEMPORARY TABLE salary_over_50k
SELECT *
FROM employee_salary
WHERE salary >= 50000;

SELECT *
FROM salary_over_50k ;



