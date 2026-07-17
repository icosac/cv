PHONY_TARGETS := all main academic industrial publications pubs
.PHONY: $(PHONY_TARGETS)

# PRIVATE=1 includes personal data; PRIVATE=0 builds the public CV.
PRIVATE ?= 0

out/:
	mkdir -p out

publications: pubs

pubs: out/
	latexmk publications.tex

main: academic

academic: out/
	PRIVATE=$(PRIVATE) latexmk -g academic.tex

industrial: out/
	PRIVATE=$(PRIVATE) latexmk -g industrial.tex

all: academic industrial pubs

clean:
	latexmk -c academic.tex
	latexmk -c industrial.tex
	latexmk -c publications.tex
	rm -f out/private-data.tex

clear: clean
	rm -f out/academic.run.xml
	rm -f out/industrial.run.xml
	rm -f out/publications.run.xml
	rm -f out/academic.pdf
	rm -f out/industrial.pdf
	rm -f out/publications.pdf
