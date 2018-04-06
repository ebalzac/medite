#!/usr/bin/perl -w

use strict;

my $dirF = '../F';
my $dirFC = '../FC';
my $comp_dir = 'Comparaisons_texte/textes';

my @filesF = `ls $dirF/*xml`;
my @filesFC = `ls $dirFC/*xml`;

foreach my $file (@filesF) {

	chop $file;

	my $txtfile = $file;
	$txtfile =~ s/\.xml$/.txt/;
	$txtfile =~ s/\.\.\/F/$comp_dir/;

	my $cmd = "xsltproc XML_vers_TXT_de_comparaison.xsl $file > $txtfile";
	`$cmd`;
}

foreach my $file (@filesFC) {

	chop $file;

	my $txtfile = $file;
	$txtfile =~ s/\.xml$/.txt/;
	$txtfile =~ s/\.\.\/FC/$comp_dir/;

	my $cmd = "xsltproc XML_vers_TXT_de_comparaison.xsl $file > $txtfile";
	`$cmd`;
}
