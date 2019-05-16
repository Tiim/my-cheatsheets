# Linux Server Setup

https://www.scaleway.com/en/docs/create-and-connect-to-your-server/

```sh
# Scaleway specific load ssh keys
mkdir /etc/init/
echo manual > /etc/init/ssh-keys.override
```

## Adding new user


https://www.digitalocean.com/community/tutorials/how-to-create-a-sudo-user-on-ubuntu-quickstart
```
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

https://www.digitalocean.com/community/tutorials/how-to-set-up-ssh-keys-on-ubuntu-1604
## SSH keys
```
# on your local machiene
ssh-copy-id tim@remote_host

# test key based login
ssh tim@remote_host
```

## Diable password on server


```
sudo nano /etc/ssh/sshd_config

# set to
...
PasswordAuthentication no
...

# restart ssh server
sudo systemctl restart ssh

# test new connection
```

## Install Docker
https://www.scaleway.com/en/docs/how-to-install-docker-community-edition-ubuntu-bionic-beaver/
