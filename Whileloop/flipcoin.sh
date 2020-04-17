#!/bin/bash -x
##flip coin for either head or tail wins 11 times
limit=11;
heads=0;
tails=0;
isHead=1;
while [ $heads -lt $limit ] && [ $tails -lt $limit ]
do
	flip=$((RANDOM%2));
	if [ $flip -eq $isHead ]
	then
		heads=$((heads+1));
	else
		tails=$((tails+1));
	fi;
done
echo "Heads=$heads Tails=$tails";
