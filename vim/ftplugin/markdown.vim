set textwidth=100
set tabstop=4 shiftwidth=4 expandtab
set spell

" {{{ script to generate markdown html
let s:path = ""
let s:filename = ""
let s:filenameWoExt = ""
let s:input = ""
let s:output = ""

function! <SID>PrepareVariables()

	let s:path = expand('%:p:h')
	let s:filename = expand('%:t')
	let s:filenameWoExt = expand('%:t:r')

	let s:input = s:path . '/' . s:filename
	let s:output = s:path . '/html/' . s:filenameWoExt . '.html'

endfunction

function! <SID>GenerateMarkdownHtml()

	call <SID>PrepareVariables()

	silent !clear
	execute 'silent !python -m markdown ' . s:input . ' > ' . s:output
	redraw!

endfunction

function! <SID>OpenMarkdownHtml()

	call <SID>GenerateMarkdownHtml()

	silent !clear
	execute 'silent !open ' . s:output
	redraw!

endfunction
" }}}

nnoremap <buffer> <F8> :<C-U>call <SID>OpenMarkdownHtml()<CR>

""
" Sort checklist in markdown
""
function! <SID>SortChecklist()

	let l:whereiwas = line('.')

	" make multiples into oneliners with special indicator
	execute 'silent! %s/\n\s\+/Q1W2E3/'
	" sort oneliners
	execute '%sort'
	" bring back multiple lines and indentations
	execute 'silent! %s/Q1W2E3/\r    /'

	execute 'call cursor(' . l:whereiwas . ',0)'

endfunction

nnoremap <buffer> <leader>sort :<C-U>call <SID>SortChecklist()<CR>
