-- List the employee number, last name, first name, sex, and salary of each employee
-- needs employee and salary, joined by emp_no (inner join)

SELECT salaries.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
INNER JOIN salaries
ON salaries.emp_no = employees.emp_no
ORDER BY salaries.emp_no;

-- List the first name, last name, and hire date for the employees who were hired in 1986
-- only needs employees table

SELECT first_name, last_name, hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986
ORDER BY hire_date;

-- List the manager of each department along with their department number, department name,
-- employee number, last name, and first name
-- needs dept_manager, departments and employees
SELECT dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
FROM dept_manager
LEFT JOIN employees
ON dept_manager.emp_no = employees.emp_no
LEFT JOIN departments
ON dept_manager.dept_no = departments.dept_no
ORDER BY dept_manager.dept_no;

-- List the department number for each employee along with that employee’s employee number, 
-- last name, first name, and department name
-- needs departments, dept_emp and employees
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
LEFT JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
INNER JOIN departments
ON dept_emp.dept_no = departments.dept_no
ORDER BY employees.emp_no;


-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
-- only needs employees
SELECT first_name, last_name, sex
FROM employees
WHERE (employees.first_name = 'Hercules') AND (employees.last_name LIKE 'B%')
ORDER BY employees.last_name;


-- List each employee in the Sales department, including their employee number, last name, and first name
-- employees, departments, dept_emp
SELECT employees.emp_no, employees.last_name, employees.first_name
FROM employees
INNER JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
inner join departments
ON departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name = 'Sales';


-- List each employee in the Sales and Development departments, including their employee number, last name, 
-- first name, and department name
-- same thing but add development and department name on select
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
INNER JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
inner join departments
ON departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name = 'Sales' OR departments.dept_name = 'Development';


-- List the frequency counts, in descending order, of all the employee last names 
-- (that is, how many employees share each last name)
-- get last names, count last names, group by last names, order by desc
-- only needs employees
SELECT last_name, COUNT(last_name)
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;
