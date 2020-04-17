#!/bin/bash -x
isAttended=1;
salary=0;
count=0;
rate=70;
workingDays=20;

isPartTime=1;
isFullTime=2;
isAbscent=0
#to check attendance
for ((i=1;i<=workingDays;i++))
do
 	empCheck=$((RANDOM%3));
	case $empCheck in
			$isPartTime)
				empHours=4;
				salary=$(($salary+($empHours*$rate)));
				count=$((count+1));
				;;
			$isFullTime)
				empHours=8;
				salary=$((salary+($empHours*$rate)));
				count=$((count+1));
				;;
			$isAbscent)
				echo "Abscent at $i";
      		 		;;
	esac
done
echo "Employee was present for $count days";
echo "Salary earned is $salary";
