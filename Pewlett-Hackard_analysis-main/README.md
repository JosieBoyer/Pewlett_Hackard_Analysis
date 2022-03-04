# Pewlett-Hackard Analysis
### PostgreSQL Queries
---
## Overview of Analysis

Pewlett-Hackard has recently become aware that an abnormally large number of their employees may become eligible for retirement at the same time, many (or even most) of them in leadership roles.  Given 6 spreadsheets of company/employee data, we used SQL queries to identify the employees who will likely retire, the roles they currently fill, and a list of eligible candidates for mentorship to fill those roles.

---
### Resources:

**Resource Files:** [departments.csv](https://github.com/JosieBoyer/Pewlett_Hackard_Analysis/blob/main/Pewlett-Hackard_analysis-main/Data/departments.csv), [dept_emp.csv](https://github.com/JosieBoyer/Pewlett_Hackard_Analysis/blob/main/Pewlett-Hackard_analysis-main/Data/dept_emp.csv), [dept_manager.csv](https://github.com/JosieBoyer/Pewlett_Hackard_Analysis/blob/main/Pewlett-Hackard_analysis-main/Data/dept_manager.csv), [employees.csv](https://github.com/JosieBoyer/Pewlett_Hackard_Analysis/blob/main/Pewlett-Hackard_analysis-main/Data/employees.csv), [salaries.csv](https://github.com/JosieBoyer/Pewlett_Hackard_Analysis/blob/main/Pewlett-Hackard_analysis-main/Data/salaries.csv), [titles.csv](https://github.com/JosieBoyer/Pewlett_Hackard_Analysis/blob/main/Pewlett-Hackard_analysis-main/Data/titles.csv)

## Results

[retirement_titles.csv](https://github.com/JosieBoyer/Pewlett_Hackard_Analysis/blob/main/Pewlett-Hackard_analysis-main/Data/retirement_titles.csv): A spreadsheet containing names, employment dates and ALL titles held by potentially retiring current employees.

![retirement_titles.png](https://github.com/JosieBoyer/Pewlett_Hackard_Analysis/blob/main/Pewlett-Hackard_analysis-main/Resources/retirement_titles.png)

- We can see that this table has certain employees appearing multiple times, reflecting the many titles they've held during their employment with Pewlett-Hackard.

[unique_titles.csv](https://github.com/JosieBoyer/Pewlett_Hackard_Analysis/blob/main/Pewlett-Hackard_analysis-main/Data/unique_titles.csv): A refined spreadsheet containing only the current title held by employees in the above pool.

![unique_titles.png](https://github.com/JosieBoyer/Pewlett_Hackard_Analysis/blob/main/Pewlett-Hackard_analysis-main/Resources/unique_titles.png)

- The same list of employees as shown in the first table, except drilled down using the the employment dates from the first table to isolate only the currently held positions.
---
### Potential Job Vacancies
[retiring_titles.csv](https://github.com/JosieBoyer/Pewlett_Hackard_Analysis/blob/main/Pewlett-Hackard_analysis-main/Resources/unique_titles.png): A Count of potentially retiring employees, by job title.

![retiring_titles.png](https://github.com/JosieBoyer/Pewlett_Hackard_Analysis/blob/main/Pewlett-Hackard_analysis-main/Resources/retiring_titles.png)

- There are a total of 72,458 employees who could be seeking to retire soon.

![retiring_titles_barchart.png](https://github.com/JosieBoyer/Pewlett_Hackard_Analysis/blob/main/Pewlett-Hackard_analysis-main/Resources/retiring_titles_barchart.png)

- Of those 72,458 employees, the VAST majority of them hold "Senior" titles.  These are employees with a wealth of professional experience that could be devastating to lose all at once.  Immediate implimentation of an internal mentorship is recommended to mitigate impact to company productivity.
---
### Candidates for Mentorship
[mentorship_eligibility.csv](https://github.com/JosieBoyer/Pewlett_Hackard_Analysis/blob/main/Pewlett-Hackard_analysis-main/Data/mentorship_eligibility.csv): A spreadsheet containing the employees who are eligible for mentorship by one of the upcoming retirees.

![mentorship_eligibility.png](https://github.com/JosieBoyer/Pewlett_Hackard_Analysis/blob/main/Pewlett-Hackard_analysis-main/Resources/mentorship_eligibility.png)

- The client has asked that we compile a list of potential candidates for the recommended internal mentorship program, asking us to limit our search to employees born in the year 1965.  This query produced a list of 1,549 names.

## Summary
- Pewlett-Hackard has a big problem here...  The parameters they've given us for finding suitable replacements for the outgoing retirees brings back only 2.1% of the number of people they'd need for a 1-to-1 replacement.  It also occurred to me that, more than likely, the candidates would need to come from the respective departments in which the outgoing employees currently work. Below is a comparison of the outgoing numbers vs. the candidates for mentorship, by department:

![retiree_vs_candidate_counts.png](https://github.com/JosieBoyer/Pewlett_Hackard_Analysis/blob/main/Pewlett-Hackard_analysis-main/Resources/retiree_vs_candidate_counts.png)

- This is a fairly grim comparison, but my conclusion is simple: Pewlett-Hackard needs to greatly expand their criteria for selecting candidates.  It could very well be that date-of-birth isn't the best (or at least not the ONLY) pre-requisite for locating candidates, but if they decide to use only that criteria, then the search should at least expand well beyond a single birth year.  Looking at employees born AFTER 1965 would not only expand the pool of candidates, but would also benefit the company in that the newly trained senior employees may be around longer.
