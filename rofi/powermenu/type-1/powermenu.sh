#!/usr/bin/env bash

## Author : Aditya Shakya (adi1090x)
## Github : @adi1090x
#
## Rofi   : Power Menu
#
## Available Styles
#
## style-1   style-2   style-3   style-4   style-5

# Current Theme

SCREEN_POS=$(swaymsg -t get_outputs \
	| jq -r \
	'.[] | select(.focused).rect | "\(.width)x\(.height)\\+\(.x)\\+\(.y)"')

# ripgrep
XWAYLAND_OUTPUT=$(xrandr | rg -oP "[A-Z]+[0-9]+(?= [a-z]+ $SCREEN_POS)")

MONITOR_ID=$(rofi --help | rg $XWAYLAND_OUTPUT -B1 \
	| sed -sr '/ID/!d;s/[^:]*:\s([0-9])/\1/')

# GNU grep
#XWAYLAND_OUTPUT=$(xrandr | grep -oP "[A-Z]+[0-9]+(?= connected $SCREEN_POS)

#MONITOR_ID=$(rofi --help | grep $XWAYLAND_OUTPUT -B1 \
	#| sed -sr '/ID/!d;s/[^:]*:\s([0-9])/\1/')

# stdin for dmenu mode
 


dir="$HOME/.config/rofi/powermenu/type-1"
theme='style-1'

# CMDs
uptime="`uptime -p | sed -e 's/up //g'`"
host=`cat /etc/hostname`

# Options
shutdown='😂Shutdown'
reboot='😀Reboot'
lock='🙃Lock'
suspend='🙂Suspend'
logout='🤫Logout'
yes='😃Yes'
no='😐No'

# Rofi CMD
rofi_cmd() {
	rofi -dmenu \
		-p "$host" \
		-mesg "Uptime: $uptime" \
		-theme ${dir}/${theme}.rasi\
                -m $MONITOR_ID $@ </dev/stdin

            }

# Confirmation CMD
confirm_cmd() {
	rofi -theme-str 'window {location: center; anchor: center; fullscreen: false; width: 250px;}' \
		-theme-str 'mainbox {children: [ "message", "listview" ];}' \
		-theme-str 'listview {columns: 2; lines: 1;}' \
		-theme-str 'element-text {horizontal-align: 0.5;}' \
		-theme-str 'textbox {horizontal-align: 0.5;}' \
		-dmenu \
		-p 'Confirmation' \
		-mesg 'Are you Sure?' \
		-theme ${dir}/${theme}.rasi\
                -m $MONITOR_ID $@ </dev/stdin

}

# Ask for confirmation
confirm_exit() {
	echo -e "$yes\n$no" | confirm_cmd
}

# Pass variables to rofi dmenu
run_rofi() {
	echo -e "$lock\n$suspend\n$logout\n$reboot\n$shutdown" | rofi_cmd
}

# Execute Command
run_cmd() {
	selected="$(confirm_exit)"
	if [[ "$selected" == "$yes" ]]; then
		if [[ $1 == '--shutdown' ]]; then
			systemctl poweroff
		elif [[ $1 == '--reboot' ]]; then
			systemctl reboot
		elif [[ $1 == '--suspend' ]]; then
			playerctl pause
			amixer set Master mute
			systemctl suspend
		elif [[ $1 == '--logout' ]]; then
if [[ "$DESKTOP_SESSION" == 'openbox' ]]; then
			swaymsg exit
			elif [[ "$DESKTOP_SESSION" == 'i3' ]]; then
				i3-msg exit
		elif [[ "$DESKTOP_SESSION" == 'sway' ]]; then
			swaymsg exit
elif [[ "$XDG_SESSION_DESKTOP" == 'sway' ]]; then
			swaymsg exit
		elif [[ "$XDG_CURRENT_DESKTOP" == 'Hyprland' ]]; then
			hyprctl dispatch exit
fi 
			fi
		fi
}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
    $shutdown)
		run_cmd --shutdown
        ;;
    $reboot)
		run_cmd --reboot
        ;;
    $lock)
        swaylock 
        ;;
    $suspend)
		run_cmd --suspend
        ;;
    $logout)
		run_cmd --logout
        ;;
esac
