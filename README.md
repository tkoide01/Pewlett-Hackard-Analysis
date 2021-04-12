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
  Based on the two technical analysis and tables generated using Postgres, we can infer below observations:
  
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
    Then, we run the query to count the `emp_no` of the generated `unique_titles` table. This table skips duplicate `emp_no` that may have occured in `dept_employees` table due to event like promotion.
  ```
  SELECT COUNT(emp_no) FROM unique_titles;
  ```
  2. The following table `retiring_title` represents the number of retiring employees by their title. The table depicts that
  - 
      ![](Data/retiring_titles_table.png)
     
     Based on the table, we can learn that
  
  3. A
  - A
  
  4. A
  -
## Summary
   Based on the results, I will respond to following two quetions in response to the upcoming "silver-tsunami" that we can expect from the technical analysis.

  1. How many roles will need to be filled as the "silver tsunami" begins to make an impact?
    
     + Given **90,398** employees are expected to retire soon, let us measure how impactful that is to the company by calculating the current head  count.
     + We can do so by generating a new table on Postgres that displays the currently employees, which is similar to what we did before without filtering by `birth_date` but ensure filtering by `to_date` as below query shows;
     ```
     SELECT DISTINCT ON(emp_no)
        e.emp_no,
        e.first_name,
        e.last_name,
        e.birth_date,
        de.from_date,
        de.to_date,
        ti.title
     INTO current_emp2
     FROM employees as e
     INNER JOIN dept_employees as de
     ON (e.emp_no = de.emp_no)
     INNER JOIN titles as ti
     on (e.emp_no = ti.emp_no)
     AND (de.to_date = '9999-01-01')
     ORDER BY e.emp_no ASC;
     ```
     Then run another query to count the number of `emp_no` of the new `current_emp2` table as below;
     ```
     SELECT COUNT(emp_no) FROM current_emp2;
     ```
     ![](Data/count_current_emp.png)
     + Now we learn that current head count is 24,0124 and 90,398 is equivalent to **37.64%**
 
     + Also, 
  
  2. Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?
    
     + Based 

     + In order to 
  
