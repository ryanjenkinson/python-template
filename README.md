# Example Python Project Template

By [Ryan Jenkinson](https://ryan.eco)

## ⚙️ Features

- 🌎 Modern example, using Github templates and workflows
- 🐍 Uses Python 3.11
- 🛠️ Uses modern tools such as [`poetry`](https://github.com/python-poetry/poetry) for Python virtual environment management and [`poe`](https://github.com/nat-n/poethepoet) as a task runner
- 🔧 Nice [pre-commit](https://pre-commit.com/) config, using tools such as [`ruff`](https://github.com/astral-sh/ruff) for linting and [`black`](https://github.com/psf/black) for formatting
- 🤝 Everything is defined in `pyproject.toml`
- 📝 Documentation built in using [`mkdocs`](https://www.mkdocs.org/), deployed to Github Pages

## 🚧 Setup

1. You should have Python installed. I recommend using `brew` (if on a Mac) to install `pyenv` to manage Python versions.
2. Install `poetry` (e.g `brew install poetry`)
3. (Optional, but recommended) Install `poe`, the task runner. (e.g `brew install pipx; pipx install poethepoet`)
4. Run `poe setup-dev`

and you're done! Just remove some of the boilerplate (e.g CTRL+F for `mypackage`) and start building 🚀

### 🕵️ What does `poe setup-dev` do?

In 4 we run the following commands:

- Installs all dependencies, including development ones. You can do this manually via `poetry install` or `poetry install --sync`
- Installs pre-commit hooks, which you can do manually via `poetry run pre-commit install`, and checks they pass on all files (`poetry run pre-commit run --all-files`)
  - This also checks the code is linted, which you can do manually via `[poetry run] poe lint`
  - and checks the tests pass, which you can do manually via `[poetry run] poe test`

If you do not install `poe` above, you can still use it (after running `poetry install`) by running `poetry run poe X` instead of `poe X`. All `poe` commands are defined in the `pyproject.toml`, and it's basically just a fancy makefile.
