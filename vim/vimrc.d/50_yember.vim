let g:yember_no_mappings = 1

augroup au_yember
	autocmd!
	autocmd FileType javascript nmap <buffer> <F2> <Plug>GenerateYuiDocBlock
augroup END
