-- Call the procedure to retrieve employee details with identifier 1
CALL employee_details_by_id(1);
-- Expected result: Return details of the employee with identifier 1

-- Call the procedure to retrieve the total quantity of product and the average cost of product
CALL total_quantity_and_avg_cost(@total_quantity, @avg_cost);
-- Expected result: Values of variables @total_quantity and @avg_cost are populated with the total quantity of product and the average cost of product respectively

-- Call the procedure to update the quantity of product and calculate the new average cost
CALL update_quantity_and_avg_cost(@avg_cost, 3, 10);
-- Expected result: Update the quantity of product with identifier 3 by 10 units. If after the update the quantity becomes negative, the transaction should be rolled back. Otherwise, update the average cost of product and commit the changes.

-- Call the procedure to update the position of the employee and calculate the new average salary
CALL update_position_and_avg_salary(@avg_salary, 2, 'Administrator');
-- Expected result: Change the position of the employee with identifier 2 to "Administrator" and calculate the new average salary for all employees. If the new position is "Administrator", the transaction should be committed, otherwise, it should be rolled back.
