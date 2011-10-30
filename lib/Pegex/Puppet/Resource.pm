package Pegex::Puppet::Resource;
use Moose::Role;
use MooseX::Types::Moose qw/ Str /;

has name => (
    isa => Str,
    is => 'ro',
    required => 1,
);

1;

