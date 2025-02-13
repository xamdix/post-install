#!/usr/bin/env bash

# install things
sudo pacman -Syu
sudo pacman -S $(cat packages) --noconfirm

xdg-user-dirs-update

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si yay --noconfirm
cd ~
rm -rf yay

# move packages to the right places
mkdir ~/.config/bspwm
mkdir ~/.config/sxhkd
mkdir ~/.bin

cd ~/post-install/things_that_need_moving
mv .bashrc ~
mv .xinitrc ~
mv bspwmrc ~/.config/bspwm
mv sxhkdrc ~/.config/sxhkd
sudo mv backlight.rules /etc/udev/rules.d
sudo mv leds.rules /etc/udev/rules.d
mv micmute ~/.bin
cd ~

# make scripts executable
chmod +x ~/.config/bspwm/bspwmrc
chmod +x ~/.bin/micmute
