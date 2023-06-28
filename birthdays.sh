#!/bin/bash
<<<<<<< HEAD
echo " "
echo -e "		\e[32m<<< BIRTHDAYS >>>\e[0m\n"
echo -e ">>> Enter the day <<<\n"
read -p '>> ' dd
echo -e "\n>>> Enter the month <<<\n"
read -p '>> ' mm
echo -e "\n>>> Enter the year <<<\n"
=======
echo -e "\n\e[34m<<< BIRTHDAYS >>>\e[0m\n"
echo -- Enter the day --
read -p '>> ' dd
echo -- Enter the month --
read -p '>> ' mm
echo -- Enter the year --
>>>>>>> e1210498b7f528a49e9bccc7c218b2938a46dea1
read -p '>> ' yy
if [[ $mm =~ ^[0-9]{1}$ ]]
then
	mm="0$mm"
fi
echo -e "\n\e[32m<<< You was born in [$dd/$mm/$yy] >>>\e[0m\n"
birthday="$yy-$mm-$dd"
curr=$(date +%s%3N)
milliseconds=$(date -d "$birthday" +%s%3N)
milliseconds=$(echo "$curr - $milliseconds" | bc)
days=$(echo "($milliseconds / 86400000)" | bc)
years=$(echo "$days / 365.25" | bc)
months=$(echo "(($days - ($years * 365.25)) / 30.44)" | bc)
days_remaining=$(echo "(($days - ($years * 365.25)) % 30.44)" | bc)
int=$(echo "$days_remaining" | awk '{printf("%d\n",$0)}')
<<<<<<< HEAD
#echo -e "\e[35m<<< Your age is $years year(s) & $months month(s) & $int day(s) >>>\e[0m\n"
=======
int=$(echo "($int -2)" | bc)
echo -e ">>> Your age is $years year(s) & $months month(s) & $int day(s) <<<\n"
>>>>>>> e1210498b7f528a49e9bccc7c218b2938a46dea1
current_year=$(date +%Y)
next_berthday=$(date -d "$mm/$dd/$current_year" +%s)
if [[ $next_birthday -lt $(date +%s) ]]; then
	next_birthday=$(date -d "$mm/$dd/$((current_year +1))" +%s)
fi
the_next=$((next_birthday * 1000 - $(date +%s%3N)))
next_days=$(echo "($the_next / 86400000)" | bc)
next_years=$(echo "$next_days / 365.25" | bc)
next_days_remaining=$(echo "(($next_days - ($next_years * 365.25)) % 30.44)" | bc)
next_months=$(echo "(($next_days - ($next_years * 365.25)) / 30.44)" | bc)
next_days_remaining_int=$(echo "$next_days_remaining" | awk '{printf("%d\n",$0)}')
weeks=$(echo "($next_months / 7)" | bc)
<<<<<<< HEAD
current_date=$(date +%d%m%Y)
birth_date=$dd$mm$current_year
if [ $current_date -eq $birth_date ]
then
	echo -e "\e[42m<<< Your age is $years years >>>\e[0m\n"
	echo -e "	\e[32mHappy , Birthday..!\e[0m\n"
else
	echo -e "\e[36m<<< Your age is $years year(s) & $months month(s) & $int day(s) >>>\e[0m\n"
	echo -e "\e[32mYour next birthday after $next_months month(s) & $weeks week(s) & $next_days_remaining_int day(s)\e[0m\n"
fi
=======
echo -e ">>> Your next birthday after $next_months month(s) & $weeks week(s) & $next_days_remaining_int day(s) <<<<\n"
>>>>>>> e1210498b7f528a49e9bccc7c218b2938a46dea1
