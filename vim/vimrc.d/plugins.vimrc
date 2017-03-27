filetype off

call plug#begin('~/.vim/plugged')

" Plugins {{{

Plug 'easymotion/vim-easymotion'
Plug 'kidonchu/yember'
Plug 'nazo/pt.vim'
Plug 'tobyS/vmustache'
Plug 'tobyS/pdv'
Plug 'jeetsukumaran/vim-indentwise'
Plug 'Chiel92/vim-autoformat'
Plug 'benmills/vimux'
" Plug 'bkad/CamelCaseMotion'
Plug 'kana/vim-textobj-user'
Plug 'zandrmartin/vim-textobj-blanklines'
Plug 'glts/vim-textobj-comment'
Plug 'kana/vim-textobj-function'
Plug 'kana/vim-textobj-indent'
Plug 'Chun-Yang/vim-textobj-chunk'
" Plug 'veloce/vim-behat'
Plug 'godlygeek/tabular'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'mattn/emmet-vim'
Plug 'dhruvasagar/vim-table-mode'
Plug 'beloglazov/vim-online-thesaurus'
Plug 'nelstrom/vim-markdown-folding'
" Plug 'vimoutliner/vimoutliner'
Plug 'cespare/vim-toml'
" Plug 'vim-scripts/SQLUtilities'
Plug 'NLKNguyen/pipe.vim'
Plug 'NLKNguyen/pipe-mysql.vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'fatih/vim-go'
Plug 'tpope/vim-abolish'
Plug 'terryma/vim-multiple-cursors'
Plug 'surround.vim'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'scrooloose/nerdtree'
Plug 'kidonchu/vim-airline'
Plug 'kidonchu/vim-airline-themes'
Plug 'kidonchu/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'kidonchu/fzf.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-obsession'
Plug 'powerline/fonts'
Plug '~/.vim/plugged/portkey'
Plug 'scrooloose/syntastic'
Plug 'ervandew/supertab'
Plug 'schickling/vim-bufonly'
Plug 'majutsushi/tagbar'
Plug 'vim-php/phpctags'
Plug 'vim-php/tagbar-phpctags.vim'
" Plug 'rking/ag.vim'
" Plug 'Chun-Yang/vim-action-ag'
Plug 'nelstrom/vim-visual-star-search'
Plug 'kristijanhusak/vim-hybrid-material'
" Plug 'sickill/vim-pasta'
Plug 'elzr/vim-json'
Plug 'StanAngeloff/php.vim'
Plug 'mnpk/vim-jira-complete'
Plug 'chriskempson/base16-iterm2'
Plug 'chriskempson/base16-vim'
Plug 'chriskempson/base16-shell'
Plug 'christoomey/vim-tmux-navigator'
Plug 'Konfekt/FastFold'
Plug 'vim-scripts/mru.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'Shougo/neocomplete.vim'
Plug 'tpope/vim-unimpaired'
Plug 'terryma/vim-expand-region'
Plug 'tpope/vim-endwise'
Plug 'sjl/gundo.vim'
Plug 'matchit.zip'
Plug 'vitalk/vim-simple-todo'
Plug 'AndrewRadev/vimrunner'
Plug 'junegunn/vim-easy-align'
Plug 'xolox/vim-misc'
Plug 'plasticboy/vim-markdown'
Plug 'matze/vim-move'
Plug 'pangloss/vim-javascript'
Plug 'mustache/vim-mustache-handlebars'
Plug '~/.vim/plugged/ember_tools.vim'
Plug 'ternjs/tern_for_vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/gv.vim'
Plug 'svermeulen/vim-easyclip'
Plug 'kidonchu/vimscripts'

" }}} Plugins

call plug#end()

filetype plugin indent on

