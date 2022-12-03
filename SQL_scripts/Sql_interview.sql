--1.Write query to display 4-6 row in TABLE
select * from(
select rownum,e.* from EMPLOYEES e where rownum<=6 
minus 
select rownum,e1.* from EMPLOYEES e1 where rownum<2);

--2.Query to find duplicate rows in table?
SELECT MIN(SALARY)
FROM(
        SELECT DISTINCT SALARY
        FROM EMPLOYEES
        ORDER BY SALARY DESC
    )
WHERE ROWNUM<=2;

-- MIN(SALARY)
-- 17000

--5.What is the Query to fetch last record from the table?
SELECT *
FROM EMPLOYEES
WHERE ROWID= (
        SELECT MAX(ROWID)
        FROM EMPLOYEES
    );

--7.What is Query to display last 5 Records from Employee table?
SELECT *
FROM (
        SELECT *
        FROM EMPLOYEES E
        ORDER BY ROWID DESC
    )
WHERE ROWNUM <=5;
select distinct salary from employees order by salary;

--9.How to get 3 Highest salaries records from Employee table
SELECT *
FROM EMPLOYEES A
WHERE 2 = (
        SELECT COUNT( distinct salary)
        FROM EMPLOYEES B
        WHERE A.salary >=B.salary
    );

