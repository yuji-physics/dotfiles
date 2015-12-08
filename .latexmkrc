#!/usr/bin/perl
$latex = 'platex -kanji=utf-8 -synctex=1 %S';
$dvipdf = 'dvipdfmx %S';
$bibtex = 'pbibtex';
$pdf_mode = 3;
$pdf_update_method = 2;
$pdf_previewer = 'open %0 %S';
$max_repeat = 5;
$pvc_view_file_via_temporary = 0;

