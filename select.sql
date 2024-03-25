-- імена клієнтів та їх номери телефонів разом з кількістю підтверджених записів на 2023 рік
SELECT customer.name, customer.phone, COUNT(*) AS confirmed
FROM customer
INNER JOIN appointment ON customer.id = appointment.id_customer
WHERE YEAR(appointment.date_time) = 2023 AND appointment.status = 'confirmed'
GROUP BY customer.name, customer.phone
ORDER BY confirmed DESC
LIMIT 10;

-- назви послуг та їх ціни, які не дорівнюють 750
SELECT name, price FROM service WHERE price <> 750;

-- назви послуг та середню ціна для тих послуг, середня ціна яких менше або дорівнює 1500
SELECT name, AVG(price) AS average_price
FROM service
GROUP BY name
HAVING AVG(price) <= 1500;

-- імена клієнтів, які здійснили оплату, відсортовані за зростанням суми оплати та спаданням імен клієнтів
SELECT customer.name
FROM payment
INNER JOIN appointment ON payment.id_appointment = appointment.id
INNER JOIN customer ON appointment.id_customer = customer.id
ORDER BY payment.amount ASC, customer.name DESC;

-- імена клієнтів, номери телефонів та статуси їх записів
SELECT customer.name, customer.phone, appointment.status
FROM appointment
INNER JOIN customer ON appointment.id_customer = customer.id;

-- імена та посади працівників
SELECT name, position
FROM employee
LIMIT 5;

-- дату та статус запису, ім'я та номер телефону клієнта для записів зі статусом 'pending'
SELECT appointment.date_time, appointment.status, customer.name, customer.phone
FROM appointment
INNER JOIN customer ON appointment.id_customer = customer.id
WHERE appointment.status = 'pending';

-- назву послуги та кількість записів для кожної послуги
SELECT service.name, COUNT(appointment.id_service) AS appointments_count
FROM service
LEFT JOIN appointment ON service.id = appointment.id_service
GROUP BY service.name;

