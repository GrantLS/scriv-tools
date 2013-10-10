#!/usr/bin/perl
use strict;
use warnings;
use Data::Dumper;
#use RTF::TEXT::Converter;

my @rtfFileNames = split(',', <STDIN>);
#$ARGV[0] =~ m#.*/(.*.scriv)$#;

my @txt = ();

for(@rtfFileNames){
	#It's possible that some sections contain child documents but not their own content.
	#In that case, we need to check to make sure there are RTF files for them.
	if(-e "$ARGV[0]/Files/Docs/$_.rtf"){
		my $currfile = "\"$ARGV[0]/Files/Docs/$_.rtf\"";
		my $text = `textutil -convert txt -stdout $currfile`;	
		push(@txt, $text);
	}
}

foreach(@txt){
	print $_;
}
