" let g:gitgutter_realtime=2
" let g:gitgutter_eager=2
set updatetime=250

" change sign characters
" calling define function is required to re-define the signs in
" after/plugin since this script is loaded after initial define.
let g:gitgutter_sign_added = '++'
let g:gitgutter_sign_modified = '~~'
let g:gitgutter_sign_removed = '__'
let g:gitgutter_sign_removed_first_line = '‾‾'

" disable gitgutter if too many git changes
let g:gitgutter_max_signs = 100

" use ag for grep
let g:gitgutter_grep_command = 'ag --nocolor'

nnoremap <leader>gt :GitGutter<CR>
nnoremap <leader>gu :GitGutterUndoHunk<cr>
nnoremap <leader>gv :GitGutterPreviewHunk<cr>
