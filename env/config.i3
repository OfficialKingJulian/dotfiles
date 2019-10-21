
# vim:filetype=i3


# Basic Config
  set $mod Mod1
  set $sup Mod4
  set $ter i3-sensible-terminal
  font pango:monospace 9
  bindsym $mod+x exec i3lock
  floating_modifier $mod
  bindsym $mod+Return exec $ter
  bindsym $mod+q kill
# bindsym $mod+d exec dmenu_run
  bindsym $mod+d exec --no-startup-id i3-dmenu-desktop   
  
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
  set $ws1  "1: &#xf120; Terminal"
  set $ws2  "2: &#xf269; Browser"
  set $ws3  "3: &#xf07b; Files"
  set $ws4  "4: "
  set $ws5  "5: &#xf233; Local"
  set $ws6  "6: &#xf09b; Git"
  set $ws7  "7: "
  set $ws8  "8: "
  set $ws9  "9: &#xf001; Music"
  set $ws0 "10: &#xf01c; Bridge"

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


# Workspace Specific Applications
  assign [class="ProtonMail Bridge"] $ws0
  assign [class="Nautilus" ] $ws3
  for_window [class="Spotify"] move to workspace $ws9

# Reload Config File
 #bindsym $mod+Shift+c reload

# i3 Logout 
  bindsym $mod+Shift+e exec "i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -b 'Yes, exit i3' 'i3-msg exit'"

# Start i3bar to display a workspace bar (plus the system information i3status
# finds out, if available)
  bar {
    status_command i3status
  }

# Media Keys - Working on x220
# Pulse Audio 
  bindsym XF86AudioRaiseVolume exec --no-startup-id pactl set-sink-volume 0 +5% # increase 
  bindsym XF86AudioLowerVolume exec --no-startup-id pactl set-sink-volume 0 -5% # decrease
  bindsym XF86AudioMute exec --no-startup-id pactl set-sink-mute 0 toggle       # mute 
# Sreen Brightness
  bindsym XF86MonBrightnessUp exec xbacklight -inc 20      # increase brightness
  bindsym XF86MonBrightnessDown exec xbacklight -dec 20    # decrease brightness
# Media Player
  bindsym XF86AudioPlay exec playerctl play     # play (broken)
  bindsym XF86AudioPause exec playerctl pause   # paus (broken)
  bindsym XF86AudioNext exec playerctl next     # next
  bindsym XF86AudioPrev exec playerctl previous # prev

# Exec Files; Startup and _Always
  exec_always --no-startup-id "i3-msg \"9: &#xf001; Music; append_layout /home/user/julian/.config/i3/workspace-1.json\""
  exec_always spotify
  exec_always $ter -name cava -e ./cava
  exec protonmail-bridge
  exec_always feh --bg-scale /home/julian/Pictures/Wallpapers/mountain.jpg


