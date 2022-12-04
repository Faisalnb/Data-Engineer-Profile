
-- 1. Write a query using sub query to display all the locations which are having departments
SELECT *
FROM LOCATIONS MAINq
WHERE EXISTS (
    SELECT 1 LOCATION_ID
    FROM DEPARTMENTS SUBq
    WHERE MAINq.LOCATION_ID=SUBq.LOCATION_ID
);

-- 2. Write a query using sub query to display all the locations which are not having depertments
SELECT *
FROM LOCATIONS MAINq
WHERE NOT EXISTS (
    SELECT 1 LOCATION_ID
    FROM DEPARTMENTS SUBq
    WHERE MAINq.LOCATION_ID=SUBq.LOCATION_ID
);

-- 3. Write a query using sub query to display FIRST_NAME,LAST_NAME,SALARY,JOB_ID,
-- JOB_ID_MIN_SALARY,JOB_ID_MAX_SALARY. Here job_id wise min and max salaries are required to be displayed
SELECT FIRST_NAME,LAST_NAME,JOB_ID,SALARY,(
    SELECT ROUND(MIN(SALARY),2) 
    FROM EMPLOYEES SUBq1
    WHERE MAINq.JOB_ID=SUBq1.JOB_ID) AS JOB_ID_MIN_SALARY,
    (
    SELECT ROUND(MAX(SALARY),2) 
    FROM EMPLOYEES SUBq2
    WHERE MAINq.JOB_ID=SUBq2.JOB_ID) AS JOB_ID_MAX_SALARY
FROM EMPLOYEES MAINq;

-- 4. Write a query using sub query to display total_regions, total_countires, total_locations 
SELECT *
FROM (
        SELECT REGION_ID,REGION_NAME
        FROM REGIONS
     ) MAINq
    JOIN(
        SELECT REGION_ID,COUNTRY_ID,COUNTRY_NAME 
        FROM COUNTRIES
        ) SUBq1 
        ON MAINq.REGION_ID = SUBq1.REGION_ID
    JOIN(
        SELECT *
        FROM LOCATIONS
        ) SUBq2
        ON SUBq1.COUNTRY_ID=SUBq2.COUNTRY_ID;

-- 5. Write a query to display details of all employees DEPARTMENT_NAME, DEPARTMENT_ID, FIRST_NAME, LAST_NAME who are working in Sales departmeNt
SELECT &dep AS DEPARTMENT_NAME,MAINQ.DEPARTMENT_ID,MAINQ.FIRST_NAME,MAINQ.LAST_NAME
FROM EMPLOYEES MAINq 
WHERE EXISTS(
    SELECT 1
    FROM DEPARTMENTS SUBq
    WHERE DEPARTMENT_NAME=&dep AND MAINQ.DEPARTMENT_ID=SUBQ.DEPARTMENT_ID
);


