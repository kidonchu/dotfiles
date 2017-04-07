let g:pdv_template_dir = $HOME ."/dotfiles/vim/plugged/pdv/templates_snip"

augroup au_pdv
	autocmd!
	autocmd FileType php nnoremap <buffer> <F2> :call pdv#DocumentWithSnip()<CR>
augroup END
