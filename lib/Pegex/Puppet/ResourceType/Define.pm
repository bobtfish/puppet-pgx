package Pegex::Puppet::ResourceType::Define;
use Moose;

with 'Pegex::Puppet::ResourceType';

sub name { 'define' }

sub implementation_class { 'Pegex::Puppet::Resource::Define' }

__PACKAGE__->meta->make_immutable;
1;

