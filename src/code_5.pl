#!/usr/bin/perl
#
# Original Author: Daniel R.
#

use strict;
use warnings;

my %alphabet = (
    "A" => ".-",
    "B" => "-...",
    "C" => "-.-.",
    "D" => "-..",
    "E" => ".",
    "F" => "..-.",
    "G" => "--.",
    "H" => "....",
    "I" => "..",
    "J" => ".---",
    "K" => "-.-",
    "L" => ".-..",
    "M" => "--",
    "N" => "-.",
    "O" => "---",
    "P" => ".--.",
    "Q" => " --.-",
    "R" => ".-.",
    "S" => "...",
    "T" => "-",
    "U" => "..-",
    "V" => "...-",
    "W" => ".--",
    "X" => "-..-",
    "Y" => "-.--",
    "Z" => "--..",
    "," => "--..--",
    "." => ".-.-.-",
    "&" => "&", # ?
    " " => " "
);

my %morse = reverse %alphabet;

# adjusted formatting
my $secret = "- .... .  ..-. --- ..- .-.
-.. .. .-. . -.-. - --- .-. .- - . ...
--- ..-.  - .... .  -.-. .. .-  .- .-. .
- .... .  -. -.-. ... --..--  -.. .. --..--
-.. ... --..--  .- -. -..  -.. ... & - .-.-.-";

$secret =~ s/\n/  /g;

my @message = split / /, $secret;

foreach my $code (@message) {
    if ($code eq '') {
        print " ";
    }

    else {
        print "$morse{$code}";
    }
}
