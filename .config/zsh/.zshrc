export ZSH="/home/rvv/.config/zsh/.oh-my-zsh"

#Variables for easy styling the PROMPT 
export COLDIR='33'
export COLERR='1'
export ENDSYM='>'

#Styling the prompt with GIT info
autoload -Uz vcs_info
precmd() { vcs_info }
setopt prompt_subst
zstyle ':vcs_info:git:*' formats '%F{240}(%b)%f'
zstyle ':vcs_info:*' enable git
PROMPT='%B%F{$COLDIR}%1~%f${vcs_info_msg_0_} %(?.%F{$COLDIR}$ENDSYM.%F{$COLERR}$ENDSYM)%f%b '

#For limiting and storing .zsh_history on a specific dir
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"

DISABLE_AUTO_UPDATE="true"

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line if you want to disable marking untracked files
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    vi-mode
    zsh-syntax-highlighting
    zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

alias czs="nvim ~/.config/zsh/.zshrc"
alias ci3="nvim ~/.config/i3/config"
alias cnv="nvim ~/.config/nvim/init.vim"
alias ivw="nvim ~/.local/share/nvim/site/plugged/vimwiki/README.md"
#Shows the aliases for git
alias glias="alias | grep -i git | less"
#Simple Prompt Escapes from zsh manpage
alias zpes="man zshmisc | sed -n '2030,$'p | less"
#VCS Info Module information from zsh manpage
alias zvcs="man zshcontrib | sed -n '800,$'p | less"

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

#For Autosuggestions plugin, has to be at the end
bindkey ', ' autosuggest-accept
