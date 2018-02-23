let g:gitgutter_realtime=2
" let g:gitgutter_eager=2
set updatetime=250

" change sign characters
let g:gitgutter_sign_added = '++'
let g:gitgutter_sign_modified = '~~'
let g:gitgutter_sign_removed = '__'
let g:gitgutter_sign_removed_first_line = '‾‾'

" disable gitgutter if too many git changes
let g:gitgutter_max_signs = 100

" use ag for grep
let g:gitgutter_grep_command = 'ag --nocolor'

if exists('g:loaded_gitgutter')
	nnoremap <leader>gt :GitGutter<CR>
	nnoremap <leader>hr :GitGutterUndoHunk<cr>
	nnoremap <leader>hv :GitGutterPreviewHunk<cr>
	nnoremap <leader>hs :GitGutterStageHunk<cr>

	omap ih <Plug>GitGutterTextObjectInnerPending
	omap ah <Plug>GitGutterTextObjectOuterPending
	xmap ih <Plug>GitGutterTextObjectInnerVisual
	xmap ah <Plug>GitGutterTextObjectOuterVisual

	function! TrimTrailingWhitespacesInHunks(...)
		for hunk in GitGutterGetHunks()
			for lnum in range(hunk[2], hunk[2]+hunk[3]-1)
				let cursor = getcurpos()
				let line = getline(lnum)
				let line = substitute(line, '\s\+$', '', '')
				call setline(lnum, line)
				call setpos('.', cursor)
			endfor
		endfor
	endfunction

	augroup au_gitgutter
		autocmd!
		autocmd BufWritePre * call TrimTrailingWhitespacesInHunks()
	augroup END

endif
