-- Use the ERD to create a table schema for each of the six CSV files. 
-- Specifying data types, primary keys, foreign keys, and other constraints.

-- Delete the tables if they already exist
DROP TABLE IF EXISTS titles;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS salaries;


-- Create the tables
CREATE TABLE titles (
    title_id VARCHAR NOT NULL PRIMARY KEY,
    title VARCHAR NOT NULL
);

CREATE TABLE employees (
	emp_no INT NOT NULL PRIMARY KEY,
	emp_title_id VARCHAR NOT NULL,
    birth_date DATE NOT NULL,
    first_name VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL,
    gender VARCHAR NOT NULL,
    hire_date DATE NOT NULL,
	CONSTRAINT fk_emp_title_id FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

CREATE TABLE departments (
    dept_no VARCHAR NOT NULL PRIMARY KEY,
    dept_name VARCHAR NOT NULL
);

CREATE TABLE dept_emp (
    emp_no int NOT NULL,
    dept_no varchar NOT NULL,
	CONSTRAINT fk_emp_no FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

CREATE TABLE dept_manager (
	dept_no VARCHAR NOT NULL,
	emp_no INT NOT NULL,
	CONSTRAINT fk_dept_no FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	CONSTRAINT fk_emp_no FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	CONSTRAINT pk_dept_manager PRIMARY KEY (
	dept_no, emp_no
     )
);

CREATE TABLE salaries (
    emp_no int NOT NULL,
    salary int NOT NULL,
	CONSTRAINT fk_emp_no FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);


SELECT * FROM titles
SELECT * FROM employees
SELECT * FROM departments
SELECT * FROM dept_emp
SELECT * FROM dept_manager
SELECT * FROM salaries