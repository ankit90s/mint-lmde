#!/bin/bash

## check for sudo/root
if ! [ $(id -u) = 0 ]; then
  echo -e "\e[1;31m Please run as sudo or root \e[0m"
  exit 1
fi

clear

# Get username
username=$(id -u -n 1000)
builddr=$(pwd)

# Download Managers
echo -e "\e[1;32m Installing download managers \e[0m"
apt install -y curl wget axel aria2

echo -e "\e[1;32m Installed exa \e[0m"
apt install -y exa 

echo -e "\e[1;32m Installed nvidia-detect \e[0m"
apt install -y nvidia-detect

echo -e "\e[1;32m Installed zip unzip 7zip \e[0m"
apt install -y zip unzip 7zip

echo -e "\e[1;32m Installed mpv \e[0m"
apt install -y mpv mpv-mpris

echo -e "\e[1;32m Installed conky nefetch htop \e[0m"
apt install -y conky neofetch htop

# Applications and utilities
echo -e "\e[1;32m Installing apps and utilities \e[0m"
apt install -y git pip ranger cmatrix espeak ncdu translate-shell rsync kdeconnect gpick

# yt-dlp
echo -e "\e[1;32m Installing yt-dlp \e[0m"
apt install -y yt-dlp -t bookworm-backports

# sensors
echo -e "\e[1;32m Installing sensors \e[0m"
apt install -y lm-sensors

# fast-cli
echo -e "\e[1;32m Installing fast-cli for Internet speed test \e[0m"
wget https://github.com/ddo/fast/releases/download/v0.0.4/fast_linux_amd64 -O fast
install fast /usr/local/bin
rm fast

echo -e "\e[1;32m Installed default terminal as alacritty \e[0m"
apt install -y alacritty
update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /usr/bin/alacritty 200 && update-alternatives --set x-terminal-emulator /usr/bin/alacritty

# Goolge Chrome
# echo -e "\e[1;32m Installing google chrome \e[0m"
# wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
# apt install -y ./google-chrome-stable_current_amd64.deb
# rm google-chrome-stable_current_amd64.deb

# Text editor
echo -e "\e[1;32m Installing geany, micro and neovim \e[0m"
apt install -y geany micro neovim
git clone https://github.com/VundleVim/Vundle.vim.git /home/$username/.vim/bundle/Vundle.vim

echo -e "\e[1;32m Installed starship shell prompt \e[0m"
wget https://github.com/starship/starship/releases/latest/download/starship-x86_64-unknown-linux-musl.tar.gz
tar -xvzf starship-x86_64-unknown-linux-musl.tar.gz
mv starship /usr/local/bin
rm starship-x86_64-unknown-linux-musl.tar.gz

echo -e "\e[1;32m Installed pfetch \e[0m"
git clone https://github.com/dylanaraps/pfetch.git
cd pfetch
install pfetch /usr/local/bin
cd ..
rm -rf pfetch

# ani-cli
echo -e "\e[1;32m Installing ani-cli for anime lovers \e[0m"
apt install -y fzf
git clone "https://github.com/pystardust/ani-cli.git"
install ani-cli/ani-cli /usr/local/bin
rm -rf ani-cli

echo -e "\e[1;32m Copying xresources file \e[0m"
cp Xresources /home/$username/.Xresources

echo -e "\e[1;32m Installing bashrc and bash aliases \e[0m"
cp bashrc /home/$username/.bashrc
cp bash_aliases /home/$username/.bash_aliases

# config files
echo -e "\e[1;32m Copying config files \e[0m"
cd /home/$username
git clone https://github.com/ankit90s/dotconfig
cd $builddr

echo
echo -e "\e[1;32m Rebooting Now \e[0m"

sleep 5s
reboot
