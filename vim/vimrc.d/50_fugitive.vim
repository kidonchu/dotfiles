nnoremap <leader>gw :Gwrite<cr>
nnoremap <leader>gr :Gread<cr>
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gps :Dispatch! git push<cr>
nnoremap <leader>gpr :!gitcli s pr -s<space>
nnoremap <leader>gc :Gcommit<cr>
nnoremap <leader>gd :Gdiff<cr>

augroup au_fugitive
	autocmd!

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

augroup END

