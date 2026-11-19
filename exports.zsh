#!/bin/zsh

################################
### HISTORY

HISTFILE="$HOME/.config/zsh/.zsh_history"
HISTSIZE=1000000
SAVEHIST=1000000

### to delete if history work as expected: START
setopt append_history
setopt SHARE_HISTORY
setopt inc_append_history
setopt hist_verify
setopt hist_save_no_dups
setopt hist_ignore_all_dups


################################
### exports
export PAGER="$EDITOR +Man!"

### Programs
export BROWSER="brave-browser"
export TERMINAL='alacritty'
export TERMINAL_PROG="alacritty"

export VISUAL=nvim
export EDITOR="nvim"
# export VISUAL="$HOME/apps/AppImages/nvim.appimage"
# export EDITOR="$HOME/apps/AppImages/nvim.appimage"
# export MANPAGER="sh -c 'col -bx | bat -l man -p --paging always'"
export MANPAGER='nvim +Man!'
# export PAGER='$EDITOR +Man!'
# export PAGER="sh -c 'col -bx | bat -l man -p --paging always'"
export PAGER="bat -l man -p --paging always"
export OPENER='zathura'
# export TERMINAL='warp-terminal'
export MANWIDTH=999
export IMAGE_VIEWER='nsxiv'
export ANNOTATOR='com.github.phase1geo.annotator'

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# opencv
export PKG_CONFIG_PATH=/usr/lib/x86_64-linux-gnu/pkgconfig
export LD_LIBRARY_PATH=/usr/lib/x86_64-linux-gnu/opencv4:$LD_LIBRARY_PATH
export PATH_TO_FX=/home/khabir/apps/javafx-sdk-23/lib
export JAVA_HOME=/usr/lib/jvm/java-21-openjdk

# Docker
export DOCKER_HOST=unix:///var/run/docker.sock

# tomcat
export CATALINA_HOME=/opt/apache-tomcat-11.0.0
export PATH=$PATH:$CATALINA_HOME/bin

# fedora 
export FERDIUM_SERVER_URL=https://api.ferdium.org


### Locations
# export ZDOTDIR=$HOME/.config/zsh
export OBSIDIAN="/home/khabir/apps/AppImages/Obsidian-1.4.13.AppImage"
export XDG_DATA_DIRS=$HOME/.nix-profile/share:$XDG_DATA_DIRS
export GOPATH=$HOME/.go
export VAULT='/home/khabir/docs/VaultsObsidian/'


# export WGPU_BACKEND=vulkan
# merge in defaults and keymaps

# this export is the cause of the lagging in the terminal
# export LC_ALL=C

### Settings
export RANGER_LOAD_DEFAULT_RC=false   # know ranger load just my rc.conf




################################
### PROMPT - COMPLETIONs
# eval "$(github-copilot-cli alias -- "$0")"


# start python stuff
## pyenv configs
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

if command -v pyenv 1>/dev/null 2>&1; then
  PATH="$(bash --norc -ec 'IFS=:; paths=($PATH);
  for i in ${!paths[@]}; do
  if [[ ${paths[i]} == "''/home/khabir/.pyenv/shims''" ]]; then unset '\''paths[i]'\'';
  fi; done;
  echo "${paths[*]}"')"
  export PATH="/home/khabir/.pyenv/shims:${PATH}"
  export PYENV_SHELL=zsh
  source '/home/khabir/.pyenv/completions/pyenv.zsh'
  command pyenv rehash 2>/dev/null
  pyenv() {
    local command=${1:-}
    [ "$#" -gt 0 ] && shift
    case "$command" in
    rehash|shell)
      eval "$(pyenv "sh-$command" "$@")"
      ;;
    *)
      command pyenv "$command" "$@"
      ;;
    esac
  }
fi

# end python stuff

# i know what i want while using pip 
# don't use a lot of completion because it slow down your machine
# eval "`pip completion --zsh`"           

# dfx stuff 
# source "$XDG_DATA_HOME/dfx/env" 

#############################
#### Adding to PATH
function add_to_path { 
  if [[ ":$PATH:" != *":$1:"* ]]; then
    export PATH=$PATH:$1 
  fi 
}
add_to_path $HOME/.local/bin/apache-maven-3.9.9/bin/ # when you see this remove it don't hesitate
add_to_path $HOME/.local/bin/
add_to_path $HOME/.cargo/bin/
add_to_path /home/khabir/.local/bin
add_to_path /home/khabir/.local/bin/mine
add_to_path /home/khabir/.local/bin/statusbar/
add_to_path /home/khabir/.nix-profile/bin
add_to_path $PYENV_ROOT/bin
add_to_path /home/khabir/.local/scripts
add_to_path /home/khabir/apps/rstudio-desktop-bin/pkg/rstudio-desktop-bin/usr/lib/rstudio/
add_to_path /home/khabir/.config/zsh/zsh-commands
add_to_path /home/khabir/.go/bin
add_to_path /usr/bin/bat:/usr/bin/nsxiv:/usr/bin/zathura
add_to_path /usr/bin/lua
add_to_path /opt/nvim-linux64/bin
add_to_path /home/khabir/bin/idea-IU-242.22855.74/bin/
add_to_path $CARGO_HOME/bin
add_to_path $HOME/.local/bin/apache-maven-3.9.9/bin/

# android emulator stuff
export ANDROID_HOME=$HOME/Android/Sdk
add_to_path $ANDROID_HOME/emulator 
add_to_path $ANDROID_HOME/platform-tools

# ranger quit with Q cd to current dir
function ranger {
    local IFS=$'\t\n'
    local tempfile="$(mktemp -t tmp.XXXXXX)"
    local ranger_cmd=(
        command
        ranger
        --cmd="map w chain shell echo %d > "$tempfile"; quitall"
    )
    
    ${ranger_cmd[@]} "$@"
    if [[ -f "$tempfile" ]] && [[ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]]; then
        cd -- "$(cat "$tempfile")" || return
    fi
    command rm -f -- "$tempfile" 2>/dev/null
}

# Preventing nested ranger instances
ranger() {
    if [ -z "$RANGER_LEVEL" ]; then
        /usr/bin/ranger "$@"
    else
        exit
    fi
}

# opencv
export PKG_CONFIG_PATH=/usr/lib/x86_64-linux-gnu/pkgconfig

# cpp
# export CPPFLAGS="-I/usr/include"
# export LDFLAGS="-L/usr/lib"
# export LD_LIBRARY_PATH=/usr/lib/x86_64-linux-gnu/opencv4:$LD_LIBRARY_PATH


# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pnpm
export PNPM_HOME="/home/khabir/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end



#####################################
### Warp Stuff
printf '\eP$f{"hook": "SourcedRcFileForWarp", "value": { "shell": "zsh" }}\x9c'

