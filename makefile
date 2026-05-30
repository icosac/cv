PHONY_TARGETS := all main enrico publications pubs
.PHONY: $(PHONY_TARGETS)

PRIVATE ?= 0

out/:
	mkdir -p out

publications: pubs

pubs: out/
	latexmk publications.tex

main: enrico

enrico: out/
	PRIVATE=$(PRIVATE) latexmk enrico.tex

all: main pubs

clean:
	latexmk -c enrico.tex
	latexmk -c publications.tex
	rm -f out/private-data.tex

clear: clean
	rm -f out/enrico.run.xml
	rm -f out/publications.run.xml
	rm -f out/enrico.pdf
	rm -f out/publications.pdf
