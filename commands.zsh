#!/bin/zsh

cdpr(){cd "$(find ~/pr -type d | grep -v -e "node_modules" -e "/.git" -e ".vscode" -e "__MACOSX" -e ".cache" -e "env" -e ".ipython" -e /"*.egg-info" -e "latex-beamer*" -e ".ipynb_checkpoints" -e ".idea" | fzf )"}

fcd(){cd "$(find . -type d | grep -v -e "node_modules" -e "/.git" -e ".vscode" -e "__MACOSX" -e ".cache" -e "env" -e ".ipython" -e /"*.egg-info" -e "latex-beamer*" -e ".ipynb_checkpoints" -e ".idea" | fzf )"}

pr(){find ~/pr -type d | grep -v -e "node_modules" -e "/.git" -e ".vscode" -e "__MACOSX" -e ".cache" -e "env" -e ".ipython" -e /"*.egg-info" -e "latex-beamer*" -e ".ipynb_checkpoints" -e ".idea" | fzf}

sc() {
find ~/.local/scripts/ -type f | grep -v -e ".git" -e "Makefile" | fzf --preview "bat --color=always --style=plain {}" | xargs -r nvim
}

co() {
find ~/.dotfiles ~/.config/ -type f | grep -v -e ".git" -e "Makefile" -e "Brave" -e "Virtual" | fzf --preview "bat --color=always --style=plain {}" | xargs -r nvim
}

etc() {
find /etc -type f | grep -v -e ".git" -e "Makefile" -e "Brave" -e "Virtual" | fzf --preview "bat --color=always --style=plain {}" | xargs -r nvim
}

# General One
## Search For a File
sff() {
find $@ -type f | grep -v -e ".git" -e "Makefile" -e "Brave" -e "Virtual" | fzf --preview "bat --color=always --style=plain {}" | xargs -r nvim
}
sf() {
find $@ -type f | grep -v -e ".git" -e "Makefile" -e "Brave" -e "Virtual" | fzf --preview "bat --color=always --style=plain {}" | xargs -r nvim
}

# show 256 colors
color() {
  x=`tput op`;
  y=`printf %76s`;
  for i in {0..256};do
    o=00$i
    echo -e ${o:${#o}-3:3} `tput setaf $i
    tput setab $i`${y// /=}$x
  done

}

mkcd() {
  mkdir -p "$1" && cd "$1"
}
mc() {
  mkdir -p "$1" && cd "$1"
}

# Define the signal handler
handle_sigint() {
  echo "Caught SIGINT signal! Exiting..."
}

# Trap SIGINT (Ctrl+C)
# trap 'handle_sigint' SIGINT

stl() {
  mpv ~/vids/learning/HYPER_EFFICIENT_STUDY_WITH_ME.mp4 > /dev/null
}

kill_safeeyes() {
  kill -SIGKILL `pgrep -x safeeyes`
}

# Codi
# Usage: codi [filetype] [filename]
codi() {
  local syntax="${1:-python}"
  shift
  nvim -c "Codi $syntax" "$@"
}

fcd() {
    local dir
    dir=$(find * -type d | fzf +m) && cd "$dir"
}
cdf() {
    local dir
    dir=$(find * -type d | fzf +m) && cd "$dir"
}

record() {
  echo "Type basename of file to record to: "
  read file

  echo "Recording to ~/vids/rec/$file.mp4"

  # ffmpeg -f x11grab -i :0.0 ~/vids/rec/out.mp4
  ffmpeg -loglevel quiet -f x11grab -i :0.0 ~/vids/rec/$file.mp4 > /dev/null
}

# fd - cd to selected directory
#fd() {
#  local dir
#  dir=$(find ${1:-.} -path '*/\.*' -prune \
#                  -o -type d -print 2> /dev/null | fzf +m) &&
#  cd "$dir"
#}

# fh - repeat history
fh() {
  print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed -E 's/ *[0-9]*\*? *//' | sed -E 's/\\/\\\\/g')
}

#####################################
### Docker 

# Select a docker container to start and attach to
function da() {
  local cid
  cid=$(docker ps -a | sed 1d | fzf -1 -q "$1" | awk '{print $1}')

  [ -n "$cid" ] && docker start "$cid" && docker attach "$cid"
}

# Select a running docker container to stop
function ds() {
  local cid
  cid=$(docker ps | sed 1d | fzf -q "$1" | awk '{print $1}')

  [ -n "$cid" ] && docker stop "$cid"
}

# Select a docker container to remove
function drm() {
  local cid
  cid=$(docker ps -a | sed 1d | fzf -q "$1" | awk '{print $1}')

  [ -n "$cid" ] && docker rm "$cid"
}

# Same as above, but allows multi selection:
function drm() {
  docker ps -a | sed 1d | fzf -q "$1" --no-sort -m --tac | awk '{ print $1 }' | xargs -r docker rm
}

# Select a docker image or images to remove
function drmi() {
  docker images | sed 1d | fzf -q "$1" --no-sort -m --tac | awk '{ print $3 }' | xargs -r docker rmi
}

#####################################
### Man pages

export MANPAGER="sh -c 'col -bx | bat -l man -p --paging always'"
# Same as above, but with previews and works correctly with man pages in different sections.
fman() {
    man -k . | sort | fzf \
    -q "$1" \
    --ansi \
    --tiebreak=begin \
    --prompt=' Man > '  \
    --preview-window '50%,rounded,<50(up,85%,border-bottom)' \
    --preview $'echo {} | tr -d \'()\' | awk \'{printf "%s ", $2} {print $1}\' | xargs -r man | col -bx | bat -l man -p --color always' \
      | tr -d '()' \
      | awk '{printf "%s ", $2} {print $1}' \
      | xargs -r man
}

# compile the interpret java source code 
jv() {
  javac $1.java && java $1
}

#####################################
### Emojies


emojis() {
  emojis=$(curl -sSL 'https://git.io/JXXO7')
  selected_emoji=$(echo $emojis | fzf)
  echo $selected_emoji
  # copy just the emoji to the clipboard
  echo $selected_emoji | awk '{print $1}' | tr -d '\n' | xclip -selection clipboard
}

listports() {
  ss -tuln
}

cv() {
  code ~/docs/cv/new
}

h2-console() {
  ~/apps/h2/bin/h2.sh
}

disable_wrap() { print -n '\e[?7l'; }
enable_wrap()  { print -n '\e[?7h'; }

#####################################
### zellij
function zr () { zellij run --name "$*" -- zsh -ic "$*";}
function zrf () { zellij run --name "$*" --floating -- zsh -ic "$*";}
function zri () { zellij run --name "$*" --in-place -- zsh -ic "$*";}
function ze () { zellij edit "$*";}
function zef () { zellij edit --floating "$*";}
function zei () { zellij edit --in-place "$*";}
function zpipe () {
  if [ -z "$1" ]; then
    zellij pipe;
  else
    zellij pipe -p $1;
  fi
}


