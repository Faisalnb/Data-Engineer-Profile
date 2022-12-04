-- 1. Create a table PRODUCT to store the following data
-- Prod_no, quantity, unit_price, discount,tax,total_price
-- Note:
-- a. The total number of different products are not more than 10000
-- b. Quantity to a fraction of 3 digits to represent 250 grams, 799 grams 
-- etc
-- c. Unit_price and total_price to a fraction of 2 digits to present paise
-- d. Discount is in terms of percentage such as 10% or 10.5% etc.
CREATE TABLE PRODUCT
(
Prod_no NUMBER(4),
quantity NUMBER(5,2),
unit_price NUMBER(7,2),
discount NUMBER(3,-1),
Tax NUMBER(4,2),
total_price NUMBER (7,2)
);


-- 2. Create a table COMPANY to store the following data
-- Company_no, assets_value,debts_value,turn_over,by_financial_year
-- Note:
-- a. Asset value must be in crores rounded to thousands
-- b. Debts_value must be in crores rounded to hundreds
-- c. Turn_over must be in crores rounded to lakhs
-- d. By_financial_year represents 4 digit financial year. Ex: 2022
CREATE TABLE COMPANY
(
Company_no NUMBER(5),
assets_value NUMBER(6,-3),
debts_value NUMBER(6,-2),
turn_over NUMBER(3,-6),
by_financial_year NUMBER(4)
);