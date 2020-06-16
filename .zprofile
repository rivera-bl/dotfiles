
export EDITOR="nvim"
export TERM="st"
export BROWSER="firefox"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
export HISTFILE="${XDG_DATA_HOME:-$HOME/.local/share}/history"

if systemctl -q is-active graphical.target & [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
    exec startx
fi
