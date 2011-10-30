package Pegex::Puppet::Resource::File;
use Moose;
use MooseX::StrictConstructor;

with 'Pegex::Puppet::Resource';

has content => (
    is => 'ro',
    required => 1,
);

has ensure => (
    is => 'ro',
    default => 'exists',
);

__PACKAGE__->meta->make_immutable;
1;

