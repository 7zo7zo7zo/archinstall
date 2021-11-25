sudo pacman --noconfirm --needed -S linux-headers neofetch htop xorg-server xorg-xinit libxft libxinerama xorg-xrandr ttf-jetbrains-mono gnu-free-fonts firefox mpv openssh git wget vim neovim youtube-dl pulseaudio man-db pavucontrol ttf-droid picom
#mkdir ./temp
git clone https://github.com/7zo7zo7zo/dwm-main.git ./temp/dwm
git clone https://github.com/7zo7zo7zo/st-main.git ./temp/st
git clone https://github.com/7zo7zo7zo/slstatus.git ./temp/slstatus
git clone https://github.com/7zo7zo7zo/dmenu.git ./temp/dmenu
#git clone https://github.com/7zo7zo7zo/xmenu.git ./temp/xmenu
mv ./temp/* ~/.config
cd ~/.config/dwm ; sudo make clean install
cd ~/.config/st ; sudo make clean install
cd ~/.config/slstatus ; sudo make clean install
cd ~/.config/dmenu ; sudo make clean install
#cd ~/.config/xmenu ; sudo make clean install
git clone https://aur.archlinux.org/yay.git temp/yay
cd ./temp/yay ; makepkg -si --noconfirm
systemctl --user enable --now pulseaudio
git clone http://github.com/7zo7zo7zo/dotfiles temp/dotfiles
rm -rf ./temp/dotfiles/.git
#sudo mv temp/dotfiles/pacman.conf /etc
#sudo mv temp/dotfiles/xorg.conf /etc/X11
cp -r temp/dotfiles/. ~/.
rm -rf temp
