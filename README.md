# My Docker container automation Shell scripts

I wrote some shell scripts to start and stop the docker containers.   

**[startctr.sh](startctr.sh)** : Start the docker. 

**[stopctr.sh](stopctr.sh)** : Stop running docker.

## Deployment : 

Copy the content of **[deploy.sh](deploy.sh)**,  at end of your `.bashrc` file. `.bashrc` file generally located on `$USER` directory.

**Usage :** Click on the video to play it.
    
[![asciicast](https://asciinema.org/a/276346.svg)](https://asciinema.org/a/276346)

### Some aliases :

* List running container :
``` 
alias "dockerls=docker ps --format '{{.Names}}'"
```

add it at end of `.bashrc` file.
