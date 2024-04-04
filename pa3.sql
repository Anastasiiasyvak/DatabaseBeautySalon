--  1) = with non-correlated subqueries result (= з некорельованим результатом підзапитів) SELECT UPDATE DELETE

-- видаляємо всіх клієнтів, які не мають жодного запису у таблиці appointment
DELETE FROM customer
WHERE id NOT IN (
    SELECT id_customer
    FROM appointment
);


-- збільшуємо зарплату працівникам, які надають масаж, на 10%
UPDATE employee
SET salary = salary * 1.1
WHERE id IN (
    SELECT id_employee
    FROM employee_service
    WHERE id_service IN (
        SELECT id
        FROM service
        WHERE name = 'Massage'
    )
);

-- вибираємо всі записи з таблиці appointment, де id_employee відповідає працівникам, які мають позицію "Master of hair styling"
SELECT id, date_time, status
FROM appointment
WHERE id_employee IN (
    SELECT id_employee
    FROM employee
    WHERE position = 'Master of hair styling'
);



-- 2) IN with non-correlated subqueries result

-- Вибираємо всіх клієнтів, які здійснили хоча б один запис у таблиці appointment
SELECT 1
FROM customer
WHERE id IN (
    SELECT id_customer
    FROM appointment
);


-- Збільшуємо зарплату працівникам, які мають позицію "Master of massage" на 10%
UPDATE employee
SET salary = salary * 1.1
WHERE id IN (
    SELECT id_employee
    FROM employee
    WHERE position = 'Master of massage'
);

-- Видаляємо всі записи у таблиці appointment, де статус є "no show"
DELETE FROM appointment
WHERE id IN (
    SELECT id
    FROM appointment
    WHERE status = 'no show'
);

-- 3) NOT IN with non-correlated subqueries result

-- Вибираємо всі продукти, які не були призначені жодній послузі
SELECT 1
FROM product
WHERE id NOT IN (
    SELECT product_id
    FROM services2products
);

-- Видаляємо всі записи про платежі, які не відповідають жодному запису у таблиці appointment
DELETE FROM payment
WHERE id_appointment NOT IN (
    SELECT id
    FROM appointment
);

-- Збільшуємо зарплату всім працівникам, які не надають послугу "Massage" на 5%
UPDATE employee
SET salary = salary * 1.05
WHERE id NOT IN (
    SELECT id_employee
    FROM employee_service
    WHERE id_service IN (
        SELECT id
        FROM service
        WHERE name = 'Massage'
    )
);


-- 4) EXISTS with non-correlated subqueries result

-- Вибираємо всіх клієнтів, які мають хоча б один запис про призначений їм запис
SELECT 1
FROM customer
WHERE EXISTS (
    SELECT 1
    FROM appointment
    WHERE appointment.id_customer = customer.id
);

-- Видаляємо всі записи про послуги, які не мають відповідних записів у таблиці services2products
DELETE FROM service
WHERE NOT EXISTS (
    SELECT 1
    FROM services2products
    WHERE services2products.service_id = service.id
);

-- Збільшуємо зарплату всім працівникам, які надають послугу "Massage" на 10%
UPDATE employee
SET salary = salary * 1.10
WHERE EXISTS (
    SELECT id_employee
    FROM employee_service
    INNER JOIN service ON employee_service.id_service = service.id
    WHERE employee_service.id_employee = employee.id
    AND service.name = 'Massage'
);


-- 5) NOT EXISTS with non-correlated subqueries result


-- Вибираємо всіх клієнтів, які не зробили жодного платежу
SELECT 1
FROM customer
WHERE NOT EXISTS (
    SELECT 1
    FROM appointment
    WHERE appointment.id_customer = customer.id
);

-- Оновлюємо статуси всіх записів у таблиці appointment, які не мають відповідних записів у таблиці payment на 'cancelled'
UPDATE appointment
SET status = 'cancelled'
WHERE NOT EXISTS (
    SELECT 1
    FROM payment
    WHERE payment.id_appointment = appointment.id
);

-- Видаляємо всі записи про клієнтів, які не зробили жодного платежу
DELETE FROM customer
WHERE NOT EXISTS (
    SELECT 1
    FROM appointment
    WHERE appointment.id_customer = customer.id
);


-- 6) = with correlated subqueries result

-- Вибірка інформації про клієнтів разом з їхніми сумами платежів
SELECT customer.id, customer.name, customer.phone, customer.email, customer.address,
       (SELECT SUM(amount)
        FROM payment
        JOIN appointment ON payment.id_appointment = appointment.id
        WHERE appointment.id_customer = customer.id) AS total_payments
FROM customer;


-- Оновлення статусу платежу на 'completed' для платежів клієнта з певним ім'ям
UPDATE payment
SET status = 'completed'
WHERE id_appointment IN (
    SELECT id
    FROM appointment
    WHERE id_customer = (
        SELECT id
        FROM customer
        WHERE name = 'Anastasiia'
    )
);

