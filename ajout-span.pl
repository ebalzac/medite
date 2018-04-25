#!/usr/bin/perl -w

use strict;

my $dir = 'Medite-XML';
my $comp_dir = 'Medite-XML/span';

my @files = `ls $dir/*xml`;

foreach my $file (@files) {

	chop $file;

	my $txtfile = $file;
	$txtfile =~ s/\.xml$/-span.xml/;
	$txtfile =~ s/$dir/$comp_dir/;

	my $cmd = "xsltproc xml2xml_ajout_span.xsl $file > $txtfile";
	`$cmd`;
}


