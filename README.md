# Docker deployer

Docker image to use Deployer (Deployment tool for PHP) without the need to have PHP on your host.

See [Deployer.org](https://deployer.org/)

On GitHub : [deployphp/deployer](https://github.com/deployphp/deployer)

## How to use
[See on Docker Hub](https://hub.docker.com/r/drixs6o9/docker-deployer/)
``` bash
# To run "dep"
$ docker run --rm -ti -v $PWD:/app drixs6o9/docker-deployer:latest
# To run "dep init"
$ docker run --rm -ti -v $PWD:/app drixs6o9/docker-deployer:latest init
# To run "dep deploy" with SSH Agent Forwarding
$ docker run --rm -ti -v $PWD:/app -v $(dirname $SSH_AUTH_SOCK):$(dirname $SSH_AUTH_SOCK) -e SSH_AUTH_SOCK=$SSH_AUTH_SOCK drixs6o9/docker-deployer:latest deploy
```

## Alias
Now just add an alias to use it more simply (in your ~/.bash_aliases for example)
``` bash
alias dep="docker run --rm -ti -v $PWD:/app drixs6o9/docker-deployer:latest"
# Or
alias dep="docker run --rm -ti -v $PWD:/app -v $(dirname $SSH_AUTH_SOCK):$(dirname $SSH_AUTH_SOCK) -e SSH_AUTH_SOCK=$SSH_AUTH_SOCK drixs6o9/docker-deployer:latest"
```

## Github Actions
You can use this docker image in docker actions.
```yaml
- name: Deploy to prod server
  uses: drixs6o9/docker-deployer@master
  with:
    args: deploy prod
   env:
    SSH_PRIVATE_KEY: ${{ secrets.PRIVATE_KEY }}
```
***/!\ Be aware in your deployer configuration you have to disable multiplexing.***

## Build arguments

Argument         | Default value
:--------------: | :-----------:
DEPLOYER_VERSION | 6.0.4

## Credits
Based on [omouren's idea](https://github.com/omouren/docker-deployer)
