" .vimrc

set number
set mouse=a
syntax on

" Normal mode mappings for navigation
nnoremap fs gg
nnoremap fe G
nnoremap end $
nnoremap dt dd
nnoremap dne 0
nnoremap dnw ^

" Operator-pending mappings 
onoremap fs gg
onoremap fe G
onoremap end $
onoremap dtt dd
onoremap dne 0
onoremap dnw ^

" System clipboard copy
nnoremap cp "+y
vnoremap cp "+y

nnoremap cpa gg"+yG
nnoremap dta ggdG

nnoremap cmt I# <Esc>
nnoremap cmr ^xx

vnoremap cmt :s/^/# /<CR>
vnoremap cmr ^xx 
