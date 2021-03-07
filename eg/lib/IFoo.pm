package IFoo;
use strict;
use warnings;

use Boundary;
use Types::Standard -types;

requires qw(hello world);

method add => [Int, Int] => Int;

1;
