" enable airline
set laststatus=2

let g:airline#extensions#tabline#enabled = 1
" show tabline only if more than one tab opened
let g:airline#extensions#tabline#tab_min_count = 2
let g:airline#extensions#tabline#show_buffers = 1
" let g:airline#extensions#tabline#fnamecollapse = 0
" let g:airline#extensions#tabline#fnamemod ='
" 	\:s?app/??
" 	\:p:gs?component?c?
" 	\:gs?template?t?
" 	\:gs?mixins?mxns?
" 	\:gs?contacts/?cts/?
" 	\:gs?deals/?ds/?
" 	\:.
" 	\'
" let g:airline_powerline_fonts = 1
let g:airline_theme = "kidonchu"
" if !exists('g:airline_symbols')
" 	let g:airline_symbols = {}
" endif
" let g:airline_symbols.space = "\ua0"

" disable unused extensions (performance)
let g:airline#extensions#bufferline#enabled = 0
let g:airline#extensions#capslock#enabled   = 0
let g:airline#extensions#csv#enabled        = 0
let g:airline#extensions#ctrlspace#enabled  = 0
let g:airline#extensions#eclim#enabled      = 0
let g:airline#extensions#hunks#enabled      = 0
let g:airline#extensions#nrrwrgn#enabled    = 0
let g:airline#extensions#promptline#enabled = 0
let g:airline#extensions#syntastic#enabled  = 0
let g:airline#extensions#taboo#enabled      = 0
let g:airline#extensions#tagbar#enabled     = 0
let g:airline#extensions#virtualenv#enabled = 0
let g:airline#extensions#whitespace#enabled = 0
