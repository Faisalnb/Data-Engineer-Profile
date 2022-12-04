-- 1. Create table student with the columns SNO,MSQL,MUNIX,AVGE and  insert two rows of your choice and commit the data
CREATE TABLE student(
    SNO NUMBER(3),
    MSQL NUMBER(3),
    MUNIX NUMBER(3),
    AVGE NUMBER(5,2)
);

INSERT INTO student VALUES (
    1,
    67,
    89,
    78
);

INSERT INTO student VALUES (
    1,
    65,
    90,
    77.5
);
COMMIT;	

-- 2. Drop the table and check it whether it is present in the recyclebin and restore the table back and display the data
SHOW RECYCLEBIN;

-- 3. Truncate student table and check whether data is obtained back or not with rollback command 
TRUNCATE TABLE STUDENT;
ROLLBACK;

-- 4. Write a query to display all employees who are working in department_id 60 from employees table
SELECT * FROM EMPLOYEES
WHERE DEPARTMENT_ID=60;

-- 5. Write a query to display all employees whose salary is in the range 6000 to 12000
SELECT * FROM EMPLOYEES
WHERE SALARY BETWEEN 6000 AND 12000;

-- 6. Write a query to display employees who are working the following departments whose department_id may be 60 or 80 or 90
SELECT * FROM EMPLOYEES
WHERE DEPARTMENT_ID in (60,80,90);

-- 7. Write a query to display all employees working with designation containing MAN (Manager).
SELECT * FROM EMPLOYEES
WHERE JOB_ID LIKE '%MAN';

-- 8. Write a query to display all departments where department_name containing multi word department_name
SELECT JOB_ID,DEPARTMENT_ID FROM EMPLOYEES
WHERE JOB_ID LIKE '%\_%' ESCAPE'\';

-- 9. Write a query to display all countries which are not in region_id 2
SELECT COUNTRY_ID, COUNTRY_NAME FROM COUNTRIES
WHERE REGION_ID != 2;