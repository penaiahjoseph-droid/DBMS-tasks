CREATE DATABASE flipkart;
USE flipkart;
CREATE TABLE Customer (
    C_id INT PRIMARY KEY,
    C_name VARCHAR(50),
    email VARCHAR(50) UNIQUE,
    phone VARCHAR(20) UNIQUE,
    address VARCHAR(100)
);
DESC Customer;

INSERT INTO Customer(C_id, C_name, email, phone, address)
VALUES
(101, 'penaiah', 'penaiah@gamil.com', '1234567896', 'street1'),
(102, 'vijay', 'vijay@gamil.com', '1332311322', 'street2');

INSERT INTO Customer(C_id, C_name, email, phone, address)
VALUES
(103, 'joseph', 'joseph@gmail.com', '1234232324', 'street3');

INSERT INTO Customer(C_id, C_name, email, phone, address)
VALUES
(104, 'raja', 'raja@ggmail.com', '123243442898', 'street4');

ALTER TABLE Customer
ADD PRIMARY KEY (C_id);

UPDATE Customer
SET address = 'street1'
WHERE C_id = 101;

DELETE FROM Customer
WHERE C_id = 103;

SELECT * FROM Customer;