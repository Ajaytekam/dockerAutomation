#!/bin/bash
# code for stopctr
# Check container is currently running or not
flag=false
rdkr=(`docker ps --format '{{.Names}}'`)


StopAllCT() {
	if [ ${#rdkr} -gt 0 ]
	then
		for x in "${rdkr[@]}"
		do
        	docker container stop $x 1> /dev/null
        	echo -e "\e[32m[+] ${x} \t: stopped Successfully.\e[0m"
		done
	else
		echo -e "\e[31m[!] Theres no running container at the moment.\e[0m"
	fi
}

ShowRunningCT() {
	if [ ${#rdkr} -gt 0 ]
	then
		echo "Currently runnig Containers are : "
		echo "========================"
		for x in "${rdkr[@]}"
		do
			echo "$x"
		done
		echo "========================"
	else
		echo -e "\e[31m[!] Theres no running container at the moment.\e[0m"
	fi
}

stopctr() {

    if [ -z "$1" ]
    then
        echo -e "\e[31m[!] ERROR: Argument not provided.\e[0m"
        echo -e "   Usage : stopctr <container_name>\n"
		echo -e "OPTION: '-l' list currently running containers"
		return
    elif [ "$1" == "-l" ]
	then 
		ShowRunningCT
		return
	elif [ "$1" == "-all" ]
	then
		StopAllCT
		return
	fi

    for var in "${rdkr[@]}"
    do
        if [ $1 == $var ]
        then
            flag=true
            break
        fi
    done

    if $flag
    then
        docker container stop $1
        echo -e "\e[32m[+] SUCCESS: Container stopped Successfully.\e[0m"
    else
        echo -e "\e[31m[!] ERROR: Theres no running container named \"$1\".\e[0m"
    	
	fi
}

stopctr $1
