sudo pacman --noconfirm --needed -S linux-headers neofetch htop xorg-server xorg-xinit libxft libxinerama xorg-xrandr ttf-jetbrains-mono gnu-free-fonts firefox mpv openssh git wget vim neovim youtube-dl pulseaudio man-db pavucontrol ttf-droid picom
git clone https://github.com/7zo7zo7zo/dwm-main.git temp/dwm
mv temp/dwm ~/.config
git clone https://github.com/7zo7zo7zo/st-main.git temp/st
mv temp/st ~/.config
git clone https://github.com/7zo7zo7zo/slstatus.git temp/slstatus
mv temp/slstatus ~/.config
git clone https://github.com/7zo7zo7zo/dmenu.git temp/dmenu
mv temp/dmenu ~/.config
#git clone https://github.com/7zo7zo7zo/xmenu.git temp/xmenu
#mv temp/xmenu ~/.config
cd ~/.config/dwm ; sudo make clean install
cd ~/.config/st ; sudo make clean install
cd ~/.config/slstatus ; sudo make clean install
cd ~/.config/dmenu ; sudo make clean install
#cd ~/.config/xmenu ; sudo make clean install
git clone https://aur.archlinux.org/yay.git temp/yay
cd temp/yay ; makepkg -si
systemctl --user enable pulseaudio
git clone http://github.com/7zo7zo7zo/dotfiles temp/dotfiles
rm -rf temp/dotfiles/.git
#sudo mv temp/dotfiles/pacman.conf /etc
#sudo mv temp/dotfiles/xorg.conf /etc/X11
cp -r temp/dotfiles/. ~
rm -rf temp
