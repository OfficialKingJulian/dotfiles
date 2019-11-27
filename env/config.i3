
# vim:filetype=i3


# Basic Config
  set $mod Mod1
  set $sup Mod4
  set $ter terminator
  font pango:Annonymous 10
# bindsym $mod+x exec i3lock
  bindsym $sup+l exec /home/julian/.config/i3/i3locker 
  floating_modifier $mod
  bindsym $mod+Return exec $ter
  bindsym $mod+q kill
# Application Launcher
  bindsym $mod+d      exec rofi -show run -lines 6 
  bindsym $sup+d      exec rofi -show run -lines 6
  bindsym $sup+Return exec rofi -show run -lines 6
# bindsym $mod+d exec --no-startup-id i3-dmenu-desktop   
  
# Restart i3 (e.g. apply changes!)
  bindsym $mod+Shift+r restart

# Change Focus Bindings
  bindsym $mod+h focus left
  bindsym $mod+j focus down
  bindsym $mod+k focus up
  bindsym $mod+l focus right
  bindsym $mod+Left focus left
  bindsym $mod+Down focus down
  bindsym $mod+Up focus up
  bindsym $mod+Right focus right

# Move Focus Bindings
  bindsym $mod+Shift+h move left
  bindsym $mod+Shift+j move down
  bindsym $mod+Shift+k move up
  bindsym $mod+Shift+l move right
  bindsym $mod+Shift+Left move left
  bindsym $mod+Shift+Down move down
  bindsym $mod+Shift+Up move up
  bindsym $mod+Shift+Right move right

# Resize Mode Bindings
  bindsym $mod+r mode "resize"
  mode "resize" {
    bindsym h resize shrink width 10 px or 10 ppt
    bindsym j resize grow height 10 px or 10 ppt
    bindsym k resize shrink height 10 px or 10 ppt
    bindsym l resize grow width 10 px or 10 ppt
    bindsym Left resize shrink width 10 px or 10 ppt
    bindsym Down resize grow height 10 px or 10 ppt
    bindsym Up resize shrink height 10 px or 10 ppt
    bindsym Right resize grow width 10 px or 10 ppt
  # Back to Normal Mode
    bindsym Return mode "default"
    bindsym Escape mode "default"
  }

# Spilt Horiz + Vert
  bindsym $mod+g split h
  bindsym $mod+v split v

# Enter Fullscreen Mode
  bindsym $mod+f fullscreen toggle

# Change Container Layout (stacked, tabbed, toggle split)
  bindsym $mod+s layout stacking
  bindsym $mod+w layout tabbed
  bindsym $mod+e layout toggle split

# Toggle Tiling / Floating
  bindsym $mod+Shift+space floating toggle

# Change Focus Between Tiling / Floating Windows
  bindsym $mod+space focus mode_toggle

# Focus The Parent Container / (Child)
  bindsym $mod+a focus parent
 #bindsym $mod+d focus child

# Workstation Vars
  set $ws1  "1: &#xf120;"
  set $ws2  "2: &#xf269;"
  set $ws3  "3: &#xf07b;"
  set $ws4  "4: "
  set $ws5  "5: &#xf233;"
  set $ws6  "6: &#xf09b;"
  set $ws7  "7: "
  set $ws8  "8: "
  set $ws9  "9: &#xf001;"
  set $ws0 "10: &#xf01c;"

# Workspace Bindings
  bindsym $mod+1 workspace $ws1
  bindsym $mod+2 workspace $ws2
  bindsym $mod+3 workspace $ws3
  bindsym $mod+4 workspace $ws4
  bindsym $mod+5 workspace $ws5
  bindsym $mod+6 workspace $ws6
  bindsym $mod+7 workspace $ws7
  bindsym $mod+8 workspace $ws8
  bindsym $mod+9 workspace $ws9
  bindsym $mod+0 workspace $ws0

# Move Container To Workspace Bindings
  bindsym $mod+Shift+1 move container to workspace $ws1
  bindsym $mod+Shift+2 move container to workspace $ws2
  bindsym $mod+Shift+3 move container to workspace $ws3
  bindsym $mod+Shift+4 move container to workspace $ws4
  bindsym $mod+Shift+5 move container to workspace $ws5
  bindsym $mod+Shift+6 move container to workspace $ws6
  bindsym $mod+Shift+7 move container to workspace $ws7
  bindsym $mod+Shift+8 move container to workspace $ws8
  bindsym $mod+Shift+9 move container to workspace $ws9
  bindsym $mod+Shift+0 move container to workspace $ws0

