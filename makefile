PHONY_TARGETS := all main enrico publications pubs
.PHONY: $(PHONY_TARGETS)

out/:
	mkdir -p out

publications: pubs

pubs: out/
	latexmk publications.tex

main: enrico

enrico: out/
	latexmk enrico.tex

all: main pubs

clean:
	latexmk -c enrico.tex
	latexmk -c publications.tex

clear: clean
	rm out/enrico.run.xml
	rm out/publications.run.xml
	rm out/enrico.pdf
	rm out/publications.pdf