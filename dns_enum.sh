#! /bin/bash
#Author : Arms
#variables
day=$(date +%A)
#colours
red=`tput setaf 1`
green=`tput setaf 2`
blue=`tput setaf 4`
reset=`tput sgr0`
bold=`tput bold`
greetings()
{
echo -e "Welcome $USER! Today is $day.\nYou are using $SHELL shell for script execution."
}
#Enumerating records
dns_enum()
{
for rec in A AAAA CNAME MX TXT; do
	    echo " ${red}${bold}$rec record of $dom${reset}"
        dig $dom $rec +short 
	    echo "${reset}${red}${bold}____________"
done
}

menu()
{
echo "${red}${bold}1 : Check IPv4"
echo "${red}${bold}2 : Check IPv6"
echo "${red}${bold}3 : Check Mail Servers"
echo "${red}${bold}4 : Check Text records"
echo "${red}${bold}5 : Check CNAME"
echo "${red}${bold}6 : Check All"
read -p "Select a option : " opt
}

case_stat()
{
    case $opt in
   	1 )
	IPv4=$(dig $dom A +short)
	echo -e " ${red} IPv4 of $dom is:-${reset} \n${green}$IPv4${reset}";;
	2 )
	IPv6=$(dig $dom AAAA +short)
	echo -e " ${red} IPv6 of $dom is:-${reset} \n${green}$IPv6${reset}";;
	3 )
	mx=$(dig $dom MX +short)
	echo " ${red} Mail Servers of $dom are:-${reset};"
	echo -e "\n${green}$mx${reset}";;
	4 )
	txt=$(dig $dom TXT +short)
	echo " ${red} Text records of $dom are:-${reset};"
	echo -e "\n${green}$txt${reset}";;
	5 )
	cname=$(dig $dom CNAME +short)
	echo " ${red} CNAME of $dom are:-${reset};"
	echo -e "\n${green}$cname${reset}";;
	6 )
	dns_enum;;
    esac

}

#main script

greetings
menu
read -p  "Enter a domain : " dom
case_stat