-- Видалення всіх платежів клієнта з певним ім'ям
DELETE FROM payment
WHERE id_appointment IN (
    SELECT id
    FROM appointment
    WHERE id_customer = (
        SELECT id
        FROM customer
        WHERE name = 'Anastasiia'
    )
);


-- 7) IN with correlated subqueries result

-- Оновлення статусу зустрічей клієнта з певним ім'ям на 'confirmed', якщо клієнт має більше ніж одну зустріч
UPDATE appointment
SET status = 'confirmed'
WHERE id_customer IN (
    SELECT id
    FROM customer
    WHERE name = 'Anastasiia'
)
AND id IN (
    SELECT id_appointment
    FROM payment
    WHERE amount > 1000
);

-- Видалення всіх записів про зустрічі клієнта з певним ім'ям, якщо вони були оплачені картою
DELETE FROM appointment
WHERE id_customer IN (
    SELECT id
    FROM customer
    WHERE name = 'Anastasiia'
)
AND id IN (
    SELECT id_appointment
    FROM payment
    WHERE payment_method = 'card'
);

-- Вибірка інформації про клієнтів, які мають зустрічі, оплачені картою
SELECT customer.id, customer.name, customer.phone, customer.email, customer.address
FROM customer
WHERE customer.id IN (
    SELECT id_customer
    FROM appointment
    WHERE id IN (
        SELECT id_appointment
        FROM payment
        WHERE payment_method = 'card'
    )
);


-- 8) NOT IN with correlated subqueries result

-- Вибірка інформації про клієнтів, які не мають зустрічей
SELECT id, name, phone, email, address
FROM customer
WHERE id NOT IN (
    SELECT id_customer
    FROM appointment
);

-- Оновлення позиції співробітника на 'Assistant' для співробітників, які не надають жодну послугу
UPDATE employee
SET position = 'Assistant'
WHERE id NOT IN (
    SELECT id_employee
    FROM employee_service
);

-- Видалення зустрічей, які мають співробітників, які не є адміністраторами
DELETE FROM appointment
WHERE id_employee NOT IN (
    SELECT id
    FROM employee
    WHERE position = 'Administrator'
);


-- 9) EXISTS with correlated subqueries result

-- Вибірка співробітників, які надають послугу "Manicure" і мають зустрічі
SELECT id, name, phone, email, position
FROM employee
WHERE EXISTS (
    SELECT 1
    FROM employee_service
    JOIN service  ON employee_service.id_service = service.id
    JOIN appointment  ON employee_service.id_employee = employee_service.id
    WHERE service.name = 'Manicure' AND appointment.id_employee = employee_service.id
);

-- Оновлення зустрічей зі статусом "pending", які мають клієнтів зі статусом "no show"
UPDATE appointment
SET status = 'cancelled'
WHERE EXISTS (
    SELECT 1
    FROM customer
    WHERE customer.id = appointment.id_customer AND customer.status = 'no show'
) AND status = 'pending';


-- Видалення співробітників, які не мають зустрічей
DELETE FROM employee
WHERE NOT EXISTS (
    SELECT 1
    FROM appointment
    WHERE appointment.id_employee = employee.id
);


-- 10) NOT EXISTS with correlated subqueries result


-- Вибираємр співробітників, які не мають зустрічей
SELECT id, name, position
FROM employee
WHERE NOT EXISTS (
    SELECT 1
    FROM appointment
    WHERE appointment.id_employee = employee.id
);


-- Оновлюємо зустрічі зі статусом "pending", які не мають клієнтів
UPDATE appointment
SET status = 'cancelled'
WHERE status = 'pending' AND NOT EXISTS (
    SELECT 1
    FROM customer
    WHERE customer.id = appointment.id_customer
);


-- Видаляємо співробітників, які не мають зустрічей
DELETE FROM employee
WHERE NOT EXISTS (
    SELECT 1
    FROM appointment
    WHERE appointment.id_employee = employee.id
);


-- UNION: Вибираємо всі імена клієнтів та співробітників
SELECT name AS name FROM customer
UNION
SELECT name AS name FROM employee;

-- UNION ALL: Вибираємоо всі телефонні номери клієнтів та співробітників
SELECT phone AS phone FROM customer
UNION ALL
SELECT phone AS phone FROM employee;

-- INTERSECT: Вибираємо співробітників, які є також клієнтами
SELECT name AS name FROM customer
INTERSECT
SELECT name AS name FROM employee;

-- EXCEPT: Вибираємо співробітників, які не є клієнтами
SELECT name AS name FROM employee
EXCEPT
SELECT name AS name FROM customer;


-- Union видаляє дублікати

-- union all не видаляє дублікати
