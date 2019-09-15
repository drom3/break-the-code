#!/usr/bin/perl
#
# Original Author: Daniel R.
#


use strict;
use warnings;

my $message = '4   18  15      13  19  11      19  3       22  25  13  11  4   15  14
19  24      22  11  24  17  22  15  9,      6   11.  ';

# fix formatting
$message =~ s/     |\n/!/g;
$message =~ s/\s+/ /g;
$message =~ s/! |!/  /g;
$message =~ s/,/ ,/g;
$message =~ s/\./ . /g;

my @numbers = (1..26);
my @rotated = ("Q".."Z","A".."P");

# create hash table
my %cipher;
@cipher{@numbers} = @rotated;
@cipher{'.'} = '.';
$cipher{' '} = ' ';
@cipher{','} = ',';

# match and print
foreach my $line (split /  /, $message) {
    my @code = split / /, $line;
    my $space;
    for my $char (@code) {
        $space = $char;
        print "$cipher{$char}";
    }
    if ($space ne '.') {
       print " ";
   }
}
