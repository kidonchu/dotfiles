nnoremap <leader>sv :source ~/.config/nvim/init.vim<cr>:noh<cr>
nnoremap <leader>pi :PlugInstall<cr>
nnoremap <leader>pc :PlugClean<cr>

" {{{ Buffer: u/U
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
" location window
nnoremap <leader>l :lopen<cr>
" }}}

" {{{ Editing
nnoremap S :w<cr>
" use \ to switch between two files
nnoremap \ <c-^>
" remap number increment key to <C-I> due to tmux prefix conflict
nnoremap <c-i> <c-a>
" }}}

" {{{ Movement
" to the beginning/end of line
nnoremap H ^
vnoremap H ^
nnoremap L $
vnoremap L $
" use ; to trigger exe mode and : to find next inline char
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;
" }}}

" {{{ Search
" use very-magic regex by default
nnoremap / /\v
" clear out highlighed search results as well as search term
nnoremap <silent> <leader>/ :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR>
" }}}
