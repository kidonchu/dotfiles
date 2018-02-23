let mapleader = "\<space>"
let maplocalleader = "\<space>"
set clipboard=unnamed

""" moving around, searching and patterns
set gdefault    " search with 'g' option by default
set ignorecase
set smartcase   " ignore case if search pattern is all lowercase, " case-sensitive otherwise
set hlsearch    " highlight search terms
set incsearch   " show search matches as you type

""" reading and writing files
" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden
set autoread    " automatically reload files changed outside of vim
set autowrite   " automatically :write before running commands
set noswapfile
set nobackup
set nowritebackup

""" displaying text
set scrolloff=8      " start scrolling when 8 lines below/above boundary
set sidescrolloff=15 " start scrolling horizontally when 15 chars apart
set sidescroll=1
set nowrap           " don't wrap lines
set rnu
set numberwidth=5    " line-number column width
set lazyredraw       " don't redraw while executing macros
set list             " show invisible chars
set listchars=tab:»\ ,trail:·,extends:#,nbsp:·
set fillchars=vert:\
set cursorline

""" tabs and indenting
set autoindent    " always set autoindenting on
set smartindent
set showtabline=2 " show tab line always
set noexpandtab
set tabstop=4
set softtabstop=0
set shiftwidth=4  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<<' and '>>'

""" multiple windows
set splitbelow
set splitright

""" messages and info
set ruler         " show cursor position always
set noerrorbells  " don't beep
set showcmd       " show command keys in status line
set visualbell    " don't beep
set shortmess=at  " decrease cmd line message size
set cmdheight=1

""" editing text
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set showmatch                  " set show matching parenthesis
set undolevels=1000            " use many muchos levels of undo
set textwidth=80
set formatoptions=qrn1t
set wrapmargin=0

""" command line editing
set history=1000 " remember more commands and search history
set wildmenu     " command-line completion
set wildmode=list:longest,full
set wildignore=*.swp,*.bak,*.pyc,*.class

""" various
set complete-=i
set completeopt-=preview
