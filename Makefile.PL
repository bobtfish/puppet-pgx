use inc::Module::Install 1.00;
use strict;
use warnings;

all_from 'lib/Pegex/Puppet.pm';

requires 'boolean';
requires 'Pegex' => '0.18';
WriteAll;

