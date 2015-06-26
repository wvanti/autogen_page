#!usr/bin/perl

use strict;
use warnings;
no warnings 'uninitialized';
use BibTeX::Parser;

open (my $IF, "<", "/media/001B-9622/b0010.bib") or die "Could not open input $!\n";
open (my $TF, ">", "/media/001B-9622/b0010out.txt") or die "Nope $!";

my $parser = BibTeX::Parser->new($IF);

# change this to the number of articles exported (usually 5)
my $numArticles = 5;

print $TF "<p>Check out some recently published articles by folks at 
Columbia University:</p>\n";
print $TF "[[MORE]]\n";

my $counter = 0;
my @title;
my @journal;
my @doi;
my @volume;
my @number;
my @pages;
my @year;
my @authorList;

while (my $entry = $parser->next) {
	if ($entry->parse_ok) {
		my $type    = $entry->type;
		$title[$counter]   = $entry->field("title");
		# next two lines are to remove the leading and trailing {} from
		# title in extracted BibTeX (known error)
		$title[$counter]   = substr ($title[$counter], 1);
		chop ($title[$counter]); 
		$journal[$counter] = $entry->field("journal");
		$doi[$counter]     = $entry->field("doi");
		$volume[$counter]  = $entry->field("volume");
		$number[$counter]  = "(";
		$number[$counter] .= $entry->field("number");
		$number[$counter] .= ")";
		$year[$counter]    = $entry->field("year");
		$pages[$counter]   = $entry->field("pages");
		my @authors = $entry->author;
		foreach my $authTemp (@authors) {
			$authorList[$counter] .= $authTemp->last;
			$authorList[$counter] .= ", ";
			$authorList[$counter] .= $authTemp->first;
			$authorList[$counter] .= ", ";
			# difficulty dealing with commas at this point, so instead,
			# I'll just add a final comma and chop it afterwards
		}
		$counter++;
		# print "\n";
	} else {
		warn "Error parsing file: " . $entry->error;
	}
}

$counter = 0;
while ($counter < $numArticles){
	print $TF "<ul>\n";
	print $TF "<li>\n";
	chop ($authorList[$counter]);     # this is to eliminate trailing space
	chop ($authorList[$counter]);	    # this is to eliminate trailing comma
	print $TF $authorList[$counter];
	print $TF " ($year[$counter])\n";
	print $TF "<br/>\n";
	print $TF "<a href=\"dx.doi.org/$doi[$counter]\" ";
	print $TF "target=\"_new\">\n";
	print $TF "$title[$counter]\n";
	print $TF "</a>\n";
	print $TF "<br/>\n";
	print $TF $journal[$counter] . " " . $volume[$counter] . 
			$number[$counter] . " " . $pages[$counter] . "\n";
	print $TF "</li>\n";
	$counter++;
}
print $TF "</ul>";
