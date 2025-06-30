create database Online_Store_Management_System;
use Online_Store_Management_System;

create table Customers (
customer_id int primary key,
name varchar(50) not null,
email varchar(50),
phone varchar(10),
address varchar(50)
);

create table Products (
product_id int primary key,
name varchar(50) not null,
description varchar(50),
price int,
stock_quantity int
);

create table Categories (
category_id int primary key,
category_name varchar(50) not null
);


alter table Products
add category_id int;

ALTER TABLE Products
ADD CONSTRAINT fk_category
FOREIGN KEY (category_id) REFERENCES Categories(category_id);

create table Orders (
order_id int primary key,
customer_id int,
FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
order_date date,
status varchar(50)
);

create table Order_Items (
order_item_id int primary key,
order_id int,
FOREIGN KEY (order_id) REFERENCES Orders(order_id),
product_id int,
FOREIGN KEY (product_id) REFERENCES Products(product_id),
quantity int,
price int
);

create table Payments (
payment_id int primary key,
order_id int,
FOREIGN KEY (order_id) REFERENCES Orders(order_id),
payment_date date,
amount int,
payment_method varchar(50)
);


SHOW TABLES;

select * from Customers;

insert into Customers (customer_id, name, email, phone, address)
values (1,"John Doe", "john.doe@email.com", 555-0100, "123 Main St"),
(2 ,"Jane Smith", "jane.smith@email.com", 555-0200, "456 Oak Ave"),
(3, "Alice Brown", "alice.brown@email.com", 555-0300, "789 Pine Rd");

select * from Customers;

select * from Categories;

insert into Categories (category_id, category_name)
values (1,"Electronics"),
(2,"Clothing"),
(3,"Home & Kitchen");

select * from Categories;


select * from Products;

insert into Products (product_id, name, description, price, stock_quantity, category_id)
values (1,"Smartphone", "high quality", 500, 50, 1),
(2,"Laptop", "high quality", 900, 30, 1),
(3,"T-Shirt", "high quality", 20, 100, 2),
(4,"Jeans", "high quality", 40, 60, 2),
(5,"Coffee Maker", "high quality", 80, 25, 3);

select * from Products;


select * from Orders;

insert into Orders (order_id, customer_id, order_date, status)
values (1, 1, '2025-06-01', "Completed"),
(2, 2, '2025-06-02', "Pending"),
(3, 1, '2025-06-03', "Shipped");

select * from Orders;


select * from Order_Items;

insert into Order_Items (order_item_id, order_id, product_id, quantity, price)
values (1, 1, 1, 1, 500),
(2, 1, 3, 2, 20),
(3, 2, 4, 1, 40),
(4,3, 5, 1, 80);

select * from Order_Items;


select * from Payments;

insert into Payments (payment_id, order_id, payment_date, amount, payment_method)
values (1, 1, '2025-06-01', 540, "Credit Card"),
(2, 3, '2025-06-03', 80, "PayPal");

select * from Payments;