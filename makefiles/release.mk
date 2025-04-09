.PHONY: all clean test

CURRENT_VERSION := $(shell cz version -p)

release-version-show:
	# Show the current version number.
	cz version -p

release-version-bump:
	# Automatically bump the version number based on the semver scheme.
	cz bump --version-scheme=semver --files-only

release-version-bump-major:
	# Manually bump the version number to the next major version.
	cz bump --increment MAJOR --version-scheme=semver --files-only

release-version-bump-minor:
	# Manually bump the version number to the next minor version.
	cz bump --increment MINOR --version-scheme=semver --files-only

release-version-bump-patch:
	# Manually bump the version number to the next patch version.
	cz bump --increment PATCH --version-scheme=semver --files-only

release-version-tag:
	# Tag the release with the new version number.
	git tag -a $(CURRENT_VERSION) -m "Version: $(CURRENT_VERSION)"

release-changelog-prepare:
	# Prepare the changelog for the new release.
	cz changelog
