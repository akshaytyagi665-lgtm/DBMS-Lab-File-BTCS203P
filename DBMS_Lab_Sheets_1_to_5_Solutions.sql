-- DBMS Lab Sheets 1-5: MySQL Solutions
-- Lab Code: BTCS203P | Run in MySQL Workbench
-- Contains examples for all 125 tasks. Demo DDL statements use *_Demo tables
-- where needed so that rename/drop examples do not destroy the working tables.

CREATE DATABASE IF NOT EXISTS CollegeDB;
USE CollegeDB;

-- Shared tables and sample data for Labs 2-5
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

-- ================================================================
-- LAB SHEET 1: DDL COMMANDS (25 TASKS)
-- ================================================================
-- 1. Create database
CREATE DATABASE IF NOT EXISTS CollegeDB;
-- 2. Create Student table
CREATE TABLE IF NOT EXISTS Student_DDL_Demo(Student_ID INT, Name VARCHAR(100), Age INT, Course VARCHAR(60), City VARCHAR(60));
-- 3. Create Employee table
CREATE TABLE IF NOT EXISTS Employee_DDL_Demo(Emp_ID INT, Emp_Name VARCHAR(100), Department VARCHAR(60), Salary DECIMAL(10,2));
-- 4. Create Department table
CREATE TABLE IF NOT EXISTS Department_DDL_Demo(Dept_ID INT, Dept_Name VARCHAR(60), Location VARCHAR(60));
-- 5. Create Product table
CREATE TABLE IF NOT EXISTS Product_DDL_Demo(Product_ID INT, Product_Name VARCHAR(100), Price DECIMAL(10,2), Quantity INT);
-- 6. Create Customer table
CREATE TABLE IF NOT EXISTS Customer_DDL_Demo(Customer_ID INT, Customer_Name VARCHAR(100), Email VARCHAR(120), Phone VARCHAR(20));
-- 7. Create Course table
CREATE TABLE IF NOT EXISTS Course_DDL_Demo(Course_ID INT, Course_Name VARCHAR(60), Duration VARCHAR(30), Fees DECIMAL(10,2));
-- 8. Create Faculty table
CREATE TABLE IF NOT EXISTS Faculty_DDL_Demo(Faculty_ID INT, Faculty_Name VARCHAR(100), Subject VARCHAR(60), Salary DECIMAL(10,2));
-- 9. Create Library table
CREATE TABLE IF NOT EXISTS Library_DDL_Demo(Book_ID INT, Book_Name VARCHAR(150), Author VARCHAR(100), Price DECIMAL(10,2));
-- 10. Department primary key
CREATE TABLE IF NOT EXISTS Department_PK_Demo(Dept_ID INT PRIMARY KEY, Dept_Name VARCHAR(60), Location VARCHAR(60));
-- 11. Student primary key and NOT NULL
CREATE TABLE IF NOT EXISTS Student_Constraint_Demo(Student_ID INT PRIMARY KEY, Name VARCHAR(100) NOT NULL, Age INT);
-- 12. Employee unique email
CREATE TABLE IF NOT EXISTS Employee_Unique_Demo(Emp_ID INT PRIMARY KEY, Emp_Name VARCHAR(100), Email VARCHAR(120) UNIQUE);
-- 13. Product CHECK constraint
CREATE TABLE IF NOT EXISTS Product_Check_Demo(Product_ID INT PRIMARY KEY, Product_Name VARCHAR(100), Price DECIMAL(10,2) CHECK(Price>0));
-- 14. Add Email column
ALTER TABLE Student_DDL_Demo ADD COLUMN Email VARCHAR(120);
-- 15. Add Phone column
ALTER TABLE Student_DDL_Demo ADD COLUMN Phone VARCHAR(20);
-- 16. Modify Name size
ALTER TABLE Student_DDL_Demo MODIFY COLUMN Name VARCHAR(150);
-- 17. Rename Student table
ALTER TABLE Student_DDL_Demo RENAME TO Student_Details_Demo;
-- 18. Rename City column to Address (MySQL 8+)
ALTER TABLE Student_Details_Demo RENAME COLUMN City TO Address;
-- 19. Add Salary column to Employee demo
ALTER TABLE Employee_DDL_Demo ADD COLUMN Salary_Allowance DECIMAL(10,2);
-- 20. Drop Phone column
ALTER TABLE Student_Details_Demo DROP COLUMN Phone;
-- 21. Drop Email column
ALTER TABLE Student_Details_Demo DROP COLUMN Email;
-- 22. TRUNCATE removes all rows, keeps table structure
TRUNCATE TABLE Library_DDL_Demo;
-- 23. Drop Course table
DROP TABLE IF EXISTS Course_DDL_Demo;
-- 24. Drop Customer table
DROP TABLE IF EXISTS Customer_DDL_Demo;
-- 25. Complete constraints and ALTER/DROP
CREATE TABLE IF NOT EXISTS Student_Complete_Demo(Student_ID INT PRIMARY KEY, Name VARCHAR(100) NOT NULL, Email VARCHAR(120) UNIQUE, Age INT CHECK(Age>=16));
ALTER TABLE Student_Complete_Demo ADD COLUMN City VARCHAR(60);
ALTER TABLE Student_Complete_Demo MODIFY COLUMN City VARCHAR(100);
ALTER TABLE Student_Complete_Demo DROP COLUMN City;

