#
# ~/.bash_profile

[[ -f ~/.bashrc ]] && . ~/.bashrc
# Start i3
if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
  sudo chmod 666 /sys/class/backlight/intel_backlight/brightness
fi

