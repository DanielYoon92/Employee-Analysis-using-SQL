-- Create the departments table
CREATE TABLE departments(
	dept_no VARCHAR NOT NULL PRIMARY KEY,
	dept_name VARCHAR
);

-- Create dept_employee table
CREATE TABLE dept_employee(
	emp_no INT NOT NULL references employees(emp_no),
	dept_no VARCHAR NOT NULL references departments(dept_no),
	PRIMARY KEY(emp_no, dept_no)
);

-- Create dept_manager table
CREATE TABLE dept_manager(
	dept_no VARCHAR NOT NULL references departments(dept_no),
	emp_no INT NOT NULL references employees(emp_no),
	PRIMARY KEY (emp_no, dept_no)
);

-- Create employees table
CREATE TABLE employees(
	emp_no INT NOT NULL PRIMARY KEY,
	emp_title_id VARCHAR references title(title_id),
	birth_date VARCHAR,
	first_name VARCHAR,
	last_name VARCHAR,
	sex VARCHAR,
	hire_date VARCHAR	
);

-- Create salaries table
CREATE TABLE salaries(
	emp_no INT NOT NULL PRIMARY KEY references employees(emp_no),
	salary INT
);

-- Create Titles table
CREATE TABLE titles(
	title_id VARCHAR NOT NULL PRIMARY KEY,
	title VARCHAR
);

