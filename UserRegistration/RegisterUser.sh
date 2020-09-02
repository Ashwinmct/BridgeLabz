#!/bin/bash -x

white_space=" ";

function getName()
{
	name=$white_space;
	local name_position="$1";
	local pattern="^[[:upper:]][a-z]{2,}"
	read -p "Enter $name_position Name " name;
	if [[ $name =~ $pattern ]]
	then
		return;
	else
		printf "Entered $name is in invalid format for the $name_position name, \n Kindly enter again ";
		getName $name_position;
	fi

}

function getEMailId()
{	emailid=$white_space;
	local email_pattern="^[0-9A-Za-z]+([.+_-][[:alnum:]])*[@][[:alnum:]]+[.][[:alpha:]]{2,4}([.][[:alpha:]]{2})*$"
	read -p "Enter your emailid " emailid;
	if [[ $emailid =~ $email_pattern ]]
	then
		return;
	else
		printf "Entered emailid is in invalid format ,\n Kindly enter again"
		getEMailId;
	fi

}

function getMobileNumber()
{	mobile_number=$white_space;
	local pattern="^[0-9]{2,3}[[:space:]][1-9][0-9]{9}$";
	read -p "Enter your mobile number with country code " mobile_number;
	if [[ $mobile_number =~ $pattern ]]
	then
		return;
	else
		printf "\nEnter valid MobileNumber"
		getMobileNumber;
	fi;
}

function setPassWord()
{
	local pattern_length=".{8,}";
	local pattern_caps="*[[:upper:]]*";
	local pattern_digits="*[[:digit:]]*";
	local pattern_chars="^.*([!@#$%^&*-_]{1}).*$"
	read -p "Enter your password " password;
	if [[ $password =~ $pattern_length ]] && [[ "$password" == $pattern_caps ]] && [[ "$password" == $pattern_digits ]] && [[ "$password" =~ $pattern_chars ]]
	then
		return;
	else
		printf "\nPassword Invalid Enter again"
		setPassWord;
	fi;
}

getName "first"
first_name=$name;
getName "last"
last_name=$name;
getEMailId;
getMobileNumber;
setPassWord;

echo "First Name=$first_name"
echo "Last Name=$last_name";
echo "Email id=$emailid";
echo "Mobile Number=$mobile_number";
