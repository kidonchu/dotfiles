set nocompatible
set pastetoggle=,,p
set clipboard=unnamed

""" moving around, searching and patterns
set gdefault    " search with 'g' option by default
set ignorecase
set smartcase   " ignore case if search pattern is all lowercase, " case-sensitive otherwise
set hlsearch    " highlight search terms
set incsearch   " show search matches as you type
" set nowrapscan

""" tags
set tags+=ctags

""" displaying text
set scrolloff=8      " start scrolling when 8 lines below/above boundary
set sidescrolloff=15 " start scrolling horizontally when 15 chars apart
set sidescroll=1
set nowrap           " don't wrap lines
set rnu
set number           " always show line numbers
set numberwidth=5    " line-number column width
set lazyredraw       " don't redraw while executing macros
set list             " show invisible chars
set listchars=tab:»\ ,trail:·,extends:#,nbsp:·
set fillchars=vert:\

""" syntax, highlighting and spelling
set cursorline
" set synmaxcol=250   " remove lagging with long lines
" set spell

""" multiple windows
set splitbelow
set splitright

""" multiple tab pages

""" terminal
set title  " Set window title to 'filename [+=-] (path) - VIM'.

""" using the mouse
set ttyfast
set mouse=a

""" printing

""" messages and info
set ruler        " show cursor position always
set noerrorbells " don't beep
set showcmd      " show command keys in status line
set visualbell   " don't beep
set shortmess=a  " decrease cmd line message size

""" selecting text

""" editing text
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set showmatch                  " set show matching parenthesis
set undolevels=1000            " use many muchos levels of undo
set textwidth=80
set formatoptions=qrn1t
set wrapmargin=0

""" tabs and indenting
set autoindent    " always set autoindenting on
set smartindent
set showtabline=2 " show tab line always
set noexpandtab
set tabstop=4
set softtabstop=0
set shiftwidth=4  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<<' and '>>'

""" folding
" set foldmethod=syntax
" set foldlevelstart=10
" set foldclose=all
" set foldnestmax=10
" set foldlevel=0

""" diff mode
set diffopt+=vertical " Always use vertical diffs

""" mapping
" change the mapleader from \ to <space>
let mapleader="\<space>"
let maplocalleader="\<space>"

""" reading and writing files
" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden
set autoread    " automatically reload files changed outside of vim
set autowrite   " automatically :write before running commands
set noswapfile
set nobackup
set nowritebackup

""" command line editing
set history=1000 " remember more commands and search history
set wildmenu " command-line completion
set wildmode=list:longest,full
set wildignore=*.swp,*.bak,*.pyc,*.class

""" executing external commands

""" running make and jumping to errors

""" language specific

""" multi-byte characters

""" various
" set completeopt-=preview
