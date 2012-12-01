LATEX = pdflatex
DVIPDF = dvipdfm
SPELL = aspell
TEX = ee149
BIBTEX = bibtex
SOURCES = $(wildcard *.tex) $(wildcard *.bib)

default: pdf

pdf: $(SOURCES)
	$(LATEX) $(TEX); $(BIBTEX) $(TEX); $(LATEX) $(TEX); $(LATEX) $(TEX)
	cp -p $(TEX).pdf final.pdf

view:
	$(LATEX) $(TEX)
	open $(TEX).pdf

osx:
	$(LATEX) $(TEX)
	open $(TEX).pdf

check:
	@echo "Passing the check will cause make to report Error 1."
	$(LATEX) $(TEX)  | grep -i undefined

clean:
	$(RM) -rf auto/ *.aux *.blg *.dvi *.log *.toc *.lof *.lot *.cb *.bbl $(TEX).ps $(TEX).pdf *~ *.out
