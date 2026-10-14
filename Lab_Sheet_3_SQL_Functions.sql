CREATE DATABASE IF NOT EXISTS CollegeDB;
USE CollegeDB;

DROP TABLE IF EXISTS Student;
DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Department;
DROP TABLE IF EXISTS Product;
DROP TABLE IF EXISTS Customer;
DROP TABLE IF EXISTS Course;
DROP TABLE IF EXISTS Faculty;
DROP TABLE IF EXISTS Library;

CREATE TABLE Department (
    Dept_ID INT PRIMARY KEY,
    Dept_Name VARCHAR(60) NOT NULL,
    Location VARCHAR(60)
);

CREATE TABLE Course (
    Course_ID INT PRIMARY KEY,
    Course_Name VARCHAR(60) NOT NULL,
    Duration VARCHAR(30),
    Fees DECIMAL(10, 2)
);

CREATE TABLE Student (
    Student_ID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Age INT,
    Course VARCHAR(60),
    City VARCHAR(60),
    Email VARCHAR(120) UNIQUE,
    Dept_ID INT,
    Course_ID INT
);

CREATE TABLE Employee (
    Emp_ID INT PRIMARY KEY,
    Emp_Name VARCHAR(100) NOT NULL,
    Department VARCHAR(60),
    Salary DECIMAL(10, 2),
    Email VARCHAR(120) UNIQUE,
    Dept_ID INT,
    Manager_ID INT,
    Joining_Date DATE
);

CREATE TABLE Product (
    Product_ID INT PRIMARY KEY,
    Product_Name VARCHAR(100) NOT NULL,
    Price DECIMAL(10, 2) CHECK (Price > 0),
    Quantity INT
);

CREATE TABLE Customer (
    Customer_ID INT PRIMARY KEY,
    Customer_Name VARCHAR(100) NOT NULL,
    Email VARCHAR(120),
    Phone VARCHAR(20)
);

CREATE TABLE Faculty (
    Faculty_ID INT PRIMARY KEY,
    Faculty_Name VARCHAR(100) NOT NULL,
    Subject VARCHAR(60),
    Salary DECIMAL(10, 2)
);

CREATE TABLE Library (
    Book_ID INT PRIMARY KEY,
    Book_Name VARCHAR(150) NOT NULL,
    Author VARCHAR(100),
    Price DECIMAL(10, 2)
);
INSERT INTO Department (Dept_ID, Dept_Name, Location)
VALUES
    (1, 'Computer Science', 'Delhi'),
    (2, 'Electronics', 'Roorkee'),
    (3, 'Management', 'Block C'),
    (4, 'Mathematics', 'Meerut');

INSERT INTO Course (Course_ID, Course_Name, Duration, Fees)
VALUES
    (101, 'AIML', '4 years', 120000),
    (102, 'CSE', '4 years', 115000),
    (103, 'ECE', '4 years', 110000),
    (104, 'BBA', '3 years', 80000);

INSERT INTO Student (Student_ID, Name, Age, Course, City, Email, Dept_ID, Course_ID)
VALUES
    (1, 'Aarav Sharma', 18, 'AIML', 'Delhi', 'aarav@example.com', 1, 101),
    (2, 'Naina Verma', 19, 'CSE', 'Meerut', 'naina@example.com', 1, 102),
    (3, 'Kabir Singh', 20, 'ECE', 'Roorkee', 'kabir@example.com', 2, 103),
    (4, 'Meera Gupta', 18, 'AIML', 'Meerut', 'meera@example.com', 1, 101),
    (5, 'Rohan Das', 21, 'BBA', 'Delhi', 'rohan@example.com', 3, 104);

INSERT INTO Employee (Emp_ID, Emp_Name, Department, Salary, Email, Dept_ID, Manager_ID, Joining_Date)
VALUES
    (1, 'Anil Kumar', 'IT', 65000, 'anil@example.com', 1, NULL, '2022-01-10'),
    (2, 'Priya Jain', 'IT', 72000, 'priya@example.com', 1, 1, '2021-05-15'),
    (3, 'Vikas Rao', 'HR', 48000, 'vikas@example.com', 3, NULL, '2023-03-20'),
    (4, 'Sara Khan', 'IT', 58000, 'sara@example.com', 1, 2, '2024-07-01'),
    (5, 'Dev Patel', 'Finance', 52000, 'dev@example.com', 4, NULL, '2020-11-11');

