pacman --noconfirm -S linux-headers neofetch htop xorg-server xorg-xint libxft libxinerama xorg-xrandr ttf-jetbrains-mono gnu-free-fonts firefox mpv openssh git wget vim neovim youtube-dl
git clone https://github.com/7zo7zo7zo/dwm-main.git temp
mv temp/dwm-main temp/dwm
mv temp/dwm ~/.config
git clone https://github.com/7zo7zo7zo/st-main.git ~/.config
mv temp/st-main temp/st
mv temp/st ~/.config
git clone https://github.com/7zo7zo7zo/slstatus.git ~/.config
mv temp/slstatus ~/.config
git clone https://github.com/7zo7zo7zo/dmenu.git ~/.config
mv temp/dmenu ~/.config
rm -rf temp
cd ~/.config/dwm ; sudo make clean install
cd ~/.config/st ; sudo make clean install
cd ~/.config/slstatus ; sudo make clean install
cd ~/.config/dmenu ; sudo make clean install
