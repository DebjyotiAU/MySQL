CREATE DATABASE COLLEGE;
USE COLLEGE;

-- Q1.
CREATE TABLE employees 
( id integer PRIMARY KEY,
  Name varchar(20),
  dept varchar(20)); 
INSERT INTO employees (id,Name,dept) VALUES
(10,'walter','engineering'),(12,'baburao','sales'),(100,'dhoni','enfineering');
select * from employees;

-- Q2)
DESC employees;

-- Q3)    
    CREATE TABLE Student (
    Roll INT PRIMARY KEY,
    Name VARCHAR(30),
    Age INT,
    Course VARCHAR(5),
    Math DECIMAL(6,2),
    Physics DECIMAL(6,2),
    Computer DECIMAL(6,2),
    Birthday DATE
);

-- Q4)
CREATE TABLE MSc LIKE Student;

-- Q)5
DESC MSc;

-- Q)6)
CREATE TABLE MCA LIKE Student;
ALTER TABLE MCA CHANGE Name FirstName VARCHAR(30);
ALTER Table MCA CHANGE Course Department VARCHAR(5);

-- Q)7
DESC MCA;

-- Q)8
INSERT INTO Student (Roll, Name, Age, Course, Math, Physics, Computer, Birthday)
Values  
(1, 'Rahul', 19, 'BCA', 79.5, 67, 89, '1993-06-15'),
(2, 'Kunal', 21, 'BCA', 68, 76, 59.5, '1991-08-16'),
(4,'Sumit',20,'MCA',80,68,63,'1994-09-15'),
(5,'Anirban',22,'MCA',80,68,63,'1994-09-15'),
(7,'Suman',21,'BCA',91.5,32,61,'1994-03-10'),
(8, 'Rohit', 22, 'MSc', 85, 76, 92, '1992-04-19');   

-- Q)9)
Select * from Student;    

-- Q10)
select * from student where Roll=5;

-- Q)11
select Roll, Name, Math, Physics, Computer from student;

-- Q)12
select * from student where Course='BCA';

-- Q)13)
INSERT INTO MCA (Roll, FirstName,Age, Department, Math, Physics, Computer, Birthday)
SELECT Roll, Name,Age, Course, Math, Physics, Computer, Birthday
FROM Student WHERE Course = 'MCA';

-- Q)14
INSERT INTO MSc
SELECT *
FROM Student
WHERE Course = 'MSc';

-- Q)15)
DESC Student;
DESC MCA;   -- execute separately.

-- Q)16
select Course,Roll,Name,Age,Math,Physics,Computer,Birthday from Student;

-- Q)17
Update student
set Math=95 where Roll=7;

-- Q)18
update MCA set FirstName='Sumitava' where Roll=4;

-- Q)19
delete from student where Roll=2;
 
-- Q)20
truncate student;
