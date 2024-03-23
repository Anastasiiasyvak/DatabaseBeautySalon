INSERT INTO service (id, name, description, duration, price)
VALUES
    (1, 'Stacking and wrapping', 'Afro curl length to shoulder blades top master', '01:00:00', 1300),
    (2, 'Stacking and wrapping', 'Brushing winding or equal length below the shoulder blades', '00:40:00', 850),
    (3, 'Coverage', 'Hard Art gel polish coating', '00:45:00', 750),
    (4, 'Haircuts', "Men's haircut", '00:25:00', 700),
    (5, 'Coloring', 'Root coloring + toning short', '01:10:00', 3600),
    (6, 'Brady', 'Boxing braids Top master', '01:30:00', 800),
    (7, 'Massage', 'Myofascial lifting LFK + mask', '00:30:00', 1600),
    (8, 'Eyebrows and eyelashes', 'Lamination of eyelashes', '00:35:00', 1100),
    (9, 'Rituals for hair', 'Instant repair ampoule from Brae top master', '00:40:00', 750),
    (10, 'Pedicure', "Men's pedicure", '00:40:00', 750),
    (11, 'Manicure', 'Complex: Hardware manicure + removal + monochromatic coating top master', '01:05:00', 1390),
    (12, 'Makeup', 'Wedding top master', '00:35:00', 1600);


INSERT INTO product (id, name, description, quantity, cost)
VALUES
    (1, 'NOUNOU & OI BOX «THE FORTUNATES & THE HONOURABLE»', 'For damaged and brittle hair', 50 , 2500),
    (2, 'Darling Addicted To Sun Hight Protection»', 'Sunscreen lotion SPF 30-50 150 ml', 200 , 1555),
    (3, '13PERFUMES»', 'Eau de Parfum MAD ABOUT YOU 30 ml', 186 , 1680),
    (4, 'Perla Helsa Marine Collagen for Healthy Skin. Nails and Hair»', 'Marine collagen 30 sachets', 72 , 1296),
    (5, 'Kerastase Densifique Bain Densite Homme Shampoo', "Men's shampoo to increase hair density 250 ml", 330 , 1199),
    (6, 'Baehr Pen Nailcare', 'Pencil for dry nails 3 ml', 378 , 424),
    (7, 'HEDONIC clear brow', 'Transparent eyebrow gel extra strong fixation 11 ml', 70 , 530),
    (8, 'Laneige Lip Sleeping Mask Berry', 'Night lip mask "Wild berries" 3 ml', 505 , 200),
    (9, 'Keune Style Heat Protect Hot Iron Spray №27', 'Keune Style Heat Protect Hot Iron Spray Heat Protect Hot Iron Spray for Hair #27, 200 ml', 84 , 1050);


INSERT INTO customer (id, name, phone, email, address)
VALUES
    (1, 'Anastasiia', 0961489074, 'nastyukraine@gmail.com', 'Kyiv, Shukhevycha Avenue, 14A'),
    (2, 'Bogdana', 0398764031, 'danaukraine@gmail.com', 'Kyiv, Vasylkivska Street, 1B'),
    (3, 'Polina', 0501324685, 'polinaukraine@gmail.com', 'Kharkiv, Shevchenkivska Street, 33С'),
    (4, 'Sofia', 0638311876, 'sofaukraine@gmail.com', ''),
    (5, 'Yaroslava', 0662356575, 'yaroslavaukraine@gmail.com', 'Mykolaiv, Dykabrystiv Street, 38В'),
    (6, 'Kate', 0677487988, 'katyaukraine@gmail.com', 'Kharkiv, Kyrgyzskaya Street, 15В'),
    (7, 'Angelina', 0682298094, 'angelinaukraine@gmail.com', 'Ternopil, Taras Shevchenko Boulevard, 53А'),
    (8, 'Tanya', 0937897514, '', 'Kyiv, Instytutska Street, 22А'),
    (9, 'Karina', 0951266967, 'karinaukraine@gmail.com', 'Zaporizhzhia, Yaroslavska Street, 10В'),
    (10, 'Sasha', 0968439676, 'sashaukraine@gmail.com', 'Kharkiv, Konotopska Street, 54D'),
    (11, 'Veronika', 0968517900, 'nikaukraine@gmail.com', 'Odesa, Okruzhnaya Street, 30D'),
    (12, 'Maryna', 0974467671, 'marynaukraine@gmail.com', 'Lviv, Horodnytska Street, 15B'),
    (13, 'Oleksiy', 0631898692, 'oleksiyukraine@gmail.com', 'Vinnytsia, Soborna Street, 32А'),
    (14, 'Phillip', 0935439142, '', 'Rivne, Naberezhna Street, 32А'),
    (15, 'Rustem', 0955467087, 'rustemukraine@gmail.com', 'Odesa, Buhayivska Street, 60С');


