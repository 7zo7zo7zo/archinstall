#!/bin/sh

#if [ "$EUID" -ne 0 ]; then
#  echo "Please run as root"
#  exit
#fi
sudo pacman --noconfirm --needed -S $(< packages)
#sudo pacman --noconfirm --needed -S $(< optional_packages)
mkdir ~/.config
git clone https://github.com/7zo7zo7zo/dwm.git ~/.config/dwm
git clone https://github.com/7zo7zo7zo/st.git ~/.config/st
git clone https://github.com/7zo7zo7zo/dwmblocks.git ~/.config/dwmblocks
git clone https://git.suckless.org/dmenu ~/.config/dmenu
git clone https://codeberg.org/nsxiv/nsxiv.git ~/.config/nsxiv
cd ~/.config/dwm ; sudo make clean install
cd ~/.config/st ; sudo make clean install
cd ~/.config/dmenu ; sudo make clean install
cd ~/.config/nsxiv ; sudo make clean install
systemctl --user enable --now pulseaudio
sudo systemctl enable --now sshd
sudo systemctl enable --now cups
TMP=$(mktemp -d)
git clone https://aur.archlinux.org/yay.git $TMP/yay
cd $TMP/yay ; makepkg -si --noconfirm
#git clone https://aur.archlinux.org/paru.git $TMP/paru
#cd $TMP/paru ; makepkg -si --noconfirm
git clone http://github.com/7zo7zo7zo/dotfiles $TMP/dotfiles
rm -rf $TMP/dotfiles/.git
#mv $TMP/dotfiles/pacman.conf /etc
#mv $TMP/dotfiles/xorg.conf /etc/X11
cp -r $TMP/dotfiles/. ~
rm -rf $TMP
