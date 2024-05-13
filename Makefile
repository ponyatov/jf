# tool
PY   = bin/python3
PIP  = bin/pip3
JUPY = bin/jupyter
DOT  = /usr/bin/dotnet

# all
all: $(JUPY)

# https://github.com/dotnet/interactive/blob/main/docs/NotebookswithJupyter.md
# install
install: $(PY) $(PIP) $(JUPY) $(DOT)
	$(DOT) tool install -v d -g Microsoft.dotnet-interactive
	$(DOT) tool list -g
	mkdir -p ~/.local/share/jupyter/kernels
	dotnet interactive jupyter install
	$(JUPY) kernelspec list && dotnet --version
$(JUPY): $(PIP)
	$(PIP) install -U -r requirements.txt
$(PY) $(PIP):
	python3 -m venv .
