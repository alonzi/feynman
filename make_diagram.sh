#!/usr/bin/env bash
# -rw-r--r--@ 1 lpa2a  staff   101B Dec  4 19:06 to-draw.tex
# -rwx------  1 lpa2a  staff   142B Dec  4 19:30 make_diagram.sh
# -rw-r--r--  1 lpa2a  staff   469B Dec  4 19:32 diagram.tex

# usage: ./make_diagram.sh test.tex

if [ $1 ]
then
    str="\def\todraw{$1} \input{diagram.tex}"
    echo $str
else
    str="diagram.tex"
    echo $str
fi

if [ 1 -eq 1 ]
then
    latex $str
    mpost x.mp
    latex $str
    dvips -o diagram-pics.ps diagram
    ps2pdf diagram-pics.ps
    pdflatex $str
    pdfcrop diagram.pdf
fi