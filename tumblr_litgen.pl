#!usr/bin/perl

use strict;
use warnings;
use BibTeX::Parser;

open (my $IF, "<", "bibtex_test_utf8.txt") or die "Could not open input $!\n";
open (my $OF, ">", "tumblr_out.txt") or die "Could not open output $!\n";

# to do here - learn BibTeX::Parser to get the goods out of the bibtex
# file; also figure out if unicode or utf8 is the way to go.

my $parser = BibTeX::Parser->new($IF);

while (my $entry = $parser->next) {
	if ($entry->parse_ok) {
		my $type    = $entry->type;
		my $title   = $entry->field("title");
		my $journal = $entry->field("journal");
		my $doi     = $entry->field("doi");
		my $volume  = $entry->field("volume");
		my $number  = $entry->field("number");
		my @authors = $entry->author;
		
		print "\n";
		print $type . "\n";
		print $title . "\n";
		print $journal . ", " . $volume . "(" . $number . ")\n";
		# need check for missing values for volume and number
		# as well as pages if you implement that
		print "http://dx.doi.org/" . $doi . "\n";
		foreach my $author (@authors) {
			print $author->first . " " . $author->last . ", ";
			# put in a thing to check if it's the last item, to remove comma
		}
		print "\n";
	} else {
		warn "Error parsing file: " . $entry->error;
	}

}

# Generating the HTML in the manner below
# appears to work fine. (2015-05-05)
my $placeholder = "placeholder";

print $OF "<p>Check out some recently published articles by folks at Columbia University:</p>\n";
print $OF "[[MORE]]\n";
print $OF "<ul>\n";
print $OF "<li>\n";
print $OF "Authors, A.\n";
print $OF "<br/>\n";
print $OF "<a href=\"dx.doi.org/$placeholder\" ";
print $OF "target=\"_new\">\n";
print $OF "Title.\n";
print $OF "</a>\n";
print $OF "<br/>\n";
print $OF "Journal, Volume, Pages.\n";
print $OF "</li>\n";
print $OF "<li>\n";
print $OF "Authors, A.\n";
print $OF "<br/>\n";
print $OF "<a href=\"dx.doi.org/\" ";
print $OF "target=\"_new\">\n";
print $OF "Title.\n";
print $OF "</a>\n";
print $OF "<br/>\n";
print $OF "Journal, Volume, Pages.\n";
print $OF "</li>\n";
print $OF "<li>\n";
print $OF "Authors, A.\n";
print $OF "<br/>\n";
print $OF "<a href=\"dx.doi.org/\" ";
print $OF "target=\"_new\">\n";
print $OF "Title.\n";
print $OF "</a>\n";
print $OF "<br/>\n";
print $OF "Journal, Volume, Pages.\n";
print $OF "</li>\n";
print $OF "<li>\n";
print $OF "Authors, A.\n";
print $OF "<br/>\n";
print $OF "<a href=\"dx.doi.org/\" ";
print $OF "target=\"_new\">\n";
print $OF "Title.\n";
print $OF "</a>\n";
print $OF "<br/>\n";
print $OF "Journal, Volume, Pages.\n";
print $OF "</li>\n";
print $OF "<li>\n";
print $OF "Authors, A.\n";
print $OF "<br/>\n";
print $OF "<a href=\"dx.doi.org/\" ";
print $OF "target=\"_new\">\n";
print $OF "Title.\n";
print $OF "</a>\n";
print $OF "<br/>\n";
print $OF "Journal, Volume, Pages.\n";
print $OF "</li>\n";
print $OF "</ul>\n";
