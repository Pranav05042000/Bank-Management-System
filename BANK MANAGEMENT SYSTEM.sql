-- Bank Management System Project --

-- Creating Database --
Drop database  Bank_Management_System ;

CREATE DATABASE Bank_Management_System ;
USE Bank_Management_System ;


-- Creating Tables --

-- TTABLE NO.1 ACCOUNT TYPE

CREATE TABLE Account_type 
(Account_no INT PRIMARY KEY ,
Type_Account VARCHAR(10) ,
Manager_id INT ,
Department_name VARCHAR (10),
Opening_Date VARCHAR(15) ) ;

-- IMPORTINFG THE DATA 

INSERT INTO
Account_type
VALUES 
 (12345, 'Saving', 20, 'Account', '2003-04-23'), 
(67899, 'loan', 21, 'Loan', '2004-05-24'), 
 (10112, 'Saving', 22, 'HR', '2006-01-04'),
(13145, 'loan', 23, 'Admin', '2003-04-23'),  
(15167, 'current', 24, 'Sales', '2004-05-24'), 
 (18190, 'business', 25, 'Security', '2006-01-04'), 
 (20210, 'loan', 26, 'Account', '2003-04-23'),  
(22230, 'Saving', 27, 'Loan', '2004-05-24'),
  (24250, 'loan', 28, 'HR', '2006-01-04'),  
(26270, 'current', 29, 'Admin', '2003-04-23'),  
(28290, 'business', 30, 'Sales', '2004-05-24'),
  (30310, 'current', 31, 'Security', '2006-01-04'),
  (32330, 'Saving', 32, 'Account', '2003-04-23'),
  (34350, 'loan', 33, 'Loan', '2004-05-24'),
  (36370, 'current', 34, 'HR', '2006-01-04'),
  (38390, 'current', 35, 'Admin', '2003-04-23'),
  (40410, 'business', 36, 'Sales', '2004-05-24'),
  (42430, 'loan', 37, 'Security', '2006-01-04'),
  (44450, 'Saving', 38, 'Account', '2003-04-23'), 
 (46470, 'loan', 39, 'Loan', '2004-05-24'),
  (48490, 'Saving', 40, 'HR', '2006-01-04') ;
  
  SELECT * FROM Account_type ;

-- CREATING TABLE NO. 2 DEPARTMENTS

CREATE TABLE Departments 
(Department_id INT PRIMARY KEY,
Department_name VARCHAR(15),
Manager_id INT ,
Employee_id INT ,
Account_no INT ,
FOREIGN KEY (Account_No) REFERENCES Account_type(Account_no) ) ;


-- IMPORTING THE DATA

INSERT INTO 
Departments
VALUES
(1, 'Account', 20, 50, 12345), 
(8, 'Loan', 21, 51, 67899),
(11, 'HR', 22, 52, 10112), 
(16, 'Admin', 23, 53, 13145),
(19, 'Sales', 24, 54, 15167), 
(21, 'Security', 25, 55, 18190),
(56, NULL, NULL, NULL, 20210);



-- CREATING TABLE NO.3 BANK DETAILS

CREATE TABLE  Bank_Details 
(Branch_code INT  PRIMARY KEY ,
Address VARCHAR (30) ,
Department_id  INT ,
Branch_name VARCHAR (15),
State VARCHAR(15),
FOREIGN KEY (Department_id) REFERENCES Departments(Department_id) );


-- IMPORTING THE DATA

INSERT INTO 
Bank_Details
VALUES
(100, 'Ngapur', 1, 'ICIC_N', 'Maharashtra'),
(101, 'Pune', 1, 'ICIC_P', 'Maharashtra'),
(102, 'Mumbai', 1, 'ICIC_M', 'Maharashtra'),
(103, 'Delhi', 1, 'ICIC_D', 'DEL'),
(104, 'Mumbai', 1, 'ICIC_M', 'Maharashtra'),
(105, 'Delhi', 1, 'ICIC_D', 'DEL'),
(106, 'Ngapur', 1, 'ICIC_N', 'Maharashtra'),
(107, 'Pune', 8, 'ICIC_P', 'Maharashtra'),
(108, 'Mumbai', 8, 'ICIC_M', 'Maharashtra'),
(109, 'Ngapur', 8, 'ICIC_N', 'Maharashtra'),
(110, 'Pune', 11, 'ICIC_P', 'Maharashtra'),
(111, 'Mumbai', 11, 'ICIC_M', 'Maharashtra'),
(112, 'Delhi', 11, 'ICIC_D', 'DEL'),
(113, 'Ngapur', 11, 'ICIC_N', 'Maharashtra'),
(114, 'Pune', 11, 'ICIC_P', 'Maharashtra'),
(115, 'Mumbai', 16, 'ICIC_M', 'Maharashtra'),
(116, 'Ngapur', 16, 'ICIC_N', 'Maharashtra'),
(117, 'Pune', 16, 'ICIC_P', 'Maharashtra'),
(118, 'Mumbai', 19, 'ICIC_M', 'Maharashtra'),
(119, 'Delhi', 19, 'ICIC_D', 'DEL'),
(120, 'Pune', 21, 'ICIC_P', 'Maharashtra');


