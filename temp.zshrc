
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export PATH=/Users/egomez/.local/bin:~/Library/Python/2.7/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/egomez/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="spaceship"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    zsh-autosuggestions
    zsh-syntax-highlighting
    docker
    docker-compose
    kubectl
    gcloud
    golang
    colored-man-pages
    command-not-found
    fasd #https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/fasd
    fd #https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/fd
    fzf #https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/fzf
    direnv #https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/direnv
    common-aliases #https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/common-aliases
    autoenv #https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/autoenv
    copybuffer #https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/copybuffer
    copydir # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/copydir
    copyfile # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/copyfile
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# Preferred editor for local and remote sessions
# export LANG=en_US.UTF-8

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  # export EDITOR='/Applications/Emacs.app/Contents/MacOS/bin/emacsclient -c -s ~/.emacs.d/server/server'
  export EDITOR='lvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
 # alias zshconfig="/Applications/Emacs.app/Contents/MacOS/bin/emacsclient -c -s ~/.emacs.d/server/server ~/.zshrc"
 # alias ohmyzsh="/Applications/Emacs.app/Contents/MacOS/bin/emacsclient -c -s ~/.emacs.d/server/server ~/.oh-my-zsh"
 # alias myzsh="/Applications/Emacs.app/Contents/MacOS/bin/emacsclient -c -s ~/.emacs.d/server/server ~/.erick.zsh"
 # alias mantlzsh="/Applications/Emacs.app/Contents/MacOS/bin/emacsclient -c -s ~/.emacs.d/server/server ~/.mantl.zsh"
 alias zshconfig="lvim ~/.zshrc"
 alias ohmyzsh="lvim ~/.oh-my-zsh"
 alias myzsh="lvim ~/.erick.zsh"
 alias mantlzsh="lvim ~/.mantl.zsh"

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Edit line in vim buffer ctrl-v
autoload edit-command-line; zle -N edit-command-line
bindkey '^v' edit-command-line
# Enter vim buffer from normal mode
autoload -U edit-command-line && zle -N edit-command-line && bindkey -M vicmd "^v" edit-command-line


# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'left' vi-backward-char
bindkey -M menuselect 'down' vi-down-line-or-history
bindkey -M menuselect 'up' vi-up-line-or-history
bindkey -M menuselect 'right' vi-forward-char
# Fix backspace bug when switching modes
bindkey "^?" backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/egomez/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/egomez/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/egomez/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/egomez/google-cloud-sdk/completion.zsh.inc'; fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/vault vault

export DOCKER_BUILDKIT=1
export COMPOSE_DOCKER_CLI_BUILD=1
export BUILDKIT_STEP_LOG_MAX_SIZE=1073741824
source /Users/egomez/.erick.zsh
source /Users/egomez/.mantl.zsh

# fnm
export PATH=/Users/egomez/.fnm:$PATH
eval "`fnm env`"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
if [ -e /Users/egomez/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/egomez/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes
autoload -U compinit; compinit

alias kubectl=kubecolor
compdef kubecolor=kubectl

eval "$(direnv hook zsh)"
source $(brew --prefix autoenv)/activate.sh
export FZF_BASE=/Users/egomez/.fzf/bin/fzf
export FZF_DEFAULT_COMMAND=fd
export NODE_PATH=$(npm root -g)

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/zsh/__tabtab.zsh ]] && . ~/.config/tabtab/zsh/__tabtab.zsh || true

# source ~/.minikube-completion
# eval "$(minikube docker-env)"
