-- 1) Extract the Month, Day & Year I three different columns in Calendar Table. If Table not created please create the table based on the file received.	
select extract (month from dates) as Month,
        extract (day from dates) as Day, 
        extract (year from dates) as Year
 from calendars2;

-- 3) Write a query to find out the number of customer who are married.	
select distinct sum(case when MARITALSTATUS='M' then 1 else 0 end) 
                over() as "COUNT of Married customers"
from customers2;

-- 5) Write a query to find out how many customers have 0 kids.
select distinct sum( case when TotalChildren=0 then 1 else 0 end)
                over() as "Customer COunt with no child"
from customers2;
 	
-- 7) Give me a count of customers who have their own property.	
select distinct sum( case when HOMEOWNER='Y' then 1 else 0 end)
                over() as "Count of customer with own property"
from customers2;

-- 8) Write a SQL Query to find out the Customer Last Name starts with ‘RA’ & FIRST Name ending with ‘DA’and ensure there is no duplicate records seen when the output is displayed.
select * from customers2
where lastname like 'RA%' and firstname like '%DA';

-- 9) Write a query to display the sales for the order date 03/21/2017 for product key 540.	
select * from SALES_2017
where PRODUCTKEY=540 and ORDERDATE= date '2017-03-21';

-- 10) Write a SQL Query to increase the cost of products by 18% and round the data to the nearest number.
select PRODUCTCOST,floor(PRODUCTCOST*1.18) as FInalPRODUCTCOST 
from products2;

-- 11) Adventure work Head of sales would like to find out the cost difference between productcost and product price.
select PRODUCTPRICE-PRODUCTCOST
from products2;

-- 12) Write a SQL Query to find out, which products were not returned (Use tables Product & Returns) solve the query without ‘not in’ function.
select p.productkey,p.productname from products2	p
where  not exists (
    select 'pkey' from returns2 r
    where p.productkey=r.PRODUCTKEY
)order by 1;


-- 13) Write a query to find out which customer has placed most number of sales.
with sales_tab AS
(select CUSTOMERKEY,count(*) as OrderCount
from SALES_2017
group by CUSTOMERKEY
order by count(*) desc)
select c.FULL_NAME from customers2 c
where c.CUSTOMERKEY in (
    select s.customerkey from sales_tab s
    where rownum<2
);


-- 14) Write a SQL Query to find out the products returned for Region Germany.
with return_data as (
select * from returns2 r
where exists (
    select 'row' from TERRITORIES2 t
    where t.COUNTRY='Germany' and  r.TERRITORYKEY=t.SALESTERRITORYKEY
))select p.productkey,r.TERRITORYKEY,p.productname from products2 p
    join return_data r on r.productkey=p.productkey;


-- 16) Write a sql query to find out the customers that have at least one sale from Northwest region of America.
with reg_table as (
select distinct s.CUSTOMERKEY from sales_2017 s
where s.TERRITORYKEY in (
    select t.SALESTERRITORYKEY
    from TERRITORIES2 t
    where t.REGION='Northwest' and t.SALESTERRITORYKEY=s.TERRITORYKEY))
select c.FULL_NAME from customers2 c
where c.CUSTOMERKEY in (
    select r.CUSTOMERKEY from reg_table r);

-- 17) Write a SQL Query to find out which customer has more than one order quantity.
select * from CUSTOMERS2 c
where c.CUSTOMERKEY in (
    select s.CUSTOMERKEY from sales_2017 s
    where ORDERQUANTITY>1
);

-- 18) Write a query to find out in which region the following sub category Road Bikes, Mountain Frames are sold and for  which customer. Use CTE	
with pr_table as (
select * from sales_2017 s
    join products2 p
        on s.PRODUCTKEY=p.PRODUCTKEY),
sc_table as (
select * from products2 p
    join PRODUCT_SUBCATEGORIES2 sc
        on sc.SUBCATEGORYNAME in ('Road Bikes', 'Mountain Frames') and 
        p.PRODUCTSUBCATEGORYKEY=sc.PRODUCTSUBCATEGORYKEY)
select * from pr_table 
where exists(
    select 'pid' from sc_table
    where pr_table.productkey=sc_table.productkey
);


-- 19) Write a SQL Query to find out which products were returned.	
select p.productkey,p.productname from products2	p
where  not exists (
    select 'pkey' from returns2 r
    where p.productkey=r.PRODUCTKEY
)order by 1;

-- 21) Write a SQL Query to find get a report for the following	
-- a) List of all customers	
-- b) Sales done by each customer	
-- c) Product owned by each customer	
-- d) Name of the Product Sub category	
-- e) Products, which were returned.

with all_prod as(
select *  from customers2 
    join SALES_2017  using(customerkey)
    join products2 p using(productkey)
    join PRODUCT_SUBCATEGORIES2 sc
        on p.PRODUCTSUBCATEGORYKEY=sc.PRODUCTSUBCATEGORYKEY)
