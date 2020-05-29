# Install Dev Env
## Install WSL

[Guide](https://docs.microsoft.com/en-us/windows/wsl/install-win10)



## Fonts

### Hack
Download and install Hack font on windows

https://github.com/source-foundry/Hack

add `Hack` in front of the font array of ~/.hyper.js on windows

### Cascadia Code

Install Cascadia Code

https://github.com/microsoft/cascadia-code/releases

### Fira Code (has ligatures)

Install FiraCode

https://github.com/tonsky/FiraCode/releases

## Setup WSL

```sh
sudo apt update
sudo apt upgrade
```

### Git

```sh
sudo apt install git vim

git config --global user.name "Tiim"
git config --global user.email "tim.bachmann96@gmail.com"
git config --global core.editor "vim"

# either create new rsa key
ssh-keygen -t rsa -b 4096 -C "tim.bachmann96@gmail.com"
# add to github
cat ~/.ssh/id_rsa.pub

# or use the key in keepass
mkdir ~/.ssh
chmod 700 ~/.ssh
# public key: ~/.ssh/id_rsa.pub
vim ~/.ssh/id_rsa.pub
# private key ~/.ssh/id_rsa
vim ~/.ssh/id_rsa
# Check if files are valid
ssh-keygen -l -f ~/.ssh/id_rsa.pub
ssh-keygen -l -f ~/.ssh/id_rsa

chmod 644 ~/.ssh/id_rsa.pub
chmod 600 ~/.ssh/id_rsa
```
### Zsh

```sh
sudo apt install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

change theme to agnoster

```sh
vim ~/.zshrc

set THEME="agnoster"

# Reload zshrc
source ~/.zshrc
```

append ath the end of .zshrc

```sh
# make readable ls colors
LS_COLORS="ow=01;36;40" && export LS_COLORS 

# change promt context and prompt dir 
prompt_context() {
  prompt_segment black default  "★  "
}

prompt_dir() {
  prompt_segment blue black "${PWD##*/}"
}

# reload zshrc
source ~/.zshrc
```

Set oh my zsh [plugins](https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins)

```
plugins=(
cargo
command-not-found
compleat
docker
docker-compose
docker-machine
git
git-extras
github
gitignore
golang
history
node
npm
npx
nvm
rust
rustup
safe-paste
vscode
)


# reload zshrc
source ~/.zshrc
```


### Nodejs

check links [here](https://github.com/nvm-sh/nvm#installation-and-update)

```sh
# nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
#remove all files from bash:
rm ~/.bash_profile ~/.profile ~/.bashrc

nvm install --lts

npm i -g npm

npm config set init-author-name Tim Bachmann
npm config set init-author-url https://tiim.ch/
npm config set init-license MIT
npm config set init-version 0.0.1
```

### Enable ssh in WSL

```sh
# Uninstall and reinstall ssh-server
sudo apt purge openssh-server
sudo apt install openssh-server

# add authorized_keys
cd ~
cat .ssh/id_rsa.pub > .ssh/authorized_keys
chmod 700 .ssh
chmod 600 .ssh/authorized_keys

# Enable ssh deamon without sudo:
sudo visudo

#### After %sudo  ALL=(ALL:ALL) ALL
# Allow ssh daemon to be started without password
%sudo ALL=NOPASSWD: /usr/sbin/sshd
####

# Edit /etc/ssh/sshd_config and set the settings below
sudo vim /etc/ssh/sshd_config

####
Port 2222
PasswordAuthentication no
####

sudo service ssh --full-restart
```

Add sshd to task scheduler as described here:
https://www.illuminiastudios.com/dev-diaries/ssh-on-windows-subsystem-for-linux/

* Aufgabenplanung
* Einfache Aufgabe erstellen (rechte sidebar)
	* Name: `Start Bash SSH Server`
	* Desc: `Start the SSH server inside WSL`
* Trigger: Beim Start
* Program starten
	* Script: `%windir%\System32\bash.exe`
	* Arguments: `-c "sudo /etc/init.d/ssh start"`

Personaly SSH

```
# vim ~/.ssh/config
# chmod 700 ~/.ssh/config

Host home
	HostName burgnas.synology.me
	Port 45693
	User tim
```

### Docker Cli

[Documentation](https://nickjanetakis.com/blog/setting-up-docker-for-windows-and-wsl-to-work-flawlessly)

Set host docker to accept connections without tls

```sh
# Update the apt package list.
sudo apt-get update -y

# Install Docker's package dependencies.
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

# Download and add Docker's official public PGP key.
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Verify the fingerprint.
sudo apt-key fingerprint 0EBFCD88

# Add the `stable` channel's Docker upstream repository.
#
# If you want to live on the edge, you can change "stable" below to "test" or
# "nightly". I highly recommend sticking with stable!
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# Update the apt package list (for the new apt repo).
sudo apt-get update -y

# Install the latest version of Docker CE.
sudo apt-get install -y docker-ce # or docker.io if docker-ce doesn't work
# https://stackoverflow.com/questions/61401626/docker-installation-failed-on-ubuntu-20-04-ltsvmware

# Allow your user to access the Docker CLI without needing root access.
sudo usermod -aG docker $USER
```

Add to .zshrc
```sh
export PATH="$PATH:$HOME/.local/bin"
export DOCKER_HOST=tcp://localhost:2375
```

Change WSL mounting pint

```sh
sudo nano /etc/wsl.conf

# Now make it look like this and save the file when you're done:
[automount]
root = /
options = "metadata"
```


#### Docker Compose

[See Here](https://github.com/docker/compose/releases)

```sh
curl -L https://github.com/docker/compose/releases/download/<VERSION>/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
```

## Install Go

[Download Here](https://golang.org/dl/)

[Instructions Here](https://golang.org/doc/install)

```sh
cd /tmp/
# see newest version here:
# https://golang.org/dl/
export GOVERSION="1.12.9"
curl https://dl.google.com/go/go$GOVERSION.linux-amd64.tar.gz --output go$GOVERSION.linux-amd64.tar.gz

# clean old go install
sudo rm -rf /usr/local/go

sudo tar -C /usr/local -xzf go$GOVERSION.linux-amd64.tar.gz

# skip when updating go
echo 'export PATH=$PATH:/usr/local/go/bin' >> $HOME/.zshrc
rm go$GOVERSION.linux-amd64.tar.gz
cd -
```

## Install VS Code

Install Settings Sync Plugin

Github Token: `<create new>`

Gist-ID: `634f528526bd91a4d3d661561b6d0f83`

## Installed programs

```sh
sudo apt install \
	texlive \
	texlive-lang-german \
	texlive-latex-extra \
	texlive-extra-utils
```
