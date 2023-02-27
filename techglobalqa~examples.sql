
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



SELECT COUNT(*) FROM employees
WHERE LENGTH(first_name) > 4;

SELECT distinct job_id FROM employees;

/*
•Write a query to count all unique region ids under the 
countries table
*/

SELECT count(distinct region_id) FROM countries;


SELECT MAX(salary) as "Maxsalary", job_id, count(job_id) as "Number Of Employees" from employees
GROUP BY job_id
ORDER BY MAX(salary) DESC;


SELECT count(*) as "Amount Of Employees", job_id from employees
GROUP BY job_id;


SELECT count(first_name) FROM employees
GROUP BY manager_id
HAVING manager_id IS NOT null;


------------------------HAVING----------------------

SELECT job_id FROM employees
GROUP BY job_id
HAVING count(job_id) = 2;


SELECT count(*) FROM employees
GROUP BY manager_id
HAVING manager_id IS NOT null;

SELECT manager_id, min(salary) from employees
GROUP BY manager_id
HAVING manager_id IS NOT null AND min(salary) > 6000
ORDER BY min(salary) DESC;



-----------------------------------PRACTICE-------------------------------------


--Write a query to get number of employees for same manager id which is not null and order by manager id.

SELECT manager_id, count(*) FROM employees
HAVING manager_id IS NOT null
GROUP BY manager_id
ORDER BY manager_id;

--Write a query to get number of employees for same job id and order by number of employees it is found.

SELECT job_id, count(*)  FROM employees
GROUP BY job_id
order by count(*);

--Write a query to get max salary for each department id which is not null.

SELECT MAX(salary), department_id FROM employees
WHERE department_id IS NOT null
GROUP BY department_id;

--Write a query to get min salary for each department id that has min salary more than 5000 and department is not null.

SELECT MIN(salary), department_id FROM employees
GROUP BY department_id
HAVING MIN(salary) > 5000
AND department_id IS NOT null;

--Write a query to get sum of salaries for each job id and order by sum ascending.

SELECT sum(salary),job_id FROM employees
GROUP BY job_id
ORDER BY sum(salary) ASC;

--Write a query to get max of sum of salaries for each job id.

SELECT max(sum(salary)) FROM employees
GROUP BY job_id;

--Write a query to group employees by their first name’s first letter and get the number of employees for each group and order by the numbers that are found.

SELECT SUBSTR(first_name, 1, 1), count(*) from employees
GROUP BY SUBSTR(first_name, 1, 1);



--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~--
-----------------------------------SUBQUERIES-----------------------------------
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~--


select first_name from employees
where salary=(select max(salary) from employees);

SELECT * FROM employees
where department_id = 10;

SELECT * FROM employees
WHERE department_id = (select department_id FROM departments WHERE department_name = 'Administration');

SELECT * FROM employees
where department_id IN (select department_id from departments);

select * FROM employees
where deraprtment_id in (select location_id from departments where department_id in(10,20));


SELECT job_id, first_name, (select last_name from employees) from employees; --WRONG


SELECT job_id, first_name, (select job_id from employees where first_name = 'Ellen') from employees;




select* from employees;

--Write a query to get employees first_name and salary who makes more than employee who has employee_id 121 and then order by salary ascending.

SELECT first_name, salary FROM employees
where salary >= (select salary from employees 
WHERE employee_id = 121)
order by salary;

--Write a query to get employees first_name, department_id who works in same department with employee who has employee_id 150.

SELECT first_name, department_id FROM employees
WHERE department_id in (select department_id FROM employees WHERE employee_id = 150);

--Write a query to find second largest salary.

SELECT MAX(SALARY) FROM Employees 
WHERE SALARY < (SELECT MAX(SALARY) FROM Employees );

--THIRD LARGEST SALARY
SELECT MAX(SALARY) FROM Employees 
WHERE SALARY < (SELECT MAX(SALARY) FROM Employees 
where  salary  < (SELECT MAX(SALARY) FROM Employees));

--Write a query to get name of employees who is making second largest salary.

select first_name, salary from employees
 WHERE salary = (select max(salary) from employees
 where salary < (select max(salary) from employees));

--Write a query to get number of postal code under same countries from locations table.

SELECT COUNT(postal_code), country_id from locations
GROUP BY country_id;

--Write a query to get number of postal code under same countries from locations table if their count is more than 1.

SELECT COUNT(postal_code), country_id from locations
GROUP BY country_id
HAVING count(postal_code) > 1;


--Write a query to get all employees who is making more than average salary and order by salary.

SELECT first_name, salary FROM employees
WHERE salary > (SELECT AVG(salary) from employees)
ORDER BY salary;

--Write a query to get all cities which have same state with Toronto from locations table.

SELECT city from locations
WHERE state_province in (SELECT state_province FROM locations WHERE city = 'Toronto');

--Write a query to find the employee who is making second lowest salary.

select min(salary) from employees
WHERE salary > (select min(salary) from employees);

