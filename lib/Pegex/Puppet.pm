package Pegex::Puppet;

use 5.010;

use Pegex 0.18 ();
use boolean 0.28 ();
use Moose;
use Moose::Util::TypeConstraints;
use MooseX::Types::LoadableClass qw/LoadableClass/;

extends 'Pegex::Module';

class_type 'Pegex::Puppet::Data';
has receiver => (
    isa => 'Pegex::Puppet::Data',
    is => 'ro',
    isa => LoadableClass,
    coerce => 1,
    default => 'Pegex::Puppet::Data',
);

__PACKAGE__->meta->make_immutable(replace_constructor => 1);
1;

