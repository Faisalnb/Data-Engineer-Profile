CREATE TABLE EMPLOYEE1(
    EMPID NUMBER(2),
    SALARY NUMBER(5)
);
DESC EMPLOYEE1;
INSERT INTO  EMPLOYEE1 VALUES(
    1,50000
);

INSERT INTO  EMPLOYEE1 VALUES(    
    2,40000
);
INSERT INTO  EMPLOYEE1 VALUES(    
    1,50000
);

SELECT ROWID,EMPID,SALARY
FROM EMPLOYEE1;

DELETE FROM EMPLOYEE1
WHERE ROWID = AAAR1IAAEAAAJTtAAC;

SELECT FIRST_NAME,LAST_NAME,SALARY,ceil(0.23*SALARY) AS HRA
FROM EMPLOYEES;

CREATE TABLE EMP3 (
    MOB CHAR(10),
    PASSPORT_NO CHAR(9)
);
INSERT INTO EMP3 VALUES(
    9028429578,
    'BZGPB5937'
);
INSERT INTO EMP3 VALUES(
    90284,
    'BZGPB5937'
);
INSERT INTO EMP3 VALUES(
    90284,
    'BZGPB'
);

CREATE TABLE EMPLOYEE6(
    EMPID NUMBER(2),
    ENAME VARCHAR2(10)
);

INSERT INTO EMPLOYEE6 VALUES(
    1,
    'FAISAL'
);

SELECT ENAME,VSIZE(ENAME)
FROM EMPLOYEE6;



SELECT VSIZE(N),N
FROM T3;

select round (12345678,-3) from dual;

SELECT upper('AVD group') from dual;
-- AVD GROUP

SELECT lower('AVD group') from dual;
--	avd group

SELECT 'avd' || CHR(9) || 'group' from dual;
-- avd  group

SELECT substr('avd group',1,3) from dual;
-- avd

SELECT substr('avd group ltd',-9,5) FROM dual;
--group

SELECT instr('AVD GROUP PVT LTD','P',1,2) FROM DUAL;
-- 11
SELECT instr('AVD GROUP PVT LTD','P',-10) FROM DUAL;
-- 0

SELECT instr('Faisal`s oracle group ltd',' ')+1 FROM dual;
-- position of first blank
SELECT instr('Faisal`s oracle group ltd',' ',1,2)-1 FROM dual;
-- position of 2nd blank
SELECT ((instr('Faisal`s oracle group ltd',' ',1,2)-1 ) - (instr('Faisal`s oracle group ltd',' ')+1))+1 from dual;
-- char count of 2nd word
SELECT substr('Faisal`s oracle group ltd',instr('Faisal`s oracle group ltd',' ')+1,((instr('Faisal`s oracle group ltd',' ',1,2)-1 ) - (instr('Faisal`s oracle group ltd',' ')+1))+1) from dual;

SELECT length(replace('avd group',' ')) from DUAL;
-- 8
SELECT LENGTH('avd group')from dual;
-- 9

--l93-l91+1= No of words

SELECT FIRST_NAME, LAST_NAME, SALARY, nvl(COMMISSION_PCT,0) as "Commision percent"
FROM EMPLOYEES;
Peter	
Vargas	
2500	
0
	
John	
Russell	
14000	
0.4


SELECT FIRST_NAME, LAST_NAME, SALARY, nvl2(COMMISSION_PCT,COMMISSION_PCT+0.1,0.5) as "Commision percent"
FROM EMPLOYEES;
Peter	
Vargas	
2500	
0.5
	
John	
Russell	
14000	
0.5
