# {{{ Browser
if [[ "$OSTYPE" == darwin* ]]; then
	export BROWSER='open'
fi
# }}}

# {{{ Editors
export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'
# }}}

# {{{ Language
if [[ -z "$LANG" ]]; then
	export LANG='en_US.UTF-8'
fi
# }}}


# {{{ Paths
# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Set the the list of directories that cd searches.
# cdpath=(
#   $cdpath
# )

# Set the list of directories that Zsh searches for programs.
path=(
	/usr/local/{bin,sbin}
	$path
)
# }}}

# {{{ Less
# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
export LESS='-F -g -i -M -R -S -w -X -z-4'

# Set the Less input preprocessor.
# Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
if (( $#commands[(i)lesspipe(|.sh)] )); then
	export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi
# }}}


# {{{ Temporary Files
TMPPREFIX="$(mktemp -d)/zsh"
# }}}

export CMAKE_INCLUDE_PATH='/usr/local/Cellar/libssh2/1.7.0/include:/usr/local/Cellar/curl/7.50.3/include'
export CMAKE_LIBRARY_PATH='/usr/local/Cellar/libssh2/1.7.0/lib:/usr/local/Cellar/curl/7.50.3/lib'
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/opt/curl/lib/pkgconfig:/opt/vagrant/embedded/lib/pkgconfig
export GOPATH='/Users/kchu/projects/go'
export PATH=$PATH:$GOPATH/bin

# vim: set fdm=expr fde=getline(v\:lnum)=~'#\\s{{{'?'>1'\:'1':
