package Pegex::Puppet::ResourceType::File;
use Moose;

with 'Pegex::Puppet::ResourceType';

sub name { 'file' }

__PACKAGE__->meta->make_immutable;
1;