--10.How to Display Odd rows in Employee table?(
SELECT *
FROM (
        SELECT ROWNUM AS SRNO, E.*
        FROM EMPLOYEES E
    )
WHERE MOD(SRNO, 2)=1;

--13.How Can i create table with same structure of bank table
CREATE TABLE BANK2 AS
    SELECT *
    FROM BANK
    WHERE 1=2;

SELECT *
FROM BANK2;

--no rows selected


SELECT *
FROM EMPLOYEES E
WHERE NOT EXISTS (
        SELECT 'department_id'
        FROM DEPARTMENTS D
        WHERE E.DEPARTMENT_ID=D.DEPARTMENT_ID
    );

SELECT FIRST_NAME, LAST_NAME, SALARY, (
    SELECT ROUND(AVG(SALARY), 2)
    FROM EMPLOYEES SUBQ
    WHERE MAINQ.DEPARTMENT_ID=SUBQ.DEPARTMENT_ID) AS DEP_AVG
    FROM EMPLOYEES MAINQ;

SELECT LAST_NAME, SALARY, DEPARTMENT_ID, COUNT(EMPLOYEE_ID) OVER(
    PARTITION BY DEPARTMENT_ID
ORDER BY EMPLOYEE_ID) AS COUNT_PER_DEP
FROM EMPLOYEES;

SELECT FIRST_NAME
FROM EMPLOYEES
WHERE FIRST_NAME BETWEEN 'A' AND 'L';

--Display the dept information from department table.
SELECT *
FROM DEPT;

/*
Display the details of all employees.
*/
SELECT *
FROM EMP;

/*
Display the name and job for all employees.
*/
SELECT ENAME, JOB
FROM EMP;

/*
Display name and salary for all employees.
*/
SELECT ENAME, SAL
FROM EMP;

/*
Display employee number and total salary for each employee.
*/
SELECT EMPNO, SAL+COMM
FROM EMP;

/*
Display employee name and annual salary for all employees.
*/
SELECT EMPNO, ENAME, 12*SAL+NVL(COMM, 0) ANNUALSAL
FROM EMP;

/*
Display the names of all employees who are working in department number 10.
*/
SELECT ENAME
FROM EMP
WHERE DEPTNO=10;

/*
Display the names of all employees working as clerks and drawing a salary more than 3000.
*/
SELECT ENAME
FROM EMP
WHERE JOB='CLERK' AND SAL>3000;

/*
Display employee number and names for employees who earn commission.
*/
SELECT EMPNO, ENAME
FROM EMP
WHERE COMM IS NOT NULL AND COMM>0;

/*
Display names of employees who do not earn any commission.
*/
SELECT EMPNO, ENAME
FROM EMP
WHERE COMM IS NULL AND COMM=0;

/*
Display the names of employees who are working as clerk, salesman or analyst and drawing a salary more than 3000.
*/
SELECT ENAME
FROM EMP
WHERE (JOB='CLERK' OR JOB='SALESMAN' OR JOB='ANALYST') AND SAL>3000;

--(OR) */
SELECT ENAME
FROM EMP
WHERE JOB IN('CLERK', 'SALESMAN', 'ANALYST') AND SAL>3000;

/*
Display the names of employees who are working in the company for the past 5 years.
*/
SELECT ENAME
FROM EMP
WHERE SYSDATE-HIREDATE>5*365;

/*
Display the list of employees who have joined the company before 30th June 90 or after 31st dec 90.
*/
SELECT *
FROM EMP
WHERE HIREDATE BETWEEN '30-JUN-1990' AND '31-DEC-1990';

/*
Display current date.
*/
SELECT SYSDATE
FROM DUAL;

/*
Display the list of users in your database (using log table).
*/
SELECT *
FROM DBA_USERS;

/*
Display the names of all tables from the current user.
*/
SELECT *
FROM TAB;

-- DISPLAY THE NAME OF THE CURRENT USER.

SHOW USER;

/*
Display the names of employees working in department number 10 or 20 or 40 or employees working as clerks, salesman or analyst.
*/
SELECT ENAME
FROM EMP
WHERE DEPTNO IN (10, 20, 40) OR JOB IN ('CLERK', 'SALESMAN', 'ANALYST');

/*
Display the names of employees whose name starts with alphabet S.
*/
SELECT ENAME
FROM EMP
WHERE ENAME LIKE 'S%';

/*
Display employee names for employees whose name ends with alphabet.
*/
SELECT ENAME
FROM EMP
WHERE ENAME LIKE '%S';

/*
Display the names of employees whose names have second alphabet A in their names.
*/
SELECT ENAME
FROM EMP
WHERE ENAME LIKE '_S%';

/*
Display the names of employees whose name is exactly five characters in length.
*/
SELECT ENAME
FROM EMP
WHERE LENGTH(ENAME)=5;

-- --(OR)
SELECT ENAME
FROM EMP
WHERE ENAME LIKE '_____';

/*
Display the names of employees who are not working as managers.
*/
SELECT *
FROM EMP MINUS (
        SELECT *
        FROM EMP
        WHERE EMPNO IN (
                SELECT MGR
                FROM EMP
            )
    );

--(OR) */
SELECT *
FROM EMP
WHERE EMPNO NOT IN (
        SELECT MGR
        FROM EMP
        WHERE MGR IS NOT NULL
    );

--(OR) */
SELECT *
FROM EMP E
WHERE EMPNO NOT IN (
        SELECT MGR
        FROM EMP
        WHERE E.EMPNO=MGR
    );
    
    -- DISPLAY THE NAMES OF EMPLOYEES WHO ARE NOT WORKING AS SALESMAN OR CLERK OR ANALYST. 
    SELECT ENAME
    FROM EMP
    WHERE JOB NOT IN ('CLERK', 'SALESMAN', 'ANALYST');

/*
Display all rows from EMP table.  The system should wait after every screen full of information.
set pause on;
/*
Display the total number of employees working in the company.
*/
SELECT COUNT(*)
FROM EMP;

/*
Display the total salary being paid to all employees.
*/
SELECT SUM(SAL)+SUM(NVL(COMM, 0))
FROM EMP;

/*
Display the maximum salary from emp table.
*/
SELECT MAX(SAL)
FROM EMP;

/*
Display the minimum salary from emp table.
*/
SELECT MIN(SAL)
FROM EMP;

/*

Display the average salary from emp table.
*/
SELECT AVG(SAL)
FROM EMP;

/*
Display the maximum salary being paid to CLERK.
*/
SELECT MAX(SAL)
FROM EMP
WHERE JOB='CLERK';

/*
Display the maximum salary being paid in dept no 20.
*/
SELECT MAX(SAL)
FROM EMP
WHERE DEPTNO=20;
select avg(sal) from emp;
/*
Display the min Sal being paid to any SALESMAN.
*/
SELECT MIN(SAL)
FROM EMP
WHERE JOB='SALESMAN';

/*
Display the average salary drawn by managers.
*/
SELECT AVG(SAL)
FROM EMP
WHERE JOB='MANAGER';

/*
Display the total salary drawn by analyst working in dept no 40.
*/
SELECT SUM(SAL)+SUM(NVL(COMM, 0))
FROM EMP
WHERE DEPTNO=40;

/*
Display the names of employees in order of salary i.e. the name of the employee earning lowest salary should appear first.
*/
SELECT ENAME
FROM EMP
ORDER BY SAL;

/*
Display the names of employees in descending order of salary.
*/
SELECT ENAME
FROM EMP
ORDER BY SAL DESC;

/*
Display the details from emp table in order of emp name.
*/
SELECT ENAME
FROM EMP
ORDER BY ENAME;

/*
Display empno, ename, deptno, and sal.  Sort the output first based on name and within name by deptno and within deptno by Sal;
*/
SELECT *
FROM EMP
ORDER BY ENAME, DEPTNO, SAL;

/*
Display the name of the employee along with their annual salary (Sal * 12).  The name of the employee earning highest annual salary should appear first.
*/
SELECT ENAME, 12*(SAL+NVL(COMM, 0)) ANNUAL
FROM EMP
ORDER BY 12*(SAL+NVL(COMM, 0)) DESC;

/*
Display name, Sal, hra, pf, da, total Sal for each employee. The output should be in the order of total Sal, hra 15% of Sal, da 10% of sal, pf 5% of sal total salary will be (sal*hra*da)-pf.
*/
SELECT ENAME, SAL, SAL*15/100 HRA, SAL*5/100 PF, SAL*10/100 DA, SAL+SAL*15/100-SAL*5/100+SAL*10/100 TOTAL_SALARY
FROM EMP;

-- DISPLAY DEPT NUMBERS AND TOTAL NUMBER OF EMPLOYEES WITHIN EACH GROUP. 
    SELECT DEPTNO, COUNT(*)
    FROM EMP
    GROUP BY DEPTNO;

/*
Display the various jobs and total number of employees with each job group.
*/
SELECT JOB, COUNT(*)
FROM EMP
GROUP BY JOB;

/*
Display department numbers and total salary for each department.
*/
SELECT DEPTNO, SUM(SAL)
FROM EMP
GROUP BY DEPTNO;

/*
Display department numbers and maximum salary for each department.
*/
SELECT DEPTNO, MAX(SAL), MIN(SAL)
FROM EMP
GROUP BY DEPTNO;

/*

Display the various jobs and total salary for each job.
*/
SELECT JOB, SUM(SAL)
FROM EMP
GROUP BY JOB;

/*

Display each job along with minimum sal being paid in each job group.
*/
SELECT JOB, MIN(SAL)
FROM EMP
GROUP BY JOB;

/*
Display the department numbers with more than three employees in each dept.
*/
SELECT DEPTNO, COUNT(*)
FROM EMP
GROUP BY DEPTNO
HAVING COUNT(*)>3;

/*
Display the various jobs along with total sal for each of the jobs where total sal is greater than 40000.
*/
SELECT JOB, SUM(SAL)
FROM EMP
GROUP BY JOB
HAVING SUM(SAL)>40000;

/*
Display the various jobs along with total number of employees in each job. The output should contain only those jobs with more than three employees.
*/
SELECT JOB, COUNT(*)
FROM EMP
GROUP BY JOB
HAVING COUNT(*)>3;

/*
Display the name of emp who earns highest sal.
*/
SELECT ENAME
FROM EMP
WHERE SAL=(
        SELECT MAX(SAL)
        FROM EMP
    );

/*
Display the employee number and name of employee working as CLERK and earning highest salary among CLERKS.
*/
SELECT EMPNO, ENAME
FROM EMP
WHERE JOB='CLERK' AND SAL=(
        SELECT MAX(SAL)
        FROM EMP
        WHERE JOB='CLERK'
    );

/*
Display the names of the salesman who earns a salary more than the highest salary of any clerk.
*/
SELECT ENAME
FROM EMP
WHERE JOB='SALESMAN' AND SAL > (
        SELECT MAX(SAL)
        FROM EMP
        WHERE JOB='CLERK'
    );

/*
Display the names of clerks who earn salary more than that of James of that of sal lesser than that of Scott.
*/
SELECT ENAME
FROM EMP
WHERE JOB='CLERK' AND SAL<(
        SELECT SAL
        FROM EMP
        WHERE ENAME='SCOTT'
    ) AND SAL>(
        SELECT SAL
        FROM EMP
        WHERE ENAME='JAMES'
    );

/*
Display the names of employees who earn a Sal more than that of James or that of salary greater than that of Scott.
*/
SELECT ENAME
FROM EMP
WHERE SAL < (
        SELECT SAL
        FROM EMP
        WHERE ENAME='SCOTT'
    ) AND SAL > (
        SELECT SAL
        FROM EMP
        WHERE ENAME='JAMES'
    );

/*
Display the names of the employees who earn highest salary in their respective departments.
*/
SELECT *
FROM EMP E
WHERE SAL = (
        SELECT MAX(SAL)
        FROM EMP
        WHERE DEPTNO=E.DEPTNO
    ) ;
    
    
--DISPLAY THE NAMES OF EMPLOYEES WHO EARN HIGHEST SALARIES IN THEIR RESPECTIVE JOB GROUPS. */
SELECT *
FROM EMP E
WHERE SAL IN (
        SELECT MAX(SAL)
        FROM EMP
        GROUP BY JOB
        HAVING E.JOB=JOB
    ) ;
    
    
--DISPLAY THE EMPLOYEE NAMES WHO ARE WORKING IN ACCOUNTINGS DEPT. */
SELECT ENAME
FROM EMP
WHERE DEPTNO = (
        SELECT DEPTNO
        FROM DEPT
        WHERE DNAME='ACCOUNTING'
    );

--(OR) */
SELECT ENAME
FROM EMP
WHERE DEPTNO IN (
        SELECT DEPTNO
        FROM DEPT
        WHERE DNAME='ACCOUNTING'
    );

/*
Display the employee names who are working in Chicago.
*/
SELECT ENAME
FROM EMP
WHERE DEPTNO = (
        SELECT DEPTNO
        FROM DEPT
        WHERE LOC='CHICAGO'
    );

/*
Display the job groups having total salary greater then the maximum salary for managers.
*/
SELECT JOB, SUM(SAL)
FROM EMP
GROUP BY JOB
HAVING SUM(SAL) > (
        SELECT MAX(SAL)
        FROM EMP
        WHERE JOB='MANAGER'
    );

/*
Display the names of employees from department number 10 with salary greater than that of any employee working in other departments.
*/
SELECT ENAME, SAL, DEPTNO
FROM EMP E
WHERE DEPTNO=10 AND SAL > ANY(
        SELECT SAL
        FROM EMP
        WHERE E.DEPTNO!=DEPTNO
    );

/*
Display the names of employee from department number 10 with salary greater then that of all employee working in other departments.
*/
SELECT ENAME, SAL, DEPTNO
FROM EMP E
WHERE DEPTNO=10 AND SAL > ANY(
        SELECT SAL
        FROM EMP
        WHERE E.DEPTNO != DEPTNO
    );

/*
Display the names of employees in Upper case.
*/
SELECT UPPER(ENAME)
FROM EMP;

/*
Display the names of employees in lower case.
*/
SELECT LOWER(ENAME)
FROM EMP;

/*
Display the name of employees in proper case.
*/
SELECT INITCAP(ENAME)
FROM EMP;

/*
Find out the length of your name using appropriate function.
*/
SELECT LENGTH('INDIA')
FROM DUAL;

/*
Display the length of all employees' names.
*/
SELECT SUM(LENGTH(ENAME))
FROM EMP;

/*
Display the name of the employee concatenate with EMP no.
*/
SELECT ENAME||EMPNO
FROM EMP;

--(OR) */
SELECT CONCAT(ENAME, EMPNO)
FROM EMP;

/*
Use appropriate function and extract 3 characters starting from 2 characters from the following string 'Oracle' i.e. the output should be 'rac'.
*/
SELECT SUBSTR('ORACLE', 2, 3)
FROM DUAL;

/*
Find the first occurrence of character a from the following string 'computer maintenance corporation'.
*/
SELECT INSTR('COMPUTER MAINTENANCE CORPORATION', 'A', 1, 1)
FROM DUAL;

/*
Replace every occurrence of alphabet A with B in the string Allen's (use translate function).
*/
SELECT REPLACE('Allens', 'A', 'b')
FROM DUAL;

/*
Display the information from EMP table. Wherever job 'manager' is found it should be displayed as boss(replace function).
*/
SELECT EMPNO, ENAME, REPLACE(JOB, 'MANAGER', 'Boss') JOB
FROM EMP;

/*
Display empno, ename, deptno from EMP table. Instead of display department numbers display the related department name (use decode function).
*/
SELECT E.EMPNO, E.ENAME, D.DNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO;

/*
Display your age in days.
*/
SELECT ROUND(SYSDATE-TO_DATE('15-oct-1993'))
FROM DUAL;

/*
Display your age in months.
*/
SELECT FLOOR(MONTHS_BETWEEN(SYSDATE, '15-oct-1993')) "age in months"
FROM DUAL;

/*
Display current date as 15th august Friday nineteen forty seven.
*/
SELECT TO_CHAR(SYSDATE, 'ddth month day yyyy')
FROM DUAL;

/*
Display the following output for each row from EMP table as 'scott has joined the company on Wednesday 13th august nineteen ninety'.
*/
SELECT ENAME||' has joined the company on '||TO_CHAR(HIREDATE, 'day ddth month yyyy')
FROM EMP;

/*
Find the date of nearest Saturday after current day.
*/
SELECT NEXT_DAY(SYSDATE, 'sat')
FROM DUAL;

/*
Display current time.
*/
SELECT TO_CHAR(SYSDATE, 'hh:mi:ss') TIME
FROM DUAL;

/*
Display the date three months before the current date.
*/
SELECT ADD_MONTHS(SYSDATE, -3)
FROM DUAL;

/*
Display the common jobs from department number 10 and 20.
*/
SELECT JOB
FROM EMP
WHERE DEPTNO=10 AND JOB IN(
        SELECT JOB
        FROM EMP
        WHERE DEPTNO=20
    );

--(OR) */
SELECT JOB
FROM EMP
WHERE DEPTNO=10 intersect
    SELECT JOB
    FROM EMP
    WHERE DEPTNO=20;


/*
Display the jobs which are unique to dept no 10.
*/
SELECT JOB
FROM EMP
WHERE DEPTNO=10 MINUS (
    SELECT JOB
    FROM EMP
    WHERE DEPTNO!=10);

--(OR) */
SELECT JOB
FROM EMP
WHERE DEPTNO = 10 AND JOB NOT IN (
        SELECT JOB
        FROM EMP
        WHERE DEPTNO<>10
    );

/*

Display the details of those who do not have any person working under them.
*/
SELECT EMPNO
FROM EMP
WHERE EMPNO NOT IN (
        SELECT MGR
        FROM EMP
        WHERE MGR IS NOT NULL
    );

/*
Display the details of employees who are in sales dept and grade is 3.
*/
SELECT *
FROM EMP
WHERE SAL>=(
        SELECT LOSAL
        FROM SALGRADE
        WHERE GRADE=3
    ) AND SAL<=(
        SELECT HISAL
        FROM SALGRADE
        WHERE GRADE=3
    ) AND DEPTNO=(
        SELECT DEPTNO
        FROM DEPT
        WHERE DNAME='SALES'
    );

/*
Display those who are not managers and who are managers any one.
*/
SELECT *
FROM EMP
WHERE EMPNO IN(
        SELECT MGR
        FROM EMP
    ) union
    SELECT *
    FROM EMP
    WHERE EMPNO NOT IN(
            SELECT MGR
            FROM EMP
            WHERE MGR IS NOT NULL
        );

/*
Display those employees whose name contains not less than 4 chars.
*/
SELECT *
FROM EMP
WHERE LENGTH(ENAME)>4;

/*
Display those departments whose name start with 'S' while location name end with 'O'.
*/
SELECT *
FROM DEPT
WHERE DNAME LIKE 'S%' AND LOC LIKE '%O';

/*
Display those employees whose manager name is JONES.
*/
SELECT *
FROM EMP
WHERE MGR=(
        SELECT EMPNO
        FROM EMP
        WHERE ENAME='JONES'
    );

/*
Display those employees whose salary is more than 3000 after giving 20% increment.
*/
SELECT *
FROM EMP
WHERE SAL*120/100 > 3000;

--(OR) */
SELECT *
FROM EMP
WHERE SAL+SAL*20/100 > 3000;

/*
Display all employees with there dept name.
*/
SELECT ENAME, DNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO;

/*
Display ename who are working in sales dept.
*/
SELECT EMPNO, ENAME
FROM EMP
WHERE DEPTNO=(
        SELECT DEPTNO
        FROM DEPT
        WHERE DNAME='SALES'
    );

/*
Display employee name, deptname, salary and comm. for those Sal in between 2000 to 5000 while location is Chicago.
*/
SELECT EMPNO, ENAME, DEPTNO
FROM EMP
WHERE DEPTNO=(
        SELECT DEPTNO
        FROM DEPT
        WHERE LOC='CHICAGO'
    ) AND SAL BETWEEN 2000 AND 5000;

/*
Display those employees whose salary greater than his manager salary.
*/
SELECT *
FROM EMP E
WHERE SAL>(
        SELECT SAL
        FROM EMP
        WHERE EMPNO=E.MGR
    );

/*
Display those employees who are working in the same dept where his manager is working.
*/
SELECT *
FROM EMP E
WHERE DEPTNO = (
        SELECT DEPTNO
        FROM EMP
        WHERE EMPNO=E.MGR
    );

/*
Display those employees who are not working under any manger.
*/
SELECT *
FROM EMP
WHERE MGR IS NULL OR EMPNO=MGR;

/*
Display grade and employees name for the dept no 10 or 30 but grade is not 4, while joined the company before 31-dec-82.
*/
SELECT EMPNO, ENAME, SAL, DEPTNO, HIREDATE, GRADE
FROM EMP E, SALGRADE S
WHERE E.SAL>=S.LOSAL AND E.SAL<=S.HISAL AND DEPTNO IN(10, 30) AND GRADE<>4 AND HIREDATE<'01-dec-1981';

/*
Update the salary of each employee by 10% increments that are not eligible for commission.
update emp set sal=sal+(sal*10/100) where comm is null;
/*
Delete those employees who joined the company before 31-dec-82 while there dept location is 'NEW YORK' or 'CHICAGO'.
delete from emp where hiredate<'31-dec-1982' and deptno in
(
SELECT DEPTNO
FROM DEPT
WHERE LOC IN('NEW YORK', 'CHICAGO'));

/*
Display employee name, job, deptname, location for all who are working as managers.
*/
SELECT ENAME, JOB, DNAME, LOC
FROM EMP E, DEPT D
WHERE E.DEPTNO=D.DEPTNO AND EMPNO IN (
        SELECT MGR
        FROM EMP
    );

/*
Display those employees whose manager names is Jones, and also display there manager name.
*/
SELECT E.EMPNO, E.ENAME, M.ENAME MANAGER
FROM EMP E, EMP M
WHERE E.MGR=M.EMPNO AND M.ENAME='JONES';

/*
Display name and salary of ford if his Sal is equal to high Sal of his grade.
*/
SELECT ENAME, SAL
FROM EMP E
WHERE ENAME='FORD' AND SAL=(
        SELECT HISAL
        FROM SALGRADE
        WHERE GRADE=(
                SELECT GRADE
                FROM SALGRADE
                WHERE E.SAL>=LOSAL AND E.SAL<=HISAL
            )
    );

/*
Display employee name, his job, his dept name, his manager name, his grade and make out of an under department wise.
break on deptno; 
*/
SELECT D.DEPTNO, E.ENAME, E.JOB, D.DNAME, M.ENAME, S.GRADE
FROM EMP E, EMP M, DEPT D, SALGRADE S
WHERE E.DEPTNO=D.DEPTNO AND E.SAL BETWEEN S.LOSAL AND S.HISAL AND E.MGR=M.EMPNO
ORDER BY E.DEPTNO;

/*
List out all the employees name, job, and salary grade and department name for every one in the company except 'CLERK'. Sort on salary display the highest salary.
*/
SELECT EMPNO, ENAME, SAL, DNAME, GRADE
FROM EMP E, DEPT D, SALGRADE S
WHERE E.DEPTNO=D.DEPTNO AND E.SAL BETWEEN S.LOSAL AND S.HISAL AND E.JOB<>'CLERK'
ORDER BY SAL;

DISPLAY EMPLOYEE NAME, HIS JOB AND HIS MANAGER. DISPLAY ALSO EMPLOYEES WHO ARE WITHOUT MANAGER.

*
/

SELECT E.ENAME, E.JOB, M.ENAME MANAGER
FROM EMP E, EMP M
WHERE E.MGR=M.EMPNO union
    SELECT ENAME, JOB, 'no manager'
    FROM EMP
    WHERE MGR IS NULL;

/*
Find out the top 5 earner of company.
*/
SELECT *
FROM EMP E
WHERE 5>(
        SELECT COUNT(*)
        FROM EMP
        WHERE SAL>E.SAL
    )
ORDER BY SAL DESC;

/*


Display the name of those employees who are getting highest salary.
*/
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL=(
        SELECT MAX(SAL)
        FROM EMP
    );

/*
Display those employees whose salary is equal to average of maximum and minimum.
*/
SELECT *
FROM EMP
WHERE SAL=(
        SELECT (MAX(SAL)+MIN(SAL))/2
        FROM EMP
    );

/*
Display count of employees in each department where count greater than 3.
*/
SELECT DEPTNO, COUNT(*)
FROM EMP
GROUP BY DEPTNO
HAVING COUNT(*)>3;

/*
Display dname where at least 3 are working and display only dname.
*/
SELECT DNAME
FROM DEPT
WHERE DEPTNO IN (
        SELECT DEPTNO
        FROM EMP
        GROUP BY DEPTNO
        HAVING COUNT(*)>3
    );

/*
Display name of those managers name whose salary is more than average salary of company.
*/
SELECT ENAME, SAL
FROM EMP
WHERE EMPNO IN(
        SELECT MGR
        FROM EMP
    ) AND SAL > (
        SELECT AVG(SAL)
        FROM EMP
    );

/*
Display those managers name whose salary is more than an average salary of his employees.
*/
SELECT ENAME, SAL
FROM EMP E
WHERE EMPNO IN(
        SELECT MGR
        FROM EMP
    ) AND E.SAL>(
        SELECT AVG(SAL)
        FROM EMP
        WHERE MGR=E.EMPNO
    );

/*
Display employee name, Sal, comm and net pay for those employees whose net pay are greater than or equal to any other employee salary of the company?
*/
SELECT ENAME, SAL, COMM, SAL+NVL(COMM, 0) NETPAY
FROM EMP
WHERE SAL+NVL(COMM., 0)>=ANY(
        SELECT SAL
        FROM EMP
    );

/*
Display those employees whose salary is less than his manager but more than salary of any other managers.
*/
SELECT *
FROM EMP E
WHERE SAL<(
        SELECT SAL
        FROM EMP
        WHERE EMPNO = E.MGR
    ) AND SAL>ANY(
        SELECT SAL
        FROM EMP
        WHERE EMPNO!=E.MGR
    );

/*
Display all employees names with total Sal of company with employee name.
*/
SELECT ENAME, FIND OUT THE LAST 5(LEAST) EARNER OF THE COMPANY? */
    SELECT *
    FROM EMP E
    WHERE 5>(
            SELECT COUNT(*)
            FROM EMP
            WHERE SAL<E.SAL
        )
    ORDER BY SAL;

/*
Find out the number of employees whose salary is greater than their manager salary?
*/
SELECT COUNT(*)
FROM EMP E
WHERE SAL>(
        SELECT SAL
        FROM EMP
        WHERE EMPNO=E.MGR
    );

/*
Display those manager who are not working under president but they are working under any other manager?
*/
SELECT *
FROM EMP E
WHERE MGR IN(
        SELECT EMPNO
        FROM EMP
        WHERE ENAME<>'KING'
    );

/*


Delete those department where no employee working?
delete from dept d where 0=(
SELECT COUNT(*)
FROM EMP
WHERE DEPTNO=D.DEPTNO);

/*
Delete those records from EMP table whose deptno not available in dept table?
delete from emp where deptno not in(
SELECT DEPTNO
FROM DEPT);

/*
Display those earners whose salary is out of the grade available in Sal grade table?
*/
SELECT *
FROM EMP
WHERE SAL<(
        SELECT MIN(LOSAL)
        FROM SALGRADE
    ) OR SAL>(
        SELECT MAX(HISAL)
        FROM SALGRADE
    );

/*
Display employee name, Sal, comm. and whose net pay is greater than any other in the company?
*/
SELECT ENAME, SAL, COMM
FROM EMP
WHERE SAL+SAL*15/100-SAL*5/100 +SAL*10/100 = (
        SELECT MAX(SAL+SAL*15/100-SAL*5/100+SAL*10/100)
        FROM EMP
    );

/*
Display name of those employees who are going to retire 31-dec-99. If the maximum job is period is 18 years?
*/
SELECT *
FROM EMP
WHERE (TO_DATE('31-dec-1999')-HIREDATE)/365>18;

/*
Display those employees whose salary is ODD value?
*/
SELECT *
FROM EMP
WHERE MOD(SAL, 2)=1;

/*
Display those employees whose salary contains at least 4 digits?
*/
SELECT *
FROM EMP
WHERE LENGTH(SAL)>=4;

/*
Display those employees who joined in the company in the month of DEC?
*/
SELECT *
FROM EMP
WHERE UPPER(TO_CHAR(HIREDATE, 'mon'))='DEC';


/*
Display those employees whose name contains “A”?
*/
SELECT *
FROM EMP
WHERE INSTR(ENAME, 'A', 1, 1)>0;


/*
Display those employees whose deptno is available in salary?
*/
SELECT *
FROM EMP
WHERE INSTR(SAL, DEPTNO, 1, 1)>0;

/*
Display those employees whose first 2 characters from hire date-last 2 characters of salary?
*/
SELECT SUBSTR(HIREDATE, 0, 2)||substr(sal,length(sal)-1,2),HIREDATE,sal
FROM EMP;

*
/

SELECT CONCAT( SUBSTR(HIREDATE, 0, 2), SUBSTR(SAL, LENGTH(SAL)-1, 2) )
FROM EMP;

/*
Display those employees whose 10% of salary is equal to the year of joining?
*/
SELECT *
FROM EMP
WHERE TO_CHAR(HIREDATE, 'yy')=SAL*10/100;

/*
Display those employees who are working in sales or research?
*/
SELECT *
FROM EMP
WHERE DEPTNO IN(
        SELECT DEPTNO
        FROM DEPT
        WHERE DNAME IN('SALES', 'RESEARCH')
    );

/*
Display the grade of Jones?
*/
SELECT GRADE
FROM SALGRADE
WHERE LOSAL<=(
        SELECT(SAL)
        FROM EMP
        WHERE ENAME='JONES'
    ) AND HISAL>=(
        SELECT(SAL)
        FROM EMP
        WHERE ENAME='JONES'
    );

/*

Display those employees who joined the company before 15th of the month?
*/
SELECT EMPNO, ENAME
FROM EMP
WHERE HIREDATE<(TO_DATE('15-'
        ||TO_CHAR(HIREDATE, 'mon')
        ||'-'
        ||TO_CHAR(HIREDATE, 'yyyy')));

/*
Delete those records where no of employee in a particular department is less than 3?
delete from emp where deptno in(
SELECT DEPTNO
FROM EMP
GROUP BY DEPTNO
HAVING COUNT(*)<3);

DELETE THOSE EMPLOYEES WHO JOINED THE COMPANY 21 YEARS BACK FROM TODAY? */ 
SELECT * FROM EMP
WHERE
    ROUND((SYSDATE-HIREDATE)/365)>21;

OR

*
/

SELECT *
FROM EMP
WHERE (TO_CHAR (SYSDATE, 'yyyy')-TO_CHAR (HIREDATE, 'yyyy') )>21;

/*
Display the department name the no of characters of which is equal to no of employees in any other department?
*/
SELECT DNAME
FROM DEPT
WHERE LENGTH(DNAME) IN (
        SELECT COUNT(*)
        FROM EMP
        GROUP BY DEPTNO
    );

/*
Display those employees who are working as manager?
*/
SELECT *
FROM EMP
WHERE EMPNO IN(
        SELECT MGR
        FROM EMP
    );

/*
Count the no of employees who are working as manager (use set operation)?
*/
SELECT COUNT(*)
FROM EMP
WHERE EMPNO IN(
        SELECT MGR
        FROM EMP
    );

/*
Display the name of then dept those employees who joined the company on the same date?
*/
SELECT EMPNO, ENAME, HIREDATE, DEPTNO
FROM EMP E
WHERE HIREDATE IN (
        SELECT HIREDATE
        FROM EMP
        WHERE EMPNO<>E.EMPNO
    );

/*
Display those employees whose grade is equal to any number of Sal but not equal to first number of Sal?

Display the manager who is having maximum number of employees working under him?
*/
SELECT MGR
FROM EMP
GROUP BY MGR
HAVING COUNT(*)=(
        SELECT MAX(COUNT(MGR))
        FROM EMP
        GROUP BY MGR
    );

/*
List out employees name and salary increased by 15% and expressed as whole number of dollars?
*/
SELECT EMPNO, ENAME, LPAD(CONCAT('$', ROUND(SAL*115/100)), 7) SALARY
FROM EMP;

/*
Produce the output of the EMP table “EMPLOYEE_AND_JOB” for ename and job?
*/
SELECT *
FROM EMPLOYEE_AND_JOB;

/*
List all employees with hire date in the format 'June 4 1988'?
*/
SELECT TO_CHAR(HIREDATE, 'month dd yyyy')
FROM EMP;

/*
Print a list of employees displaying 'Less Salary' if less than 1500 if exactly 1500 display as 'Exact Salary' and if greater than 1500 display 'More Salary'?
*/
SELECT EMPNO, ENAME, 'Less Salary '||SAL
FROM EMP
WHERE SAL<1500 union
    SELECT EMPNO, ENAME, 'More Salary '||SAL
    FROM EMP
    WHERE SAL>1500 union
        SELECT EMPNO, ENAME, 'Exact Salary '||SAL
        FROM EMP
        WHERE SAL=1500 WRITE QUERY TO CALCULATE THE LENGTH OF EMPLOYEE HAS BEEN WITH THE COMPANY? */
            SELECT ROUND(SYSDATE-HIREDATE)
            FROM EMP;

/*
Given a String of the format 'nn/nn' verify that the first and last 2 characters are numbers. And that the middle characters is 'y' print the expressions 'Yes' if valid 'No' of not valid use the following values to test your solution 

Employees hire on 15th of any month are paid on the last Friday of that month. Those hired after 15th are paid the last Friday of the following month. print a list of employees their hire date and first pay date sort those whose Sal contains first digits of their dept.

Display those mangers who are getting less than his employees Sal.
*/
SELECT EMPNO
FROM EMP E
WHERE SAL<ANY(
        SELECT SAL
        FROM EMP
        WHERE MGR=E.EMPNO
    );

/*
Print the details of all the employees who are sub ordinate to Blake.
*/
SELECT *
FROM EMP
WHERE MGR=(
        SELECT EMPNO
        FROM EMP
        WHERE ENAME='BLAKE'
    );

/*
Display those who working as manager using co related sub query.
*/
SELECT *
FROM EMP
WHERE EMPNO IN(
        SELECT MGR
        FROM EMP
    );

/*
Display those employees whose manger name is Jones and also with his manager name.
*/
SELECT *
FROM EMP
WHERE MGR=(
        SELECT EMPNO
        FROM EMP
        WHERE ENAME='JONES'
    ) union
    SELECT *
    FROM EMP
    WHERE EMPNO=(
            SELECT MGR
            FROM EMP
            WHERE ENAME='JONES'
        );

/*
Define variable representing the expressions used to calculate on employee's total annual renumaration.
define emp_ann_sal=(sal+nvl(comm,0))*12;
/*
Use the variable in a statement which finds all employees who can earn 30,000 a year or more.
*/
SELECT *
FROM EMP
WHERE &EMP_ANN_SAL>30000;

/*
Find out how many mangers are there with out listing them.
*/
SELECT COUNT (*)
FROM EMP
WHERE EMPNO IN (
        SELECT MGR
        FROM EMP
    );

/*
Find out the avg sal and avg total remuneration for each job type remember salesman earn commission.
*/
SELECT JOB, AVG(SAL+NVL(COMM, 0)), SUM(SAL+NVL(COMM, 0))
FROM EMP
GROUP BY JOB;

/*
Check whether all employees number are indeed unique.
*/
SELECT COUNT(EMPNO), COUNT(DISTINCT(EMPNO))
FROM EMP
HAVING COUNT(EMPNO)=(COUNT(DISTINCT(EMPNO)));

/*
List out the lowest paid employees working for each manager, exclude any groups where min sal is less than 1000 sort the output by sal.
*/
SELECT E.ENAME, E.MGR, E.SAL
FROM EMP E
WHERE SAL IN(
        SELECT MIN(SAL)
        FROM EMP
        WHERE MGR=E.MGR
    ) AND E.SAL>1000
ORDER BY SAL;

/*
list ename, job, annual sal, deptno, dname and grade who earn 30000 per year and who are not clerks.
*/
SELECT E.ENAME, E.JOB, (E.SAL+NVL(E.COMM, 0))*12, E.DEPTNO, D.DNAME, S.GRADE
FROM EMP E, SALGRADE S, DEPT D
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL AND E.DEPTNO=D.DEPTNO AND (E.SAL+NVL(COMM, 0))*12> 30000 AND E.JOB <> 'CLERK';

/*
find out the job that was failed in the first half of 1983 and the same job that was failed during the same period on 1984.

find out the all employees who joined the company before their manager.
*/
SELECT *
FROM EMP E
WHERE HIREDATE<(
        SELECT HIREDATE
        FROM EMP
        WHERE EMPNO=E.MGR
    );

/*
list out the all employees by name and number along with their manager's name and number also display 'No Manager' who has no manager.
*/
SELECT E.EMPNO, E.ENAME, M.EMPNO MANAGER, M.ENAME MANAGERNAME
FROM EMP E, EMP M
WHERE E.MGR=M.EMPNO union
    SELECT EMPNO, ENAME, MGR, 'No Manager'
    FROM EMP
    WHERE MGR IS NULL;

/*
find out the employees who earned the highest Sal in each job typed sort in descending Sal order.
*/
SELECT *
FROM EMP E
WHERE SAL =(
        SELECT MAX(SAL)
        FROM EMP
        WHERE JOB=E.JOB
    );

/*
find out the employees who  earned the  min Sal for their job in ascending order.
*/
SELECT *
FROM EMP E
WHERE SAL =(
        SELECT MIN(SAL)
        FROM EMP
        WHERE JOB=E.JOB
    )
ORDER BY SAL;

/*
find out the most recently hired employees in each dept order by hire date
*/
SELECT *
FROM EMP
ORDER BY DEPTNO, HIREDATE DESC;

/*
display ename, sal and deptno for each employee who earn a Sal greater than the avg of their department order by deptno
*/
SELECT ENAME, SAL, DEPTNO
FROM EMP E
WHERE SAL>(
        SELECT AVG(SAL)
        FROM EMP
        WHERE DEPTNO=E.DEPTNO
    )
ORDER BY DEPTNO;

/*
display the department where there are no employees
*/
SELECT DEPTNO, DNAME
FROM DEPT
WHERE DEPTNO NOT IN(
        SELECT DISTINCT(DEPTNO)
        FROM EMP
    );

/*
display the dept no with highest annual remuneration bill as compensation.
*/
SELECT DEPTNO, SUM(SAL)
FROM EMP
GROUP BY DEPTNO
HAVING SUM(SAL) = (
        SELECT MAX(SUM(SAL))
        FROM EMP
        GROUP BY DEPTNO
    );

/*
In which year did most people join the company.  Display the year and number of employees
*/
SELECT COUNT(*), TO_CHAR(HIREDATE, 'yyyy')
FROM EMP
GROUP BY TO_CHAR(HIREDATE, 'yyyy');

/*
display avg sal figure for the dept
*/
SELECT DEPTNO, AVG(SAL)
FROM EMP
GROUP BY DEPTNO;

/*
Write a query of display against the row of the most recently hired employee. display ename hire date and column max date showing.
*/
SELECT EMPNO, HIREDATE
FROM EMP
WHERE HIREDATE=(
        SELECT MAX (HIREDATE)
        FROM EMP
    );

/*
display employees who can earn more than  lowest Sal in dept no 30
*/
SELECT *
FROM EMP
WHERE SAL>(
        SELECT MIN(SAL)
        FROM EMP
        WHERE DEPTNO=30
    );

/*
find employees who can earn more than every employees in dept  no 30
*/
SELECT *
FROM EMP
WHERE SAL>(
        SELECT MAX(SAL)
        FROM EMP
        WHERE DEPTNO=30
    );

*
/

SELECT *
FROM EMP
WHERE SAL>ALL(
        SELECT SAL
        FROM EMP
        WHERE DEPTNO=30
    );
--SELECT DEPT NAME DEPT NO AND SUM OF SAL BREAK     ON DEPTNO     ON DNAME;


SELECT E.DEPTNO, D.DNAME, SAL
FROM EMP E, DEPT D
WHERE E.DEPTNO=D.DEPTNO
ORDER BY E.DEPTNO;

/*
find out avg sal and avg total remainders for each job type

find all dept's which have more than 3 employees
*/
SELECT DEPTNO
FROM EMP
GROUP BY DEPTNO
HAVING COUNT(*)>3;

/*
If the pay day is next Friday after 15th and 30th of every month.  What is the next pay day from their hire date for employee in emp table

If an employee is taken by you today in your organization.  And is a policy in your company to have a review after 9 months the joined date (and of 1st of next month after 9 months)  how many days from today your employee has to wait for a review
Display employee name and his sal whose sal is greater than highest avg of dept no

Display the 10th record of EMP table. (without using rowid)

Display the half of the enames in upper case and remaining lower case
*/
SELECT CONCAT ( UPPER ( SUBSTR ( ENAME, 0, LENGTH (ENAME)/ 2) ), LOWER (SUBSTR (ENAME, LENGTH(ENAME) / 2+1, LENGTH(ENAME) )) )
FROM EMP;

/*
display the 10th record of emp table without using group by and rowed


Delete the 10th record of emp table.


Create a copy of emp table.
*/Create table emp1 as
SELECT *
FROM EMP;


-- SELECT ENAME IF ENAME EXISTS MORE THAN ONCE. 
    SELECT DISTINCT(ENAME)
    FROM EMP E
    WHERE ENAME IN(
            SELECT ENAME
            FROM EMP
            WHERE E.EMPNO<>EMPNO
        );

/*
display all enames in reverse order.
*/
SELECT ENAME
FROM EMP
ORDER BY ENAME DESC;

/*
Display those employee whose joining of month and grade is equal.
*/
SELECT EMPNO, ENAME
FROM EMP E, SALGRADE S
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL AND TO_CHAR(HIREDATE, 'mm')=GRADE;

/*
Display those employee whose joining date is available in dept no
*/
SELECT *
FROM EMP
WHERE TO_CHAR(HIREDATE, 'dd')=DEPTNO;

/*
Display those employees name as follows A ALLEN, B BLAKE
*/
SELECT SUBSTR(ENAME, 1, 1)||' '||ENAME
FROM EMP;

/*
List out the employees ename, sal, PF from emp
*/
SELECT ENAME, SAL, SAL*15/100 PF
FROM EMP;

/*
Display RSPS from emp without using updating, inserting

Create table emp with only one column empno
Create table emp (empno number(5));
/*
Add this column to emp table ename Varchar(20).
alter table emp add ename varchar2(20) not null;
/*
OOPS! I forgot to give the primary key constraint.  Add it now.
alter table emp add constraint emp_empno primary key (empno);
/*
Now increase the length of ename column to 30 characters.
alter table emp modify ename varchar2(30);
/*
Add salary column to emp table.
alter table emp add sal  number(7,2);
/*
I want to give a validation saying that sal cannot be greater 10,000(note give a name to this column).
alter table emp add constraint emp_sal_check check (sal<10000);
/*
For the time being I have decided that I will not impose this validation.  My boss has agreed to pay more than 10,000.
Alter table emp disable constraint emp_sal_check;
/*
My boss has changed his mind.  Now he doesn't want to pay more than 10,000.  So revoke that salary constraint
Alter table emp enable constraint emp_sal_check;
/*
Add column called as mgr to your emp table.
Alter table emp add mgr number(5);
/*
Oh! This column should be related to empno. Give a command to add this constraint
Alter table emp add constraint emp_mgr foreign key(empno);
/*
Add dept no column to your emp table
Alter table emp add deptno number(3);
/*
This dept no column should be related to deptno column of dept table
Alter table emp1 add constraint emp1_deptno foreign key(deptno) references dept(deptno);
/*
Create table called as new emp. Using single command create this table as well as to get data into this table (use create table as)
create table newemp as */
SELECT *
FROM EMP;

/*
Create table called as newemp.  This table should contain only empno,ename, dname
create table newemp as */
SELECT EMPNO, ENAME, DNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO=D.DEPTNO;

/*
Delete the rows of employees who are working in the company for more than 2 years.
Delete from emp where floor(sysdate-hiredate)>2*365;
/*
Provide a commission to employees who are not earning any commission.
update emp set comm=300 where comm is null;
/*
If any employee has commission his commission should be incremented by 10% of his salary.
update emp set comm=comm*10/100 where comm is not null;
/*
Display employee name and department name for each employee.
*/
SELECT ENAME, DNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO=D.DEPTNO;

/*
Display employee number, name and location of the department in which he is working.
*/
SELECT EMPNO, ENAME, LOC
FROM EMP E, DEPT D
WHERE E.DEPTNO=D.DEPTNO;

/*
Display ename, dname even if there no employees working in a particular department(use outer join).
*/
SELECT ENAME, DNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO (+)= D.DEPTNO;

/*
Display employee name and his manager name.
*/
SELECT E.ENAME, M.ENAME
FROM EMP E, EMP M
WHERE E.MGR=M.EMPNO;

/*
Display the department name along with total salary in each department.
*/
SELECT DEPTNO, SUM(SAL)
FROM EMP
GROUP BY DEPTNO;

/*
Display the department name and total number of employees in each department.
*/
SELECT DEPTNO, COUNT(*)
FROM EMP
GROUP BY DEPTNO;

/*
Alter table emp1 add constraint emp1_deptno foreign key(deptno) references dept(deptno)

Delete from emp where job name is clerk

Insert into emp without giving any further commands move to another client system  and log into the same user give the following command

Are the above changes reflected in this user

Go to your fist system and give commit come back to the second system and give the following command

Display the current date and time
*/
SELECT TO_CHAR(SYSDATE, 'month mon dd yy yyyy hh:mi:ss')
FROM DUAL;


select department_id,salary,DENSE_RANK() over(order by salary desc) as myrank
from employees;


