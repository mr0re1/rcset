bash-dependencies:
	p='bash/tp';									\
	r='https://raw.githubusercontent.com/git/git/master/contrib/completion';	\
	rm -rf "$$r"; mkdir "$$r"; 							\
	for f in git-completion.bash git-prompt.sh; do 					\
		curl "$$r"/"$$f" > "$$p"/"$$f";						\
	done

bash-install: bash-dependencies
	[ -f ~/.bashrc ] && mv ~/.bashrc ~/.bashrc.backup || echo "Nothing to backup"
	ln -s $(CURDIR)/bashrc ~/.bashrc
