ZSHRC_DIR=$HOME/.zshrc.d

source "$ZSHRC_DIR/alias.zsh"
source "$ZSHRC_DIR/functions.zsh"

source "${HOME}/.zgen/zgen.zsh"

# if the init script doesn't exist
if ! zgen saved; then
	echo "Creating a zgen save"

	zgen load zsh-users/zsh-syntax-highlighting

	zgen prezto editor key-bindings 'vi'
	zgen prezto prompt theme 'sorin'

	# prezto
	zgen prezto
	zgen prezto git
	zgen prezto fancy-ctrl-z

	# save all to init script
	zgen save
fi

source "$ZSHRC_DIR/vi-mode.zsh"

# .fzf.zsh MUST be sourced after sourcing vi-mode plugin
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
