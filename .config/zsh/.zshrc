# Path to your oh-my-zsh installation.
export ZSH="/home/rvv/.config/zsh/.oh-my-zsh"

#For using 'completion' autosuggest strategy
zmodload zsh/zpty 

#For limiting and storing .zsh_history on a specific dir
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

DISABLE_AUTO_UPDATE="true"

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Standard plugins can be found in $ZSH/plugins/
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    zsh-syntax-highlighting
    zsh-autosuggestions)


source $ZSH/oh-my-zsh.sh

# For a full list of active aliases, run 'alias'.
alias czs="nvim ~/.config/zsh/.zshrc"
alias ci3="nvim ~/.config/i3/config"
alias cnv="nvim ~/.config/nvim/init.vim"
alias ivw="nvim ~/.local/share/nvim/site/plugged/vimwiki/README.md"
alias gia="git add"
alias gic="git commit"
alias gis="git status"

#Use carefuly cause it may slows. Requires ztpy module
ZSH_AUTOSUGGEST_STRATEGY=(history completion) 
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
#Removing git from completion cause it slows too much
ZSH_AUTOSUGGEST_COMPLETION_IGNORE="gi* *"

#For Autosuggestions plugin, has to be at the end
bindkey '<' autosuggest-execute
