-- 1. Write a query to display CITY, DEPARTMENT_NAME,FIRST_NAME,LAST_NAME,START_DATE,END_DATE. Note START_DATE and END_DATE is there in JOB_HISTORY table
SELECT L.CITY,D.DEPARTMENT_ID,E.FIRST_NAME,E.LAST_NAME,J.START_DATE,J.END_DATE
FROM LOCATIONS L
    LEFT JOIN DEPARTMENTS D
        ON L.LOCATION_ID=D.LOCATION_ID
    LEFT JOIN EMPLOYEES E
        ON D.DEPARTMENT_ID=E.DEPARTMENT_ID
    LEFT JOIN JOB_HISTORY J
        ON E.EMPLOYEE_ID=J.EMPLOYEE_ID
ORDER BY J.START_DATE;

-- 2. Write a query to display FIRST_NAME,LAST_NAME,JOB_ID of employees who are working as Programmer
SELECT E.FIRST_NAME,E.LAST_NAME,J.JOB_ID
FROM EMPLOYEES E
    JOIN JOBS J
        ON J.JOB_TITLE='Programmer' AND E.JOB_ID=J.JOB_ID;

-- 3. Write a query to display FIRST_NAME,LAST_NAME,JOB_ID of employees who are working as Programmer, Stock Clerk.
SELECT E.FIRST_NAME,E.LAST_NAME,J.JOB_ID
FROM EMPLOYEES E
    JOIN JOBS J
        ON J.JOB_TITLE='Programmer' AND E.JOB_ID=J.JOB_ID
UNION
SELECT E.FIRST_NAME,E.LAST_NAME,J.JOB_ID
FROM EMPLOYEES E
    JOIN JOBS J
        ON J.JOB_TITLE='Stock Clerk' AND E.JOB_ID=J.JOB_ID;

-- 4. Write a query to display FIRST_NAME,LAST_NAME, JOB_ID of employes whose JOB_TITLE is having designation Manager.
SELECT FIRST_NAME,LAST_NAME,JOB_ID
FROM EMPLOYEES
WHERE JOB_ID IN (
    SELECT JOB_ID
    FROM JOBS
    WHERE JOB_TITLE LIKE '%Manager%'
);

-- 5. Write a query to display FIRST_NAME, LAST_NAME, SALARY of employees who are getting more than Peter Hall and Ki Gee employees
SELECT FIRST_NAME,LAST_NAME,SALARY
FROM EMPLOYEES
WHERE SALARY >ALL (
    SELECT SALARY
    FROM EMPLOYEES
    WHERE EMPLOYEE_ID IN (
        SELECT EMPLOYEE_ID
        FROM EMPLOYEES
        WHERE FIRST_NAME='Peter' AND LAST_NAME='Hall'
            or FIRST_NAME='Ki' and LAST_NAME='Gee'
    )
);

-- 6. Write a query to display FIRST_NAME,LAST_NAME, SALARY of employees who are getting more than Peter Hall or Ki Gee employees
SELECT FIRST_NAME,LAST_NAME,SALARY
FROM EMPLOYEES
WHERE SALARY >ANY (
    SELECT SALARY
    FROM EMPLOYEES
    WHERE EMPLOYEE_ID IN (
        SELECT EMPLOYEE_ID
        FROM EMPLOYEES
        WHERE FIRST_NAME='Peter' AND LAST_NAME='Hall'
            or FIRST_NAME='Ki' and LAST_NAME='Gee'
    )
);    
