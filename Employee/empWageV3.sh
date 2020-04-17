#!/bin/bash -x
isParTime=1;
isFullTime=2;
isAbscent=0;
empRate=200;
empCheck=$((RANDOM%3));
if [ $empCheck -eq $isPartTime ]
then
	empHour=4;
elif [ $empCheck -eq $isFullTime ]
then
	empHour=8;
else
	empHour=0;
fi;
salary=$((empRate*empHour));
