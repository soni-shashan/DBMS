--PRACTICAL 1

CREATE TABLE JOB (
    job_id varchar2(15) NOT NULL UNIQUE,
    job_title varchar2(30) NOT NULL,
    min_sal number(7,2) NOT NULL,
    max_sal number(7,2) NOT NULL
);

CREATE TABLE EMPLOYEES (
    emp_no number(10) CONSTRAINT emp_no_pk PRIMARY KEY,
    emp_name varchar2(30) CONSTRAINT emp_name_nn NOT NULL,
    emp_sal number(8,2) CONSTRAINT emp_sal_chk CHECK (emp_sal>0),
    emp_comm number(6,1) CONSTRAINT emp_comn_chk CHECK (emp_comm>=0),
    dept_no number(3) CONSTRAINT dept_no_nn NOT NULL
);

CREATE TABLE DEPOSIT (
    a_no varchar2(5) NOT NULL UNIQUE,
    cname varchar2(15) NOT NULL,
    bname varchar2(10) NOT NULL,
    amount number(7,2) NOT NULL,
    a_date date NOT NULL
);

CREATE TABLE BORROW (
    loanno varchar2(5) NOT NULL UNIQUE,
    cname varchar2(15) NOT NULL,
    bname varchar2(15) NOT NULL,
    amount number(7,2) NOT NULL
);
INSERT INTO EMPLOYEES(emp_no,emp_name,emp_sal,emp_comm,dept_no)VALUES(101,'Smith',800,455,20);
INSERT INTO EMPLOYEES(emp_no,emp_name,emp_sal,emp_comm,dept_no)VALUES(102,'Snehal',1600,0,25);
INSERT INTO EMPLOYEES(emp_no,emp_name,emp_sal,emp_comm,dept_no)VALUES(103,'Adama',1100,425,20);
INSERT INTO EMPLOYEES(emp_no,emp_name,emp_sal,dept_no)VALUES(104,'Aman',3000,15);
INSERT INTO EMPLOYEES(emp_no,emp_name,emp_sal,emp_comm,dept_no)VALUES(105,'Anita',5000,50000,10);
INSERT INTO EMPLOYEES(emp_no,emp_name,emp_sal,dept_no)VALUES(106,'Anamika',2975,30);

SELECT * FROM EMPLOYEES;

DROP TABLE EMPLOYEES;

INSERT INTO JOB(job_id,job_title,min_sal,max_sal)VALUES('IT PROG','Programmer',4000,10000);
INSERT INTO JOB(job_id,job_title,min_sal,max_sal)VALUES('MK MGR','Marketing Manager',9000,15000);
INSERT INTO JOB(job_id,job_title,min_sal,max_sal)VALUES('FI MGR','Finance Manager',8200,12000);
INSERT INTO JOB(job_id,job_title,min_sal,max_sal)VALUES('FI ACC','Account',4200,9000);
INSERT INTO JOB(job_id,job_title,min_sal,max_sal)VALUES('LEC','Lecturer',6000,17000);
INSERT INTO JOB(job_id,job_title,min_sal,max_sal)VALUES('COMP OP','Computer Operator',1500,13000);

SELECT * FROM JOB;

INSERT INTO DEPOSIT(a_no,cname,bname,amount,a_date)VALUES('101','Anil','andheri',7000,TO_DATE('01-01-2006','DD-MM-YYYY'));
INSERT INTO DEPOSIT(a_no,cname,bname,amount,a_date)VALUES('102','sunil','virar',5000,TO_DATE('15-07-2006','DD-MM-YYYY'));
INSERT INTO DEPOSIT(a_no,cname,bname,amount,a_date)VALUES('103','jay','villeparle',6500,TO_DATE('12-03-2006','DD-MM-YYYY'));
INSERT INTO DEPOSIT(a_no,cname,bname,amount,a_date)VALUES('104','vijay','andheri',8000,TO_DATE('17-09-2006','DD-MM-YYYY'));
INSERT INTO DEPOSIT(a_no,cname,bname,amount,a_date)VALUES('105','keyur','dadar',7500,TO_DATE('19-11-2006','DD-MM-YYYY'));
INSERT INTO DEPOSIT(a_no,cname,bname,amount,a_date)VALUES('106','mayur','borivali',5500,TO_DATE('21-12-2006','DD-MM-YYYY'));

SELECT * FROM DEPOSIT;

INSERT INTO BORROW(loanno,cname,bname,amount)VALUES('201','ANIL','VRCE',1000);
INSERT INTO BORROW(loanno,cname,bname,amount)VALUES('206','MEHUL','AJNI',5000);
INSERT INTO BORROW(loanno,cname,bname,amount)VALUES('311','SUNIL','DHARAMPETH',3000);
INSERT INTO BORROW(loanno,cname,bname,amount)VALUES('321','MADHURI','ANDHERI',2000);
INSERT INTO BORROW(loanno,cname,bname,amount)VALUES('375','PRMOD','VIRAR',8000);
INSERT INTO BORROW(loanno,cname,bname,amount)VALUES('481','KRANTI','NEHRU PLACE',3000);

SELECT * FROM BORROW;

--PRACTICAL 2

CREATE TABLE SUPPLIER AS SELECT * FROM EMPLOYEES;

SELECT * FROM SUPPLIER;

DESCRIBE SUPPLIER;

CREATE TABLE SUP1 AS SELECT EMP_NO,EMP_NAME FROM EMPLOYEES;

SELECT * FROM SUP1;

DESCRIBE SUP1;

CREATE TABLE SUP2 AS SELECT * FROM EMPLOYEES WHERE 1=0;

DESCRIBE SUP2;

SELECT * FROM SUP_2;

INSERT INTO SUP2 SELECT * FROM EMPLOYEES WHERE EMP_NAME='Anita';

ALTER TABLE SUP2 RENAME TO SUP_2;

DESCRIBE SUP_2;

DROP TABLE SUP1;

DESCRIBE SUP1;


