#!/bin/bash -x
##to find enter the year
read -p "Enter the year " year;
if [ $((year%400)) -eq  0 ]
then
	printf "$year is a Leap year";
elif [ $((year%4)) -eq 0 ] && [ ! $((year%100)) -eq 0 ]
then
	printf "$year is a Leap year";
else
	printf "$year is not a Leap year";
fi