""""""""""""""""""""
"" Plugin Options ""
""""""""""""""""""""
" {{{ fzf
imap <c-x><c-l> <plug>(fzf-complete-line)
let $FZF_DEFAULT_COMMAND= 'ag -g ""'
" [Files] Extra options for fzf
"         e.g. File preview using CodeRay (http://coderay.rubychan.de/)
let g:fzf_files_options =
  \ '--preview "(coderay {} || cat {}) 2> /dev/null | head -'.&lines.'"'
let g:fzf_layout = { 'down': '~40%' }
let g:fzf_tags_command = 'ctags -f ./ctags'

nnoremap <silent> <leader>F :Files<cr>
nnoremap <silent> <leader>H :History<cr>
nnoremap <silent> <leader>R :BTags<cr>
nnoremap <silent> <leader>T :Tags<cr>
nnoremap <silent> <leader>U :Buffers<cr>
command! -bang -nargs=* Ag
	\ call fzf#vim#ag(<q-args>,
	\                 <bang>0 ? fzf#vim#with_preview('up:60%')
	\                         : fzf#vim#with_preview('right:50%:hidden', '?'),
	\                 <bang>0)
nnoremap <leader>aa :Ag!<space>
nnoremap <leader>aw :Ag!<space><c-r><c-w><space>
" }}}
" {{{ neocomplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:echodoc_enable_at_startup = 0
if !exists('g:neocomplete#keyword_patterns')
	let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()
" Fix conflict with multiple cursor
function! Multiple_cursors_before()
	exe 'NeoCompleteLock'
endfunction
function! Multiple_cursors_after()
	exe 'NeoCompleteUnlock'
