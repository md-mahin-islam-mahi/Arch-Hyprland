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


PACKAGE_MAN=$(command -v pacman || command -v yay || command -v paru)


printf "${action} - Now installing some necessary fonts...\n" && sleep 1

for FONTS in ttf-font-awesome ttf-cascadia-code ttf-jetbrains-mono-nerd ttf-meslo-nerd noto-fonts noto-fonts-emoji; do
        #First lets see if the package is there
        if $PACKAGE_MAN -Qs $FONTS >/dev/null; then
            printf "${done} - $FONTS is already installed.\n"
        else
            printf "${note} - Now installing $FONTS ...\n"
            sudo pacman -S --noconfirm $FONTS
            if pacman -Qs $FONTS >/dev/null; then
                printf "${done} - $FONTS was installed successfully!\n" 
            else
                printf "${error} - $FONTS install had failed :(\n" 
            fi
        fi
done

clear