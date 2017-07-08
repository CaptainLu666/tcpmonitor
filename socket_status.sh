#!/bin/bash

UrlFile="/opt/scripts/SOCKET.txt"
IFS=$'\n'

socket_discovery () {
    SOCKET_SITE=($(cat $UrlFile|grep -v "^#"))
    printf '{\n'
    printf '\t"data":[\n'
    num=${#SOCKET_SITE[@]}
    for socket in ${SOCKET_SITE[@]}
    do
        num=$(( $num - 1 ))
        ip=$(echo $socket|awk '{print $1}')
        port=$(echo $socket|awk '{print $2}')
        if [ $num -ne 0 ] ; then
            printf "\t\t{\"{#SOCKETIP}\":\"${ip}\",\"{#SOCKETPORT}\":\""${port}"\"},\n" 
        else
            printf "\t\t{\"{#SOCKETIP}\":\"${ip}\",\"{#SOCKETPORT}\":\""${port}"\"}\n" 
            printf '\t]\n'
            printf '}\n'
        fi
    done
}

socket_discovery
