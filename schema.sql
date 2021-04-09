-- Creating tables for PH-EmployeeDB
CREATE TABLE departments ( 			-- is the syntax to create a new table + name of the table
     dept_no VARCHAR(4) NOT NULL,   -- creates a column named "dept_no" that can hold up to 4 varying characters,
									-- NOT NULL tells SQL that no nukk fields will be allowed when importing data
     dept_name VARCHAR(40) NOT NULL,-- creates a column named "dept_no"
     PRIMARY KEY (dept_no),			-- means that the "dept_no" is used as the primary key for this table
     UNIQUE (dept_name)	-- adds the unique constraint to the dept_name column
);

CREATE TABLE employees (
	 emp_no INT NOT NULL,
     birth_date DATE NOT NULL,
     first_name VARCHAR NOT NULL,
     last_name VARCHAR NOT NULL,
     gender VARCHAR NOT NULL,
     hire_date DATE NOT NULL,
     PRIMARY KEY (emp_no)
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