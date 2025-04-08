.PHONY: all clean test

project-initialize:
	# Initialize project once after template is rendered.
	git init
	make python-dependencies-all
	make git-hooks-update
	make git-hooks-install
	make git-hooks-all-files
