

--                                                       Puzzle #1 SHOPPING CART
SELECT *
FROM ITEMS1 T1
    FULL OUTER JOIN ITEMS2 T2
        ON T1.ITEM=T2.ITEM;

--                                                      Puzzle #2 Manager and Employees           
--Recursion
WITH cte_Recursion  AS
(
SELECT  A.EmployeeID, A.ManagerID, A.JobTitle, A.Salary, 0 AS Depth
FROM    MANGERSandEmployees a
WHERE   A.ManagerID IS NULL
UNION ALL
SELECT  b.EmployeeID, b.ManagerID, b.JobTitle, b.Salary, a.Depth + 1 AS Depth
FROM    cte_Recursion a INNER JOIN 
        MANGERSandEmployees b ON a.EmployeeID = b.ManagerID
)
SELECT  A.EmployeeID, A.ManagerID, A.JobTitle, A.Salary, Depth
FROM    cte_Recursion;

--                                                      Puzzle #4 TWO_PREDICATES
SELECT *
FROM TWO_PREDICATES
WHERE CUSTOMER_ID IN (
    SELECT CUSTOMER_ID
    FROM TWO_PREDICATES
    WHERE DELIVERY_STATE='CA'
)
AND DELIVERY_STATE='TX';

---                                                     Puzzle #5 PHONE DIRECTORY

SELECT *
FROM (
    SELECT *
    FROM PHONE_DIRECTORY
)
PIVOT(max(PHONE_NUMBER) for 
    TYPE IN ('Cellular' as Cellular,'Work' as Work,'Home' as Home))
ORDER BY 1;
---------------------------------------------------------------------------
WITH cte_PhoneNumbers AS
(
SELECT  CUSTOMER_ID ,
        PHONE_NUMBER AS Cellular,
        NULL AS work,
        NULL AS home
FROM    Phone_Directory
WHERE   TYPE = 'Cellular'
UNION
SELECT  CUSTOMER_ID ,
        NULL Cellular,
        PHONE_NUMBER AS Work,
        NULL home
FROM    Phone_Directory
WHERE   TYPE = 'Work'
UNION
SELECT  CUSTOMER_ID ,
        NULL Cellular,
        NULL Work,
        PHONE_NUMBER AS Home
FROM    Phone_Directory
WHERE   TYPE = 'Home'
)
SELECT  CUSTOMER_ID ,
        MAX(Cellular),
        MAX(Work),
        MAX(Home)
FROM    cte_PhoneNumbers
GROUP BY CUSTOMER_ID ORDER BY 1;

--                                                        Puzzle #6 WORKFLOW STEPS
SELECT * FROM (
    SELECT WORKFLOW
    FROM WORKFLOW_STEPS
    GROUP BY WORKFLOW
    HAVING COUNT(COMPLETION_DATE) =1
);

--                                                      Puzzle #7 MISSION MARS
SELECT DISTINCT CANDIDATE_ID
FROM MISSIONMARS_CANDIDATES
WHERE DESCRIPTION IN (
    SELECT REQUIREMENTS_DESCRIPTION
    FROM MISSIONMARS_REQ
);


--                                                      
SELECT VALUE FROM ( (
    SELECT 'A' V1, 'E' V2, 'I' V3, 'O' V4, 'U' V5
    FROM DUAL
)
UNPIVOT (
    VALUE FOR VALUE_TYPE IN (V1,V2,V3,V4,V5)
)
);
---                                                   Puzzle #8  WORKFLOW CASES
WITH UNPIVOT AS (
    SELECT * 
    FROM WORKFLOW_CASES
    UNPIVOT (        --unpivot works on categorical col while pivot on values of categ 
        VALUE FOR CASE IN (CASE1 AS 'CASE1',
                        CASE2 AS 'CASE2',
                        CASE3 AS 'CASE3'
                            )
    )
)SELECT WORKFLOW,SUM(VALUE) AS PASSED
FROM unpivot
GROUP BY WORKFLOW
ORDER BY 1;

--                                                     Puzzle #9  MATCHING SETS																															
WITH SUBq1 AS
    (SELECT  Employee_ID,
            COUNT(*) AS LicenseCount
    FROM    Licensed_emp
    GROUP BY Employee_ID),
SUBq2 AS
    (SELECT  a.employee_id AS employee_id,
            b.employee_id AS employee_id2,
            COUNT(*) AS LicenseCountCombo
    FROM    Licensed_emp a INNER JOIN
            Licensed_emp b ON a.License = b.License
    WHERE   a.employee_id <> b.employee_id
    GROUP BY a.employee_id, b.employee_id)
SELECT  a.EMPLOYEE_ID, a.EMPLOYEE_ID2, a.LicenseCountCombo
FROM    SUBq2 a 
    INNER JOIN SUBq1 b 
        ON  a.LicenseCountCombo = b.LicenseCount AND a.EMPLOYEE_ID <> b.EMPLOYEE_ID; 

--                                                     Puzzle #16 RECIPROCALS

SELECT PLAYERA,PLAYERB,SUM(SCORE) FROM (
    SELECT
            (CASE WHEN PlayerA <= PlayerB THEN PlayerA ELSE PlayerB END) PlayerA,
            (CASE WHEN PlayerA <= PlayerB THEN PlayerB ELSE PlayerA END) PlayerB,
            Score
    FROM  PlayerScores
) GROUP BY PLAYERA, PLAYERB;
