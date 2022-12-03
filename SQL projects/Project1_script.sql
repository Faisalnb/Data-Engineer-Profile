
-- 1) Write a query in SQL to find all the information of the nurses who are yet to be registered. 
select * from nurse
where REGISTERED='f';

-- 2) Write a query in SQL to find the name of the nurse who are the head of their department.
select name from nurse
where POSITION='Head Nurse';

-- 3) Write a query in SQL to obtain the name of the physicians who are the head of each department.
select NAME from physician p
where exists (
    select 'head' from department d
    where p.EMPLOYEEID	= d.head);
    
-- 4)Write a query in SQL to count the number of patients who taken appointment with at least one physician.
select count(distinct(PATIENT))
from appointment;

-- 5)Write a query in SQL to find the floor and block where the room number 212 belongs to.
select BLOCKFLOOR,BLOCKCODE
from room
where ROOMNUMBER=212;

-- 6)Write a query in SQL to count the number available rooms
select count(*)
from room 
where not UNAVAILABLE='t';

-- 7)Write a query in SQL to count the number of unavailable rooms.
select count(*)
from room 
where  UNAVAILABLE='t';

-- 8)Write a query in SQL to obtain the name of the physician and the departments they are affiliated with. 
select p.name,a.DEPARTMENT from affiliated_with a
    right outer join physician p
        on a.PHYSICIAN=p.EMPLOYEEID;
        
-- 9)Write a query in SQL to obtain the name of the physicians who are trained for a special treatement.
select p.name from physician p
where exists (
    select 'treatment' from trained_in t
    where p.EMPLOYEEID=t.PHYSICIAN);
    
-- 10)Write a query in SQL to obtain the name of the physicians with department who are yet to be affiliated.
select p.name,a.DEPARTMENT from affiliated_with a
    inner join physician p
        on a.PRIMARYAFFILIATION='f' and a.PHYSICIAN=p.EMPLOYEEID  ;

-- 11)Write a query in SQL to obtain the name of the physicians who are not a specialized physician.
select p.name from physician p
where not exists (
    select 'treatment' from trained_in t
    where p.EMPLOYEEID=t.PHYSICIAN);
	
-- 12)Write a query in SQL to obtain the name of the patients with their physicians by whom they got their preliminary treatement. 
select p1.name as "Patient_name", p2.name as "Physician_name" from patient p1
    inner join physician p2
        on p1.pcp=p2.employeeid;
        
-- 13)Write a query in SQL to find the name of the patients and the number of physicians they have taken appointment.
with app_data AS (
select PATIENT,count(PHYSICIAN) as "No. of appointments" from appointment a
group by PATIENT)
select p.name as "Name of Patient",app_data.*  from app_data
    join patient p
     on app_data.patient=p.ssn;

-- 14)Write a query in SQL to count number of unique patients who got an appointment for examination room C. 
select distinct (count(PATIENT)) "Appointment Count in C room" from appointment
where EXAMINATIONROOM='C';

-- 15)Write a query in SQL to find the name of the patients and the number of the room where they have to go for their treatment. 
select p.name as "Patient Name", s.room from patient p
    join stay s
        on p.ssn=s.PATIENT;
        
-- 16)Write a query in SQL to find the name of the nurses and the room scheduled, where they will assist the physicians.
with t1 as (
select * from undergoes u
    join nurse n
        on u.INGNURSE=n.EMPLOYEEID),
t2 as (
select * from nurse n
    join on_call o
        on n.EMPLOYEEID=o.NURSE),
t3 as (
select * from on_call o
    join room r
        on o.BLOCKKFLOOR=r.BLOCKFLOOR and o.BLOCKCODE=r.BLOCKCODE)
select distinct t1.name as "Nurse Name",t3.ROOMNUMBER from t1
join t2 using (EMPLOYEEID) join t3 using(NURSE)
order by 2;
        
