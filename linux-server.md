# Linux Server Setup

https://www.scaleway.com/en/docs/create-and-connect-to-your-server/

```sh
# Scaleway specific load ssh keys
mkdir /etc/init/
echo manual > /etc/init/ssh-keys.override
```

## Init

```sh
apt-get update
apt-get upgrade
```

## Adding new user

https://www.digitalocean.com/community/tutorials/how-to-create-a-sudo-user-on-ubuntu-quickstart

```sh
adduser tim

# add to sudo group
usermod -aG sudo tim

# test sudo
su - tim
sudo echo hallo

# if sudo not installed
apt install sudo
# overwrite sudoers file
```

## SSH keys

https://www.digitalocean.com/community/tutorials/how-to-set-up-ssh-keys-on-ubuntu-1604

```sh
# on your local machiene
ssh-copy-id tim@remote_host

# test key based login
ssh tim@remote_host
```

## Diable password on server

```sh
sudo nano /etc/ssh/sshd_config

## For all users
# set to
...
PasswordAuthentication no
...

## For all users except root
# set to
...
Match User !root
    PasswordAuthentication no
...

# restart ssh server
sudo systemctl restart ssh

# test new connection
```

## Run sudo without password (optional)

https://phpraxis.wordpress.com/2016/09/27/enable-sudo-without-password-in-ubuntudebian/

```sh
sudo visudo

# at the end add line
tim     ALL=(ALL) NOPASSWD:ALL

# check if it worked
sudo echo hallo
```

## Install Docker

https://www.scaleway.com/en/docs/how-to-install-docker-community-edition-ubuntu-bionic-beaver/

```sh
# remove old version
sudo apt-get remove docker docker-engine docker.io

# HTTPS for docker repository
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common

# Add Docker’s official SSH key to apt
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# verify the fingerprint of the key (9DC8 5822 9FC7 DD38 854A E2D8 8D81 803C 0EBF CD88), by looking at the last 8 characters
sudo apt-key fingerprint 0EBFCD88

# Add the repository for the stable version of Docker. For a x86_64 based server, use the following command
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

#Update the apt packet cache
sudo apt-get update

# Install the latest version of Docker
sudo apt-get install docker-ce

# Verify that Docker has been installed by running the Hello World container
sudo docker run hello-world

# Create the docker group.
sudo groupadd docker

# Add your user to the docker group.
sudo usermod -aG docker $USER

# logout
exit

#Verify that you can run docker commands without sudo by downloading a test-image and running it in a container
docker run hello-world

# Run docker on startup
sudo systemctl enable docker
```

## Install Exoframe

https://github.com/exoframejs/exoframe/blob/master/docs/ServerInstallation.md
https://github.com/exoframejs/exoframe/blob/master/docs/ServerConfiguration.md


```sh
export EXO_PRIVATE_KEY=<private key>

docker run -d \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v /var/exoframe:/root/.exoframe \
  -v /home/tim/.ssh/authorized_keys:/root/.ssh/authorized_keys:ro \
  -e EXO_PRIVATE_KEY=$EXO_PRIVATE_KEY \
  --label traefik.backend=exoframe-server \
  --label traefik.frontend.rule=Host:exo.tiimb.work \
  --restart always \
  --name exoframe-server \
  exoframe/server
  
  
# edit server.config.yml
vim /var/exoframe/server.config.yml
```
