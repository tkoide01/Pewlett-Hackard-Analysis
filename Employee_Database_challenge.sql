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
