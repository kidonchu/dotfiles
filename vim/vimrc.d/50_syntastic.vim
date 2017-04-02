let syntastic_mode_map = { 'passive_filetypes': ['html'] }

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_php_checkers=['php']
" let g:syntastic_php_phpcs_args='--standard=AC -n'
au FileType scss :let g:syntastic_check_on_wq = 0
au FileType scss :let g:syntastic_auto_loc_list = 0
