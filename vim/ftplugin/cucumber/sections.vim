" s:last_pos is used to handle {count}]]/{count}[[ properly
" If last position is not remembered after each search command,
" subsequent second, third, and so on searches will start one
" line below the original cursor position, when it should be 
" searching from last-found search position
let s:last_pos = [0,0,0,0]

" s:count keeps track of how many repeated operations are left
" This is mainly used to determine whether to remember the last
" cursor position after the search. If we still have repeated
" operations to do (when s:count > 0), then we want to remember
" the current position so that next subsequent operation can start
" from correct position. Otherwise, we want to reset the last position
" so that next individual operation can start from actual cursor position
let s:count = 0

function! <SID>NextSection(backwards, visual)

	if v:count > 0
		let s:count = v:count
	endif

	if s:last_pos[1] != 0
		call setpos('.', s:last_pos)
	endif

	" all ex mode commands will clear out the visual selection
	" run gv command to restore the selection if visual mode
	if a:visual
		normal! gv
	endif

	let pattern = '\v^\s*Scenario'

	if a:backwards
		let dir = '?'
	else
		let dir = '/'
	endif

	if a:visual
		let cmd = 'silent normal! ' . dir . pattern . "\<cr>"
		while s:count > 0
			let cmd = cmd . "n"
			let s:count -= 1
		endwhile
		echom "cmd: " . cmd
		execute cmd
	else
		try
			execute 'silent normal! ' . dir . pattern . "\<cr>"
		catch
		endtry

		if s:count > 0
			let s:last_pos = getpos('.')
			let s:count -= 1
		else
			let s:last_pos = [0,0,0,0]
		endif
	endif

endfunction

noremap <script> <buffer> <silent> ]]
	\ :call <SID>NextSection(0,0)<cr>

noremap <script> <buffer> <silent> [[
	\ :call <SID>NextSection(1,0)<cr>

vnoremap <script> <buffer> <silent> ]]
	\ :<c-u>call <SID>NextSection(0,1)<cr>

vnoremap <script> <buffer> <silent> [[
	\ :<c-u>call <SID>NextSection(1,1)<cr>
