CREATE TABLE employees (
    emp_no SERIAL PRIMARY KEY,
    birt_date date,
    first_name varchar(30),
    lats_name varchar(30),
    gender varchar(5),
    hire_date date
);

SELECT * FROM employees;

DROP TABLE departments

CREATE TABLE departments(
    dept_no VARCHAR(5) NOT NULL PRIMARY KEY,
    dept_name varchar(30) NOT NULL
 );

SELECT * FROM departments;

CREATE TABLE dept_emp(
    id SERIAL PRIMARY KEY,
    emp_no int,
    dept_no VARCHAR(5),
    from_date date,
    to_date date,
   	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

SELECT * FROM dept_emp;

CREATE TABLE salaries(
    id SERIAL PRIMARY KEY,
    emp_no INT,
    salary MONEY NOT NULL,
    from_date DATE,
    to_date DATE,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

SELECT * FROM salaries;

CREATE TABLE titles(
    id SERIAL PRIMARY KEY,
    emp_no int,
    title varchar(30),
    from_date date,
    to_date date,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

SELECT * FROM titles;

CREATE TABLE dept_manager(
    id SERIAL PRIMARY KEY,
    dept_no VARCHAR(5),
    emp_no int,
    from_date date,
    to_date date,
 	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

SELECT * FROM dept_manager;


