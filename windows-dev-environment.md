# Install Dev Env
## Install WSL

[Guide](http://wsl-guide.org/en/latest/installation.html)

## Install Hyper

https://hyper.is/



```js
{
  // set hack font
  fontFamily: 'Hack, Menlo, "DejaVu Sans Mono", Consolas, "Lucida Console", monospace',
  
  //Set git bash
  shell: 'C:\\Program Files\\Git\\git-cmd.exe',
  shellArgs: ['--command=usr/bin/bash.exe', '-l', '-i'],
  
  // set theme
  plugins: [
	  'hyper-material-theme'
  ],
}
```



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
public key: ~/.ssh/id_rsa.pub
private key ~/.ssh/id_rsa
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
```

Download and install Hack font on windows

https://github.com/source-foundry/Hack

add `Hack` in front of the font array of ~/.hyper.js on windows


### Nodejs

check linke [here](https://github.com/nvm-sh/nvm#installation-and-update)

```sh
# nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
#remove all files from bash:
rm ~/.bash_profile ~/.profile ~/.bashrc

nvm install --lts

npm i -g npm
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
sudo apt-get install -y docker-ce

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


## Install VS Code

Install Settings Sync Plugin

Github Token: `<create new>`

Gist-ID: `634f528526bd91a4d3d661561b6d0f83`
