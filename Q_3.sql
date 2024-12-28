create database if not exists Question;
use question;

-- Leetcode problem LeetCode SQL Premium Problem 2853: 'Highest Salary Difference'

-- DDL for Salaries table

create table salaries(
	emp_name varchar(50),
    department varchar(50),
    salary int,
    primary key(emp_name, department)
);

-- DML for Salaries table
INSERT INTO Salaries (emp_name, department, salary) VALUES
('Kathy', 'Engineering', 50000),
('Roy', 'Marketing', 30000),
('Charles', 'Engineering', 45000),
('Jack', 'Engineering', 85000),
('Benjamin', 'Marketing', 34000),
('Anthony', 'Marketing', 42000),
('Edward', 'Engineering', 102000),
('Terry', 'Engineering', 44000),
('Evelyn', 'Marketing', 53000),
('Arthur', 'Engineering', 32000);


SELECT * FROM Salaries;


/*
Write an SQL query to calculate the difference 
between the highest salaries 
in the marketing and engineering department. 
Output the absolute difference in salaries.
*/

select
	abs(max(case when department = 'Marketing' then salary end) -
    max(case when department = 'engineering' then salary end)) as abs_salary_diff
from salaries















