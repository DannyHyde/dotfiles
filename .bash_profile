#!/bin/bash #########################################################
#
#   env configuration (.bash_profile)
#   
#   This configuration file, it sets numerous environment variables
#   for my system. Helping to keep in line with XDG specifications.
#   References  :
#       https://specifications.freedesktop.org/basedir-spec/latest/ar01s03.html
#       https://wiki.archlinux.org/title/XDG_BASE_DIRECTORY
#
################################################################################

##############################     PATH VARIABLES     ##########################

# USER bin-dir
export PATH="$HOME/.local/bin:$PATH"
for d in "$HOME/.local/bin/*/"; do
	PATH="$d:$PATH"
done

export PATH=$PATH:GOPATH/bin

#############################     DEFAULT PROGRAMS     #########################

export VISUAL="nvim"
export EDITOR="nvim"
export TERMINAL="alacritty"
export BROWSER="w3m"

###########################     XDG BASE DIRECTORIES     #######################

export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

export XDG_DATA_DIRS="${XDG_DATA_DIRS:=/usr/local/share:/usr/share}"
export XDG_CONFIG_DIRS="${XDG_CONFIG_DIRS:=/etc/xdg}"

# XDG_RUNTIME_DIR
if [ -z "$XDG_RUNTIME_DIR" ]; then
	XDG_RUNTIME_DIR=/run/user/$UID
	if [ ! -d "$XDG_RUNTIME_DIR" ]; then
		XDG_RUNTIME_DIR=/tmp/$USER-runtime
		[ ! -d "$XDG_RUNTIME_DIR" ] && mkdir -m 0700 "$XDG_RUNTIME_DIR"
	fi
fi

#############################     USER DIRECTORIES     ###############

export XDG_DOCUMENTS_DIR="$HOME/documents"
export XDG_DOWNLOAD_DIR="$HOME/downloads"
export XDG_PICTURES_DIR="$HOME/pictures"
export XDG_MUSIC_DIR="$HOME/music"
export XDG_VIDEOS_DIR="$HOME/videos"

#############################    OTHER DIRECTORIES     ##############

# Credentials
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
SSH_AGENT_PID=""
SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/gnupg/S.gpg-agnt.ssh"
export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"
export PASSWORD_STORE_DIR="XDG_DATA_HOME/pass"

# Config Directories
export XINITRC="$XDG_CONFIG_HOME/x11/xinitrc"

# Mail
export MAILDIR="$HOME/mail"
export MBSYNCRC="$XDG_CONFIG_HOME/isync/mbsyncrc"
export MSMTPRC="$XDG_CONFIG_HOME/msmtp/config"
export MUTTRC="$XDG_CONFIG_HOME/neomutt/neomuttrc"
export NOTMUCH_CONFIG="$XDG_CONFIG_HOME/notmuch/config"

# History
export HISTFILE="$XDG_STATE_HOME/history"

# Node
export NVM_DIR="$XDG_CONFIG_HOME/nvm"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"

# Golang
export GOPATH="$XDG_DATA_HOME/go"
export GOMODCACHE="$XDG_CACHE_HOME/go/mod"

# w3m
export W3M_DIR="$XDG_STATE_HOME/w3m"

##############################     START X SERVER     ###############

# Start X on login
[ "$(tty)" = "/dev/tty1" ] && ! pidof -s Xorg >/dev/null 2>&1 && exec startx "$XINITRC"
