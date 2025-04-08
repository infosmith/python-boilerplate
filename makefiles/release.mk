.PHONY: all clean test

release-version-show:
	bump-my-version show-bump

release-version-bump-major:
	bump-my-version bump major --tag

release-version-bump-minor:
	bump-my-version bump minor --tag

release-version-bump-patch:
	bump-my-version bump patch --tag

release-version-tag:
	git tag -a $(bump-my-version show current_version) -m "Version: $(bump-my-version show current_version)"

release-branch:
	git push origin $(bump-my-version show current_version)