endfunction
" }}}
" {{{ NERDTree
" open a NERDTree automatically when vim starts up if no files were specified
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" close vim if nerdtree is the last window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
nnoremap <leader>m :NERDTreeFind<CR>
nnoremap <leader>n :NERDTreeToggle<CR>
" }}}
" {{{ Gundo
nnoremap <leader>uu :GundoToggle<CR>
""" Gundo }}}
" {{{ mustache
let g:mustache_abbreviations = 0
" }}} 
" {{{ airline
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod ='
	\:s?app/??
	\:p:gs?component?c?
	\:gs?template?t?
	\:gs?mixins?mxns?
	\:gs?contacts/?cts/?
	\:gs?deals/?ds/?
	\:.
	\'
let g:airline#extensions#tabline#fnamecollapse = 0
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline_theme = "kidonchu"
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
" disable unused extensions (performance)
let g:airline#extensions#bufferline#enabled = 0
let g:airline#extensions#capslock#enabled   = 0
let g:airline#extensions#csv#enabled        = 0
let g:airline#extensions#ctrlspace#enabled  = 0
let g:airline#extensions#eclim#enabled      = 0
let g:airline#extensions#hunks#enabled      = 0
let g:airline#extensions#nrrwrgn#enabled    = 0
let g:airline#extensions#promptline#enabled = 0
let g:airline#extensions#syntastic#enabled  = 0
let g:airline#extensions#taboo#enabled      = 0
let g:airline#extensions#tagbar#enabled     = 0
let g:airline#extensions#virtualenv#enabled = 0
let g:airline#extensions#whitespace#enabled = 0
" }}}
" {{{ gitgutter
let g:gitgutter_realtime=2
let g:gitgutter_eager=2
set updatetime=250
let g:gitgutter_sign_added = '++'
let g:gitgutter_sign_modified = '~~'
let g:gitgutter_sign_removed = '__'
let g:gitgutter_sign_removed_first_line = '‾‾'
nnoremap <leader>gt :GitGutter<CR>
nnoremap <leader>gu :GitGutterUndoHunk<cr>
nnoremap <leader>gv :GitGutterPreviewHunk<cr>
" }}}
" {{{ gv.vim
nnoremap <leader>gvc :GV!<cr>
nnoremap <leader>gvv :GV<cr>
" }}}
" {{{ portkey, ember
nnoremap <leader>ec :Ecomponent<space>
nnoremap <leader>em :Emodel<space>
nnoremap <leader>eo :Econtroller<space>
nnoremap <leader>er :Eroute<space>
nnoremap <leader>et :Etemplate<space>
" }}}
" {{{ Syntastic
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
let syntastic_mode_map = { 'passive_filetypes': ['html'] }
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_php_checkers=['php']
" let g:syntastic_php_phpcs_args='--standard=AC -n'
au FileType scss :let g:syntastic_check_on_wq = 0
au FileType scss :let g:syntastic_auto_loc_list = 0
" }}}
" {{{ ultisnips
let g:UltiSnipsSnippetsDir = "~/.vim/UltiSnips"
function! g:UltiSnips_Complete()
  call UltiSnips#ExpandSnippet()
  if g:ulti_expand_res == 0
	if pumvisible()
	  return "\<C-n>"
	else
	  call UltiSnips#JumpForwards()
	  if g:ulti_jump_forwards_res == 0
		return "\<TAB>"
	  endif
	endif
  endif
  return ""
endfunction

function! g:UltiSnips_Reverse()
  call UltiSnips#JumpBackwards()
  if g:ulti_jump_backwards_res == 0
	return "\<C-P>"
  endif

  return ""
endfunction

if !exists("g:UltiSnipsJumpForwardTrigger")
   let g:UltiSnipsJumpForwardTrigger = "<c-j>"
endif

if !exists("g:UltiSnipsJumpBackwardTrigger")
   let g:UltiSnipsJumpBackwardTrigger="<c-k>"
endif

au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger     . " <C-R>=g:UltiSnips_Complete()<cr>"
au InsertEnter * exec "inoremap <silent> " .     g:UltiSnipsJumpBackwardTrigger . " <C-R>=g:UltiSnips_Reverse()<cr>"

nnoremap <F12> :UltiSnipsEdit<CR>
" }}}
" {{{ BufOnly
nnoremap <leader>uo :BufOnly<cr>
" BufOnly }}}
" {{{ Tagbar
set tags+=ctags
" }}}
" {{{  PHP Ctags
let g:tagbar_phpctags_bin='/usr/local/bin/phpctags'
" }}}
"  {{{ Ag, Silver Searcher
" let g:ag_prg = 'ag --ignore=ctags --ignore-dir={dist,tmp,node_modules,bower_components,.idea,vendor,cache} --vimgrep'
" nnoremap <leader>aa :Ag!<space>
" nnoremap <leader>ac :Ag!<space><c-r><c-w><space>
" nnoremap <leader>aw :AgBuffer!<space>
" }}}
" {{{ FastFold
let g:fastfold_savehook = 0
" }}}
" {{{ Indent guide lines
let g:indent_guides_start_level = 2
let g:indent_guides_auto_colors = 0
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_default_mapping = 0
""" }}}
" {{{ watchman
" Toggles watchman process and updates global watchman status variable
function! ToggleWatchmanProcess()
	let s:result=system('toggleWatchmanProcess')
	echom s:result 
	if s:result == 'resuming watchman'
		let g:watchman_running = 1
	else
		let g:watchman_running = 0
	endif
endfunction
command! ToggleWatchmanProcess :call ToggleWatchmanProcess()
" Upon vim startup, set the current watchman status
function! SetWatchmanProcessState()
	let s:result=system('getWatchmanProcessState')
	if s:result == 'watchman running'
		let g:watchman_running = 1
	else
		let g:watchman_running = 0
	endif
endfunction
" }}}
" {{{ pipe-mysql.vim
let g:pipemysql_login_info = [
	\ {
	\    'description' : 'vagrant',
	\    'ssh_address' : 'vagrant@10.11.12.13',
	\    'ssh_port' : '',
	\    'mysql_hostname' : '127.0.0.1',
	\    'mysql_username' : 'kchu',
	\    'mysql_password' : 'test',
	\    'mysql_database' : 'hosted'
	\ }
\ ]
" }}}
" {{{ markdown
let g:markdown_fold_style = 'stacked'
let g:vim_markdown_folding_disabled = 1
" }}}
" {{{ emmet
let g:user_emmet_install_global = 0
let g:user_emmet_leader_key='<C-Z>'
augroup emmet
	autocmd!
	autocmd FileType html,css,html.handlebars EmmetInstall
