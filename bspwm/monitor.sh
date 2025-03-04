#! /bin/sh



internal_monitor=eDP1

external_monitor=HDMI-1



if [ external_monitor = *connected* ]; then

    xrandr --output internal_monitor --primary --mode 1920x1080 --rotate normal --output external_monitor --mode 1680x1050 --rotate normal --left-of internal_monitor

fi



monitor_add() {

	desktops=4 # How many desktops to move to the second monitor



	for desktop in $(bspc query -D -m $internal_monitor | sed "$desktops"q)

  do

		bspc desktop $desktop --to-monitor $external_monitor

  done



  # Remove "Desktop" created by bspwm

  bspc desktop Desktop --remove

}



monitor_remove() {

	bspc monitor $internal_monitor -a Desktop # Temp desktop because one desktop required per monitor



	# Move everything to external monitor to reorder desktops

	for desktop in $(bspc query -D -m $internal_monitor)

	do

		bspc desktop $desktop --to-monitor $external_monitor

	done



	# Now move everything back to internal monitor

	bspc monitor $external_monitor -a Desktop # Temp desktop



	for desktop in $(bspc query -D -m $external_monitor)

	do

		bspc desktop $desktop --to-monitor $internal_monitor

	done



	bspc desktop Desktop --remove # Remove temp desktops

}



if [ $(xrandr -q | grep "$external_monitor connected") ]; then

    monitor_add

else

    monitor_remove

fi