select first_name, salary from employees
 WHERE salary = (select MIN(salary) from employees
 where salary > (select MIN(salary) from employees));
 



/*
1. Write a query to display the name (first name and last name) for those employees who gets more salary than the employee whose ID is 163.
2. Write a query to display the name (first name and last name), salary, department id, job id for those employees who works in the same designation as the employee works whose id is 169.
3. Write a query to display the name (first name and last name), salary, department id for those employees who earn such amount of salary which is the smallest salary of any of the departments.
4. Write a query to display the employee id, employee name (first name and last name) for all employees who earn more than the average salary.
5. Write a query to display the employee name (first name and last name), employee id and salary of all employees who report to Payam.
6. Write a query to display the department number, name (first name and last name), job_id and department name for all employees in the Finance department.
7. Write a query to display all the information of an employee whose salary and reporting person id is 3000 and 121, respectively.
8. Display all the information of an employee whose id is any of the number 134, 159 and 183.
9. Write a query to display all the information of the employees whose salary is within the range 1000 and 3000.
10. Write a query to display all the information of the employees whose salary is within the range of smallest salary and 2500.
*/

--1. Write a query to display the name (first name and last name) for those employees who gets more salary than the employee whose ID is 163.

SELECT first_name || ' ' || last_name as "NAME", salary FROM employees
WHERE salary > (SELECT salary FROM employees 
WHERE employee_id = 163);

--2. Write a query to display the name (first name and last name), salary, department id, job id for those employees who works in the same designation as the employee works whose id is 169.

SELECT first_name || ' ' || last_name as "NAME", salary, department_id, job_id FROM employees
WHERE job_id = (SELECT job_id FROM employees
WHERE employee_id = 169);


--3. Write a query to display the name (first name and last name), salary, department id for those employees who earn such amount of salary which is the smallest salary of any of the departments.

SELECT first_name || ' ' || last_name as "NAME", salary, department_id, job_id FROM employees
WHERE salary = (SELECT min(salary) from employees);


--4. Write a query to display the employee id, employee name (first name and last name) for all employees who earn more than the average salary.
SELECT employee_id, first_name || ' ' || last_name as "NAME" FROM employees
WHERE salary > (SELECT AVG(salary) from employees);

--5. Write a query to display the employee name (first name and last name), employee id and salary of all employees who report to Payam.
--use manager id
SELECT first_name || ' ' || last_name as "NAME", employee_id, salary FROM employees
WHERE manager_id = (SELECT employee_id FROM employees 
where first_name = 'Payam');

select* from departments;
select * from employees;

--6. Write a query to display the department number, name (first name and last name), job_id and department name for all employees in the Finance department.
SELECT department_id, first_name || ' ' || last_name as "NAME", job_id FROM employees
WHERE department_id = (SELECT department_id from departments 
where department_name = 'Finance');

--7. Write a query to display all the information of an employee whose salary and reporting person id is 3000 and 121, respectively.

SELECT * from employees
WHERE salary = 3000
and manager_id = 121;

--8. Display all the information of an employee whose id is any of the number 134, 159 and 183.

SELECT * FROM employees
WHERE employee_id in (134,159,183);

--9. Write a query to display all the information of the employees whose salary is within the range 1000 and 3000.

SELECT * from employees
where salary between 1000 and 3000;

--10. Write a query to display all the information of the employees whose salary is within the range of smallest salary and 2500.

SELect * from employees 
where salary between (Select min(salary) from employees) and 2500;


--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~--
-------------------------------------JOINS--------------------------------------
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~--

SELECT *FROM employees;
SELECT * FROM departments;


SELECT * FROM employees e inner join departments d
ON e.department_id = d.department_id;

SELECT * FROM employees e full outer join departments d
ON e.department_id = d.department_id;

SELECT * FROM employees e right join departments d
ON e.department_id = d.department_id;


SELECT * FROM employees e left join departments d
ON e.department_id = d.department_id;

SELECT * FROM employees e INNER JOIN jobs j
ON e.job_id = j.job_id;


SELECT * FROM employees e INNER JOIN job_history jh
ON e.job_id = jh.job_id;


SELECT * FROM employees e FULL OUTER JOIN job_history jh
ON e.employee_id = jh.employee_id;

SELECT country_name, country_id, region_name FROM countries c INNER JOIN regions r
ON c.region_id = r.region_id;

SELECT e.last_name, e.email, j.job_title FROM employees e INNER JOIN jobs j
ON e.job_id = j.job_id;




SELECT e.first_name, e.last_name, j.job_title, d.department_name FROM employees e INNER JOIN jobs j
ON j.job_id = e.job_id
JOIN departments d
ON d.department_id = e.department_id;


-- SELF JOIN

SELECT e.first_name as employee, m.first_name as manager FROM employees e join employees m
ON e.employee_id = m.manager_id;


SELECT e.first_name, e.salary, m.first_name , m.salary  FROM employees e join employees m
ON e.manager_id = m.employee_id
where m.salary < e.salary;










