ALTER TABLE EMPLOYEES ADD PHONE varchar2(10);

SELECT * FROM EMPLOYEES;

ALTER TABLE EMPLOYEES MODIFY PHONE CHAR(10);

DESCRIBE EMPLOYEES;

ALTER TABLE SUP_2 DROP COLUMN EMP_NAME;

ALTER TABLE SUP_2 RENAME COLUMN EMP_SAL TO NEW_EMP_SAL;


--PRACTICAL 3


SELECT * FROM EMPLOYEES;
SELECT * FROM JOB;
SELECT * FROM DEPOSIT;

SELECT job_title,max_sal FROM JOB;

SELECT bname FROM DEPOSIT;
SELECT bname FROM BORROW;

SELECT a_no,amount FROM DEPOSIT WHERE a_date BETWEEN TO_DATE('01-01-2006','DD-MM-YYYY') AND TO_DATE('25-07-2006','DD-MM-YYYY');

SELECT cname FROM DEPOSIT WHERE a_date > TO_DATE('09-10-2006','DD-MM-YYYY');

SELECT emp_name AS employees_name,emp_sal AS salary FROM EMPLOYEES WHERE dept_no=20;

SELECT emp_no,emp_sal,dept_no FROM EMPLOYEES WHERE dept_no IN(10,20);

SELECT emp_no,emp_sal,dept_no FROM EMPLOYEES WHERE dept_no BETWEEN 15 AND 25;

SELECT emp_name FROM EMPLOYEES WHERE emp_comm IS NOT NULL;

SELECT TO_CHAR(min_sal) || '-' || TO_CHAR(max_sal) AS SALARY_RANGE FROM JOB;

INSERT INTO SUP_2(EMP_NO,NEW_EMP_SAL,EMP_COMM,DEPT_NO) SELECT emp_no,emp_sal,emp_comm,dept_no FROM EMPLOYEES;

SELECT * FROM SUP_2;

DELETE FROM SUP1;
ALTER TABLE SUP1 RENAME TO SUP;

SELECT * FROM SUP;

DELETE FROM SUP_2 WHERE emp_no=103;

UPDATE EMPLOYEES SET emp_name='Anita' WHERE emp_name='Aman';

SELECT * FROM EMPLOYEES;

UPDATE EMPLOYEES SET emp_name='HELLO' WHERE emp_no=103;

SELECT MAX(max_sal) AS max_salary, MIN(min_sal) AS min_salary FROM JOB;

SELECT AVG(emp_sal) AS AVG_SALARY FROM EMPLOYEES;

SELECT COUNT(*) AS TOTAL_ROWS,COUNT(DISTINCT  dept_no) AS distinct_dept_no FROM EMPLOYEES WHERE emp_sal>1000;

SELECT * FROM EMPLOYEES ORDER BY emp_name ASC, emp_no ASC;

SELECT * FROM EMPLOYEES ORDER BY emp_name DESC, emp_no DESC;

SELECT dept_no, emp_comm FROM EMPLOYEES ORDER BY dept_no ASC, emp_comm DESC;

UPDATE EMPLOYEES SET emp_comm = 500 WHERE dept_no = 20;

SELECT emp_comm, emp_sal FROM EMPLOYEES ORDER BY emp_comm ASC NULLS FIRST, emp_sal DESC;

SELECT emp_comm, emp_no FROM EMPLOYEES ORDER BY emp_comm ASC NULLS LAST, emp_no DESC;

--PRACTICAL 4


-- Step 1: Creating Employee and Customer schemas with constraints

DROP TABLE EMPLOYEES;
CREATE TABLE EMPLOYEES (
    emp_id NUMBER PRIMARY KEY,
    emp_name VARCHAR2(50) NOT NULL,
    emp_sal NUMBER CHECK (emp_sal > 0) NOT NULL,
    job_id VARCHAR2(30) UNIQUE,
    dept_no NUMBER,
    phone CHAR(10)
);

DROP TABLE CUSTOMER;
CREATE TABLE CUSTOMER (
    cust_id NUMBER PRIMARY KEY,
    cust_name VARCHAR2(50) NOT NULL,
    branch VARCHAR2(50) NOT NULL
);

-- Inserting sample data into Employee table
INSERT INTO EMPLOYEES (emp_id, emp_name, emp_sal, job_id, dept_no, phone)
VALUES (101, 'Aman', 3000, 'FI_ACC', 20, '1234567890');
INSERT INTO EMPLOYEES (emp_id, emp_name, emp_sal, job_id, dept_no, phone)
VALUES (102, 'Adama', 2500, 'MK_MGR', 10, '2345678901');
INSERT INTO EMPLOYEES (emp_id, emp_name, emp_sal, job_id, dept_no, phone)
VALUES (103, 'Anita', 5000, 'IT_PROG', 30, '3456789012');
INSERT INTO EMPLOYEES (emp_id, emp_name, emp_sal, job_id, dept_no, phone)
VALUES (104, 'Anamika', 2975, 'LEC', 15, '4567890123');
INSERT INTO EMPLOYEES (emp_id, emp_name, emp_sal, job_id, dept_no, phone)
VALUES (105, 'Snehal', 1600, 'COMP_OP', 25, NULL);

-- Inserting sample data into Customer table
INSERT INTO Customer (cust_id, cust_name, branch)
VALUES (201, 'Anil', 'Andheri');
INSERT INTO Customer (cust_id, cust_name, branch)
VALUES (202, 'Sunil', 'Virar');
INSERT INTO Customer (cust_id, cust_name, branch)
VALUES (203, 'Keyur', 'Dadar');
INSERT INTO Customer (cust_id, cust_name, branch)
VALUES (204, 'Vijay', 'Borivali');

-- Task Queries


-- 1. Retrieve employees whose names start with 'A' or have 'a' as the third character
SELECT * FROM EMPLOYEES
WHERE emp_name LIKE 'A%' OR SUBSTR(emp_name, 3, 1) = 'a';

