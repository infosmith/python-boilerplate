.PHONY: all clean test

python-clean-cache-files:
	-rm -Rf __pycache__
	-rm -Rf .mypy_cache
	-rm -Rf .pytest_cache

python-clean-build-files:
	-rm -R build/
	-rm -R ${PROJECT_NAME}.egg-info

python-clean-files-all:
	make python-clean-build-files
	make python-clean-cache-files

python-version-show:
	bump-my-version show-bump

python-version-bump-major:
	bump-my-version bump major --tag

python-version-bump-minor:
	bump-my-version bump minor --tag

python-version-bump-patch:
	bump-my-version bump patch --tag

python-version-tag:
	git tag -a $(bump-my-version show current_version) -m "Version: $(bump-my-version show current_version)"

python-release:
	git push origin $(bump-my-version show current_version)

python-dependencies:
	make python-dependencies-environment
	make python-dependencies-sync

python-dependencies-all:
	find ./requirements/*.in | xargs -n 1 pip-compile --generate-hashes --allow-unsafe

python-dependencies-clean:
	rm ./requirements/*.txt

python-dependencies-environment:
	pip-compile --generate-hashes --allow-unsafe ./requirements/${PROJECT_ENIVIRONMENT}.in

python-dependencies-sync:
	pip-sync ./requirements/${PROJECT_ENIVIRONMENT}.txt
