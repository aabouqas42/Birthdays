#!/bin/bash
echo " "
echo -e "		\e[32m<<< BIRTHDAYS >>>\e[0m\n"
echo -e "  >>> Enter the day <<<\n"
read -p '  >> ' dd
echo -e "\n  >>> Enter the month <<<\n"
read -p '  >> ' mm
echo -e "\n  >>> Enter the year <<<\n"
read -p '  >> ' yy
if [[ $mm =~ ^[0-9]{1}$ ]]
then
	mm="0$mm"
fi
if [[ $dd =~ ^[0-9]{1}$ ]]
then
	dd="0$dd"
fi
echo -e "\n        \e[32m<<< You was born in [$dd/$mm/$yy] >>>\e[0m\n"
birthday="$yy-$mm-$dd"
dayOfweek=$(date -d "$birthday" +%A)
curr=$(date +%s%3N)
milliseconds=$(date -d "$birthday" +%s%3N)
milliseconds=$(echo "$curr - $milliseconds" | bc)
days=$(echo "($milliseconds / 86400000)" | bc)
years=$(echo "$days / 365.25" | bc)
months=$(echo "(($days - ($years * 365.25)) / 30.44)" | bc)
days_remaining=$(echo "(($days - ($years * 365.25)) % 30.44)" | bc)
int=$(echo "$days_remaining" | awk '{printf("%d\n",$0)}')
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
current_date=$(date +%d%m%Y)
birth_date=$dd$mm$current_year
if [ $current_date -eq $birth_date ]
then
	echo -e "	     \e[42m<<< Your age is $years years >>>\e[0m\n"
	echo -e "	           \e[32mHappy , Birthday..!\e[0m\n"
else
	echo -e "\e[36m<<< Your age is $years year(s) & $months month(s) & $int day(s) you was born on $dayOfweek>>>\e[0m\n"
	echo -e "\e[32m<<< Your next birthday after $next_months month(s) & $weeks week(s) & $next_days_remaining_int day(s) >>>\e[0m\n"
fi
