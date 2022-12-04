-- 1. Insert the following rows into PRODUCT table
-- PROD_NO QUANTITY UNIT_PRICE DISCOUNT TAX TOTAL_PRICE
-- 100 1.756 150 5.5 18 325.32
-- 200 1.500 120 NULL NULL 180
-- 300 NULL 300 NULL NULL NULL
-- 400 Null NULL Null Null Null
CREATE TABLE PRODUCT (
    PROD_NO NUMBER(4), QUANTITY NUMBER(5, 2), UNIT_PRICE NUMBER(7, 2), DISCOUNT NUMBER(3, 1), TAX NUMBER(4, 2), TOTAL_PRICE NUMBER (7, 2)
);

DROP TABLE PRODUCT;

INSERT INTO PRODUCT VALUES(
    100, 1.756, 150, 5.5, 18, 325.32
);

INSERT INTO PRODUCT VALUES(
    200, 1.500, 120, NULL, NULL, 180
);

INSERT INTO PRODUCT VALUES(
    300, NULL, 300, NULL, NULL, NULL
);

INSERT INTO PRODUCT VALUES(
    400, NULL, NULL, NULL, NULL, NULL
);


-- 2. Perform the update operations on the following rows
-- a. Update discount as 10% and tax as 12% form prod_no 200 and manually calculate the total_price and update total_price also
-- b. Update quantity as 1.250, tax as 5%, no discount and manually calculate total_price and update total_price also for prod_no 300
-- c. Save all the changes into the table permanently
UPDATE PRODUCT SET DISCOUNT=10
WHERE  PROD_NO=200;

UPDATE PRODUCT SET TAX=12
WHERE  PROD_NO=200;

UPDATE PRODUCT
SET
    QUANTITY=1.250
WHERE  PROD_NO=300;

UPDATE PRODUCT SET TAX=5
WHERE  PROD_NO=300;

UPDATE PRODUCT SET DISCOUNT=0
WHERE  PROD_NO=300;

UPDATE PRODUCT SET TOTAL_PRICE=300*1.25-0.05
WHERE  PROD_NO=300;

COMMIT;

-- 3. Perform delete operations
-- a. Remove the entire row with prod_no 400
-- b. Remove the entire column data of Discount column since company stopped discounts on all products
DELETE FROM PRODUCT
WHERE  PROD_NO=400;

UPDATE PRODUCT SET DISCOUNT=NULL;

-- 4. Perform the following operations
-- a. Display entire data of the PRODUCT table
-- b. Display only PROD_NO, QUANTITY,UNIT_PRICE, TOTAL_PRICE FOR all products
-- c. Display all details for the product PROD_NO 100
-- d. Display PROD_NO,TOTAL_PRICE for PROD_NO 100,300
SELECT *
FROM PRODUCT;

SELECT PROD_NO, QUANTITY, UNIT_PRICE, TOTAL_PRICE
FROM PRODUCT;

SELECT *
FROM PRODUCT
WHERE PROD_NO=100;

SELECT PROD_NO, TOTAL_PRICE
FROM PRODUCT
WHERE PROD_NO=100 OR PROD_NO=300;