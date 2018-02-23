let g:fzf_tags_command = 'ctags -f ./ctags -R'

" let g:fzf_commits_log_options = '--color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

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

" Command for git grep
" - fzf#vim#grep(command, with_column, [options], [fullscreen])
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

" let g:fzf_history_dir = '~/.local/share/fzf-history'

