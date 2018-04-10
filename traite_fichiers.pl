#!/usr/bin/perl -w

use strict;

my $dirF = '../F';
my $dirFC = '../FC';

my @filesF = `ls $dirF/*xml`;
my @filesFC = `ls $dirFC/*xml`;

foreach my $file (@filesF) {

	chop $file;

	my $txtfile = $file;
	$txtfile =~ s/\.xml$/.txt/;
	$txtfile =~ s/\.\.\/F/Medite-txt/;

	my $cmd = "xsltproc xml2txtMedite_structure.xsl $file > $txtfile";
	`$cmd`;
}

foreach my $file (@filesFC) {

	chop $file;

	my $txtfile = $file;
	$txtfile =~ s/\.xml$/.txt/;
	$txtfile =~ s/\.\.\/FC/Medite-txt/;

	my $cmd = "xsltproc xml2txtMedite_structure.xsl $file > $txtfile";
	`$cmd`;
}