-- 2. Retrieve employees whose names are exactly 5 characters long and start with 'Ani'
SELECT emp_name, emp_id, emp_sal FROM EMPLOYEES
WHERE LENGTH(emp_name) = 5 AND emp_name LIKE 'Ani%';






-- 1. Retrieve employees whose second character is 'M' or 'N'
SELECT * FROM EMPLOYEES
WHERE SUBSTR(emp_name, 2, 1) IN ('m', 'n');


-- 2. Retrieve employees whose second character is 'n' and names are exactly 5 characters long
SELECT * FROM EMPLOYEES
WHERE LENGTH(emp_name) = 5 AND SUBSTR(emp_name, 2, 1) = 'n';

-- 3. Identify employees with incomplete details and third character as 'a'
SELECT * FROM EMPLOYEES
WHERE (emp_sal IS NULL OR phone IS NULL) AND SUBSTR(emp_sal, 3, 1) = 'a';


-- 1. Retrieve names of customers in 'Andheri', 'Dadar', or 'Virar'
SELECT cust_name FROM CUSTOMER
WHERE branch IN ('Andheri', 'Dadar', 'Virar');



-- 1. Retrieve job titles with Job_IDs starting with 'FI_'
SELECT Job_ID FROM Job
WHERE Job_ID LIKE 'FI_%';


-- 2. Retrieve job titles ending with '_MGR' and max salary > 12000
SELECT job_title FROM JOB
WHERE job_title LIKE '%_MGR' AND max_sal > 12000;

-- Final Verification Queries
SELECT * FROM EMPLOYEES;
SELECT * FROM CUSTOMER;


--PRACTICAL 5



-- Creating the JobProfile table
CREATE TABLE JobProfile (
    Emp_ID INT PRIMARY KEY,                -- Primary Key for Employee ID
    Emp_Name VARCHAR(100) NOT NULL,         -- Employee Name (cannot be null)
    Emp_Salary DECIMAL(10, 2) NOT NULL CHECK (Emp_Salary > 0), -- Salary (cannot be null, must be greater than 0)
    Job_ID VARCHAR(20) UNIQUE,              -- Unique Job ID
    Department VARCHAR(100)                -- Department Name
);

-- Creating the Customer table
CREATE TABLE Customer (
    Cust_ID INT PRIMARY KEY,               -- Primary Key for Customer ID
    Cust_Name VARCHAR(100) NOT NULL        -- Customer Name (cannot be null)
);

INSERT INTO JobProfile (Emp_ID, Emp_Name, Emp_Salary, Job_ID, Department) 
VALUES (101, 'Smith', 800.00, 'J101', 'Sales');

INSERT INTO JobProfile (Emp_ID, Emp_Name, Emp_Salary, Job_ID, Department) 
VALUES (102, 'Snehal', 1600.00, 'J102', 'Marketing');

INSERT INTO JobProfile (Emp_ID, Emp_Name, Emp_Salary, Job_ID, Department) 
VALUES (103, 'Adama', 1100.00, 'J103', 'Sales');

INSERT INTO JobProfile (Emp_ID, Emp_Name, Emp_Salary, Job_ID, Department) 
VALUES (104, 'Aman', 3000.00, 'J104', 'HR');

INSERT INTO JobProfile (Emp_ID, Emp_Name, Emp_Salary, Job_ID, Department) 
VALUES (105, 'Anita', 5000.00, 'J105', 'Finance');

INSERT INTO JobProfile (Emp_ID, Emp_Name, Emp_Salary, Job_ID, Department) 
VALUES (106, 'Anamika', 2975.00, 'J106', 'Operations');




-- 1. Calculate the average salary of employees (with and without duplicates).
-- Average salary with duplicates
SELECT AVG(Emp_Salary) AS Average_Salary
FROM JobProfile;

-- Average salary without duplicates
SELECT AVG(DISTINCT Emp_Salary) AS Distinct_Average_Salary
FROM JobProfile;

-- 2. Retrieve the minimum salary from the JobProfile table.
SELECT MIN(Emp_Salary) AS Min_Salary
FROM JobProfile;

-- 3. Count the total number of employees and distinct departments.
-- Total number of employees
SELECT COUNT(Emp_ID) AS Total_Employees
FROM JobProfile;

-- Distinct number of departments
SELECT COUNT(DISTINCT Department) AS Distinct_Departments
FROM JobProfile;

-- 4. Retrieve the maximum salary from the JobProfile table.
SELECT MAX(Emp_Salary) AS Max_Salary
FROM JobProfile;

-- 5. Calculate the total and distinct sum of all salaries.
-- Total sum of salaries
SELECT SUM(Emp_Salary) AS Total_Salary
FROM JobProfile;

-- Distinct sum of salaries
SELECT SUM(DISTINCT Emp_Salary) AS Distinct_Total_Salary
FROM JobProfile;


-- 1. Calculate the absolute difference between each employee’s salary and ₹1,000.
SELECT Emp_ID, Emp_Name, ABS(Emp_Salary - 1000) AS Salary_Absolute_Difference
FROM JobProfile;

-- 2. Compute the square of each employee’s salary.
SELECT Emp_ID, Emp_Name, POWER(Emp_Salary, 2) AS Squared_Salary
FROM JobProfile;

-- 3. Round salaries to two decimal places.
SELECT Emp_ID, Emp_Name, ROUND(Emp_Salary, 2) AS Rounded_Salary
FROM JobProfile;

-- 4. Find the square root of salaries.
SELECT Emp_ID, Emp_Name, SQRT(Emp_Salary) AS Salary_Square_Root
FROM JobProfile;

-- 1. Convert all employee first names to lowercase, uppercase, and initial caps.
-- Lowercase first name
SELECT Emp_ID, LOWER(Emp_Name) AS Lowercase_Name
FROM JobProfile;

-- Uppercase first name
SELECT Emp_ID, UPPER(Emp_Name) AS Uppercase_Name
FROM JobProfile;

