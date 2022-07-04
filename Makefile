how-to-cite-cortext.pdf: cortext.bib

cortext.bib: bibtex.bib biblatex-software.bib
	sed 's/keywords = {.\+},/keywords = {cortext-bibtex},/' bibtex.bib > $@
	sed 's/keywords = {.\+},/keywords = {cortext-biblatex},/' biblatex-software.bib >> $@

%.pdf: %.tex
	pdflatex -shell-escape $<
	- biber $*
	pdflatex -shell-escape $<
	pdflatex -shell-escape $<

clean:
	$(RM) *.log *.aux \
	*.cfg *.glo *.idx *.toc \
	*.ilg *.ind *.out *.lof \
	*.lot *.bbl *.blg *.gls *.cut *.hd \
	*.dvi *.ps *.thm *.tgz *.zip *.rpi \
	*.bcn *.run.xml *.bcf cortext.bib \
	$(RM) -r _minted-*

convert: rm codemeta.json bibtex.bib apalike.apa

rm:
	$(RM) codemeta.json bibtex.bib apalike.apa
	$(RM) how-to-cite-cortext.pdf

codemeta.json:
	cffconvert -f codemeta -o $@

bibtex.bib: codemeta.json
	cffconvert -f bibtex -o $@.tmp
	sed -i 's/@misc{YourReferenceHere,/@software{cortext_manager_v2_bibtex,\nkeywords = {$$KEYWORDS},/' $@.tmp
	KEYWORDS=$$(cat codemeta.json | jq -c ".keywords" | tr -d '"[]' | sed 's/,/, /g') envsubst < $@.tmp > $@
	sed -i 's/^\(\w\)/  \1/' $@
	$(RM) $@.tmp

apalike.apa:
	cffconvert -f apalike -o $@

install:
	curl https://mirrors.ctan.org/macros/latex/contrib/biblatex-contrib/biblatex-software.zip -s -L -o biblatex-software.zip
	unzip -o -q biblatex-software.zip
	cp biblatex-software/software.dbx biblatex-software/software.bbx biblatex-software/*-software.lbx biblatex-software/software-biblatex.sty .

uninstall:
	$(RM) biblatex-software.zip software.dbx software.bbx *-software.lbx software-biblatex.sty
	$(RM) -r biblatex-software