-- 17)Write a query in SQL to find the name of the patients who taken the appointment on the 25th of April at 10 am, and also display their physician, assisting nurses and room no.
with t1 as (select * from nurse n
    join appointment a
        on START_DT='25/4/2008' and n.EMPLOYEEID=a.PREPNURSE),
t2 as (select * from physician p
    join appointment a
        on a.PHYSICIAN=p.EMPLOYEEID),
t3 as (select * from patient p1
    join appointment a
        on a.PATIENT=p1.ssn)
select t1.name as "Nurse Name", t2.name as "Physician Name", t3.name as "Patient Name"
from t1 join t2 using(APPOINTMENTID)
 join t3 using (APPOINTMENTID);

-- 18)Write a query in SQL to find the name of patients and their physicians who does not require any assistance of a nurse.
with t1 as(
select * from patient p
    join undergoes u
        on  p.SSN=u.PATIENT),
t2 as (
select * from physician p1
    join undergoes u
        on p1.EMPLOYEEID=u.PHYSICIANASSIT)
select distinct t1.name as "Patient Name", t2.name as "Physician Name"
from t1 join t2 using (PROCEDURES)
where t2.INGNURSE is NULL;

-- 19)Write a query in SQL to find the name of the patients, their treating physicians and medication
with t1 as (select * from MEDICATION m
    join prescribes a
        on  m.code=a.MEDICATION),
t2 as (select * from physician p
    join prescribes a
        on a.PHYSICIAN=p.EMPLOYEEID),
t3 as (select * from patient p1
    join prescribes a
        on a.PATIENT=p1.ssn)
select  t3.name as "Patient Name",t2.name as "Physician Name",t1.name as "Medication Name"
from t1 join t2 using(APPOINTMENT)
 join t3 using (APPOINTMENT);
 
-- 20)Write a query in SQL to find the name of the patients who taken an advanced appointment, and also display their physicians and medication.
with t1 as (select * from MEDICATION m
    join prescribes a
        on a.APPOINTMENT is not null and  m.code=a.MEDICATION),
t2 as (select * from physician p
    join prescribes a
        on a.PHYSICIAN=p.EMPLOYEEID),
t3 as (select * from patient p1
    join prescribes a
        on a.PATIENT=p1.ssn)
select  t3.name as "Patient Name",t2.name as "Physician Name",t1.name as "Medication Name"
from t1 join t2 using(APPOINTMENT)
 join t3 using (APPOINTMENT);
 
-- 21)Write a query in SQL to find the name and medication for those patients who did not take any appointment.
with t1 as (select * from MEDICATION m
    join prescribes a
        on a.APPOINTMENT is  null and  m.code=a.MEDICATION),
t2 as (select * from physician p
    join prescribes a
        on a.APPOINTMENT is  null and a.PHYSICIAN=p.EMPLOYEEID),
t3 as (select * from patient p1
    join prescribes a
        on a.APPOINTMENT is  null and a.PATIENT=p1.ssn)
select  t3.name as "Patient Name",t2.name as "Physician Name",t1.name as "Medication Name"
from t1 join t2 using(APPOINTMENT)
 join t3 using (APPOINTMENT);


-- 22)Write a query in SQL to count the number of available rooms in each block.  
select distinct blockcode, sum( case when  UNAVAILABLE='f' then 1 else 0 end * 1) 
    over( partition by BLOCKCODE) as "Available room count"
from room order by 1;

-- 23)Write a query in SQL to count the number of available rooms in each floor.
select distinct BLOCKFLOOR, sum( case when  UNAVAILABLE='f' then 1 else 0 end * 1) 
    over( partition by BLOCKFLOOR) as "Available room count"
from room order by 1;

-- 24)Write a query in SQL to count the number of available rooms for each block in each floor. 
select distinct BLOCKFLOOR,BLOCKCODE, sum( case when  UNAVAILABLE='f' then 1 else 0 end * 1) 
    over( partition by BLOCKFLOOR,BLOCKCODE) as "Available room per floor,block"
from room order by 1,2;

