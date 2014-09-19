filetype plugin on
:syntax on

" Colors
set t_Co=256
:colorscheme wombat256mod

" Indentation
set expandtab
set shiftwidth=2
set softtabstop=2


set nowrap

" Highlight spaces at the end of line
:highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
:match ExtraWhitespace /\s\+$/


" Add specific file types

" Hive Query Language
au BufNewFile,BufRead *.hql set filetype=sql

" Markdown
au BufRead,BufNewFile *.md set filetype=markdown
