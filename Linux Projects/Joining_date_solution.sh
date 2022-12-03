# Q1. How to check substr.How to change case of Names?                                                                      
awk -F\, '{print toupper(substr($2,1,1)) tolower(substr($2,2)) }' Joining_date.txt

# Q2. How to display the records which are belongs to Department D003 and D006. 
awk -F, '{ if(NR==1 || $3=="D003"|| $3=="D004") {print $0} }' Joining_date.txt 

# Q3. Sort the data according to descending order of the Name               
cat dept_db|sed –n '2,$ p' | sort –t, -k2r 

# Q4. How to display the records of only department ID D002 along with Heading line.
awk -F, '{ if(NR==1 || $3=="D002") {print $0} }' Joining_date.txt 

# Q5. Display the records who were joined on the Mar-07
awk -F\, '$4~/Mar-07/{print $0}' Joining_date.txt  

# Q6. Display the records who joined on Mar-07 and Left the organisation on Apr-08. 
awk -F\, '$4~/Mar-07/&& $5~/Mar-08/{print $0}' Joining_date.txt 

# =========================================================================================
# Q7. Display the records according to the descending order of their salary. 
head -1 Joining_date.txt && sed -n '2,$ p' Joining_date.txt |sort -t, -k6 -rn 

#!/bin/bash 

# this script sorts data as per desc order of salary 
orderedSalary=`sed -n '2,$ p' Joining_date.txt|cut -d"," -f6|sort -rnu` 

for sal in ${orderedSalary} 
do 
    sed -n '2,$ p' Joining_date.txt|grep -iw "${sal}" 
done 
# =========================================================================================

# Q8. Display the count of Dept D004 records 
awk -F, '{if($3=="D004"){print $0}}' Joining_date.txt |wc -l 

# Q9. Display the Average salary of Department D003.
awk -F\, -v sum=0 -v count=0 '{if($3=="D003"){sum=sum+$6;count=count+1}} END{print sum/count}' Joining_date.txt 

# =========================================================================================
# Q10. Display the Total salary of Department D003 and Total salary of Department D004 using one command line.  

#!/bin/bash 

awk -F, -v sum=0 -v sum1=0 '{ 
    if($3=="D003"){ 
        sum=sum+$6 
    }  
    else if ($3=="D004") { 
        sum1=sum1+$6 
    } 
} END{ 
    print sum,sum1 
}' 
# =========================================================================================

# Q11. Display the records from line number 4 to 8. 
sed -n '4,8 p' Joining_date.txt 

# Q12. Write command to collect all the department Ids and display all the departments as D001,D002,D003,D004,D006,D007
sed -n '2,$ p'  Joining_date.txt | cut -d"," -f3| tr '\n' ',' 

# =========================================================================================
# Q13. Write shell script for find the count of rows department wise. For Example 
#      D001 : 1 
#      D002 : 3 
#      D003 : 2 
#      ...... 
#      ....... 
#      And so on 
    
cut -d',' -f3 < Joining_date.txt | sort |uniq -c |awk 'BEGIN {FS=" "} {print $2,":",$1}' |sed '$ d'

#!/bin/bash 

deptlist=`cut -d, -f3 Joining_date.txt|sed -n '2,$ p' | sort -u` 

for dept in ${deptlist} 
do
  echo "${dept} :" `grep -iw "$dept" Joining_date.txt|awk -F\, '{if ($3="$dept") print $0|"wc -l"}'` 
done 
# =========================================================================================

# Q14. From the above data set display the data in below format. This concept in SQL is called list aggregate. 
# D001 : Richa  

# D002 : Nitin, ADITYA, Anjali  

# D003 : AJIT, Usha  

# D004 : SHAVARI, Rohan  

# D006 : Yash  

# D007 : Nalini 

#!/bin/bash  

deptlist=`cut -d, -f3 Joining_date.txt|sed -n '2,$ p' | sort -u`  

for dept in ${deptlist}
do
  echo "${dept} :" `grep -iw "$dept" Joining_date.txt|awk -F\, '{if ($3="$dept") print $2}'` 
done 
# =========================================================================================
 
# Q15. Display the M_ID, DEPT_ID, NAME and SALARY of employees having salary ranges from 85000 and 120000. 
head –1 Joining_date.txt && awk -F, '( 85000 <= $6 && $6 <= 120000 ){$4=$5="";print}' Joining_date.txt 
 
