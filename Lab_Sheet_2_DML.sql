-- Lab Sheet 2: DML Commands
-- Run in MySQL Workbench

CREATE DATABASE IF NOT EXISTS CollegeDB;
USE CollegeDB;

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS Student; DROP TABLE IF EXISTS Employee; DROP TABLE IF EXISTS Department;
DROP TABLE IF EXISTS Product; DROP TABLE IF EXISTS Customer; DROP TABLE IF EXISTS Course;
DROP TABLE IF EXISTS Faculty; DROP TABLE IF EXISTS Library;
SET FOREIGN_KEY_CHECKS=1;
CREATE TABLE Department(Dept_ID INT PRIMARY KEY, Dept_Name VARCHAR(60) NOT NULL, Location VARCHAR(60));
CREATE TABLE Course(Course_ID INT PRIMARY KEY, Course_Name VARCHAR(60) NOT NULL, Duration VARCHAR(30), Fees DECIMAL(10,2));
CREATE TABLE Student(Student_ID INT PRIMARY KEY, Name VARCHAR(100) NOT NULL, Age INT, Course VARCHAR(60), City VARCHAR(60), Email VARCHAR(120) UNIQUE, Dept_ID INT, Course_ID INT);
CREATE TABLE Employee(Emp_ID INT PRIMARY KEY, Emp_Name VARCHAR(100) NOT NULL, Department VARCHAR(60), Salary DECIMAL(10,2), Email VARCHAR(120) UNIQUE, Dept_ID INT, Manager_ID INT, Joining_Date DATE);
CREATE TABLE Product(Product_ID INT PRIMARY KEY, Product_Name VARCHAR(100) NOT NULL, Price DECIMAL(10,2) CHECK(Price>0), Quantity INT);
CREATE TABLE Customer(Customer_ID INT PRIMARY KEY, Customer_Name VARCHAR(100) NOT NULL, Email VARCHAR(120), Phone VARCHAR(20));
CREATE TABLE Faculty(Faculty_ID INT PRIMARY KEY, Faculty_Name VARCHAR(100) NOT NULL, Subject VARCHAR(60), Salary DECIMAL(10,2));
CREATE TABLE Library(Book_ID INT PRIMARY KEY, Book_Name VARCHAR(150) NOT NULL, Author VARCHAR(100), Price DECIMAL(10,2));
INSERT INTO Department VALUES (1,'Computer Science','Block A'),(2,'Electronics','Block B'),(3,'Management','Block C'),(4,'Mathematics','Block D');
INSERT INTO Course VALUES (101,'AIML','4 years',120000),(102,'CSE','4 years',115000),(103,'ECE','4 years',110000),(104,'BBA','3 years',80000);
INSERT INTO Student VALUES (1,'Aarav Sharma',18,'AIML','Delhi','aarav@example.com',1,101),(2,'Naina Verma',19,'CSE','Meerut','naina@example.com',1,102),(3,'Kabir Singh',20,'ECE','Roorkee','kabir@example.com',2,103),(4,'Meera Gupta',18,'AIML','Meerut','meera@example.com',1,101),(5,'Rohan Das',21,'BBA','Delhi','rohan@example.com',3,104);
INSERT INTO Employee VALUES (1,'Anil Kumar','IT',65000,'anil@example.com',1,NULL,'2022-01-10'),(2,'Priya Jain','IT',72000,'priya@example.com',1,1,'2021-05-15'),(3,'Vikas Rao','HR',48000,'vikas@example.com',3,NULL,'2023-03-20'),(4,'Sara Khan','IT',58000,'sara@example.com',1,2,'2024-07-01'),(5,'Dev Patel','Finance',52000,'dev@example.com',4,NULL,'2020-11-11');
INSERT INTO Product VALUES (1,'Keyboard',799,15),(2,'Mouse',399,0),(3,'Monitor',8500,5);
INSERT INTO Customer VALUES (1,'Asha','asha@example.com','9876543210'),(2,'Rahul','rahul@example.com','9876501234');
INSERT INTO Faculty VALUES (1,'Dr Sharma','DBMS',75000),(2,'Dr Khan','SQL',72000);
INSERT INTO Library VALUES (1,'Database Systems','Korth',650),(2,'Learning SQL','Alan Beaulieu',550);

