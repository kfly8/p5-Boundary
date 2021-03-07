package Foo;
use strict;
use warnings;

use Boundary::Impl;
use Types::Standard -types;
use Sub::WrapInType;

sub hello { ... }
sub world { ... }

sub add;
*add = wrap_method [Int,Int] => Str, sub { };

impl qw(IFoo);
1;
