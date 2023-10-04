/* TASK 1 */
CALL employer_application_top5_salary(@vacancy_name, @vacancy_salary);
SELECT @vacancy_name, @vacancy_salary;

/* TASK 2 */
SELECT employee.employee_id, get_employee_full_name(employee.employee_id) AS full_name FROM employee
ORDER BY employee.employee_id ASC;

/* TASK 3 */
SELECT employer.* FROM employer
JOIN employer_application ON employer_application.employer_id = employer.employer_id
WHERE employer_application.salary > get_avg_employer_salary();

/* TASK 4 */
SELECT employee_application.application_id, employee_application.date, 
		this_year_application(employee_application.date) 
FROM employee_application;


/* TASK 5 */
CALL aggr_employee (@avg_salary, @avg_work_exp, @min_salary, @min_work_exp, @max_salary, @max_work_exp);
SELECT @avg_salary, @avg_work_exp, @min_salary, @min_work_exp, @max_salary, @max_work_exp;

/* TASK 6 */
CALL aggr_employee_short (@avg_salary, @avg_work_exp, @min_salary, @min_work_exp, @max_salary, @max_work_exp);
SELECT @avg_salary, @avg_work_exp, @min_salary, @min_work_exp, @max_salary, @max_work_exp;