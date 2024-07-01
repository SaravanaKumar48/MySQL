-- JOINS

SELECT *
FROM employee_demographics;

SELECT *
FROM employee_salary;

-- INNER JOIN

SELECT dem.employee_id,age,occupation
FROM employee_demographics as dem
INNER JOIN employee_salary as sal
	ON dem.employee_id = sal.employee_id
;

--  OUTER JOINS

SELECT *
FROM employee_demographics as dem
LEFT JOIN employee_salary as sal
	ON dem.employee_id = sal.employee_id;
    
SELECT *
FROM employee_demographics as dem
RIGHT JOIN employee_salary as sal
	ON dem.employee_id = sal.employee_id;
    
-- SELF JOIN

SELECT emp1.employee_id as emp_santa,
emp1.first_name as first_name_santa,
emp1.last_name as last_name_santa,
emp2.employee_id as emp_name,
emp2.first_name as first_name_emp,
emp2.last_name as last_name_emp
FROM employee_salary emp1
JOIN employee_salary emp2
	ON emp1.employee_id +1 = emp2.employee_id;

-- JOINING MULTIPLE TABLE TOGETHER

SELECT *
FROM employee_demographics as dem
INNER JOIN employee_salary as sal
	ON dem.employee_id = sal.employee_id
INNER JOIN parks_departments as pd
	ON sal.dept_id = pd.department_id
;
SELECT *
FROM parks_departments;


-- UNION

SELECT first_name,last_name
FROM employee_demographics
UNION
SELECT first_name,last_name
FROM employee_salary;

-- UNION ALL IT DOESN'T ALLOW DUPLICATES

SELECT first_name,last_name
FROM employee_demographics
UNION ALL
SELECT first_name,last_name
FROM employee_salary;

SELECT first_name,last_name, 'OldMan' as label
FROM employee_demographics
WHERE age > 40 AND gender='Male'
UNION
SELECT first_name,last_name, 'Oldlady' as label
FROM employee_demographics
WHERE age > 40 AND gender='Female'
UNION
SELECT first_name,last_name,'highly paid employee' as label
FROM employee_salary
WHERE salary > 70000
ORDER BY first_name,last_name
;

-- STRING FUNCTION

SELECT LENGTH('SKYFALL');

SELECT first_name,LENGTH(first_name)
FROM employee_demographics
ORDER BY 2 
;

SELECT UPPER('sky');
SELECT LOWER('SKY');

SELECT first_name,UPPER(first_name)
FROM employee_demographics
;
-- TRIM 
SELECT TRIM('     SKY      ')
;
SELECT LTRIM('     SKY      ')
;
SELECT RTRIM('     SKY      ')
;


SELECT first_name,LEFT(first_name,4)  -- 4 indicates only four letters will be displayed starting from first name
FROM employee_demographics;

SELECT first_name,RIGHT(first_name,4)  -- 4 indicates only four letters will be displayed ending from first name
FROM employee_demographics;

-- SUBSTRING
SELECT first_name,
LEFT(first_name,4),
RIGHT(first_name,4),
SUBSTRING(first_name,3,2),
birth_date,
SUBSTRING(birth_date,6,2) as birth_month
FROM employee_demographics;

-- REPLACE 

SELECT first_name,REPLACE(first_name,'a','z')
FROM employee_demographics;

-- LOCATE

SELECT LOCATE('X','Alexander') ;-- the'X' is placed in 4 th position of alexander

SELECT first_name,LOCATE('Ann',first_name)
FROM employee_demographics;

-- CONCAT
SELECT first_name,last_name,
CONCAT(first_name,' ',last_name) as full_name
FROM employee_demographics;

