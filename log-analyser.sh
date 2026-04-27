#!/bin/bash

##
## PERSONAL PROJECT, 2026
## nginx-log-analyser
## File description:
## log-analyser
##

log_file="nginx.log"

echo -e "Welcome to the Nginx log analyser !\n"
echo "Top 5 IP adresses with the most requests :"
TOP_5_IP=$(cat ${log_file} | awk '{print $1}' | sort | uniq -c | sort -k1 -n -r | head -5 | awk '{print $2 " - " $1 " requests"}')
echo -e "${TOP_5_IP}\n"
echo "Top 5 most requested paths :"
TOP_5_PH=$(cat ${log_file} | awk -F '"' '{print $2}' | awk '{print $2}' | sort | uniq -c | sort -k1 -n -r | head -5 | awk '{print $2 " - " $1 " requests"}')
echo -e "${TOP_5_PH}\n"
echo "Top 5 response status codes :"
TOP_5_ST=$(cat nginx.log | awk -F '"' '{print $3}'| awk '{print $1}' | sort | uniq -c | sort -nrk1 | head -5 | awk '{print $2 " - " $1 " requests" }')
echo -e "${TOP_5_ST}\n"
