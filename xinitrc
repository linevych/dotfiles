# Appearance configuration
compton &
gnome-settings-daemon &
xfce4-volumed &

# Programs
emacs --daemon &
insync start &

xrandr --output DP-0 --off --output DVI-D-0 --off --output DP-1 --off --output HDMI-0 --primary --mode 2560x1080 --pos 0x0 --rotate normal
nitrogen --restore

# Firing I3
exec i3
