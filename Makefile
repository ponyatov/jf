# tool
PY  = bin/python3
PIP = bin/pip3

# all
all: install

# install
# https://github.com/dotnet/interactive/blob/main/docs/NotebookswithJupyter.md
install: $(PY) $(PIP)
	$(PIP) install -U -r requirements.txt
$(PY) $(PIP):
	python3 -m venv .
