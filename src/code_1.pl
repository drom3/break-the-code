#!/usr/bin/perl
#
# Original Author: Daniel R.
#

use strict;
use warnings;

my $message = 'G   S   V       X   V   M   G   I   Z   O
R   M   G   V   O   O   R   T   V   M   X   V       Z   T   V   M   X   B
D   Z   H       X   I   V   Z   G   V   W       R   M
+   =   $   &       D   S   V   M
K   I   V   H   R   W   V   M   G       G   I   F   N   Z   M
H   R   T   M   V   W       G   S   V
M   Z   G   R   L   M   Z   O       H   V   X   F   I   R   G   B       Z   X   G.';

# fix formatting
$message =~ s/   //g;
$message =~ s/\n/ /g;

my @alphabet = ("A".."Z");
my @reversed = reverse("A".."Z");
my @numbers = (1..10);
my @special = split //, '+@#$%^&*=~';

# make hash table
my %cipher;
@cipher{@alphabet} = @reversed;
@cipher{@special} = @numbers;

# add special characters
@cipher{'.'} = '.';
$cipher{' '} = ' ';

# match
foreach my $char (split //, $message)
{
    print "$cipher{$char}";
}
