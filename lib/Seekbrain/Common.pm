package Seekbrain::Common;

use 5.006;
use strict;
use warnings;

use Seekbrain::Common::Log;
use Seekbrain::Common::CommandLine;
use JSON::MaybeXS qw(decode_json);

=head1 NAME

Seekbrain::Common - The great new Seekbrain::Common!

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';
my $logger;
my $config;
my $commandLine;

=head1 SYNOPSIS

Quick summary of what the module does.

Perhaps a little code snippet.

    use Seekbrain::Common;

    my $foo = Seekbrain::Common->new();
    ...

=head1 EXPORT

A list of functions that can be exported.  You can delete this section
if you don't export anything, such as for a purely object-oriented module.

=head1 SUBROUTINES/METHODS

=head2 new

Constructor method, accepts a baseline yaml config

=cut
sub new {
	my $c = shift;
	my $inputParams = shift;
	
	###
	# Process command line
	###
	if($inputParams->{commandLine}) {
		my @commandLineArguments = ('c|config=s');
		if($inputParams->{commandLineAdditions}) {
			push(@commandLineArguments, $inputParams->{commandLineAdditions});
		}
		
		$commandLine = new Seekbrain::Common::CommandLine($inputParams->{commandLine}, @commandLineArguments);
	} else {
		$commandLine = new Seekbrain::Common::CommandLine("-c etc/config.json", ('c|config=s'));
	}
	
	###
	# Load config
	###
	local $/; #Enable 'slurp' mode
	open(my $configData, "<", $commandLine->get('c')) || die "Unable to open input config file of: " . $commandLine->get('c');
	my $rawJson = <$configData>;
	close($rawJson);
	
	$config = decode_json($rawJson);

	# Return blessed object
	return bless {}, $c;
}

=head2 log

Log utility wrapper
=cut
sub log {
	my $self = shift;
	if(!$logger) {
		$logger = new Seekbrain::Common::Log($self->config->{'logger'}->{'config'}, $self->config->{'logger'}->{'service'});
	}
	
	return $logger;
}

=head2 cmd

Command Line

=cut
sub cmd {
	my $self = shift;
	return $commandLine;
}

=head2 config

Config Wrapper

=cut

sub config {
	my $self = shift;
	return $config;
}

=head1 AUTHOR

Stuart Low, C<< <stuart.low at me.com> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-seekbrain-common at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Seekbrain-Common>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.




=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Seekbrain::Common


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker (report bugs here)

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Seekbrain-Common>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Seekbrain-Common>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Seekbrain-Common>

=item * Search CPAN

L<http://search.cpan.org/dist/Seekbrain-Common/>

=back


=head1 ACKNOWLEDGEMENTS


=head1 LICENSE AND COPYRIGHT

Copyright 2016 Stuart Low.

This program is free software; you can redistribute it and/or modify it
under the terms of the the Artistic License (2.0). You may obtain a
copy of the full license at:

L<http://www.perlfoundation.org/artistic_license_2_0>

Any use, modification, and distribution of the Standard or Modified
Versions is governed by this Artistic License. By using, modifying or
distributing the Package, you accept this license. Do not use, modify,
or distribute the Package, if you do not accept this license.

If your Modified Version has been derived from a Modified Version made
by someone other than you, you are nevertheless required to ensure that
your Modified Version complies with the requirements of this license.

This license does not grant you the right to use any trademark, service
mark, tradename, or logo of the Copyright Holder.

This license includes the non-exclusive, worldwide, free-of-charge
patent license to make, have made, use, offer to sell, sell, import and
otherwise transfer the Package with respect to any patent claims
licensable by the Copyright Holder that are necessarily infringed by the
Package. If you institute patent litigation (including a cross-claim or
counterclaim) against any party alleging that the Package constitutes
direct or contributory patent infringement, then this Artistic License
to you shall terminate on the date that such litigation is filed.

Disclaimer of Warranty: THE PACKAGE IS PROVIDED BY THE COPYRIGHT HOLDER
AND CONTRIBUTORS "AS IS' AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES.
THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
PURPOSE, OR NON-INFRINGEMENT ARE DISCLAIMED TO THE EXTENT PERMITTED BY
YOUR LOCAL LAW. UNLESS REQUIRED BY LAW, NO COPYRIGHT HOLDER OR
CONTRIBUTOR WILL BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, OR
CONSEQUENTIAL DAMAGES ARISING IN ANY WAY OUT OF THE USE OF THE PACKAGE,
EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


=cut

1; # End of Seekbrain::Common
