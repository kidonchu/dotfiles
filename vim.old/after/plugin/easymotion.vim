" Disable default mappings
let g:EasyMotion_do_mapping = 0

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

map <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" <Leader>f{char} to move to {char}
" map  <Leader>f <Plug>(easymotion-bd-f)
" nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
" nmap <Leader>s <Plug>(easymotion-overwin-f2)

" Move to line
" map <Leader>l <Plug>(easymotion-bd-jk)
" nmap <Leader>l <Plug>(easymotion-overwin-line)

" Move to word
" nmap  <Leader>w <Plug>(easymotion-bd-w)
" nmap <Leader>W <Plug>(easymotion-overwin-w)
