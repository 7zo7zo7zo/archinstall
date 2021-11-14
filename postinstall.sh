pacman --noconfirm --needed -S linux-headers neofetch htop xorg-server xorg-xint libxft libxinerama xorg-xrandr ttf-jetbrains-mono gnu-free-fonts firefox mpv openssh git wget vim neovim youtube-dl
git clone https://github.com/7zo7zo7zo/dwm-main.git ~/.config
git clone https://github.com/7zo7zo7zo/st-main.git ~/.config
git clone https://github.com/7zo7zo7zo/slstatus.git ~/.config
git clone https://github.com/7zo7zo7zo/dmenu.git ~/.config
mv ~/.config/dwm-main ~/.config/dwm
mv ~/.config/st-main ~/.config/st
cd ~/.config/dwm ; sudo make clean install
cd ~/.config/st ; sudo make clean install
cd ~/.config/slstatus ; sudo make clean install
cd ~/.config/dmenu ; sudo make clean install
