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
INSERT INTO Student (Student_ID, Name, Age, Course, City, Email, Dept_ID, Course_ID)
VALUES (6, 'Ishita Roy', 19, 'AIML', 'Haridwar', 'ishita@example.com', 1, 101);

-- Q2
INSERT INTO Student (Student_ID, Name, Age, Course, City)
VALUES (7, 'Aman Joshi', 18, 'CSE', 'Delhi');

INSERT INTO Student (Student_ID, Name, Age, Course, City)
VALUES (8, 'Tanya Malik', 19, 'AIML', 'Roorkee');

INSERT INTO Student (Student_ID, Name, Age, Course, City)
VALUES (9, 'Arjun Mehta', 20, 'ECE', 'Meerut');

INSERT INTO Student (Student_ID, Name, Age, Course, City)
VALUES (10, 'Simran Kaur', 18, 'CSE', 'Delhi');

INSERT INTO Student (Student_ID, Name, Age, Course, City)
VALUES (11, 'Kunal Shah', 21, 'BBA', 'Noida');

-- Q3
INSERT INTO Student (Student_ID, Name, Age, Course, City)
VALUES
    (12, 'Pooja Saini', 19, 'AIML', 'Roorkee'),
    (13, 'Yash Jain', 20, 'CSE', 'Delhi');

-- Q4
INSERT INTO Employee (Emp_ID, Emp_Name, Department, Salary, Email, Dept_ID, Manager_ID, Joining_Date)
VALUES (6, 'Neha Verma', 'HR', 50000, 'neha@example.com', 3, NULL, '2025-02-01');

-- Q5
INSERT INTO Department (Dept_ID, Dept_Name, Location)
VALUES (5, 'Physics', 'Block E');

-- Q6
INSERT INTO Product (Product_ID, Product_Name, Price, Quantity)
VALUES (4, 'Webcam', 1800, 8);

-- Q7
INSERT INTO Customer (Customer_ID, Customer_Name, Email, Phone)
VALUES (3, 'Mohan', 'mohan@example.com', '9876512345');

-- Q8
INSERT INTO Course (Course_ID, Course_Name, Duration, Fees)
VALUES (105, 'Data Science', '4 years', 125000);

-- Q9
INSERT INTO Student (Student_ID, Name, Age, Course, City, Email, Dept_ID, Course_ID)
VALUES (14, 'Riya Kapoor', 19, 'AIML', 'Delhi', 'riya@example.com', 1, 101);

-- Q10
INSERT INTO Student (Student_ID, Name, Age)
VALUES (15, 'Aditi Sen', 18);

-- Q11
UPDATE Student
SET City = 'Jaipur'
WHERE Student_ID = 1;

-- Q12
UPDATE Employee
SET Salary = 68000
WHERE Emp_ID = 1;

-- Q13
UPDATE Employee
SET Salary = Salary * 1.10;

-- Q14
UPDATE Product
SET Price = Price * 1.05;

-- Q15
UPDATE Student
SET Course = 'Data Science'
WHERE Student_ID = 2;

-- Q16
UPDATE Employee
SET Department = 'Technology'
WHERE Emp_ID = 2;

-- Q17
UPDATE Student
SET City = 'Delhi'
WHERE City = 'Meerut';

-- Q18
UPDATE Course
SET Fees = 130000
WHERE Course_ID = 101;

-- Q19
UPDATE Student
SET Age = 20,
    City = 'Dehradun'
WHERE Student_ID = 3;

-- Q20
DELETE FROM Student
WHERE Student_ID = 15;

-- Q21
DELETE FROM Student
WHERE City = 'Noida';

-- Q22
DELETE FROM Employee
WHERE Salary < 55000;

-- Q23
DELETE FROM Product
WHERE Quantity = 0;

-- Q24
DELETE FROM Student
WHERE (City = 'Jaipur' AND Age >= 18)
   OR Course = 'Temporary';

-- Q25
INSERT INTO Student (Student_ID, Name, Age, Course, City)
VALUES (90, 'Demo Student', 18, 'AIML', 'Roorkee');

SELECT *
FROM Student
WHERE Student_ID = 90;

UPDATE Student
SET City = 'Delhi',
    Age = 19
WHERE Student_ID = 90;

SELECT *
FROM Student
WHERE Student_ID = 90;

DELETE FROM Student
WHERE Student_ID = 90;

SELECT *
FROM Student
WHERE Student_ID = 90;
