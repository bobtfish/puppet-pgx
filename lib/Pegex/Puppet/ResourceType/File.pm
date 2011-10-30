package Pegex::Puppet::ResourceType::File;
use Moose;
use MooseX::StrictConstructor;
use Pegex::Puppet::Resource::File;

with 'Pegex::Puppet::ResourceType';

sub name { 'file' }

sub implementation_class { 'Pegex::Puppet::Resource::File' }

__PACKAGE__->meta->make_immutable;
1;

