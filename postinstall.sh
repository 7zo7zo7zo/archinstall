#!/bin/sh

if [ "$EUID" -eq 0 ]; then
  read -p "You probably don't want to run this as root. Countinue? [y/n] " answer
  if [ $answer = n ]; then
    exit
  fi
fi

sudo pacman --noconfirm --needed -S $(< packages)
#sudo pacman --noconfirm --needed -S $(< optional_packages)
mkdir ~/.config
git clone https://github.com/7zo7zo7zo/dwm.git ~/.config/dwm
git clone https://github.com/7zo7zo7zo/st.git ~/.config/st
git clone https://github.com/7zo7zo7zo/dwmblocks.git ~/.config/dwmblocks
git clone https://git.suckless.org/dmenu ~/.config/dmenu
git clone https://codeberg.org/nsxiv/nsxiv.git ~/.config/nsxiv
cd ~/.config/dwm; sudo make clean install
cd ~/.config/st; sudo make clean install
cd ~/.config/dwmblocks; sudo make clean install
cd ~/.config/dmenu; sudo make clean install
cd ~/.config/nsxiv; sudo make clean install
TMP=$(mktemp -d)
git clone https://aur.archlinux.org/yay.git $TMP/yay
cd $TMP/yay; makepkg -si --noconfirm
#git clone https://aur.archlinux.org/paru.git $TMP/paru
#cd $TMP/paru; makepkg -si --noconfirm
git clone http://github.com/7zo7zo7zo/dotfiles $TMP/dotfiles
rm -rf $TMP/dotfiles/.git
#sudo mv $TMP/dotfiles/pacman.conf /etc
#sudo mv $TMP/dotfiles/xorg.conf /etc/X11
#sudo mv $TMP/etc/* /etc
cp -r $TMP/dotfiles/. ~
#git clone https://github.com/7zo7zo7zo/brightness $TMP/brightness
#gcc $TMP/brightness -o ~/.local/bin/brightness
rm -rf $TMP
read -p "Would you like to install bluetooth? (install bluez, bluez-utils) [y/n] " answer
if [[ $answer = y ]]; then
  sudo pacman -S bluez bluez-utils
  read -p "Would you like to enable the bluetooth daemon? [y/n] " answer
  if [[ $answer = y ]]; then
    sudo systemctl enable --now bluetooth
  fi
fi
read -p "Would you like to be able to use printers on this device? (install cups) [y/n] " answer
if [[ $answer = y ]]; then
  sudo pacman -S cups
  read -p "Do you have an HP printer? (install hplip) [y/n] " answer
  if [[ $answer = y ]]; then
    sudo pacman -S hplip
    read -p "Do you have a HP printer that you would like to set up right now? [y/n] " answer
    if [[ $answer = y ]]; then
      sudo hp-setup -i
    fi
  fi
fi
read -p "Would you like to install SSH? (install OpenSSH) [y/n] " answer
if [[ $answer = y ]]; then
  sudo pacman -S openssh
  read -p "Would you like to enable the SSH daemon? [y/n] " answer
  if [[ $answer = y ]]; then
    sudo systemctl enable --now sshd
  fi
fi
