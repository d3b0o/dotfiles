#!/bin/bash
target=$(cat ~/.config/bin/target)
echo -ne $target | xclip -selection clipboard
#notify-send -i /home/d3b0/.config/bin/target.png "System" "Ip copiada en el portapapeles"
