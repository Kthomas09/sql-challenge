-- SQL-Challenge Query Code
-- Objectives: 
-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.



-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
INNER JOIN salaries ON employees.emp_no=salaries.emp_no;
---------------------------------------------------------------------------------
-- 2. List first name, last name, and hire date for employees who were hired in 1986.

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';
---------------------------------------------------------------------------------
-- ****3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT departments.dept_no, departments.dept_name, dept_man.emp_no, dept_man.dept_no
FROM departments
JOIN dept_man ON dept_man.dept_no=departments.dept_no
---------------------------------------------------------------------------------
-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
