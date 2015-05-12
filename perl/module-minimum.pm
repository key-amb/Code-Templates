package Foo::Bar;

use strict;
use warnings;
use 5.010_000;
use utf8;

our $VERSION = '0.01';

sub new {
    my $class = shift;
    return bless +{}, $class;
}

sub foo {
    my $self = shift;
}

1;

__END__

=encoding utf8

=head1 NAME

B<Foo::Bar> - abstract

=head1 SYNOPSIS

    use Foo::Bar;
    my $bar = Foo::Bar->new;

=head1 DESCRIPTION

This module is ...

=head1 METHODS

=over 4

=item B<foo>

fixme

=back

=head1 SEE ALSO

L<Foo::Baz|Foo::Baz>,
ls(1), cd(1)

=head1 AUTHORS

YASUTAKE Kiyoshi E<lt>yasutake.kiyoshi@gmail.comE<gt>

=head1 LICENSE

Copyright (C) 2015 YASUTAKE Kiyoshi.

This library is free software; you can redistribute it and/or modify it under
the same terms as Perl itself.  That means either (a) the GNU General Public
License or (b) the Artistic License.

=cut

# for Emacsen
# Local Variables:
# mode: cperl
# cperl-indent-level: 4
# cperl-close-paren-offset: -4
# cperl-indent-parens-as-block: t
# indent-tabs-mode: nil
# coding: utf-8
# End:

# vi: set ts=4 sw=4 sts=0 et ft=perl fenc=utf-8 ff=unix :