-- 25)Write a query in SQL to count the number of unavailable rooms for each block in each floor. 
select distinct BLOCKFLOOR,BLOCKCODE, sum( case when  UNAVAILABLE='t' then 1 else 0 end * 1) 
    over( partition by BLOCKFLOOR,BLOCKCODE) as "Available room per floor,block"
from room order by 1,2;

-- 26)Write a query in SQL to find out the floor where the maximum no of rooms are available. 
select  BLOCKFLOOR,dense_rank() over (order by "Available room count" desc)
from (
  select distinct BLOCKFLOOR,sum( case when  UNAVAILABLE='f' then 1 else 0 end * 1) 
      over( partition by BLOCKFLOOR) as "Available room count"
  from room q
)order by 2;

-- 27)Write a query in SQL to find out the floor where the minimum no of rooms are available
select  BLOCKFLOOR,dense_rank() over (order by "Available room count" desc)
from (
  select distinct BLOCKFLOOR,sum( case when  UNAVAILABLE='f' then 1 else 0 end * 1) 
      over( partition by BLOCKFLOOR) as "Available room count"
  from room q
)order by 2;


-- 28)Write a query in SQL to obtain the name of the patients, their block, floor, and room number where they are admitted. 
with t1 as(
select * from stay s
    join patient p
        on  s.PATIENT=p.ssn),
t2 as (
select * from stay s
    join room r
        on s.ROOM=r.ROOMNUMBER)
select t1.name as "Patient Name",t2.BLOCKcode, t2.BLOCKFLOOR ,t2.ROOMNUMBER
from t1 join t2 using (STAYID);

-- 29)Write a query in SQL to obtain the nurses and the block where they are booked for attending the patients on call.
with t1 as (select * from nurse n
    join undergoes u
        on n.EMPLOYEEID=u.INGNURSE),
t2 as (select * from stay s
    join undergoes u
        on s.stayid=u.stay),
t3 as (select * from stay s
    join room r
        on s.ROOM=r.ROOMNUMBER)
select distinct t1.name as "Nurse Name",t3.BLOCKCODE
from t1 join t2 using(stay)
 join t3 using (room);

-- 30)Write a query in SQL to make a report which will show -
-- a) name of the patient,
-- b) name of the physician who is treating him or her,
-- c) name of the nurse who is attending him or her,
-- d) which treatement is going on to the patient,
-- e) the date of release,
-- f) in which room the patient has admitted and which floor and block the room belongs to respectively.  

select distinct p.name as "Patient Name", p1.name as "Physician Name", n.name as "Nurse Name", p3.name as "Treatment name", s.END_TIME as "Discharge date", 
    s.room||' '||r.blockfloor||' '||r.blockcode as "Room details"
from patient P
    join undergoes u 
        on p.ssn=u.patient
    join physician p1
        on u.PHYSICIANASSIT=p1.employeeid
    join undergoes u
        on u.PHYSICIANASSIT=p1.employeeid
    join nurse n
        on u.ingnurse=n.employeeid
    join undergoes u
        on u.ingnurse=n.employeeid
    join procedure p3
        on u.PROCEDURES=p3.code
    join undergoes U
        on u.PROCEDURES=p3.code
    join stay s
        on u.stay=s.stayid
    join room r
        on s.room=r.roomnumber;
   
-- 31) Write a SQL query to obtain the names of all the physicians performed a medical procedure but they are not ceritifed to perform. 
select p.name as "Physician's Names" from physician p
where not exists(
    select 'PHYSICIAN' from trained_in t
    where p.EMPLOYEEID=t.PHYSICIAN);

-- 32)Write a query in SQL to obtain the names of all the physicians, their procedure, date when the procedure was carried out and name of the patient on which procedure have been carried out but those physicians are not cetified for that procedure.
with not_tr as (
    select * from undergoes u
    where (PHYSICIANASSIT,Procedures) not in(
        select physician,treatment
        from TRAINED_IN t
        where t.physician=u.PHYSICIANASSIT)
)select p.name,not_tr.* from physician p
    join not_tr 
        on p.EMPLOYEEID=not_tr.PHYSICIANASSIT;

