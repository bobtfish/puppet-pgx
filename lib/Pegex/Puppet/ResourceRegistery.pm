package Pegex::Puppet::ResourceRegistery;
use Moose;
use Moose::Util::TypeConstraints;
use MooseX::Types::Moose qw/ HashRef /;
use namespace::autoclean;

role_type 'Pegex::Puppet::ResourceType';
use Pegex::Puppet::ResourceType::File;

has resource_types => (
    isa => HashRef['Pegex::Puppet::ResourceType'],
    traits => ['Hash'],
    handles => {
        has_resourcetype_named => 'exists',
        get_resourcetype_named => 'get',
    },
    builder => '_build_resources_by_name',
);

sub _build_resources_by_name {
    {
        file => Pegex::Puppet::ResourceType::File->new(),
    }
}

1;

