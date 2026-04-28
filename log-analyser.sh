#!/bin/bash

##
## PERSONAL PROJECT, 2026
## nginx-log-analyser
## File description:
## log-analyser
##

log_file="nginx.log"

if [[ -f ${log_file} && -r ${log_file} && -s ${log_file} ]]; then
    echo -e "\033[35m=============================== NGINX LOG ANALYSER ! ======================================="
    echo -e "Welcome ! This nginx log analyser displays statistics on the top 5 IP addresses, most "
    echo -e "requested paths, top response status codes, and top user agents of a nginx logs file."
    echo -e "Thanks for trying it ♥️ !"
    echo -e "============================================================================================\033[0m\n"

    # Top 5 IP adresses with the most requests
    echo -e "\033[42mTop 5 IP adresses with the most requests :\033[0m"
    TOP_5_IP=$(cat ${log_file} | awk '{print $1}' | sort | uniq -c | sort -k1 -n -r | head -5 | awk '{print $2 " - " $1 " requests"}')
    echo -e "${TOP_5_IP}\n"

    # Top 5 most requested paths
    echo -e "\033[43mTop 5 most requested paths :\033[0m"
    TOP_5_PH=$(cat ${log_file} | awk -F '"' '{print $2}' | awk '{print $2}' | sort | uniq -c | sort -k1 -n -r | head -5 | awk '{print $2 " - " $1 " requests"}')
    echo -e "${TOP_5_PH}\n"

    # Top 5 response status codes
    echo -e "\033[44mTop 5 response status codes :\033[0m"
    TOP_5_ST=$(cat nginx.log | awk -F '"' '{print $3}'| awk '{print $1}' | sort | uniq -c | sort -nrk1 | head -5 | awk '{print $2 " - " $1 " requests" }')
    echo -e "${TOP_5_ST}\n"

    # Top 5 user agents
    echo -e "\033[41mTop 5 user agents :\033[0m"
    TOP_5_UA=$(cat ${log_file} | awk -F '"' '{print $6}' | sort | uniq -c | sort -nrk1 | head -5 | awk '{print $2 " - " $1 " requests" }')
    echo "${TOP_5_UA}"
else
    echo -e "\033[31mThe nginx log file is missing or is empty or is unreadable !"
    echo -e "Place it in the same directory as the script and make sure "
    echo -e "it's non-empty and you have rigths to read it.\033[0m"
    exit 1
fi
