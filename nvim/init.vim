for f in split(glob('~/.config/nvim/nvim.d/*.vim'), '\n')
	exe 'source ' . f
endfor
