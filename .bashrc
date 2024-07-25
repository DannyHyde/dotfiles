#!/bin/bash #########################################################
#
#   bash configuration file ($HOME/.config/shell/bashrc)
#
#####################################################################

# If not running interactively, do nothing
case $- in
  *i*) ;;
    *) return;;
esac

################### # Sourcing alias' and scripts ###################

# Global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# Standard completions
if [ -f /usr/share/bash-completion/bash_completion ]; then
  . /usr/share/bash-completion/bash_completion
elif [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi

# Load personal aliases
if [ -f $XDG_CONFIG_HOME/shell/aliasrc ]; then
  . $XDG_CONFIG_HOME/shell/aliasrc
fi

############################## # Prompt #############################

# TODO
PS1="[\d \t \u@\h:\w ] $ "

############################# # Options #############################

# History
export HISTFORMAT="%F %T "
export HISTCONTROL=ignoreboth
export HISTSIZE=100000
shopt -s histappend

# Options
shopt -s checkwinsize

# Use vi mode by load inputrc
if [ -f $XDG_CONFIG_HOME/shell/inputrc ]; then
  bind -f $XDG_CONFIG_HOME/shell/inputrc
fi

# Nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"


# gpg-agent
unset SSH_AGNT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi
export GPG_TTY=$(tty)
gpg-connect-agent updatestartuptty /bye >/dev/null
