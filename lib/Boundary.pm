package Boundary;
use strict;
use warnings;

use namespace::allclean ();
use Class::Load qw(try_load_class);

our $VERSION = "0.01";

our %INFO;

sub import {
    my $class = shift;
    my $target = scalar caller;

    my $requires = $class->gen_requires($target);
    {
        no strict 'refs';
        *{"${target}::requires"} = $requires;
    }

    namespace::allclean->import(
        -cleanee => $target,
    );
 
    return;
}


our $CROAK_MESSAGE_SUFFIX;
sub croak {
  require Carp;
  no warnings 'redefine';
  push @_ => $CROAK_MESSAGE_SUFFIX;
  *croak = \&Carp::croak;
  goto &Carp::croak;
}

sub gen_requires {
    my ($class, $target) = @_;
    sub {
        my @methods = @_;
        push @{$INFO{$target}{requires}||=[]} => @methods;
        return;
    }
}

sub check_requires {
    my ($class, $impl, $interface) = @_;
    my @requires = @{$INFO{$interface}{requires}};
    return if !@requires;

    if (my @requires_fail = grep { !$impl->can($_) } @requires) {
        croak "Can't apply ${interface} to ${impl} - missing ". join(', ', @requires_fail);
    }
}

sub apply_interfaces_to_package {
    my ($class, $impl, @interfaces) = @_;
    croak "No interfaces supplied!" unless @interfaces;

    for my $interface (@interfaces) {
        my ($ok, $e) = try_load_class($interface);
        croak("cannot load interface package: $e") if !$ok;

        $class->check_requires($impl, $interface);
    }
}

1;
__END__

=encoding utf-8

=head1 NAME

Boundary - It's new $module

=head1 SYNOPSIS

    use Boundary;

=head1 DESCRIPTION

Boundary is ...

=head1 LICENSE

Copyright (C) kfly8.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

kfly8 E<lt>kfly8@cpan.orgE<gt>

=cut

