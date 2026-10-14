-- Lab Sheet 5: SQL Joins
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

-- 1. INNER JOIN Student and Department
SELECT s.Name,d.Dept_Name FROM Student s INNER JOIN Department d ON s.Dept_ID=d.Dept_ID;
-- 2. Student names with department names
SELECT s.Name AS Student_Name,d.Dept_Name FROM Student s INNER JOIN Department d ON s.Dept_ID=d.Dept_ID;
-- 3. Employee names with department names
SELECT e.Emp_Name,d.Dept_Name FROM Employee e INNER JOIN Department d ON e.Dept_ID=d.Dept_ID;
-- 4. Students with course details
SELECT s.Name,c.Course_Name,c.Duration,c.Fees FROM Student s INNER JOIN Course c ON s.Course_ID=c.Course_ID;
-- 5. Students in a particular department
SELECT s.Name,d.Dept_Name FROM Student s INNER JOIN Department d ON s.Dept_ID=d.Dept_ID WHERE d.Dept_Name='Computer Science';
-- 6. LEFT OUTER JOIN
SELECT s.Name,d.Dept_Name FROM Student s LEFT JOIN Department d ON s.Dept_ID=d.Dept_ID;
-- 7. All students, including students without a matching department
SELECT s.Name,s.Dept_ID,d.Dept_Name FROM Student s LEFT JOIN Department d ON s.Dept_ID=d.Dept_ID;
-- 8. RIGHT OUTER JOIN
SELECT s.Name,d.Dept_Name FROM Student s RIGHT JOIN Department d ON s.Dept_ID=d.Dept_ID;
-- 9. All departments including departments without students
SELECT d.Dept_Name,s.Name FROM Department d LEFT JOIN Student s ON s.Dept_ID=d.Dept_ID;
-- 10. Students not assigned to a department
SELECT s.Name FROM Student s LEFT JOIN Department d ON s.Dept_ID=d.Dept_ID WHERE d.Dept_ID IS NULL;
-- 11. Departments with no students
SELECT d.Dept_ID,d.Dept_Name FROM Department d LEFT JOIN Student s ON s.Dept_ID=d.Dept_ID WHERE s.Student_ID IS NULL;
-- 12. FULL OUTER JOIN workaround in MySQL
SELECT s.Name,d.Dept_Name FROM Student s LEFT JOIN Department d ON s.Dept_ID=d.Dept_ID
UNION
SELECT s.Name,d.Dept_Name FROM Student s RIGHT JOIN Department d ON s.Dept_ID=d.Dept_ID WHERE s.Student_ID IS NULL;
-- 13. CROSS JOIN
SELECT s.Name,c.Course_Name FROM Student s CROSS JOIN Course c;
-- 14. Count Student-Course combinations
SELECT COUNT(*) AS Possible_Combinations FROM Student CROSS JOIN Course;
-- 15. NATURAL JOIN (common column: Dept_ID)
SELECT Name,Dept_Name FROM Student NATURAL JOIN Department;
-- 16. Compare NATURAL JOIN and INNER JOIN
SELECT Name,Dept_Name FROM Student NATURAL JOIN Department;
SELECT s.Name,d.Dept_Name FROM Student s INNER JOIN Department d ON s.Dept_ID=d.Dept_ID;
-- 17. SELF JOIN for employee-manager relationship
SELECT e.Emp_Name AS Employee,m.Emp_Name AS Manager FROM Employee e LEFT JOIN Employee m ON e.Manager_ID=m.Emp_ID;
-- 18. Employees and manager names
SELECT e.Emp_Name,m.Emp_Name AS Manager_Name FROM Employee e LEFT JOIN Employee m ON e.Manager_ID=m.Emp_ID;
-- 19. Join Student, Department and Course
SELECT s.Name,d.Dept_Name,c.Course_Name FROM Student s LEFT JOIN Department d ON s.Dept_ID=d.Dept_ID LEFT JOIN Course c ON s.Course_ID=c.Course_ID;
-- 20. Student name, course name and department name
SELECT s.Name AS Student_Name,c.Course_Name,d.Dept_Name FROM Student s LEFT JOIN Course c ON s.Course_ID=c.Course_ID LEFT JOIN Department d ON s.Dept_ID=d.Dept_ID;
-- 21. Employees earning more than their department average salary
SELECT e.Emp_Name,e.Department,e.Salary FROM Employee e JOIN (SELECT Dept_ID,AVG(Salary) AS Avg_Salary FROM Employee GROUP BY Dept_ID) a ON e.Dept_ID=a.Dept_ID WHERE e.Salary>a.Avg_Salary;
-- 22. Department(s) with the maximum number of students
SELECT d.Dept_Name,COUNT(s.Student_ID) AS Student_Count FROM Department d LEFT JOIN Student s ON s.Dept_ID=d.Dept_ID GROUP BY d.Dept_ID,d.Dept_Name HAVING COUNT(s.Student_ID)=(SELECT MAX(cnt) FROM (SELECT COUNT(*) AS cnt FROM Student GROUP BY Dept_ID) AS counts_by_dept);
-- 23. Departments and number of students in each
SELECT d.Dept_Name,COUNT(s.Student_ID) AS Total_Students FROM Department d LEFT JOIN Student s ON s.Dept_ID=d.Dept_ID GROUP BY d.Dept_ID,d.Dept_Name ORDER BY d.Dept_Name;
-- 24. Courses and number of students enrolled in each
SELECT c.Course_Name,COUNT(s.Student_ID) AS Enrolled_Students FROM Course c LEFT JOIN Student s ON s.Course_ID=c.Course_ID GROUP BY c.Course_ID,c.Course_Name ORDER BY c.Course_Name;
-- 25. Student-department-course report with joins, GROUP BY and aggregates
SELECT d.Dept_Name,c.Course_Name,COUNT(s.Student_ID) AS Student_Count,COUNT(DISTINCT s.City) AS Different_Cities FROM Department d LEFT JOIN Student s ON s.Dept_ID=d.Dept_ID LEFT JOIN Course c ON s.Course_ID=c.Course_ID GROUP BY d.Dept_ID,d.Dept_Name,c.Course_ID,c.Course_Name ORDER BY d.Dept_Name,c.Course_Name;
