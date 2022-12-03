
#1.Write a script to check a given number is +ve or -ve.
#!/bin/bash
# check the number is positive or negative
echo "Enter a number to check if pos or neg"
read N

ABS_VAL=`echo -$N | awk 'function abs(x){return (x < 0) ? -x : x;} {print abs($0)}'`

if [ $N == $ABS_VAL ]
then
 echo "positive"
else
 echo "negative"
fi
#---------------------------------------------------------------------------------------------------
#2. Write a script to check a given number is a odd number or even number.
#!/bin/bash
read -p "enter a number: " N
if [ ${N} = 0 ]
 then 
        echo "${N} is special"
elif [ $(( ${N} % 2 )) -eq 0 ]
 then
        echo "${N} is even"
 else    
        echo "${N} is odd"
fi
#---------------------------------------------------------------------------------------------------
#3.Write a script to check a given number is divisible by 5.
#!/bin/bash
# Divisibility by 5

echo "Enter a number"
read A
RES=$(( A % 5 ))

if [ $RES -eq 0 ]
then
 echo "the number is divisible by 5"
else
 echo "the number is not divisible by 5"
fi
#---------------------------------------------------------------------------------------------------
#4.Write a script to check a given number is divisible by 3 and 2. 
#!/bin/bash
# Divisibility by 3,2

echo "Enter a number"
read A
RES3=$(( A % 3 ))
RES2=$(( A % 3 ))

if [ $RES3 -eq 0 ] && [ $RES2 -eq 0 ]
then
 echo "the number is divisible by 3 and 2"
else
 echo "the number is not divisible by 3 and 2"
fi

#---------------------------------------------------------------------------------------------------
#5.Write a script to check the entered number is prime
#!/bin/bash

COUNT=0
D=1
echo "Enter a number: " 
read N
while [ ${D} -le ${N}  ]
do 
 if [ $(( $N % $D )) -eq 0 ] 
 then
  COUNT=$(( ${COUNT} + 1 ))
 fi
 D=$(( ${D} + 1 ))
done

if [ ${COUNT} -eq 2 ]
then
 echo "this is prime"
else
 echo "not prime"
fi

