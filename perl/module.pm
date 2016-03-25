package Foo::Bar;

use strict;
use warnings;
use 5.010_001;
use utf8;

use Class::Accessor::Lite (
    new => 0,
    ro  => [qw(name age title)],
);

use Smart::Args;
use Log::Minimal env_debug => 'MS_DEBUG';

use version; our $VERSION = 'v0.1.0';

sub new {
    args(
        my $class,
        my $name  => +{ isa => 'Str' },
        my $age   => +{ isa => 'Int' },
        my $title => +{ isa => 'Str', default => 'NO TITLE' },
    );

    my $self = bless +{
        name  => $name,
        age   => $age,
        title => $title,
    }, $class;

    return $self;
}

sub describe {
    args(
        my $self,
        my $verbose => { isa => 'Bool', optional => 1 },
    );

    my $desc = $self->_make_basic_description;

    if ($verbose) {
        $desc .= sprintf " / %s", $self->title;
    }

    return $desc;
}

sub _make_basic_description {
    args(
        my $self,
    );

    return sprintf "%s (%d)", $self->name, $self->age;
}

1;

__END__

=encoding utf8

=head1 NAME

B<Foo::Bar> - abstract

=head1 SYNOPSIS

    use Foo::Bar;
    my $p = Foo::Bar->new(name => 'Bob', age => 37);
    print $p->describe, "\n";

=head1 DESCRIPTION

This module is ...

=head1 METHODS

=over 4

=item B<describe>([verbose => 'Bool'])

fixme

=item B<method_name>($message:Str)

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

