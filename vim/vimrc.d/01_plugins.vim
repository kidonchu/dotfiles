call plug#begin('~/.vim/plugged')

" general
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'], 'for': 'directory' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Plug 'vim-airline/vim-airline'
" Plug 'kidonchu/vim-airline-themes'
Plug 'tpope/vim-obsession'
Plug 'svermeulen/vim-easyclip', { 'on': [] }
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/syntastic', { 'on': [] }
Plug 'Shougo/neocomplete.vim'
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-unimpaired'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'tpope/vim-endwise'
Plug 'godlygeek/tabular'
Plug 'terryma/vim-multiple-cursors'
Plug 'schickling/vim-bufonly'
Plug 'benmills/vimux'
Plug 'tpope/vim-projectionist'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'rking/ag.vim'
" Plug 'junegunn/goyo.vim'
Plug 'tpope/vim-abolish'
Plug 'majutsushi/tagbar'
Plug 'ap/vim-buftabline'

" docker
Plug 'ekalinin/Dockerfile.vim'

" php
Plug 'shawncplus/phpcomplete.vim'
Plug 'StanAngeloff/php.vim'
Plug 'tobyS/pdv', { 'for': ['php'] }
" Plug 'joonty/vdebug'

" javascript
Plug 'mustache/vim-mustache-handlebars'
Plug 'pangloss/vim-javascript'
Plug 'tobyS/vmustache'
Plug 'kidonchu/yember'
Plug 'kidonchu/ember_tools.vim'
" Plug 'ternjs/tern_for_vim'
" Plug 'ramitos/jsctags'

" html/css
Plug 'mattn/emmet-vim'
" Plug 'rstacruz/vim-hyperstyle'
Plug 'othree/csscomplete.vim'

" tmux
Plug 'christoomey/vim-tmux-navigator'

" git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
" Plug 'vim-scripts/ConflictMotions'

" markdown
Plug 'plasticboy/vim-markdown'
" Plug 'vitalk/vim-simple-todo'

" go
" Plug 'fatih/vim-go'

" text-objects
Plug 'kana/vim-textobj-user'
Plug 'Julian/vim-textobj-brace'

call plug#end()

" lazy load syntastic before writing a file
augroup load_syntastic
	autocmd!
	autocmd BufWritePre * call plug#load('syntastic') | autocmd! load_syntastic
augroup END

augroup load_easyclip
	autocmd!
	autocmd BufReadPre * call plug#load('vim-easyclip') | autocmd! load_easyclip
augroup END
