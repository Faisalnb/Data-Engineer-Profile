CREATE TABLE STUDENT(
    SNO NUMBER(3),
    SNAME VARCHAR2(20),
    DOJ DATE
);

INSERT INTO STUDENT VALUES(
    100,'AAA',TO_DATE('2020-JAN-01','YYYY-MM-DD')
);

INSERT INTO STUDENT VALUES(
    102,'BBB',TO_DATE('20-OCT-2022','DD-MON-YY')
);

INSERT INTO STUDENT VALUES(
    103,'CCC',TO_DATE('FEB-02-2021','mm-dd-yyyy')
);

SELECT SNO ,SNAME , TO_CHAR(DOJ,'YYYY-MM-DD')
FROM STUDENT;

SELECT SNO ,SNAME , TO_CHAR(DOJ,'DD-MON-YY')
FROM STUDENT;

SELECT SNO ,SNAME , TO_CHAR(DOJ,'mm-dd-yyyy')
FROM STUDENT;
--===============================================
-- 2.Write a query to display the last day of this month
SELECT LAST_DAY(SYSDATE) FROM DUAL;
-- 3.Write a query to display the last day of this week 
SELECT NEXT_DAY(SYSDATE,'SUN') FROM DUAL;
-- 4.Write a query to display the last day of last month 
SELECT LAST_DAY(ADD_MONTHS(SYSDATE,-1)) FROM DUAL;
-- 5.Write a query to display last day of next month 
SELECT LAST_DAY(ADD_MONTHS(SYSDATE,1)) FROM DUAL;
-- 6.Write a query to display ending day of first week 
SELECT TRUNC(SYSDATE,'MON')+6 FROM DUAL;
-- 7.Write a query to display first day of second week of this month
SELECT TRUNC(SYSDATE,'MON')+7 FROM DUAL; 
-- 8.Write a query to display last day of last year  
SELECT trunc(ADD_MONTHS(SYSDATE,-12),'year')+364 FROM DUAL;
-- 9.Write a query to display last day of last quarter  
SELECT LAST_DAY(ADD_MONTHS(TRUNC(SYSDATE,'Q'),-1)) FROM DUAL;
-- 10.Write a query to display first day of last month  
SELECT trunc(ADD_MONTHS(SYSDATE,-1),'mon') FROM DUAL;
-- 11.Write a query to display last day of this year 
SELECT trunc(ADD_MONTHS(SYSDATE,12),'year')-1 FROM DUAL;
 

