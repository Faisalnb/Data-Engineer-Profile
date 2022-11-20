REM   Script: hospital DDL
REM   ok

CREATE TABLE Nurse( 
   employeeid INTEGER  NOT NULL  
  ,name       VARCHAR(15) NOT NULL 
  ,position   VARCHAR(10) NOT NULL 
  ,registered VARCHAR(1) NOT NULL 
  ,ssn        INTEGER  NOT NULL 
);

INSERT INTO Nurse(employeeid,name,position,registered,ssn)  
VALUES  
(101,'Carla Espinosa','Head Nurse','t',111111110);

INSERT INTO Nurse(employeeid,name,position,registered,ssn) VALUES(102,'Laverne Roberts','Nurse','t',222222220);

INSERT INTO Nurse(employeeid,name,position,registered,ssn) VALUES(103,'Paul Flowers','Nurse','f',333333330);

CREATE TABLE Physician( 
   employeeid INTEGER  NOT NULL  
  ,name       VARCHAR(17) NOT NULL 
  ,position   VARCHAR(28) NOT NULL 
  ,ssn        INTEGER  NOT NULL 
);

INSERT INTO Physician(employeeid,name,position,ssn)  
VALUES (1,'John Dorian','Staff Internist',111111111);

INSERT INTO Physician(employeeid,name,position,ssn)Values(2,'Elliot Reid','Attending Physician',222222222);

INSERT INTO Physician(employeeid,name,position,ssn) Values(3,'Christopher Turk','Surgical Attending Physician',333333333);

INSERT INTO Physician(employeeid,name,position,ssn)Values(4,'Percival Cox','Senior Attending Physician',444444444);

INSERT INTO Physician(employeeid,name,position,ssn)Values (5,'Bob Kelso','Head Chief of Medicine',555555555);

INSERT INTO Physician(employeeid,name,position,ssn)Values(6,'Todd Quinlan','Surgical Attending Physician',666666666);

INSERT INTO Physician(employeeid,name,position,ssn)Values(7,'John Wen','Surgical Attending Physician',777777777);

INSERT INTO Physician(employeeid,name,position,ssn)Values(8,'Keith Dudemeister','MD Resident',888888888);

INSERT INTO Physician(employeeid,name,position,ssn)Values(9,'Molly Clock','Attending Psychiatrist',999999999);

CREATE TABLE appointment( 
   appointmentid   INTEGER  NOT NULL  
  ,patient         INTEGER  NOT NULL 
  ,prepnurse       INTEGER  
  ,Physician       INTEGER  NOT NULL 
  ,start_dt        VARCHAR(9) NOT NULL 
  ,end_dt	        VARCHAR(9) NOT NULL 
  ,examinationroom VARCHAR(1) NOT NULL 
);

INSERT INTO appointment(appointmentid,patient,prepnurse,Physician,start_dt,end_dt,examinationroom) VALUES (13216584,100000001,101,1,'24/4/2008','24/4/2008','A');

  INSERT INTO appointment(appointmentid,patient,prepnurse,Physician,start_dt,end_dt,examinationroom) VALUES (26548913,100000002,101,2,'24/4/2008','24/4/2008','B');

  INSERT INTO appointment(appointmentid,patient,prepnurse,Physician,start_dt,end_dt,examinationroom) VALUES (36549879,100000001,102,1,'25/4/2008','25/4/2008','A');

  INSERT INTO appointment(appointmentid,patient,prepnurse,Physician,start_dt,end_dt,examinationroom) VALUES (46846589,100000004,103,4,'25/4/2008','25/4/2008','B');

  INSERT INTO appointment(appointmentid,patient,prepnurse,Physician,start_dt,end_dt,examinationroom) VALUES (59871321,100000004,NULL,4,'26/4/2008','26/4/2008','C');

  INSERT INTO appointment(appointmentid,patient,prepnurse,Physician,start_dt,end_dt,examinationroom) VALUES (69879231,100000003,103,2,'26/4/2008','26/4/2008','C');

  INSERT INTO appointment(appointmentid,patient,prepnurse,Physician,start_dt,end_dt,examinationroom) VALUES (76983231,100000001,NULL,3,'26/4/2008','26/4/2008','C');

  INSERT INTO appointment(appointmentid,patient,prepnurse,Physician,start_dt,end_dt,examinationroom) VALUES (86213939,100000004,102,9,'27/4/2008','21/4/2008','A');

  INSERT INTO appointment(appointmentid,patient,prepnurse,Physician,start_dt,end_dt,examinationroom) VALUES (93216548,100000002,101,2,'27/4/2008','27/4/2008','B');

