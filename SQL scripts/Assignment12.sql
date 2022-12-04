-- 1. Write a query to display list of departments which are having employees whose salaries are in the range 5000 to 10000.

ORDER BY DEPARTMENT_ID;

-- DEPARTMENT_ID

-- 20

-- 40

-- 50

-- 60

-- 70

-- 80

-- 100

-- 110

-- 2. Write a query to display list of departments which are having employees in the range 5 to 20

SELECT DEPARTMENT_ID, COUNT(*) AS EMP_COUNT

FROM EMPLOYEES

GROUP BY DEPARTMENT_ID

HAVING COUNT(*) BETWEEN 5 AND 20;

-- DEPARTMENT_ID,EMP_COUNT

-- 30,6

-- 60,5

-- 100,6

-- 3. Write a query to display list of departments which are having maximum salary below 10000.

SELECT DEPARTMENT_ID, MAX(SALARY) AS MAX_SAL

FROM EMPLOYEES

WHERE DEPARTMENT_ID IS NOT NULL

GROUP BY DEPARTMENT_ID

HAVING MAX(SALARY) < 10000

ORDER BY DEPARTMENT_ID;

-- DEPARTMENT_ID,MAX_SAL

-- 10,4400

-- 40,6500

-- 50,8200

-- 60,9000

-- 4. Write a query to display list of departments which are having employ salary more than 8000 and average salary more than 1000

SELECT DEPARTMENT_ID

FROM EMPLOYEES

WHERE DEPARTMENT_ID IS NOT NULL

GROUP BY DEPARTMENT_ID

HAVING AVG(SALARY) >10000

INTERSECT

SELECT DEPARTMENT_ID

FROM EMPLOYEES

WHERE DEPARTMENT_ID IS NOT NULL AND SALARY >8000

ORDER BY DEPARTMENT_ID;

-- DEPARTMENT_ID

-- 90

-- 110
