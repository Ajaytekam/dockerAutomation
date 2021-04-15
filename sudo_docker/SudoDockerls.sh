dockerls() {
    rdkr=(`sudo docker ps --format '{{.Names}}'`)
    for var in "${rdkr[@]}"
    do
        printf "\033[0;33m[*] \033[0;36m%-20s\033[0m" $var 
        dkrIP=(`sudo docker inspect -f "{{ .NetworkSettings.IPAddress }}" $var`)
        echo -e "[\033[0;32m$dkrIP\033[0m]"
    done
}

