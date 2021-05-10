#!/bin/bash

## Copyright (c) 2021 mangalbhaskar. All Rights Reserved.
##__author__ = 'mangalbhaskar'
###----------------------------------------------------------
## Install item individually of a Lscripts software full stack
###----------------------------------------------------------


trap ctrlc_handler INT

## trap 'exit 0' INT or simply trap INT 
function ctrlc_handler {
  (>&2 echo -e "\e[0;101m CTRL-C pressed; Terminating..!\e[0m\n")
  exit
}

function itemstack-setup() {
  local LSCRIPTS="$( cd "$( dirname "${BASH_SOURCE[0]}")" && pwd )"
  source "${LSCRIPTS}/lscripts/_common_.sh"

  declare -a _stack_install=(
    ###----------------------------------------------------------    
    ## "stack-setup-prerequisite"
    ###----------------------------------------------------------    
    # "prerequisite_lite"
    "prerequisite"
    "prerequisite-pcl"
    "prerequisite-opencv"
    ###----------------------------------------------------------
    ## "stack-setup-nvidia-cuda-python-docker"
    ###----------------------------------------------------------
    "nvidia-driver"
    "docker-ce"
    "docker-compose"
    "nvidia-container-toolkit"
    "python"
    "python-virtualenvwrapper"
    "cuda-stack"
    ###----------------------------------------------------------
    ## "stack-setup-utils"
    ###----------------------------------------------------------
    "utils-core-apt"
    "utils-extras-apt"
    "utils-essentials-apt"
    "diff-tools"
    "vim-apt"
    "vim-plug"
    "sublime-apt"
    "atom-wget-dpkg"
    ###----------------------------------------------------------    
    ## "stack-setup-programming"
    ###----------------------------------------------------------
    "java-apt"
    "php"
    "apache2"
    "nginx-apt"
    "nvm"
    "nodejs"
    "yarn"
    ###----------------------------------------------------------    
    ## "stack-setup-storage"
    ###----------------------------------------------------------
    "redis-wget-make"
    "postgres-postgis-apt"
    "mysql-apt"
    "mongodb-apt"
    "couchdb-apt"
    ###----------------------------------------------------------    
    ## "stack-setup-multimedia"
    ###----------------------------------------------------------
    "vlc-apt"
    "ffmpeg-apt"
    "videofix-apt"
    "inkscape-graphics-apt"
    "imageviewer-cmdline-apt"
    "imagemagic-graphics-apt"
    "gimp-graphics-apt"
    "audacity-apt"
    ###----------------------------------------------------------    
    ## "stack-setup-epub"
    ###----------------------------------------------------------
    "latex-apt"
    "pandoc-wget-dpkg"
    "haroopad-wget-dpkg"
    "typora-apt"
    "ghostwriter-apt"
    "latex-editors-apt"
    "epub-editors-apt"
    "epub-readers-apt"
    ###----------------------------------------------------------    
    ## "stack-setup-misc"
    ###----------------------------------------------------------
    "balenaetcher-apt"
  )

  # declare -a _stack_verify=()

  _log_.warn "Install ${FUNCNAME[0]}; sudo access is required!"
  _fio_.yesno_yes "Continue" && {
    local item
    for item in "${_stack_install[@]}";do
      _log_.info ${item}
      local _item_filepath="${LSCRIPTS}/lscripts/${item}-install.sh"

      _log_.echo "Checking for installer..." && \
      ls -1 "${_item_filepath}" 2>/dev/null && {
        _fio_.yesno_no "Install ${item}" && {
          _log_.ok "Executing installer... ${_item_filepath}" && \
          _log_.echo "Installing..."
          source "${_item_filepath}" || _log_.error "${_item_filepath}"
        } || _log_.echo "Skipping ${item} installation!"
      } || _log_.error "Installer not found: ${item}!"
    done
  } || _log_.echo "Skipping ${FUNCNAME[0]} installation!"
}

itemstack-setup
