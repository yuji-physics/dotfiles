#!/usr/bin/perl
# You may have to reboot the computer if you changed some parameters
# Preview pdf should be turned off, and use auto update function of Skim.app.
$latex = 'platex %O %S';
$bibtex = 'pbibtex %O %B';
$dvipdf = 'dvipdfmx %O %S';
# 0: not create pdf, 1: pdflatex, 2:ps -> ps2pdf, 3: dvi-> dvipdf
$pdf_mode = 3;
#$pdf_update_method = 4;
#$pdf_update_command = "open -ga /Applications/Skim.app %S; sleep 0.1; open /Applications/iTerm.app";
$pvc_view_file_via_temporary = 0;
#$pdf_previewer = 'open -ga /Applications/Skim.app';
#$pdf_previewer = 'open -a Preview';
$max_repeat = 20;

