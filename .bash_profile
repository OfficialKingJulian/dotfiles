#
# ~/.bash_profile

[[ -f ~/.bashrc ]] && . ~/.bashrc
# Start i3
if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi

