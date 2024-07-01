-- STORED PROCEDURES ->way to store sql queries and can reuse everywhere
SELECT *
FROM employee_salary
WHERE salary>=50000
;

CREATE PROCEDURE large_salaries()
SELECT *
FROM employee_salary
WHERE salary>=50000
;

CALL large_salaries(); -- after use stored procedure we can view tables by using CALL and table name

DELIMITER $$
CREATE PROCEDURE large_salaries3()
BEGIN
	SELECT *
	FROM employee_salary
	WHERE salary>=50000;
	SELECT *
	FROM employee_salary
	WHERE salary>=10000;
END $$
DELIMITER ;

CALL large_salaries3();

DELIMITER $$
CREATE PROCEDURE large_salaries4(p_employee_id INT)
BEGIN
	SELECT salary
	FROM employee_salary
    WHERE employee_id=p_employee_id
	;
	
END $$
DELIMITER ;

CALL large_salaries4(1);

-- TRIGGERS AND EVENTS

SELECT * FROM
employee_demographics;

SELECT * FROM
employee_salary;

DELIMITER $$
CREATE TRIGGER employee_inserts
	AFTER INSERT ON employee_salary
    FOR EACH ROW 
BEGIN
	INSERT INTO employee_demographics(employee_id,first_name,last_name)
    VALUES(NEW.employee_id,NEW.first_name,NEW.last_name);
END $$
DELIMITER ;
    
INSERT INTO employee_salary (employee_id,first_name,last_name,occupation,salary,dept_id)
VALUES(13,'Jean_Ralphio','Sapersstein','Entertainment 720 CEO',1000000,NULL);

DROP TRIGGER IF EXISTS -- Do not run this
employee_insert;

DROP TRIGGER IF EXISTS -- Do not run this
employee_inserts;

-- EVENTS -> a event happen if triggers take place,it is an automation task

SELECT *
FROM employee_demographics;


DELIMITER $$
CREATE EVENT delete_retirees
ON SCHEDULE EVERY 30 SECOND
DO
BEGIN
	DELETE
	FROM employee_demographics
    WHERE AGE >=60;
END $$
DELIMITER ;

DROP EVENT IF EXISTS -- Do not run this
delete_retirees

SHOW VARIABLES LIKE 'event%'; -- to check the event is on or off

    
    
    
