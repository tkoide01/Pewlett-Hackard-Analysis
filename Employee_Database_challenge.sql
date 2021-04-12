-- Deliverable 1: The Number of Retiring Employees by Title 
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

SELECT * FROM unique_titles;
-- Count the numbers of employees by their most recent job title who are about to retire
SELECT COUNT (u.emp_no), u.title
INTO retiring_titles
FROM unique_titles as u
GROUP by u.title
ORDER by count DESC;


-- Deliverable 2: The Employees Eligible for the Mentorship Program

SELECT DISTINCT ON(emp_no)
	e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	ti.title
INTO mentorship_elig
FROM employees as e
INNER JOIN dept_employees as de
ON (e.emp_no = de.emp_no)
INNER JOIN titles as ti
on (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (de.to_date = '9999-01-01')
ORDER BY e.emp_no ASC;

-- Deliverable 3: Results 
-- queries to display numbers needed
SELECT * FROM retirement_titles;
SELECT COUNT(emp_no) FROM retirement_titles;
SELECT * FROM unique_titles;
SELECT COUNT(emp_no) FROM unique_titles;
SELECT * FROM retiring_titles;
SELECT * FROM mentorship_elig;

SELECT COUNT(emp_no) FROM mentorship_elig;


-- Find out the number of current employees through below steps
-- Filter 'employees' table to current employee only
SELECT 
	e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date
INTO current_emp2
FROM employees as e
INNER JOIN dept_employees as de
ON (e.emp_no = de.emp_no)
WHERE (de.to_date = '9999-01-01')
ORDER BY e.emp_no ASC;

-- Join with 'titles' table
SELECT
	ce.emp_no,
	ce.first_name,
	ce.last_name,
	ti.title,
	ti.from_date,
	ti.to_date
INTO current_emp_titles
FROM current_emp2 as ce
INNER JOIN titles as ti
ON (ce.emp_no = ti.emp_no)
ORDER BY ce.emp_no ASC;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) 
	cet.emp_no,
	cet.first_name,
	cet.last_name,
	cet.title
INTO current_unique_titles
FROM current_emp_titles as cet
ORDER BY cet.emp_no ASC, cet.to_date DESC;

-- Display the number of current employees by title
SELECT COUNT (cut.emp_no), cut.title
INTO count_current_titles
FROM current_unique_titles as cut
GROUP by cut.title
ORDER by count DESC;

SELECT * FROM count_current_titles;

-- Figure out the mentorship_eligible employees count by title
SELECT COUNT (me.emp_no), me.title
INTO count_ment_elig_titles
FROM mentorship_elig as me
GROUP by me.title
ORDER by count DESC;

SELECT * FROM count_ment_elig_titles;
