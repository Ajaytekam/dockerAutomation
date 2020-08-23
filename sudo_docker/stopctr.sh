# code for stopctr

stopctr() {
    if [ -z "$1" ]
    then
		echo -e "\n\tUsage : stopctr <container_name> [OPTION]\n"
		echo -e "OPTION:- \n"
		echo -e "[*] '-l' list currently running containers"
		echo -e "[*] '-all' stop all running containers"
		return
	fi

    # code for authentication
    ret=0 # useless command just for setting $? = 0
    sudo -v  
    if [ $? -ne 0 ] 
    then
        echo -e "\e[31m[!] Authentication Error\e[0m"
        echo "!Please Enter sudo password"
        return
    fi  

	# Check if any container is currently running or not
	flag=false
	rdkr=(`sudo docker ps --format '{{.Names}}'`)

    if [ "$1" == "-l" ]
	then 
		# code for list all running containers
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
		return
	elif [ "$1" == "-all" ]
	then
		# code to stop all running containers
		if [ ${#rdkr} -gt 0 ]
		then
			for x in "${rdkr[@]}"
			do
        		sudo docker container stop $x 1> /dev/null
        		echo -e "\e[32m[+] ${x} \t: stopped Successfully.\e[0m"
			done
		else
			echo -e "\e[31m[!] Theres no running container at the moment.\e[0m"
		fi	
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
        sudo docker container stop $1
        echo -e "\e[32m[+] SUCCESS: Container stopped Successfully.\e[0m"
    else
        echo -e "\e[31m[!] ERROR: Theres no running container named \"$1\".\e[0m"
    	
	fi
}
