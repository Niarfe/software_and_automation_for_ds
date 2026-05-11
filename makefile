.PHONY: default env update build deploy debug

default:
	@cat makefile

# Jupyter Book 0.15.x is stable on Python 3.12
env: 
	python3.12 -m venv env; . env/bin/activate; pip install --upgrade pip

update: env
	. env/bin/activate; pip install -r requirements.txt

build:
	. env/bin/activate; jupyter-book build docs/

deploy: build
	. env/bin/activate; ghp-import -n -p -f docs/_build/html

debug:
	@clear
	@echo "====== CONFIGURATION STATE ======"
	@echo "File: _config.yml"
	@cat docs/_config.yml
	@echo "\nFile: _toc.yml"
	@cat docs/_toc.yml
	@echo "\nFile: index.md"
	@cat docs/index.md
