
FILE = dossier
BIB = refs

LATEX = pdflatex -halt-on-error -no-shell-escape
BIBTEX = bibtex
UNAME_S := $(shell uname -s)
UNAME_O := $(shell uname -o)

ifeq ($(UNAME_S),Linux)
	OPEN = xdg-open
else ifeq ($(UNAME_S),Darwin)
	OPEN = open
else ifeq ($(UNAME_O),Cygwin)
	OPEN = cygstart
endif

all: $(FILE).pdf

$(FILE).pdf: Makefile $(FILE).tex $(BIB).bib
	$(LATEX) $(FILE)
	$(BIBTEX) $(FILE)
	$(LATEX) $(FILE)
	$(LATEX) $(FILE)
	$(OPEN) $(FILE).pdf

clean:
	rm -f $(FILE).pdf *.4ct *.4og *.4tc *.aux *.bbl *.blg *.doc *.dvi *.idv *.lg *.log *.nav *.odt *.out *.snm *.tmp *.toc *.vrb *.xref *.lof *.lot *.loa *.ps *.spl *.gz
