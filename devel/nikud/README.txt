packages needed
===============
tetex, afm, tetex-latex, dvips, iconv, perl


Installation 
============ 
1. If you want to work localy (recomended), make sure you have a local
texmf tree: edit "/usr/share/texmf/web2c/texmf.cnf" (you may use
'kpsewhich texmf.cnf' to find its location), and add $HOMETEXMF to
the search path (in Mandrake 9.1 and 9.2 this is default, but in 9.0 you have
to make the change).

2. Edit the Makefile and set the variables as you like (you realy
   don't have to change anything).

3. make
   make install

4. Manual settings: become root, and edit the file
   /usr/share/texmf/dvips/config/config.ps:
   Add the line: p +culmus.map
   (if you don't know where it is, try the command:
    'kpsewhich --format="dvips config" config.ps')


Usage
=====
You have to use the installed package 'culmus.sty', after \documentclass...
like this:

\usepackage{culmus} 

(Please see the sample files)


Samples
=======
Samples are in local texmf/samples directory (see the Makefile
there). 
The source is utf-8 encoded. Use emacs-bidi as an editor.

