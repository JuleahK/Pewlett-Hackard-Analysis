-- Creating tables for PH-EmployeeDB
CREATE table departments (
	dept_no varchar(4) not null,
	dept_name varchar(40) not null,
	primary key (dept_no),
	unique (dept_name)
);

create table employees (
	emp_no int not null,
	birth_date date not null,
	first_name varchar(40) not null,
	last_name varchar(40) not null,
	gender varchar(20) not null,
	hire_date date not null,
	primary key (emp_no)
);

CREATE TABLE dept_manager (
dept_no VARCHAR(4) NOT NULL,
    emp_no INT NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE salaries (
  emp_no INT NOT NULL,
  salary INT NOT NULL,
  from_date DATE NOT NULL,
  to_date DATE NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
  PRIMARY KEY (emp_no)
);

create table titles (
	emp_no int not null,
	title varchar(40) not null,
	from_date date not null,
	to_date date not null,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
  	);

CREATE TABLE dept_emp (
  	emp_no INT NOT NULL,
  	dept_no varchar(6) NOT NULL,
  	from_date DATE NOT NULL,
  	to_date DATE NOT NULL,
 	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
);

select * from titles;