-- 33) Write a query in SQL to obtain the name and position of all physicians who completed a medical procedure with certification after the date of expiration of their certificate. 
with after_exp_tr as (
    select * from undergoes u
    where PHYSICIANASSIT in (
        select physician
        from TRAINED_IN t
        where u.dates>=t.CERTIFICATIONEXPIRES))
select p.name,p.POSITION from physician p
    join after_exp_tr 
        on p.EMPLOYEEID=after_exp_tr.PHYSICIANASSIT;

-- 34) Write a query in SQL to obtain the name of all those physicians who completed a medical procedure with certification after the date of expiration of their certificate, their position, procedure they have done, date of procedure, name of the patient on which the procedure had been applied and the date when the certification expired.
with after_exp_tr as (
    select * from undergoes u
    where PHYSICIANASSIT in (
        select physician
        from TRAINED_IN t
        where u.dates>=t.CERTIFICATIONEXPIRES))
select p.name as "Physician Name",p.POSITION,p1.name as "Patient Name",after_exp_tr.* from physician p
    join after_exp_tr 
        on p.EMPLOYEEID=after_exp_tr.PHYSICIANASSIT
    join patient p1
        on p1.ssn=after_exp_tr.PATIENT;

-- 35) Write a query in SQL to obtain the names of all the nurses who have ever been on call for room 122. 
with call_details as(
select * from on_call o
where (BLOCKKFLOOR,BLOCKCODE) in (
    select BLOCKFLOOR,BLOCKCODE 
    from room r
    where r.roomnumber =122 and o.BLOCKKFLOOR=r.BLOCKFLOOR and o.BLOCKCODE=r.BLOCKCODE))
select name from nurse n 
 join call_details 
    on n.employeeid=call_details.nurse;

-- 36) Write a query in SQL to Obtain the names of all patients who has been prescribed some medication by his/her physician who has carried out primary care and the name of that physician.  
with t1 as (
select * from patient p
    join prescribes m
        on p.ssn=m.patient),
t2 as (
select * from physician p
    join prescribes m
        on p.employeeid=m.physician)
select distinct t1.name as "Patient Name", t2.name as "Physician Name" 
from t1 join t2 using (physician); 

-- 37) Write a query in SQL to obtain the names of all patients who has been undergone a procedure costing more than $5,000 and the name of that physician who has carried out primary care.
with cost_details as (
select * from undergoes u
where exists (
    select 'code' from procedure p
    where p.cost>5000 and p.code=u.procedures))
select p.name as "Patient Name" from patient p
    join cost_details c
        on p.ssn=c.PATIENT;
    
-- 38)Write a query in SQL to Obtain the names of all patients who had at least two appointment where the nurse who prepped the appointment was a registered nurse and the physician who has carried out primary care. 
with patient_details as (
select patient,count(*) from appointment a
where PREPNURSE in (
    select employeeid from nurse n 
    where REGISTERED='t' and n.employeeid= a.prepnurse)
group by PATIENT 
having count(*) >= 2)
select p.name as "Patient Name",p1.name as "Physician Name" from patient_details 
    join appointment a1 on  patient_details.patient=a1.patient
    join patient p on a1.patient=p.ssn
    join physician p1 on a1.physician=p1.employeeid;


--- 39) Write a query in SQL to Obtain the names of all patients whose primary care is taken by a physician who is not the head of any department and name of that physician along with their primary care physician.
with NOT_head as (
select * from physician p
where not exists (
    select 'head' from department d
    where p.EMPLOYEEID=d.head)),
pat_details as (
select * from patient p1
where exists(
    select 'empid' from physician p2
    where p1.pcp=p2.EMPLOYEEID))
select NOT_head.name as "Physicians Name", pat_details.name as "Patients name"
 from not_head join pat_details on employeeid=pcp;
