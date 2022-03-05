sudo pacman --noconfirm --needed -S linux-headers neofetch htop xorg-server xorg-xinit libxft libxinerama xorg-xrandr ttf-jetbrains-mono gnu-free-fonts firefox mpv openssh git wget vim neovim youtube-dl pulseaudio man-db pavucontrol ttf-droid picom zathura zathura-pdf-mupdf poppler-utils qpdf cups unzip man-pages ttf-nerd-fonts-symbols gimp
#sudo pacman --noconfirm --needed -S xcolor xorg-xfd xorg-bdftopcf zathura-pdf-poppler ttf-font-awesome intellij-idea-community-edition alsa-utils xf86-input-synaptics nvidia nvidia-dkms ttf-liberation pamixer lxappearance hplip openjdk11-src unrar xorg-xprop feh python-pywal ttf-fira-code libimobiledevice godot
git clone https://github.com/7zo7zo7zo/dwm.git temp/dwm
git clone https://github.com/7zo7zo7zo/st.git temp/st
git clone https://github.com/7zo7zo7zo/dwmblocks.git temp/dwmblocks
git clone https://git.suckless.org/dmenu temp/dmenu
mkdir ~/.config
mv temp/* ~/.config
cd ~/.config/dwm ; sudo make clean install
cd ~/.config/st ; sudo make clean install
cd ~/.config/slstatus ; sudo make clean install
cd ~/.config/dmenu ; sudo make clean install
systemctl --user enable --now pulseaudio
sudo systemctl enable --now cups
#git clone https://aur.archlinux.org/yay.git temp/yay
#cd temp/yay ; makepkg -si --noconfirm
git clone https://aur.archlinux.org/paru.git temp/paru
cd temp/paru ; makepkg -si --noconfirm
git clone http://github.com/7zo7zo7zo/dotfiles temp/dotfiles
rm -rf temp/dotfiles/.git
#sudo mv temp/dotfiles/pacman.conf /etc
#sudo mv temp/dotfiles/xorg.conf /etc/X11
cp -r temp/dotfiles/. ~
rm -rf ./temp
