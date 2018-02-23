let syntastic_mode_map = { 'passive_filetypes': ['html', 'scss', 'css'] }

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_php_checkers=['php']
" let g:syntastic_php_phpcs_args='--standard=AC -n'
let g:syntastic_loc_list_height = 3

augroup au_syntastic
	autocmd!
	autocmd BufEnter *.scss :let g:syntastic_check_on_wq = 0
		\| :let g:syntastic_auto_loc_list = 0
	autocmd BufLeave *.scss :let g:syntastic_check_on_wq = 1
		\| :let g:syntastic_auto_loc_list = 1
augroup END
