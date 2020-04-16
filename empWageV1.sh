#!/bin/bash -x
isPresent=1;
empCheck=$((RANDOM%2));
if [ $empCheck -eq $isPresent ]
then
	echo "employee is present";
else
	echo "employee is abscent";
fi;