-- Initial caps first name
SELECT Emp_ID, INITCAP(Emp_Name) AS Initial_Caps_Name
FROM JobProfile;

-- 2. Extract the first three characters of employee first names.
SELECT Emp_ID, SUBSTR(Emp_Name, 1, 3) AS First_Three_Chars
FROM JobProfile;


-- 3. Find the length of each employee’s first name.
SELECT Emp_ID, LENGTH(Emp_Name) AS Name_Length
FROM JobProfile;

-- 4. Remove leading 'A' and trailing 'a' from employee first names.
SELECT Emp_ID, TRIM(LEADING 'A' FROM TRIM(TRAILING 'a' FROM Emp_Name)) AS Cleaned_Name
FROM JobProfile;

-- 5. Pad employee first names with '*' on the left and right, ensuring a total length of 10.
SELECT Emp_ID, LPAD(RPAD(Emp_Name, 10, '*'), 10, '*') AS Padded_Name
FROM JobProfile;


-- 1. Convert a string representation of a salary to a numeric format.
SELECT Emp_ID, CAST(Emp_Salary AS DECIMAL(10,2)) AS Numeric_Salary
FROM JobProfile;

-- 2. Format a numeric salary value into a string with specific formatting.
SELECT Emp_ID, TO_CHAR(Emp_Salary, '999,999.99') AS Formatted_Salary
FROM JobProfile;


-- 1. Calculate the date after adding 6 months to the current date.
SELECT ADD_MONTHS(CURRENT_DATE, 6) AS Date_After_6_Months
FROM dual;


-- 2. Retrieve the last day of the current month.
SELECT LAST_DAY(CURRENT_DATE) AS Last_Day_Of_Month
FROM dual;


-- 3. Calculate the number of months between two dates.
SELECT MONTHS_BETWEEN(TO_DATE('2025-12-31', 'YYYY-MM-DD'), TO_DATE('2025-01-01', 'YYYY-MM-DD')) AS Months_Between
FROM dual;


-- 4. Find the next Monday from the current date.
SELECT NEXT_DAY(CURRENT_DATE, 'MONDAY') AS Next_Monday
FROM dual;



-- 1. Retrieve the union of first names from employees and customers.
SELECT Emp_Name AS First_Name
FROM JobProfile
UNION
SELECT Cust_Name AS First_Name
FROM Customer;

-- 2. Retrieve the union of first names (including duplicates).
SELECT Emp_Name AS First_Name
FROM JobProfile
UNION ALL
SELECT Cust_Name AS First_Name
FROM Customer;

-- 3. Find the intersection of first names from employees and customers.
SELECT Emp_Name AS First_Name
FROM JobProfile
INTERSECT
SELECT Cust_Name AS First_Name
FROM Customer;

-- 4. Identify first names present in the employees table but not in customers.
SELECT Emp_Name AS First_Name
FROM JobProfile
MINUS
SELECT Cust_Name AS First_Name
FROM Customer;

-- PRACTICAL 6
CREATE TABLE Product (
    detorder_no VARCHAR(50),  
    product_no VARCHAR(50) NOT NULL ,
    qty_order INT NOT NULL
);

CREATE TABLE emp_company (
    ENAME VARCHAR(100) NOT NULL ,
    CNAME VARCHAR(100) NOT NULL,    
    SALARY DECIMAL(10, 2) NOT NULL 
);


-- Inserting provided data into Product table
INSERT INTO Product (detorder_no, product_no, qty_order) VALUES ('O19001', 'P00001', 10);
INSERT INTO Product (detorder_no, product_no, qty_order) VALUES ('O19001', 'P00002', 3);
INSERT INTO Product (detorder_no, product_no, qty_order) VALUES ('O19002', 'P00001', 4);
INSERT INTO Product (detorder_no, product_no, qty_order) VALUES ('O19003', 'P00004', 2);
INSERT INTO Product (detorder_no, product_no, qty_order) VALUES ('O19004', 'P00003', 6);
INSERT INTO Product (detorder_no, product_no, qty_order) VALUES ('O19005', 'P00005', 2);
INSERT INTO Product (detorder_no, product_no, qty_order) VALUES ('O19006', 'P00004', 7);


-- Displaying all rows in Product table
SELECT * FROM Product;

-- Retrieving total quantity ordered for each product
SELECT product_no, SUM(qty_order) AS total_qty_ordered
FROM Product
GROUP BY product_no;


-- Retrieving total quantities ordered for products P00001 and P00004
SELECT product_no, SUM(qty_order) AS total_qty_ordered
FROM Product
WHERE product_no IN ('P00001', 'P00004')
GROUP BY product_no;


-- Inserting data into emp_company table
INSERT INTO emp_company (ENAME, CNAME, SALARY) VALUES ('Anil', 'ACC', 1500);
INSERT INTO emp_company (ENAME, CNAME, SALARY) VALUES ('Shankar', 'TATA', 2000);
INSERT INTO emp_company (ENAME, CNAME, SALARY) VALUES ('Jay', 'WIPRO', 1800);
INSERT INTO emp_company (ENAME, CNAME, SALARY) VALUES ('Sunil', 'WIPRO', 1700);
INSERT INTO emp_company (ENAME, CNAME, SALARY) VALUES ('Vijay', 'TATA', 5000);
INSERT INTO emp_company (ENAME, CNAME, SALARY) VALUES ('Prakash', 'TATA', 3000);
INSERT INTO emp_company (ENAME, CNAME, SALARY) VALUES ('Ajay', 'ACC', 8000);
INSERT INTO emp_company (ENAME, CNAME, SALARY) VALUES ('Abhay', 'ACC', 1800);

-- Displaying all rows in the emp_company table to verify correct insertion
SELECT * FROM emp_company;

-- Retrieving the maximum salary for each company
SELECT CNAME, MAX(SALARY) AS max_salary
FROM emp_company
GROUP BY CNAME;

-- Retrieving the average salary for each company
SELECT CNAME, AVG(SALARY) AS avg_salary
FROM emp_company
GROUP BY CNAME;

