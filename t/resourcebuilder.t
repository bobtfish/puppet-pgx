use strict;
use warnings;
use Test::More;

use Pegex::Puppet;
my $parser = Pegex::Puppet->new(receiver => 'Pegex::Puppet::ResourceBuilder');
my $tree = $parser->parse(q{file {
    "/tmp/foo":
        content => "foo";
}
});
ok $tree;
use Data::Dumper;
warn Dumper $tree;
is ref($tree), 'ARRAY';
is scalar(@$tree), 1;
my $resource = $tree->[0];
isa_ok $resource, 'Pegex::Puppet::Resource::File';
is $resource->ensure, 'exists';
is $resource->name, '/tmp/foo';
is $resource->content, 'foo';

done_testing;

