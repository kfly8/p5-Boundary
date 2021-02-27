package FooService;
use strict;
use warnings;

use Boundary::Types -types;
use Foo;

my $type = ImplOf['IFoo'];
my $foo = Foo->new;
warn $type->check($foo);

1;
