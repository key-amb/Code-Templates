package Foo::Bar;

use strict;
use warnings;
use 5.010_001;
use utf8;

use version; our $VERSION = 'v0.1.0';

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

IKEDA Kiyoshi E<lt>progrhyme@gmail.comE<gt>

=head1 LICENSE

Copyright (C) 2020 IKEDA Kiyoshi.

This library is free software; you can redistribute it and/or modify it under
the same terms as Perl itself.  That means either (a) the GNU General Public
License or (b) the Artistic License.

=cut

