CREATE TABLE LIN_TABLE (
    M_ID VARCHAR2(4),
    M_NAME VARCHAR2(20),
    DEPT_ID CHAR(4),
    START_DATE DATE,
    END_DATE DATE,
    Salary NUMBER(6)
);

INSERT INTO LIN_TABLE (M_ID,M_NAME,DEPT_ID,START_DATE,END_DATE,Salary)
    SELECT 'M001','Richa','D001','27-Jan-07','27-Feb-07',150000 FROM DUAL
UNION ALL SELECT 'M002','Nitin','D002','16-Feb-07','16-May-07',40000 FROM DUAL
UNION ALL SELECT 'M003','AJIT','D003','8-Mar-07','8-Sep-07',70000 FROM DUAL
UNION ALL SELECT 'M004','SHARVARI','D004','28-Mar-07','28-Mar-08',120000 FROM DUAL
UNION ALL SELECT 'M005','ADITYA','D002','27-Apr-07','27-Jul-07',40000 FROM DUAL
UNION ALL SELECT 'M006','Rohan','D004','12-Apr-07','12-Apr-08',130000 FROM DUAL
UNION ALL SELECT 'M007','Usha','D003','17-Apr-07','17-Oct-07',70000 FROM DUAL
UNION ALL SELECT 'M008','Anjali','D002','2-Apr-07','2-Jul-07',40000 FROM DUAL
UNION ALL SELECT 'M009','Yash','D006','11-Apr-07','11-Jul-07',85000 FROM DUAL
UNION ALL SELECT 'M010','Nalini','D007','15-Apr-07','15-Oct-07',9999 FROM DUAL;


-- Q28. How to display the records which are belongs to Department D003 and D006.
SELECT *
FROM LIN_TABLE
WHERE DEPT_ID='D003' OR DEPT_ID='D006';

-- Q29. Sort the data according to descending order of the Name
SELECT *
FROM LIN_TABLE
ORDER BY M_NAME DESC;

-- Q30. How to display the records of only department ID D002 along with Heading line.
SELECT *
FROM LIN_TABLE
WHERE DEPT_ID='D002';

-- Q31. Display the records who were joined on the Mar-07
SELECT *
FROM LIN_TABLE
WHERE extract(month from START_DATE)=3
UNION
SELECT * FROM LIN_TABLE
WHERE START_DATE >= DATE '2007-03-01'
AND START_DATE < DATE '2007-04-01';

-- Q32. Display the records who joined on Mar-07 and Left the organisation on Mar-08.
SELECT *
FROM LIN_TABLE
WHERE extract(month from START_DATE)=3 AND extract(month from END_DATE)=3;

SELECT *
FROM LIN_TABLE
WHERE TO_CHAR(START_DATE) LIKE '%MAR-07%' and TO_CHAR(END_DATE) LIKE '%MAR-08%';

-- Q33. Display the records according to the descending order of their salary.
SELECT *
FROM LIN_TABLE
ORDER BY SALARY DESC;

-- Q34. Display the count of Dept D004 records
SELECT DEPT_ID,COUNT(*) AS EMP_COUNT
FROM LIN_TABLE
WHERE DEPT_ID='D004'
GROUP BY DEPT_ID
ORDER BY DEPT_ID;

-- Q35. Display the Average salary of Department D003.
SELECT DEPT_ID, AVG(SALARY)
FROM LIN_TABLE
WHERE DEPT_ID='D003'
GROUP BY DEPT_ID;

-- Q36. Display the Total salary of Department D003 and Total salary of Department D004 using one command line.
SELECT DEPT_ID, AVG(SALARY)
FROM LIN_TABLE
WHERE DEPT_ID='D003' OR DEPT_ID='D004'
GROUP BY DEPT_ID
ORDER BY DEPT_ID;

-- Q37. Display the records from line number 4 to 8.
SELECT *
FROM LIN_TABLE
WHERE ROWNUM BETWEEN 4 AND 8;

-- Q38. Write command to collect all the department Ids and display all the departments as D001,D002,D003,D004,D006,D007
SELECT DISTINCT DEPT_ID
FROM LIN_TABLE
ORDER BY DEPT_ID;

-- Q39. Write shell script for find the count of rows department wise.
SELECT DEPT_ID,COUNT(*) AS EMP_COUNT
FROM LIN_TABLE
GROUP BY DEPT_ID
ORDER BY DEPT_ID;