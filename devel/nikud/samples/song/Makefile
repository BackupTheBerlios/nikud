all: song.ps

song.ps: song.dvi
	dvips song.dvi -o song.ps


song.dvi: song.tex
	elatex song.tex

song.tex: song.utex
	iconv -f utf8 -t cp1255 song.utex -o song.tex

song.pdf: song.ps
	ps2pdf song.ps

clean:
	rm -f song.tex
	rm -f song.dvi
	rm -f song.pdf
	rm -f song.ps
	rm -f *.aux *.log
	rm -f *~
