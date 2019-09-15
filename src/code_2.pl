#!/usr/bin/perl
#
# Original Author: Daniel R.
#


use strict;
use warnings;

my $message = 'WIGSAEPTNENECVRZNALTL   QIDXBOKJNTJORUVSFALON   PYIRTS
GFCAIOYUNNDSHLIWEDNKEQURCBEMHD   ROTFTHSIE   APFETAOPTHLHVJEXER
CJOAIF   XCMGKOEMDFZEPGRBAN   GHAFIMWEERURDKINYCCCALHN
ZOIQUNAVTORETLLUNLEWISKGIBEAGNSPCITE
TAGBRAYMTVWHQIEPFRGWIPVNBZG.';

# fix formatting
$message =~ s/   |\n/ /g;

# find and print
foreach my $line (split / /, $message) {
    # getting every third character.
    for (my $i = 2; $i <= length($line); $i += 3) {
        my $nth = substr($line, $i, 1);
        print "$nth";
    }
    # print if period exists.
    if (index($line, '.') != -1) {
        print ".";
    } else {
        print " ";
    }
}
