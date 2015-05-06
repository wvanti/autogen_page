#!usr/bin/perl

use strict;
use warnings;
use BibTeX::Parser;

open (my $IF, "<", "bibtex_test_utf8.txt") or die "Could not open input $!\n";
open (my $OF, ">", "tumblr_out.txt") or die "Could not open output $!\n";

# to do here - learn BibTeX::Parser to get the goods out of the bibtex
# file; also figure out if unicode or utf8 is the way to go.



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