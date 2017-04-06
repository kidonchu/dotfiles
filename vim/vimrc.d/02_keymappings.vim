nnoremap <leader>sv :source ~/.vimrc<cr>
nnoremap <leader>pi :PlugInstall<cr>

" remap number increment key to <C-I> due to tmux prefix conflict
nnoremap <C-I> <C-A>

" save file with shift-s
nnoremap S :w<cr>

" to the beginning/end of line
nnoremap H ^
vnoremap H ^
nnoremap L $
vnoremap L $

" use ; to trigger exe mode
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

" I don't use K, and it cause only trouble
nnoremap K <nop>

" use \ to switch between two files
nnoremap \ <C-^>

" {{{ Search
" use very-magic regex by default
nnoremap / /\v
" clear out highlighed search results as well as search term
nnoremap <silent> <leader>/ :let @/ = "" <bar> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR>
" }}}

" {{{ Buffer: u/U
" close current buffer
nnoremap <leader>uq :bp <bar> bd #<CR>
" open just closed buffer
nnoremap <leader>ut :e #<cr>
" Move to the next buffer
nnoremap gt :bnext<CR>
" Move to the previous buffer
nnoremap gT :bprevious<CR>
" }}}

" {{{ Window: w/W
" split horizontally
nnoremap <leader>ws :split<cr>
" split vertically
nnoremap <leader>wv :vsplit<cr>
" close window
nnoremap <leader>wq :close<cr>
" resize panes
nnoremap <silent> <Right> :vertical resize +5<cr>
nnoremap <silent> <Left> :vertical resize -5<cr>
nnoremap <silent> <Up> :resize +5<cr>
nnoremap <silent> <Down> :resize -5<cr>
" }}}

" {{{ My own plugins
nnoremap <leader>api :call kidonchu#json#reformat()<cr>
" }}}
