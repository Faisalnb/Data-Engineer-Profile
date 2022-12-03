SELECT *
FROM REGIONS
WHERE REGION_ID IN (1, 3, 4, 5);

SELECT *
FROM REGIONS
WHERE REGION_ID BETWEEN 1 AND 3;

DESC EMPLOYEES;

-- Name	Null?	Type
-- EMPLOYEE_ID	NOT NULL	NUMBER(6)
-- FIRST_NAME		VARCHAR2(20)
-- LAST_NAME	NOT NULL	VARCHAR2(25)
-- EMAIL	NOT NULL	VARCHAR2(25)
-- PHONE_NUMBER		VARCHAR2(20)
-- HIRE_DATE	NOT NULL	DATE
-- JOB_ID	NOT NULL	VARCHAR2(10)
-- SALARY		NUMBER(8,2)
-- COMMISSION_PCT		NUMBER(2,2)
-- MANAGER_ID		NUMBER(6)
-- DEPARTMENT_ID		NUMBER(4)

SELECT FIRST_NAME, LAST_NAME, '$' || SALARY || '/-' AS "Basic Salary" --concat string
FROM EMPLOYEES;

-- FIRST_NAME,LAST_NAME,Basic Salary
-- Steven,King,$24000/-
-- Neena,Kochhar,$17000/-
-- Lex,De Haan,$17000/-
-- Alexander,Hunold,$9000/-
-- Bruce,Ernst,$6000/-
-- David,Austin,$4800/-
-- Valli,Pataballa,$4800/-
-- Diana,Lorentz,$4200/-
-- Nancy,Greenberg,$12008/-

SELECT FIRST_NAME || ' ' || LAST_NAME AS "Full Name"
FROM EMPLOYEES;

--concats cols of table

-- Full Name
-- Ellen Abel
-- Sundar Ande
-- Mozhe Atkinson
-- David Austin
-- Hermann Baer
-- Shelli Baida
-- Amit Banda
-- Elizabeth Bates

SELECT FIRST_NAME
FROM EMPLOYEES
WHERE FIRST_NAME LIKE 'S%';

--     FIRST_NAME
-- Sundar
-- Shelli
-- Sarah
-- Shelley
-- Steven
-- Sundita
-- Steven
-- Susan
-- Samuel
-- Sarath
-- Stephen
-- Sigal
-- Shanta


SELECT FIRST_NAME
FROM EMPLOYEES
WHERE FIRST_NAME LIKE '____';

-- FIRST_NAME
--     Amit
--     John
--     Jean
--     Adam
--     Jack
--     Lisa
--     Luis
--     John
--     John

SELECT REGION_NAME
FROM REGIONS
WHERE REGION_NAME LIKE '% %';

-- REGION_NAME
--  Middle East and Africa

CREATE TABLE E786 (
    ENAME VARCHAR2(20)
);

DROP TABLE E786;

INSERT INTO E786 VALUES(
    VIJAY
);

INSERT INTO E786 VALUES(
    'vijay kumar'
);

INSERT INTO E786 VALUES(
    VIJAYA
);

INSERT INTO E786 VALUES(
    'vijay_kumar'
);

SELECT *
FROM E786;

SELECT ENAME
FROM E786
WHERE ENAME LIKE '%\_%' ESCAPE '\';

-- ENAME
-- vijay_kumar