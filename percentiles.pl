#!/usr/bin/env perl

use strict;
use warnings;
use Scalar::Util qw(looks_like_number);

my @sorted = sort {$a <=> $b} grep {looks_like_number($_)} <STDIN>;
my $total = scalar @sorted;

foreach my $percentile (qw(50 90 95 99 99.9 99.99)) {
  my $index = int($total * $percentile / 100);
  my $value = $sorted[$index];
  printf "%5.2f%% : %d\n", $percentile, $value;
}
