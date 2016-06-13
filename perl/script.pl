#!/usr/bin/env perl

use strict;
use warnings;
use 5.010_001;
use utf8;

use Getopt::Long qw(:config posix_default no_ignore_case no_ignore_case_always);
use Pod::Usage;

use Data::Validator;
use Log::Minimal env_debug => 'FOO_DEBUG';

my $Debug = 0;

if (__FILE__ eq $0) {
    main()
} else {
    return 1;
}

sub main {
    my %arg;
    GetOptions(
        \%arg,
        'string|s=s',
        'number|n=i',
        'debug|d+' => \$Debug,
        'help|h|?' => sub { pod2usage(-verbose=>1) },
    ) or pod2usage();

    $ENV{FOO_DEBUG} = 1 if $Debug;

    my $opt_rule = Data::Validator->new(
        string => +{ isa => 'Str', default => 'foo' },
        number => +{ isa => 'Int', default => 1 },
    )->with('NoThrow');
    my $opt = $opt_rule->validate(%arg);
    if ($opt_rule->has_errors) {
        pod2usage(join("\n", map {$_->{message}} @{$opt_rule->clear_errors}));
    }
    debugf("opt: %s", ddf($opt));
}

__END__

=encoding utf8

=head1 NAME

B<program_name> - abstract

=head1 SYNOPSIS

B<program_name>
[B<-s> | B<--string> string]
[B<-n> | B<--number> number]
[B<-d> | B<--debug>]

B<program_name> B<-h> | B<--help> | B<-?>

=head1 DESCRIPTION

This script is ...

=head1 OPTIONS

=over 4

=item B<-s> Str, B<--string> Str

=item B<-n> Int, B<--number> Int

=item B<-d>, B<--debug>

Increases debug level.
Put "-d -d" for more verbosity.

=back

=head1 SEE ALSO

L<Foo::Bar>,
L<Title|http://example.com/>,
ls(1), cd(1)

=head1 AUTHORS

IKEDA Kiyoshi E<lt>yasutake.kiyoshi@gmail.comE<gt>

=head1 LICENSE

Copyright (C) 2015 IKEDA Kiyoshi.

This library is free software; you can redistribute it and/or modify it under
the same terms as Perl itself.  That means either (a) the GNU General Public
License or (b) the Artistic License.

=cut

