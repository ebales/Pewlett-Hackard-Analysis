--Retiring Employees by Title
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	ti.title,
	ti.from_date,
	ti.to_date
INTO unique_titles
FROM employees as e
INNER JOIN titles as ti
	ON(e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
	AND (ti.to_date = '9999-01-01')
ORDER BY emp_no ASC;

--Determine count of each title retiring
SELECT COUNT (ut.emp_no), ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY ut.title
ORDER BY count DESC;

--Determine Mentor Eligible Employees
SELECT DISTINCT e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	ti.to_date,
	ti.title
INTO mentorship_eligibility
FROM employees as e
INNER JOIN dept_emp as de
	on (e.emp_no = de.emp_no)
LEFT JOIN titles as ti
	on (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
	AND (ti.to_date = '9999-01-01');