               
               -- ===========================================================================================
               -- Project Title:Online Shopping Database Management System using SQL
               -- Project Description:
               -- Designed and implemented an online shopping database using SQL with three main entities:
               -- customers, products, and orders. Established relationships using foreign keys and developed
               -- queries to manage customer orders,customers, products, and orders.alter. 
			   -- ===========================================================================================
	
create database online_shopping;
use online_shopping;
 
-- 	Creating a database
CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    email VARCHAR(100)
);

-- Retrieves all columns and rows from the table
select * from customers;

-- Inserting a values in the table
INSERT INTO customers (name, email) VALUES
('Madhu','madhu@gmail.com'),
('Kumar','kumar@gmail.com'),
('Priya','priya@gmail.com'),
('Arun','arun@gmail.com'),
('Divya','divya@gmail.com'),
('Rahul','rahul@gmail.com'),
('Sneha','sneha@gmail.com'),
('Vijay','vijay@gmail.com'),
('Meena','meena@gmail.com'),
('Akash','akash@gmail.com'),
('Ravi','ravi@gmail.com'),
('Anu','anu@gmail.com'),
('Karthik','karthik@gmail.com'),
('Pooja','pooja@gmail.com'),
('Sanjay','sanjay@gmail.com');


CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100),
    price DECIMAL(10,2)
);

select * from products;

INSERT INTO products (product_name, price) VALUES
('Mobile',15000),
('Laptop',55000),
('Headphones',2000),
('Keyboard',1200),
('Mouse',800),
('Smart Watch',5000),
('Tablet',20000),
('Camera',45000),
('Speaker',3000),
('Monitor',12000),
('Printer',9000),
('Power Bank',1500),
('Charger',700),
('Backpack',1800),
('Gaming Console',40000);



CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

select * from orders;

INSERT INTO orders (customer_id, product_id, quantity) VALUES
(1,1,1),
(2,2,1),
(3,3,2),
(4,4,1),
(5,5,3),
(6,6,1),
(7,7,1),
(8,8,1),
(9,9,2),
(10,10,1),
(11,11,1),
(12,12,2),
(13,13,3),
(14,14,1),
(15,15,1);

SELECT c.name, p.product_name, o.quantity
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN products p ON o.product_id = p.product_id;

SELECT c.name, p.product_name,
       (p.price * o.quantity) AS total_amount
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN products p ON o.product_id = p.product_id;

SELECT product_name, price
FROM products
ORDER BY price DESC
LIMIT 1;

SELECT c.name, SUM(o.quantity) AS total_items
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.name
ORDER BY total_items DESC
LIMIT 1;






