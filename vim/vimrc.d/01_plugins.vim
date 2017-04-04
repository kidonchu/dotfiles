call plug#begin('~/.vim/plugged')

" general
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'], 'for': 'directory' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'kidonchu/vim-airline-themes'
Plug 'tpope/vim-obsession'
Plug 'svermeulen/vim-easyclip'
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

" php
Plug 'shawncplus/phpcomplete.vim'

" javascript

" tmux
Plug 'christoomey/vim-tmux-navigator'

" git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

call plug#end()

" lazy load syntastic before writing a file
augroup load_syntastic
	autocmd!
	autocmd BufWritePre * call plug#load('syntastic')
		\| autocmd! load_syntastic
augroup END
