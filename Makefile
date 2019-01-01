# If ENV is pipenv, run export PIPENV_VENV_IN_PROJECT=1
# Otherwise, .venv will not be in the current project.

DATA = $(wildcard data/*.pkl)
MODELS = $(wildcard models/*.pkl)
PLOTS = $(wildcard plots/*.png)

all: data models figures
data: $(DATA)
models: $(MODELS)
plots: $(PLOTS)

data/%.pkl: scripts/%.py
	python $<

models/%.pkl: scripts/%.py clean.pkl
	python $<

plots/%.png: scripts/%.py clean.pkl
	python $<

.PHONY: all data models plots