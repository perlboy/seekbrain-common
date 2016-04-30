use 5.006;
use strict;
use warnings;
use inc::Module::Install;

name     'Seekbrain-Common';
all_from 'lib/Seekbrain/Common.pm';
author   q{Stuart Low <stuart.low@me.com>};
license  'artistic2';

perl_version 5.006;

tests_recursive('t');

resources (
   #homepage   => 'http://yourwebsitehere.com',
   #IRC        => 'irc://irc.perl.org/#Seekbrain-Common',
   license    => 'http://www.perlfoundation.org/artistic_license_2_0',
   #repository => 'git://github.com/Stuart Low/Seekbrain-Common.git',
   #repository => 'https://bitbucket.org/Stuart Low/Seekbrain-Common',
   bugtracker => 'http://rt.cpan.org/NoAuth/Bugs.html?Dist=Seekbrain-Common',
);

configure_requires (
   'Module::Install' => 0,
);

build_requires (
   'Test::More' => 0,
);

requires (
   #'ABC'              => 1.6,
   #'Foo::Bar::Module' => 5.0401,
);

install_as_cpan;
auto_install;
WriteAll;