CREATE TABLE room( 
   roomnumber  INTEGER  NOT NULL  
  ,roomtype    VARCHAR(6) NOT NULL 
  ,blockfloor  INTEGER  NOT NULL 
  ,blockcode   INTEGER  NOT NULL 
  ,unavailable VARCHAR(1) NOT NULL 
);

INSERT INTO room(roomnumber,roomtype,blockfloor,blockcode,unavailable) VALUES (101,'Single',1,1,'f');

 INSERT INTO room(roomnumber,roomtype,blockfloor,blockcode,unavailable) VALUES (102,'Single',1,1,'f');

 INSERT INTO room(roomnumber,roomtype,blockfloor,blockcode,unavailable) VALUES (103,'Single',1,1,'f');

 INSERT INTO room(roomnumber,roomtype,blockfloor,blockcode,unavailable) VALUES (111,'Single',1,2,'f');

 INSERT INTO room(roomnumber,roomtype,blockfloor,blockcode,unavailable) VALUES (112,'Single',1,2,'t');

 INSERT INTO room(roomnumber,roomtype,blockfloor,blockcode,unavailable) VALUES (113,'Single',1,2,'f');

 INSERT INTO room(roomnumber,roomtype,blockfloor,blockcode,unavailable) VALUES (121,'Single',1,3,'f');

 INSERT INTO room(roomnumber,roomtype,blockfloor,blockcode,unavailable) VALUES (122,'Single',1,3,'f');

 INSERT INTO room(roomnumber,roomtype,blockfloor,blockcode,unavailable) VALUES (123,'Single',1,3,'f');

 INSERT INTO room(roomnumber,roomtype,blockfloor,blockcode,unavailable) VALUES (201,'Single',2,1,'t');

 INSERT INTO room(roomnumber,roomtype,blockfloor,blockcode,unavailable) VALUES (202,'Single',2,1,'f');

 INSERT INTO room(roomnumber,roomtype,blockfloor,blockcode,unavailable) VALUES (203,'Single',2,1,'f');

 INSERT INTO room(roomnumber,roomtype,blockfloor,blockcode,unavailable) VALUES (211,'Single',2,2,'f');

 INSERT INTO room(roomnumber,roomtype,blockfloor,blockcode,unavailable) VALUES (212,'Single',2,2,'f');

 INSERT INTO room(roomnumber,roomtype,blockfloor,blockcode,unavailable) VALUES (213,'Single',2,2,'t');

 INSERT INTO room(roomnumber,roomtype,blockfloor,blockcode,unavailable) VALUES (221,'Single',2,3,'f');

 INSERT INTO room(roomnumber,roomtype,blockfloor,blockcode,unavailable) VALUES (222,'Single',2,3,'f');

 INSERT INTO room(roomnumber,roomtype,blockfloor,blockcode,unavailable) VALUES (223,'Single',2,3,'f');

 INSERT INTO room(roomnumber,roomtype,blockfloor,blockcode,unavailable) VALUES (301,'Single',3,1,'f');

 INSERT INTO room(roomnumber,roomtype,blockfloor,blockcode,unavailable) VALUES (302,'Single',3,1,'t');

 INSERT INTO room(roomnumber,roomtype,blockfloor,blockcode,unavailable) VALUES (303,'Single',3,1,'f');

 INSERT INTO room(roomnumber,roomtype,blockfloor,blockcode,unavailable) VALUES (311,'Single',3,2,'f');

 INSERT INTO room(roomnumber,roomtype,blockfloor,blockcode,unavailable) VALUES (312,'Single',3,2,'f');

 INSERT INTO room(roomnumber,roomtype,blockfloor,blockcode,unavailable) VALUES (313,'Single',3,2,'f');

 INSERT INTO room(roomnumber,roomtype,blockfloor,blockcode,unavailable) VALUES (321,'Single',3,3,'t');

 INSERT INTO room(roomnumber,roomtype,blockfloor,blockcode,unavailable) VALUES (322,'Single',3,3,'f');

 INSERT INTO room(roomnumber,roomtype,blockfloor,blockcode,unavailable) VALUES (323,'Single',3,3,'f');

 INSERT INTO room(roomnumber,roomtype,blockfloor,blockcode,unavailable) VALUES (401,'Single',4,1,'f');

 INSERT INTO room(roomnumber,roomtype,blockfloor,blockcode,unavailable) VALUES (402,'Single',4,1,'t');

 INSERT INTO room(roomnumber,roomtype,blockfloor,blockcode,unavailable) VALUES (403,'Single',4,1,'f');

 INSERT INTO room(roomnumber,roomtype,blockfloor,blockcode,unavailable) VALUES (411,'Single',4,2,'f');

 INSERT INTO room(roomnumber,roomtype,blockfloor,blockcode,unavailable) VALUES (412,'Single',4,2,'f');

 INSERT INTO room(roomnumber,roomtype,blockfloor,blockcode,unavailable) VALUES (413,'Single',4,2,'f');

 INSERT INTO room(roomnumber,roomtype,blockfloor,blockcode,unavailable) VALUES (421,'Single',4,3,'t');

 INSERT INTO room(roomnumber,roomtype,blockfloor,blockcode,unavailable) VALUES (422,'Single',4,3,'f');

 INSERT INTO room(roomnumber,roomtype,blockfloor,blockcode,unavailable) VALUES (423,'Single',4,3,'f');

