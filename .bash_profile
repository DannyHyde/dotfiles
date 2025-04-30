#!/bin/bash
#                                                                    #
#    File        :    .bash_profile                                  #
#    Location    :    $HOME/.bash_profile                            #
#    Version     :    0.0.1                                          #
#    Description :                                                   #
#        Setting evironment variables inline with XDG specifications #
#        in order to keep $HOME as clean as I can.                   #
#    Reference   :                                                   #
#        https://specifications.freedesktop.org/basedir-spec/latest/ #
#        https://wiki.archlinux.org/title/XDG_Base_Directory         #
#                                                                    #
######################################################################

#####################   XDG BASE DIRECTORIES     #####################

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

####################     XDG USER DIRECTORIES     ####################

export XDG_DESKTOP_DIR="$HOME/desktop"
export XDG_DOCUMENTS_DIR="$HOME/documents"
export XDG_DOWNLOADS_DIR="$HOME/downloads"
export XDG_MUSIC_DIR="$HOME/music"
export XDG_PICTURES_DIR="$HOME/pictures"
export XDG_TEMPLATES_DIR="$HOME/templates"
export XDG_VIDEOS_DIR="$HOME/videos"

#######################    OTHER XDG PATHS     #######################

## Credentials

export GNUPGHOME="$XDG_DATA_HOME"/gnupg

## DEV TOOLS  ##

export GOPATH="$XDG_DATA_HOME"/go
export GOMODCACHE="$XDG_CACHE_HOME"/go/mod

export NVM_DIR="$XDG_DATA_HOME"/nvm

########################     SHELL CONFIG     ########################

export HISTFILE="$XDG_STATE_HOME"/bash/history

## Path
if [ -d "$HOME/.local/bin" ]; then
  PATH="$HOME/.local/bin:$PATH"
fi

[[ -f /home/danny/.bashrc ]] && source /home/danny/.bashrc
