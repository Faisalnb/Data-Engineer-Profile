
-- 1. From the following table, write a SQL query to find those employees who receive a higher salary than the 
-- employee with ID 163. Return first name, last name.

SELECT FIRST_NAME,LAST_NAME
FROM EMPLOYEES
WHERE SALARY > all (
    SELECT SALARY
    FROM EMPLOYEES
    WHERE EMPLOYEE_ID=163
);

--2. From the following table, write a SQL query to find out which employees have the same designation as the employee
--  whose ID is 169. Return first name, last name, department ID and job ID.  

SELECT FIRST_name, last_name, department_ID,JOB_ID
FROM EMPLOYEES 
WHERE DEPARTMENT_ID IS NOT NULL AND JOB_ID = (
    SELECT JOB_ID
    FROM EMPLOYEES
    WHERE EMPLOYEE_ID=169
);

--3. From the following table, write a SQL query to find those employees whose salary matches the lowest salary of any
--  of the departments. Return first name, last name and department ID.

SELECT FIRST_NAME,LAST_NAME,DEPARTMENT_ID
FROM EMPLOYEES
WHERE SALARY in (
    SELECT MIN(SALARY)
    FROM EMPLOYEES SUBq
    GROUP BY DEPARTMENT_ID);

--4. From the following table, write a SQL query to find those employees who earn more than the average salary. 
-- Return employee ID, first name, last name.  

SELECT EMPLOYEE_ID, FIRST_NAME,LAST_NAME
FROM EMPLOYEES
WHERE SALARY > all (
    SELECT AVG(SALARY)
    FROM EMPLOYEES
);

--5. From the following table, write a SQL query to find those employees who report to that manager whose first name is ‘Payam’.
--  Return first name, last name, employee ID and salary. 

SELECT FIRST_NAME,LAST_NAME,EMPLOYEE_ID,SALARY
FROM EMPLOYEES
WHERE MANAGER_ID = (
    SELECT EMPLOYEE_ID
    FROM EMPLOYEES
    WHERE FIRST_NAME LIKE 'Payam'
);

--7. From the following table, write a SQL query to find the employee whose salary is 3000 and reporting person’s ID is 121. Return all fields.  
SELECT *
FROM EMPLOYEES
WHERE (SALARY,EMPLOYEE_ID)= (
    SELECT SALARY,EMPLOYEE_ID
    FROM EMPLOYEES
    WHERE SALARY=3000 AND MANAGER_ID=121
);
--8. From the following table, write a SQL query to find those employees whose ID matches any of the numbers 134, 159 and 183. Return all the FIElds
SELECT *
FROM EMPLOYEES;
WHERE EMPLOYEE_ID IN (134,159,183);

--12. From the following table, write a SQL query to find those employees who get second-highest salary. Return all the fields of the employees.
SELECT *
FROM EMPLOYEES E1
WHERE 1=(
    SELECT COUNT(EMPLOYEE_ID)
    FROM EMPLOYEES E2
    WHERE E1.SALARY<E2.SALARY
);

-- 13. From the following tables, write a SQL query to find those employees who work in the same department as ‘Clara’. Exclude all those records where first name is ‘Clara’. Return first name, last name and hire date.   Go to the editor
SELECT *
FROM EMPLOYEES
WHERE DEPARTMENT_ID = (
    SELECT DEPARTMENT_ID
    FROM EMPLOYEES
    WHERE FIRST_NAME LIKE 'Clara'
);

-- 15. From the following tables, write a SQL query to find those employees who earn more than the average salary and work in the same department as an employee whose first name contains the letter 'J'. Return employee ID, first name and salary.   Go to the editor
--28. From the following table, write a SQL query to find out which employees are earning more than the average salary and who work in any of the IT departments. Return last name.   Go to the editor
SELECT *
FROM (
    SELECT *
    FROM EMPLOYEES
    WHERE SALARY > (
        SELECT DISTINCT AVG(SALARY) OVER()
        FROM EMPLOYEES
)
)
WHERE DEPARTMENT_ID IN (
    SELECT DEPARTMENT_ID
    FROM DEPARTMENTS
    WHERE DEPARTMENT_NAME LIKE '%IT%'
);


--16. From the following table, write a SQL query to find those employees whose department is located at ‘Toronto’. Return first name, last name, employee ID, job ID.   Go to the editor
SELECT EMPLOYEE_ID,FIRST_NAME,LAST_NAME, DEPARTMENT_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN (    
    SELECT DEPARTMENT_ID
    FROM DEPARTMENTS
    WHERE LOCATION_ID IN (
        SELECT LOCATION_ID
        FROM LOCATIONS
        WHERE CITY='Toronto'
)
);

