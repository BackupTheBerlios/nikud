all: hebrew_test.ps

hebrew_test.ps: hebrew_test.dvi
	dvips hebrew_test.dvi -o hebrew_test.ps

hebrefs.bib: hebrefs.ubib
	iconv -f utf8 -t cp1255 hebrefs.ubib -o hebrefs.bib

hebrew_test.dvi: hebrew_test.tex engrefs.bib hebrefs.bib
	rm -f *.auc *.bbl
	elatex hebrew_test.tex
	bibtex eng
	bibtex heb
	elatex hebrew_test.tex
	elatex hebrew_test.tex

hebrew_test.tex: hebrew_test.utex
	iconv -f utf8 -t cp1255 hebrew_test.utex -o hebrew_test.tex

hebrew_test.pdf: hebrew_test.ps
	ps2pdf hebrew_test.ps

clean:
	rm -f hebrew_test.tex
	rm -f hebrew_test.dvi
	rm -f hebrew_test.pdf
	rm -f hebrew_test.ps
	rm -f *.aux *.bbl *.cot *.toc *.log *.blg *~
	rm -f hebrefs.bib
