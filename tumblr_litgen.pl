#!usr/bin/perl

use strict;
use warnings;
use BibTeX::Parser;

open (my $IF, "<", "bibtex_test_utf8.txt") or die "Could not open input $!\n";
open (my $OF, ">", "tumblr_out2.txt") or die "Could not open output $!\n";
open (my $TF, ">", "testfile.txt") or die "Nope $!";

my $parser = BibTeX::Parser->new($IF);

createBeginning();	# starts the file, stops just before needing authors

my $counter = 0;
my @title;
my @journal;
my @doi;
my @volume;
my @number;
my @authorList;

while (my $entry = $parser->next) {
	if ($entry->parse_ok) {
		my $type    = $entry->type;
		# remember to remove extraneous {} from title
		$title[$counter]   = $entry->field("title");
		$journal[$counter] = $entry->field("journal");
		$doi[$counter]     = $entry->field("doi");
		$volume[$counter]  = $entry->field("volume");
		$number[$counter]  = $entry->field("number");
		my @authors = $entry->author;
		foreach my $authTemp (@authors) {
			$authorList[$counter] .= $authTemp->last;
			$authorList[$counter] .= ", ";
			$authorList[$counter] .= $authTemp->first;
			# if $authTemp is the last element, skip next line
			# or put a period instead
			$authorList[$counter] .= ", ";
		}
		$counter++;
		# print $type . "\n";
		# print $title . "\n";
		# print $journal . ", " . $volume . "(" . $number . ")\n";
		# need check for missing values for volume and number
		# as well as pages if you implement that
		# print "http://dx.doi.org/" . $doi . "\n";
		# foreach my $author (@authors) {
			# print $author->first . " " . $author->last . ", ";
			# put in a thing to check if it's the last item, to remove comma
		# }
		print "\n";
	} else {
		warn "Error parsing file: " . $entry->error;
	}

}

$counter = 0;
while ($counter < 4){
	print $TF $title[$counter] . "\n";
	print $TF $authorList[$counter] . "\n";
	print $TF $journal[$counter] . "\n\n";
	$counter++;
}


# Generating the HTML in the manner below
# appears to work fine. (2015-05-05)
my $placeholder = "placeholder";

sub createBeginning {
	print $OF "<p>Check out some recently published articles by folks at Columbia University:</p>\n";
	print $OF "[[MORE]]\n";
	print $OF "<ul>\n";
	print $OF "<li>\n";
}

#print $OF "<p>Check out some recently published articles by folks at Columbia University:</p>\n";
#print $OF "[[MORE]]\n";
#print $OF "<ul>\n";
#print $OF "<li>\n";
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