--18. From the following table, write a SQL query to find those employees whose salary is lower than that of employees whose job title is "MK_MAN". Exclude employees of Job title ‘MK_MAN’. Return employee ID, first name, last name, job ID.   Go to the editor
SELECT *
FROM EMPLOYEES
WHERE SALARY < (
    SELECT SALARY
    FROM EMPLOYEES
    WHERE JOB_ID ='MK_MAN'
)
AND JOB_ID != 'MK_MAN';

-- From the following table, write a SQL query to calculate total salary of the departments where at least one employee works. Return department ID, total salary.
SELECT DEPARTMENT_ID,SUM(SALARY)
FROM EMPLOYEES  
WHERE DEPARTMENT_ID IS NOT NULL
GROUP BY DEPARTMENT_ID
ORDER BY DEPARTMENT_ID;


--24. Write a query to display the employee id, name ( first name and last name ), salary and the SalaryStatus column with a title HIGH and LOW respectively for those employees whose salary is more than and less than the average salary of all employees
SELECT FIRST_NAME,LAST_NAME,SALARY,
CASE WHEN SALARY>= (
    SELECT AVG(SALARY)
    FROM EMPLOYEES)
THEN 'HIGH'
ELSE 'LOW'
END AS STATUS
FROM EMPLOYEES;

--30. From the following tables, write a SQL query find the employees who report to a manager based in the United States. Return first name, last name.   Go to the editor
SELECT FIRST_NAME,LAST_NAME
FROM EMPLOYEES
WHERE MANAGER_ID IN (
    SELECT EMPLOYEE_ID
    FROM EMPLOYEES
    WHERE DEPARTMENT_ID IN (
        SELECT DEPARTMENT_ID
        FROM DEPARTMENTS
        WHERE LOCATION_ID IN (SELECT LOCATION_ID
            FROM LOCATIONS
            WHERE COUNTRY_ID='US')
        AND MANAGER_ID IS NOT NULL
)
)
;

--33. From the following table, write a SQL query to find those employees who manage a department. Return all the fields of employees table.   Go to the editor
SELECT *
FROM EMPLOYEES MAINq
WHERE EXISTS (
    SELECT 1 MANAGER_ID
    FROM DEPARTMENTS SUBq
    WHERE SUBQ.MANAGER_ID IS NOT NULL AND MAINQ.EMPLOYEE_ID=SUBQ.MANAGER_ID
);

--43. From the following table, write a SQL query to find those employees who joined after the employee whose ID is 165. Return first name, last name and hire date.   Go to the editor
SELECT HIRE_DATE
FROM EMPLOYEES
WHERE EMPLOYEE_ID=165;
--23-FEB-08
SELECT EMPLOYEE_ID,FIRST_NAME,LAST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE> DATE '2008-02-23';

SELECT EMPLOYEE_ID,FIRST_NAME,LAST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE > (
    SELECT HIRE_DATE
    FROM EMPLOYEES
    WHERE EMPLOYEE_ID=165
);

--45. From the following table, write a SQL query to find those employees who earn less than the average salary and work at the department where Laura (first name) is employed. Return first name, last name, salary, and department ID.   Go to the editor
SELECT FIRST_NAME,LAST_NAME,DEPARTMENT_ID
FROM EMPLOYEES
WHERE SALARY<  (
    SELECT DISTINCT AVG(SALARY) OVER()
    FROM EMPLOYEES
) AND DEPARTMENT_ID=(
    SELECT DEPARTMENT_ID
    FROM EMPLOYEES
    WHERE FIRST_NAME='Laura'
);


--47. From the following tables, write a SQL query to find the city of the employee of ID 134. Return city.   Go to the editor
SELECT CITY
FROM LOCATIONS L
    JOIN DEPARTMENTS D
        ON L.LOCATION_ID=D.LOCATION_ID
    JOIN EMPLOYEES E
        ON D.DEPARTMENT_ID=E.DEPARTMENT_ID
WHERE E.EMPLOYEE_ID=134;

