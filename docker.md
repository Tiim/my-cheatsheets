# Docker

## General
* List running containers: `docker ps`
* List all containers: `docer ps -a`
* Delete container `docker rm <container>`
* List all images `docker images`
* Delete image `docker image rm <image>`

## Cleanup

* Delete all stopped containers: `docker rmi $(docker images -q)`
* Delete all images: `docker rmi $(docker images -q)` 
