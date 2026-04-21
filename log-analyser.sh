#!/bin/bash

##
## PERSONAL PROJECT, 2026
## nginx-log-analyser
## File description:
## log-analyser
##

log_file="nginx.log"

echo -e "Welcome to the Nginx log analyser !\n"
logs=$(cat ${log_file})
echo "Content = ${logs}"
