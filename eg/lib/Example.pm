package Example;
use lib 'eg/lib';
use strict;
use warnings;

use Sub::WrapInType::Attribute;
use Boundary::Impl qw(IExample);
use Types::Standard -types;

sub hello { ... }
sub world { ... }

sub add :WrapMethod([Int,Int] => Int) {
    my ($class, $a, $b) = @_;
    return $a + $b;
}

1;
