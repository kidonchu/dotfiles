augroup kidonchu

	autocmd!

	" Highlight current line only on focused window
	autocmd WinEnter,InsertLeave * set cursorline
	autocmd WinLeave,InsertEnter * set nocursorline

augroup END
