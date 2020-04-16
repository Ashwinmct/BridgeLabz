#!/bin/bash -x
isPresent=1;
empHour=8
empRate=200;
empCheck=$((RANDOM%2));
if [ $empCheck -eq $isPresent ]
then
	echo "employee is present";
	salary=$(($empHour * $empRate));
else
	echo "employee is abscent";
	salary=0;
fi;
