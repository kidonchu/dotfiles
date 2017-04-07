let g:EasyClipAutoFormat = 1
let g:EasyClipUseSubstituteDefaults = 1
let g:EasyClipUseCutDefaults = 0

nmap t <Plug>MoveMotionPlug
xmap t <Plug>MoveMotionXPlug
nmap tt <Plug>MoveMotionLinePlug
nmap T <Plug>MoveMotionEndOfLinePlug

" Toggle auto-formatting
function! <SID>toggleAutoFormat()
	if g:EasyClipAutoFormat == 1
		let g:EasyClipAutoFormat = 0
	else
		let g:EasyClipAutoFormat = 1
	endif
endfunction
nnoremap <leader><leader>p :call <SID>toggleAutoFormat()<CR>
