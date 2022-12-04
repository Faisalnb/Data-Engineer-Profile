-- 1. Write a query to display FIRST_NAME,LAST_NAME, SALARY and sum of salaries of all employees department_id
SELECT FIRST_NAME, LAST_NAME, SALARY, SUM(SALARY) OVER() AS SUM_SALARY
FROM EMPLOYEES;

-- 2. Write a query to display FIRST_NAME,LAST_NAME, SALARY and sum of salaries of all employees department wise
SELECT FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID, SUM(SALARY) OVER(
    PARTITION BY DEPARTMENT_ID) AS SUM_SALARY
FROM EMPLOYEES;

--3. Write a query to display FIRST_NAME,LAST_NAME, SALARY and sum of salaries of all employees department wise in descending of their department_id
SELECT FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID, SUM(SALARY) OVER(
    PARTITION BY DEPARTMENT_ID) AS SUM_SALARY
FROM EMPLOYEES
ORDER BY DEPARTMENT_ID DESC;

-- 4. Write a query to display employees who are getting 5th highest salary to 10th highest salary
SELECT *
FROM (
        SELECT FIRST_NAME, LAST_NAME, SALARY, DENSE_RANK() OVER(
        ORDER BY SALARY DESC) AS RANK
        FROM EMPLOYEES
    )
WHERE RANK BETWEEN 5 AND 10;

-- 5. Write a query to display all employees who joined recently first and then later date joined
SELECT EMPLOYEE_ID, HIRE_DATE, LAG (EMPLOYEE_ID) OVER(
    ORDER BY HIRE_DATE DESC), LAG (HIRE_DATE) OVER(
    ORDER BY HIRE_DATE DESC)
FROM EMPLOYEES;

--  Write a query to display all employees who have salary higest to lowest comparing sequentially
SELECT EMPLOYEE_ID, SALARY, LEAD (EMPLOYEE_ID) OVER(
    ORDER BY SALARY DESC), LEAD (SALARY) OVER(
    ORDER BY SALARY DESC)
FROM EMPLOYEES;