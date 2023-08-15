############################ ANTIGEN SETUP ########################################################
# Antigen: https://github.com/zsh-users/antigen
ANTIGEN="$HOME/.local/bin/antigen.zsh" # Install antigen.zsh if not exist if [ ! -f "$ANTIGEN" ]; then echo "Installing antigen ..."
if [ ! -f "$ANTIGEN" ]; then
    [ ! -d "$HOME/.local" ] && mkdir -p "$HOME/.local" 2> /dev/null
    [ ! -d "$HOME/.local/bin" ] && mkdir -p "$HOME/.local/bin" 2> /dev/null
    # [ ! -f "$HOME/.z" ] && touch "$HOME/.z"
    URL="http://git.io/antigen"
    TMPFILE="/tmp/antigen.zsh"
    if [ -x "$(which curl)" ]; then
        curl -L "$URL" -o "$TMPFILE"
    elif [ -x "$(which wget)" ]; then
        wget "$URL" -O "$TMPFILE"
    else
        echo "ERROR: please install curl or wget before installation !!"
        exit
    fi
    if [ ! $? -eq 0 ]; then
        echo ""
        echo "ERROR: downloading antigen.zsh ($URL) failed !!"
        exit
    fi;
    echo "move $TMPFILE to $ANTIGEN"
    mv "$TMPFILE" "$ANTIGEN"
fi

# exit for non-interactive shell
[[ $- != *i* ]] && return

# Initialize antigen
source "$ANTIGEN"

# Setup dir stack
DIRSTACKSIZE=10
setopt autopushd pushdminus pushdsilent pushdtohome pushdignoredups cdablevars
alias d='dirs -v | head -10'

# Disable correction
unsetopt correct_all
unsetopt correct
DISABLE_CORRECTION="true"


ZSH_AUTOSUGGEST_USE_ASYNC=1

# Declare modules
zstyle ':prezto:*:*' color 'yes'
# zstyle ':prezto:module:editor' key-bindings 'vim'
zstyle ':prezto:module:git:alias' skip 'yes'
zstyle ':prezto:module:prompt' theme 'redhat'
zstyle ':prezto:module:prompt' pwd-length 'short'
zstyle ':prezto:module:terminal' auto-title 'yes'
zstyle ':prezto:module:autosuggestions' color 'yes'
zstyle ':prezto:module:python' autovenv 'yes'
zstyle ':prezto:load' pmodule \
    'environment' \
    'editor' \
    'history' \
    'git' \
    'utility' \
    'completion' \
    'history-substring-search' \
    'autosuggestions' \
    'prompt' \

    # 'autosuggestions' \

# Initialize prezto
antigen use prezto
antigen use oh-my-zsh

if [ ! -f ~/.antigen/bundles/robbyrussell/oh-my-zsh/custom/themes/mytheme.zsh-theme ]; then
    cp ~/init_script/configs/mytheme.zsh-theme ~/.antigen/bundles/robbyrussell/oh-my-zsh/custom/themes/mytheme.zsh-theme
fi

antigen theme robbyrussell/oh-my-zsh custom/themes/mytheme



# default bundles
antigen bundle rupa/z z.sh
antigen bundle Vifon/deer
antigen bundle git
antigen bundle tmux
#antigen bundle sudo
#antigen bundle zsh-users/zsh-syntax-highlighting
#antigen bundle zsh-users/zsh-autosuggestions

antigen bundle willghatch/zsh-cdr
antigen bundle command-not-found
#antigen bundle zsh-users/zaw

# syntax color definition
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)

typeset -A ZSH_HIGHLIGHT_STYLES

# ZSH_HIGHLIGHT_STYLES[command]=fg=white,bold
# ZSH_HIGHLIGHT_STYLES[alias]='fg=magenta,bold'

ZSH_HIGHLIGHT_STYLES[default]=none
ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=009
ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=009,standout
ZSH_HIGHLIGHT_STYLES[alias]=fg=cyan,bold
ZSH_HIGHLIGHT_STYLES[builtin]=fg=cyan,bold
ZSH_HIGHLIGHT_STYLES[function]=fg=cyan,bold
ZSH_HIGHLIGHT_STYLES[command]=fg=white,bold
ZSH_HIGHLIGHT_STYLES[precommand]=fg=white,underline
ZSH_HIGHLIGHT_STYLES[commandseparator]=none
ZSH_HIGHLIGHT_STYLES[hashed-command]=fg=009
ZSH_HIGHLIGHT_STYLES[path]=fg=214,underline
ZSH_HIGHLIGHT_STYLES[globbing]=fg=063
ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=white,underline
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=none
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=none
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=none
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=063
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=063
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=009
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=009
ZSH_HIGHLIGHT_STYLES[assign]=none

antigen apply
#Version Control
#autoload -Uz vcs_info
#precmd_vcs_info() { vcs_info }
#precmd_functions+=( precmd_vcs_info )
#setopt prompt_subst
#RPROMPT='${vcs_info_msg_0_}'
## PROMPT='${vcs_info_msg_0_}%# '
#zstyle ':vcs_info:git:*' formats '%b'

# options
unsetopt correct_all
unsetopt share_history
setopt prompt_subst

setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
# setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY # Don't execute immediately upon history expansion.

# setup for deer
autoload -U deer
zle -N deer

# Disable correction
unsetopt correct_all
unsetopt correct
DISABLE_CORRECTION="true"
# completion detail
zstyle ':completion:*:complete:-command-:*:*' ignored-patterns '*.pdf|*.exe|*.dll'
zstyle ':completion:*:*sh:*:' tag-order files



# default keymap
bindkey -s '\ee' 'vim\n'
bindkey '\ej' down-line-or-history
bindkey '\ek' up-line-or-history
bindkey '\eh' backward-word
bindkey '\el' forward-word
bindkey -s '\es' 'cd ..\n'
bindkey -s '\e;' 'll\n'
bindkey '\e[1;3D' backward-word
bindkey '\e[1;3C' forward-word
bindkey -s '\ew' 'cd $HOME/Desktop/Workspace\n'
bindkey -s '\er' 'cdr\n'
bindkey -s '\eu' 'ranger_cd\n'

# PATH
export PATH=$PATH:~/.local/bin
alias sudopath="sudo env PATH=$PATH"

# Enable 256 color to make auto-suggestions look nice
# export TERM="xterm-256color"
[[ -n $TMUX ]] && export TERM="screen-256color"


#########################################################################################################################
# local setups
ZSH_LOCAL_FILE=~/.zshrc_local_asuka

if [ -f "$ZSH_LOCAL_FILE" ]; then
    source $ZSH_LOCAL_FILE
fi
