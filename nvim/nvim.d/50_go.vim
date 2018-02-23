let g:go_fmt_command = "goimports"
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['vet', 'golint']
augroup au_go
	function! s:build_go_files()
		let l:file = expand('%')
		if l:file =~# '^\f\+_test\.go$'
			call go#cmd#Test(0, 1)
		elseif l:file =~# '^\f\+\.go$'
			call go#cmd#Build(0)
		endif
	endfunction
	autocmd!
	autocmd FileType go nmap <leader>r  <Plug>(go-run)
	autocmd FileType go nmap <leader>t  <Plug>(go-test)
	autocmd FileType go nmap <leader>f  <Plug>(go-test-func)
	autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
	autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
	autocmd FileType go nmap <Leader>d <Plug>(go-doc)
	autocmd FileType go nmap <Leader>i <Plug>(go-install)
augroup END