-- CREATING TABLE NO. 4 JOB DETAILS


CREATE TABLE Job_Details
(Job_id VARCHAR (15) ,
Department_id INT ,
Branch_code INT ,
FOREIGN KEY (Department_id) REFERENCES Departments(Department_id));


-- IMPORTING THE DATA

INSERT INTO
Job_Details
VALUES
('ST_CLERK', 1, 101), 
('ST_MAN', 8, 108),
('FI_ACCOUNT', 11, 113), 
('SA_REP', 19, 118);


-- CREATING TABLE NO. 5 EMPLOYEES


CREATE TABLE Employees 
( Employee_id INT PRIMARY KEY,
First_name VARCHAR(15),
Department_id INT,
Manager_id INT,
Job_id VARCHAR(20),
Email VARCHAR(30),
Hire_Date VARCHAR(30),
Phone_no VARCHAR(20),
Salary INT ,
FOREIGN KEY (Department_id) REFERENCES Departments(Department_id) ,
FOREIGN KEY (Job_id) REFERENCES Job_Details(Job_id)) ;



-- IMPORTING THE DATA 



INSERT INTO
Employees
VALUES
(50, 'Samuel', 1, 20, 'ST_CLERK', 'SMCCAIN@example.com', '2007-11-23','650.505.1876', 3800),
(51, 'Allan', 8, 21, 'ST_CLERK', 'SSEWALL@example.com', '2004-01-30', '650.505.2876', 3600),
(52, 'Irene', 11, 22, 'ST_CLERK', 'SSTILES@example.com', '2004-03-04', '650.505.3876', 2900),
(53, 'Kevin', 16, 23, 'ST_CLERK', 'STOBIAS@example.com', '2004-08-01', '650.505.4876', 2500),
(54, 'Julia', 19, 24, 'ST_CLERK', 'SVOLLMAN@example.com', '2005-03-10', '650.501.1876', 4000),
(55, 'Donald', 21, 25, 'ST_CLERK', 'TFOX@example.com', '2005-12-15', '650.501.2876', 3900),
(56, 'Christopher', 1, 26, 'ST_CLERK', 'TGATES@example.com', '2006-11-03', '650.501.3876', 3200),
(57, 'TJ', 8, 27, 'ST_MAN', 'TJOLSON@example.com', '2005-11-11', '650.501.4876', 2800),
(58, 'Lisa', 11, 28, 'ST_MAN', 'TRAJS@example.com', '2007-03-19', '650.507.9811', 3100),
(59, 'Karen', 16, 29, 'ST_MAN', 'VJONES@example.com', '2008-01-24', '650.507.9822', 3000),
(60, 'Valli', 19, 30, 'ST_MAN', 'VPATABAL@example.com', '2008-02-23', '650.507.9833', 2600),
(61, 'Joshua', 21, 31, 'ST_MAN', 'WGIETZ@example.com', '2003-05-01', '650.507.9844', 6400),
(62, 'Randall', 1, 32, 'FI_ACCOUNT', 'WSMITH@example.com', '2005-10-10', '515.123.4444', 6200),
(63, 'Hazel', 8, 33, 'FI_ACCOUNT', 'WTAYLOR@example.com', '2007-11-16', '515.123.5555', 11500),
(64, 'Luis', 11, 34, 'FI_ACCOUNT', 'JNAYER@example.com', '2005-07-16', '603.123.6666', 10000),
(65, 'Trenna', 16, 35, 'FI_ACCOUNT', 'JPATEL@example.com', '2006-09-28', '515.123.7777', 9600),
(66, 'Den', 19, 36, 'FI_ACCOUNT', 'JRUSSEL@example.com', '2007-01-14', '515.123.8888', 7400),
(67, 'Michael', 21, 37, 'SA_REP', 'JSEO@example.com', '2008-03-08', '515.123.8080', 7300),
(68, 'John', 1, 38, 'SA_REP', 'JTAYLOR@example.com', '2005-08-20', '011.44.1346.329268', 6100),
(69, 'Nandita', 8, 39, 'SA_REP', 'JWHALEN@example.com', '2005-10-30', '011.44.1346.529268', 11000),
(70, 'Ismael', 11, 40, 'SA_REP', 'KCHUNG@example.com', '2005-02-16', '011.44.1346.52', 8800);


