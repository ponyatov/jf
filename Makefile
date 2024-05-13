# tool
PY   = bin/python3
PIP  = bin/pip3
JUPY = bin/jupyter
LAB  = $(JUPY)-lab
DOT  = /usr/bin/dotnet

# all
all: $(LAB)

# https://github.com/dotnet/interactive/blob/main/docs/NotebookswithJupyter.md
# install
install: $(PY) $(PIP) $(LAB) $(DOT)
	$(DOT) tool install -v d -g Microsoft.dotnet-interactive
	$(DOT) tool list -g
	mkdir -p ~/.local/share/jupyter/kernels
	dotnet interactive jupyter install
	$(JUPY) kernelspec list && dotnet --version
$(LAB): $(PIP)
	$(PIP) install -U -r requirements.txt
$(PY) $(PIP):
	python3 -m venv .
