select first_name, last_name,HIRE_DATE
from employees;
-- FIRST_NAME,LAST_NAME,HIRE_DATE
-- Steven,King,17-JUN-03

SELECT TO_CHAR(DATE '2022-10-30','DD-MON-YYYY,Q,DY') AS TODAY FROM DUAL;
-- TODAY
-- 30-OCT-2022,4,SUN

insert into employees  (EMPLOYEE_ID,last_name,EMAIL,HIRE_DATE) values(
    985253,'Bargi','faisal.bargi@tcs.com','05/10/2015'
);

-- 985253,'Bargi','faisal.bargi@tcs.com','05/10/2015'
--                                            *
-- ERROR at line 11:
-- ORA-01843: not a valid month

select sysdate,CURRENT_DATE,last_day(date '2020-02-02') as feb_last_day,next_day(date '2020-02-02','sat') as next_sat from dual;
-- SYSDATE,CURRENT_DATE,FEB_LAST_DAY,NEXT_SAT
-- 30-OCT-22,30-OCT-22,29-FEB-20,08-FEB-20

select add_months(sysdate,-1) from dual;
--ADD_MONTHS(SYSDATE,-1)
-- 30-SEP-22

--GETTING TIMESTAMP FROM SYSDATE USIN TO_CHAR FUNCTION
select to_char(SYSDATE,'DD-MON-YY HH:MM:SS AM') from dual;
-- TO_CHAR(SYSDATE,'DD-MON-YYHH:MM:SSAM')
-- 31-OCT-22 07:10:47 AM


--GOING TO START OF MONTH USING MON ARG IN TRUNC FUNCTION
SELECT TRUNC(to_date('31-OCT-22','dd-mon-yy'),'MON') FROM DUAL;
-- TRUNC(TO_DATE('31-OCT-22','DD-MON-YY'),'MON')
-- 01-OCT-22

--FILTERING BASED ON JUST DATE
SELECT * FROM LIN_TABLE
WHERE START_DATE >= DATE '2007-03-01'
AND START_DATE < DATE '2007-04-01';

--OBTAINING TWO HOUR PRIOR TIME VALUE
SELECT TO_CHAR(SYSDATE-2/24,'DD-MON-YY HH:MI:SS AM') FROM DUAL;
--TO_CHAR(SYSDATE-2/24,'DD-MON-YYHH:MI:SSAM')
-- 31-OCT-22 07:01:23 AM

--OBTAINING 15 MIN PRIOR TIME VALUE
SELECT TO_CHAR(SYSDATE-15/24/60,'DD-MON-YY HH:MI:SS AM') FROM DUAL;
--TO_CHAR(SYSDATE-15/24/60,'DD-MON-YYHH:MI:SSAM')
-- 31-OCT-22 09:02:24 AM

--write the trunc function for 2022-11-16 11:35:00
select to_char(trunc(timestamp '2022-11-16 11:35:00','yy'),'yyyy-mon-dd hh:mi:ss am') from dual;
--TO_CHAR(TRUNC(TIMESTAMP'2022-11-1611:35:00','HH'),'YYYY-MON-DDHH:MI:SSAM')
-- 2022-nov-16 11:00:00 am
