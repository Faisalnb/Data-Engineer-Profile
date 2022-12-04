-- 1. Write a query to display all countries with their locations
SELECT REGION_ID,REGION_NAME,COUNTRY_NAME
FROM REGIONS
LEFT OUTER JOIN COUNTRIES
USING (REGION_ID);

-- 2. Write a query to display only the countries which are having locations
SELECT L.COUNTRY_ID, L.COUNTRY_NAME, R.*
FROM COUNTRIES L
INNER JOIN LOCATIONS R
ON L.COUNTRY_ID=R.COUNTRY_ID;

-- 3. Write a query to display job_title, first_name,last_name
SELECT L.JOB_TITLE,R.FIRST_NAME,R.LAST_NAME
FROM JOBS L
INNER JOIN EMPLOYEES R
ON L.JOB_ID=R.JOB_ID;

-- 4. Write a query to display all departments with department_name, first_name,last_name,salary, commission_pct
SELECT L.DEPARTMENT_NAME,R.FIRST_NAME,R.LAST_NAME,R.SALARY,R.COMMISSION_PCT
FROM DEPARTMENTS L
LEFT OUTER JOIN EMPLOYEES R
ON L.DEPARTMENT_ID=R.DEPARTMENT_ID;

-- 5. Write a query to display all the employees with department_name, first_name,last_name,salary, commission_pct
SELECT L.DEPARTMENT_NAME,R.FIRST_NAME,R.LAST_NAME,R.SALARY,R.COMMISSION_PCT
FROM DEPARTMENTS L
RIGHT OUTER JOIN EMPLOYEES R
ON L.DEPARTMENT_ID=R.DEPARTMENT_ID;

-- 6. Write a query to display all the employees and all departments with department_name, first_name,last_name,salary, commission_pct
SELECT L.DEPARTMENT_NAME,R.FIRST_NAME,R.LAST_NAME,R.SALARY,R.COMMISSION_PCT
FROM DEPARTMENTS L
FULL OUTER JOIN EMPLOYEES R
ON L.DEPARTMENT_ID=R.DEPARTMENT_ID;

-- 7. Write a query to display the list of employees who joined first when compared to the other employees
SELECT L.EMPLOYEE_ID,L.FIRST_NAME,L.LAST_NAME,L.HIRE_DATE,
       R.EMPLOYEE_ID,R.FIRST_NAME,R.LAST_NAME,R.HIRE_DATE
FROM EMPLOYEES L
JOIN EMPLOYEES R
ON L.HIRE_DATE <R.HIRE_DATE;

-- 8. Write a query to display the list of employees who joined first when  compared to the other employees in the same department
SELECT L.EMPLOYEE_ID,L.DEPARTMENT_ID, L.FIRST_NAME,L.LAST_NAME,L.HIRE_DATE,
       R.EMPLOYEE_ID,R.DEPARTMENT_ID,R.FIRST_NAME,R.LAST_NAME,R.HIRE_DATE
FROM EMPLOYEES L
JOIN EMPLOYEES R
ON L.HIRE_DATE < R.HIRE_DATE
WHERE L.DEPARTMENT_ID=R.DEPARTMENT_ID
ORDER BY L.DEPARTMENT_ID;