CREATE TABLE procedure( 
   code INTEGER  NOT NULL  
  ,name VARCHAR(30) NOT NULL 
  ,cost INTEGER  NOT NULL 
);

INSERT INTO procedure(code,name,cost) VALUES (1,'Reverse Rhinopodoplasty',1500);

 INSERT INTO procedure(code,name,cost) VALUES (2,'Obtuse Pyloric Recombobulation',3750);

 INSERT INTO procedure(code,name,cost) VALUES (3,'Folded Demiophtalmectomy',4500);

 INSERT INTO procedure(code,name,cost) VALUES (4,'Complete Walletectomy',10000);

 INSERT INTO procedure(code,name,cost) VALUES (5,'Obfuscated Dermogastrotomy',4899);

 INSERT INTO procedure(code,name,cost) VALUES (6,'Reversible Pancreomyoplasty',5600);

 INSERT INTO procedure(code,name,cost) VALUES (7,'Follicular Demiectomy',25);

CREATE TABLE trained_in( 
   physician            INTEGER  NOT NULL  
  ,treatment            INTEGER  NOT NULL 
  ,certificationdate    varchar(10)  NOT NULL 
  ,certificationexpires varchar(10)  NOT NULL 
);

INSERT INTO trained_in(physician,treatment,certificationdate,certificationexpires) 
 VALUES (3,1,'1/1/2008','31/12/2008');

INSERT INTO trained_in(physician,treatment,certificationdate,certificationexpires) 
 VALUES (3,2,'1/1/2008','31/12/2008');

INSERT INTO trained_in(physician,treatment,certificationdate,certificationexpires) 
 VALUES (3,5,'1/1/2008','31/12/2008');

INSERT INTO trained_in(physician,treatment,certificationdate,certificationexpires) 
 VALUES (3,6,'1/1/2008','31/12/2008');

INSERT INTO trained_in(physician,treatment,certificationdate,certificationexpires) 
 VALUES (3,7,'1/1/2008','31/12/2008');

INSERT INTO trained_in(physician,treatment,certificationdate,certificationexpires) 
 VALUES (6,2,'1/1/2008','31/12/2008');

INSERT INTO trained_in(physician,treatment,certificationdate,certificationexpires) 
 VALUES (6,5,'1/1/2007','31/12/2007');

INSERT INTO trained_in(physician,treatment,certificationdate,certificationexpires) 
 VALUES (6,6,'1/1/2008','31/12/2008');

INSERT INTO trained_in(physician,treatment,certificationdate,certificationexpires) 
 VALUES (7,1,'1/1/2008','31/12/2008');

INSERT INTO trained_in(physician,treatment,certificationdate,certificationexpires) 
 VALUES (7,2,'1/1/2008','31/12/2008');

INSERT INTO trained_in(physician,treatment,certificationdate,certificationexpires) 
 VALUES (7,3,'1/1/2008','31/12/2008');

INSERT INTO trained_in(physician,treatment,certificationdate,certificationexpires) 
 VALUES (7,4,'1/1/2008','31/12/2008');

INSERT INTO trained_in(physician,treatment,certificationdate,certificationexpires) 
 VALUES (7,5,'1/1/2008','31/12/2008');

INSERT INTO trained_in(physician,treatment,certificationdate,certificationexpires) 
 VALUES (7,6,'1/1/2008','31/12/2008');

