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

