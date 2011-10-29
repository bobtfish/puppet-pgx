package Pegex::Puppet::Data;
use Pegex::Mo;
extends 'Pegex::Receiver';

sub got_resource_name { @{pop()}; }
sub got_resource_term { @{pop()}; }
sub got_set_of_resource_terms { @{pop()}; }
sub got_resource_definition { my ($name, $data) = @{pop()}; return ([$name, {@$data}]) }

1;

