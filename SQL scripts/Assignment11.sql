-- 1.. Create two tables BILL and BILL_DETAILS with ON DELETE CASCADE option
-- BILL table columns are BILL_NO, CUSTOMER_NAME,PHONE_NO
-- BILL_DETAILS table columns are BILL_NO, ITEM_NAME, QTY,UNIT_PRICE, ITEM_TOTAL
-- Insert data and test whether ON DELETE CASCADE option is working properly or not
CREATE TABLE BILL (
    BILL_NO NUMBER(5) CONSTRAINT BT_BN_PK PRIMARY KEY,
    CUSTOMER_NAME VARCHAR2(20),
    PHONE_NO CHAR(10)
);
CREATE TABLE BILL_DETAILS (
    BILL_NO NUMBER(5) CONSTRAINT BD_BN_FK REFERENCES BILL(BILL_NO)
    ON DELETE CASCADE,
    ITEM_NAME VARCHAR2(20),
    QTY NUMBER(3),
    UNIT_PRICE NUMBER(5),
    ITEM_TOTAL NUMBER(5)
);

INSERT INTO BILL VALUES(
    100, 'AAA', 123456789
);

INSERT INTO BILL_DETAILS VALUES(
    100, 'SOAP', 3, 50, 150
);

SELECT *
FROM BILL;
SELECT *
FROM BILL_DETAILS;

DELETE FROM BILL 
WHERE BILL_NO=100;
1 row deleted.

Commit complete.

-------------------------

-- 2. CREATE TWO tables SALES_PERSON, PRODUCT with ON DELETE SET NULL option SALES_PERSON table columns are PERSON_NO, PERSON_NAME,
-- PRODUCT table columns are PROD_ID, PROD_NAME,PERSON_NO
-- Insert data in both tables and test whether ON DELETE SET NULL is working properly or not
CREATE TABLE SALES_PERSON (
    PERSON_NO NUMBER(3) CONSTRAINT SP_PN_PK PRIMARY KEY,
    PERSON_NAME VARCHAR2(20)
);
CREATE TABLE PRODUCT (
    PROD_ID NUMBER(5),
    PROD_NAME VARCHAR2(20),
    PERSON_NO NUMBER(3) CONSTRAINT PT_PN_FK REFERENCES SALES_PERSON(PERSON_NO)
    ON DELETE SET NULL
);

INSERT INTO SALES_PERSON VALUES(
    200, 'NOHARA'
);
INSERT INTO PRODUCT VALUES(
    201, 'COSMETIC', 200
);

SELECT *
FROM SALES_PERSON;
SELECT *
FROM PRODUCT;

DELETE FROM SALES_PERSON
WHERE PERSON_NO= 200;

1 row deleted.

Commit complete.
-------------------------

-- 3. Create table EMPLOY7 with columns ENO,ENAME,GRADE,SALARY. Declare default value as ‘A’ grade for the GRADE column with NOT NULL 
-- constraint. Observe what happens if data is skipped for GRADE column and also observe what happens if NULL keyword is used while inserting 
-- data into GRADE column
CREATE TABLE EMPLOY7 (
    ENO NUMBER(3),
    ENAME VARCHAR2(20),
    GRADE CHAR(1) DEFAULT 'A' CONSTRAINT E7_GR_NN NOT NULL,
    SALARY NUMBER(5)
);

INSERT INTO EMPLOY7 VALUES (
    100, 'FAISAL', DEFAULT, 12000
);

SELECT *
FROM EMPLOY7;



-- 4. Write a query to display data in the following order DEPARTMENT_ID in ASC, JOB_ID in DESC, SALARY in ASC
SELECT DEPARTMENT_ID, JOB_ID, SALARY
FROM EMPLOYEES
ORDER BY DEPARTMENT_ID, JOB_ID, SALARY;


-- 5. Write the same query using positional notion in ORDER BY clause
SELECT DEPARTMENT_ID, JOB_ID, SALARY
FROM EMPLOYEES
ORDER BY 1,2,3;

-- 6. Write a query to display COUNTRY_ID and no. of locations in each country_id 
SELECT COUNTRY_ID, COUNT(*)
FROM LOCATIONS
GROUP BY COUNTRY_ID;