-- Retrieving the companies with an average salary greater than ₹1,500
SELECT CNAME, AVG(SALARY) AS avg_salary
FROM emp_company
GROUP BY CNAME
HAVING AVG(SALARY) > 1500;

-- Retrieving the average salary for each company except ACC
SELECT CNAME, AVG(SALARY) AS avg_salary
FROM emp_company
WHERE CNAME != 'ACC'
GROUP BY CNAME;


-- PRACTICAL 8
CREATE TABLE Salespeople (
    Snum NUMBER PRIMARY KEY,
    Sname VARCHAR2(100),
    City VARCHAR2(100),
    Comm NUMBER
);

-- Insert valid salespeople records
INSERT INTO Salespeople (Snum, Sname, City, Comm) VALUES (1, 'Name1', NULL, NULL);
INSERT INTO Salespeople (Snum, Sname, City, Comm) VALUES (2, 'Name2', NULL, 10);
INSERT INTO Salespeople (Snum, Sname, City, Comm) VALUES (3, 'Name3', NULL, NULL);
INSERT INTO Salespeople (Snum, Sname, City, Comm) VALUES (4, 'Name4', NULL, 20);
INSERT INTO Salespeople (Snum, Sname, City, Comm) VALUES (5, 'Name5', NULL, NULL);
INSERT INTO Salespeople (Snum, Sname, City, Comm) VALUES (6, 'Name6', NULL, 30);
INSERT INTO Salespeople (Snum, Sname, City, Comm) VALUES (7, 'Name7', NULL, NULL);
INSERT INTO Salespeople (Snum, Sname, City, Comm) VALUES (8, 'Name8', NULL, 40);
INSERT INTO Salespeople (Snum, Sname, City, Comm) VALUES (9, 'Name9', NULL, NULL);
INSERT INTO Salespeople (Snum, Sname, City, Comm) VALUES (10, 'Name10', NULL, 50);
INSERT INTO Salespeople (Snum, Sname, City, Comm) VALUES (11, 'Name11', NULL, NULL);
INSERT INTO Salespeople (Snum, Sname, City, Comm) VALUES (12, 'Name12', NULL, 60);
INSERT INTO Salespeople (Snum, Sname, City, Comm) VALUES (13, 'Name13', NULL, NULL);
INSERT INTO Salespeople (Snum, Sname, City, Comm) VALUES (14, 'Name14', NULL, 70);
INSERT INTO Salespeople (Snum, Sname, City, Comm) VALUES (15, 'Name15', NULL, NULL);
INSERT INTO Salespeople (Snum, Sname, City, Comm) VALUES (16, 'Name16', NULL, 80);
INSERT INTO Salespeople (Snum, Sname, City, Comm) VALUES (17, 'Name17', NULL, NULL);
INSERT INTO Salespeople (Snum, Sname, City, Comm) VALUES (18, 'Name18', NULL, 90);
INSERT INTO Salespeople (Snum, Sname, City, Comm) VALUES (19, 'Name19', NULL, NULL);
INSERT INTO Salespeople (Snum, Sname, City, Comm) VALUES (20, 'Name20', NULL, 100);
INSERT INTO Salespeople (Snum, Sname, City, Comm) VALUES (21, 'Name21', NULL, NULL);
INSERT INTO Salespeople (Snum, Sname, City, Comm) VALUES (22, 'Name22', NULL, 110);
INSERT INTO Salespeople (Snum, Sname, City, Comm) VALUES (23, 'Name23', NULL, NULL);
INSERT INTO Salespeople (Snum, Sname, City, Comm) VALUES (24, 'Name24', NULL, 120);
INSERT INTO Salespeople (Snum, Sname, City, Comm) VALUES (25, 'Name25', NULL, NULL);
INSERT INTO Salespeople (Snum, Sname, City, Comm) VALUES (26, 'Name26', NULL, 130);
INSERT INTO Salespeople (Snum, Sname, City, Comm) VALUES (27, 'Name27', NULL, NULL);
INSERT INTO Salespeople (Snum, Sname, City, Comm) VALUES (28, 'Name28', NULL, 140);
INSERT INTO Salespeople (Snum, Sname, City, Comm) VALUES (29, 'Name29', NULL, NULL);
INSERT INTO Salespeople (Snum, Sname, City, Comm) VALUES (30, 'Name30', NULL, 150);
INSERT INTO Salespeople (Snum, Sname, City, Comm) VALUES (31, 'Name31', NULL, NULL);
INSERT INTO Salespeople (Snum, Sname, City, Comm) VALUES (32, 'Name32', NULL, 160);
INSERT INTO Salespeople (Snum, Sname, City, Comm) VALUES (33, 'Name33', NULL, NULL);
INSERT INTO Salespeople (Snum, Sname, City, Comm) VALUES (34, 'Name34', NULL, 170);
INSERT INTO Salespeople (Snum, Sname, City, Comm) VALUES (35, 'Name35', NULL, NULL);
INSERT INTO Salespeople (Snum, Sname, City, Comm) VALUES (36, 'Name36', NULL, 180);
INSERT INTO Salespeople (Snum, Sname, City, Comm) VALUES (37, 'Name37', NULL, NULL);
INSERT INTO Salespeople (Snum, Sname, City, Comm) VALUES (38, 'Name38', NULL, 190);
INSERT INTO Salespeople (Snum, Sname, City, Comm) VALUES (39, 'Name39', NULL, NULL);
INSERT INTO Salespeople (Snum, Sname, City, Comm) VALUES (40, 'Name40', NULL, 200);
INSERT INTO Salespeople (Snum, Sname, City, Comm) VALUES (41, 'Name41', NULL, NULL);
INSERT INTO Salespeople (Snum, Sname, City, Comm) VALUES (42, 'Name42', NULL, 210);
INSERT INTO Salespeople (Snum, Sname, City, Comm) VALUES (43, 'Name43', NULL, NULL);
INSERT INTO Salespeople (Snum, Sname, City, Comm) VALUES (44, 'Name44', NULL, 220);
INSERT INTO Salespeople (Snum, Sname, City, Comm) VALUES (45, 'Name45', NULL, NULL);
INSERT INTO Salespeople (Snum, Sname, City, Comm) VALUES (46, 'Name46', NULL, 230);
INSERT INTO Salespeople (Snum, Sname, City, Comm) VALUES (47, 'Name47', NULL, NULL);
INSERT INTO Salespeople (Snum, Sname, City, Comm) VALUES (48, 'Name48', NULL, 240);
INSERT INTO Salespeople (Snum, Sname, City, Comm) VALUES (49, 'Name49', NULL, NULL);
INSERT INTO Salespeople (Snum, Sname, City, Comm) VALUES (50, 'Name50', NULL, 250);


