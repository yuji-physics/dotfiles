#!/usr/bin/perl
$latex = 'platex %O %S';
$bibtex = 'pbibtex %O %B';
$dvipdf = 'dvipdfmx %O %S';
# 0: not create pdf, 1: pdflatex, 2:ps -> ps2pdf, 3: dvi-> dvipdf
$pdf_mode = 3;
#$pdf_update_method = 2;
$pdf_previewer = 'open';
$max_repeat = 5;
#$pvc_view_file_via_temporary = 0;

