all: test.ps

test.ps: test.dvi
	dvips test.dvi -o test.ps


test.dvi: test.tex
	elatex test.tex

test.tex: test.utex
	iconv -f utf8 -t cp1255 test.utex -o test.tex

test.pdf: test.ps
	ps2pdf test.ps

clean:
	rm -f test.tex
	rm -f test.dvi
	rm -f test.pdf
	rm -f test.ps
	rm -f *.aux *.log
	rm -f *~