SELECT * FROM Salespeople;

DROP TABLE Salespeople;


--PRACTICAL 9


-- Create Sales People Table with unique name
-- Create Salesperson Table
CREATE TABLE SALES_PEOPLE2 (
    SALESPERSON_ID INT PRIMARY KEY,         -- Unique salesperson ID
    SNAME VARCHAR(100),                     -- Salesperson name
    CITY VARCHAR(100),                      -- City
    COMMISION_RATE DECIMAL(5, 2)            -- Commission rate
);

-- Create Customer Table
CREATE TABLE CUSTOMER2 (
    CUSTOMER2_ID INT PRIMARY KEY,           -- Unique identifier for the customer
    CUSTOMER2_NAME VARCHAR(100) NOT NULL,   -- Customer name, can't be null
    CITY VARCHAR(100),                      -- City (Nullable)
    RATING DECIMAL(3, 2) DEFAULT 5.00,      -- Customer rating (Default: 5.00)
    SALESPERSON2_ID INT,                    -- Foreign key for Salesperson managing the customer
    FOREIGN KEY (SALESPERSON2_ID) REFERENCES SALES_PEOPLE2(SALESPERSON_ID)  -- Link to Salesperson table
);

-- Create Order Table
CREATE TABLE ORDER2 (
    ORDER2_ID INT PRIMARY KEY,              -- Unique order ID
    ORDER2_AMOUNT DECIMAL(10, 2),           -- Order amount (can be a decimal)
    ORDER2_DATE DATE,                       -- Date of the order
    CUSTOMER2_ID INT,                       -- Foreign key linking to Customer table
    SALESPERSON2_ID INT,                    -- Foreign key linking to Salesperson table
    FOREIGN KEY (CUSTOMER2_ID) REFERENCES CUSTOMER2(CUSTOMER2_ID),  -- Link to Customer2 table
    FOREIGN KEY (SALESPERSON2_ID) REFERENCES SALES_PEOPLE2(SALESPERSON_ID)  -- Link to Salesperson table
);

-- Insert records into SALES_PEOPLE2 table
INSERT INTO SALES_PEOPLE2 (SALESPERSON_ID, SNAME, CITY, COMMISION_RATE) 
VALUES (1001, 'Peel', 'London', 0.12);

INSERT INTO SALES_PEOPLE2 (SALESPERSON_ID, SNAME, CITY, COMMISION_RATE) 
VALUES (1002, 'Serrs', 'San Jose', 0.12);

INSERT INTO SALES_PEOPLE2 (SALESPERSON_ID, SNAME, CITY, COMMISION_RATE) 
VALUES (1003, 'Motika', 'London', 0.12);

INSERT INTO SALES_PEOPLE2 (SALESPERSON_ID, SNAME, CITY, COMMISION_RATE) 
VALUES (1004, 'Rifkin', 'Barcelona', 0.12);

INSERT INTO SALES_PEOPLE2 (SALESPERSON_ID, SNAME, CITY, COMMISION_RATE) 
VALUES (1005, 'Axeload', 'New York', 0.12);

SELECT * FROM SALES_PEOPLE2

-- Insert records into CUSTOMER2 table
INSERT INTO CUSTOMER2 (CUSTOMER2_ID, CUSTOMER2_NAME, CITY, RATING, SALESPERSON2_ID) 
VALUES (2001, 'Hoffman', 'London', 100.00, 1001);

INSERT INTO CUSTOMER2 (CUSTOMER2_ID, CUSTOMER2_NAME, CITY, RATING, SALESPERSON2_ID) 
VALUES (2002, 'Giovanne', 'Rome', 200.00, 1003);

INSERT INTO CUSTOMER2 (CUSTOMER2_ID, CUSTOMER2_NAME, CITY, RATING, SALESPERSON2_ID) 
VALUES (2003, 'Liu', 'San Jose', 300.00, 1002);

INSERT INTO CUSTOMER2 (CUSTOMER2_ID, CUSTOMER2_NAME, CITY, RATING, SALESPERSON2_ID) 
VALUES (2004, 'Grass', 'Berlin', 100.00, 1002);

INSERT INTO CUSTOMER2 (CUSTOMER2_ID, CUSTOMER2_NAME, CITY, RATING, SALESPERSON2_ID) 
VALUES (2006, 'Clemes', 'London', 300.00, 1007);

INSERT INTO CUSTOMER2 (CUSTOMER2_ID, CUSTOMER2_NAME, CITY, RATING, SALESPERSON2_ID) 
VALUES (2007, 'Pereira', 'Rome', 100.00, 1004);

SELECT * FROM CUSTOMER2

-- Insert records into ORDER2 table
INSERT INTO ORDER2 (ORDER2_ID, ORDER2_DATE, ORDER2_AMOUNT, CUSTOMER2_ID, SALESPERSON2_ID) 
VALUES (3001, TO_DATE('1994-03-10', 'YYYY-MM-DD'), 18.96, 2002, 1002);

INSERT INTO ORDER2 (ORDER2_ID, ORDER2_DATE, ORDER2_AMOUNT, CUSTOMER2_ID, SALESPERSON2_ID) 
VALUES (3003, TO_DATE('1994-03-10', 'YYYY-MM-DD'), 767.19, 2001, 1001);

