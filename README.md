# Example Python Project Template

By [Ryan Jenkinson](https://ryan.eco)

## ⚙️ Features

- 🌎 Modern example, using Github templates and workflows
- 🐍 Uses Python 3.11+
- 🛠️ Uses modern tools such as [`hatch`](https://github.com/pypa/hatch/) for Python management (versions, virtualenvs and the project itself) with [`hatch-pip-compile`](https://github.com/juftin/hatch-pip-compile) for dependency locking
- 🔧 Nice [pre-commit](https://pre-commit.com/) config, using tools such as [`ruff`](https://github.com/astral-sh/ruff) for linting and formatting
- 🤝 Everything is defined in `pyproject.toml`
- 📝 Documentation built in using [`mkdocs`](https://www.mkdocs.org/), deployed to Github Pages

If you want a similar project template that uses [`poetry`](https://github.com/python-poetry/poetry) instead of `hatch`, check out the `poetry` branch.

## 🚧 Setup

1. You should have Hatch installed. I recommend using `brew` (if on a Mac) to install it: `brew install hatch`
2. Run `hatch run dev:setup` to setup the project in the development environment

and you're done! Just remove some of the boilerplate (e.g CTRL+F for `mypackage`) and start building 🚀

### 🕵️ What does `hatch run dev:setup` do?

In 4 we run the following commands:

- Installs all dependencies, including development ones. Hatch does this automatically before running any dev command. You can use `hatch env create --env dev` to create a new virtualenv and install the dependencies in it.
- Installs pre-commit hooks, which you can do manually via `hatch run dev:pre-commit`, and checks they pass on all files.
  - This also checks the code is linted, which you can do manually via `hatch run dev:lint`
  - and checks the tests pass, which you can do manually via `hatch run dev:test`

<details>
  <summary><h3>Optional: `direnv` to automatically activate the virtual environment</h3></summary>

You can use `direnv` to automatically activate the virtualenv when you `cd` into the directory.

Add the following to `~/.config/direnv/direnvrc`:

```bash
layout_hatch() {
    PYPROJECT_TOML="${PYPROJECT_TOML:-pyproject.toml}"
    if [[ ! -f "$PYPROJECT_TOML" ]]; then
        log_status "No pyproject.toml found. Executing \`hatch new --init\` to create a \`$PYPROJECT_TOML\` first."
        hatch new --init
    fi

    export HATCH_ENV="dev" # or whatever environment you want to use normally
    VIRTUAL_ENV=$(hatch env find)

    if [[ -z $VIRTUAL_ENV || ! -d $VIRTUAL_ENV ]]; then
        log_status "No virtual environment folder yet. Executing \`hatch env create\` to create it."
        hatch env create
    fi

    PATH_add "$VIRTUAL_ENV/bin"
    export HATCH_ACTIVE=1
    export VIRTUAL_ENV
}
```


Then, for any project that uses this template, just run `echo 'layout hatch' > .envrc` and run `direnv allow` then you're done!

At any time, you can activate the virtual environment in `{(hatch env find) || .venv}/bin/activate` and run any command you want (`ruff` or `pytest` for example)

</details>
