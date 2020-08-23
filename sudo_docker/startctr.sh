# StartCtr for sudoer docker
# you can also use `sudo -K` to drop the cached auth at the end of the script
startctr() {
    if [ -z "$1" ]
    then
		echo -e "\n\tUsage : startctr <container_name> [OPTION]\n"
		echo -e "OPTION: '-sh' start bash shell\n"
		echo "[*] To start docker only use : "
		echo -e "   $ startctr <container_name>\n"
		echo "[*] To start docker with bash shell/OR shell on running container : "
		echo -e "   $ startctr <container_name> -sh\n"
		return
	fi

	# code for authentication
	sudo -v 
	if [ $? -ne 0 ]
	then
		echo "\e[31m[!] Authentication Error\e[0m"
		echo "!Please Enter sudo password"
		return
	fi

    # Check container exists or not
    flag=true
    rdkr=(`sudo docker ps -a --format '{{.Names}}'`)
    for var in "${rdkr[@]}"
    do
        if [ $1 == $var ]
        then
            flag=false
            break
        fi
    done
    if $flag
    then
        echo -e "\e[31m[!] ERROR: Container named \"$1\" does not Exists.\e[0m"
        echo -e "\e[31m[!] Please Check the Name Again.\e[0m"
        echo "Available Containers are : "
        echo "========================"
        for var in "${rdkr[@]}"
        do
            echo $var
        done
        echo "========================"
        return
    fi

    # check if container is currently running or not
    flag=false
    rdkr=(`sudo docker ps --format '{{.Names}}'`)
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
        echo "Container \"$1\" is already running."
    else
        sudo docker container start $1
        echo -e "\e[32m[+] SUCCESS: Container started Successfully.\e[0m"
    fi

    if [ -z $2 ]
    then
        return
    elif [ "$2" == "-sh" ]
    then
        sudo docker container exec -it $1 bash
    fi
}
