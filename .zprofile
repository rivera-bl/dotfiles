
export PATH="$HOME/.local/bin:$PATH"

export EDITOR="nvim"
export TERM="st"
export BROWSER="firefox"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
export IMAGES="$HOME/doc/img"
export HISTFILE="${XDG_DATA_HOME:-$HOME/.local/share}/history"
export LESSHISTFILE="-"

if systemctl -q is-active graphical.target & [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
    exec startx
fi
