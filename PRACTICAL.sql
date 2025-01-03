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

DROP TABLE Employee;
CREATE TABLE Employee (
    Emp_ID NUMBER PRIMARY KEY,
    Emp_Name VARCHAR2(50) NOT NULL,
    Emp_Salary NUMBER CHECK (Emp_Salary > 0) NOT NULL,
    Job_ID VARCHAR2(30) UNIQUE,
    Dept_No NUMBER,
    Phone CHAR(10)
);

DROP TABLE Customer;
CREATE TABLE Customer (
    Cust_ID NUMBER PRIMARY KEY,
    Cust_Name VARCHAR2(50) NOT NULL,
    Branch VARCHAR2(50) NOT NULL
);

-- Inserting sample data into Employee table
INSERT INTO Employee (Emp_ID, Emp_Name, Emp_Salary, Job_ID, Dept_No, Phone)
VALUES (101, 'Aman', 3000, 'FI_ACC', 20, '1234567890');
INSERT INTO Employee (Emp_ID, Emp_Name, Emp_Salary, Job_ID, Dept_No, Phone)
VALUES (102, 'Adama', 2500, 'MK_MGR', 10, '2345678901');
INSERT INTO Employee (Emp_ID, Emp_Name, Emp_Salary, Job_ID, Dept_No, Phone)
VALUES (103, 'Anita', 5000, 'IT_PROG', 30, '3456789012');
INSERT INTO Employee (Emp_ID, Emp_Name, Emp_Salary, Job_ID, Dept_No, Phone)
VALUES (104, 'Anamika', 2975, 'LEC', 15, '4567890123');
INSERT INTO Employee (Emp_ID, Emp_Name, Emp_Salary, Job_ID, Dept_No, Phone)
VALUES (105, 'Snehal', 1600, 'COMP_OP', 25, NULL);

-- Inserting sample data into Customer table
INSERT INTO Customer (Cust_ID, Cust_Name, Branch)
VALUES (201, 'Anil', 'Andheri');
INSERT INTO Customer (Cust_ID, Cust_Name, Branch)
VALUES (202, 'Sunil', 'Virar');
INSERT INTO Customer (Cust_ID, Cust_Name, Branch)
VALUES (203, 'Keyur', 'Dadar');
INSERT INTO Customer (Cust_ID, Cust_Name, Branch)
VALUES (204, 'Vijay', 'Borivali');

-- Task Queries


-- 1. Retrieve employees whose names start with 'A' or have 'a' as the third character
SELECT * FROM Employee
WHERE Emp_Name LIKE 'A%' OR SUBSTR(Emp_Name, 3, 1) = 'a';

-- 2. Retrieve employees whose names are exactly 5 characters long and start with 'Ani'
SELECT Emp_Name, Emp_ID, Emp_Salary FROM Employee
WHERE LENGTH(Emp_Name) = 5 AND Emp_Name LIKE 'Ani%';






-- 1. Retrieve employees whose second character is 'M' or 'N'
SELECT * FROM Employee
WHERE SUBSTR(Emp_Name, 2, 1) IN ('m', 'n');


-- 2. Retrieve employees whose second character is 'n' and names are exactly 5 characters long
SELECT * FROM Employee
WHERE LENGTH(Emp_Name) = 5 AND SUBSTR(Emp_Name, 2, 1) = 'n';

-- 3. Identify employees with incomplete details and third character as 'a'
SELECT * FROM Employee
WHERE (Emp_Salary IS NULL OR Phone IS NULL) AND SUBSTR(Emp_Name, 3, 1) = 'a';


-- 1. Retrieve names of customers in 'Andheri', 'Dadar', or 'Virar'
SELECT Cust_Name FROM Customer
WHERE Branch IN ('Andheri', 'Dadar', 'Virar');



-- 1. Retrieve job titles with Job_IDs starting with 'FI_'
SELECT Job_ID FROM Job
WHERE Job_ID LIKE 'FI_%';


-- 2. Retrieve job titles ending with '_MGR' and max salary > 12000
SELECT job_title FROM Job
WHERE job_title LIKE '%_MGR' AND max_sal > 12000;

-- Final Verification Queries
SELECT * FROM Employee;
SELECT * FROM Customer;
