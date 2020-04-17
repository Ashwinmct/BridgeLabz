#!/bin/bash -x
isPartTime=1;
isFullTime=2;
isAbsent=0;
empRate=100;
randomCheck=$((RANDOM%3));

case $randomCheck in
	$isPartime)
		empHours=4;
		;;
	$isFullTime)
		empHours=8;
		;;
	$isAbsent)
		empHours=0;
		;;
esac
    salary=$((empHours*empRate));
