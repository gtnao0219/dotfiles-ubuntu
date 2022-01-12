## Zinit
if [[ ! -d $ZINIT_HOME/bin ]]; then
  if whence git > /dev/null; then
    git clone --depth 10 https://github.com/zdharma-continuum/zinit.git $ZINIT_HOME/bin
  fi
fi
source $ZINIT_HOME/bin/zinit.zsh

zinit light zdharma-continuum/fast-syntax-highlighting
zinit light woefe/git-prompt.zsh


## Prompt 
ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_SEPARATOR="|"
ZSH_THEME_GIT_PROMPT_DETACHED="%{$fg_bold[cyan]%}:"
ZSH_THEME_GIT_PROMPT_BRANCH="%{$fg_bold[white]%} "
ZSH_THEME_GIT_PROMPT_UPSTREAM_PREFIX="%{$fg[magenta]%}->%{$fg[cyan]%}"
ZSH_THEME_GIT_PROMPT_UPSTREAM_SUFFIX=" "
ZSH_THEME_GIT_PROMPT_BEHIND="%{$fg_bold[cyan]%}↓ "
ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg_bold[cyan]%}↑ "
ZSH_THEME_GIT_PROMPT_UNMERGED=" %{$fg[red]%}X:"
ZSH_THEME_GIT_PROMPT_STAGED=" %{$fg[green]%}M:"
ZSH_THEME_GIT_PROMPT_UNSTAGED=" %{$fg[red]%}M:"
ZSH_THEME_GIT_PROMPT_UNTRACKED=" %{$fg[red]%}?:"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg_bold[green]%}✔ "
ZSH_THEME_GIT_PROMPT_STASHED=" %{$fg[blue]%}Stash:"
ZSH_GIT_PROMPT_SHOW_UPSTREAM=full
ZSH_GIT_PROMPT_SHOW_STASH=1
ZSH_GIT_PROMPT_FORCE_BLANK=1
PROMPT='%F{yellow}%~%f$(gitprompt)
$ '


# Autoload
autoload -Uz add-zsh-hook
autoload -Uz colors && colors
autoload -Uz compinit && compinit


## History 
HISTFILE=${HOME}/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

# [[ -z "$TMUX" && ! -z "$PS1" ]] && tmux

## Keybinds

# Emacs-like keybind
bindkey -e

# peco
_peco-src() {
  local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N _peco-src
bindkey '^]' _peco-src


## Aliases
if whence nvim > /dev/null; then
  alias vim="nvim"
fi

if whence todo-txt > /dev/null; then
  alias todo="todo-txt"
fi

## Setopts
setopt always_last_prompt
setopt append_history
setopt auto_list
setopt auto_menu
setopt auto_cd
setopt auto_param_keys
setopt auto_param_slash
setopt auto_pushd
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_no_store
setopt hist_reduce_blanks
setopt no_beep
setopt pushd_ignore_dups
setopt sharehistory

