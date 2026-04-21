" .vimrc

set number
set mouse=a
syntax on

" Normal mode mappings for navigation
nnoremap fs gg
nnoremap fe G
nnoremap end $
nnoremap dne 0
nnoremap dnw ^

" Operator-pending mappings 
onoremap fs gg
onoremap fe G
onoremap end $
onoremap dne 0
onoremap dnw ^

" System clipboard copy
nnoremap cp "+y
vnoremap cp "+y

nnoremap cpa gg"+yG

nnoremap cmt I#<Esc>
nnoremap cmr ^x

vnoremap cmt :s/^/#/<CR>
vnoremap cmr ^x 
