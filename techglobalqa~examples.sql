
select * from employees;

select * from departments;

SELECT * FROM jobs;

--select <columnName> from <table>;

-- Write a querty that fetches everything from the employees table and department id is 90

SELECT * FROM employees
WHERE first_name = 'Ellen';

SELECT department_name FROM departments
WHERE department_id = 50;

SELECT * FROM employees
where first_name = 'Steven'
or first_name = 'Neena';

--Write the query to get all columns from the employees' table if the department id is 50 and the job id is "ST_MAN"
--

SELECT * FROM employees
WHERE department_id = 50
and job_id = 'ST_MAN';

--Write the query to get all columns from the employees' table if the department id is 50 or the job id is "ST_MAN"
--

SELECT * FROM employees
where department_id = 50
or job_id = 'ST_MAN';

--Write the query to get all columns from the employees' table if the department id is 70 or the salary is more than 5000
--

SELECT * FROM employees
where department_id = 70
or salary > 5000;

--Write the query to get all columns from the employees' table if the department id is 70 and the salary is more than 5000
--

SELECT * FROM employees
where department_id = 70
and salary > 5000;
--Write the query to find the employees who are not displayed in step 4.

SELECT * FROM employees
where department_id <> 70
and salary <= 5000;

SELECT * FROM employees
where salary not in ( 4800,10000, 1000, 100, 10);

select * from employees
where commission_pct is not null;

select * from employees
where salary < 10000
and salary > 5000;

select * from employees
where salary between 1000 and 9000;


select 'employee name is ' || first_name from employees;

select first_name || ' ' || last_name from employees;

--Write a querty prints firstname column with the following format Steven makes $24000 per month

-- first_name + ' makes $' + salary + ' per month'

SELECT first_name || ' makes $' || salary || ' per month' as "salary firstname" FROM employees;

--Write a querty prints lastname column with the following format "Doe@email.com"

select last_name || '@' || email || '.com' as "concated value"  from employees;

SELECT first_name, commission_pct FROM employees
ORDER BY commission_pct ASC, first_name DESC;

select * from employees
where first_name like '%a%a%t%';

--1. Write the query to find all columns from the employees' table for first_name starting with 'C'.

select * from employees
where first_name like 'C%a';
--and first_name like '%a';

--2. Write the query to find all columns from the employees' table for first_name ends with 'C'.


select * from employees
where first_name like '%a';

--3. Write the query to find all columns from the employees' table for first_name that contains two lowercase 'a'.

select * from employees
where first_name like '%a%'
order by first_name desc;

-- SINGLE ROW FUNCTIONS

SELECT initcap(lower(first_name)) from employees;

select upper(initcap('hello my name is SQL')) from dual;

--Write the query to get all employees last names in upper case.

select upper(last_name) from employees;

--Write the query to get all employees emails in lower case.

select lower(email) from employees;
--Write the query to get all employees first name in upper case, last names in lower case and emails in only first letter upper case. 

select upper(first_name), lower(last_name), initcap(email) from employees;

select concat(concat(first_name, ' '), last_name) from employees;

-- ellen IS THE NAME and their job is: SALESMAN

select concat(concat(lower(first_name), upper(' is the name ')), concat('their job is: ', upper(job_id))) from employees;


select 'hello', substr('hello', 2, 3) from employees;

select 'hello my name is', substr('hello my name is', 10, 4) from employees;

select 'hello my name is', length(substr('hello my name is', 10, 4)) from employees;

select first_name, length(first_name) as "length of the name" from employees;

select city, instr(city, 'a') from locations; 
select * from locations; 

-- write me a querty to find city includes 'a' character in locations;

select city from locations
where instr(city, 'a') > 0;

-- Write the query to get all last names that starting from index number 2 and add 4 more character from employees.

select substr(last_name, 2, 4) from employees;

-- Write the query to get all last names that starting from index number 4 from employees .

select substr(last_name, 4) from employees;

-- Write the query to return first name and last name combined as lower case with the space and find the index number of 'k' from combined firstname and lastname from employees.

select lower(first_name || ' ' || last_name) as "full name", instr(lower(first_name || ' ' || last_name), 'k') as "index number" from employees;


select * from employees, departments;

select * from jobs;

select first_name, last_name from employees
where first_name = 'Samuel';

select first_name, last_name from employees
where last_name like 'S%';




-- ROUND

select round(100.554) from dual;

select round(100.0888, 3) from dual;

select round(107.9) from dual;

-- TRUNC

select trunc(107.9879789796896) from dual;

select trunc(107.9879789796896, 3) from dual;

select trunc(107.9879789796896, 5) from dual;

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~--
-------------------------------GROUP ROW FUNCTIONS------------------------------
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~--

select * from employees;


SELECT MAX(salary) as "MAX_SALARY" FROM employees;

SELECT MIN(salary) FROM employees;

SELECT COUNT(salary) as "MAX_COUNT" FROM employees
WHERE salary > 3000;  --AS A RESULT IT WILL BRING ME THE NUMBER OF ROWS IN THIS CASE 81

SELECT SUM(salary) FROM employees;

SELECT MAX(salary) as "MAX_SALARY" FROM employees
WHERE LOWER(job_id) LIKE '%vp%';

SELECT TRUNC(SUM(salary) / COUNT(*)) FROM employees;

SELECT ROUND(AVG(salary)) FROM employees;

















