-- CREATING TABLE NO.6 CUSTOMERS


CREATE TABLE Customer 
(Account_no INT PRIMARY KEY ,
First_Name VARCHAR(15),
City VARCHAR(10),
Branch_code INT,
Employee_id INT,
Phone_no VARCHAR(20),
ATM_no INT UNIQUE KEY ,
Exp_date  VARCHAR(15),
Pin_No INT UNIQUE KEY  ,
FOREIGN KEY (Branch_code) REFERENCES Bank_Details(Branch_code),
FOREIGN KEY (Employee_id) REFERENCES Employees(Employee_id));


-- RETRIVING THE DATA FROM THE TABLES 

SELECT * FROM Account_type ;

SELECT * FROM Bank_Details ;

SELECT * FROM Customer ;

SELECT * FROM Departments ;

SELECT * FROM Employees ;

SELECT * FROM Job_Details ;


-- Q N A


-- 1. Find an employee’s whose id is 52 and branch name is icicp.

SELECT e.First_name , b.Branch_name
FROM Employees AS e
JOIN Bank_Details AS b
ON e.Department_id = b.Department_id
WHERE e.Employee_id = 52 
AND b.Branch_name = 'ICIC_P' ;


-- 2. Write a query to fetch all the details who doesn’t belong to mumbai, pune, delhi .

SELECT *
FROM Bank_Details
WHERE Address NOT IN ('Mumbai','Pune','Delhi')  ;


-- 3. Find details department name, address, branch code, dept _id, city of the account no 18190.

SELECT d.Department_id,d.Department_name ,
b.Address , b.Branch_code , c.City 
FROM Departments AS d
JOIN Bank_Details AS b
ON d.Department_id = b.Department_id 
JOIN Customer AS c 
ON b.Branch_code = c.Branch_code
JOIN Account_type AS a
ON a.Account_no = d.Account_no 
WHERE a.Account_no = 18190;


-- 4. Find department id, department name, job id whose only work in Loan, HR, admin.

SELECT d.Department_id,e.Job_id,d.Department_name 
FROM Departments AS d
JOIN Employees AS e
ON d.Department_id = e.Department_id 
WHERE d.Department_name IN ('Hr','Loan','Admin') ;

-- 5. Find the type_account, state , account number whose atm no 422748663.


SELECT a.Account_no ,a.Type_Account,b.State 
FROM Account_type AS a 
JOIN Departments AS d 
ON a.Account_no = d.Account_no
JOIN Bank_Details AS b
ON d.Department_id = b.Department_id
JOIN Customer AS c
ON b.Branch_code = c.Branch_code
WHERE Atm_no = 422748663 ;


-- 6.Create a view with that show address, branch name, department name, first name. phone no.

CREATE VIEW Employees_Details AS
SELECT e.First_name,b.Branch_name,d.Department_name,
b.Address,e.Phone_no
FROM Departments AS d
JOIN Bank_Details AS b
ON d.Department_id = b.Department_id
JOIN Employees AS e
ON d.Department_id = e.Department_id ;

SELECT * FROM Employees_Details ;


-- 7. Create view city, department name whose opening date is less than 24 May 04

CREATE VIEW  Department_detail AS
SELECT d.Department_name,c.City,a.Opening_Date
FROM Departments AS d 
JOIN Employees AS e 
ON d.Department_id = e.Department_id
JOIN Customer AS c
On e.Employee_id = c.Employee_id 
JOIN Account_type As a
WHERE a.Opening_Date < '2004/05/24' ;

SELECT * FROM Department_detail ;


-- 8.Create view only job id for clerk, manager, an accountant with all detail and name it employee job_deatils

CREATE VIEW  Employee_Job_Details AS
SELECT *
FROM Employees
WHERE JOB_ID IN('ST_CLERK','ST_MAN','FI_ACCOUNT');

SELECT * FROM Employee_Job_Details ;

-- 9. In the Customer table change the atm_no 423295535 with 42321992.

SET SQL_SAFE_UPDATES = OFF ;

UPDATE Customer SET Atm_no = 423295535 
WHERE Atm_no = 42321992 ;

SELECT * FROM
Customer
WHERE Atm_no = 423295535 ;

-- 10. In the Account_type table change all sales account into admin.

UPDATE Account_type SET Department_name = 'Admin'
WHERE Department_name = 'Sales' ;

SELECT * FROM Account_type ;