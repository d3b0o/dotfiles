#!/bin/bash

MAGENTA="\e[35m"
BLUE="\e[94m"
ENDCOLOR="\e[0m"

echo -e "${BLUE}
  ___          _      __   _   _            
 |   \   ___  | |_   / _| (_) | |  ___   ___
 | |) | / _ \ |  _| |  _| | | | | / -_) (_-<
 |___/  \___/  \__| |_|   |_| |_| \___| /__/
        ${MAGENTA}by d3b0
                                            ${ENDCOLOR}"

echo -n "[*] Do you want to make a copy of your old config files (y/n) "
read option
if [[ $option == "n" ]]; then
    echo ""

elif [[ $option == "y" ]]; then
    echo "[*] No te preocupes si ves errores durante el proceso"

    mkdir ~/.config/config-old

    folders=(polybar rofi bspwm sxhkd picom bin neofetch)

    for i in ${folders[@]}; do
        mv ~/.config/$i/ ~/.config/config-old 
    done

else
    echo "[!] '$option' is not valid option..."
    exit

fi

echo "[+] Installing dependencies"
sudo apt-get update
sudo apt install net-tools libuv1-dev build-essential git vim xcb libxcb-util0-dev libxcb-ewmh-dev libxcb-randr0-dev libxcb-icccm4-dev libxcb-keysyms1-dev libxcb-xinerama0-dev libasound2-dev libxcb-xtest0-dev libxcb-shape0-dev
sudo apt install cmake cmake-data pkg-config python3-sphinx libcairo2-dev libxcb1-dev libxcb-util0-dev libxcb-randr0-dev libxcb-composite0-dev python3-xcbgen xcb-proto libxcb-image0-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-xkb-dev libxcb-xrm-dev libxcb-cursor-dev libasound2-dev libpulse-dev libjsoncpp-dev libmpdclient-dev libcurl4-openssl-dev libnl-genl-3-dev
sudo apt install meson libxext-dev libxcb1-dev libxcb-damage0-dev libxcb-xfixes0-dev libxcb-shape0-dev libxcb-render-util0-dev libxcb-render0-dev libxcb-randr0-dev libxcb-composite0-dev libxcb-image0-dev libxcb-present-dev libxcb-xinerama0-dev libpixman-1-dev libdbus-1-dev libconfig-dev libgl1-mesa-dev libpcre2-dev libevdev-dev uthash-dev libev-dev libx11-xcb-dev libxcb-glx0-dev
sudo apt install bspwm rofi caja feh gnome-terminal scrot neovim xclip tmux acpi scrub bat wmname

for i in ${folders[@]}; do
        mv $i ~/.config/
done

mkdir ~/.wallpapers
mv ./*.png ~/.wallpapers/

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.powerlevel10k
echo 'source ~/.powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc

git clone https://github.com/baskerville/sxhkd.git
cd sxhkd
make
sudo make install

cd ../
wget https://raw.githubusercontent.com/yorkox0/exaple01/main/ethernet_status.sh
chmod +x ethernet_status.sh 2>/dev/null
mv ethernet_status.sh ~/.config/bin
wget https://raw.githubusercontent.com/yorkox0/exaple01/main/hackthebox.sh
chmod +x hackthebox.sh
mv hackthebox.sh ~/.config/bin

git clone https://github.com/ibhagwan/picom.git
cd picom
git submodule update --init --recursive
meson --buildtype=release . build
ninja -C build
cd ../

chmod +x ~/.config/bspwm/bspwmrc ~/.config/bspwm/scripts/bspwm_resize
chmod +x ~/.config/bin/copyipvpn.sh ~/.config/bin/copyiptarget.sh ~/.config/bin/song.sh ~/.config/bin/ethernet_status.sh ~/.config/bin/target_to_hack.sh
chmod +x ~/.config/polybar/launch.sh
chmod +x ~/.config/rofi/bin/launcher ~/.config/rofi/bin/screenshot
