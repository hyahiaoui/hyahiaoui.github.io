# hyahiaoui.github.io

This project, built using [mkdocs](https://www.mkdocs.org/) and [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/) contains `hyahiaoui`'s personal site, showcases his portefolio, blog and notes.

## Setup

This project is managed using [poetry](https://python-poetry.org/). Install the project dependencies using 

```bash
poetry install
```

The site creation (an action done once) was done using

```bash
poetry run mkdocs new .
```

To start the live-reloading docs server, run

```bash
poetry run mkdocs serve
```

To build the documentation site, run

```bash
poetry run mkdocs build
```
