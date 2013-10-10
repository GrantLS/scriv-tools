#!/usr/bin/perl

use strict;
use warnings;

#print $ARGV[0];
#die();

$ARGV[0] =~ m#.*/(.*.scriv)$#;

open(my $fh, "<", "$ARGV[0]/$1x")
    or die "Cannot open .scrivx $ARGV[0]/$1x file $!";

while(<$fh>){
	print $_;
}
