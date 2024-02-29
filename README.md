# Example Python Project Template

By [Ryan Jenkinson](https://ryan.eco)

## ⚙️ Features

- 🌎 Modern example, using Github templates and workflows
- 🐍 Uses Python 3.11+
- 🛠️ Uses modern tools such as [`rye`](https://github.com/astral-sh/rye/) for Python management (versions, virtualenvs and the project itself) and [`uv`](https://github.com/astral-sh/uv/)
- 🔧 Nice [pre-commit](https://pre-commit.com/) config, using tools such as [`ruff`](https://github.com/astral-sh/ruff) for linting and formatting
- 🤝 Everything is defined in `pyproject.toml`
- 📝 Documentation built in using [`mkdocs`](https://www.mkdocs.org/), deployed to Github Pages

If you want a similar project template that uses [`poetry`](https://github.com/python-poetry/poetry) instead of `rye`, check out the `poetry` branch.

## 🚧 Setup

1. You should have Rye installed. I recommend using `brew` (if on a Mac) to install it: `brew install rye`
2. Run `rye run setup-dev`

and you're done! Just remove some of the boilerplate (e.g CTRL+F for `mypackage`) and start building 🚀

### 🕵️ What does `rye run setup-dev` do?

In 4 we run the following commands:

- Installs all dependencies, including development ones. You can do this manually via `rye sync`
- Installs pre-commit hooks, which you can do manually via `rye run "install:pre-commit"` after a `rye sync`, and checks they pass on all files.
  - This also checks the code is linted, which you can do manually via `rye run lint`
  - and checks the tests pass, which you can do manually via `rye run test`

### Optional: `direnv`

You can use `direnv` to automatically activate the virtualenv when you `cd` into the directory. Just follow [these instructions](https://github.com/direnv/direnv/wiki/Python#rye) run `echo 'layout rye' > .envrc` and run `direnv allow` then you're done! At any time, you can activate the virtual environment in `.venv/bin/activate` and run any command you want (`ruff` or `pytest` for example)
