#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then

    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then

    xrdb -merge "$userresources"

fi

# if [ -f "$usermodmap" ]; then
#     xmodmap "$usermodmap"
# fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# MPD daemon start (if no other user instance exists)
[ ! -s ~/.config/mpd/pid ] && mpd

# poweroff notebook screen
# xrandr --output LVDS1 --off &
xrandr --auto --output LVDS1 --mode 1600x900 --left-of VGA1 &
~/.local/bin/.fehbg &
pulseaudio -D &
unclutter -grab -idle 2 &
sleep 10s && skey &
exec i3
## Loop for restarting dwm
# while true; do
#     dwm >/dev/null 2>&1
# done
# exec dwm
