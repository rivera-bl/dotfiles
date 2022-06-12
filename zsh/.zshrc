# export ZDOTDIR=$HOME/.config/zsh#Source aliases
source "$HOME/.config/zsh/.zalias"
#Source prompt style
source "$HOME/.config/zsh/.zprompt"

# di=directory,ow=otherwriteable, 
export LS_COLORS="di=90:ex=100:*.mp3=1;32;41:ow=90"

bindkey -v                      #Enable Vi-Mode
setopt autocd                   #Enable Auto-cd	
# setopt rcquotes

#Enable Auto-Completion
autoload -U compinit
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

#For limiting and storing .zsh_history on a specific dir
HISTFILE=~/.config/zsh/history
HISTSIZE=100000
SAVEHIST=100000
setopt appendhistory
setopt INC_APPEND_HISTORY  
setopt SHARE_HISTORY

# This removes the '%' or '#' when printing a partial line
PROMPT_EOL_MARK=''

#Function for Pasting Vi-Mode selection
#From: https://unix.stackexchange.com/questions/25765/pasting-from-clipboard-to-vi-enabled-zsh-or-bash-shell
function x11-clip-wrap-widgets() {
    # NB: Assume we are the first wrapper and that we only wrap native widgets
    # See zsh-autosuggestions.zsh for a more generic and more robust wrapper
    local copy_or_paste=$1
    shift

    for widget in $@; do
        if [[ $copy_or_paste == "copy" ]]; then
            eval "
            function _x11-clip-wrapped-$widget() {
                zle .$widget
               xclip -in -selection clipboard <<<\$CUTBUFFER
            }
            "
        else
            eval "
            function _x11-clip-wrapped-$widget() {
                CUTBUFFER=\$(xclip -out -selection clipboard)
                zle .$widget
            }
            "
        fi

        zle -N $widget _x11-clip-wrapped-$widget
    done
}

local copy_widgets=(
    vi-yank vi-yank-eol vi-delete vi-backward-kill-word vi-change-whole-line
)
local paste_widgets=(
    vi-put-{before,after}
)

# NB: can atm. only wrap native widgets
x11-clip-wrap-widgets copy $copy_widgets
x11-clip-wrap-widgets paste  $paste_widgets
 
source $HOME/.config/zsh/.zsyntax

function c() python3 -c "from math import *; print($*);"
alias c='noglob c'

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/rvv/temp/google-cloud-sdk/path.zsh.inc' ]; then . '/home/rvv/temp/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/rvv/temp/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/rvv/temp/google-cloud-sdk/completion.zsh.inc'; fi

if [ -e /home/rvv/.nix-profile/etc/profile.d/nix.sh ]; then source /home/rvv/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
