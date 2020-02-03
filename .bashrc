#
# ~/.bashrc	Edited by Julian
#
# If not running interactively, don't do anything
  [[ $- != *i* ]] && return
# Language Stuff
  export LANG=en_GB.UTF8
  export LANGUAGE=en_GB.UTF8
  export LC_CTYPE=en_GB.UTF8
# Clean Up The Home Dir# Clean Up The Home Dir
  export VIMINIT="source ~/.vim/vimrc"
# Aliases
  alias ls='ls --color=auto'
  alias ll='ls -la'
  alias cls='clear'
# PS1
  export PS1='\n\[\033[38;5;3m\]\\$\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;6m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;3m\]@\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;175m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;3m\]>\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]'
# Paths
  export PATH="$PATH:/home/julian/dotfiles/.bin/path"
  export PATH="$PATH:/home/julian/dotfiles/.bin"
  export PATH="$PATH:/home/julian/dotfiles/.bin/git"
  export PATH="$PATH:/home/julian/dotfiles/.bin/mutt"
