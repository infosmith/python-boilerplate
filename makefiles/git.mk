.PHONY: all clean test

git-hooks:
	pre-commit run

git-hooks-all-files:
	pre-commit run --all-files

git-hooks-install:
	pre-commit install --hook-type commit-msg

git-hooks-update:
	pre-commit autoupdate