INSERT INTO Product (Product_ID, Product_Name, Price, Quantity)
VALUES
    (1, 'Keyboard', 799, 15),
    (2, 'Mouse', 399, 0),
    (3, 'Monitor', 8500, 5);

INSERT INTO Customer (Customer_ID, Customer_Name, Email, Phone)
VALUES
    (1, 'Asha', 'asha@example.com', '9876543210'),
    (2, 'Rahul', 'rahul@example.com', '9876501234');

INSERT INTO Faculty (Faculty_ID, Faculty_Name, Subject, Salary)
VALUES
    (1, 'Dr Sharma', 'DBMS', 75000),
    (2, 'Dr Khan', 'SQL', 72000);

INSERT INTO Library (Book_ID, Book_Name, Author, Price)
VALUES
    (1, 'Database Systems', 'Korth', 650),
    (2, 'Learning SQL', 'Alan Beaulieu', 550);

-- Q1
SELECT ABS(-25) AS Absolute_Value;

-- Q2
SELECT ROUND(123.4567, 2) AS Rounded_Value;

-- Q3
SELECT
    CEIL(12.3) AS Ceiling_Value,
    FLOOR(12.8) AS Floor_Value;

-- Q4
SELECT MOD(17, 5) AS Remainder;

-- Q5
SELECT
    Emp_Name,
    Salary,
    ROUND(Salary) AS Rounded_Salary
FROM Employee;

-- Q6
SELECT COUNT(*) AS Total_Students
FROM Student;

-- Q7
SELECT SUM(Salary) AS Total_Salary
FROM Employee;

-- Q8
SELECT AVG(Salary) AS Average_Salary
FROM Employee;

-- Q9
SELECT MAX(Salary) AS Highest_Salary
FROM Employee;

-- Q10
SELECT MIN(Salary) AS Lowest_Salary
FROM Employee;

-- Q11
SELECT
    Name,
    UPPER(Name) AS Upper_Name
FROM Student;

-- Q12
SELECT
    Name,
    LOWER(Name) AS Lower_Name
FROM Student;

-- Q13
SELECT
    Name,
    LENGTH(Name) AS Name_Length
FROM Student;

-- Q14
SELECT CONCAT('Akshay', ' ', 'Tyagi') AS Full_Name;

-- Q15
SELECT
    SUBSTRING('Database Management', 1, 8) AS Extracted_Text,
    SUBSTR('Database Management', 10, 10) AS Extracted_Substring;

-- Q16
SELECT CAST(12345 AS CHAR) AS Number_As_String;

-- Q17
SELECT CAST('456.75' AS DECIMAL(10, 2)) AS String_As_Number;

-- Q18
SELECT DATE_FORMAT('2026-10-14', '%d-%m-%Y') AS Formatted_Date;

-- Q19
SELECT CAST('2026-10-14' AS DATE) AS Cast_Date;

-- Q20
SELECT CONVERT('789', UNSIGNED) AS Converted_Number;

-- Q21
SELECT CURDATE() AS Current_Date;

-- Q22
SELECT
    YEAR('2026-10-14') AS Year_Value,
    MONTH('2026-10-14') AS Month_Value,
    DAY('2026-10-14') AS Day_Value;

-- Q23
SELECT DATEDIFF('2026-10-14', '2026-10-01') AS Days_Difference;

-- Q24
SELECT DATE_ADD('2026-10-14', INTERVAL 7 DAY) AS Date_After_Seven_Days;

-- Q25
SELECT
    Emp_Name,
    Joining_Date,
    DATE_FORMAT(Joining_Date, '%d/%m/%Y') AS Formatted_Joining_Date
FROM Employee;
