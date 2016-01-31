DOCUMENTS = \
	sablon \
	bevezeto \
	modellezes-es-metamodellezes \
	struktura-alapu-modellezes \
	allapot-alapu-modellezes \
	folyamatmodellezes \
	teljesitmenymodellezes \
	modellek-fejlesztese \
	modellek-ellenorzese \
	felderito-adatelemzes \
	szimulacio \
	kodgeneralas \
	rendszermodellezes

build:
	@$(foreach DOCUMENT, \
		$(DOCUMENTS),\
		echo ============================== $(DOCUMENT) ==============================; \
		xelatex -interaction=batchmode $(DOCUMENT); \
		bibtex $(DOCUMENT); \
		xelatex -interaction=batchmode $(DOCUMENT); \
		makeglossaries $(DOCUMENT); \
		xelatex -interaction=batchmode $(DOCUMENT); \
		echo; \
	)

clean:
	rm -f *.pdf *.log *.html *.aux *.dvi *.thm *.lof *.lot *.fls *.out *.toc *.bbl *.blg *.synctex.gz* *.glg *.glo *.gls *.ist *.soc desktop.ini *.alg *.acn *.acr *.xdy
