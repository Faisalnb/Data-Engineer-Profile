
-- 1. Create table T1 with column N1 of number data type without size. Find  out what type of number data can be stored
CREATE TABLE T1(
        N NUMBER()
    );

-- 2. Write a query to display list of employees whose salary <= 5000 and  department_id <= 60. Write two versions of the queryto get the above required data. 
-- 1) with the conditional expressions using OR operator 2) with conditional expression using AND operator
SELECT FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID
FROM EMPLOYEES
WHERE SALARY <= 5000 AND DEPARTMENT_ID <= 60;
--+++++
SELECT FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID
FROM EMPLOYEES
WHERE NOT (SALARY > 5000 or DEPARTMENT_ID > 60);

-- 3. Write a SQL statement to delete all duplicate rows in the following table
-- ENO SALARY
-- 100 10000
-- 200 20000
-- 100 10000
-- 100 10000
-- 100 10000
-- 100 10000
-- 100 10000
-- After removing duplicate rows the table must have only two rows 
-- ENO SALARY
-- 100 10000
-- 200 20000
-- Use ROWID concept only to solve this with suitable operators.

SELECT min(ROWID)
FROM T2
GROUP BY ENO;

SELECT *
FROM T2
WHERE ROWID='AAAR1WAAEAAAJVVAAB' OR ROWID='AAAR1WAAEAAAJVVAAA';

-- 4. Write a query to display first_name,last_name,salary,incentive for all 
-- employees. Incentive is calculated as .18 percentage of salary. Display 
-- incentive in Rupees and Paise format using round function
SELECT FIRST_NAME, LAST_NAME, SALARY, round(SALARY*0.18) as INCENTIVE_RS, (SALARY*0.18 -  round(SALARY*0.18))*100 as INCENTIVE_PS
FROM  EMPLOYEES;

-- 5. Create the following table SALES with following columns PROD_ID, PROD_TITLE, PROD_SUMMARY, PROD_TYPE,UNIT_PRICE.
-- Choose appropriate data types. PROD_TYPE always contains 2 character data
CREATE TABLE SALES(
     PROD_ID CHAR(15),
     PROD_TITLE VARCHAR2(10),
     PROD_SUMMARY VARCHAR2(20),
     PROD_TYPE CHAR(2),
     UNIT_PRICE NUMBER(4)
);