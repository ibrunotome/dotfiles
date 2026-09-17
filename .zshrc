export PATH="/opt/homebrew/bin:/usr/local/bin:$PATH"

alias gbrmain='git branch | grep -v "main" | grep -v "\*" | xargs -r git branch -D'

source "$(brew --prefix antidote)/share/antidote/antidote.zsh"

antidote load

autoload -Uz compinit
compinit

command -v starship >/dev/null && eval "$(starship init zsh)"
