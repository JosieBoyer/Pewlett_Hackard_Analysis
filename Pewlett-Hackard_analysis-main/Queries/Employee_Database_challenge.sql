---DELIVERABLE 1 (create retirement titles table)
SELECT e.emp_no, e.first_name, e.last_name,
    t.title, t.from_date, t.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as t
    ON (e.emp_no = t.emp_no)
INNER JOIN dept_emp as de
    ON (e.emp_no = de.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31') 
    AND (de.to_date = '9999-01-01')
ORDER BY e.emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) re.emp_no,
re.first_name,
re.last_name,
re.title

INTO unique_titles
FROM retirement_titles as rt
ORDER BY re.emp_no, re.to_date DESC;

--Retrieve the number of employees by their most recent job title who
--are about to retire
SELECT COUNT(ut.title), ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY ut.title
ORDER BY COUNT(ut.title) DESC;

--DELIVERABLE 2 (create mentoship eligibility table)
SELECT DISTINCT ON (e.emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date,
        de.from_date, de.to_date
INTO mentorship_eligibility
FROM employees as e
INNER JOIN dept_emp as de
    ON (e.emp_no = de.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
    AND (de.to_date = '9999-01-01')
ORDER BY e.emp_no;

--my own little contribution, comparing upcoming job vacancies with mentorship
--candidates by department
--Retirees count by department
SELECT d.dept_name, COUNT(ut.emp_no)
INTO dept_retiree_count
FROM unique_titles as ut
INNER JOIN dept_emp as de
    ON (ut.emp_no = de.emp_no)
INNER JOIN departments as d
    ON (de.dept_no = d.dept_no)
GROUP BY d.dept_name
ORDER BY COUNT (ut.emp_no) DESC;
--mentorship candidates count by department
SELECT d.dept_name, COUNT(me.emp_no)
INTO dept_candidate_count
FROM mentorship_eligibility as me
INNER JOIN dept_emp as de
	ON (me.emp_no = de.emp_no)
INNER JOIN departments as d
	ON (de.dept_no = d.dept_no)
GROUP BY d.dept_name
ORDER BY COUNT(me.emp_no) DESC;

