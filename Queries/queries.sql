select first_name, last_name
from employees
where birth_date between '1952-01-01' and '1955-12-31';

SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1952-12-31';

SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1953-01-01' AND '1953-12-31';

SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1954-01-01' AND '1954-12-31';

SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1955-01-01' AND '1955-12-31';

-- Retirement eligibility
SELECT first_name, last_name
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Number of employees retiring
SELECT COUNT(first_name)
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT * FROM retirement_info;

--current emp join query
SELECT ri.emp_no,
    ri.first_name,
    ri.last_name,
	de.to_date
INTO current_emp
FROM retirement_info as ri
LEFT JOIN dept_emp as de
ON ri.emp_no = de.emp_no
WHERE de.to_date = ('9999-01-01');

--list 3 dept retirees
select ce.emp_no,
	ce.first_name,
	ce.last_name,
	d.dept_name
into dept_info
from current_emp as ce
inner join dept_emp as de
on (ce.emp_no = de.emp_no)
inner join departments as d
on (de.dept_no = d.dept_no);

select ri.emp_no,
	ri.first_name,
	ri.last_name,
	di.dept_name
--into sales_info
from retirement_info as ri
inner join dept_info as di
ON ri.emp_no = di.emp_no
where (di.dept_name = 'Sales')
and (di.dept_name = 'Development');

select ri.emp_no,
	ri.first_name,
	ri.last_name,
	di.dept_name
into mentoring_info
from retirement_info as ri
inner join dept_info as di
ON ri.emp_no = di.emp_no
where di.dept_name in ('Sales', 'Development')
order by di.dept_name;

SELECT DISTINCT ON (ti.title) e.emp_no,
	e.first_name,
	e.last_name,
	ti.title,
	ti.from_date,
	ti.to_date
--INTO retirement_titles
FROM employees as e
inner join titles as ti
ON e.emp_no = ti.emp_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY (ti.title), e.emp_no DESC;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (e.emp_no) e.emp_no,
	e.first_name,
	e.last_name,
	ti.title,
	ti.from_date,
	ti.to_date
INTO retirement_titles
FROM employees as e
inner join titles as ti
ON e.emp_no = ti.emp_no
WHERE e.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY (e.emp_no), e.emp_no DESC;