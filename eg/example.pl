use lib 'eg/lib';
use strict;
use warnings;

use Boundary::Types -types;
use Example;

my $type = ImplOf['IFoo'];
my $foo = Foo->new;
$type->check($foo);
