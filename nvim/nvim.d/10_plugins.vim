let g:python2_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

call plug#begin('~/.config/nvim/plugged')

" general
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-obsession'
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'], 'for': 'directory' }
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-dispatch'
Plug 'scrooloose/syntastic', { 'on': [] }
Plug 'nathanaelkane/vim-indent-guides'
Plug 'tpope/vim-endwise'
Plug 'schickling/vim-bufonly'

" editing
Plug 'svermeulen/vim-easyclip'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'

" completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'padawan-php/deoplete-padawan', { 'do': 'composer install' }

" git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" tmux
Plug 'christoomey/vim-tmux-navigator'
Plug 'benmills/vimux'

" theme
Plug 'vim-airline/vim-airline-themes'
Plug 'keith/parsec.vim'

call plug#end()
