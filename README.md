# Example Python Project Template

By [Ryan Jenkinson](https://ryan.eco)

## ⚙️ Features

- 🌎 Modern example, using Github templates and workflows
- 🐍 Uses Python 3.11+
- 🛠️ Uses [`uv`](https://github.com/astral-sh/uv/) - an all in one modern tool for Python management (versions, virtualenvs and the project itself)
- 🔧 Nice [pre-commit](https://pre-commit.com/) config, using tools such as [`ruff`](https://github.com/astral-sh/ruff) for linting and formatting
- 🤝 Everything is defined in `pyproject.toml`
- 📝 Documentation built in using [`mkdocs`](https://www.mkdocs.org/), deployed to Github Pages

If you want a similar project template that uses [`poetry`](https://github.com/python-poetry/poetry) instead of `uv`, check out the `poetry` branch. At a previous point, this project used `rye` on the `main` branch but that has been phased out in favour of `uv`.

## 🚧 Setup

1. You should have `uv` installed. I recommend using `brew` (if on a Mac) to install it: `brew install uv`
2. Run `uv run pre-commit run --all-files`

and you're done! Just remove some of the boilerplate (e.g CTRL+F for `mypackage`) and start building 🚀

### 🕵️ What does `uv run pre-commit run --all-files` do?

If you havent set up a virtual environment yet, or even installed Python, then `uv` will:

1. Download that python version for you that matches this project version
2. Set up a virtual environment at `.venv` and activate it
3. Install all dependencies into your local environment, synced with the lockfile
4. Runs `pre-commit run` which will first initialise the pre commit hooks on your machine, then checks they pass for this project

### Optional: `direnv` for automatic environment activation when `cd`ing into the directory

You can use `direnv` to automatically activate the virtualenv when you `cd` into the directory. Just run `brew install direnv` and follow [these instructions](https://github.com/direnv/direnv/wiki/Python#uv) run `echo 'layout uv' > .envrc` and run `direnv allow` then you're done !
I have this set as an alias on my machine in the `~/.zshrc` i.e

```bash
alias autoenv="echo 'layout uv' > .envrc && direnv allow"
```

so you just need to one off run `autoenv`

At any time, even without the above, you can activate the virtual environment in `.venv/bin/activate` and run any command you want (`ruff` or `pytest` for example)
