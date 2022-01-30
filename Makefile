how-to-cite-cortext.pdf:

%.pdf: %.tex
	pdflatex $<
	- biber $*
	pdflatex $<
	pdflatex $<

clean:
	$(RM)  *.log *.aux \
	*.cfg *.glo *.idx *.toc \
	*.ilg *.ind *.out *.lof \
	*.lot *.bbl *.blg *.gls *.cut *.hd \
	*.dvi *.ps *.thm *.tgz *.zip *.rpi \
	*.pdf *.bcn *.run.xml *.bcf

codemeta.json:
	cffconvert -f codemeta -o $@

bibtex.bib:
	cffconvert -f bibtex -o $@
