#!/usr/bin/perl
use strict;
use warnings;
use XML::LibXML;
use Data::Dumper;

sub isIncluded{
	#print "herec";
	my($start) = @_;
	for my $binderChild($start->childNodes()){
		#print $binderChild->nodeName;
		if($binderChild->nodeName eq 'MetaData'){
			#print "heree";
			for my $metadataChild($binderChild->childNodes()){
				#print "hered";
				if($metadataChild->nodeName eq 'IncludeInCompile'){
					#print "yep";
					return 1;
				}
			}
		}
	}
	
	return 0;
	#return 1;
}

my $doc = XML::LibXML->load_xml(string => join("\n", <STDIN>));

#Get all BinderItems
my @nodelist = $doc->getElementsByTagName("BinderItem");
if(scalar @nodelist == 0){
	die("No BinderItems in .scrivx");
}

for my $item(@nodelist){
	if(isIncluded($item)){
		print $item->getAttribute('ID') . ",";
	}
}