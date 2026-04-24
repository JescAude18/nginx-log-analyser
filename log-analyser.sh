#!/bin/bash

##
## PERSONAL PROJECT, 2026
## nginx-log-analyser
## File description:
## log-analyser
##

log_file="nginx.log"

echo -e "Welcome to the Nginx log analyser !\n"
echo -e "Top 5 IP adresses with the most requests :\n"
TOP_5_IP=$(cat ${log_file} | awk '{print $1}' | sort | uniq -c | sort -k1 -n -r | head -5 | awk '{print $2 " - " $1 " requests"}')
echo "${TOP_5_IP}"
