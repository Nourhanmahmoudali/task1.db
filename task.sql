CREATE DATABASE store_management;
CREATE TABLE Governorate (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE Store (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(255) NOT NULL,
    governorate_id INT,
    FOREIGN KEY (governorate_id) REFERENCES Governorate(id)
);

CREATE TABLE Supplier (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    phone VARCHAR(20),
    email VARCHAR(100),
    brief_data TEXT
);

CREATE TABLE Product (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    code VARCHAR(50) NOT NULL,
    description TEXT,
    price DECIMAL(10,2) NOT NULL,
    supplier_id INT,
    FOREIGN KEY (supplier_id) REFERENCES Supplier(id)
);

CREATE TABLE Store_Product (
    store_id INT,
    product_id INT,
    quantity INT DEFAULT 0,
    PRIMARY KEY (store_id, product_id),
    FOREIGN KEY (store_id) REFERENCES Store(id),
    FOREIGN KEY (product_id) REFERENCES Product(id)
);









--1- from “orderdetails” table. Write a query to get all order numbers (without repetition) that contain any product starting with code S18 and price more than 100.
SELECT  DISTINCT orderNumber FROM orderdetails
WHERE productCode LIKE  'S18%' &&priceEach>100;

-- 2-from “payments” table. Write a query to get all payments that were made on day 5 or 6 (whatever month or year).
SELECT *FROM payments 
WHERE DAY(paymentDate) IN (5, 6);


--3- from “customers” table. Write a query to get the fifth-highest credit limit of the customers who (live in the USA and their phone number contains 5555).
SELECT * FROM customers WHERE country='USA'AND phone LIKE '%5%5%5%5' ORDER BY creditlimit DESC LIMIT 5;
