-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/2isQyC
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.
-- Exported schema from QUICKDBD would not create appropriate code. 
------------------------------------------------
DROP TABLE dept_man;
DROP TABLE dept_emp;
DROP TABLE salaries;
DROP TABLE employees;
DROP TABLE departments;
DROP TABLE titles;
------------------------------------------------
CREATE TABLE titles (
    emp_title_id varchar(30)   NOT NULL,
    titles varchar(30)   NOT NULL,
	PRIMARY KEY (emp_title_id)
);

COPY titles(emp_title_id, titles)
FROM '/Users/kent.thomas/Repository/sql-challenge/data/titles.csv'
DELIMITER ','
CSV HEADER;

------------------------------------------------
CREATE TABLE departments (
    dept_no varchar(30)   NOT NULL,
    dept_name varchar(30)   NOT NULL,
    PRIMARY KEY (dept_no)
);

COPY departments(dept_no, dept_name)
FROM '/Users/kent.thomas/Repository/sql-challenge/data/departments.csv'
DELIMITER ','
CSV HEADER;

------------------------------------------------
CREATE TABLE employees (
    emp_no int   NOT NULL,
    emp_title_id varchar(30)   NOT NULL,
    birth_date date   NOT NULL,
    first_name varchar(30)   NOT NULL,
    last_name varchar(30)   NOT NULL,
    sex varchar(30)   NOT NULL,
    hire_date date   NOT NULL,
    PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_title_id) REFERENCES titles (emp_title_id)
);

COPY employees(emp_no, emp_title_id, birth_date, first_name, last_name, sex, hire_date)
FROM '/Users/kent.thomas/Repository/sql-challenge/data/employees.csv'
DELIMITER ','
CSV HEADER;

------------------------------------------------
CREATE TABLE salaries (
    emp_no int   NOT NULL,
    salary int   NOT NULL,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

COPY salaries(emp_no, salary)
FROM '/Users/kent.thomas/Repository/sql-challenge/data/salaries.csv'
DELIMITER ','
CSV HEADER;

------------------------------------------------
CREATE TABLE dept_emp (
    emp_no int   NOT NULL,
    dept_no varchar(30)   NOT NULL,
	PRIMARY KEY (dept_no, emp_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
	);
	
COPY dept_emp(emp_no, dept_no)
FROM '/Users/kent.thomas/Repository/sql-challenge/data/dept_emp.csv'
DELIMITER ','
CSV HEADER;

------------------------------------------------
CREATE TABLE dept_man (
    dept_no varchar(30)   NOT NULL,
    emp_no int   NOT NULL,
	PRIMARY KEY (dept_no, emp_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

COPY dept_man(dept_no,emp_no)
FROM '/Users/kent.thomas/Repository/sql-challenge/data/dept_manager.csv'
DELIMITER ','
CSV HEADER;

------------------------------------------------

