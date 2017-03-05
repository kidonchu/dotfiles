nnoremap g/ g,
" nnoremap <leader>dt :execute "normal! 0f{2lmo%dd'odd"
nnoremap <leader>dc :diffoff!<cr><c-w>l:bd<cr>
nnoremap <leader>do :DiffOrig<cr>
nnoremap <leader>gvp /^*\(.*Merge.*\)\@!.*$<cr>
nnoremap <leader>sb vip:sort<cr>
nnoremap <silent> <leader><leader>r :MRU<cr>
nnoremap <silent> <leader><leader>wh :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
" Diff with original file
command! DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis | wincmd p | diffthis
vnoremap <leader>rp :s/\<update\>\\|\<select\>\\|\<from\>\\|\<where>\\|\<left join\>\\|\<inner join\>\\|\<group by\>\\|\<order by\>/\r&<cr><esc>
vnoremap <leader>fs :s/\v[\t ]{2,}/ /<cr>:s/\v(SELECT\|FROM\|WHERE\|AND)/\r\1<cr>:noh<cr><esc>
nnoremap <leader>fs vip:s/\v[\t ]{2,}/ /<cr>:s/\v(SELECT\|FROM\|WHERE\|AND)/\r\1<cr>:noh<cr><esc>

" Figure out which syntax rule is applied to word under cursor
map <leader><leader>s :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
	\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
	\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" source $MYVIMRC reloads the saved $MYVIMRC
nnoremap <leader>sv :source $MYVIMRC<cr>
" opens $MYVIMRC for editing, or use :tabedit $MYVIMRC
nnoremap <leader>ev :e $MYVIMRC<cr>

" {{{ Buffer: u/U
" close current buffer
nnoremap <leader>uq :bp <bar> bd #<CR>
" write and close buffer
nnoremap <leader>uw :w <bar> bp <bar> bd #<CR>
" open just closed buffer
nnoremap <leader>ut :e #<cr>
" Move to the next buffer
nnoremap gt :bnext<CR>
" Move to the previous buffer
nnoremap gT :bprevious<CR>
" }}}
" {{{ Window: w/W
" close location window
nnoremap <leader>wl :lclose<CR>
" close preview window
nnoremap <leader>wp :pclose<cr>
" close quickfix window
nnoremap <leader>wx :cclose<cr>
" split horizontally
nnoremap <leader>ws :split<cr>
" split vertically
nnoremap <leader>wv :vsplit<cr>
" close winow
nnoremap <leader>wq :close<cr>
" resize panes
nnoremap <silent> <Right> :vertical resize +10<cr>
nnoremap <silent> <Left> :vertical resize -10<cr>
nnoremap <silent> <Up> :resize +10<cr>
nnoremap <silent> <Down> :resize -10<cr>
" easy window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" }}}
" {{{ Movement & Editing
" save file with shift-s
nnoremap S :w<cr>
" to the beginning/end of line
nnoremap H ^
vnoremap H ^
nnoremap L $
vnoremap L $
" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-u> <C-g>u<C-u>
" auto-reindent entire file
nnoremap == myggVG=`y
" better handling of number increment/decrement
" operate on the next number, even if that number is not on the current line
function! AddSubtract(char, back)
  let pattern = &nrformats =~ 'alpha' ? '[[:alpha:][:digit:]]' : '[[:digit:]]'
  call search(pattern, 'cw' . a:back)
  execute 'normal! ' . v:count1 . a:char
  silent! call repeat#set(":\<C-u>call AddSubtract('" .a:char. "', '" .a:back. "')\<CR>")
endfunction
" nnoremap <silent>         <C-b> :<C-u>call AddSubtract("\<C-a>", '')<CR>
" nnoremap <silent> <Leader><C-b> :<C-u>call AddSubtract("\<C-a>", 'b')<CR>
" nnoremap <silent>         <C-x> :<C-u>call AddSubtract("\<C-x>", '')<CR>
" nnoremap <silent> <Leader><C-x> :<C-u>call AddSubtract("\<C-x>", 'b')<CR>
" }}}
" {{{ Search & Replace
" use very-magic regex by default
nnoremap / /\v
nnoremap <silent> <leader>/ :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR>
" replace word on cursor within local scope
nnoremap gr gd[{V%::s/<C-R>///gc<left><left><left>
" replace word on cursor globally
nnoremap gR gD:%s/<C-R>///gc<left><left><left>
nnoremap <leader>{ ?\vfunction .* \?\(.*\) ?\{<cr><esc>:noh<cr>$V%koj
vnoremap <leader>sg "hy:%s/<C-r>h//<left>
" auto-center with searched string
nnoremap n nzz
nnoremap N Nzz

" }}}
" {{{ Folding
nnoremap - za
" }}}
" {{{ MISC
" Don't use Ex mode, use Q for formatting
map Q gq
" copy current file's name and line number
nnoremap <leader>cf :let @+=expand("%") . ':' . line(".")<cr>
" put current timestamp
inoremap idt <c-r>=strftime("%m/%d/%Y")<cr><esc>o
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;
nnoremap <leader>r :redraw!<cr>
" }}}

" {{{ ember
" comment out all but current test
" - first line: comment out all tests after current one
" - second line: comment out all tests beforecurrent one
" - third line: come back to where we started with highlight removed
" nnoremap <leader>co mv
" 	\ /\v^test\(.{-},\s?function<cr>VG:Commentary<cr>
" 	\ 'v?^});<cr>Vgg/\v^test\(.{-},\s?function<cr>:Commentary<cr>
" 	\ 'v:noh<cr>
" " undo the comment out
" nnoremap <leader>cu mv
" 	\ /\v^\/\/ test\(.{-},\s?function<cr>VG:Commentary<cr>
" 	\ 'v?^\/\/ });<cr>Vgg/\v^\/\/ test\(.{-},\s?function<cr>:Commentary<cr>
" 	\ 'v:noh<cr>
" }}}
