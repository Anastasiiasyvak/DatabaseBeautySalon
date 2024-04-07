-- Procedure for retrieving employee details by employee ID
DELIMITER $$
CREATE PROCEDURE employee_details_by_id(IN emp_id INT)
BEGIN
    SELECT name, phone, email, position, salary FROM employee WHERE id = emp_id;
END $$
DELIMITER ;

-- Procedure to obtain total product quantity and average product cost
DELIMITER $$
CREATE PROCEDURE total_quantity_and_avg_cost(OUT total_quantity INT, OUT avg_cost DOUBLE)
BEGIN
    SELECT SUM(quantity) INTO total_quantity FROM product;
    SELECT AVG(cost) INTO avg_cost FROM product;
END $$
DELIMITER ;

-- Procedure for changing an employee's position and calculating a new average salary
DELIMITER $$
CREATE PROCEDURE update_position_and_avg_salary(INOUT avg_salary DOUBLE, IN emp_id INT, IN new_position VARCHAR(255))
BEGIN
    DECLARE old_salary DOUBLE;

    START TRANSACTION;

    SELECT salary INTO old_salary FROM employee WHERE id = emp_id;
    UPDATE employee SET position = new_position WHERE id = emp_id;

    IF new_position = 'Administrator' THEN
        SET avg_salary = (SELECT AVG(salary) FROM employee); 
    END IF;

    COMMIT;

    SELECT name, position, salary FROM employee WHERE id = emp_id;
END $$
DELIMITER ;