INSERT INTO ORDER2 (ORDER2_ID, ORDER2_DATE, ORDER2_AMOUNT, CUSTOMER2_ID, SALESPERSON2_ID) 
VALUES (3002, TO_DATE('1994-03-10', 'YYYY-MM-DD'), 1900.10, 2007, 1003);

INSERT INTO ORDER2 (ORDER2_ID, ORDER2_DATE, ORDER2_AMOUNT, CUSTOMER2_ID, SALESPERSON2_ID) 
VALUES (3005, TO_DATE('1994-03-10', 'YYYY-MM-DD'), 5160.45, 2003, 1002);

INSERT INTO ORDER2 (ORDER2_ID, ORDER2_DATE, ORDER2_AMOUNT, CUSTOMER2_ID, SALESPERSON2_ID) 
VALUES (3006, TO_DATE('1994-03-10', 'YYYY-MM-DD'), 1098.16, 2008, 1002);

INSERT INTO ORDER2 (ORDER2_ID, ORDER2_DATE, ORDER2_AMOUNT, CUSTOMER2_ID, SALESPERSON2_ID) 
VALUES (3009, TO_DATE('1994-04-10', 'YYYY-MM-DD'), 1713.23, 2002, 1003);

INSERT INTO ORDER2 (ORDER2_ID, ORDER2_DATE, ORDER2_AMOUNT, CUSTOMER2_ID, SALESPERSON2_ID) 
VALUES (3007, TO_DATE('1994-04-10', 'YYYY-MM-DD'), 75.75, 2004, 1002);

INSERT INTO ORDER2 (ORDER2_ID, ORDER2_DATE, ORDER2_AMOUNT, CUSTOMER2_ID, SALESPERSON2_ID) 
VALUES (3008, TO_DATE('1994-05-10', 'YYYY-MM-DD'), 4723.95, 2006, 1001);

INSERT INTO ORDER2 (ORDER2_ID, ORDER2_DATE, ORDER2_AMOUNT, CUSTOMER2_ID, SALESPERSON2_ID) 
VALUES (3010, TO_DATE('1994-06-10', 'YYYY-MM-DD'), 1309.95, 2004, 1002);

INSERT INTO ORDER2 (ORDER2_ID, ORDER2_DATE, ORDER2_AMOUNT, CUSTOMER2_ID, SALESPERSON2_ID) 
VALUES (3011, TO_DATE('1994-06-10', 'YYYY-MM-DD'), 9891.00, 2006, 1001);

SELECT* FROM ORDER2
-- Queries
-- 1. List customers handled by 'Peel' and 'Motika'
SELECT c.CUSTOMER2_ID, c.CUSTOMER2_NAME
FROM CUSTOMER2 c
JOIN SALES_PEOPLE2 s ON c.SALESPERSON2_ID = s.SALESPERSON_ID
WHERE s.SNAME IN ('Peel', 'Motika');

-- 2. List orders with amounts greater than 0
SELECT o.ORDER2_ID, o.ORDER2_AMOUNT, o.ORDER2_DATE, c.CUSTOMER2_NAME, s.SNAME
FROM ORDER2 o
JOIN CUSTOMER2 c ON o.CUSTOMER2_ID = c.CUSTOMER2_ID
JOIN SALES_PEOPLE2 s ON o.SALESPERSON2_ID = s.SALESPERSON_ID
WHERE o.ORDER2_AMOUNT > 0;

-- 3. Orders with amount > 3000, sorted in descending order
SELECT o.ORDER2_ID, o.ORDER2_AMOUNT, o.ORDER2_DATE, s.SNAME
FROM ORDER2 o
JOIN SALES_PEOPLE2 s ON o.SALESPERSON2_ID = s.SALESPERSON_ID
WHERE o.ORDER2_AMOUNT > 3000
ORDER BY o.ORDER2_AMOUNT DESC;

-- 4. List salesperson names with customer names and cities
SELECT s.SNAME AS SALESPERSON_NAME, c.CUSTOMER2_NAME, c.CITY
FROM SALES_PEOPLE2 s
JOIN CUSTOMER2 c ON s.CITY = c.CITY
WHERE s.CITY IS NOT NULL AND c.CITY IS NOT NULL;

-- 5. List all orders with customer names
SELECT o.ORDER2_ID, o.ORDER2_AMOUNT, o.ORDER2_DATE, c.CUSTOMER2_NAME
FROM ORDER2 o
JOIN CUSTOMER2 c ON o.CUSTOMER2_ID = c.CUSTOMER2_ID;

-- 6. Customers managed by salespeople with commission rate > 0.12
SELECT c.CUSTOMER2_ID, c.CUSTOMER2_NAME, c.CITY, s.SNAME
FROM CUSTOMER2 c
JOIN SALES_PEOPLE2 s ON c.SALESPERSON2_ID = s.SALESPERSON_ID
WHERE s.COMMISION_RATE > 0.12;

-- 7. Customers with same rating as 'Hoffman'
SELECT c.CUSTOMER2_ID, c.CUSTOMER2_NAME, c.RATING
FROM CUSTOMER2 c
JOIN CUSTOMER2 h ON h.CUSTOMER2_NAME = 'Hoffman'
WHERE c.RATING = h.RATING;

-- 8. Count customers with rating higher than average in 'San Jose'
SELECT COUNT(*) AS NUM_CUSTOMERS
FROM CUSTOMER2 c
WHERE c.RATING > (
    SELECT AVG(RATING)
    FROM CUSTOMER2
    WHERE CITY = 'San Jose'
);

-- 9. Salesperson names with total order amount greater than max order amount
SELECT s.SNAME
FROM SALES_PEOPLE2 s
JOIN ORDER2 o ON s.SALESPERSON_ID = o.SALESPERSON2_ID
GROUP BY s.SNAME
HAVING SUM(o.ORDER2_AMOUNT) > (SELECT MAX(ORDER2_AMOUNT) FROM ORDER2);

