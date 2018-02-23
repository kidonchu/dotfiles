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

augroup END

