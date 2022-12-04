-- 1. Write a query to display list of employees who are not having CLERK in their JOB_ID
SELECT * FROM EMPLOYEES
WHERE not JOB_ID LIKE '%CLERK%';

-- 2. Display list of departments which are not having managers from  DEPARTMENTS table
SELECT DEPARTMENT_NAME FROM DEPARTMENTS
WHERE MANAGER_ID IS NULL;

-- 3. Write a query to display all the employees whose JOB_ID is having CLERK and also drawing salary more than 10000.
SELECT * FROM EMPLOYEES
WHERE JOB_ID LIKE '%CLERK%' and SALARY>1000;

-- 4. Write a query to display all the employees whose JOB_ID not containing  CLERK or MAN and working in departments whose ids are not 100, 110,10,20.
SELECT * FROM EMPLOYEES
WHERE JOB_ID NOT LIKE '%CLERK%' and JOB_ID NOT LIKE '%MAN%' and DEPARTMENT_ID NOT in (100,110,10,20);

-- 5. Write a query to display list of employs either working with JOB_ID  containing REP or drawing salary between 5000 and 10000
SELECT * FROM EMPLOYEES
WHERE  JOB_ID LIKE '%REP%' OR SALARY BETWEEN 5000 and 10000;