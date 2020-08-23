# Sudoer Scripts 

automation scripts for docker which run with sudo creds.  

**Scrits :**  

**[startctr.sh](startctr.sh)** : Start the container.   
**[stopctr.sh](stopctr.sh)** : Stop running container.   

## Deployment :  

Copy the content of **[deploy.sh](deploy.sh)**,  at end of your `.bashrc` file. `.bashrc` file generally located on `$USER` directory.  
 
### Some aliases :

* List running containers :
``` 
alias "dockerls=sudo docker ps --format '{{.Names}}'"
```
* List all containers :
``` 
alias "dockerlsa=sudo docker ps -a --format '{{.Names}}'"
```

add it at end of `.bashrc` file.

