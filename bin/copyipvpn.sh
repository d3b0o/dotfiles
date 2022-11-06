#!/bin/bash

ipvpn=$(/usr/sbin/ifconfig tun0 | grep "inet " | awk '{print $2}')
echo -ne $ipvpn | xclip -selection clipboard
#notify-send -i /home/d3b0/.config/bin/htb.png "System" "Ip de HTB copiada en el portapapeles"