-- ================================================================
-- LAB SHEET 2: DML COMMANDS (25 TASKS)
-- ================================================================
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

-- ================================================================
-- LAB SHEET 3: SQL FUNCTIONS (25 TASKS)
-- ================================================================
-- 1. ABS
SELECT ABS(-25) AS Absolute_Value;
-- 2. ROUND
SELECT ROUND(123.4567,2) AS Rounded_Value;
-- 3. CEIL and FLOOR
SELECT CEIL(12.3) AS Ceiling_Value, FLOOR(12.8) AS Floor_Value;
-- 4. MOD
SELECT MOD(17,5) AS Remainder;
-- 5. Rounded employee salaries
SELECT Emp_Name,Salary,ROUND(Salary) AS Rounded_Salary FROM Employee;
-- 6. COUNT students
SELECT COUNT(*) AS Total_Students FROM Student;
-- 7. SUM salaries
SELECT SUM(Salary) AS Total_Salary FROM Employee;
-- 8. AVG salary
SELECT AVG(Salary) AS Average_Salary FROM Employee;
-- 9. MAX salary
SELECT MAX(Salary) AS Highest_Salary FROM Employee;
-- 10. MIN salary
SELECT MIN(Salary) AS Lowest_Salary FROM Employee;
-- 11. UPPER names
SELECT Name,UPPER(Name) AS Upper_Name FROM Student;
-- 12. LOWER names
SELECT Name,LOWER(Name) AS Lower_Name FROM Student;
-- 13. LENGTH names (byte length in MySQL)
SELECT Name,LENGTH(Name) AS Name_Length FROM Student;
-- 14. CONCAT first and last name
SELECT CONCAT('Aarav',' ','Sharma') AS Full_Name;
-- 15. SUBSTRING and SUBSTR
SELECT SUBSTRING('Database Management',1,8) AS Extracted_Text, SUBSTR('Database Management',10,10) AS Extracted_Substring;
-- 16. Number to string
SELECT CAST(12345 AS CHAR) AS Number_As_String;
-- 17. String to number
SELECT CAST('456.75' AS DECIMAL(10,2)) AS String_As_Number;
-- 18. Format a date
SELECT DATE_FORMAT('2026-10-14','%d-%m-%Y') AS Formatted_Date;
-- 19. CAST
SELECT CAST('2026-10-14' AS DATE) AS Cast_Date;
-- 20. CONVERT in MySQL
SELECT CONVERT('789',UNSIGNED) AS Converted_Number;
-- 21. Current date
SELECT CURDATE() AS Current_Date;
-- 22. Extract year, month and day
SELECT YEAR('2026-10-14') AS Year_Value, MONTH('2026-10-14') AS Month_Value, DAY('2026-10-14') AS Day_Value;
-- 23. Date difference
SELECT DATEDIFF('2026-10-14','2026-10-01') AS Days_Difference;
-- 24. Add days to date
SELECT DATE_ADD('2026-10-14',INTERVAL 7 DAY) AS Date_After_Seven_Days;
-- 25. Format employee joining dates
SELECT Emp_Name,Joining_Date,DATE_FORMAT(Joining_Date,'%d/%m/%Y') AS Formatted_Joining_Date FROM Employee;

