imap <c-x><c-l> <plug>(fzf-complete-line)
" [Files] Extra options for fzf
"         e.g. File preview using CodeRay (http://coderay.rubychan.de/)
" let g:fzf_files_options = '--preview "(coderay {} || cat {}) 2> /dev/null | head -'.&lines.'"'
" let g:fzf_layout = { 'down': '~40%' }
let g:fzf_tags_command = 'ctags -f ./ctags'

nnoremap <silent> <leader>F :Files<cr>
nnoremap <silent> <leader>H :History<cr>
nnoremap <silent> <leader>R :BTags<cr>
nnoremap <silent> <leader>T :Tags<cr>
nnoremap <silent> <leader>U :Buffers<cr>
command! -bang -nargs=* Ag
	\ call fzf#vim#ag(<q-args>,
	\                 <bang>0 ? fzf#vim#with_preview('up:60%')
	\                         : fzf#vim#with_preview('right:50%:hidden', '?'),
	\                 <bang>0)
nnoremap <leader>aa :Ag!<space>
nnoremap <leader>aw :Ag!<space><c-r><c-w><space>