INSERT INTO trained_in(physician,treatment,certificationdate,certificationexpires) 
 VALUES (7,7,'1/1/2008','31/12/2008');

CREATE TABLE affiliated_with( 
   physician          INTEGER  NOT NULL  
  ,department         INTEGER  NOT NULL 
  ,primaryaffiliation VARCHAR(1) NOT NULL 
);

INSERT INTO affiliated_with(physician,department,primaryaffiliation)  
VALUES (1,1,'t');

INSERT INTO affiliated_with(physician,department,primaryaffiliation)  
VALUES (2,1,'t');

INSERT INTO affiliated_with(physician,department,primaryaffiliation)  
VALUES (3,1,'f');

INSERT INTO affiliated_with(physician,department,primaryaffiliation)  
VALUES (3,2,'t');

INSERT INTO affiliated_with(physician,department,primaryaffiliation)  
VALUES (4,1,'t');

INSERT INTO affiliated_with(physician,department,primaryaffiliation)  
VALUES (5,1,'t');

INSERT INTO affiliated_with(physician,department,primaryaffiliation)  
VALUES (6,2,'t');

INSERT INTO affiliated_with(physician,department,primaryaffiliation)  
VALUES (7,1,'f');

INSERT INTO affiliated_with(physician,department,primaryaffiliation)  
VALUES (7,2,'t');

INSERT INTO affiliated_with(physician,department,primaryaffiliation)  
VALUES (8,1,'t');

INSERT INTO affiliated_with(physician,department,primaryaffiliation)  
VALUES (9,3,'t');

CREATE TABLE Patient( 
   ssn         INTEGER  NOT NULL  
  ,name        VARCHAR(17) NOT NULL 
  ,address     VARCHAR(18) NOT NULL 
  ,phone       VARCHAR(9) NOT NULL 
  ,insuranceid INTEGER  NOT NULL 
  ,pcp         INTEGER  NOT NULL 
);

INSERT INTO Patient(ssn,name,address,phone,insuranceid,pcp) 
 VALUES (100000001,'John Smith','42 Foobar Lane','555-0256',68476213,1);

INSERT INTO Patient(ssn,name,address,phone,insuranceid,pcp) 
 VALUES(100000002,'Grace Ritchie','37 Snafu Drive','555-0512',36546321,2);

INSERT INTO Patient(ssn,name,address,phone,insuranceid,pcp) 
 VALUES(100000003,'Random J. Patient','101 Omgbbq Street','555-1204',65465421,2);

INSERT INTO Patient(ssn,name,address,phone,insuranceid,pcp) 
 VALUES(100000004,'Dennis Doe','1100 Foobaz Avenue','555-2048',68421879,3);

CREATE TABLE prescribes( 
   physician   INTEGER  NOT NULL  
  ,patient     INTEGER  NOT NULL 
  ,medication  INTEGER  NOT NULL 
  ,dates        VARCHAR(15) NOT NULL 
  ,appointment INTEGER  
  ,dose        INTEGER  NOT NULL 
);

INSERT INTO prescribes(physician,patient,medication,dates,appointment,dose)  
VALUES (1,100000001,1,'24/4/2008',13216584,5);

 INSERT INTO prescribes(physician,patient,medication,dates,appointment,dose)  
VALUES (9,100000004,2,'27/4/2008',86213939,10);

 INSERT INTO prescribes(physician,patient,medication,dates,appointment,dose)  
VALUES (9,100000004,2,'30/4/2008',NULL,5);

CREATE TABLE MEDICATION( 
   code        INTEGER  NOT NULL  
  ,name        VARCHAR(13) NOT NULL 
  ,brand       VARCHAR(23) 
  ,description VARCHAR(3) NOT NULL 
);

INSERT INTO MEDICATION(code,name,brand,description)  
VALUES (1,'Procrastin-X',NULL,'N/A');

INSERT INTO MEDICATION(code,name,brand,description)  
VALUES  (2,'Thesisin','Foo Labs','N/A');

INSERT INTO MEDICATION(code,name,brand,description)  
VALUES  (3,'Awakin','Bar Laboratories','N/A');

INSERT INTO MEDICATION(code,name,brand,description)  
VALUES  (4,'Crescavitin','Baz Industries','N/A');

INSERT INTO MEDICATION(code,name,brand,description)  
VALUES  (5,'Melioraurin','Snafu Pharmaceuticals','N/A');

