--1. List the following details of each employee:
--    employee number, last name, first name, gender, and salary.
SELECT 
		emp.emp_no,
	   	emp.first_name,
	   	emp.last_name,
	   	emp.gender,
	   	sal.salary
FROM 
		employees as emp
		LEFT JOIN salaries as sal
		  ON (emp.emp_no = sal.emp_no)
		
ORDER BY emp.emp_no;

--2). List employees who were hired in 1986.
SELECT 
		emp.emp_no,
		emp.first_name,
		emp.last_name,
		emp.hire_date
FROM 
		employees as emp
WHERE 
		hire_date BETWEEN '1986-01-01' AND '1986-12-31';

--3).List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, 
--first name, and start and end employment dates.
SELECT 
		dept_mgr.dept_no,
		dept.dept_name,
		dept_mgr.emp_no,
		emp.first_name,
		emp.last_name,
		dept_mgr.from_date,
		dept_mgr.to_date
FROM 
	dept_manager as dept_mgr
	
	INNER JOIN departments as dept
		ON (dept_mgr.dept_no = dept.dept_no)
	
	INNER JOIN employees as emp
		ON (dept_mgr.emp_no = emp.emp_no);
		
--4). List the department of each employee with the following information: 
--employee number, last name, first name, and department name.
SELECT 
		emp.emp_no,
		emp.first_name,
		emp.last_name,
		dept.dept_name
FROM 
		employees as emp
	
	INNER JOIN dept_emp as de
	ON (emp.emp_no = de.emp_no)
	
	INNER JOIN departments as dept
		ON (de.dept_no = dept.dept_no)
ORDER BY emp.emp_no;
		
--5). List all employees whose first name is "Hercules" and last names begin with "B."
SELECT *
FROM 
		employees as emp
WHERE 
		first_name='Hercules' AND last_name LIKE 'B%';

--6). List all employees in the Sales department, 
--including their employee number, last name, first name, and department name.
SELECT 
		emp.emp_no,
		emp.first_name,
		emp.last_name,
		dept.dept_name
FROM 
		employees as emp
	
	INNER JOIN dept_emp as de
		ON (emp.emp_no = de.emp_no)
	
	INNER JOIN departments as dept
		ON (de.dept_no = dept.dept_no)

WHERE dept.dept_name = 'Sales'

ORDER BY emp.emp_no;

--7). List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.
SELECT 
		emp.emp_no,
		emp.first_name,
		emp.last_name,
		dept.dept_name
FROM 
		employees as emp
	
	INNER JOIN dept_emp as de
		ON (emp.emp_no = de.emp_no)
	
	INNER JOIN departments as dept
		ON (de.dept_no = dept.dept_no)

WHERE dept.dept_name IN ('Sales', 'Developmemt')

ORDER BY emp.emp_no;

--8).In descending order, list the frequency count of employee last names, 
--i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name)

FROM employees

GROUP BY last_name

ORDER BY COUNT(last_name) DESC;