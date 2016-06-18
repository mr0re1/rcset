BUNDLE := \
	github[derekwyatt/vim-scala] \
	github[tpope/vim-fugitive] \
	github[jtratner/vim-flavored-markdown] \
	github[altercation/vim-colors-solarized] \
	github[vim-scripts/mako.vim] \
	github[vim-scripts/loremipsum] \
	github[elzr/vim-json] \
	github[puppetlabs/puppet-syntax-vim] \
	github[scrooloose/syntastic] \
	github[uarun/vim-protobuf] \
	github[ryanss/vim-hackernews] \
	github[mr0re1/tla.vim]
BUNDLE_DIR := "vim/bundle"

INSTALL_BUNDLE := $(BUNDLE:%=.install-bundle/%)
install-bundle: $(INSTALL_BUNDLE)

.install-bundle/github[%]:
	# => Install $*
	@cd $(BUNDLE_DIR) && git clone https://github.com/$*.git -q

install-pathogen:
	# => Install pathogen
	@mkdir -p vim/autoload $(BUNDLE_DIR) && \
	curl -LSso vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

vim-dependencies: vim-clean install-pathogen install-bundle

vim-clean:
	# => Clean vim plugin directories
	@rm -rf vim/autoload $(BUNDLE_DIR)

vim-install: vim-dependencies
	[ -f ~/.vimrc ] && mv ~/.vimrc ~/.vimrc.backup || echo "No .vimrc to backup"
	[ -d ~/.vim ] && mv ~/.vim ~/.vim.backup || echo "No .vim to backup"
	ln -s $(CURDIR)/vimrc ~/.vimrc
	ln -s $(CURDIR)/vim ~/.vim
