package Seekbrain::Common::CommandLine;

use Getopt::Long;
use Data::Dumper;

=head1 SYNOPSIS

This is a wrapper around command line arguments

	use Seekbrain::Common;
	my $commonModule = new Seekbrain::Common({ commandLine => \@ARGV });

=cut

my %arguments;

=head2 new

Constructor method

=cut
sub new {
	my $c = shift;
	my $inputCommandLine = shift;
	my @inputArguments = @_;
	GetOptions(\%arguments, @inputArguments);
	
	# Return blessed object
	return bless {}, $c;
}

=head2 get

Get config variable

=cut
sub get {
	my $c = shift;
	my $inputGet = shift;
	
	return $arguments{$inputGet};
}

=head2 dump

Dump variables

=cut
sub dump {
	my $c = shift;
	return Dumper(\%arguments);
}


1;