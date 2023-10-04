/* TASK 1 */
DELIMITER $$
CREATE PROCEDURE employer_application_top5_salary(OUT vacancy_name VARCHAR(45), OUT vacancy_salary INT)
BEGIN
	SELECT vacancy.name, employer_application.salary FROM employer_application
    JOIN vacancy ON vacancy.vacancy_id = employer_application.vacancy_id
    ORDER BY employer_application.salary DESC LIMIT 5;
END$$
DELIMITER ;

/* TASK 2 */
DELIMITER $$
CREATE FUNCTION get_employee_full_name(employee_id INT) RETURNS VARCHAR(45)
READS SQL DATA
BEGIN
	DECLARE full_name VARCHAR(45) default "";
	SELECT concat(employee.second_name, " ", employee.first_name, " ", COALESCE(employee.patronymic, "")) INTO full_name
	FROM employee
	WHERE employee_id = employee.employee_id;
	RETURN full_name;
END$$
DELIMITER ;

/* TASK 3 */
DELIMITER $$
CREATE FUNCTION get_avg_employer_salary() RETURNS INT
READS SQL DATA
BEGIN
	DECLARE avg_salary INT DEFAULT 0;
	SELECT sum(employer_application.salary) / count(employer_application.employer_id) INTO avg_salary
	FROM employer_application;
	RETURN avg_salary;
END$$
DELIMITER ;

/* TASK 4 */
DELIMITER $$
CREATE FUNCTION this_year_application(application_date DATE) RETURNS VARCHAR(45)
READS SQL DATA
BEGIN
	CASE
		WHEN year(application_date) < year(curdate())
			THEN RETURN "Oh, it's too old!";
		WHEN application_date > curdate()
			THEN RETURN "Eh... You seem to be from the future";
		ELSE RETURN "That's it!";
	END CASE;
END$$
DELIMITER ;

/* TASK 5 */
DELIMITER $$
CREATE PROCEDURE aggr_employee (OUT avg_salary FLOAT, OUT avg_work_exp FLOAT, 
								OUT min_salary INT, OUT min_work_exp INT,
                                OUT max_salary INT, OUT max_work_exp INT)
BEGIN
	DECLARE cur_salary INT DEFAULT 0;
	DECLARE cur_work_exp INT DEFAULT 0;
	DECLARE sum_salary INT DEFAULT 0;
	DECLARE sum_work_exp INT DEFAULT 0;
    DECLARE employee_count INT DEFAULT 0;
    DECLARE finished INT DEFAULT 0;
    
	DECLARE employee_cursor CURSOR FOR
	SELECT employee.salary, employee.work_experience FROM employee;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;
    OPEN employee_cursor;
    
    agg_loop: loop
		FETCH employee_cursor INTO cur_salary, cur_work_exp;
        
		IF finished THEN
			LEAVE agg_loop;
		END IF;
        
        IF employee_count = 0 THEN
			SET sum_salary = cur_salary;
            SET min_salary = cur_salary;
            SET max_salary = cur_salary;
            SET sum_work_exp = cur_work_exp;
            SET min_work_exp = cur_work_exp;
            SET max_work_exp = cur_work_exp;
		ELSE
			IF cur_salary < min_salary THEN
				SET min_salary = cur_salary;
            END IF;
            
            IF cur_salary > max_salary THEN
				SET max_salary = cur_salary;
            END IF;
            
            SET sum_salary = sum_salary + cur_salary;
            
            IF cur_work_exp < min_work_exp THEN
				SET min_work_exp = cur_work_exp;
            END IF;
            
            IF cur_work_exp > max_work_exp THEN
				SET max_work_exp = cur_work_exp;
            END IF;
            
            SET sum_work_exp = sum_work_exp + cur_work_exp;
		END IF;
		SET employee_count = employee_count + 1;
    END LOOP agg_loop;
	CLOSE employee_cursor;
    
    SET avg_salary = sum_salary / employee_count;
    SET avg_work_exp = sum_work_exp / employee_count;
END$$
DELIMITER ;

/* TASK 6 */
DELIMITER $$
CREATE PROCEDURE aggr_employee_short (OUT avg_salary FLOAT, OUT avg_work_exp FLOAT, 
								OUT min_salary INT, OUT min_work_exp INT,
                                OUT max_salary INT, OUT max_work_exp INT)
BEGIN   
	SELECT avg(employee.salary), avg(employee.work_experience), 
		   min(employee.salary), min(employee.work_experience),
           max(employee.salary), max(employee.work_experience)
	INTO avg_salary, avg_work_exp, min_salary, min_work_exp, max_salary, max_work_exp
	FROM employee;
END$$
DELIMITER ;