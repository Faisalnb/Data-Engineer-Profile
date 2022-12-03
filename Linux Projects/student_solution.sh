
# Q1) Sort the Records according to the ascending order of admission Admision date
#!/bin/bash
ROUTE='/home/ec2-user/assignments'
FILE=${ROUTE}/student.txt
ORDEREDYEARS=`cat ${FILE}|cut -d ":" -f3|sort -nk1 -u`


for year in ${ORDEREDYEARS}
do
 grep -iw ${year} ${FILE}|sort -t":" -Mk4 |cat
done
# ------------------------------------------------------------------------------------
#Q2) Sort the Records acccording to Department and Course Name
#!/bin/bash
ROUTE='/home/ec2-user/assignments'
FILE=${ROUTE}/student.txt
ORDEREDDEPTS=`cat ${FILE}|cut -d ":" -f2|sort -k1 -u`

for dept in ${ORDEREDDEPTS}
do
 grep -iw ${dept} ${FILE}|sort -t":" -k5| cat
done

# ------------------------------------------------------------------------------------
#Q3) Sort the Records according to the Ascending order of Department and their Fees
#!/bin/bash
ROUTE='/home/ec2-user/assignments'
FILE=${ROUTE}/student.txt
ORDEREDDEPTS=`cat ${FILE}|cut -d ":" -f2|sort -k1 -u`


for dept in ${ORDEREDDEPTS}
do
 grep -iw ${dept} ${FILE}|sort -t":" |cat 
done
