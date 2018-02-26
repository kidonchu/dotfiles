let g:deoplete#enable_at_startup = 1

" Disable AutoComplPop
let g:acp_enableAtStartup = 0
" Limit suggestions
let g:neocomplete#max_list = 100
" Use smartcase
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length
let g:neocomplete#sources#syntax#min_keyword_length = 3
" Define dictionary
let g:neocomplete#sources#dictionary#dictionaries = {
	\ 'default' : '',
\ }
" Define keyword
if !exists('g:neocomplete#keyword_patterns')
	let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Enable omni completion.
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

" Fix conflict with multiple cursor
" function! Multiple_cursors_before()
" 	exe 'DeoCompleteLock'
" endfunction
" function! Multiple_cursors_after()
" 	exe 'NeoCompleteUnlock'
" endfunction

" inoremap <expr><C-D> neocomplete#start_manual_complete('omni')

" Enable heavy omni completion.
" if !exists('g:neocomplete#sources#omni#input_patterns')
" 	let g:neocomplete#sources#omni#input_patterns = {}
" endif
" let g:neocomplete#sources#omni#input_patterns.php =
" 	\ '[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'

" if !exists('g:neocomplete#delimiter_patterns')
" 	let g:neocomplete#delimiter_patterns= {}
" endif
" let g:neocomplete#delimiter_patterns.vim = ['#']
" let g:neocomplete#delimiter_patterns.php = ['::', '->']

" if !exists('g:neocomplete#force_omni_input_patterns')
" 	let g:neocomplete#force_omni_input_patterns = {}
" endif
" let g:neocomplete#force_omni_input_patterns.php =
" 	\ '[^. \t]->\|\h\w*::\|\(new\|use\|extends\|implements\)\s'
