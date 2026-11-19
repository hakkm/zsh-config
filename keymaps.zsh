# bindkey "^[[A" up-line-or-beginning-search # Up
# bindkey "^[[B" down-line-or-beginning-search # Down
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

bindkey '^[[P' delete-char
bindkey "^p" up-line-or-beginning-search # Up
# bindkey "^n" down-line-or-beginning-search # Down
# bindkey "^r" fh

# zsh-history-substring-search
# bindkey '^[[A' history-substring-search-up
# bindkey '^[[A' up-line-or-search
# bindkey '^[[B' history-substring-search-down

# zsh-autosuggestions
bindkey '^ ' autosuggest-accept

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line


################################
### Programs
bindkey -s '^o' 'ranger\n'
bindkey -s '^f' 'zi\n'
# bindkey -s '^s' 'ncdu\n'
bindkey -s '^v' 'nvim\n'
bindkey -s '^z' 'zellij -l welcome\n'
bindkey -r '^r' 'fh\n' # fzf history
bindkey -s '^r' 'fh\n' # fzf history
bindkey -s '^n' 'fman\n'
bindkey -s '^u' 'suggest -s '
