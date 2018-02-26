""" airline
" enable airline
set laststatus=2
let g:airline_highlighting_cache = 1
let g:airline_theme = "base16_tomorrow_night"
" disable all extensions except ones I need
let g:airline_extensions = ["branch", "tabline", "ale"]

""" indent-guidelines
let g:indent_guides_start_level = 2
let g:indent_guides_auto_colors = 0
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_default_mapping = 0

""" bookmark
let g:bookmark_sign = '♥'
let g:bookmark_highlight_lines = 0
let g:bookmark_center = 1
let g:bookmark_auto_save = 0
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

""" easyclip
let g:EasyClipAutoFormat = 1
let g:EasyClipUseSubstituteDefaults = 1
let g:EasyClipUseCutDefaults = 0
nmap t <Plug>MoveMotionPlug
xmap t <Plug>MoveMotionXPlug
nmap tt <Plug>MoveMotionLinePlug
nmap T <Plug>MoveMotionEndOfLinePlug
nmap <leader><leader>p <plug>EasyClipToggleFormattedPaste
imap <c-v> <plug>EasyClipInsertModePaste

""" gitgutter
let g:gitgutter_realtime=2
" let g:gitgutter_eager=2
set updatetime=250
" change sign characters
let g:gitgutter_sign_added = '++'
let g:gitgutter_sign_modified = '~~'
let g:gitgutter_sign_removed = '__'
let g:gitgutter_sign_removed_first_line = '‾‾'
" disable gitgutter if too many git changes
let g:gitgutter_max_signs = 100
" use ag for grep
let g:gitgutter_grep_command = 'ag --nocolor'
if exists('g:loaded_gitgutter')
	nnoremap <leader>gt :GitGutter<CR>
	nnoremap <leader>hr :GitGutterUndoHunk<cr>
	nnoremap <leader>hv :GitGutterPreviewHunk<cr>
	nnoremap <leader>hs :GitGutterStageHunk<cr>
	omap ih <Plug>GitGutterTextObjectInnerPending
	omap ah <Plug>GitGutterTextObjectOuterPending
	xmap ih <Plug>GitGutterTextObjectInnerVisual
	xmap ah <Plug>GitGutterTextObjectOuterVisual
	function! TrimTrailingWhitespacesInHunks(...)
		for hunk in GitGutterGetHunks()
			for lnum in range(hunk[2], hunk[2]+hunk[3]-1)
				let cursor = getcurpos()
				let line = getline(lnum)
				let line = substitute(line, '\s\+$', '', '')
				call setline(lnum, line)
				call setpos('.', cursor)
			endfor
		endfor
	endfunction
	augroup au_TrimTrailingWhitespacesInHunks
		autocmd!
		autocmd BufWritePre * call TrimTrailingWhitespacesInHunks()
	augroup END
endif

""" multiple-cursor
let g:multi_cursor_next_key='<C-b>'
" resolve conflict with deoplete
function! Multiple_cursors_before()
    let b:deoplete_disable_auto_complete = 1
endfunction
function! Multiple_cursors_after()
    let b:deoplete_disable_auto_complete = 0
endfunction

""" markdown
let g:vim_markdown_new_list_item_indent = 4
let g:vim_markdown_folding_disabled = 1

" ale linter
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0
highlight clear ALEErrorSign
highlight clear ALEWarningSign
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_linters = {
	\ 'php': ['php', 'phpmd', 'phpcs'],
	\ }
let g:ale_php_phpcs_standard = 'AC'

""" deoplete
let g:deoplete#sources = {}
let g:deoplete#sources.php = ['padawan', 'ultisnips', 'tags', 'buffer']
" show untiships as first completion candidates
call deoplete#custom#set('_', 'sorters', ['sorter_word'])
call deoplete#custom#set('ultisnips', 'rank', 9999)

""" tmux-navigator
" Write curent buffer before navigating from Vim to tmux pane
let g:tmux_navigator_save_on_switch = 1