# Application Launch Binds
  bindsym $sup+e exec nautilus
  bindsym $sup+f exec firefox
  bindsym $sup+r exec $ter -name ranger -e ranger
  bindsym $sup+m exec $ter -name neomutt -e neomutt
  bindsym $sup+i exec qutebrowser
  bindsym $sup+s exec $ter -name gnome-control-center -e env XDG_CURRENT_DESKTOP=GNOME gnome-control-center


# Workspace Specific Applications
  assign [class="ProtonMail Bridge"] $ws0
  assign [class="Nautilus" ] $ws3
# for_window [class="Spotify"] move to workspace $ws9

# Reload Config File
 #bindsym $mod+Shift+c reload

# i3 Logout 
  bindsym $mod+Shift+e exec "i3-nagbar -t warning -m 'Brooo, you just posted cringe.' -b 'Yes, exit i3' 'i3-msg exit'"

# Start i3bar to display a workspace bar (plus the system information i3status
# finds out, if available)
  bar {
    i3bar_command i3bar -t
    status_command i3blocks -c ~/.config/i3blocks/config
    font pango:Anonymous Pro, FontAwesome 10
    position top
    strip_workspace_numbers yes
    height 25
    tray_output none
    separator_symbol " "
    colors {
        background #00000099
        statusline #FFFFFF
    }
  }


# Media Keys - Working on x220
# Pulse Audio 
  bindsym XF86AudioRaiseVolume exec --no-startup-id pactl set-sink-volume 0 +5% # increase 
  bindsym XF86AudioLowerVolume exec --no-startup-id pactl set-sink-volume 0 -5% # decrease
  bindsym XF86AudioMute exec --no-startup-id pactl set-sink-mute 0 toggle       # mute 
# Sreen Brightness
  bindsym XF86MonBrightnessUp exec xbacklight -inc 5      # increase brightness
  bindsym XF86MonBrightnessDown exec xbacklight -dec 5    # decrease brightness
# Media Player
  bindsym XF86AudioPlay exec playerctl play     # play (broken)
  bindsym XF86AudioPause exec playerctl pause   # paus (broken)
  bindsym XF86AudioNext exec playerctl next     # next
  bindsym XF86AudioPrev exec playerctl previous # prev

# Exec Files; Startup and _Always
  exec_always pkill bg-script
  exec protonmail-bridge
# exec_always feh --recursive --randomize --bg-fill ~/Pictures/Wallpapers/* 
  exec_always /home/julian/.config/i3/bg-script
  exec compton
# exec_always --no-startup-id wicd-gtk -t
# exec_always /home/julian/.config/i3/wifi
  exec nm-applet
# Restore GNOME's settings
  exec --no-startup-id /usr/libexec/gnome-settings-daemon-localeexec
# Fix a bug in gnome-settings-daemon: http://feeding.cloud.geek.nz/posts/creating-a-modern-tiling-desktop-environment-using-i3/
  exec --no-startup-id dconf write /org/gnome/settings-daemon/plugins/cursor/active false
  exec_always xsettingsd

# Gaps
# This might be overkill; probably won't use 
# the resize much but cool it's there. 
  for_window [class="^.*"] border pixel 0
  set $mode_gaps Gaps: (o) outer, (i) inner
  set $mode_gaps_outer Outer Gaps: +|-|0 (local), Shift + +|-|0 (global)
  set $mode_gaps_inner Inner Gaps: +|-|0 (local), Shift + +|-|0 (global)
  bindsym $mod+Shift+g mode "$mode_gaps"
  gaps inner 15
  gaps outer 10
  mode "$mode_gaps" {
    bindsym o      mode "$mode_gaps_outer"
    bindsym i      mode "$mode_gaps_inner"
    bindsym Return mode "default"
    bindsym Escape mode "default"
  }
  mode "$mode_gaps_inner" {
    bindsym plus  gaps inner current plus 5
    bindsym minus gaps inner current minus 5
    bindsym 0     gaps inner current set 0
    bindsym Shift+plus  gaps inner all plus 5
    bindsym Shift+minus gaps inner all minus 5
    bindsym Shift+0     gaps inner all set 0
    bindsym Return mode "default"
    bindsym Escape mode "default"
  }
  mode "$mode_gaps_outer" {
    bindsym plus  gaps outer current plus 5
    bindsym minus gaps outer current minus 5
    bindsym 0     gaps outer current set 0
    bindsym Shift+plus  gaps outer all plus 5
    bindsym Shift+minus gaps outer all minus 5
    bindsym Shift+0     gaps outer all set 0
    bindsym Return mode "default"
    bindsym Escape mode "default"
  }