--48. From the following tables, write a SQL query to find those departments where maximum salary is 7000 and above. The employees worked in those departments have already completed one or more jobs. Return all the fields of the departments.   Go to the editor
SELECT *
FROM DEPARTMENTS
WHERE DEPARTMENT_ID IN (
    SELECT DEPARTMENT_ID
    FROM EMPLOYEES
    WHERE EMPLOYEE_ID IN (
        SELECT  EMPLOYEE_ID
        FROM JOB_HISTORY
        GROUP BY EMPLOYEE_ID
        HAVING COUNT(EMPLOYEE_ID) >1
    )
    GROUP BY DEPARTMENT_ID
    HAVING MAX(SALARY)  > 7000
);

--49. From the following tables, write a SQL query to find those departments where the starting salary is at least 8000. Return all the fields of departments.   Go to the editor

SELECT DEPARTMENT_ID,MIN(SALARY) AS MIN_SALARY
FROM EMPLOYEES
    GROUP BY DEPARTMENT_ID
    HAVING MIN(SALARY) >8000;


--                                                                       ========EMP DATA SET============
--4. From the following table, write a SQL query to list the employees’ name, increased their salary by 15%, and expressed as number of Dollars.
SELECT FIRST_NAME,LAST_NAME,TO_CHAR(SALARY,'$99,999'),TO_CHAR(SALARY*1.15,'$99,999')  AS REVISED_SALARY
FROM EMPLOYEES;
--FIRST_NAME,LAST_NAME,TO_CHAR(SALARY,'$99,999'),REVISED_SALARY
-- Steven,King, $24,000, $27,600
-- Neena,Kochhar, $17,000, $19,550

--18. From the following table, write a SQL query to find out which employees joined in the month of January. Return complete information about the employees.

SELECT *    
FROM EMPLOYEES
WHERE TO_CHAR(HIRE_DATE,'MON')='JAN';

SELECT TRUNC(SYSDATE,'MON') FROM DUAL;

--19. From the following table, write a SQL query to separate the names of employees and their managers by the string 'works for'.   Go to the editor

SELECT E1.FIRST_NAME||' works for '||E2.FIRST_NAME AS EMPandMAN
FROM EMPLOYEES E1,EMPLOYEES E2
WHERE E1.EMPLOYEE_ID=E2.MANAGER_ID;
--EMPANDMAN
-- Eleni works for Ellen
-- Alberto works for Sundar

--24.From the following table, write a SQL query to identify those employees who joined the company in 2008. Return complete information about the employees.   Go to the editor

SELECT FIRST_NAME,LAST_NAME,TO_CHAR(HIRE_DATE,'YYYY') AS HIRE_YEAR
FROM EMPLOYEES
WHERE EXTRACT(YEAR FROM HIRE_DATE)=2008;
--FIRST_NAME,LAST_NAME,HIRE_YEAR
-- Steven,Markle,2008
-- Hazel,Philtanker,2008


--25. Write a query to display the employee id, name ( first name and last name ), SalaryDrawn, AvgCompare (salary - the average salary of all employees) and the SalaryStatus column with a title HIGH and LOW respectively for those employees whose salary is more than and less than the average salary of all employees.   Go to the editor
SELECT EMPLOYEE_ID, FIRST_NAME,LAST_NAME, SALARY,SALARY- AVG(SALARY) OVER() AS SALARY_COMP,CASE
    WHEN SALARY- AVG(SALARY) OVER() >0 THEN 'HIGH'
    WHEN SALARY- AVG(SALARY) OVER() <0 THEN 'LOW'
    ELSE NULL
    END AS SALARY_STATUS
FROM EMPLOYEES;


--26. From the following table, write a SQL query to find all those departments where at least one employee is employed. Return department name.   Go to the editor
SELECT DEPARTMENT_NAME
FROM DEPARTMENTS
WHERE DEPARTMENT_ID IN (
    SELECT DEPARTMENT_ID
    FROM EMPLOYEES
    WHERE DEPARTMENT_ID IS NOT NULL
);

--30. From the following tables, write a SQL query find the employees who report to a manager based in the United States. Return first name, last name.   Go to the editor
SELECT first_name,last_name FROM employees 
WHERE manager_id IN 
(SELECT employee_id 
FROM employees 
WHERE department_id IN 
(SELECT department_id 
FROM departments 
WHERE location_id IN 
(SELECT location_id 
FROM locations 
WHERE country_id='US')));


--From the following table, write a SQL query to find those employees who earn more than the minimum salary of a department of ID 20. Return first name, last name, salary, and department ID.
SELECT *
FROM EMPLOYEES
WHERE SALARY > ANY (
    SELECT SALARY
    FROM EMPLOYEES
    WHERE DEPARTMENT_ID=20
);
--                                                                             ===END===