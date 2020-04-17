#!/bin/bash -x
isAttended=1;
salary=0;
daysWorked=0;
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

function getEmpWage(){
	local empHr=$1;
	wage=$((empHr*rate));
	echo $wage;
}
while [ $hours -lt $workingHours ] && [  $daysWorked -lt $workingDays ]
do
 	empCheck=$((RANDOM%3));
	empHours="$( getWorkingHours $empCheck )";
	hours=$((hours+empHours));
	daysWorked=$((daysWorked+1));
	dailyWage[ $daysWorked ]="$( getEmpWage $empHours )";
done
salary=$((hours*rate));
echo "Employee was present for $count days";
echo "Salary earned is $salary";
echo "totalHours=$hours";
echo ${dailyWage[@]};
