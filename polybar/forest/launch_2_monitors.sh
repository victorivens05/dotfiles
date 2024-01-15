#!/usr/bin/env bash
# if type "xrandr"; then
#   for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
#     MONITOR=$m /home/victor/.config/polybar/shapes/launch.sh &
#   done
# else
#   /home/victor/.config/polybar/shapes/launch.sh &
# fi

DIR="$HOME/.config/polybar/forest"

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch the bar
MONITOR=DP-2 polybar -q main -c "$DIR"/config.ini &
MONITOR=HDMI-0 polybar -q secondary -c "$DIR"/config.ini &

# #!/usr/bin/env sh

# # Terminate already running bar instances
# killall -q polybar

# # Wait until the processes have been shut down
# while pgrep -x polybar >/dev/null; do sleep 1; done

# screens=$(xrandr --listactivemonitors | grep -v "Monitors" | cut -d" " -f6)

# if [[ $(xrandr --listactivemonitors | grep -v "Monitors" | cut -d" " -f4 | cut -d"+" -f2- | uniq | wc -l) == 1 ]]; then
#   MONITOR=$(polybar --list-monitors | cut -d":" -f1) TRAY_POS=right polybar main &
# else
#   primary=$(xrandr --query | grep primary | cut -d" " -f1)

#   for m in $screens; do
#     if [[ $primary == $m ]]; then
#         MONITOR=$m TRAY_POS=right polybar main &
#     else
#         MONITOR=$m TRAY_POS=none polybar secondary &
#     fi
#   done
# fi

