filetype plugin on
:syntax on

call pathogen#infect()
call pathogen#helptags()

" Colors
set t_Co=256
set background=dark
colorscheme solarized

" Indentation
set expandtab
set shiftwidth=2
set softtabstop=2

" apply bashrc to vim's shell
:set shellcmdflag=-ic

set nowrap

" Highlight spaces at the end of line
:highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
:match ExtraWhitespace /\s\+$/


" Add specific file types

" Hive Query Language
au BufNewFile,BufRead *.hql set filetype=sql

" Markdown
au BufRead,BufNewFile *.md,*.marksown set filetype=markdown
au BufRead,BufNewFile README.md set filetype=ghmarkdown

" Gradle
au BufRead,BufNewFile *.gradle set filetype=groovy
