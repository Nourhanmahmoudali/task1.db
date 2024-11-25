--1- from “orderdetails” table. Write a query to get all order numbers (without repetition) that contain any product starting with code S18 and price more than 100.
SELECT  DISTINCT orderNumber FROM orderdetails
WHERE productCode LIKE  'S18%' &&priceEach>100;

-- 2-from “payments” table. Write a query to get all payments that were made on day 5 or 6 (whatever month or year).
SELECT *FROM payments 
WHERE DAY(paymentDate) IN (5, 6);


--3- from “customers” table. Write a query to get the fifth-highest credit limit of the customers who (live in the USA and their phone number contains 5555).
SELECT * FROM customers WHERE country='USA'AND phone LIKE '%5%5%5%5' ORDER BY creditlimit DESC LIMIT 5;