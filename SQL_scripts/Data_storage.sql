-- / as sysdba

-- alter session set container=orclpdb;

-- alter database open;

-- conn hr/hr@orclpdb;
-- alter database open;

CREATE TABLE EMPLOYEE1(
    EMPNO INT, BASIC INT, HRA INT, TSAL INT
);

INSERT INTO EMPLOYEE1 VALUES (
    100, 50000, 7900, 57900
);

INSERT INTO EMPLOYEE1 VALUES (
    300, 66000, 7800, 41500
);

INSERT INTO EMPLOYEE1 VALUES (
    100, NULL, 7900, 57900
);

INSERT INTO EMPLOYEE1 VALUES (
    100, NULL, 7900, 57900
);

SELECT *
FROM EMPLOYEE1;

-- TRUNCATE TABLE removes all rows from a table, but the table structure and its columns, constraints, indexes, and so on remain.
TRUNCATE TABLE EMPLOYEE1;

-- while updating dont use expression as update happens step by step
UPDATE EMPLOYEE1
SET
    HRA=5000
WHERE
    EMPNO=100;

UPDATE EMPLOYEE1
SET
    TSAL=55000
WHERE
    EMPNO=100;

---to make permanent change in our table we use commit while rollback does the reverse of delete

--
UPDATE EMPLOYEE1
SET
    BASIC=NULL;

SELECT CONSTRAINT_NAME,CONSTRAINT_TYPE,SEARCH_CONDITION FROM USER_CONSTRAINTS
WHERE TABLE_NAME='EMPLOYEES';

INSERT into emp3 (MOB,PASSPORT_NO)
    select 9822639668,'maiag47' from dual
union all select 9822639668,'maiag42' from dual
union all select 9822639668,'maiag41' from dual
union all select 9822639668,'maiag43' from dual;
