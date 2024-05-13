# tool
PY   = bin/python3
PIP  = bin/pip3
JUPY = bin/jupyter
DOT  = /usr/bin/dotnet

# all
all: install
	$(JUPY) kernelspec list && dotnet --version

# https://github.com/dotnet/interactive/blob/main/docs/NotebookswithJupyter.md
# install
install: $(PY) $(PIP) $(JUPY) $(DOT)
	$(DOT) tool install -v d -g Microsoft.dotnet-interactive
$(JUPY): $(PIP)
	$(PIP) install -U -r requirements.txt
$(PY) $(PIP):
	python3 -m venv .
