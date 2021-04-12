# Pewlett-Hackard-Analysis
Utilize SQL to analyze the company's employee data 

## Overview of the Project
Using SQL, organize the employee data represented in several CVS files to determine the number of retiring employees per title, and identify employees who are eligible to participate in a mentorship program. 

1. The Number of Retiring Employees by Title
2. The Employees Eligible for the Mentorship Program

Then, based on the tables generated from Postgres, we will list up the numerical observation we can draw from the tables and answer several key questions of how the company should react to this upcoming "shilver tsunami" of retirements.
## Resources
- Data Source: departments.csv, dept_emp.csv, dept_manager.csv, employees.csv, salaries.csv, titles.csv
- Output Data: retirement_titles.csv, unique_titles.csv, retiring_titles.csv, mentorship_eligibility.csv
- Saved Query: Employee_Database_challenge.sql
- Software: Postgres, pdAdmin 4

## Results
  Based on the two technical analysis and tables generated using Postgres, we can infer below obserbations:
  
  1. The number of retirement we can expect is **90,398** based on the fact that these employees were born between January 1, 1952 and December 31, 1955.
  
      ![](Data/unique_titles_table.png)
  ```
  SELECT
    e.emp_no,
    e.first_name,
    e.last_name,
    ti.title,
    ti.from_date,
    ti.to_date
  INTO retirement_titles
  FROM employees as e
  INNER JOIN titles as ti
  ON (e.emp_no = ti.emp_no)
  WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
  ORDER BY e.emp_no ASC;

  -- Use Dictinct with Orderby to remove duplicate rows
  SELECT DISTINCT ON (emp_no) 
    r.emp_no,
    r.first_name,
    r.last_name,
    r.title
  INTO unique_titles
  FROM retirement_titles as r
  ORDER BY r.emp_no ASC, r.to_date DESC;
  ```
  
  - Total


  2. A 
  - 
      ![](analysis/PyBer_fare_summary.png)
  
  - While, 
  3. A
  - A
  
  4. A
  -
## Summary
   Based on the results, I will respond to following two quetions in response to the upcoming "silver-tsunami" that we can expect from the technical analysis.

  1. How many roles will need to be filled as the "silver tsunami" begins to make an impact?
    
     + Given 
 
     + Also, 
  
  2. Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?
    
     + Based 

     + In order to 
  
