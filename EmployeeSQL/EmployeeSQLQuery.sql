-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT
	e.emp_no
	,e.last_name
	,e.first_name
	,e.sex
	,s.salary
FROM
	employees AS e
JOIN 
	salaries AS s ON e.emp_no = s.emp_no
ORDER BY emp_no
;

-- 2. List first name, last name, and hire date for employees who were hired in 1986.

SELECT
	first_name
	,last_name
	,hire_date
FROM
	employees
WHERE 1=1
	AND hire_date ILIKE '%1986%'
	ORDER BY hire_date
;

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

SELECT
	d.dept_no,
	d.dept_name,
	m.emp_no,
	e.last_name,
	e.first_name
FROM
	departments AS d JOIN department_managers as m ON d.dept_no=m.dept_no
	JOIN employees as e ON m.emp_no=e.emp_no
;

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT
	e.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
FROM
	employees AS e JOIN department_employees as de ON e.emp_no=de.emp_no
	JOIN departments as d ON d.dept_no=de.dept_no
ORDER BY dept_name
;

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

SELECT
	first_name,
	last_name,
	sex
FROM
	employees
WHERE 1=1
	AND first_name = 'Hercules'
	AND last_name ILIKE 'B%'
;

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT
	e.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
FROM
	employees AS e JOIN department_employees as de ON e.emp_no=de.emp_no
	JOIN departments as d ON d.dept_no=de.dept_no
WHERE 1=1
	AND dept_name = 'Sales'
ORDER BY last_name
;

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT
	e.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
FROM
	employees AS e JOIN department_employees as de ON e.emp_no=de.emp_no
	JOIN departments as d ON d.dept_no=de.dept_no
WHERE 1=1
	AND dept_name IN ('Sales', 'Development')
ORDER BY dept_name
;

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT
	last_name,
	COUNT(*) as num_last_names
FROM
	employees
GROUP BY 
	last_name
ORDER BY
	last_name DESC
;


