-- List the following details of each employee: employee number, last name, first name, gender, and salary.

select emp.emp_no, emp.first_name, emp.last_name, emp.gender, sal.salary
from employees emp
join salaries sal on emp.emp_no = sal.emp_no;

-- List employees who were hired in 1986.
SELECT * FROM employees
WHERE EXTRACT(year FROM "hire_date") = 1986;

-- List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, first name, and start and end employment dates.

select dept.dept_no, dept.dept_name, emp.emp_no, emp.first_name, emp.last_name, emp.hire_date as Hire_Date,dm.to_date Last_Day
from departments dept
join dept_manager dm on dept.dept_no = dm.dept_no
join employees emp on dm.emp_no = emp.emp_no
join titles title on emp.emp_no = title.emp_no
where title.title='Manager';


-- List the department of each employee with the following information: employee number, last name, first name, and department name.

select emp.emp_no, emp.last_name, emp.first_name, dept.dept_name 
from departments dept 
join dept_emp de on dept.dept_no = de.dept_no
join employees emp on de.emp_no = emp.emp_no;

-- List all employees whose first name is "Hercules" and last names begin with "B."

select * from employees where first_name = 'Hercules' and last_name like 'B%';

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.
select emp.emp_no , emp.last_name, emp.first_name, dept.dept_name  
from departments dept
join dept_emp de on dept.dept_no = de.dept_no
join employees emp on de.emp_no = emp.emp_no
where dept.dept_name = 'Sales';

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select emp.emp_no , emp.last_name, emp.first_name, dept.dept_name  
from departments dept
join dept_emp de on dept.dept_no = de.dept_no
join employees emp on de.emp_no = emp.emp_no
where dept.dept_name in ('Sales','Development');

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select last_name, count(last_name) last_name_count
from employees
group by last_name
ORDER by last_name_count desc;