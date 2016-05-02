#!/usr/bin/env perl
use 5.006;
use strict;
use warnings;
use Test::More;

plan tests => 1;

BEGIN {
    use_ok( 'Seekbrain::Common' ) || print "Bail out!\n";
}

diag( "Testing Seekbrain::Common $Seekbrain::Common::VERSION, Perl $], $^X" );
