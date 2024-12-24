/* 1. You have two tables: Product and Supplier.
- Product Table Columns: Product_id, Product_Name, Supplier_id, Price
- Supplier Table Columns: Supplier_id, Supplier_Name, Country
*/



-- Write an SQL query to find the name of the product with the highest 
-- price in each country.

-- creating the product table 

-- creating supplier table 

create database Question_1;
use  Question_1;

create table supplier(
	Supplier_id int primary key,
    Supplier_Name varchar(25),
    Country varchar(25)
);

insert into supplier
	values(501, 'alan', 'India'),
		  (502, 'rex', 'US'),
		(503, 'dodo', 'India'),
		(504, 'rahul', 'US'),
		(505, 'zara', 'Canda'),
		(506, 'max', 'Canada');
    
create table products(
	Product_id int primary key,
    Product_Name varchar(25),
    Supplier_id int,
    Price float,
    foreign key (Supplier_id) references supplier(Supplier_id)
);

INSERT INTO products
VALUES	(201, 'iPhone 14', '501', 1299),
		(202, 'iPhone 8', '502', 999),
		(204, 'iPhone 13', '502', 1199),
		(203, 'iPhone 11', '503', 1199),
		(205, 'iPhone 12', '502', 1199),
		(206, 'iPhone 14', '501', 1399),
		(214, 'iPhone 15', '503', 1499),
		(207, 'iPhone 15', '505', 1499),
		(208, 'iPhone 15', '504', 1499),
		(209, 'iPhone 12', '502', 1299),
		(210, 'iPhone 13', '502', 1199),
		(211, 'iPhone 11', '501', 1099),
		(212, 'iPhone 14', '503', 1399),
		(213, 'iPhone 8', '502', 1099)
;

select *from supplier;
select *from products;

select *from 
	(
		select
		p.product_name,
		p.price,
		s.country,
		row_number() over(partition by s.country order by p.price desc) as rn
		from products p
		left join supplier s
		on p.Supplier_id = s.Supplier_id
    ) new_table
    
where rn = 1;





-- Second Question

/* 
You have two tables: Customer and Transaction.
- Customer Table Columns: Customer_id, Customer_Name, Registration_Date
- Transaction Table Columns: Transaction_id, Customer_id, Transaction_Date, Amount

-- Write an SQL query to calculate the total transaction amount for each customer for the current year. 
The output should contain Customer_Name and the total amount.
*/

-- 1. find total transaction amt group by each customer filter with current year 
-- put where condition to check if the transaction are current year year 1  


create database Question_2;
use Question_2;

-- Create Customer table
CREATE TABLE Customers (
    Customer_id INT PRIMARY KEY,
    Customer_Name VARCHAR(100),
    Registration_Date DATE
);

-- Create Transaction table
CREATE TABLE Transaction (
    Transaction_id INT PRIMARY KEY,
    Customer_id INT,
    Transaction_Date DATE,
    Amount DECIMAL(10, 2),
    FOREIGN KEY (Customer_id) REFERENCES Customers(Customer_id)
);


-- Insert records into Customer table
INSERT INTO Customers (Customer_id, Customer_Name, Registration_Date)
VALUES
    (1, 'John Doe', '2023-01-15'),
    (2, 'Jane Smith', '2023-02-20'),
    (3, 'Michael Johnson', '2023-03-10');

-- Insert records into Transaction table
INSERT INTO Transaction (Transaction_id, Customer_id, Transaction_Date, Amount)
VALUES
    (201, 1, '2024-01-20', 50.00),
    (202, 1, '2024-02-05', 75.50),
    (203, 2, '2023-02-22', 100.00),
    (204, 3, '2022-03-15', 200.00),
    (205, 2, '2024-03-20', 120.75),
	(301, 1, '2024-01-20', 50.00),
    (302, 1, '2024-02-05', 75.50),
    (403, 2, '2023-02-22', 100.00),
    (304, 3, '2022-03-15', 200.00),
    (505, 2, '2024-03-20', 120.75);
    
    

SELECT * FROM customers;
SELECT * FROM transaction;

select 
	c.customer_name,
    sum(t.amount) as total_amt
from customers c
join transaction t
on c.customer_id = t.customer_id
where extract(year from transaction_date) = extract(year from current_date)
group by customer_name

    