CREATE TABLE on_call( 
   nurse       INTEGER  NOT NULL  
  ,blockkfloor INTEGER  NOT NULL 
  ,blockcode   INTEGER  NOT NULL 
  ,oncall      varchar(100)  NOT NULL 
  ,oncallend date not null 
);

INSERT INTO on_call(nurse,blockkfloor,blockcode,oncall,oncallend)  
VALUES (101,1,1,'4/11/2008',current_date);

INSERT INTO on_call(nurse,blockkfloor,blockcode,oncall,oncallend)  
VALUES (101,1,2,'4/11/2008',current_date);

INSERT INTO on_call(nurse,blockkfloor,blockcode,oncall,oncallend)  
VALUES (102,1,3,'4/11/2008',current_date);

INSERT INTO on_call(nurse,blockkfloor,blockcode,oncall,oncallend)  
VALUES (103,1,1,'4/11/2008',current_date);

INSERT INTO on_call(nurse,blockkfloor,blockcode,oncall,oncallend)  
VALUES (103,1,2,'4/11/2008',current_date);

INSERT INTO on_call(nurse,blockkfloor,blockcode,oncall,oncallend )  
VALUES (103,1,3,'4/11/2008',current_date);

CREATE TABLE Undergoes( 
   patient        INTEGER  NOT NULL  
  ,procedures      INTEGER  NOT NULL 
  ,stay           INTEGER  NOT NULL 
  ,dates           VARCHAR(9) NOT NULL 
  ,physicianassit INTEGER  NOT NULL 
  ,ingnurse       INTEGER  
);

INSERT INTO Undergoes(patient,procedures,stay,dates,physicianassit,ingnurse)  
VALUES (100000001,6,3215,'2/5/2008',3,101);

INSERT INTO Undergoes(patient,procedures,stay,dates,physicianassit,ingnurse)  
VALUES (100000001,2,3215,'3/5/2008',7,101);

INSERT INTO Undergoes(patient,procedures,stay,dates,physicianassit,ingnurse)  
VALUES (100000004,1,3217,'7/5/2008',3,102);

INSERT INTO Undergoes(patient,procedures,stay,dates,physicianassit,ingnurse)  
VALUES (100000004,5,3217,'9/5/2008',6,NULL);

INSERT INTO Undergoes(patient,procedures,stay,dates,physicianassit,ingnurse)  
VALUES (100000001,7,3217,'10/5/2008',7,101);

INSERT INTO Undergoes(patient,procedures,stay,dates,physicianassit,ingnurse)  
VALUES (100000004,4,3217,'13/5/2008',3,103);

create table block 
(blockfloor  integer , 
blockcode integer 
);

create table department 
(department_id int not null primary key, 
name VARCHAR(17) NOT NULL, 
head int not null);

insert into department  
values (1,'General Medicine', 4), 
(2,'Surgery',7), 
(3,'Psychiatry',9);

create table department 
(department_id int not null primary key, 
name VARCHAR(17) NOT NULL, 
head int not null);

insert into department  
values (1,'General Medicine', 4), 
(2,'Surgery',7), 
(3,'Psychiatry',9);

select * from department;

insert into department  
values (1,'General Medicine', 4), 
(2,'Surgery',7), 
(3,'Psychiatry',9);

insert into department  
values (1,'General Medicine', 4);

insert into department  
values (2,'Surgery',7),;

insert into department  
values (3,'Psychiatry',9);



insert into department  
values (1,'General Medicine', 4);

insert into department  
values (2,'Surgery',7);

insert into department  
values (3,'Psychiatry',9);

CREATE TABLE STAY( 
   stayid       INTEGER  NOT NULL PRIMARY KEY  
  ,patient_room VARCHAR(16) NOT NULL 
  ,start_time   VARCHAR(10)  NOT NULL 
  ,end_time     VARCHAR(10)  NOT NULL 
);

INSERT INTO STAY(stayid,patient_room,start_time,end_time)  
VALUES (3215,'100000001   111','1/5/2008','4/5/2008');

INSERT INTO STAY(stayid,patient_room,start_time,end_time)  
VALUES (3216,'100000003   123','3/5/2008','14/5/2008');

INSERT INTO STAY(stayid,patient_room,start_time,end_time)  
VALUES (3217,'100000004   112','2/5/2008','3/5/2008');

select * from physician;

select * from department;

select * from affiliated_with;

select * from procedure;

select * from trained_in;

select * from patient;

select * from nurse;

select * from appointment;

select * from medication;

select * from prescribes;

select * from block;

select * from room;

select * from on_call;

select * from stay;