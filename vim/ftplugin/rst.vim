" Ctrl-F9: Convert to HTML and show in browser
nmap <silent> <C-F9> :w<CR>:!rst2html.py %:r.rst %:r.html<CR>:!x-www-browser %:r.html<CR>

" Set spell checking up
:setlocal spell spelllang=en_us
