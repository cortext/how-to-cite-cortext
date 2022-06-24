how-to-cite-cortext.pdf:

%.pdf: %.tex
	pdflatex -shell-escape $<
	- biber $*
	pdflatex -shell-escape $<
	pdflatex -shell-escape $<

clean:
	$(RM)  *.log *.aux \
	*.cfg *.glo *.idx *.toc \
	*.ilg *.ind *.out *.lof \
	*.lot *.bbl *.blg *.gls *.cut *.hd \
	*.dvi *.ps *.thm *.tgz *.zip *.rpi \
	*.bcn *.run.xml *.bcf \
	software.dbx software.bbx *-software.lbx software-biblatex.sty
	$(RM) -r biblatex-software

codemeta.json:
	cffconvert -f codemeta -o $@

bibtex.bib:
	cffconvert -f bibtex -o $@
	sed -i 's/YourReferenceHere,/cortext_manager_v2_bibtex,\nkeywords = {cortext},/' $@
	sed -i 's/^\(\w\)/  \1/' $@

apalike.apa:
	cffconvert -f apalike -o $@

install:
	curl https://mirrors.ctan.org/macros/latex/contrib/biblatex-contrib/biblatex-software.zip -s -L -o biblatex-software.zip
	unzip -o -q biblatex-software.zip
	cp biblatex-software/software.dbx biblatex-software/software.bbx biblatex-software/*-software.lbx biblatex-software/software-biblatex.sty .
