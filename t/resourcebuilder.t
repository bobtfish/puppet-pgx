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

done_testing;

