set number
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set autoindent
syntax on

" statusline
set laststatus=2
set statusline= 
set statusline+=%#DiffAdd#%{(mode()=='n')?'\ \ NORMAL\ ':''} 
set statusline+=%#DiffChange#%{(mode()=='i')?'\ \ INSERT\ ':''} 
set statusline+=%#DiffDelete#%{(mode()=='r')?'\ \ RPLACE\ ':''} 
set statusline+=%#Cursor#%{(mode()=='v')?'\ \ VISUAL\ ':''} 
set statusline+=\ %n\ 
set statusline+=%#Visual# 
set statusline+=%{&paste?'\ PASTE\ ':''} 
set statusline+=%{&spell?'\ SPELL\ ':''} 
set statusline+=%#CursorIM# 
set statusline+=%R 
set statusline+=%M 
set statusline+=%#Cursor# 
set statusline+=%#CursorLine# 
set statusline+=\ %t\ 
set statusline+=%= 
set statusline+=%#CursorLine# 
set statusline+=\ %Y\ 
set statusline+=%#CursorIM# 
set statusline+=\ %3l:%-2c\ 
set statusline+=%#Cursor# 
set statusline+=\ %3p%%\ 

