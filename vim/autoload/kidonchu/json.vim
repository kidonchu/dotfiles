function! kidonchu#json#reformat()

	" re-format into json
	execute "%! python -m json.tool"

	" re-tab with spaces
	setlocal expandtab
	setlocal shiftwidth=2
	normal! ggVG==

	" remove 'localhost...'
	try
		execute '%s/\vhttp:\/\/localhost\/hosted//'
	catch
		" you are okay with not finding any pattern
	endtry

	" copy to clipboard
	normal! ggVyG
	
endfunction
