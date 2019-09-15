#!/usr/bin/perl
#
# Original Author: Daniel R.
#

use strict;
use warnings;

my $message = 'HET SFRIT ICA QSTUDHERAEAR DGILIBUN NI 1947 SWA
CEDTOLA TA 2430 E ERTSET, WN NI NOTWHAGSNI, CD.';

# fix message formatting
$message =~ s/\n/ /g;

# small dictionary to use
my @dictionary = ('THE','FIRST','CIA','HEADQUARTERS','BUILDING','IN','WAS','LOCATED','AT','STREET','NW','WASHINGTON','DC');
my %data;

# create hash table
foreach my $string (@dictionary) {
    my $key = length($string);
    if (exists($data{$key})) {
        push (@{$data{$key}}, $string);
    } else {
        $data{$key}[0] = $string;
    }
}

# split message into words
my @messages = split / /, $message;

# match words
foreach my $string (@messages) {
    # save size of string
    my $length = length($string);
    # set to false
    my $finished = 0;
    my $modified = 0;

    # check if string contains punctuations
    foreach my $char (split //, $string) {
        if ($char eq "," || $char eq ".") {
            # adjust length
            $length -= 1;
            # set to true
            $modified = 1;
        }
    }
    # number
    if ($string =~ /^[0-9]+$/) {
        print "$string";
    }

    # single letter
    elsif($length == 1) {
        print "$string";
    }

    else {
        # save punctuations
        my $punct = "";

        # find words in the dictionary with the same length
        foreach my $entry (@{$data{$length}}) {
            my $i = 0;
            # check every character
            foreach my $char (split //, $string) {
                # find commas
                if ($char eq ",") {
                    $punct = $char;
                    $i += 1;
                }
                # find periods
                elsif ($char eq ".") {
                    $punct = $char;
                    # set to true
                    $finished = 1;
                    $i += 1;

                }
                # whole words
                elsif (index($entry, $char) != -1) {
                    $i += 1;
                }

                # loop needs to run one more time
                # to show punctuations.
                if ($modified) {
                    if ($i == $length+1) {
                        print "$entry";
                        print "$punct";
                        last;
                    }
                }
                # no punctutations exist
                else {
                    if ($i == $length) {
                        print "$entry";
                        last;
                    }
                }
            }
        }
    }

    if (!$finished) {
        print " ";
    }
}
