include ./makefiles/*.mk


initialize-project:
	# Initialize project once after template is rendered.
	git submodule update --init --recursive
	make git-hooks-update
	make git-hooks-install
	make git-hooks-all-files
