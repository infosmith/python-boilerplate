include ./makefiles/*.mk


initialize-project:
	# Initialize project once after template is rendered.
	git init
	git submodule update --init --recursive
	make python-dependencies-all
	- mkdir ./environments
	- touch ./environments/base.env
	- touch ./environments/development.env
	- touch ./environments/production.env
	make git-hooks-update
	make git-hooks-install
	make git-hooks-all-files
	