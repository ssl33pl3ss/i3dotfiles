#!/usr/bin/env bash

## Author  : Aditya Shakya
## Mail    : adi1090x@gmail.com
## Github  : @adi1090x
## Twitter : @adi1090x

dir="~/.config/polybar/docky/scripts/rofi"
uptime=$(uptime -p | sed -e 's/up //g')

rofi_command="rofi -theme $dir/configmenu.rasi"

# Options
ithree=" i3"
picom=" picom"
fish=" fish"
micro=" micro"
neofetch=" neofetch"
grub=" grub"
confmenu=" confmenu"

# Variable passed to rofi
options="$ithree\n$picom\n$fish\n$micro\n$neofetch\n$grub\n$confmenu"

chosen="$(echo -e "$options" | $rofi_command -p "Edit config" -dmenu -selected-row 0)"
case $chosen in
    $ithree)
		konsole -e micro ~/.config/i3/config
        ;;
    $picom)
    	konsole -e micro ~/.config/picom/picom.conf
        ;;
    $fish)
		konsole -e micro ~/.config/fish/config.fish
        ;;
    $micro)
		konsole -e micro ~/.config/micro/settings.json
        ;;
    $neofetch)
		konsole -e micro ~/.config/neofetch/config.conf
        ;;
    $grub)
		konsole -e sudo -e /boot/grub/grub.cfg
        ;;
    $confmenu)
   		konsole -e micro ~/.config/polybar/docky/scripts/configmenu.sh
           ;;
esac
