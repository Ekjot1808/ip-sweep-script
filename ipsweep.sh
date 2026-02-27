#!/bin/bash 

if [ -z "$1" ]
then 
    echo "You forgot an IP address"
    echo "Syntax: ./ipsweep.sh 192.168.1"
else
    for ip in $(seq 1 254); do 
        (
        ping -c 1 -W 1 $1.$ip > /dev/null 2>&1 && echo "$1.$ip is up"
        ) &
    done
    wait
fi
