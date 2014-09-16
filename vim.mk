vim-dependencies:
	curl http://www.vim.org/scripts/download_script.php?src_id=13400 > vim/colors/wombat256mod.vim

vim-install: vim-dependencies
	[ -f ~/.vimrc ] && mv ~/.vimrc ~/.vimrc.backup || echo "No .vimrc to backup"
	[ -d ~/.vim ] && mv ~/.vim ~/.vim.backup || echo "No .vim to backup"
	ln -s $(CURDIR)/vimrc ~/.vimrc
	ln -s $(CURDIR)/vim ~/.vim
