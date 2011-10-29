use inc::Module::Install 1.00;
use strict;
use warnings;

all_from 'lib/Pegex/Puppet.pm';

requires 'boolean';
requires 'Pegex' => '0.18';

test_requires 'Test::More' => '0.88';
test_requires 'Test::Differences' => '0';

WriteAll;

