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

INSERT INTO Student (Student_ID, Name, Age, Course, City, Email, Dept_ID, Course_ID)
VALUES (6, 'Ishita Roy', 19, 'Undeclared', 'Haridwar', 'ishita@example.com', NULL, NULL);

-- Q1
SELECT 10 + 5 AS Addition_Result;

-- Q2
SELECT 10 - 5 AS Subtraction_Result;

-- Q3
SELECT 10 * 5 AS Multiplication_Result;

-- Q4
SELECT 10 / 5 AS Division_Result;

-- Q5
SELECT
    Product_Name,
    Price,
    Quantity,
    Price * Quantity AS Total_Amount
FROM Product;

-- Q6
SELECT *
FROM Student
WHERE Age >= 18
  AND City = 'Delhi';

-- Q7
SELECT *
FROM Student
WHERE City = 'Delhi'
   OR City = 'Roorkee';

-- Q8
SELECT *
FROM Student
WHERE NOT (City = 'Delhi');

-- Q9
SELECT *
FROM Student
WHERE Course = 'AIML'
  AND City = 'Delhi';

-- Q10
SELECT *
FROM Employee
WHERE Department = 'IT'
   OR Department = 'HR';

-- Q11
SELECT *
FROM Student
WHERE City = 'Delhi';

-- Q12
SELECT *
FROM Employee
WHERE Salary > 60000;

-- Q13
SELECT *
FROM Employee
WHERE Salary < 60000;

-- Q14
SELECT *
FROM Employee
WHERE Salary >= 50000
  AND Salary <= 70000;

-- Q15
SELECT *
FROM Student
WHERE City <> 'Delhi';

-- Q16
SELECT *
FROM Employee
WHERE Salary BETWEEN 50000 AND 70000;

-- Q17
SELECT *
FROM Student
WHERE City IN ('Delhi', 'Roorkee', 'Meerut');

-- Q18
SELECT *
FROM Student
WHERE City NOT IN ('Delhi', 'Roorkee');

-- Q19
SELECT *
FROM Student
WHERE Name LIKE 'A%';

-- Q20
SELECT *
FROM Employee
WHERE Manager_ID IS NULL;

SELECT *
FROM Employee
WHERE Manager_ID IS NOT NULL;

-- Q21
SELECT City AS Place
FROM Student
UNION
SELECT Location AS Place
FROM Department;

-- Q22
SELECT City AS Place
FROM Student
UNION ALL
SELECT Location AS Place
FROM Department;

-- Q23
SELECT DISTINCT s.City AS Place
FROM Student AS s
INNER JOIN Department AS d
    ON s.City = d.Location;

-- Q24
SELECT DISTINCT s.City AS Place
FROM Student AS s
WHERE NOT EXISTS (
    SELECT 1
    FROM Department AS d
    WHERE d.Location = s.City
);

-- Q25
SELECT
    Product_Name,
    Price,
    Quantity,
    Price * Quantity AS Total_Amount
FROM Product
WHERE Price > 500
  AND Quantity BETWEEN 1 AND 20
  AND Product_Name LIKE '%o%';
