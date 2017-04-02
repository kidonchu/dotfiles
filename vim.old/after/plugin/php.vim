function! PhpSyntaxOverride()
	hi! def link phpDocTags phpKeyword
	hi! def link phpDocParam phpType
	hi! def link phpDocIdentifier phpIdentifier
endfunction

augroup PhpSyntaxOverride
	autocmd!
	autocmd FileType php call PhpSyntaxOverride()
augroup END
