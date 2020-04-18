#!/bin/bash -x
#usecase1
read -p "Enter first number " a;
read -p "Enter Second number " b;
read -p "Enter Third Number "  c;

#dictionary to store file
declare -A results

#usecase 2
#To compute a+b*c
result1=$((a+b*c));
results["computation1"]=$result1;
#usecase 3
#To complete a*b+c
result2=$((a*b+c));
results["computation2"]=$result2;
#Usecase 4
#To complete  c+a/b
result3=`awk "BEGIN{print $((c+(a/b)))}"`;
results["computation3"]=$result3;
#Use case 5 
#To compute a%b+c
result4=$((a%(b+c)));
results["computation4"]=$result4;
#Usecase 6
#Adding result to dictionary

