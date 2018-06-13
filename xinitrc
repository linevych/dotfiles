# Appearance configuration
compton &                       # Compositing manager
gnome-settings-daemon &         # Painless configuration
xfce4-volumed &                 # Volume control using media keys

# Programs
emacs --daemon &                # Emacs for win!
insync start &                  # Google Drive Client

# This is my system-specific resolution settings, do not use it!
xrandr --output DP-0 --off --output DVI-D-0 --off --output DP-1 --off --output HDMI-0 --primary --mode 2560x1080 --pos 0x0 --rotate normal

# Setting wallpapers
nitrogen --restore

# Firing I3
exec i3
