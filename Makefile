DOCUMENTS = \
	rendszermodellezes \
	rendszermodellezes-mobile \
	sablon \
	hf \
	hf-mobile \
	bevezeto \
	bevezeto-mobile \
	modellezes-es-metamodellezes \
	modellezes-es-metamodellezes-mobile \
	struktura-alapu-modellezes \
	struktura-alapu-modellezes-mobile \
	allapot-alapu-modellezes \
	allapot-alapu-modellezes-mobile \
	folyamatmodellezes \
	folyamatmodellezes-mobile \
	teljesitmenymodellezes \
	teljesitmenymodellezes-mobile \
	modellek-fejlesztese \
	modellek-fejlesztese-mobile \
	modellek-ellenorzese \
	modellek-ellenorzese-mobile \
	felderito-adatelemzes \
	felderito-adatelemzes-mobile \
	benchmarking \
	benchmarking-mobile \
	kodgeneralas \
	kodgeneralas-mobile

build:
	@$(foreach DOCUMENT, $(DOCUMENTS),\
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
