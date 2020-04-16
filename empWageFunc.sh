#!/bin/bash -x
isAttended=1;
salary=0;
count=0;
hours=0;
rate=70;
workingDays=20;
workingHours=100;
isPartTime=1;
isFullTime=2;
isAbscent=0;
#to check attendance
##for ((i=1;i<=workingDays;i++))
function getWorkingHours(){
	 case $1 in
         $isPartTime)
				echo 4;
            ;;
         $isFullTime)
            echo 8;
            ;;
         $isAbscent)
				echo 0;
            ;;
   esac

}
while [ $hours -lt $workingHours ] && [  $count -lt $workingDays ]
do
 	empCheck=$((RANDOM%3));
	empHours="$( getWorkingHours $empCheck )";
	hours=$((hours+empHours));
	salary=$((salary+empHours*rate));
	if [ ! $hours -eq 0 ]
	then
	count=$((count+1));
	fi		
done
echo "Employee was present for $count days";
echo "Salary earned is $salary";
echo "totalHours=$hours";
