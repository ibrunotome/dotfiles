export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

export PATH="/opt/homebrew/bin:/usr/local/bin:$PATH"

alias gbrmain='git branch | grep -v "main" | grep -v "\*" | xargs -r git branch -D'

GCloudPath="$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk"
[ -f "$GCloudPath/path.zsh.inc" ] && source "$GCloudPath/path.zsh.inc"
[ -f "$GCloudPath/completion.zsh.inc" ] && source "$GCloudPath/completion.zsh.inc"

command -v kubectl >/dev/null && source <(kubectl completion zsh)

command -v direnv >/dev/null && eval "$(direnv hook zsh)"

command -v starship >/dev/null && eval "$(starship init zsh)"
