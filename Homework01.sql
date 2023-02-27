--Homework_01
SELECT * FROM employees;

/*
1. Write a query to display the first name, last name, and hire date of all 
employees who were hired between January 1, 2000, and December 
31, 2000, and whose last name begins with the letter 'S'.
*/

SELECT first_name, last_name, hire_date FROM employees
WHERE  hire_date BETWEEN '01-JAN-2000' AND '31-DEC-2000';

/*
2. Write a query to display the first name, last name, and job title of all 
employees who work in the Sales or Accounting departments.

SALES - 80/ Accounting - 110
*/

SELECT first_name, last_name, job_id FROM employees
WHERE department_id = 80 OR department_id = 110;

/*
3. Write a query to display the first name, last name, and salary of all 
employees who earn more than $10,000 and less than $20,000.
*/

SELECT first_name, last_name, salary FROM employees
WHERE salary BETWEEN 10000 AND 20000;


/*
4. Write a query to display the first name, last name, and hire date of all 
employees who do not have a manager.
*/

SELECT first_name, last_name, hire_date FROM employees
WHERE manager_id IS null;


/*
5. Write a query to display the first name, last name, and job title of all 
employees who are either Sales Representatives or Sales Managers.
*/

SELECT first_name, last_name, hire_date FROM employees
WHERE department_id = 80;

/*
6. Write a query to display the first name, last name, and hire date of all 
employees who were not hired in the year 2000.
*/

SELECT first_name, last_name, hire_date FROM employees
WHERE hire_date NOT BETWEEN '01-JAN-2000' AND '31-DEC-2000';


/*
7. Write a query to display the first name and last name of all employees,
concatenated as "First Last".
*/

SELECT CONCAT(CONCAT(first_name,' '), last_name) FROM employees;


/*
8. Write a query to display the first name, last name, and salary of all 
employees, sorted by salary in descending order.
*/

SELECT first_name, last_name, salary FROM employees
ORDER BY salary DESC;

/*
9. Write a query to display the first name, last name, and job title of all 
employees whose job title contains the word "Manager".
*/

SELECT first_name, last_name, job_id FROM employees
WHERE job_id LIKE '%M%A%N' OR job_id LIKE '%M%G%R';

/*
10. Write a query to display the first name, last name, and salary of 
all employees whose salary is not null
*/

SELECT first_name, last_name, salary FROM employees
WHERE salary IS NOT null;

/*
11. Write a query to display the first name, last name, and job title of
all employees, with the first name and last name in uppercase letters 
and the job title in lowercase letters.
*/

SELECT UPPER(first_name), UPPER(last_name),LOWER(job_id) FROM employees;

/*
12. Write a query to display the first name, last name, and job title of
all employees, with the first letter of each word in the job title 
capitalized.
*/

SELECT first_name, last_name, CONCAT(CONCAT(UPPER(SUBSTR(job_id,0,1)), LOWER(SUBSTR(job_id,2,2))),CONCAT(UPPER(SUBSTR(job_id,4,1)), LOWER(SUBSTR(job_id,5)))) as "JOB_TITLE" FROM employees;

/*
13. Write a query to display the first name, last name, and length of 
the job title of all employees.
*/

SELECT first_name, last_name, LENGTH(job_id) FROM employees;

/*
14. Write a query to display the first name, last name, and a 
concatenated string of the first name, last name, and job title of all 
employees.
*/

SELECT first_name, last_name, first_name||last_name||job_id  as "CONCATINATION" FROM employees;

/*
15. Write a query to display the first name, last name, and the first 
three characters of the job title of all employees.
*/

SELECT first_name, last_name, SUBSTR(job_id, 1,3) as" JOB_TITLE" FROM employees;

/*
16. Write a query to display the first name, last name, and the 
position of the first occurrence of the letter "a" in the job title of all 
employees.
*/

SELECT first_name, last_name, INSTR(job_id, UPPER('a'))  FROM employees;

/*
17. Write a query to display the first name, last name, and salary of 
all employees, with the salary rounded to the nearest thousand dollars.
*/


SELECT first_name, last_name, ROUND(salary/1000) * 1000 FROM employees;

/*
18. Write a query to display the first name, last name, and salary of 
all employees, with the salary truncated to the nearest thousand 
dollars.
*/

SELECT first_name, last_name, TRUNC(salary/1000) * 1000 FROM employees;

SELECT first_name, last_name,salary FROM employees;

/*
19. Write a query to display the first name, last name, and the length
of the first name of all employees.
*/

SELECT first_name, last_name, LENGTH(first_name) FROM employees;


/*
20. Write a query to display the first name, last name, and a 
concatenated string of the first name, a comma, and the last name of 
all employees
*/

SELECT first_name, last_name, first_name || ',' || last_name as "FIRST AND LAST NAME" FROM employees;

/*
21. Write a query to display the first name, last name, and the first 
three characters of the first name of all employees.
*/

SELECT first_name, last_name, SUBSTR(first_name,1,3) FROM employees;

/*
22. Write a query to display the first name, last name, and the 
position of the first occurrence of the letter "e" in the first name of all 
employees.
*/

SELECT first_name, last_name, INSTR(first_name, 'e') FROM employees;

/*
23. Write a query to display the first name, last name, and the length
of the last name of all employees.
*/

SELECT first_name, last_name, LENGTH(last_name) FROM employees;

/*
24. Write a query to display the first name, last name, and the first 
three characters of the last name of all employees.
*/

SELECT first_name, last_name, SUBSTR(last_name, 1, 3) as "FIRST 3 IN LAST NAME" FROM employees;

/*
25. Write a query to display the first name, last name, and the 
position of the first occurrence of the letter "a" in the last name of all 
employees.
*/

SELECT first_name, last_name, INSTR(last_name, 'a') FROM employees;
