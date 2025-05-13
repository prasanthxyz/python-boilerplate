# Python Boilerplate

## What's included?
1. `requirements.txt` with packages used in this boilerplate
2. `setup.cfg` for configuring flake8, mypy, and pytest
3. `pyproject.toml` for configuring black and isort
4. `format.sh` script to format the entire codebase
5. `.gitignore` for python projects
6. A sample python module in `src`, and the testcase in `tests`
7. `.vscode/settings.json` for configuring formatters, tests, and auto-format on save
8. A `test.sh` script to check linting, coverage, tests, etc.

## How to use this in a new project?
1. Clone this repo
2. Delete the `.git` folder and `README.md`
3. (If required) Set up your new git repo in this folder
4. Add your python code to `src`, and tests to `tests` directories.  
   You can change the directory name, but please make sure to update `setup.cfg`, `test.sh`, `.vscode/settings.json` wherever it is used
5. (If required) Run `./format.sh` to format all code
6. Run `./test.sh` to run all checks

