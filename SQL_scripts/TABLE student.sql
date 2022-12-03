CREATE TABLE student(
    SNO NUMBER(3),
    MSQL NUMBER(3),
    MUNIX NUMBER(3),
    AVGE NUMBER(5,2)
);

INSERT INTO student VALUES (
    1,
    67,
    89,
    78
);

INSERT INTO student VALUES (
    1,
    65,
    90,
    77.5
);

SELECT * FROM student;

SNO	MSQL	MUNIX	AVGE
1	67	89	78
1	65	90	77.5

DROP TABLE student;
-- TABLE dropped.

SHOW RECYCLEBIN;
ORIGINAL NAME    RECYCLEBIN NAME                OBJECT TYPE  DROP TIME
---------------- ------------------------------ ------------ -------------------
STUDENT          BIN$huX0pO3KQ5OXWWoNgNWeMg==$0 TABLE        2022-10-17:15:49:34

 FLASHBACK TABLE STUDENT TO BEFORE DROP;
--  Flashback complete.

SHOW RECYCLEBIN;
ORIGINAL NAME    RECYCLEBIN NAME                OBJECT TYPE  DROP TIME
---------------- ------------------------------ ------------ -------------------

SELECT * FROM STUDENT;
SNO	MSQL	MUNIX	AVGE
1	67	89	78
1	65	90	77.5

TRUNCATE TABLE STUDENT;
-- TABLE truncated.


ROLLBACK;
-- Rollback complete.

DESC STUDENT;
---Name	Null?	Type
SNO		NUMBER(3)
MSQL		NUMBER(3)
MUNIX		NUMBER(3)
AVGE		NUMBER(5,2)

SELECT * FROM STUDENT;
-- no rows selected