select FULL_NAME,PRODUCTNAME,SUBCATEGORYNAME,
    case when productkey in (
        select productkey from returns2
    ) then 'Returned' else NULL end as "Return Status"
from all_prod;

-- 22) Write a SQL Query using Sub-select to get the count of all table.
select count(*) as CustomerCount from(
    select * from customers2);
select count(*) as SalesCount from(
    select * from SALES_2017);
select count(*) as ProductCount from(
    select * from products2);
select count(*) as CategoryCount from(
    select * from PRODUCT_CATEGORIES2);
select count(*) as SCategoryCount from(
    select * from PRODUCT_SUBCATEGORIES2);
select count(*) as TerritoryCount from(
    select * from TERRITORIES2);
select count(*) as ReturnsCOunt from(
    select * from returns2);

-- 23) Write a SQL Query to find out which customer has 3rd highest salary using common table expression.
with sal_table as (
    select distinct salary,dense_rank() over(order by salary desc) as myrank
    from customers2
)	select c.FULL_NAME,c.salary from sal_table s
        inner join customers2 c
        on s.salary=c.salary and  myrank=3;

-- 2) Create a new column in Customer Table and as Full Name and let it have values from Prefix, First Name & Last Name.
alter table customers2 add Full_name varchar2(50);
update customers2 
set Full_name = PREFIX||' '||FIRSTNAME||' '||LASTNAME;


-- 4) Replace the ($ , ) values from Annual Income and put the values in a new column that is Salary as numeric field.	
alter table customers2 modify salary number(10);
update customers2 
set salary = replace(substr(annualincome,2),',','');


-- 6) Give Bonus to the following customer occupation. For other O	
-- Professional	50000
-- Clerical	10000
-- Management	25000
-- Manual	2000
update customers2
set salary= case when occupation ='Professional' then salary+50000
	when occupation ='Clerical' then salary+10000
	when occupation ='Management' then salary+25000
	when occupation ='Manual' then salary+2000;

-- 15) Adventure works have decided to change the product colour for a few of their products along which with their product size. Following is the information.	
    -- COLOR,Newcolor
    -- RED,BLACK
    -- NA,BLUE
    -- MULTI,YELLOW
        -- PRODUCT SIZE,NEW SIZE
        -- 0,LARGE
        -- XL,MEDIUM
        -- ALL OTHERS,SMALL
alter table products2 add Newcolor varchar2(10);
alter table products2 add Newsize varchar2(5);
update PRODUCTS2
set Newcolor= case when productcolor='Red' then 'Black'
                 when productcolor='NA' then 'Blue'
                 when productcolor like '%/%' then 'Yellow' 
                 else productcolor end;
update PRODUCTS2
set Newsize= case when productsize='0' then 'L'
                 when productsize='XL' then 'M'
                 else 'S' end;


-- 20) Write a query to add a new column in customers table as username and get the values from email field. Fetch all the values before @ symbol. Update the new field with the values populated your query.	
alter table customers2 add username varchar(20);
update customers2
set username= substr(EmailAddress,1,(instr(EmailAddress,'@',1)-1));


-- 24) Write a query to replace the Gender value NA to Null.
update customers2
set gender= case when gender='NA' then NULL else gender end;

-- 25) Give the following syntax(Need all the syntax we can do with Alter statement)	
-- ● Alter	
-- ● Delete	
-- ● Update	
-- ● Create	
-- ● Insert	

-- 26) Full form of SQL	
The full form of SQL is Structured Query Language

-- 27) How to apply Primary Key & Foreign Key using Alter statement	
You can apply primary and foreign key using cmds
1.alter table table_name add primary key(col_name)
2.alter table table_name add constraint constraint_name foreign key (col_name) references(primary_key col_name from parent table)

-- 28) Share all your scripts which you used to define relationship to create the above mentioned database.	
alter table Customers2 add primary key (CUSTOMERKEY);
alter table Products2 add primary key(PRODUCTKEY);
alter table Product_Subcategories2 add primary key(PRODUCTSUBCATEGORYKEY);
alter table PRODUCT_CATEGORIES2 add primary key(PRODUCTCATEGORYID );
alter table Territories2 add primary key(SALESTERRITORYKEY);
alter table products2 modify productkey number(5);

alter table products2 add foreign key(productsubcategory) references product_subcategoies2(productsubcategory);
alter table returns2 add foreign key(territorykey) references territories2(salesterritorykey);
alter table returns2 add foreign key(productkey) references products2(productkey);
alter table sales_2017 add foreign key(productkey) references products2(productkey);
alter table sales_2017 add foreign key(customerkey) references customers2(customerkey);
alter table sales_2017 add foreign key(territorykey) references territories2(salesterritorykey);
alter table product_subcategoies2 add foreign key(productsubcategorykey) references product_categoies2(productsubcategoryid);
