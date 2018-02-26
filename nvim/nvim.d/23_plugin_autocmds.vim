augroup kidonchu_autocmds

	au!

	" highlight current line only on focused window
	au WinEnter,InsertLeave * set cursorline
	au WinLeave,InsertEnter * set nocursorline

	" easier navigation with lazy-load function names
	au FileType vim setlocal iskeyword-=#

	" auto-save when leaving buffers
	au BufLeave,FocusLost * silent! wa

	" textwidth changes
	au FileType vim setlocal tw=1000
	au BufReadPre *.hbs setlocal tw=200

augroup END

augroup au_plugin_autocmds

	autocmd!

	""" vimux
	" autocmd FileType cucumber nnoremap <buffer> <leader>r :call VimuxRunCommand('docker-compose run --rm tests --tags=run-now '.expand('%'))<CR>
	let s:tests_container = 'docker-compose run --rm tests '
	autocmd FileType php
		\nnoremap <buffer> <leader>rr
		\:call VimuxRunCommand(s:tests_container.expand('%'))<cr>
	autocmd FileType php nnoremap <buffer> <leader>rt
		\:call VimuxRunCommand(s:tests_container.'--filter=<c-r><c-w>')<cr>

	""" commentary
	autocmd FileType javascript setlocal commentstring=//\ %s
	autocmd FileType php setlocal commentstring=//\ %s
	autocmd FileType apache setlocal commentstring=#\ %s

	""" fugitive
	" map q to close fugitive window
	autocmd BufEnter *
		\ if expand('%') =~ '^fugitive' |
		\ 	execute 'nnoremap q :bd<cr>' |
		\ endif
	autocmd BufLeave *
		\ if expand('%') =~ '^fugitive' |
		\ 	execute 'unmap q' |
		\ endif
	" auto-clean fugitive buffers
	autocmd BufReadPost fugitive://* set bufhidden=delete

	""" syntastic
	autocmd BufEnter *.scss :let g:syntastic_check_on_wq = 0
		\| :let g:syntastic_auto_loc_list = 0
	autocmd BufLeave *.scss :let g:syntastic_check_on_wq = 1
		\| :let g:syntastic_auto_loc_list = 1

augroup END

