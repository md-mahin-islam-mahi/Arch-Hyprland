#!/bin/bash

# color defination
red="\e[1;31m"
green="\e[1;32m"
yellow="\e[1;33m"
blue="\e[1;34m"
megenta="\e[1;1;35m"
cyan="\e[1;36m"
end="\e[1;0m"

# initial texts
attention="${yellow}[ ATTENTION ]${end}"
action="${green}[ ACTION ]${end}"
note="${megenta}[ NOTE ]${end}"
done="${cyan}[ DONE ]${end}"
error="${red}[ ERROR ]${end}"

log="Install-Logs/install-$(date +%I:%M-%p)_aur_packages.log"

# install script dir
ScrDir=`dirname "$(realpath "$0")"`
source $ScrDir/1-global.sh

aur_packages=(
wlogout
swww
hyprshot
swayimg
swaylock-effects-git
qt5-svg
qt5-quickcontrols2
qt5-graphicaleffects
grimblast
rofi-lbonn-wayland
wl-clipboard
visual-studio-code-bin
    )

printf "${action} - Now installing some packages from the aur helper...\n" && sleep 1

# Installing from the AUR Helper
for aur_pkgs in "${aur_packages[@]}"; do
        install_from_aur "$aur_pkgs" "$log"
    done

clear