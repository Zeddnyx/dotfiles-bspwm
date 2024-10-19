#!/bin/bash

killall -q polybar

polybar -c /home/zedd/.config/bspwm/polybar/config_start.ini &  main 2>&1  | tee -a /tmp/polybar1.log & disown 
polybar -c /home/zedd/.config/bspwm/polybar/config_center.ini &  main 2>&1  | tee -a /tmp/polybar2.log & disown 
polybar -c /home/zedd/.config/bspwm/polybar/config_end.ini &  main 2>&1  | tee -a /tmp/polybar3.log & disown 

echo 'polybar meluncurrr...'
