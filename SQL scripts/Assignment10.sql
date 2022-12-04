
-- 1. Create a table student with the following columns SNO,SNAME,MSQL (marks in SQL exam). Declare NOT NULL constraints on SNO, SNAME 
-- columns and CHECK constraint on MSQL column. The exam is conducted  in SQL for Max of 100 marks. No negative marks.
CREATE TABLE STUDENT (
    SNO NUMBER(3)   CONSTRAINT STU_SNO_NN NOT NULL,
    SNAME VARCHAR2(10) CONSTRAINT STU_SNA_NN NOT NULL,
    MSQL NUMBER(3) CONSTRAINT STU_MSQL_CK CHECK(MSQL BETWEEN 0 AND 100)
);
-- 2. Create table BILL with the columns bill_no, item_no, item_name, unit_price, discount. Declare check constraint on discount which must 
-- not be more than10% on unit_price.
CREATE TABLE BILL (
    bill_no NUMBER(3),
    item_no NUMBER(3),
    item_name NUMBER(10) ,
    unit_price NUMBER(4), 
    discount NUMBER(3),
    CONSTRAINT BILL_DIS_CK CHECK(DISCOUNT< 0.1*UNIT_PRICE)
);
SELECT  CONSTRAINT_NAME,CONSTRAINT_TYPE,SEARCH_CONDITION
FROM USER_CONSTRAINTS
WHERE TABLE_NAME='STUDENT' OR TABLE_NAME='BILL' ;

-- 3. Create table ACCOUNT with columns  ACNO,CUSTOMER_NAME,ACCOUNT_TYPE, BALANCE,adhar_no. pan.
-- Declare unique constraint on adhar_no and not null also. Declare unique constraint on pan also 
-- And also declare TRANSACTION table with ACNO, TRANSACTION_AMT,TRANSACTION_TYPE.

-- Implement foreign key constraint on ACNO of TRANSACTION table with reference to ACNO of ACCOUNT table. Declare a check constraint on 
-- ACCOUNT_TYPE to accept the values ‘SB’ for savings bank type and ‘CA’ for current account type.
CREATE TABLE ACCOUNT (
    ACNO NUMBER(10) CONSTRAINT ACC_AN_PK PRIMARY KEY,
    CUSTOMER_NAME VARCHAR2(10),
    ACCOUNT_TYPE VARCHAR2(10),
    BALANCE NUMBER(6),
    aadhar_no NUMBER(12) CONSTRAINT ACC_AA_NN NOT NULL,
    CONSTRAINT ACC_AA_UK UNIQUE(aadhar_no),
    pan NUMBER(10) CONSTRAINT ACC_PA_UK UNIQUE
);
CREATE TABLE TRANSACTION (
    ACNO NUMBER(10) CONSTRAINT TR_AN_FK REFERENCES ACCOUNT(ACNO),
    TRANSACTION_AMT NUMBER(4),
    TRANSACTION_TYPE VARCHAR2(10)
);

ALTER TABLE ACCOUNT 
ADD CONSTRAINT ACC_AT_CK CHECK(ACCOUNT_TYPE IN ('SB','CA'));

SELECT  CONSTRAINT_NAME,CONSTRAINT_TYPE,SEARCH_CONDITION
FROM USER_CONSTRAINTS
WHERE TABLE_NAME='ACCOUNT' OR TABLE_NAME='TRANSACTION' ;