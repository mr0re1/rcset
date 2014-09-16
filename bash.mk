TP :="bash/tp"

bash-dependencies:
	r='https://raw.githubusercontent.com/git/git/master/contrib/completion';	\
	rm -rf "$$r"; mkdir "$$r"; 							\
	for f in git-completion.bash git-prompt.sh; do 					\
		curl "$$r"/"$$f" > $(TP)/"$$f";						\
	done
	curl https://raw.githubusercontent.com/mr0re1/bash-emr/master/setenv.sh > $(TP)/bash-emr.sh

bash-install: bash-dependencies
	[ -f ~/.bashrc ] && mv ~/.bashrc ~/.bashrc.backup || echo "Nothing to backup"
	ln -s $(CURDIR)/bashrc ~/.bashrc
