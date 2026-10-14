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
    (1, 'Computer Science', 'Block A'),
    (2, 'Electronics', 'Block B'),
    (3, 'Management', 'Block C'),
    (4, 'Mathematics', 'Block D'),
    (5, 'Physics', 'Block E');

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
    (5, 'Rohan Das', 21, 'BBA', 'Delhi', 'rohan@example.com', 3, 104),
    (6, 'Ishita Roy', 19, 'Undeclared', 'Haridwar', 'ishita@example.com', NULL, NULL);

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
SELECT s.Name, d.Dept_Name
FROM Student AS s
INNER JOIN Department AS d
    ON s.Dept_ID = d.Dept_ID;

-- Q2
SELECT
    s.Name AS Student_Name,
    d.Dept_Name
FROM Student AS s
INNER JOIN Department AS d
    ON s.Dept_ID = d.Dept_ID;

-- Q3
SELECT
    e.Emp_Name,
    d.Dept_Name
FROM Employee AS e
INNER JOIN Department AS d
    ON e.Dept_ID = d.Dept_ID;

-- Q4
SELECT
    s.Name,
    c.Course_Name,
    c.Duration,
    c.Fees
FROM Student AS s
INNER JOIN Course AS c
    ON s.Course_ID = c.Course_ID;

-- Q5
SELECT
    s.Name,
    d.Dept_Name
FROM Student AS s
INNER JOIN Department AS d
    ON s.Dept_ID = d.Dept_ID
WHERE d.Dept_Name = 'Computer Science';

-- Q6
SELECT
    s.Name,
    d.Dept_Name
FROM Student AS s
LEFT JOIN Department AS d
    ON s.Dept_ID = d.Dept_ID;

-- Q7
SELECT
    s.Name,
    s.Dept_ID,
    d.Dept_Name
FROM Student AS s
LEFT JOIN Department AS d
    ON s.Dept_ID = d.Dept_ID;

-- Q8
SELECT
    s.Name,
    d.Dept_Name
FROM Student AS s
RIGHT JOIN Department AS d
    ON s.Dept_ID = d.Dept_ID;

-- Q9
SELECT
    d.Dept_Name,
    s.Name AS Student_Name
FROM Department AS d
LEFT JOIN Student AS s
    ON d.Dept_ID = s.Dept_ID;

-- Q10
SELECT s.Name
FROM Student AS s
LEFT JOIN Department AS d
    ON s.Dept_ID = d.Dept_ID
WHERE d.Dept_ID IS NULL;

-- Q11
SELECT
    d.Dept_ID,
    d.Dept_Name
FROM Department AS d
LEFT JOIN Student AS s
    ON d.Dept_ID = s.Dept_ID
WHERE s.Student_ID IS NULL;

-- Q12
SELECT
    s.Student_ID,
    s.Name,
    d.Dept_ID,
    d.Dept_Name
FROM Student AS s
LEFT JOIN Department AS d
    ON s.Dept_ID = d.Dept_ID
UNION
SELECT
    s.Student_ID,
    s.Name,
    d.Dept_ID,
    d.Dept_Name
FROM Student AS s
RIGHT JOIN Department AS d
    ON s.Dept_ID = d.Dept_ID
WHERE s.Student_ID IS NULL;

-- Q13
SELECT
    s.Name,
    c.Course_Name
FROM Student AS s
CROSS JOIN Course AS c;

-- Q14
SELECT COUNT(*) AS Possible_Combinations
FROM Student
CROSS JOIN Course;

-- Q15
SELECT
    Name,
    Dept_Name
FROM Student
NATURAL JOIN Department;

-- Q16
SELECT
    Name,
    Dept_Name
FROM Student
NATURAL JOIN Department;

SELECT
    s.Name,
    d.Dept_Name
FROM Student AS s
INNER JOIN Department AS d
    ON s.Dept_ID = d.Dept_ID;

-- Q17
SELECT
    e.Emp_Name AS Employee_Name,
    m.Emp_Name AS Manager_Name
FROM Employee AS e
LEFT JOIN Employee AS m
    ON e.Manager_ID = m.Emp_ID;

-- Q18
SELECT
    e.Emp_Name,
    m.Emp_Name AS Manager_Name
FROM Employee AS e
LEFT JOIN Employee AS m
    ON e.Manager_ID = m.Emp_ID;

-- Q19
SELECT
    s.Name,
    d.Dept_Name,
    c.Course_Name
FROM Student AS s
LEFT JOIN Department AS d
    ON s.Dept_ID = d.Dept_ID
LEFT JOIN Course AS c
    ON s.Course_ID = c.Course_ID;

-- Q20
SELECT
    s.Name AS Student_Name,
    c.Course_Name,
    d.Dept_Name
FROM Student AS s
LEFT JOIN Course AS c
    ON s.Course_ID = c.Course_ID
LEFT JOIN Department AS d
    ON s.Dept_ID = d.Dept_ID;

-- Q21
SELECT
    e.Emp_Name,
    e.Department,
    e.Salary
FROM Employee AS e
INNER JOIN (
    SELECT
        Dept_ID,
        AVG(Salary) AS Average_Salary
    FROM Employee
    GROUP BY Dept_ID
) AS a
    ON e.Dept_ID = a.Dept_ID
WHERE e.Salary > a.Average_Salary;

-- Q22
SELECT
    d.Dept_Name,
    COUNT(s.Student_ID) AS Student_Count
FROM Department AS d
LEFT JOIN Student AS s
    ON d.Dept_ID = s.Dept_ID
GROUP BY d.Dept_ID, d.Dept_Name
HAVING COUNT(s.Student_ID) = (
    SELECT MAX(counts_by_department.Student_Count)
    FROM (
        SELECT COUNT(*) AS Student_Count
        FROM Student
        WHERE Dept_ID IS NOT NULL
        GROUP BY Dept_ID
    ) AS counts_by_department
);

-- Q23
SELECT
    d.Dept_Name,
    COUNT(s.Student_ID) AS Total_Students
FROM Department AS d
LEFT JOIN Student AS s
    ON d.Dept_ID = s.Dept_ID
GROUP BY d.Dept_ID, d.Dept_Name
ORDER BY d.Dept_Name;

-- Q24
SELECT
    c.Course_Name,
    COUNT(s.Student_ID) AS Enrolled_Students
FROM Course AS c
LEFT JOIN Student AS s
    ON c.Course_ID = s.Course_ID
GROUP BY c.Course_ID, c.Course_Name
ORDER BY c.Course_Name;

-- Q25
SELECT
    d.Dept_Name,
    c.Course_Name,
    COUNT(s.Student_ID) AS Student_Count,
    COUNT(DISTINCT s.City) AS Different_Cities
FROM Department AS d
LEFT JOIN Student AS s
    ON d.Dept_ID = s.Dept_ID
LEFT JOIN Course AS c
    ON s.Course_ID = c.Course_ID
GROUP BY
    d.Dept_ID,
    d.Dept_Name,
    c.Course_ID,
    c.Course_Name
ORDER BY
    d.Dept_Name,
    c.Course_Name;
