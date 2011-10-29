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

$doc = q{file {
    "/tmp/foo":
        ensure => exists
}
};

$data = Pegex::Puppet->parse($doc);
is_deeply($data, [['file', '/tmp/foo', [ensure => 'exists']]]);

done_testing;

