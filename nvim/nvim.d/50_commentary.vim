augroup after-commentary
	autocmd FileType javascript setlocal commentstring=//\ %s
	autocmd FileType php setlocal commentstring=//\ %s
	autocmd FileType apache setlocal commentstring=#\ %s
augroup END
