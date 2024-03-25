CREATE DATABASE Salon;
USE Salon;

CREATE TABLE service(
    id INTEGER PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    duration TIME NOT NULL,
    price DOUBLE NOT NULL
);

CREATE TABLE product (
    id INTEGER PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    quantity INTEGER NOT NULL,
    cost DOUBLE NOT NULL
);

CREATE TABLE services2products (
    service_id INTEGER,
    product_id INTEGER,
    PRIMARY KEY (service_id, product_id),
    FOREIGN KEY (service_id) REFERENCES service(id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE customer(
    id INTEGER PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    phone INTEGER NOT NULL,
    email VARCHAR(255) DEFAULT NULL,
    address TEXT DEFAULT NULL
);

CREATE TABLE employee(
    id INTEGER PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    phone INTEGER NOT NULL,
    email VARCHAR(255) DEFAULT NULL,
    position ENUM ('Master of hair styling', 'Haircutting master', 'Makeup master', 'Manicure master', 'Pedicure master', 'Master of hair coloring',
    'Master of eyebrow and eyelash care', 'Master of massage', 'Assistant', 'Administrator' ) NOT NULL,
    salary DOUBLE NOT NULL
);


CREATE TABLE appointment(
    id INTEGER PRIMARY KEY,
    id_customer INTEGER,
    id_service INTEGER,
    id_employee INTEGER,
    date_time DATETIME NOT NULL,
    status ENUM('pending','confirmed', 'cancelled', 'completed', 'no show') NOT NULL,
    FOREIGN KEY (id_customer) REFERENCES customer(id),
    FOREIGN KEY (id_service) REFERENCES service(id),
    FOREIGN KEY (id_employee) REFERENCES employee(id)
);

CREATE TABLE payment(
    id INTEGER PRIMARY KEY,
    id_appointment INTEGER,
    amount DOUBLE NOT NULL,
    payment_method ENUM('cash', 'card', 'contactless payment') NOT NULL,
    FOREIGN KEY (id_appointment) REFERENCES appointment(id)
);


CREATE TABLE employee_service (
    id_employee INTEGER,
    id_service INTEGER,
    PRIMARY KEY (id_employee, id_service),
    FOREIGN KEY (id_employee) REFERENCES employee(id),
    FOREIGN KEY (id_service) REFERENCES service(id)
);
