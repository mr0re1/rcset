BUNDLE := \
	github[derekwyatt/vim-scala] \
	github[tpope/vim-fugitive] \
	github[jtratner/vim-flavored-markdown] \
	github[altercation/vim-colors-solarized] \
	github[vim-scripts/mako.vim]
BUNDLE_DIR := "vim/bundle"

INSTALL_BUNDLE := $(BUNDLE:%=.install-bundle/%)
install-bundle: $(INSTALL_BUNDLE)

.install-bundle/github[%]:
	# => Install $*
	cd $(BUNDLE_DIR) && git clone https://github.com/$*.git

install-pathogen:
	mkdir -p vim/autoload $(BUNDLE_DIR) && \
	curl -LSso vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

vim-dependencies: vim-clean install-pathogen install-bundle
	mkdir -p vim/colors
	curl http://www.vim.org/scripts/download_script.php?src_id=13400 > vim/colors/wombat256mod.vim

vim-clean:
	rm -rf vim/colors vim/autoload $(BUNDLE_DIR)

vim-install: vim-dependencies
	[ -f ~/.vimrc ] && mv ~/.vimrc ~/.vimrc.backup || echo "No .vimrc to backup"
	[ -d ~/.vim ] && mv ~/.vim ~/.vim.backup || echo "No .vim to backup"
	ln -s $(CURDIR)/vimrc ~/.vimrc
	ln -s $(CURDIR)/vim ~/.vim
