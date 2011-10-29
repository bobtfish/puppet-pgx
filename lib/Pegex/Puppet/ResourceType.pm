package Pegex::Puppet::ResourceType;
use Moose::Role;
use MooseX::Types::Moose qw/ HashRef /;

requires 'name';

has data => (
    is => 'ro',
    isa => HashRef,
    default => sub { { } },
);

1;

