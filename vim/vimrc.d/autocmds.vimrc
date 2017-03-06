augroup kchu

	autocmd!

	" Remove trailing white spaces on save
	autocmd BufWritePre *.js,*.hbs,*.php,*.sql,*.md :%s/\s\+$//e
	autocmd BufReadPre *.hbs setlocal foldmethod=indent foldlevel=1
	autocmd BufReadPre *.js,*.php :call matchadd('ColorColumn', '\%85v', 100)
	autocmd BufReadPre *.md :call matchadd('ColorColumn', '\%100v', 100)

	" set filetypes
	autocmd BufRead,BufNewFile *.sql set filetype=mysql
	autocmd BufRead,BufNewFile *test.js set filetype=embertest.javascript

	" autocmd BufEnter * call Splitresize()
	autocmd FileType git setlocal foldlevel=1
	autocmd FileType html.handlebars :UltiSnipsAddFiletypes mustache
	autocmd BufReadPre *.hbs,*.html setlocal tabstop=3 | setlocal shiftwidth=3
	autocmd FileType todoo setlocal foldmethod=marker
	autocmd FileType vim setlocal foldmethod=marker
	autocmd FileType mysql setlocal foldmethod=marker
	autocmd BufReadPre translations.js setlocal foldmethod=syntax | setlocal foldlevel=1
	autocmd Syntax javascript setlocal foldmethod=syntax foldnestmax=3
	autocmd Syntax javascript,php,scss,mustache nnoremap <leader>wt :ToggleWatchmanProcess<cr>
	autocmd BufReadPost *.js normal! zR
	
	" commenting
	autocmd FileType javascript setlocal commentstring=//\ %s
	autocmd FileType embertest setlocal commentstring=//\ %s
	autocmd FileType php setlocal commentstring=//\ %s

	" JSON
	" easier navigation with lazy-load function names
	au FileType vim setlocal iskeyword-=#

	" When editing a file, always jump to the last known cursor position.
	" Don't do it for commit messages, when the position is invalid, or when
	" inside an event handler (happens when dropping a file on gvim).
	" autocmd BufReadPost *
	  " \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
	  " \   exe "normal g`\"" |
	  " \ endif
	" Enable spellchecking for Markdown
	autocmd FileType markdown setlocal spell textwidth=100 noautoindent
	" Automatically wrap at 100 characters for Markdown
	" autocmd BufRead,BufNewFile *.md set filetype=markdown
	" autocmd BufRead,BufNewFile *.md setlocal 
	autocmd BufRead,BufNewFile *.js,*.hbs,*.php setlocal textwidth=9999
	" Automatically wrap at 100 characters and spell check git commit messages
	" autocmd FileType gitcommit setlocal textwidth=100
	" autocmd FileType gitcommit setlocal spell
	" Allow stylesheets to autocomplete hyphenated words
	autocmd FileType css,scss,sass,less setlocal iskeyword+=-

	" Enable spellchecking for Markdown
	" Automatically wrap at 100 characters for Markdown
	autocmd FileType markdown setlocal spell
	autocmd FileType markdown setlocal textwidth=100
	autocmd FileType markdown setlocal expandtab

	" move one-level up after drilling down in git tree object
	autocmd User fugitive 
	  \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
	  \   nnoremap <buffer> .. :edit %:h<CR> |
	  \ endif
	" auto-clean fugitive buffers
	autocmd BufReadPost fugitive://* set bufhidden=delete

	" Auto-save when leaving buffers
	au BufLeave,FocusLost * silent! wa
augroup END
