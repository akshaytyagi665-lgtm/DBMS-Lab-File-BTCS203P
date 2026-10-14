-- Lab Sheet 1: DDL Commands
-- Run in MySQL Workbench

-- 1. Create database
CREATE DATABASE IF NOT EXISTS CollegeDB;
-- 2. Create Student table
CREATE TABLE IF NOT EXISTS Student_DDL_Demo(Student_ID INT, Name VARCHAR(100), Age INT, Course VARCHAR(60), City VARCHAR(60));
-- 3. Create Employee table
CREATE TABLE IF NOT EXISTS Employee_DDL_Demo(Emp_ID INT, Emp_Name VARCHAR(100), Department VARCHAR(60));
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
-- 18. Rename City column to Address
ALTER TABLE Student_Details_Demo RENAME COLUMN City TO Address;
-- 19. Add Salary column to Employee demo
ALTER TABLE Employee_DDL_Demo ADD COLUMN Salary DECIMAL(10,2);
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