augroup END
" }}}
" {{{ vim-go
let g:go_fmt_command = "goimports"
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['vet', 'golint']
augroup plugin-vim-go
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
" }}}
" {{{ vim-behat
" mandatory if you want the '*.feature' files to be set with behat filetype
let g:feature_filetype='behat'

" The plugin tries successively several behat executables to find the good one
" (php behat.phar, bin/behat, etc). You can define a custom list that will
" be prepended to the default path with g:behat_executables.
let g:behat_executables = ['behat.sh']

" if you use neocomplcache add this to enable behat completion
if !exists('g:neocomplcache_omni_patterns')
    let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.behat = '\(When\|Then\|Given\|And\)\s.*$'

" disable omni completion steps cache
" normally you don't want to do this because it's slow (and will prevent neocomplcache from working)
" let g:behat_disable_omnicompl_cache = 1
" }}}
" {{{ vim-bookmarks
let g:bookmark_sign = '♥'
let g:bookmark_highlight_lines = 0
let g:bookmark_center = 1
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
" }}}
" {{{ vim-easyclip
let g:EasyClipAutoFormat = 1
let g:EasyClipShareYanks = 1
let g:EasyClipUseSubstituteDefaults = 1
" let g:EasyClipUseGlobalPasteToggle = 1
" remap Move(cut) command to x
let g:EasyClipUseCutDefaults = 0
nmap t <Plug>MoveMotionPlug
xmap t <Plug>MoveMotionXPlug
nmap tt <Plug>MoveMotionLinePlug
nmap T <Plug>MoveMotionEndOfLinePlug
nmap tT <Plug>MoveMotionReplaceLinePlug
" remap Swap Paste to c-f and c-d
" let g:EasyClipUsePasteToggleDefaults = 0
" nmap <c-f> <plug>EasyClipSwapPasteForward
" nmap <c-d> <plug>EasyClipSwapPasteBackwards
" }}}
" {{{ vim-multiple-cursors
" let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-b>'
" let g:multi_cursor_prev_key='<C-p>'
" let g:multi_cursor_skip_key='<C-x>'
" let g:multi_cursor_quit_key='<Esc>'
" }}}
" {{{ vim-javascript
let g:javascript_plugin_jsdoc = 1
" }}}
" {{{ CamelCaseMotion
" map <silent> w <Plug>CamelCaseMotion_w
" map <silent> b <Plug>CamelCaseMotion_b
" map <silent> e <Plug>CamelCaseMotion_e
" map <silent> ge <Plug>CamelCaseMotion_ge
" sunmap w
" sunmap b
" sunmap e
" sunmap ge
" omap <silent> iw <Plug>CamelCaseMotion_iw
" xmap <silent> iw <Plug>CamelCaseMotion_iw
" omap <silent> ib <Plug>CamelCaseMotion_ib
" xmap <silent> ib <Plug>CamelCaseMotion_ib
" omap <silent> ie <Plug>CamelCaseMotion_ie
" xmap <silent> ie <Plug>CamelCaseMotion_ie
" }}}
" {{{ vim-autoformat
noremap <leader>af :Autoformat<CR>
" }}}
" {{{ pt.vim, platinum searcher
let g:ptprg="pt --ignore={ctags,dist,tmp,node_modules,bower_components,.idea,vendor,cache,docs} --column --nocolor --context=0"
nnoremap <leader>pt :Pt<space><c-r><c-w><space>
" }}}

" {{{ pdv
let g:pdv_template_dir = $HOME ."/dotfiles/vim/plugged/pdv/templates_snip"
" nnoremap <F2> :call pdv#DocumentWithSnip()<CR>
" }}}
