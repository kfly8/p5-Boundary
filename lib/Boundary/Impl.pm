package Boundary::Impl;
use strict;
use warnings;

use Boundary ();

sub import {
    my $class = shift;
    my $target = scalar caller;

    my $impl = Boundary->gen_apply_interfaces_to_package($target);
    {
        no strict 'refs';
        *{"${target}::impl"} = $impl;
    }

    return;
}

1;
