-- 1. List the employee number, last name, first name, sex, and salary of each employee.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary 
FROM employees as e
JOIN salaries as s
ON e.emp_no=s.emp_no;

-- 2. List the last name, first name, and hire date for the employees who were hired in 1986
SELECT last_name, first_name, hire_date 
FROM employees
WHERE hire_date like '%/1986';

-- 3. List the manager of each department: department number, department name, employee number, last name, and first name
SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM dept_manager as dm
INNER JOIN departments as d
	on dm.dept_no=d.dept_no
INNER JOIN employees as e
	on dm.emp_no=e.emp_no;

-- 4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name
SELECT de.dept_no, de.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_employee as de
INNER JOIN departments as d
	on de.dept_no=d.dept_no
INNER JOIN employees as e
	on de.emp_no=e.emp_no;
	
-- 5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
SELECT first_name, last_name, sex
FROM employees
WHERE first_name='Hercules'
and last_name like 'B%';

-- 6. List each employee in the Sales department, including their employee number, last name, and first name
SELECT emp_no, last_name, first_name
FROM employees
WHERE emp_no in (
	SELECT emp_no
	FROM dept_employee
	WHERE dept_no in (
		SELECT dept_no
		FROM departments
		WHERE dept_name='Sales'
	)
);

-- 7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name 
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees as e
INNER JOIN dept_employee as de on de.emp_no=e.emp_no
INNER JOIN departments as d on de.dept_no=d.dept_no
WHERE dept_name='Sales' and dept_name='Development';

-- 8. List the frequency counts, in descending order, of all the employee last names 
SELECT last_name, count(last_name) as "frequency"
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;

