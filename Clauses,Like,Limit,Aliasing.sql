  -- WHERE CLAUSE

SELECT * 
FROM employee_salary
WHERE first_name = 'Leslie'
;

SELECT * 
FROM employee_salary
WHERE salary >= 50000
;

SELECT * 
FROM employee_demographics
WHERE birth_date > '1985-01-01'
;
-- AND OR NOT --LOGICAL OPERATORS
SELECT * 
FROM employee_demographics
WHERE birth_date > '1985-01-01'
AND gender='male';

SELECT * 
FROM employee_demographics
WHERE birth_date > '1985-01-01'
OR NOT gender='male';

SELECT * 
FROM employee_demographics
WHERE (first_name='Leslie' AND age=44) OR age>55
;

-- LIKE STATEMENT
-- % AND _
SELECT * 
FROM employee_demographics
WHERE first_name LIKE 'a%'
;
SELECT * 
FROM employee_demographics
WHERE first_name LIKE 'a__'
;

-- group by

SELECT gender, avg(age),max(age),min(age),count(age)
FROM employee_demographics
GROUP BY gender
;

SELECT occupation,salary
FROM employee_salary
GROUP BY occupation,salary
;

-- ORDER BY
SELECT *
FROM employee_demographics
ORDER BY gender,age 
;

SELECT *
FROM employee_demographics
ORDER BY 4,5  -- order by number
;

-- HAVING AND WHERE

SELECT gender,AVG(age)
FROM employee_demographics
GROUP BY gender
HAVING avg(age);

SELECT occupation,AVG(salary)
FROM employee_salary
WHERE occupation LIKE '%manager'
GROUP BY occupation
HAVING AVG(salary) > 75000 ;-- having clause has been used after data aggregated

-- LIMIT AND ALIASING

SELECT  *
FROM employee_demographics
ORDER BY AGE 
LIMIT 5,3 -- This line limit 2,1 indicates after 5th row then 3 rows will be displayed
;

-- aliasing change the name of the column

SELECT gender ,avg(age) as avg_age -- we can also use this aliasing by giving space after column name
FROM employee_demographics
GROUP BY gender
HAVING AVG(age) > 40
