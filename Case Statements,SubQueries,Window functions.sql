-- CASE STATEMENT

SELECT first_name,
last_name,
CASE
	WHEN age<=30 THEN 'Young'
    WHEN age BETWEEN 31 and 50 THEN 'Old'
    WHEN age >=50 THEN 'Too Old'
END as Age_bracket
FROM employee_demographics;

-- Pay increases and Bonus
-- < 50000 = 5%
-- > 50000 = 7%
-- Finance = 10% bonus

SELECT first_name,last_name,salary,
CASE
	WHEN salary < 50000 THEN salary+(salary * 0.05) 
    WHEN salary > 50000 THEN salary+(salary * 0.07)
END AS New_Salary,
CASE
	WHEN dept_id = 6 THEN salary * 0.10
END AS Bonus
FROM employee_salary;

-- SUB QUERIES

SELECT *
FROM employee_demographics
WHERE employee_id IN
					(SELECT employee_id
						FROM employee_salary
                        WHERE dept_id = 1)
;

SELECT first_name,salary,
		(SELECT AVG(salary)
         FROM employee_salary)
FROM employee_salary
;

SELECT gender,AVG(age),MAX(age),MIN(age),COUNT(age)
FROM employee_demographics
GROUP BY gender;

SELECT AVG(max_age)
FROM (SELECT gender,
AVG(age) AS avg_age,
MAX(age) AS max_age,
MIN(age) AS min_age,
COUNT(age) AS count_age
FROM employee_demographics
GROUP BY gender) AS Agg_table
;

-- WINDOW FUNCTION

SELECT gender,AVG(salary) AS avg_salary
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id=sal.employee_id
GROUP BY gender;

SELECT dem.first_name,dem.last_name,AVG(salary) OVER(PARTITION BY gender)
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id=sal.employee_id
;

SELECT dem.first_name,dem.last_name,gender,salary,
SUM(salary) OVER(PARTITION BY gender ORDER BY dem.employee_id) AS Rolling_Total
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id=sal.employee_id
;

SELECT dem.employee_id,dem.first_name,dem.last_name,gender,salary,
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC) AS row_num, -- it just create a row number
RANK()OVER(PARTITION BY gender ORDER BY salary DESC) AS Rank_num, -- it gives rank number 
DENSE_RANK()OVER(PARTITION BY gender ORDER BY salary DESC) AS Dense_Rank_num --
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id=sal.employee_id
;
