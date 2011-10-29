use strict;
use warnings;
use Test::More;

use Pegex::Puppet::ResourceRegistery;
my $rr = Pegex::Puppet::ResourceRegistery->new;
ok $rr;
ok $rr->has_resourcetype_named('file');
isa_ok $rr->get_resourcetype_named('file'), 'Pegex::Puppet::ResourceType::File';

done_testing;

