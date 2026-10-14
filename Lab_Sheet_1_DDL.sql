-- Q1
CREATE DATABASE IF NOT EXISTS CollegeDB;
USE CollegeDB;

DROP TABLE IF EXISTS Student_Complete;
DROP TABLE IF EXISTS Student_Details;
DROP TABLE IF EXISTS Student;
DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Department;
DROP TABLE IF EXISTS Product;
DROP TABLE IF EXISTS Customer;
DROP TABLE IF EXISTS Course;
DROP TABLE IF EXISTS Faculty;
DROP TABLE IF EXISTS Library;

-- Q2
CREATE TABLE Student (
    Student_ID INT,
    Name VARCHAR(100),
    Age INT,
    Course VARCHAR(60),
    City VARCHAR(60)
);

-- Q3
CREATE TABLE Employee (
    Emp_ID INT,
    Emp_Name VARCHAR(100),
    Department VARCHAR(60),
    Salary DECIMAL(10, 2)
);

-- Q4
CREATE TABLE Department (
    Dept_ID INT,
    Dept_Name VARCHAR(60),
    Location VARCHAR(60)
);

-- Q5
CREATE TABLE Product (
    Product_ID INT,
    Product_Name VARCHAR(100),
    Price DECIMAL(10, 2),
    Quantity INT
);

-- Q6
CREATE TABLE Customer (
    Customer_ID INT,
    Customer_Name VARCHAR(100),
    Email VARCHAR(120),
    Phone VARCHAR(20)
);

-- Q7
CREATE TABLE Course (
    Course_ID INT,
    Course_Name VARCHAR(60),
    Duration VARCHAR(30),
    Fees DECIMAL(10, 2)
);

-- Q8
CREATE TABLE Faculty (
    Faculty_ID INT,
    Faculty_Name VARCHAR(100),
    Subject VARCHAR(60),
    Salary DECIMAL(10, 2)
);

-- Q9
CREATE TABLE Library (
    Book_ID INT,
    Book_Name VARCHAR(150),
    Author VARCHAR(100),
    Price DECIMAL(10, 2)
);

-- Q10
DROP TABLE Department;
CREATE TABLE Department (
    Dept_ID INT PRIMARY KEY,
    Dept_Name VARCHAR(60),
    Location VARCHAR(60)
);

-- Q11
DROP TABLE Student;
CREATE TABLE Student (
    Student_ID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Age INT,
    Course VARCHAR(60),
    City VARCHAR(60)
);

-- Q12
DROP TABLE Employee;
CREATE TABLE Employee (
    Emp_ID INT PRIMARY KEY,
    Emp_Name VARCHAR(100) NOT NULL,
    Department VARCHAR(60),
    Email VARCHAR(120) UNIQUE
);

-- Q13
DROP TABLE Product;
CREATE TABLE Product (
    Product_ID INT PRIMARY KEY,
    Product_Name VARCHAR(100) NOT NULL,
    Price DECIMAL(10, 2) CHECK (Price > 0),
    Quantity INT
);

-- Q14
ALTER TABLE Student
    ADD COLUMN Email VARCHAR(120);

-- Q15
ALTER TABLE Student
    ADD COLUMN Phone VARCHAR(20);

-- Q16
ALTER TABLE Student
    MODIFY COLUMN Name VARCHAR(150);

-- Q17
ALTER TABLE Student
    RENAME TO Student_Details;

-- Q18
ALTER TABLE Student_Details
    RENAME COLUMN City TO Address;

-- Q19
ALTER TABLE Employee
    ADD COLUMN Salary DECIMAL(10, 2);

-- Q20
ALTER TABLE Student_Details
    DROP COLUMN Phone;

-- Q21
ALTER TABLE Student_Details
    DROP COLUMN Email;

-- Q22
INSERT INTO Library (Book_ID, Book_Name, Author, Price)
VALUES
    (1, 'Database Systems', 'Korth', 650),
    (2, 'Learning SQL', 'Alan Beaulieu', 550);
TRUNCATE TABLE Library;

-- Q23
DROP TABLE Course;

-- Q24
DROP TABLE Customer;

-- Q25
CREATE TABLE Student_Complete (
    Student_ID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(120) UNIQUE,
    Age INT CHECK (Age >= 16)
);

ALTER TABLE Student_Complete
    ADD COLUMN City VARCHAR(60);

ALTER TABLE Student_Complete
    MODIFY COLUMN City VARCHAR(100);

ALTER TABLE Student_Complete
    DROP COLUMN City;