-- 10. Classify customer ratings as High or Low
SELECT c.CUSTOMER2_NAME, c.RATING,
       CASE
           WHEN c.RATING >= 400 THEN 'High Rating'
           ELSE 'Low Rating'
       END AS RATING_CATEGORY
FROM CUSTOMER2 c;




--PRACTICAL 10
Declare 
num1 number;
num2 number;
total number;

begin

num1:=&num1;
num2:=&num2;
total:=num1*num2;

dbms_output.put_line('Total Product Of Num1 And Num2 Is ' || total);

end;

CREATE OR REPLACE PROCEDURE calculate_product (
    num1 in NUMBER,
    num2 in NUMBER
)
AS
BEGIN
DBMS_OUTPUT.PUT_LINE('Total Product Of Num1 And Num2 is ' || num1*num2);

END;

DECLARE
ip1 number:=&ip1;
ip2 number:=&ip2;
begin
calculate_product(ip1,ip2);
end;

--1
Declare 
num1 number;
num2 number;
total number;

begin

num1:=10;
num2:=5;
total:=num1*num2;

dbms_output.put_line('Total Product Of Num1 And Num2 Is ' || total);

end;

DECLARE
ip1 number:=10;
ip2 number:=5;
begin
calculate_product(ip1,ip2);
end;


--2
Declare 
num1 number;
num2 number;
total number;

begin

num1:=15;
num2:=0;
total:=num1*num2;

dbms_output.put_line('Total Product Of Num1 And Num2 Is ' || total);

end;

DECLARE
ip1 number:=15;
ip2 number:=0;
begin
calculate_product(ip1,ip2);
end;


--3
Declare 
num1 number;
num2 number;
total number;

begin

num1:=-4;
num2:=-6;
total:=num1*num2;

dbms_output.put_line('Total Product Of Num1 And Num2 Is ' || total);

end;

DECLARE
ip1 number:=-4;
ip2 number:=-6;
begin
calculate_product(ip1,ip2);
end;

--4
Declare 
num1 number;
num2 number;
total number;

begin

num1:=7;
num2:=-3;
total:=num1*num2;

dbms_output.put_line('Total Product Of Num1 And Num2 Is ' || total);

end;

DECLARE
ip1 number:=7;
ip2 number:=-3;
begin
calculate_product(ip1,ip2);
end;

--5
Declare 
num1 number;
num2 number;
total number;

begin

num1:=2.5;
num2:=4.2;
total:=num1*num2;

dbms_output.put_line('Total Product Of Num1 And Num2 Is ' || total);

end;

DECLARE
ip1 number:=2.5;
ip2 number:=4.2;
begin
calculate_product(ip1,ip2);
end;


SELECT * FROM EMPLOYEES


DECLARE 
EMP_NAME VARCHAR2(50);
EMP_SAL NUMBER;
BEGIN

SELECT EMP_NAME,EMP_SAL INTO EMP_NAME,EMP_SAL FROM EMPLOYEES WHERE EMP_ID=106;


DBMS_OUTPUT.PUT_LINE('EMPLOYEE NAME IS ' || EMP_NAME);
DBMS_OUTPUT.PUT_LINE('EMPLOYEE SALARY IS ' || EMP_SAL);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('EMPLOYEE IS NOT FOUND');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('ERROR : ' || SQLERRM);
END;



DECLARE 
EMP_ID NUMBER;
EMP_NAME VARCHAR2(50);
EMP_SAL NUMBER;
JOB_ID VARCHAR2(30);
DEPT_NO NUMBER;
PHONE CHAR(10);
BEGIN
EMP_ID:=&EMP_ID;
EMP_NAME:='&EMP_NAME';
EMP_SAL:=&EMP_SAL;
JOB_ID:='&JOB_ID';
DEPT_NO:=&DEPT_NO;
PHONE:='&PHONE';

INSERT INTO EMPLOYEES (EMP_ID, EMP_NAME, EMP_SAL, JOB_ID, DEPT_NO, PHONE)
    VALUES (EMP_ID, EMP_NAME, EMP_SAL, JOB_ID, DEPT_NO, PHONE);


DBMS_OUTPUT.PUT_LINE('DATA SUCCESSFULLY ADDED');

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('EMPLOYEE IS NOT FOUND');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('ERROR : ' || SQLERRM);
END;

SELECT * FROM EMPLOYEES;

-------------------------------------------------  pract 11  -------------------------------------------------------

-- Step 1: Create Employee Table
CREATE TABLE Employee (
    emp_id NUMBER PRIMARY KEY,
    name VARCHAR2(100),
    age NUMBER
);

-- Step 2: Create Employee_Archive Table
CREATE TABLE Employee_Archive (
    emp_id NUMBER PRIMARY KEY,
    name VARCHAR2(100),
    age NUMBER,
    deleted_at TIMESTAMP DEFAULT SYSTIMESTAMP
);

-- Step 3: Insert Sample Data
INSERT INTO Employee VALUES (1, 'John Doe', 21);
INSERT INTO Employee VALUES (2, 'Jane Smith', 25);
INSERT INTO Employee VALUES (3, 'Alice Brown', 21);
INSERT INTO Employee VALUES (4, 'Bob White', 30);
COMMIT;

-- Step 4: Create Trigger for Archiving Before Deletion
CREATE OR REPLACE TRIGGER trg_archive_before_delete
BEFORE DELETE ON Employee
FOR EACH ROW
BEGIN
    -- Insert the deleted record into Employee_Archive
    INSERT INTO Employee_Archive (emp_id, name, age)
    VALUES (:OLD.emp_id, :OLD.name, :OLD.age);
END;
/

-- Step 5: Create PL/SQL Block to Delete Employees Aged 21
BEGIN
    DELETE FROM Employee WHERE age = 21;
    COMMIT;
END;
/

SELECT * FROM Employee;          -- Should not have employees aged 21
SELECT * FROM Employee_Archive;  -- Should contain archived records of deleted employees
