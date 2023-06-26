#!/bin/bash
echo -e "\n\e[34m<<< BIRTHDAYS >>>\e[0m\n"
echo -- enter the day --
read -p '>> ' dd
echo -- enter the month --
read -p '>> ' mm
echo -- enter the year --
read -p '>> ' yy
echo -e "\n-- Your birthday [$dd/$mm/$yy] --"
birthday="$yy-$mm-$dd"
curr=$(date +%s%3N)
milliseconds=$(date -d "$birthday" +%s%3N)
milliseconds=$(echo "$curr - $milliseconds" | bc)
days=$(echo "($milliseconds / 86400000)" | bc)
years=$(echo "$days / 365.25" | bc)
months=$(echo "(($days - ($years * 365.25)) / 30.44)" | bc)
echo " "
days_remaining=$(echo "(($days - ($years * 365.25)) % 30.44)" | bc)
int=$(echo "$days_remaining" | awk '{printf("%d\n",$0)}')
echo -e "<<< Your age is $years year(s) & $months month(s) & $int day(s) >>>\n"
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
echo -e "Your next birthday after $next_months month(s) & $weeks week(s) & $next_days_remaining_int day(s)\n"
