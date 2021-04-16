select * from department_employees;
select * from department_manager;
select * from departments;
select * from employees;
select * from salaries;
select * from titles;

-- Instructions and Analysis:

-- 1) List the following details of each employee: employee number, last name, first name, sex, and salary.

create view answer1 as
	select  employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
	from employees
	join salaries
		on (employees.emp_no = salaries.emp_no);
		
select * from answer1;

-- same thing w/ aliases

drop view answer1;

create view answer1 as
	select  e.emp_no, e.last_name, e.first_name, e.sex, s.salary
	from employees as e
	join salaries as s
		on (e.emp_no = s.emp_no);
		
select * from answer1;

-- 2) List first name, last name, and hire date for employees who were hired in 1986.

-- select * from employees;
-- drop view answer2;

create view answer2 as
	select first_name, last_name, hire_date
	from employees 
 	where hire_date >= '1986-01-01' 
       and hire_date < '1987-01-01'
	   order by hire_date;

select * from answer2;

-- 3) List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

-- select * from department_manager;
-- select * from departments;
-- select * from employees;
-- drop view answer3;

create view answer3 as
	select department_manager.emp_no, department_manager.dept_no, departments.dept_name, employees.last_name, employees.first_name
	from departments 
	join department_manager 
	on (departments.dept_no= department_manager.dept_no)
		join employees
		on (department_manager.emp_no = employees.emp_no);
		
select * from answer3;

-- 4) List the department of each employee with the following information: employee number, last name, first name, and department name.

select * from department_employees;
select * from departments;
select * from employees;
-- drop view answer4;

create view answer4 as
	select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
	from employees 
	join department_employees
	on (department_employees.emp_no= employees.emp_no)
		join departments
		on (departments.dept_no = department_employees.dept_no);
		
select * from answer4;

-- 5) List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

select * from employees;
-- drop view answer5;

create view answer5 as
	select employees.first_name, employees.last_name, employees.sex
	from employees 
	where employees.first_name = 'Hercules' and employees.last_name like 'B%';

select * from answer5;

-- 6) List all employees in the Sales department, including their employee number, last name, first name, and department name.
-- drop view answer6;
select * from departments;
select * from employees;
select * from department_employees;

create view answer6 as
	select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
	from departments 
	join department_employees
	on (department_employees.dept_no= departments.dept_no)
		join employees
		on (employees.emp_no = department_employees.emp_no)
		where departments.dept_name = 'Sales';

select * from answer6;

-- 7) List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
-- drop view answer7;
select * from departments;
select * from employees;
select * from department_employees;

create view answer7 as
	select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
	from departments 
	join department_employees
	on (department_employees.dept_no= departments.dept_no)
		join employees
		on (employees.emp_no = department_employees.emp_no)
		where departments.dept_name = 'Sales' or departments.dept_name = 'Development';

select * from answer7;

-- 8) In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
-- drop view answer8;
select * from employees;

create view answer8 as
select count(employees.last_name) as last_name_count, employees.last_name
	from employees
	group by last_name
	order by last_name_count DESC;

select * from answer8;

