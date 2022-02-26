# shellcheck shell=sh
COLOR_SCHEME=dark # dark/light

# --------------------------------- ALIASES -----------------------------------
#alias ..='cd ..'
#alias cp='cp -v'
## alias rm='rm -Ir'
#alias mv='mv -iv'
#alias ln='ln -sriv'
#alias xclip='xclip -selection c'

### Colorize commands
#alias ls='ls --color=auto'
#alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias diff='diff --color=auto'
alias ip='ip --color=auto'
alias pacman='pacman --color=auto'

# k9s
export K9SCONFIG="${HOME}/.config/k9s"
# alias k9s='EDITOR=/Applications/Emacs.app/Contents/MacOS/bin/emacsclient -c -s ~/.emacs.d/server/server k9s'
alias k9s='EDITOR=lvim k9s'
# k9s editor
# export K9S_EDITOR="/Applications/Emacs.app/Contents/MacOS/bin/emacsclient -c -s ~/.emacs.d/server/server"
export K9S_EDITOR="lvim"
# alias nvim='lvim'

open_files() {
  lsof -n | cut -f1 -d ' ' | uniq -c | sort | tail
}

### LS & TREE
#alias ll='ls -la'
#alias la='ls -A'
#alias l='ls -F'
command -v lsd > /dev/null && alias ls='lsd --group-dirs first' && \
	alias tree='lsd --tree'
command -v colorls > /dev/null && alias ls='colorls --sd --gs' && \
	alias tree='colorls --tree'

### CAT & LESS
command -v bat > /dev/null && \
	alias bat='bat --theme=ansi' && \
	alias cat='bat --pager=never' && \
	alias less='bat'

### MAN PAGES
export MANPAGER=batman
alias man='batman'

### BAPIPE
export BATPIPE=color


### TOP
command -v btm > /dev/null && alias top='btm $([ "$COLOR_SCHEME" = "light" ] && echo "--color default-light")'

# --------------------------------- SETTINGS ----------------------------------
# setopt AUTO_CD
# setopt BEEP
# #setopt CORRECT
# setopt HIST_BEEP
# setopt HIST_EXPIRE_DUPS_FIRST
# setopt HIST_FIND_NO_DUPS
# setopt HIST_IGNORE_ALL_DUPS
# setopt HIST_IGNORE_DUPS
# setopt HIST_REDUCE_BLANKS
# setopt HIST_SAVE_NO_DUPS
# setopt HIST_VERIFY
# setopt INC_APPEND_HISTORY
# setopt INTERACTIVE_COMMENTS
# setopt MAGIC_EQUAL_SUBST

# setopt NOTIFY
# setopt NUMERIC_GLOB_SORT
# setopt PROMPT_SUBST
# setopt SHARE_HISTORY

# Key bindings
# bindkey -v
# bindkey '^U' backward-kill-line
# bindkey '^[[2~' overwrite-mode
# bindkey '^[[3~' delete-char
# bindkey '^[[H' beginning-of-line
# bindkey '^[[1~' beginning-of-line
# bindkey '^[[F' end-of-line
# bindkey '^[[4~' end-of-line
# bindkey '^[[1;5C' forward-word:
# bindkey '^[[1;5D' backward-word
# bindkey '^[[3;5~' kill-word
# bindkey '^[[5~' beginning-of-buffer-or-history
# bindkey '^[[6~' end-of-buffer-or-history
# bindkey '^[[Z' undo
# bindkey ' ' magic-space

# ----------------------------------- MISC -----------------------------------
# export VISUAL="/Applications/Emacs.app/Contents/MacOS/bin/emacsclient -c -s ~/.emacs.d/server/server"
export VISUAL="lvim"
export EDITOR=$VISUAL
alias  edit="${EDITOR}"
# enable terminal linewrap
setterm -linewrap on 2> /dev/null

## colorize man pages
#export LESS_TERMCAP_mb=$'\e[1;32m'
#export LESS_TERMCAP_md=$'\e[1;32m'
#export LESS_TERMCAP_me=$'\e[0m'
#export LESS_TERMCAP_se=$'\e[0m'
#export LESS_TERMCAP_so=$'\e[01;33m'
#export LESS_TERMCAP_ue=$'\e[0m'
#export LESS_TERMCAP_us=$'\e[1;4;31m'
#export LESSHISTFILE=-

export PATH=/Users/egomez/go/bin:$PATH

#vterm
# vterm_printf(){
#     if [ -n "$TMUX" ] && ([ "${TERM%%-*}" = "tmux" ] || [ "${TERM%%-*}" = "screen" ] ); then
#         # Tell tmux to pass the escape sequences through
#         printf "\ePtmux;\e\e]%s\007\e\\" "$1"
#     elif [ "${TERM%%-*}" = "screen" ]; then
#         # GNU screen (screen, screen-256color, screen-256color-bce)
#         printf "\eP\e]%s\007\e\\" "$1"
#     else
#         printf "\e]%s\e\\" "$1"
#     fi
# }

# if [[ "$INSIDE_EMACS" = 'vterm' ]]; then
#     alias clear='vterm_printf "51;Evterm-clear-scrollback";tput clear'
# fi

# vterm_cmd() {
#     local vterm_elisp
#     vterm_elisp=""
#     while [ $# -gt 0 ]; do
#         vterm_elisp="$vterm_elisp""$(printf '"%s" ' "$(printf "%s" "$1" | sed -e 's|\\|\\\\|g' -e 's|"|\\"|g')")"
#         shift
#     done
#     vterm_printf "51;E$vterm_elisp"
# }

# vterm_prompt_end() {
#     vterm_printf "51;A$(PROMPT)";
# }
# setopt PROMPT_SUBST



# find_file() {
#     vterm_cmd find-file "$(realpath "${@:-.}")"
# }

# say() {
#     vterm_cmd message "%s" "$*"
# }

# open_file_below() {
#     vterm_cmd find-file-below "$(realpath "${@:-.}")"
# }

# vterm_set_directory() {
#     vterm_cmd update-pwd "$PWD/"
# }

# autoload -U add-zsh-hook
# add-zsh-hook -Uz chpwd (){ vterm_set_directory }