-- ================================================================
-- LAB SHEET 4: SQL OPERATORS (25 TASKS)
-- ================================================================
-- 1. Addition
SELECT 10+5 AS Addition_Result;
-- 2. Subtraction
SELECT 10-5 AS Subtraction_Result;
-- 3. Multiplication
SELECT 10*5 AS Multiplication_Result;
-- 4. Division
SELECT 10/5 AS Division_Result;
-- 5. Price multiplied by quantity
SELECT Product_Name,Price,Quantity,Price*Quantity AS Total_Amount FROM Product;
-- 6. AND
SELECT * FROM Student WHERE Age>=18 AND City='Delhi';
-- 7. OR
SELECT * FROM Student WHERE City='Delhi' OR City='Roorkee';
-- 8. NOT
SELECT * FROM Student WHERE NOT City='Delhi';
-- 9. Course AND city
SELECT * FROM Student WHERE Course='AIML' AND City='Delhi';
-- 10. Either of two departments
SELECT * FROM Employee WHERE Department='IT' OR Department='HR';
-- 11. Equal operator
SELECT * FROM Student WHERE City='Delhi';
-- 12. Greater-than
SELECT * FROM Employee WHERE Salary>60000;
-- 13. Less-than
SELECT * FROM Employee WHERE Salary<60000;
-- 14. >= and <=
SELECT * FROM Employee WHERE Salary>=50000 AND Salary<=70000;
-- 15. Not equal
SELECT * FROM Student WHERE City<>'Delhi';
-- Alternative: SELECT * FROM Student WHERE City!='Delhi';
-- 16. BETWEEN
SELECT * FROM Employee WHERE Salary BETWEEN 50000 AND 70000;
-- 17. IN
SELECT * FROM Student WHERE City IN('Delhi','Roorkee','Meerut');
-- 18. NOT IN
SELECT * FROM Student WHERE City NOT IN('Delhi','Roorkee');
-- 19. LIKE names beginning with A
SELECT * FROM Student WHERE Name LIKE 'A%';
-- 20. IS NULL / IS NOT NULL
SELECT * FROM Employee WHERE Manager_ID IS NULL;
SELECT * FROM Employee WHERE Manager_ID IS NOT NULL;
-- 21. UNION removes duplicates
SELECT City AS Place FROM Student UNION SELECT Location AS Place FROM Department;
-- 22. UNION ALL keeps duplicates
SELECT City AS Place FROM Student UNION ALL SELECT Location AS Place FROM Department;
-- 23. INTERSECT equivalent for MySQL versions without INTERSECT
SELECT DISTINCT s.City FROM Student s INNER JOIN Department d ON s.City=d.Location;
-- 24. EXCEPT/MINUS equivalent using NOT EXISTS
SELECT DISTINCT s.City FROM Student s WHERE NOT EXISTS(SELECT 1 FROM Department d WHERE d.Location=s.City);
-- 25. Arithmetic + logical + comparison + special operators
SELECT Product_Name,Price,Quantity,Price*Quantity AS Total_Amount FROM Product WHERE Price>500 AND Quantity BETWEEN 1 AND 20 AND Product_Name LIKE '%o%';

-- ================================================================
-- LAB SHEET 5: SQL JOINS (25 TASKS)
-- ================================================================
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

-- END OF SOLUTIONS
