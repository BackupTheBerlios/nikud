all: poem.ps

poem.ps: poem.dvi
	dvips poem.dvi -o poem.ps


poem.dvi: poem.tex
	elatex poem.tex

poem.tex: poem.utex
	iconv -f utf8 -t cp1255 poem.utex -o poem.tex

poem.pdf: poem.ps
	ps2pdf poem.ps

clean:
	rm -f poem.tex
	rm -f poem.dvi
	rm -f poem.pdf
	rm -f poem.ps
	rm -f *.aux *.log
	rm -f *~
