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

my @tests = (q{file {
    "/tmp/foo":
        content => "foo";
    "/tmp/bar":
        content => "bar";
}
}, q{file {
    "/tmp/foo":
        content => "foo";
}
file {
    "/tmp/bar":
        content => "bar";
}
});
foreach my $test (@tests) {
    $tree = $parser->parse($test);
    ok $tree;
    is ref($tree), 'ARRAY';
    is scalar(@$tree), 2;
    my $resource = $tree->[0];
    isa_ok $resource, 'Pegex::Puppet::Resource::File';
    is $resource->ensure, 'exists';
    is $resource->name, '/tmp/foo';
    is $resource->content, 'foo';
    my $resource = $tree->[1];
    isa_ok $resource, 'Pegex::Puppet::Resource::File';
    is $resource->ensure, 'exists';
    is $resource->name, '/tmp/bar';
    is $resource->content, 'bar';
}

done_testing;

