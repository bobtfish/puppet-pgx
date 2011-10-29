use strict;
use warnings;
use Test::More 0.88;
use Test::Differences;

use Pegex::Puppet;

my @data = (
[q{file {
    foo:
        foo => bar
}
} => [['file', [[['foo'], [[[foo => 'bar']]]]]]]],
[q{file {
    "/tmp/foo":
        ensure => exists
}
} => [['file', [[['/tmp/foo'], [[[ensure => 'exists']]]]]]]],
[q{file {
    "/tmp/foo":
        content => "foo"
}
} => [['file', [[['/tmp/foo'], [[[content => 'foo']]]]]]]],
[q{file::mine {
    "/tmp/foo":
        content => "foo"
}
} => [['file::mine', [[['/tmp/foo'], [[[content => 'foo']]]]]]]],
[q{file::mine {
    "/tmp/foo":
        content => "foo",
        ensure => exists;
}
} => [['file::mine', [[['/tmp/foo'], [[[content => 'foo']], [[ensure => 'exists']]]]]]]],
[q{file::mine {
    "/tmp/foo":
        content => "foo",
        ensure => exists;
    "/tmp/blaaa":
        content => "blaa",
        ensure => exists;
}
} => [['file::mine', [[['/tmp/foo'], [[[content => 'foo']], [[ensure => 'exists']]]], [['/tmp/blaaa'], [[[content => 'blaa']], [[ensure => 'exists']]]]]]]],
[q{fnord {
    foo:
        foo => bar
}

file::mine {
    "/tmp/foo":
        content => "foo",
        ensure => exists;
    "/tmp/blaaa":
        content => "blaa",
        ensure => exists;
}
} => [
['fnord', [[['foo'], [[['foo' => 'bar']]]]]],
['file::mine', [[['/tmp/foo'], [[[content => 'foo']], [[ensure => 'exists']]]], [['/tmp/blaaa'], [[[content => 'blaa']], [[ensure => 'exists']]]]]]]],


);

foreach my $thing (@data) {
    my ($doc, $exp) = @$thing;

    my $data = Pegex::Puppet->parse($doc);

    eq_or_diff($data, $exp);
}

done_testing;

