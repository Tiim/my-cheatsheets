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
* Delete all unused data: 
```
docker system prune
docker volumes prune
docker images prune
```
## Volumes

* List all volumes: `docker volume ls`
* Inspect specific volume: `docker run --rm -i -v=VOLUMENAME:/tmp/volume:ro busybox sh`
* Copy file from volume to host: 
```sh
export VOLUME=backups
export FILE=backup/2019-08-26_08_00_00.gz
docker run --rm -i -v=$VOLUMENAME:/volume:ro -v=$(pwd):/output busybox cp /volume/$FILE /output
```


## Troubleshooting

`ERROR: readlink /var/lib/docker/overlay2: invalid argument`

Possibly a corrupted image: run `docker rmi $(docker images -q)` to delete all images

`Port already in use`

Restart docker, restart windows
