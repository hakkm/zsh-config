#!/bin/bash

## temporary aliases

# ## pacman and yay
# alias i='yay -S'
# alias u='yay -Syu'
# alias r='yay -Rns'   # remove a package and its dependencies which are not required by any other installed package:
# alias q='yay -Ss'
# alias c='yay -Yc'

# ## apt 
# alias i='sudo apt install' # install 
# alias u='sudo apt update && sudo apt dist-upgrade' # updating
# alias update='sudo apt update' # update
# alias r='sudo apt remove' # remove
# alias q='apt search'  # search
# alias c='sudo apt autoremove' # clean
# alias d='sudo apt show' # details
# alias li='apt list --installed' # list installed packages
# alias L='apt list' # list all packages


## dnf
alias i='sudo dnf install'             # install
alias u='sudo dnf upgrade --refresh'   # update all with metadata refresh
alias update='sudo dnf check-update'   # check for updates
alias r='sudo dnf remove'              # remove
alias q='dnf search'                   # search
alias c='sudo dnf autoremove'          # clean unneeded dependencies
alias d='dnf info'                     # details of a package
alias li='dnf list installed'          # list installed packages
alias L='dnf list all'                 # list all available packages

# gh
alias suggest='gh copilot suggest'
alias explain='gh copilot explain'

# xev 
alias xev="xev | awk -F'[ )]+' '/^KeyPress/ { a[NR+2] } NR in a { printf \"%-3s %s\n\", \$5, \$8 }'"

# chmod 
alias x="chmod +x"

# programs/cli tools
alias ob=obsidian
alias sxiv=nsxiv
alias k=kubectl

# alias xp="xppen"
alias lg="lazygit"
alias lk="lazydocker"
alias obsflatpak="noisetorch &  flatpak run com.obsproject.Studio"

alias rg='ranger'
alias cat="bat -n --pager less"
alias zz="z -"
alias cd="z"
alias vi='vim'
alias nv='nvim'
#alias nv=nvim
alias pnv="XDG_CONFIG_HOME=~/.config/$EDITOR.fresh XDG_DATA_HOME=~/.local/share/nvim.fresh XDG_STATE_HOME=~/.local/state/nvim.fresh nvim"
alias au="$EDITOR ~/.config/$EDITOR/lua/user/autocommands.lua"
alias zat="zathura"
alias annotator="com.github.phase1geo.annotator"
alias ann="com.github.phase1geo.annotator"
alias an="com.github.phase1geo.annotator"

alias zsh-update-plugins="find "$ZDOTDIR/plugins" -type d -exec test -e '{}/.git' ';' -print0 | xargs -I {} -0 git -C {} pull -q"

# ls 
alias ls='ls --color=auto'
alias ll="exa -l"
alias lll="exa -l -a"
alias tree="exa --tree"

# config 
alias zellijrc="$EDITOR ~/.config/zellij/config.kdl"
alias aliasrc="$EDITOR ~/.config/zsh/aliases.zsh"
alias alrc="$EDITOR ~/.config/zsh/aliases.zsh"
alias al="$EDITOR ~/.config/zsh/aliases.zsh"
alias exrc="$EDITOR ~/.config/zsh/exports.zsh"
alias nvrc="$EDITOR ~/.config/nvim/init.lua"
alias zshrc="$EDITOR ~/.config/zsh/"
alias rangerrc="$EDITOR ~/.config/ranger/rc.conf"
alias lfrc="$EDITOR ~/.config/lf/lfrc"
alias dwmrc='cd ~/.config/dwm/ && $EDITOR config.def.h'
alias dmrc='cd ~/.config/dmenu/'
alias zathurarc="$EDITOR ~/.config/zathura/zathurarc"
alias zathrc="$EDITOR ~/.config/zathura/zathurarc"
alias zarc="$EDITOR ~/.config/zathura/zathurarc"
alias alacrittyrc="$EDITOR ~/.config/alacritty/alacritty.toml"
alias slrc='cd ~/.config/slstatus/ && $EDITOR .'
alias sxrc="$EDITOR ~/.config/sxhkd/sxhkdrc"
alias reload-sxhkd="killall -USR1 sxhkd"
alias sxivrc="$EDITOR ~/.config/nsxiv/exec/key-handler"
alias nsxivrc="$EDITOR ~/.config/nsxiv/exec/key-handler"
alias picomrc="$EDITOR ~/.config/picom.conf"
alias tmuxrc="$EDITOR ~/.tmux.conf"
alias xres="$EDITOR ~/.Xresources"
alias cmrc="$EDITOR ~/.config/zsh/commands.zsh"

alias xampp_panel="sudo /opt/lampp/manager-linux-x64.run"
alias pymg="python manage.py"
alias dfxcommand="source "$XDG_DATA_HOME/dfx/env""

alias rndir='. /home/khabir/.local/bin/rndir'

## scripts
# alias sc='cd ~/.local/scripts'   # use sc as a fzf

# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
# alias rm='rm -i'

# easier to read disk
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB

# get top process eating memory
alias psmem='ps auxf | sort -nr -k 4 | head -5'

# get top process eating cpu ##
alias pscpu='ps auxf | sort -nr -k 3 | head -5'

# systemd
alias list_systemctl="systemctl list-unit-files --state=enabled"

# brave-browser
alias brave='brave-browser'

# learning 
alias lnx='$BROWSER https://www.netacad.com/portal/learning'
alias nt='$BROWSER "https://skillsforall.com/launch?id=f393c38f-b410-4d2b-8275-70e144273519&tab=curriculum&view=79932ede-7bba-57ef-a312-ac4d72c37c84"'
alias drive='$BROWSER https://drive.google.com/drive/my-drive'
alias email='$BROWSER https://mail.google.com/mail/u/0'
alias swm='$BROWSER https://www.youtube.com/watch?v=382OExOIipQ&t=3354s'
# alias slack='$BROWSER https://app.slack.com/client/T06MCFU1YJ2/C06MFV0V0CW'

# suspend or sleep the computer
alias go-sleep='systemctl suspend -i'


# co$EDITORert from anything to pdf
alias topdf="soffice --headless --co$EDITORert-to pdf "

# for shutdown now
alias sn="shutdown now"

# xppen config app
alias xppen="~/apps/xppen_tablet/XPPenLinux3.4.6-230714/App/usr/lib/pentablet/PenTablet.sh"

alias montage="shotcut"

# php
# alias artisan="php artisan"
# alias a="php artisan"
# alias tinker="php artisan tinker"
# alias serve="php artisan serve"


# zeelij 
function ze () { zellij edit "$*";}
function zef () { zellij edit --floating "$*";}
function zei () { zellij edit --in-place "$*";}

# appimages
alias cursor=~/apps/appimages/Cursor-1.0.0-x86_64.AppImage

# kubectl
alias k=kubectl
