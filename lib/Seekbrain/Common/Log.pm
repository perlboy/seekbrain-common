package Seekbrain::Common::Log;

use 5.006;
use strict;
use warnings;
use Carp;
use Log::Log4perl;
use Log::Log4perl::Level;


=head1 SYNOPSIS

This is a wrapper around log4perl

	use Seekbrain::Common;
	my $common = Seekbrain::Common->new((config => '/path/to/config.json'));
	$common->log->info("Log an informational message");

=cut

my $logger;

=head1 SUBROUTINES/METHODS

=head2 new

Constructor method, accepts a log4perl configuration

=cut
sub new {
	my $c = shift;
	
	Log::Log4perl->easy_init(Log::Log4perl::Level::to_priority( 'DEBUG' ));
	
	# Setup logger
	$logger = Log::Log4perl->get_logger($0);
	
	# Return blessed object
	return bless {}, $c;
}

=head2 info

Info wrapper

=cut
sub info {
	my $self = shift;
	my $inputMessage = shift;
	$logger->info($inputMessage);
}

=head2 debug

Debug wrapper

=cut
sub debug {
	my $self = shift;
	my $inputMessage = shift;
	$logger->debug($inputMessage);
}

=head2 warn

Warning wrapper

=cut
sub warn {
	my $self = shift;
	my $inputMessage = shift;
	$logger->warn($inputMessage);
}

=head2 error

Error wrapper

=cut
sub error {
	my $self = shift;
	my $inputMessage = shift;
	$logger->error($inputMessage);
}

=head2 fatal

Fatal wrapper

=cut
sub fatal {
	my $self = shift;
	my $inputMessage = shift;
	$logger->fatal($inputMessage);
}

# Return true
1;