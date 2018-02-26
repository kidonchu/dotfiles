""" bufonly
nnoremap <leader>uo :BufOnly<cr>

""" fugitive
nnoremap <leader>gw :Gwrite<cr>
nnoremap <leader>gr :Gread<cr>
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gps :Dispatch! git push<cr>
nnoremap <leader>gpr :!gitcli s pr<space>
nnoremap <leader>gc :Gcommit<cr>
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gg :!git g<cr>

""" fzf
" Mapping selecting mappings
nmap ,<tab> <plug>(fzf-maps-n)
xmap ,<tab> <plug>(fzf-maps-x)
omap ,<tab> <plug>(fzf-maps-o)
imap ,<tab> <plug>(fzf-maps-i)
" Insert mode completion
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'right': '15%'})
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
" imap <c-x><c-l> <plug>(fzf-complete-line)
nnoremap <silent> <leader>F :Files<cr>
nnoremap <silent> <leader>H :History<cr>
nnoremap <silent> <leader>R :BTags<cr>
nnoremap <silent> <leader>T :Tags<cr>
nnoremap <silent> <leader>U :Buffers<cr>
nnoremap <silent> <leader>G :BCommits<cr>
command! -bang -nargs=* FAg
	\ call fzf#vim#ag(<q-args>,
	\                 <bang>0 ? fzf#vim#with_preview('up:60%')
	\                         : fzf#vim#with_preview('right:50%:hidden', '?'),
	\                 <bang>0)
nnoremap <leader>aa :FAg!<space>
nnoremap <F4> :FAg! <c-r><c-w><cr>
vnoremap <F4> y:FAg! <c-r>"<cr>
command! -bang -nargs=* GGrep
	\ call fzf#vim#grep('git grep --line-number '.shellescape(<q-args>), 0, <bang>0)
function! s:list_buffers()
	redir => buffers
	silent ls
	redir END
	return split(buffers, "\n")
endfunction
function! s:delete_buffers(lines)
	for bufno in map(a:lines, {_, line -> matchstr(line, '[0-9]\+')})
		echom 'Delete buffer '.bufno
		silent! execute 'bd' bufno
	endfor
endfunction
command! -bang DeleteBuffers
	\ call fzf#run(fzf#wrap({'source':  s:list_buffers(),
	\                        'options': '--multi --bind alt-a:select-all',
	\                        'sink*':   {lines -> s:delete_buffers(lines)}}, <bang>0))

""" nerdtree
nnoremap <leader>m :NERDTreeFind<cr>
nnoremap <leader>n :NERDTreeToggle<cr>

""" tabular
nnoremap <leader>a= :Tabularize /=<CR>
vnoremap <leader>a= :Tabularize /=<CR>
nnoremap <leader>a> :Tabularize /=><CR>
vnoremap <leader>a> :Tabularize /=><CR>
nnoremap <leader>a: :Tabularize /:\zs<CR>
vnoremap <leader>a: :Tabularize /:\zs<CR>
inoremap <silent> <Bar> <Bar><Esc>:call <SID>align()<CR>a
function! <SID>align()
	let p = '\v^\s*\|\s?.{-}\s?\|\s*$'
	if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
		let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
		let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
		Tabularize/|/l1
		normal! 0
		call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
	endif
endfunction

""" vimux
nnoremap <leader>vp :VimuxPromptCommand<cr>
nnoremap <leader>vl :VimuxRunLastCommand<cr>
nnoremap <leader>vi :VimuxInspectRunner<cr>
nnoremap <leader>vz :VimuxZoomRunner<cr>

""" completion
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> gr :call LanguageClient_textDocument_references()<CR>
nnoremap K :call LanguageClient_textDocument_hover()<cr>

""" ale
nmap <silent> <c-p> <Plug>(ale_previous_wrap)0
nmap <silent> <c-n> <Plug>(ale_next_wrap)$

""" buf-bbye
" close current buffer
nnoremap <leader>uq :Bdelete<cr>
