package Boundary::Impl;
use strict;
use warnings;

use Boundary ();
use B::Hooks::EndOfScope;

sub import {
    my ($class, @interfaces) = @_;
    my ($target, $filename, $line) = caller;

    my $impl = Boundary->gen_apply_interfaces_to_package($target, $filename, $line);
    on_scope_end {
        local $Boundary::CROAK_MESSAGE_SUFFIX = " at $filename line $line\n\t";
        $impl->(@interfaces);
    };
    return;
}

1;
