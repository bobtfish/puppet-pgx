use strict;
use warnings;
use Test::More 0.88;

use Pegex::Puppet;

my $data = Pegex::Puppet->parse(q{file {
}});
#    file { } });
#
#        "/tmp/foo":
#            ensure => exists,
#            content => "bar";
#    }
#});
ok $data;
use Data::Dumper;
warn Dumper($data);

done_testing;

