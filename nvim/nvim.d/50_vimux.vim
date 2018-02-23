nnoremap <leader>vp :VimuxPromptCommand<cr>
nnoremap <leader>vl :VimuxRunLastCommand<cr>
nnoremap <leader>vi :VimuxInspectRunner<cr>
nnoremap <leader>vz :VimuxZoomRunner<cr>

augroup au_vimux
	autocmd!
	" keymap to run current feature file via behat
	autocmd FileType cucumber nnoremap <buffer> <leader>r :call VimuxRunCommand('docker-compose run --rm tests --tags=run-now '.expand('%'))<CR>
	autocmd FileType php nnoremap <buffer> <leader>rr :call VimuxRunCommand('docker-compose run --rm tests '.expand('%'))<CR>
	autocmd FileType php nnoremap <buffer> <leader>rt :call VimuxRunCommand('docker-compose run --rm tests --filter=<c-r><c-w>')<CR>
augroup END

