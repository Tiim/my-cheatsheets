# Docker

## Build & Run

* Build image: `docker build -t <tag> <path>`
* Run container: `docker run <image>`

## General
* List running containers: `docker ps`
* List all containers: `docer ps -a`
* Delete container `docker rm <container>`
* List all images `docker images`
* Delete image `docker image rm <image>`

## Cleanup

* Delete all stopped containers: `docker rm $(docker ps -a -q)`
* Delete all images: `docker rmi $(docker images -q)` 
