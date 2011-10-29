package Pegex::Puppet::Data;
use Pegex::Mo;
extends 'Pegex::Receiver';

use boolean;

sub got_resource_name { @{pop()}; }
sub got_resource_term { @{pop()}; }
sub got_set_of_resource_terms { @{pop()}; }
sub got_resource_definition { my ($name, $data) = @{pop()}; return ([$name, {@$data}]) }
sub got_true { &boolean::true }
sub got_false { &boolean::false }

1;

