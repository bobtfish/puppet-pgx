use strict;
use warnings;
use Test::More 0.88;

use Pegex::Puppet;

my $doc = q{file {
    foo:
        foo => bar
}
};

my $data = Pegex::Puppet->parse($doc);
ok $data;
use Data::Dumper;
warn Dumper($data);

is_deeply($data, [['file', 'foo', [foo => 'bar']]]);

done_testing;

