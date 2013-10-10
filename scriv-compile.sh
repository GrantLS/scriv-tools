#!/bin/bash
#expect $1 to be working directory and $2 to be file name (w/out .scriv)
./scriv-get-xml.pl "$1/$2.scriv" | ./scriv-get-for-compile.pl | \
./scriv-get-rtf-for-conversion.pl "$1/$2.scriv" > "$1/$2.tex"

/usr/texbin/pdflatex -interaction=batchmode "$1/$2.tex"
/usr/texbin/pdflatex -interaction=batchmode "$1/$2.tex"
/usr/texbin/bibtex "$1/$2.tex"
/usr/texbin/bibtex "$1/$2.tex"
/usr/texbin/pdflatex -interaction=batchmode "$1/$2.tex"
open "$1/$2.pdf"

