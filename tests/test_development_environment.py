from pathlib import Path


def test_environment_files_exist(environments):
    for env in environments:
        file_path = Path("environments") / f"{env}.env"
        assert file_path.exists(), f"{file_path} does not exist"
