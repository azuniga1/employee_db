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


--List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.gender, salaries.salary
FROM employees
INNER JOIN salaries ON
salaries.emp_no=employees.emp_no;

--List employees who were hired in 1986.
SELECT * FROM employees WHERE hire_date >= date'1986-01-01'
AND hire_date <= date'1986-12-31';


--List the manager of each department with the following information: department number, department name, the manager's employee number, 
--last name, first name, and start and end employment dates.
SELECT dept_manager.dept_no, departments.dept_name, employees.last_name, 
employees.first_name, dept_manager.from_date, dept_manager. to_date
FROM dept_manager
INNER JOIN departments ON
departments.dept_no=dept_manager.dept_no 
INNER JOIN employees on dept_manager.emp_no =employees.emp_no;

--List all employees whose first name is "Hercules" and last names begin with "B."
Select * FROM employees WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

--Rename employees column 
ALTER TABLE employees
RENAME COLUMN lats_name TO last_name;