-- 1. Insert one student
INSERT INTO Student(Student_ID,Name,Age,Course,City,Email,Dept_ID,Course_ID) VALUES(6,'Ishita Roy',19,'AIML','Haridwar','ishita@example.com',1,101);
-- 2. Five separate INSERT statements
INSERT INTO Student(Student_ID,Name,Age,Course,City) VALUES(7,'Aman Joshi',18,'CSE','Delhi');
INSERT INTO Student(Student_ID,Name,Age,Course,City) VALUES(8,'Tanya Malik',19,'AIML','Roorkee');
INSERT INTO Student(Student_ID,Name,Age,Course,City) VALUES(9,'Arjun Mehta',20,'ECE','Meerut');
INSERT INTO Student(Student_ID,Name,Age,Course,City) VALUES(10,'Simran Kaur',18,'CSE','Delhi');
INSERT INTO Student(Student_ID,Name,Age,Course,City) VALUES(11,'Kunal Shah',21,'BBA','Noida');
-- 3. Multiple rows in one statement
INSERT INTO Student(Student_ID,Name,Age,Course,City) VALUES(12,'Pooja Saini',19,'AIML','Roorkee'),(13,'Yash Jain',20,'CSE','Delhi');
-- 4. Insert employee
INSERT INTO Employee(Emp_ID,Emp_Name,Department,Salary,Email,Dept_ID,Joining_Date) VALUES(6,'Neha Verma','HR',50000,'neha@example.com',3,'2025-02-01');
-- 5. Insert department
INSERT INTO Department VALUES(5,'Physics','Block E');
-- 6. Insert product
INSERT INTO Product VALUES(4,'Webcam',1800,8);
-- 7. Insert customer
INSERT INTO Customer VALUES(3,'Mohan','mohan@example.com','9876512345');
-- 8. Insert course
INSERT INTO Course VALUES(105,'Data Science','4 years',125000);
-- 9. Student with all columns
INSERT INTO Student VALUES(14,'Riya Kapoor',19,'AIML','Delhi','riya@example.com',1,101);
-- 10. Insert selected columns only
INSERT INTO Student(Student_ID,Name,Age) VALUES(15,'Aditi Sen',18);
-- 11. Update city of one student
UPDATE Student SET City='Jaipur' WHERE Student_ID=1;
-- 12. Update employee salary
UPDATE Employee SET Salary=68000 WHERE Emp_ID=1;
-- 13. Increase all salaries by 10%
UPDATE Employee SET Salary=Salary*1.10;
-- 14. Increase all product prices by 5%
UPDATE Product SET Price=Price*1.05;
-- 15. Change student's course
UPDATE Student SET Course='Data Science' WHERE Student_ID=2;
-- 16. Update employee department
UPDATE Employee SET Department='Technology' WHERE Emp_ID=2;
-- 17. Change Meerut students' city to Delhi
UPDATE Student SET City='Delhi' WHERE City='Meerut';
-- 18. Update course fees
UPDATE Course SET Fees=130000 WHERE Course_ID=101;
-- 19. Update multiple columns
UPDATE Student SET Age=20, City='Dehradun' WHERE Student_ID=3;
-- 20. Delete student by ID
DELETE FROM Student WHERE Student_ID=15;
-- 21. Delete students from a city
DELETE FROM Student WHERE City='Noida';
-- 22. Delete employees below a salary amount
DELETE FROM Employee WHERE Salary<40000;
-- 23. Delete products with zero quantity
DELETE FROM Product WHERE Quantity=0;
-- 24. DELETE using AND/OR
DELETE FROM Student WHERE (City='Jaipur' AND Age>20) OR Course='Temporary';
-- 25. INSERT, UPDATE, DELETE and display after each operation
INSERT INTO Student(Student_ID,Name,Age,Course,City) VALUES(90,'Demo Student',18,'AIML','Roorkee');
SELECT * FROM Student WHERE Student_ID=90;
UPDATE Student SET City='Delhi',Age=19 WHERE Student_ID=90;
SELECT * FROM Student WHERE Student_ID=90;
DELETE FROM Student WHERE Student_ID=90;
SELECT * FROM Student WHERE Student_ID=90;
