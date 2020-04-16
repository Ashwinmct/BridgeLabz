#!/bin/bash -x
isAttended=1;
salary=0;
count=0;
hour=0;
rate=70;
workingDays=20;
wokingHours=100;
isPartTime=1;
isFullTime=2;
isAbscent=0;
#to check attendance
##for ((i=1;i<=workingDays;i++))
while [[ $hours -lt $workingHours  ||  $count -lt $workingDays ]]
do
 	empCheck=$((RANDOM%3));
	case $empCheck in
			$isPartTime)
				empHours=4;
				hours=$((hours+empHours));
				salary=$(($salary+($empHours*$rate)));
				count=$((count+1));
				;;
			$isFullTime)
				empHours=8;
				hours=$((hours+emphours));
				salary=$((salary+($empHours*$rate)));
				count=$((count++));
				;;
			$isAbscent)
      		 		;;
	esac
done
echo "Employee was present for $count days";
echo "Salary earned is $salary";
echo "totalHours=$hours";
