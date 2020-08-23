# My Docker container automation Shell scripts

## Update :  Scripts for sudoer docker [Sudoer_Scripts](sudo_docker/README.md)
I wrote some shell scripts to start and stop the docker containers.   

**[startctr.sh](startctr.sh)** : Start the container. 
```console
	Usage : startctr <container_name> [OPTION]

OPTION: '-sh' start bash shell

[*] To start docker only use : 
   $ startctr <container_name>

[*] To start docker with bash shell/OR shell on running container : 
   $ startctr <container_name> -sh
```
**[stopctr.sh](stopctr.sh)** : Stop running container.
```console
	Usage : stopctr <container_name> [OPTION]

OPTION:- 

[*] '-l' list currently running containers
[*] '-all' stop all running containers
```
## Deployment : 

Copy the content of **[deploy.sh](deploy.sh)**,  at end of your `.bashrc` file. `.bashrc` file generally located on `$USER` directory.

**Usage :** Click on the video to play it.
    
[![asciicast](https://asciinema.org/a/276346.svg)](https://asciinema.org/a/276346)

### Some aliases :

* List running containers :
``` 
alias "dockerls=docker ps --format '{{.Names}}'"
```
* List all containers :
``` 
alias "dockerlsa=docker ps -a --format '{{.Names}}'"
```

add it at end of `.bashrc` file.
