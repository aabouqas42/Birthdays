#!/bin/bash
echo " "
echo ***Age Calucator***
echo " "
echo -- enter the day --
read dd
echo -- enter the month --
read mm
echo -- enter the year --
read yy
echo " "
echo -- Your birthday [$dd/$mm/$yy] --
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
echo "***Your age is $years year(s) & $months month(s) & $int day(s)***"
echo " "
