let g:bookmark_sign = '♥'
let g:bookmark_highlight_lines = 0
let g:bookmark_center = 1
let g:bookmark_save_per_working_dir = 1
let g:bookmark_auto_save = 1
let g:bookmark_no_default_key_mappings = 1
function! BookmarkMapKeys()
	nnoremap mm :BookmarkToggle<CR>
	nnoremap mi :BookmarkAnnotate<CR>
	nnoremap mn :BookmarkNext<CR>
	nnoremap mp :BookmarkPrev<CR>
	nnoremap ma :BookmarkShowAll<CR>
	nnoremap mc :BookmarkClear<CR>
	nnoremap mx :BookmarkClearAll<CR>
	nnoremap mkk :BookmarkMoveUp
	nnoremap mjj :BookmarkMoveDown
endfunction
function! BookmarkUnmapKeys()
	unmap mm
	unmap mi
	unmap mn
	unmap mp
	unmap ma
	unmap mc
	unmap mx
	unmap mkk
	unmap mjj
endfunction
autocmd BufEnter * :call BookmarkMapKeys()
autocmd BufEnter NERD_tree_* :call BookmarkUnmapKeys()
