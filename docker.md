# Docker

## Build & Run

* Build image: `docker build -t <tag> <path>`
* Run container: `docker run --rm -p <host-port>:<container-port> <image>`
* Stop container: `docker stop <name>`

## Files

* Copy file from host to container: `docker cp foo.txt container_id:/foo.txt`
* Copy file from container to host: `docker cp container_id:/foo.txt foo.txt`

## General
* Run a shell inside the container: `docker exec -i -t container sh`
* Stop all running containers: `docker stop $(docker ps -q)`
* List running containers: `docker ps`
* List all containers: `docer ps -a`
* Delete container `docker rm <container>`
* List all images `docker images`
* Delete image `docker image rm <image>`

## Cleanup

* Delete all stopped containers: `docker rm $(docker ps -a -q)`
* Delete all images: `docker rmi $(docker images -q)` 
* Delete all unused data: `docker system prune`