INSERT INTO employee (id, name, phone, email, position, salary)
VALUES
    (1, 'Mariia', 0394354985, 'maria@gmail.com' , 'Master of hair styling', 25000),
    (2, 'Oleksandr', 0962714134, 'oleksandr@gmail.com' , 'Haircutting master', 22000),
    (3, 'Iryna', 0500014569, 'iryna@gmail.com' , 'Makeup master', 20000),
    (4, 'Anna', 0632931894, 'anna@gmail.com' , 'Manicure master', 18000),
    (5, 'Olena', 0667898042, 'olena@gmail.com' , 'Pedicure master', 18000),
    (6, 'Olga', 0671345690, 'yulia@gmail.com' , 'Master of hair coloring', 23000),
    (7, 'Viktoriia', 0681189096, 'viktoria@gmail.com' , 'Master of eyebrow and eyelash care', 20000),
    (8, 'Natalia', 0964228908, 'nataliya@gmail.com' , 'Master of massage', 25000),
    (9, 'Oleksiy', 0958141451, 'oleksiy@gmail.com' , 'Assistant', 15000),
    (10, 'Ihor', 0669849555, 'igor@gmail.com' , 'Assistant', 15000),
    (11, 'Mykhailo', 0689524081, 'mikhailo@gmail.com' , 'Administrator', 30000),
    (12, 'Andriy', 0934454691, 'andriy@gmail.com' , 'Administrator', 30000);


INSERT INTO appointment (id, id_customer, id_service, id_employee, date_time, status)
VALUES
    (1, 1, 2, 4, '2023-03-05 13:00:00', 'completed'),
    (2, 2, 5, 10, '2023-02-16 10:00:00', 'pending'),
    (3, 3, 11, 12, '2024-02-17 13:45:00', 'pending'),
    (4, 4, 1, 1, '2023-02-18 15:20:00', 'pending'),
    (5, 5, 11, 12, '2023-02-19 11:00:00', 'confirmed'),
    (6, 6, 8, 7, '2024-02-20 14:30:00', 'pending'),
    (7, 7, 12, 3, '2024-02-21 16:45:00', 'confirmed'),
    (8, 8, 12, 3, '2023-02-22 12:15:00', 'completed'),
    (9, 9, 6, 6, '2024-02-23 10:30:00', 'no show'),
    (10, 10, 9, 9, '2024-02-24 09:00:00', 'completed'),
    (11, 11, 3, 12, '2023-02-25 14:00:00', 'pending'),
    (12, 12, 7, 8, '2024-02-26 11:30:00', 'confirmed'),
    (13, 13, 4, 11, '2024-02-27 13:00:00', 'confirmed'),
    (14, 14, 4, 11, '2023-02-28 15:50:00', 'pending'),
    (15, 15, 10, 9, '2023-02-24 17:20:00', 'completed');

INSERT INTO payment (id, id_appointment, amount, payment_method)
VALUES
    (1, 1, 1300, 'cash'),
    (2, 5, 3600, 'card'),
    (3, 11, 1390, 'cash'),
    (4, 1, 1300, 'contactless payment'),
    (5, 5, 1390, 'contactless payment'),
    (6, 6, 1100, 'card'),
    (7, 7, 1600, 'cash'),
    (8, 7, 1600, 'contactless payment'),
    (9, 9, 800, 'cash'),
    (10, 10, 750, 'card'),
    (11, 3, 750, 'cash'),
    (12, 12, 1600, 'card'),
    (13, 4, 700, 'contactless payment'),
    (14, 4, 700, 'card'),
    (15, 15, 750, 'cash');



INSERT INTO services2products (service_id, product_id)
VALUES
    (1, 1),
    (2, 5),
    (3, 3),
    (4, 5),
    (5, 1),
    (6, 4),
    (7, 6),
    (8, 7),
    (9, 4),
    (10, 5),
    (11, 2),
    (12, 8);

INSERT INTO employee_service (id_employee, id_service)
VALUES
    (1, 1),
    (2, 4),
    (3, 12),
    (4, 11),
    (5, 10),
    (6, 6),
    (7, 8),
    (8, 7),
    (9, 9),
    (10, 9),
    (11, 12),
    (12, 3);
