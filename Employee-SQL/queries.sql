-- List the following details of each employee:
-- employee number, last name, first name, sex, and salary.
SELECT e.emp_no, e.last_name, e.first_name, e.gender, s.salary
FROM employees e
JOIN salaries s ON s.emp_no = e.emp_no;

-- List first name, last name, and hire date for employees who were hired in 1986.
SELECT e.first_name, e.last_name, e.hire_date 
FROM employees e
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

-- List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, first name.
SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM dept_manager dm
JOIN departments d ON d.dept_no = dm.dept_no
JOIN employees e ON e.emp_no = dm.emp_no;

-- List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
LEFT JOIN departments d ON d.dept_no = de.dept_no;

-- List first name, last name, and sex for employees whose first name is 
-- "Hercules" and last names begin with "B."
SELECT e.first_name, e.last_name, e.gender
FROM employees e
WHERE first_name='Hercules'
AND last_name LIKE 'B%';

-- List all employees in the Sales department, including their 
-- employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e 
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

--List all employees in the Sales and Development departments, including their 
-- employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e 
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development';

-- List the frequency count of employee last names 
-- (i.e., how many employees share each last name) in descending order.
SELECT last_name, COUNT(last_name) AS "total name" 
FROM employees
GROUP BY last_name
ORDER BY "total name" DESC;