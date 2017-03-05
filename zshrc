# Source Prezto
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# How can I live without you, fzf?
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

ZSHRC_DIR=$HOME/zshrc.d
for rcFile in $(ls $ZSHRC_DIR); do
	source "$ZSHRC_DIR/$rcFile"
done

# Using vi-binding in command line doesn't support these bindings
bindkey '^P' up-history
bindkey '^N' down-history
