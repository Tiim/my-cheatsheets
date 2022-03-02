# Install Dev Env
## Install WSL

* [Guide](https://docs.microsoft.com/en-us/windows/wsl/install-win10)
* [Install Distro To Different Location](https://vpraharsha3.medium.com/installing-wsl-distro-to-a-different-custom-location-30d101f04113)


## Fonts

### Fira Code (has ligatures)

Install FiraCode

https://www.nerdfonts.com/font-downloads Fira code -> Fira Code Regular Nerd Font Complete Windows Compatible.ttf

## Setup SSH server

[Source](https://docs.microsoft.com/en-us/windows-server/administration/openssh/openssh_install_firstuse)

```powershell
# powershell as admin
Get-WindowsCapability -Online | Where-Object Name -like 'OpenSSH*'

# Install the OpenSSH Client
Add-WindowsCapability -Online -Name OpenSSH.Client~~~~0.0.1.0
# Install the OpenSSH Server
Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0

Start-Service sshd
Set-Service -Name sshd -StartupType 'Automatic'

# Confirm the Firewall rule is configured. It should be created automatically by setup. Run the following to verify
if (!(Get-NetFirewallRule -Name "OpenSSH-Server-In-TCP" -ErrorAction SilentlyContinue | Select-Object Name, Enabled)) {
    Write-Output "Firewall Rule 'OpenSSH-Server-In-TCP' does not exist, creating it..."
    New-NetFirewallRule -Name 'OpenSSH-Server-In-TCP' -DisplayName 'OpenSSH Server (sshd)' -Enabled True -Direction Inbound -Protocol TCP -Action Allow -LocalPort 22
} else {
    Write-Output "Firewall rule 'OpenSSH-Server-In-TCP' has been created and exists."
}

# Print domain name
Get-WmiObject -Namespace root\cimv2 -Class Win32_ComputerSystem | Select Name
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
## Bash

Install https://starship.rs/

append ath the end of .bashrc

```sh

export BROWSER=wslview

# reload zshrc
source ~/.bashrc
```

## Dotfiles
[Tutorial](https://www.atlassian.com/git/tutorials/dotfiles)
[Repo](https://github.com/Tiim/.dotfiles)

```
# Restore:
## Clone Dotfiles Repo
git clone --bare git@github.com:Tiim/.dotfiles.git $HOME/.dotfiles
## Add temporary alias
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no
## checkout dotfiles from repo
config checkout
## Reload .zshrc
source ~/.zshrc
```

### Nodejs

check links [here](https://github.com/nvm-sh/nvm#installation-and-update)

```sh
# nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash

nvm install --lts

npm i -g npm@latest

npm config set init-author-name Tim Bachmann
npm config set init-author-url https://tiim.ch/
npm config set init-license MIT
npm config set init-version 0.0.1
```

### Enable ssh in WSL

**TODO:** update this section to work in WSL 2
[WSL Issue](https://github.com/microsoft/WSL/issues/4150)

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

## Install Go

[Download Here](https://golang.org/dl/)

[Instructions Here](https://golang.org/doc/install)

```sh
cd /tmp/
# see newest version here:
# https://golang.org/dl/
export GOVERSION="1.17.1"
curl https://dl.google.com/go/go$GOVERSION.linux-amd64.tar.gz --output go$GOVERSION.linux-amd64.tar.gz

# clean old go install
rm -rf ~/.local/bin/go
tar -C ~/.local/bin -xzf go$GOVERSION.linux-amd64.tar.gz

# skip when updating go
echo 'export PATH=$PATH:~/.local/bin/go/bin' >> $HOME/.bashrc
rm go$GOVERSION.linux-amd64.tar.gz
cd -
```

## Install VS Code

Install Settings Sync Plugin

Github Token: `<create new>`

Gist-ID: `634f528526bd91a4d3d661561b6d0f83`

## Install TexLive

* Download tar: https://www.tug.org/texlive/acquire-netinstall.html (`wget <url>`)
* Extract tar: `tar xf install-tl-unx.tar.gz`
* `cd install-tl-*`
* remove old texlive: `rm -rf ~/.texlive`
* `TEXLIVE_INSTALL_PREFIX=~/.texlive ./install-tl`
* Add to ~/.zshrc: `export PATH=/home/tim/texlive/2020/bin/x86_64-linux:/home/tim/.local/bin:$PATH`

## Installed programs

```sh
sudo apt install \
	jq \
	zip \
	unzip
```
