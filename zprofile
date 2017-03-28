# Set CLICOLOR if you want Ansi Colors in iTerm2 
export CLICOLOR=1

# Set colors to match iTerm2 Terminal Colors
export TERM=xterm-256color

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

PATH="$PATH:/Users/kchu/projects/go/bin"
export GOPATH='/Users/kchu/projects/go'

# export CMAKE_INCLUDE_PATH='/usr/local/Cellar/libssh2/1.7.0/include:/usr/local/Cellar/curl/7.50.3/include'
# export CMAKE_LIBRARY_PATH='/usr/local/Cellar/libssh2/1.7.0/lib:/usr/local/Cellar/curl/7.50.3/lib'
# export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/opt/curl/lib/pkgconfig:/opt/vagrant/embedded/lib/pkgconfig
# export PATH=$PATH:$GOPATH/bin

# vim: set ft=zsh syntax=zsh fdm=expr fde=getline(v\:lnum)=~'#\\s{{{'?'>1'\:'1':
